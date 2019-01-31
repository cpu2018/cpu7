open Asm

(* for register coalescing *)
(* [XXX] Callがあったら、そこから先は無意味というか逆効果なので追わない。
				 そのために「Callがあったかどうか」を返り値の第1要素に含める。 *)
(* Id.t -> (Id.t * Type.t) -> Asm.exp -> (bool * Id.t list) *)
let rec target' src (dest, t, id) = function
	| Mr(x) when x = src && is_reg dest ->
			assert (t <> Type.Unit);
			assert (t <> Type.Float);
			false, [dest]
	| FMr(x) when x = src && is_reg dest ->
			assert (t = Type.Float);
			false, [dest]
	| IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | IfGE(_, _, e1, e2)
	| IfFEq(_, _, e1, e2) | IfFLE(_, _, e1, e2) ->
			let c1, rs1 = target src (dest, t, gen_id ()) e1 in
			let c2, rs2 = target src (dest, t, gen_id ()) e2 in
			c1 && c2, rs1 @ rs2
	| CallCls(x, ys, zs) ->
			true, (target_args src regs 0 ys @ (*  *)
						 target_args src fregs 0 zs @
						 if x = src then [reg_cl] else [])
	| CallDir(_, ys, zs) ->
			true, (target_args src regs 0 ys @
						 target_args src fregs 0 zs)
	| _ -> false, []
(* Id.t -> (Id.t * Type.t * id) -> Asm.t -> (bool * Id.t list) *)
and target src (dest : Id.t * Type.t * id) = function (* register targeting (caml2html: regalloc_target) *)
	| Ans(exp) -> target' src dest exp
	| Let(xt, exp, e) ->
			let c1, rs1 = target' src xt exp in
			if c1 then true, rs1 else (* callがあったらその先は追わない(ラベルに飛んでしまうため) *)
			let c2, rs2 = target src dest e in (* callが無かったら、inの中身も調べる *)
			c2, rs1 @ rs2
	| WildCard -> raise FindWildCard
(* Id.t -> Id.t array -> Id.t list *)
and target_args src all n = function (* auxiliary function for Call *)
	| [] -> []
	| y :: ys when src = y -> all.(n) :: target_args src all (n + 1) ys (* 引数をレジスタ番号が小さい順に並べる *)
	| _ :: ys -> target_args src all (n + 1) ys

type alloc_result = (* allocにおいてspillingがあったかどうかを表すデータ型 *)
	| Alloc of Id.t (* allocated register *)
	| Spill of Id.t (* spilled variable *)

(* (Id.t * Type.t) -> Asm.t -> M.t -> Id.t-> Type.t *)
let rec alloc dest cont regenv x t =
	(* allocate a register or spill a variable *)
	assert (not (M.mem x regenv)); (* 新しく割り当てるので、まだレジスタ環境にその変数が存在しないことを確認する *)
	let all =
		match t with
		| Type.Unit -> ["%r0"] (* dummy *)
		| Type.Float -> allfregs
		| _ -> allregs in
	if all = ["%r0"] then Alloc("%r0") else (* [XX] ad hoc optimization *) (* unit型の場合 *)
	if is_reg x then Alloc(x) else (* 変数がレジスタだった場合 *)
	let free = fv cont in (* val free : Id.t list *)
	try
		let (c, prefer) = target x dest cont in
		let live = (* 生きているレジスタ *)
			List.fold_left
				(fun live y ->
					if is_reg y then S.add y live else
					try S.add (M.find y regenv) live
					with Not_found -> live)
				S.empty
				free in
		let r = (* そうでないレジスタを探す *)
			List.find
				(fun r -> not (S.mem r live))
				(prefer @ all) in
		(* Format.eprintf "allocated %s to %s@." x r; *)
		Alloc(r)
	with Not_found ->
		Format.eprintf "register allocation failed for %s@." x;
		let y = (* 型の合うレジスタ変数を探す *)
			List.find
				(fun y ->
					not (is_reg y) &&
					try List.mem (M.find y regenv) all
					with Not_found -> false)
				(List.rev free) in
		Format.eprintf "spilling %s from %s@." y (M.find y regenv);
		Spill(y)

(* auxiliary function for g and g'_and_restore : gとg'の補助関数 *)
let add x r regenv =
	if is_reg x then (assert (x = r); regenv) else
	M.add x r regenv

(* auxiliary functions for g' : g'の補助関数 *)
exception NoReg of Id.t * Type.t
(* Id.t -> Type.t -> M.t -> Id.t *)
let find x t regenv =
	if is_reg x then x else (* 名前がレジスタならば、そのまま名前を返す:その変数がレジスタに置かれているということ *)
	try M.find x regenv (* レジスタ名ではなく、変数名ならば、それがレジスタの環境にあるかどうか確かめる(レジスタに配置されているか確かめ、あるならばレジスタ名を返す) *)
	with Not_found -> raise (NoReg(x, t))
(* id_or_imm -> M.t -> id_or_imm *)
let find' x' regenv =
	match x' with
	| V(x) -> V(find x Type.Int regenv) (* 変数ならば、その変数がレジスタに配置されているかどうかを判定し、探しだして、型合わせのためにid_or_immでラップする *)
	| c -> c (* 定数ならば、即値として扱うため、そのまま返す *)

(* (Id.t * Type.t * id) -> Asm.t -> M.t -> Asm.t -> (Asm.t * M.t) *)
let rec g (dest : Id.t * Type.t * id) cont regenv = function (* 命令列のレジスタ割り当て (caml2html: regalloc_g) *)
	| Ans(exp) -> g'_and_restore dest cont regenv exp (* もし1命令の時 *)
	| Let((x, t, id) as xt, exp, e) ->
			assert (not (M.mem x regenv)); (* Letは新しく宣言するから、まだレジスタに割り当てられていないことが必要 *)
			let cont' = concat e dest cont in (* contの更新はここ！: destを名前として、すでにあるdestの名前のletのinの中の最も深いものの中に今回宣言されたLet式のinの内容を追加する *)
			let (e1', regenv1) = g'_and_restore xt cont' regenv exp in
			(match alloc dest cont' regenv1 x t with
			| Spill(y) ->
					let r = M.find y regenv1 in
					let (e2', regenv2) = g dest cont (add x r (M.remove y regenv1)) e in
					let save =
						try Save(M.find y regenv, y)
						with Not_found -> Nop in
					(seq(save, concat e1' (r, t, id) e2'), regenv2)
			| Alloc(r) ->
					let (e2', regenv2) = g dest cont (add x r regenv1) e in
					(concat e1' (r, t, id) e2', regenv2))
	| WildCard -> raise FindWildCard
(* (Id.t * Type.t) -> Asm.t -> M.t -> Asm.exp -> (Asm.t * M.t) *)
and g'_and_restore dest cont regenv exp = (* 使用される変数をスタックからレジスタへRestore (caml2html: regalloc_unspill) *)
	try g' dest cont regenv exp
	with NoReg(x, t) -> (* ここでのxはfindの内容からレジスタ名ではなく必ず変数名である *)
		((* Format.eprintf "restoring %s@." x; *)
		 g dest cont regenv (Let((x, t, gen_id ()), Restore(x), Ans(exp))))
(* (Id.t * Type.t) -> Asm.t -> M.t -> exp -> (Asm.t * M.t) *)
and g' dest cont regenv = function (* 各命令のレジスタ割り当て (caml2html: regalloc_gprime) *)
	| Nop | Li _ | SetL _ | Comment _ | Restore _ | FLi _ | Read_I | Read_F as exp -> (Ans(exp), regenv)
	| Mr(x) -> (Ans(Mr(find x Type.Int regenv)), regenv)
	| Neg(x) -> (Ans(Neg(find x Type.Int regenv)), regenv)
	| Add(x, y') -> (Ans(Add(find x Type.Int regenv, find' y' regenv)), regenv) (* Add(変数名, 変数名 or 定数) を Add(レジスタ名, レジスタ名 or 即値) に変換している *)
	| Sub(x, y') -> (Ans(Sub(find x Type.Int regenv, find' y' regenv)), regenv)
	| Mul(x, y') -> (Ans(Mul(find x Type.Int regenv, find' y' regenv)), regenv)
	| Div(x, y') -> (Ans(Div(find x Type.Int regenv, find' y' regenv)), regenv)
	| Slw(x, y') -> (Ans(Slw(find x Type.Int regenv, find' y' regenv)), regenv)
	| Srw(x, y') -> (Ans(Srw(find x Type.Int regenv, find' y' regenv)), regenv)
	| Lwz(x, y') -> (Ans(Lwz(find x Type.Int regenv, find' y' regenv)), regenv)
	| Stw(x, y, z') -> (Ans(Stw(find x Type.Int regenv, find y Type.Int regenv, find' z' regenv)), regenv)
	| FMr(x) -> (Ans(FMr(find x Type.Float regenv)), regenv)
	| FNeg(x) -> (Ans(FNeg(find x Type.Float regenv)), regenv)
	| FAdd(x, y) -> (Ans(FAdd(find x Type.Float regenv, find y Type.Float regenv)), regenv)
	| FSub(x, y) -> (Ans(FSub(find x Type.Float regenv, find y Type.Float regenv)), regenv)
	| FMul(x, y) -> (Ans(FMul(find x Type.Float regenv, find y Type.Float regenv)), regenv)
	| FDiv(x, y) -> (Ans(FDiv(find x Type.Float regenv, find y Type.Float regenv)), regenv)
	| Floor(x) -> (Ans(Floor(find x Type.Float regenv)), regenv)
	| Sqrt(x) -> (Ans(Sqrt(find x Type.Float regenv)), regenv)
	| FtoI(x) -> (Ans(FtoI(find x Type.Float regenv)), regenv)
	| ItoF(x) -> (Ans(ItoF(find x Type.Int regenv)), regenv)
	| Out(x) -> (Ans(Out(find x Type.Int regenv)), regenv)
	| Lfd(x, y') -> (Ans(Lfd(find x Type.Int regenv, find' y' regenv)), regenv)
	| Stfd(x, y, z') -> (Ans(Stfd(find x Type.Float regenv, find y Type.Int regenv, find' z' regenv)), regenv)
	| IfEq(x, y', e1, e2) as exp -> g'_if dest cont regenv exp (fun e1' e2' -> IfEq(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2 (* 比較部分はcmpwとcmpwiが考えられる *)
	| IfLE(x, y', e1, e2) as exp -> g'_if dest cont regenv exp (fun e1' e2' -> IfLE(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2
	| IfGE(x, y', e1, e2) as exp -> g'_if dest cont regenv exp (fun e1' e2' -> IfGE(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2
	| IfFEq(x, y, e1, e2) as exp -> g'_if dest cont regenv exp (fun e1' e2' -> IfFEq(find x Type.Float regenv, find y Type.Float regenv, e1', e2')) e1 e2
	| IfFLE(x, y, e1, e2) as exp -> g'_if dest cont regenv exp (fun e1' e2' -> IfFLE(find x Type.Float regenv, find y Type.Float regenv, e1', e2')) e1 e2
	| CallCls(x, ys, zs) as exp ->
			if List.length ys > Array.length regs - 2 || List.length zs > Array.length fregs - 1 then (* 引数の数が使えるレジスタの上限を超えてしまった場合、失敗 *)
				failwith (Format.sprintf "cannot allocate registers for arugments to %s" x)
			else
				g'_call dest cont regenv exp (fun ys zs -> CallCls(find x Type.Int regenv, ys, zs)) ys zs (* xはclosureのラベル *)
	| CallDir(Id.L(x), ys, zs) as exp ->
			if List.length ys > Array.length regs - 1 || List.length zs > Array.length fregs - 1 then (* 引数の数が使えるレジスタの上限を超えてしまった場合、失敗 *)
				failwith (Format.sprintf "cannot allocate registers for arugments to %s" x)
			else
				g'_call dest cont regenv exp (fun ys zs -> CallDir(Id.L(x), ys, zs)) ys zs
	| Save(x, y) -> assert false
(* (Id.t * Type.t) -> Asm.t -> M.t -> Asm.exp -> (Asm.t -> Asm.t -> Asm.exp) -> Asm.t -> Asm.t -> (Asm.t * M.t) *)
and g'_if dest cont regenv exp constr e1 e2 = (* ifのレジスタ割り当て (caml2html: regalloc_if) *)
	let (e1', regenv1) = g dest cont regenv e1 in (* それぞれの分岐のレジスタ割り当てをする再帰部分 *)
	let (e2', regenv2) = g dest cont regenv e2 in (* それぞれの分岐のレジスタ割り当てをする再帰部分 *)
	let regenv' = (* 両方に共通のレジスタ変数だけ利用 *)
		List.fold_left
			(fun regenv' x ->
				try
					if is_reg x then regenv' else (* 自由変数がレジスタに割り当てられている場合、そのままレジスタ環境を返す(追加しない) *)
					let r1 = M.find x regenv1 in
					let r2 = M.find x regenv2 in
					if r1 <> r2 then regenv' else (* 自由変数がそれぞれの分岐で異なるレジスタに割り当てられていたら、そのままレジスタ環境を返す(追加しない) *)
					M.add x r1 regenv' (* 両方に共通のレジスタ変数ならば、ひとまず新しく作ったレジスタ環境に追加 *)
				with Not_found -> regenv')
			M.empty (* ひとまず作った新しいレジスタ環境 *)
			(fv cont) in (* fv : Asm.t -> Id.t list , たぶん、自由変数を洗い出してるんだと思う *)
	(List.fold_left
		 (fun e x -> let first, _, _ = dest in
			 if x = first || not (M.mem x regenv) || M.mem x regenv' then e else
			 seq(Save(M.find x regenv, x), e)) (* そうでない(両方の分岐に出てこない)変数は分岐直前にセーブしておいて、後からもし使うなら適宜取り出す *)
		 (Ans(constr e1' e2'))
		 (fv cont), (* 今一度、こんどはすべての変数についてセーブするかどうかを決定する *)
	 regenv') (* regenv'はセーブを免れた変数 *)
(* (Id.t * Type.t) -> Asm.t -> M.t -> Asm.exp -> (Asm.t -> Asm.t -> Asm.exp) -> Id.t list -> Id.t list -> (Asm.t * M.t) *)
and g'_call dest cont regenv exp constr ys zs = (* 関数呼び出しのレジスタ割り当て (caml2html: regalloc_call) *)
	(List.fold_left
		 (fun e x -> let first, _, _ = dest in 
			 if x = first || not (M.mem x regenv) then e else
			 seq(Save(M.find x regenv, x), e)) (* レジスタ環境にある変数はセーブしなければならない *)
		 (Ans(constr
						(List.map (fun y -> find y Type.Int regenv) ys)
						(List.map (fun z -> find z Type.Float regenv) zs)))
		 (fv cont),
	 M.empty) (* ラベルに飛ぶので、飛んだ後のレジスタ環境は空 *)

let h { name = Id.L(x); args = ys; fargs = zs; body = e; ret = t } = (* 関数のレジスタ割り当て (caml2html: regalloc_h) *)
	let regenv = M.add x reg_cl M.empty in
	let (i, arg_regs, regenv) =
		List.fold_left
			(fun (i, arg_regs, regenv) y ->
				let r = regs.(i) in
				(i + 1,
				 arg_regs @ [r],
				 (assert (not (is_reg y));
					M.add y r regenv)))
			(0, [], regenv)
			ys in
	let (d, farg_regs, regenv) =
		List.fold_left
			(fun (d, farg_regs, regenv) z ->
				let fr = fregs.(d) in
				(d + 1,
				 farg_regs @ [fr],
				 (assert (not (is_reg z));
					M.add z fr regenv)))
			(0, [], regenv)
			zs in
	let a =
		match t with
		| Type.Unit -> Id.gentmp Type.Unit
		| Type.Float -> fregs.(0)
		| _ -> regs.(0) in
	let (e', regenv') = g (a, t, gen_id ()) (Ans(Mr(a))) regenv e in
	{ name = Id.L(x); args = arg_regs; fargs = farg_regs; body = e'; ret = t }

let f print_flag (Prog(data, fundefs, e)) = (* プログラム全体のレジスタ割り当て (caml2html: regalloc_f) *)
	Format.eprintf "register allocation: may take some time (up to a few minutes, depending on the size of functions)@.";
	let fundefs' = List.map h fundefs in
	let e', regenv' = g (Id.gentmp Type.Unit, Type.Unit, gen_id ()) (Ans(Nop)) M.empty e in (* M : Id.t to Id.t *)
	let prog = Prog(data, fundefs', e') in
	if print_flag = 1
	then
		(print_string "<dump after regAlloc>\n=================================================================================================\n";
    	print_prog 0 prog;
    	print_string "\n=================================================================================================\n\n";
		prog)
	else
		prog
