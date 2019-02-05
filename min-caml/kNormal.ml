(* give names to intermediate values (K-normalization) *)

type t = (* K��������μ� (caml2html: knormal_t) *)
	| Unit
	| Int of int
	| Float of float
	| Neg of Id.t
	| Add of Id.t * Id.t
	| Sub of Id.t * Id.t
	| Mul of Id.t * Id.t
	| Div of Id.t * Id.t
	| ShiftIL of Id.t * Id.t
	| ShiftIR of Id.t * Id.t
	| FNeg of Id.t
	| FAdd of Id.t * Id.t
	| FSub of Id.t * Id.t
	| FMul of Id.t * Id.t
	| FDiv of Id.t * Id.t
	| Floor of Id.t
	| Sqrt of Id.t
	| FtoI of Id.t
	| ItoF of Id.t
	| IfEq of Id.t * Id.t * t * t (* ��� + ʬ�� (caml2html: knormal_branch) *)
	| IfLE of Id.t * Id.t * t * t (* ��� + ʬ�� *)
	| Let of (Id.t * Type.t) * t * t
	| Var of Id.t
	| LetRec of fundef * t
	| App of Id.t * Id.t list
	| Tuple of Id.t list
	| LetTuple of (Id.t * Type.t) list * Id.t * t
	| Get of Id.t * Id.t
	| Put of Id.t * Id.t * Id.t
	| ExtArray of Id.t
	| ExtFunApp of Id.t * Id.t list
	| Read_I of Id.t
	| Read_F of Id.t
	| Out of Id.t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

let dummy_pos = {Syntax.ls = 0; Syntax.le = 0; Syntax.chs = 0; Syntax.che = 0}

(* KNormal.t -> S.t *)
(* ��ͳ�ѿ��ν�����ݻ����� *)
let rec fv = function (* ���˽и�����ʼ�ͳ�� ���ѿ� (free variant) (caml2html: knormal_fv) *)
	| Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
	| Neg(x) | FNeg(x) | Floor(x) | Sqrt(x) | FtoI(x) | ItoF(x) | Read_I(x) | Read_F(x) | Out(x) -> S.singleton x (* ���Ǥ�1�Ĥν������ *)
	| Add(x, y) | Sub(x, y) | Mul(x, y) | Div(x, y) | ShiftIL(x, y) | ShiftIR(x, y) | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
	| IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
	| Let((x, t), e1, e2) -> S.union (fv e1) (S.remove x (fv e2)) (* �½��� *)
	| Var(x) -> S.singleton x
	| LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
			let zs = S.diff (fv e1) (S.of_list (List.map fst yts)) in (* ������ *)
			S.diff (S.union zs (fv e2)) (S.singleton x)
	| App(x, ys) -> S.of_list (x :: ys)
	| Tuple(xs) | ExtFunApp(_, xs) -> S.of_list xs
	| Put(x, y, z) -> S.of_list [x; y; z]
	| LetTuple(xs, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xs)))

(* (KNormal.t * Type.t) -> (Id.t -> (KNormal.t * Type.t)) -> (KNormal.t * Type.t) *)
let insert_let (e, t) k = (* let��������������ؿ� (caml2html: knormal_insert) *)
	match e with
	| Int(i) -> 
		let name = Id.gentmp_int i in
		let e', t' = k name in
		Let ((name, t), e, e'), t' (* cse�Τ���ν��� *)
	| Var(x) -> k x
	| _ ->
		let x = Id.gentmp t in
		let e', t' = k x in
		Let ((x, t), e, e'), t'

(* M.t -> Syntax.t -> (KNormal.t * Type.t) *)
let rec g env = function (* K�������롼�������� (caml2html: knormal_g) *)
	| Syntax.Unit _ -> Unit, Type.Unit
	| Syntax.Bool(b, _) -> Int(if b then 1 else 0), Type.Int (* ������true, false������1, 0���Ѵ� (caml2html: knormal_bool) *)
	| Syntax.Int(i, _) -> Int(i), Type.Int
	| Syntax.Float(d, _) -> Float(d), Type.Float
	| Syntax.Not(e) -> g env (Syntax.If(e, Syntax.Bool(false, dummy_pos), Syntax.Bool(true, dummy_pos)))
	| Syntax.Neg(e) ->
			insert_let (g env e)
				(fun x -> Neg(x), Type.Int)
	| Syntax.AdHoc (e1, e2) ->
			let e, t = g env e1 in
			insert_let (e, t)
				(fun x -> insert_let (g env e2)
						(fun y -> 
							(match t with
							| Type.Int -> Add(x, y)
							| Type.Float -> FAdd(x, y)), 
							t))
	| Syntax.Add(e1, e2) -> (* ­������K������ (caml2html: knormal_add) *)
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> Add(x, y), Type.Int)) (* Add(���������줿e1, ���������줿e2) *)
	| Syntax.Sub(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> Sub(x, y), Type.Int))
	| Syntax.Mul(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> Mul(x, y), Type.Int))
	| Syntax.Div(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> Div(x, y), Type.Int))
	| Syntax.ShiftIL(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> ShiftIL(x, y), Type.Int))
	| Syntax.ShiftIR(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> ShiftIR(x, y), Type.Int))
	| Syntax.FNeg(e) ->
			insert_let (g env e)
				(fun x -> FNeg(x), Type.Float)
	| Syntax.FAdd(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> FAdd(x, y), Type.Float))
	| Syntax.FSub(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> FSub(x, y), Type.Float))
	| Syntax.FMul(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> FMul(x, y), Type.Float))
	| Syntax.FDiv(e1, e2) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> FDiv(x, y), Type.Float))
	| Syntax.Floor(e) ->
			insert_let (g env e)
				(fun x -> Floor(x), Type.Float)
	| Syntax.Sqrt(e) ->
			insert_let (g env e)
				(fun x -> Sqrt(x), Type.Float)
	| Syntax.FtoI(e) ->
			insert_let (g env e)
				(fun x -> FtoI(x), Type.Int)
	| Syntax.ItoF(e) ->
			insert_let (g env e)
				(fun x -> ItoF(x), Type.Float)
	| Syntax.Eq _ | Syntax.LE _ as cmp ->
			g env (Syntax.If(cmp, Syntax.Bool(true, dummy_pos), Syntax.Bool(false, dummy_pos)))
	| Syntax.If(Syntax.Not(e1), e2, e3) -> g env (Syntax.If(e1, e3, e2)) (* not�ˤ��ʬ�����Ѵ� (caml2html: knormal_not) *)
	| Syntax.If(Syntax.Eq(e1, e2), e3, e4) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y ->
							let e3', t3 = g env e3 in
							let e4', t4 = g env e4 in
							IfEq(x, y, e3', e4'), t3))
	| Syntax.If(Syntax.LE(e1, e2), e3, e4) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y ->
							let e3', t3 = g env e3 in
							let e4', t4 = g env e4 in
							IfLE(x, y, e3', e4'), t3))
	| Syntax.If(e1, e2, e3) -> g env (Syntax.If(Syntax.Eq(e1, Syntax.Bool(false, dummy_pos)), e3, e2)) (* ��ӤΤʤ�ʬ�����Ѵ� (caml2html: knormal_if) *)
	| Syntax.Let((x, t), e1, e2) ->
			let e1', t1 = g env e1 in
			(*match e1' with
			| Int(i) -> 
				let x_int = Id.gentmp_int i in
				let e2', t2 = g (M.add x_int t env) e2 in
				Let((x_int, t), e1', e2'), t2
			| _ -> *)(
				let e2', t2 = g (M.add x t env) e2 in
				Let((x, t), e1', e2'), t2)
	| Syntax.Var(x, _) when M.mem x env -> Var(x), M.find x env (* env �� x ��«��������� True, �ʤ���� False : «����ͭ�ä����˷��� env ����õ���Ƥ��� *)
	| Syntax.Var(x, _) -> (* ��������λ��� (caml2html: knormal_extarray) *)
			(match M.find x !Typing.extenv with
			| Type.Array(_) as t -> ExtArray x, t
			| Type.Tuple _ as t -> ExtArray x, t (* ����Ϥ�Ф� *)
			| t -> Type.print_code t; failwith (Printf.sprintf "external variable %s does not have an array type" x))
	| Syntax.LetRec({ Syntax.name = ((x, t), pos); Syntax.args = yts; Syntax.body = e1 }, e2) ->
			let env' = M.add x t env in
			let e2', t2 = g env' e2 in
			let e1', t1 = g (M.add_list yts env') e1 in
			LetRec({ name = (x, t); args = yts; body = e1' }, e2'), t2
	| Syntax.App(Syntax.Var(f, _), e2s) when not (M.mem f env) -> (* �����ؿ��θƤӽФ� (caml2html: knormal_extfunapp) *)
			(match M.find f !Typing.extenv with
			| Type.Fun(_, t) ->
					let rec bind xs = function (* "xs" are identifiers for the arguments *)
						| [] -> ExtFunApp(f, xs), t
						| e2 :: e2s ->
								insert_let (g env e2)
									(fun x -> bind (xs @ [x]) e2s) in
					bind [] e2s (* left-to-right evaluation *)
			| _ -> assert false)
	| Syntax.App(e1, e2s) ->
			(match g env e1 with
			| _, Type.Fun(_, t) as g_e1 ->
					insert_let g_e1
						(fun f ->
							let rec bind xs = function (* "xs" are identifiers for the arguments *)
								| [] -> App(f, xs), t
								| e2 :: e2s ->
										insert_let (g env e2)
											(fun x -> bind (xs @ [x]) e2s) in
							bind [] e2s) (* left-to-right evaluation *)
			| _ -> assert false)
	| Syntax.Tuple(es) ->
			let rec bind xs ts = function (* "xs" and "ts" are identifiers and types for the elements *)
				| [] -> Tuple(xs), Type.Tuple(ts)
				| e :: es ->
						let _, t as g_e = g env e in
						insert_let g_e
							(fun x -> bind (xs @ [x]) (ts @ [t]) es) in
			bind [] [] es
	| Syntax.LetTuple(xts, e1, e2) ->
			insert_let (g env e1)
				(fun y ->
					let e2', t2 = g (M.add_list xts env) e2 in
					LetTuple(xts, y, e2'), t2)
	| Syntax.Array(e1, e2) ->
			insert_let (g env e1)
				(fun x ->
					let _, t2 as g_e2 = g env e2 in
					insert_let g_e2
						(fun y ->
							let l =
								match t2 with
								| Type.Float -> "create_float_array"
								| _ -> "create_array" in
							ExtFunApp(l, [x; y]), Type.Array(t2)))
	| Syntax.Get(e1, e2) ->
			(match g env e1 with
			|				_, Type.Array(t) as g_e1 ->
					insert_let g_e1
						(fun x -> insert_let (g env e2)
								(fun y -> Get(x, y), t))
			| _ -> assert false)
	| Syntax.Put(e1, e2, e3) ->
			insert_let (g env e1)
				(fun x -> insert_let (g env e2)
						(fun y -> insert_let (g env e3)
								(fun z -> Put(x, y, z), Type.Unit)))
	| Syntax.Read_I(e) ->
			insert_let (g env e)
				(fun x -> Read_I(x), Type.Int)
	| Syntax.Read_F(e) ->
			insert_let (g env e)
				(fun x -> Read_F(x), Type.Float)
	| Syntax.Out(e) ->
			insert_let (g env e)
				(fun x -> Out(x), Type.Unit)


(* ��������ǥХå���print�ؿ� *)

let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".   "; print_indent (depth - 1))

let print_t depth x =
	print_indent depth;
	Id.print_t x

let print_t_tuple (x, t) = Id.print_t x; print_string ", "

let newline_flag = ref 0

let is_already_newline flag = 
	if !flag = 0 then (print_newline (); flag := 1)
	else ()

let rec print_kNormal depth expr =
	print_indent depth; newline_flag := 0;
	match expr with
	| Unit 		 -> print_string "<UNIT> "
	| Int i 	 -> print_string "<INT> "; print_string (string_of_int i)
	| Float d 	 -> print_string "<FLOAT> "; print_string (string_of_float d)
	| Neg x      -> print_string "<NEG> "; Id.print_t x
	| Add (x, y) -> print_string "<ADD> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| Sub (x, y) -> print_string "<SUB> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| Mul (x, y) -> print_string "<MUL> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| Div (x, y) -> print_string "<DIV> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| ShiftIL (x, y) -> print_string "<ShiftIL> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| ShiftIR (x, y) -> print_string "<ShiftIR> "; print_newline ();
					print_t (depth + 1) x; print_newline ();
					print_t (depth + 1) y
	| FNeg x  	 -> print_string "<FNEG> "; Id.print_t x
	| FAdd (x, y)-> print_string "<FADD> "; print_newline ();
					print_t (depth + 1)  x; print_newline ();
					print_t (depth + 1)  y
	| FSub (x, y)-> print_string "<FSUB> "; print_newline ();
					print_t (depth + 1)  x; print_newline ();
					print_t (depth + 1)  y
	| FMul (x, y)-> print_string "<FMUL> "; print_newline ();
					print_t (depth + 1)  x; print_newline ();
					print_t (depth + 1)  y
	| FDiv (x, y)-> print_string "<FDIV> "; print_newline ();
					print_t (depth + 1)  x; print_newline ();
					print_t (depth + 1)  y
	| Floor x  	 -> print_string "<FLOOR> "; Id.print_t x
	| Sqrt x  	 -> print_string "<SQRT> "; Id.print_t x
	| FtoI x  	 -> print_string "<FTOI> "; Id.print_t x
	| ItoF x  	 -> print_string "<ITOF> "; Id.print_t x
	| IfEq (x, y, e1, e2)	 -> print_string "<IF> "; print_newline ();
								print_indent (depth + 1); print_string "<EQ> "; print_newline ();
								print_t (depth + 2) x; print_newline ();
								print_t (depth + 2) y; print_newline ();
								print_indent depth; print_string "<THEN> "; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<ELSE> "; print_newline ();
								print_code (depth + 1) e2
	| IfLE (x, y, e1, e2)	 -> print_string "<IF> "; print_newline ();
								print_indent (depth + 1); print_string "<LE> "; print_newline ();
								print_t (depth + 2) x; print_newline ();
								print_t (depth + 2) y; print_newline ();
								print_indent depth; print_string "<THEN> "; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<ELSE> "; print_newline ();
								print_code (depth + 1) e2
	| Let ((x, t), e1, e2)	 -> print_string "<LET> ";
								Id.print_t x; print_string " ------ Type : "; Type.print_code t;
								print_code (depth + 1) e1; 
								print_indent depth; print_string "<IN>"; print_newline ();
								(*
								print_code (depth + 1) e2
								*)
								print_code depth e2
	| Var x 			 	 -> print_string "<VAR> "; Id.print_t x
	| LetRec ({name = (x, t); args = yts; body = e1}, e2)
						 	 -> print_string "<LETREC> "; 
								Id.print_t x; print_string " ------ Type : "; Type.print_code t;
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter print_t_tuple yts;
								print_string "</ARGS>"; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<IN>"; print_newline ();
								(*print_code (depth + 1) e2*)
								print_code depth e2
	| App (x, xs) 		 	 -> print_string "<APP> "; print_newline ();
								print_indent (depth + 1); print_string "<FUN> ";
								Id.print_t x; print_newline ();
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter (fun x -> Id.print_t x; print_string ", ") xs;
								print_string "</ARGS> ";
	| Tuple xs  		 	 -> print_string "<TUPLE> "; print_newline ();
								print_indent (depth + 1); List.iter (fun x -> Id.print_t x; print_string ", ") xs
	| LetTuple (xts, y, e)	 -> print_string "<LETTUPLE> "; print_newline ();
								print_indent (depth + 1); print_string "<TUPLE> ";
								List.iter print_t_tuple xts;
								print_string "</TUPLE>"; print_newline ();
								print_t (depth + 1) y; print_newline ();
								print_code (depth + 1) e
	| Get (x, y)     		 -> print_string "<GET> "; print_newline ();
								print_t (depth + 1) x; print_newline ();
								print_t (depth + 1) y
	| Put (x, y, z) 		 -> print_string "<PUT> "; print_newline ();
								print_t (depth + 1) x; print_newline ();
								print_t (depth + 1) y; print_newline ();
								print_t (depth + 1) z
	| ExtArray x 			 -> print_string "<EXTARRAY> ";
								Id.print_t x
	| ExtFunApp (x, ys) 	 -> print_string "<EXTFUNAPP> "; print_newline ();
								print_indent (depth + 1); print_string "<FUN> ";
								Id.print_t x; print_newline ();
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter (fun y -> Id.print_t y; print_string ", ") ys;
								print_string "</ARGS> "
	| Read_I x      -> print_string "<Read_I> "; Id.print_t x
	| Read_F x      -> print_string "<Read_F> "; Id.print_t x
	| Out x      -> print_string "<Out> "; Id.print_t x

and print_code depth expr = print_kNormal depth expr; is_already_newline newline_flag

(* int -> Syntax.t -> KNormal.t *)
let f print_flag e =
	let a = fst (g M.empty e) in
	if print_flag = 1 
		then (print_string "<dump after kNormal>\n=================================================================================================\n";
			  print_code 0 a;
			  print_string "=================================================================================================\n\n";
			  a) 
		else a
