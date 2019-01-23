type closure = { entry : Id.l; actual_fv : Id.t list }
type t = (* ���������Ѵ���μ� (caml2html: closure_t) *)
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
	| IfEq of Id.t * Id.t * t * t
	| IfLE of Id.t * Id.t * t * t
	| Let of (Id.t * Type.t) * t * t
	| Var of Id.t
	| MakeCls of (Id.t * Type.t) * closure * t
	| AppCls of Id.t * Id.t list
	| AppDir of Id.l * Id.t list
	| Tuple of Id.t list
	| LetTuple of (Id.t * Type.t) list * Id.t * t
	| Get of Id.t * Id.t
	| Put of Id.t * Id.t * Id.t
	| ExtArray of Id.l
	| Read_I of Id.t
	| Read_F of Id.t
	| WildCard
type fundef = { name : Id.l * Type.t;
				args : (Id.t * Type.t) list;
				formal_fv : (Id.t * Type.t) list;
				body : t }
type prog = Prog of fundef list * t

(* Closure.t -> fv�ν���*)
let rec fv = function
	| Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
	| Neg(x) | FNeg(x) | Floor(x) | Sqrt(x) | FtoI(x) | ItoF(x) | Read_I(x) | Read_F(x) -> S.singleton x
	| Add(x, y) | Sub(x, y) | Mul(x, y) | Div(x, y) | ShiftIL(x, y) | ShiftIR(x, y) | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
	| IfEq(x, y, e1, e2)| IfLE(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
	| Let((x, t), e1, e2) -> S.union (fv e1) (S.remove x (fv e2))
	| Var(x) -> S.singleton x
	| MakeCls((x, t), { entry = l; actual_fv = ys }, e) -> S.remove x (S.union (S.of_list ys) (fv e))
	| AppCls(x, ys) -> S.of_list (x :: ys)
	| AppDir(_, xs) | Tuple(xs) -> S.of_list xs
	| LetTuple(xts, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xts)))
	| Put(x, y, z) -> S.of_list [x; y; z]

(* �ؿ����������� *)
let toplevel : fundef list ref = ref []
(* M:���Ķ� ->  ->  *)
let rec g env known = function (* ���������Ѵ��롼�������� (caml2html: closure_g) *)
	| KNormal.Unit -> Unit
	| KNormal.Int(i) -> Int(i)
	| KNormal.Float(d) -> Float(d)
	| KNormal.Neg(x) -> Neg(x)
	| KNormal.Add(x, y) -> Add(x, y)
	| KNormal.Sub(x, y) -> Sub(x, y)
	| KNormal.Mul(x, y) -> Mul(x, y)
	| KNormal.Div(x, y) -> Div(x, y)
	| KNormal.ShiftIL(x, y) -> ShiftIL(x, y)
	| KNormal.ShiftIR(x, y) -> ShiftIR(x, y)
	| KNormal.FNeg(x) -> FNeg(x)
	| KNormal.FAdd(x, y) -> FAdd(x, y)
	| KNormal.FSub(x, y) -> FSub(x, y)
	| KNormal.FMul(x, y) -> FMul(x, y)
	| KNormal.FDiv(x, y) -> FDiv(x, y)
	| KNormal.Floor(x) -> Floor(x)
	| KNormal.Sqrt(x) -> Sqrt(x)
	| KNormal.FtoI(x) -> FtoI(x)
	| KNormal.ItoF(x) -> ItoF(x)
	| KNormal.IfEq(x, y, e1, e2) -> IfEq(x, y, g env known e1, g env known e2)
	| KNormal.IfLE(x, y, e1, e2) -> IfLE(x, y, g env known e1, g env known e2)
	| KNormal.Let((x, t), e1, e2) -> Let((x, t), g env known e1, g (M.add x t env) known e2)
	| KNormal.Var(x) -> Var(x)
	| KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2) -> (* �ؿ�����ξ�� (caml2html: closure_letrec) *)
			(* �ؿ����let rec x y1 ... yn = e1 in e2�ξ��ϡ�
				 x�˼�ͳ�ѿ����ʤ�(closure��𤵤�direct�˸ƤӽФ���)
				 �Ȳ��ꤷ��known���ɲä���e1�򥯥������Ѵ����Ƥߤ� *)
			let toplevel_backup = !toplevel in
			let env' = M.add x t env in
			let known' = S.add x known in
			let e1' = g (M.add_list yts env') known' e1 in
			(* �����˼�ͳ�ѿ����ʤ��ä������Ѵ����e1'���ǧ���� *)
			(* ���: e1'��x���Ȥ��ѿ��Ȥ��ƽи��������closure��ɬ��!
				 (thanks to nuevo-namasute and azounoman; test/cls-bug2.ml����) *)
			let zs = S.diff (fv e1') (S.of_list (List.map fst yts)) in (* e1'�ˤ��뼫ͳ�ѿ��ȡ�LetRec�ΰ����ν���κ������ͤ��ơ��⤷�����ä��顢*)
			let known', e1' =
				if S.is_empty zs then known', e1' else
				(* ���ܤ��ä������(toplevel����)���ᤷ�ơ����������Ѵ�����ľ�� *)
				(Format.eprintf "free variable(s) %s found in function %s@." (Id.pp_list (S.elements zs)) x;
				 Format.eprintf "function %s cannot be directly applied in fact@." x;
				 toplevel := toplevel_backup;
				 let e1' = g (M.add_list yts env') known e1 in (* known���ᤷ����ΤǤ⤦���closure�Ѵ����� *)
				 known, e1') in
			let zs = S.elements (S.diff (fv e1') (S.add x (S.of_list (List.map fst yts)))) in (* ��ͳ�ѿ��Υꥹ�� *)
			let zts = List.map (fun z -> (z, M.find z env')) zs in (* �����Ǽ�ͳ�ѿ�z�η����������˰���env��ɬ�� *)
			toplevel := { name = (Id.L(x), t); args = yts; formal_fv = zts; body = e1' } :: !toplevel; (* �ȥåץ�٥�ؿ����ɲ� *)
			let e2' = g env' known' e2 in 
			if S.mem x (fv e2') then (* x���ѿ��Ȥ���e2'�˽и����뤫 *) (* x �� S �θ����ɤ��� *)
				MakeCls((x, t), { entry = Id.L(x); actual_fv = zs }, e2') (* �и����Ƥ����������ʤ� *) (* x��closure�Ȥ��ƸƤӽФ����Ȥˤ��� *)
			else
				(Format.eprintf "eliminating closure(s) %s@." x;
				 e2') (* �и����ʤ����MakeCls���� *)
	| KNormal.App(x, ys) when S.mem x known -> (* �ؿ�Ŭ�Ѥξ�� (caml2html: closure_app) *) (* known�ˤ���С�ľ�ܸƤӽФ��� *)
			Format.eprintf "directly applying %s@." x;
			AppDir(Id.L(x), ys)
	| KNormal.App(f, xs) -> AppCls(f, xs)
	| KNormal.Tuple(xs) -> Tuple(xs)
	| KNormal.LetTuple(xts, y, e) -> LetTuple(xts, y, g (M.add_list xts env) known e)
	| KNormal.Get(x, y) -> Get(x, y)
	| KNormal.Put(x, y, z) -> Put(x, y, z)
	| KNormal.ExtArray(x) -> ExtArray(Id.L(x))
	| KNormal.ExtFunApp(x, ys) -> AppDir(Id.L("min_caml_" ^ x), ys)
	| KNormal.Read_I(x) -> Read_I(x)
	| KNormal.Read_F(x) -> Read_F(x)

(* ��������ǥХå���print�ؿ� *)

let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".   "; print_indent (depth - 1))

let print_t depth x =
	print_indent depth;
	Id.print_t x

let rec print_id_list fv_list =
	List.iter (fun id -> Id.print_t id; print_string ", ") fv_list

let print_t_tuple (x, t) = Id.print_t x; print_string ", "

let print_closure {entry = label; actual_fv = fv_list} =
	Id.print_l label;
	print_id_list fv_list


let newline_flag = ref 0

let is_already_newline flag = 
	if !flag = 0 then (print_newline (); flag := 1)
	else ()

let rec print_closure depth expr =
	print_indent depth; newline_flag := 0;
	match expr with
	| Unit 		 -> print_string "<UNIT> "
	| Int i 	 -> print_string "<INT> "; print_string (string_of_int i)
	| Float d 	 -> print_string "<FLOAT> "; print_string (string_of_float d)
	| Neg x			-> print_string "<NEG> "; Id.print_t x
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
	| ShiftIL (x, y)-> print_string "<SHIFT_INT_LEFT> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| ShiftIR (x, y)-> print_string "<SHIFT_INT_RIGHT> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| FNeg x		 -> print_string "<FNEG> "; Id.print_t x
	| FAdd (x, y)-> print_string "<FADD> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| FSub (x, y)-> print_string "<FSUB> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| FMul (x, y)-> print_string "<FMUL> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| FDiv (x, y)-> print_string "<FDIV> "; print_newline ();
					print_t (depth + 1)	x; print_newline ();
					print_t (depth + 1)	y
	| Floor x		 -> print_string "<FLOOR> "; Id.print_t x
	| Sqrt x		 -> print_string "<SQRT> "; Id.print_t x
	| FtoI x		 -> print_string "<FTOI> "; Id.print_t x
	| ItoF x		 -> print_string "<ITOF> "; Id.print_t x
	| IfEq (x, y, e1, e2)	 -> print_string "<IF> "; print_newline ();
								print_indent (depth + 1); print_string "<EQ> "; print_newline ();
								print_t (depth + 2)	x; print_newline ();
								print_t (depth + 2)	y; print_newline ();
								print_indent depth; print_string "<THEN> "; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<ELSE> "; print_newline ();
								print_code (depth + 1) e2
	| IfLE (x, y, e1, e2)	 -> print_string "<IF> "; print_newline ();
								print_indent (depth + 1); print_string "<LE> "; print_newline ();
								print_t (depth + 2)	x; print_newline ();
								print_t (depth + 2)	y; print_newline ();
								print_indent depth; print_string "<THEN> "; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<ELSE> "; print_newline ();
								print_code (depth + 1) e2
	| Let ((x, t), e1, e2)	 -> print_string "<LET> "	 ;
								Id.print_t x	 ; print_string " ------ Type : "; Type.print_code t;
								print_code (depth + 1) e1; 
								print_indent depth; print_string "<IN>"; print_newline ();
								(*
								print_code (depth + 1) e2
								*)
								print_code depth e2
	| Var x 			 	 -> print_string "<VAR> "		 ; Id.print_t x
	| MakeCls ((f, t), {entry = entry; actual_fv = fv_list}, exp)
							 -> print_string "<MakeCls>";
							 	Id.print_t f; print_string " ------ Type : "; Type.print_code t;
								print_indent (depth + 1); print_string "<CLOSURE> "; print_newline ();
								print_indent (depth + 2); print_string "entry : "; 
								Id.print_l entry; print_newline ();
								print_indent (depth + 2); print_string "actual_fv : ";
								print_id_list fv_list; print_newline ();
								print_code (depth + 1) exp
	| AppCls (x, xs) 		 -> print_string "<APPCLS> "; print_newline ();
								print_indent (depth + 1); print_string "<CLS> ";
								Id.print_t x; print_newline ();
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter (fun x -> Id.print_t x; print_string ", ") xs;
								print_string "</ARGS> "
	| AppDir (x, xs)		 -> print_string "<APPDIR> "; print_newline ();
								print_indent (depth + 1); print_string "<LABEL> ";
								Id.print_l x; print_newline ();
								print_indent (depth + 1); print_string "<ARGS> ";
								print_id_list xs;
								print_string "</ARGS>"
	| Tuple xs			 	 -> print_string "<TUPLE> "	 ; print_newline ();
								print_indent (depth + 1); List.iter (fun x -> Id.print_t x; print_string ", ") xs
	| LetTuple (xts, y, e)	 -> print_string "<LETTUPLE> " ; print_newline ();
								print_indent (depth + 1); print_string "<TUPLE> ";
								List.iter print_t_tuple xts;
								print_string "</TUPLE>"; print_newline ();
								print_t (depth + 1)	y; print_newline ();
								print_code (depth + 1)	e
	| Get (x, y)		 	 -> print_string "<GET> " ; print_newline ();
								print_t (depth + 1)	x; print_newline ();
								print_t (depth + 1)	y
	| Put (x, y, z) 		 -> print_string "<PUT> " ; print_newline ();
								print_t (depth + 1)	x; print_newline ();
								print_t (depth + 1)	y; print_newline ();
								print_t (depth + 1)	z
	| ExtArray x 			 -> print_string "<EXTARRAY> " ; 
								Id.print_l x
	| Read_I x		 -> print_string "<Read_I> "; Id.print_t x
	| Read_F x		 -> print_string "<Read_F> "; Id.print_t x
	| WildCard				 -> ()

and print_code depth expr = print_closure depth expr; is_already_newline newline_flag

let print_fundef depth {name = (name_l, name_type); args = arg_list; formal_fv = fv_list; body = exp} =
	print_indent depth; print_string "fundef = {"; print_newline ();
	print_indent (depth + 1); print_string "name = "; Id.print_l name_l; print_newline ();
	print_indent (depth + 1); print_string "args = "; List.iter (fun tuple -> print_t_tuple tuple) arg_list; print_newline ();
	print_indent (depth + 1); print_string "formal_fv = "; List.iter (fun tuple -> print_t_tuple tuple) fv_list; print_newline ();
	print_indent (depth + 1); print_string "body = "; print_newline (); print_code (depth + 2) exp;
	print_indent depth; print_string "}"; print_newline ()

let print_prog depth (Prog (fundef_list, exp)) =
	print_string "<PROG> "; print_newline ();
	print_indent (depth + 1); print_string "fundef list = "; print_newline ();
	List.iter (print_fundef (depth + 2)) fundef_list;
	print_indent (depth + 1); print_string "Closure.t = "; print_newline ();
	print_code (depth + 2) exp

let f print_flag print_cls_flag e =
	toplevel := [];
	let e' = g M.empty S.empty e in
	let prog = Prog (List.rev !toplevel, e') in
		if print_flag = 1
		then (print_string "<dump before closure>\n=================================================================================================\n";
			  KNormal.print_code 0 e; 
			  print_string "=================================================================================================\n\n";
			  if print_cls_flag = 1
			  then (print_string "<dump after closure>\n=================================================================================================\n";
			  		print_prog 0 prog; 
			  		print_string "=================================================================================================\n\n";
					prog)
			  else prog)
		else 
			  if print_cls_flag = 1 
			  then (print_string "<dump after closure>\n=================================================================================================\n";
			  		print_prog 0 prog; 
			  		print_string "=================================================================================================\n\n";
					prog)
			  else prog
