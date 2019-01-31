open Asm

(*
external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"
*)
external getfloat : float -> int32 = "getfloat"

(* let ic = Printf.open_in "mylib.s"*)

let stackset = ref S.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)
let save x =
	stackset := S.add x !stackset;
	if not (List.mem x !stackmap) then
		stackmap := !stackmap @ [x]
let savef x =
	stackset := S.add x !stackset;
	if not (List.mem x !stackmap) then
		(let pad =
			if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
		stackmap := !stackmap @ pad @ [x; x])
let locate x =
	let rec loc = function
		| [] -> []
		| y :: zs when x = y -> 0 :: List.map succ (loc zs)
		| y :: zs -> List.map succ (loc zs) in
	loc !stackmap
let offset x = 4 * List.hd (locate x)
let stacksize () = align ((List.length !stackmap + 1) * 4) (* もしstackmap + 1の4倍が8の倍数ならばそれを返す、8の倍数でなければ4を足して返す *)

let reg r = (* レジスタを表すための衣("%"記号)を取る作業 *)
	if is_reg r (* レジスタかどうか *)
	then String.sub r 1 (String.length r - 1)
	else r

let load_label r label =
	let r' = reg r in
	Printf.sprintf
		"\tlis\t%s, ha16(%s)\n\taddi\t%s, %s, lo16(%s)\n"
		r' label r' r' label

(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
	(* remove identical moves *)
	let _, xys = List.partition (fun (x, y) -> x = y) xys in
	(* find acyclic moves *)
	match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
	| [], [] -> []
	| (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
		(y, sw) :: (x, y) :: shuffle sw (List.map
											(function
											 | (y', z) when y = y' -> (sw, z)
											 | yz -> yz)
										 xys)
	| xys, acyc -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
let rec g oc = function (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
	| dest, Ans(exp) -> g' oc (dest, exp)
	| dest, Let((x, t, _), exp, e) ->
			g' oc (NonTail(x), exp);
			g oc (dest, e)
	| dest, WildCard -> raise FindWildCard
and g' oc = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
	(* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
	| NonTail(_), Nop -> ()
	| NonTail(x), Li(i) when -32768 <= i && i < 32768 
			-> Printf.fprintf oc "\tli\t%s, %d\n" (reg x) i
			(*
			-> Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg x) i
			*)
	| NonTail(x), Li(i) ->
			let n = i lsr 16 in
			let m = i lxor (n lsl 16) in
			let r = reg x in
			Printf.fprintf oc "\tlis\t%s, %d\n" r n;
			(*
			Printf.fprintf oc "\taddis\t%s, r0, %d\n" r n;
			*)
			Printf.fprintf oc "\tori\t%s, %s, %d\n" r r m
	| NonTail(x), FLi(Id.L(l)) ->
			let s = load_label (reg reg_tmp) l in (* reg_tmp は "%r31" のこと*)
			Printf.fprintf oc "%s\tlfd\t%s, 0(%s)\n" s (reg x) (reg reg_tmp)
	| NonTail(x), SetL(Id.L(y)) ->
			let s = load_label x y in
			Printf.fprintf oc "%s" s
	| NonTail(x), Mr(y) when x = y -> ()
	| NonTail(x), Mr(y) -> Printf.fprintf oc "\tmr\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), Neg(y) -> Printf.fprintf oc "\tneg\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), Add(y, V(z)) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Add(y, C(z)) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg x) (reg y) z
	| NonTail(x), Sub(y, V(z)) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Sub(y, C(z)) -> Printf.fprintf oc "\tsubi\t%s, %s, %d\n" (reg x) (reg y) z
	| NonTail(x), Mul(y, V(z)) -> Printf.fprintf oc "\tslw\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Mul(y, C(z)) -> Printf.fprintf oc "\tslwi\t%s, %s, %d\n" (reg x) (reg y) (z / 2)
	| NonTail(x), Div(y, V(z)) -> Printf.fprintf oc "\tsrw\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Div(y, C(z)) -> Printf.fprintf oc "\tsrwi\t%s, %s, %d\n" (reg x) (reg y) (z / 2)
	| NonTail(x), Slw(y, V(z)) -> Printf.fprintf oc "\tslw\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Slw(y, C(z)) -> Printf.fprintf oc "\tslwi\t%s, %s, %d\n" (reg x) (reg y) z
	| NonTail(x), Srw(y, V(z)) -> Printf.fprintf oc "\tsrw\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Srw(y, C(z)) -> Printf.fprintf oc "\tsrwi\t%s, %s, %d\n" (reg x) (reg y) z
	| NonTail(x), Lwz(y, V(z)) -> Printf.fprintf oc "\tlwzx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Lwz(y, C(z)) -> Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" (reg x) z (reg y)
	| NonTail(_), Stw(x, y, V(z)) -> Printf.fprintf oc "\tstwx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(_), Stw(x, y, C(z)) -> Printf.fprintf oc "\tstw\t%s, %d(%s)\n" (reg x) z (reg y)
	| NonTail(x), FMr(y) when x = y -> ()
	| NonTail(x), FMr(y) -> Printf.fprintf oc "\tfmr\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), FNeg(y) -> Printf.fprintf oc "\tfneg\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), FAdd(y, z) -> Printf.fprintf oc "\tfadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), FSub(y, z) -> Printf.fprintf oc "\tfsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), FMul(y, z) -> Printf.fprintf oc "\tfmul\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), FDiv(y, z) -> Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Floor(y) -> Printf.fprintf oc "\tfloor\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), Sqrt(y) -> Printf.fprintf oc "\tfsqrt\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), FtoI(y) -> Printf.fprintf oc "\tftoi\t%s, %s\n" (reg x) (reg y)
	| NonTail(x), ItoF(y) -> Printf.fprintf oc "\titof\t%s, %s\n" (reg x) (reg y)
	(*
	| NonTail(x), Read_I -> Printf.fprintf oc "\tread\t%s\n" (reg x)
	*)
	| NonTail(x), Read_I -> 
		Printf.fprintf oc "\tin\t%s\n\tslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tin\t%s\n\tslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tin\t%s\n\tslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tin\t%s\n" (reg x)
	(*
	| NonTail(x), Read_F -> Printf.fprintf oc "\tfread\t%s\n" (reg x)
	*)
	| NonTail(x), Read_F ->
		Printf.fprintf oc "\tfin\t%s\n\tfslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tfin\t%s\n\tfslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tfin\t%s\n\tfslwi\t%s, %s, 8\n" (reg x) (reg x) (reg x);
		Printf.fprintf oc "\tfin\t%s\n" (reg x)
	| NonTail(x), Lfd(y, V(z)) -> Printf.fprintf oc "\tlfdx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(x), Lfd(y, C(z)) -> Printf.fprintf oc "\tlfd\t%s, %d(%s)\n" (reg x) z (reg y)
	| NonTail(_), Stfd(x, y, V(z)) -> Printf.fprintf oc "\tstfdx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
	| NonTail(_), Stfd(x, y, C(z)) -> Printf.fprintf oc "\tstfd\t%s, %d(%s)\n" (reg x) z (reg y)
	| NonTail(_), Comment(s) -> Printf.fprintf oc "#\t%s\n" s
	(* 退避の仮想命令の実装 (caml2html: emit_save) *)
	| NonTail(_), Save(x, y) when List.mem x allregs && not (S.mem y !stackset) ->
			save y;
			Printf.fprintf oc "\tstw\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
	| NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
			savef y;
			Printf.fprintf oc "\tstfd\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
	| NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
	(* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
	| NonTail(x), Restore(y) when List.mem x allregs ->
			Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
	| NonTail(x), Restore(y) ->
			assert (List.mem x allfregs);
			Printf.fprintf oc "\tlfd\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
	(* 末尾だったら計算結果を第一レジスタにセットしてリターン (caml2html: emit_tailret) *)
	| Tail, (Nop | Stw _ | Stfd _ | Comment _ | Save _ as exp) ->
			g' oc (NonTail(Id.gentmp Type.Unit), exp);
			Printf.fprintf oc "\tblr\n";
	| Tail, (Li _ | SetL _ | Mr _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Slw _ | Srw _ | Lwz _ as exp) ->
			g' oc (NonTail(regs.(0)), exp);
			Printf.fprintf oc "\tblr\n";
	| Tail, (FLi _ | FMr _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ | Lfd _ as exp) ->
			g' oc (NonTail(fregs.(0)), exp);
			Printf.fprintf oc "\tblr\n";
	| Tail, (Restore(x) as exp) ->
			(match locate x with
			| [i] -> g' oc (NonTail(regs.(0)), exp)
			| [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp)
			| _ -> assert false);
			Printf.fprintf oc "\tblr\n";
	| Tail, IfEq(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_tail_if oc e1 e2 "beq" "bne"
	| Tail, IfEq(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_tail_if oc e1 e2 "beq" "bne"
	| Tail, IfLE(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_tail_if oc e1 e2 "ble" "bgt"
	| Tail, IfLE(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_tail_if oc e1 e2 "ble" "bgt"
	| Tail, IfGE(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_tail_if oc e1 e2 "bge" "blt"
	| Tail, IfGE(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_tail_if oc e1 e2 "bge" "blt"
	| Tail, IfFEq(x, y, e1, e2) ->
			Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);
			g'_tail_if oc e1 e2 "beq" "bne"
	| Tail, IfFLE(x, y, e1, e2) ->
			Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);
			g'_tail_if oc e1 e2 "ble" "bgt"
	| NonTail(z), IfEq(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne"
	| NonTail(z), IfEq(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne"
	| NonTail(z), IfLE(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt"
	| NonTail(z), IfLE(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt"
	| NonTail(z), IfGE(x, V(y), e1, e2) ->
			Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);
			g'_non_tail_if oc (NonTail(z)) e1 e2 "bge" "blt"
	| NonTail(z), IfGE(x, C(y), e1, e2) ->
			Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;
			g'_non_tail_if oc (NonTail(z)) e1 e2 "bge" "blt"
	| NonTail(z), IfFEq(x, y, e1, e2) ->
			Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);
			g'_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne"
	| NonTail(z), IfFLE(x, y, e1, e2) ->
			Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);
			g'_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt"
	(* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
	| Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
			g'_args oc [(x, reg_cl)] ys zs;
			Printf.fprintf oc "\tlwz\t%s, 0(%s)\n" (reg reg_sw) (reg reg_cl);
			Printf.fprintf oc "\tmtctr\t%s\n\tbctr\n" (reg reg_sw);
	| Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
			g'_args oc [] ys zs;
			Printf.fprintf oc "\tb\t%s\n" x
	| NonTail(a), CallCls(x, ys, zs) ->
			Printf.fprintf oc "\tmflr\t%s\n" (reg reg_tmp); (* reg_tmp は "%r31" のこと*)
			g'_args oc [(x, reg_cl)] ys zs;
			let ss = stacksize () in (* reg_sp は "%r3" のこと *)
			Printf.fprintf oc "\tstw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
			Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss; (* スタックポインタを更新 *)
			Printf.fprintf oc "\tlwz\t%s, 0(%s)\n" (reg reg_tmp) (reg reg_cl);
			Printf.fprintf oc "\tmtctr\t%s\n" (reg reg_tmp);
			Printf.fprintf oc "\tbctrl\n";
			Printf.fprintf oc "\tsubi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss;
			Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
			if List.mem a allregs && a <> regs.(0) then
				Printf.fprintf oc "\tmr\t%s, %s\n" (reg a) (reg regs.(0))
			else if List.mem a allfregs && a <> fregs.(0) then
				Printf.fprintf oc "\tfmr\t%s, %s\n" (reg a) (reg fregs.(0));
			Printf.fprintf oc "\tmtlr\t%s\n" (reg reg_tmp)
	| (NonTail(a), CallDir(Id.L(x), ys, zs)) ->
			Printf.fprintf oc "\tmflr\t%s\n" (reg reg_tmp);
			g'_args oc [] ys zs;
			let ss = stacksize () in
			Printf.fprintf oc "\tstw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
			Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss;
			Printf.fprintf oc "\tbl\t%s\n" x;
			Printf.fprintf oc "\tsubi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss;
			Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
			if List.mem a allregs && a <> regs.(0) then
				Printf.fprintf oc "\tmr\t%s, %s\n" (reg a) (reg regs.(0))
			else if List.mem a allfregs && a <> fregs.(0) then
				Printf.fprintf oc "\tfmr\t%s, %s\n" (reg a) (reg fregs.(0));
			Printf.fprintf oc "\tmtlr\t%s\n" (reg reg_tmp)
and g'_tail_if oc e1 e2 b bn =
	let b_else = Id.genid (b ^ "_else") in
	Printf.fprintf oc "\t%s\tcr7, %s\n" bn b_else;
	let stackset_back = !stackset in
	g oc (Tail, e1);
	Printf.fprintf oc "%s:\n" b_else;
	stackset := stackset_back;
	g oc (Tail, e2)
and g'_non_tail_if oc dest e1 e2 b bn =
	let b_else = Id.genid (b ^ "_else") in
	let b_cont = Id.genid (b ^ "_cont") in
	Printf.fprintf oc "\t%s\tcr7, %s\n" bn b_else;
	let stackset_back = !stackset in
	g oc (dest, e1);
	let stackset1 = !stackset in
	Printf.fprintf oc "\tb\t%s\n" b_cont;
	Printf.fprintf oc "%s:\n" b_else;
	stackset := stackset_back;
	g oc (dest, e2);
	Printf.fprintf oc "%s:\n" b_cont;
	let stackset2 = !stackset in
	stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs =
	let (i, yrs) =
		List.fold_left
			(fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
			(0, x_reg_cl)
			ys in
	List.iter
		(fun (y, r) -> Printf.fprintf oc "\tmr\t%s, %s\n" (reg r) (reg y))
		(shuffle reg_sw yrs);
	let (d, zfrs) =
		List.fold_left
			(fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
			(0, [])
			zs in
	List.iter
		(fun (z, fr) -> Printf.fprintf oc "\tfmr\t%s, %s\n" (reg fr) (reg z))
		(shuffle reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
	Printf.fprintf oc "%s:\n" x;
	stackset := S.empty;
	stackmap := [];
	g oc (Tail, e)

let f oc float_value_flag float_flag sca_flag array_flag read_flag print_flag (Prog(data, fundefs, e)) =
	Format.eprintf "generating assembly...@.";
	Printf.fprintf oc "\t.data\n";
	(* 外部配列の記述 *)
	Lib_extarr.print_arraddr oc;
	(* ライブラリのfloat valueの記述 *)
	(if float_value_flag = 1 then Lib_float_value.print_external_methods oc);
	(* プログラム内で定義されたfloat valueの記述 *)
	if data <> [] then
		(
		 List.iter
			 (fun (Id.L(x), d) ->
				 Printf.fprintf oc "%s:\n" x;
				 Printf.fprintf oc "\t%ld\n" (getfloat d))
			 data);
	(* 本処理の開始 *)
	Printf.fprintf oc "\t.globl _min_caml_start\n";
	Printf.fprintf oc "_min_caml_start:\n";
	stackset := S.empty;
	stackmap := [];
	Printf.fprintf oc "\taddi\tr4, r4, 50000\n";
	g oc (NonTail("_R_0"), e);
	Printf.fprintf oc "\tb\tmin_caml_fin\n";
	(* ライブラリ関数の記述 *)
	(if sca_flag = 1 then Lib_sc.print_external_methods oc);
	(if sca_flag = 1 then Lib_atan.print_external_methods oc);
	(if array_flag = 1 then Lib_create_array.print_external_methods oc);
	(if read_flag = 1 then Lib_read.print_external_methods oc);
	(if print_flag = 1 then Lib_print_int.print_external_methods oc);
	(if print_flag = 1 then Lib_print_char.print_external_methods oc);
	(* プログラム内で定義された関数の記述 *)
	List.iter (fun fundef -> h oc fundef) fundefs;
	(* 終了ラベル *)
	Printf.fprintf oc "min_caml_fin:"
