open Closure

exception Unify of Type.t * Type.t
exception Error of Type.t * Type.t

let extenv = ref M.empty

let rec occur r1 = function (* occur check (caml2html: typing_occur) *)
	| Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
	| Type.Tuple(t2s) -> List.exists (occur r1) t2s
	| Type.Array(t2) -> occur r1 t2
	| Type.Var(r2) when r1 == r2 -> true
	| Type.Var({ contents = None }) -> false
	| Type.Var({ contents = Some(t2) }) -> occur r1 t2
	| _ -> false

(* Type.t-> unit *)
(* エラーが出なければunitを返す *)
let rec unify t1 t2 = (* 型が合うように、型変数への代入をする (caml2html: typing_unify) *)
	match t1, t2 with
	| Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
	| Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
			(try List.iter2 unify t1s t2s
			with Invalid_argument(_) -> raise (Unify(t1, t2)));
			unify t1' t2'
	| Type.Tuple(t1s), Type.Tuple(t2s) ->
			(try List.iter2 unify t1s t2s
			with Invalid_argument(_) -> raise (Unify(t1, t2)))
	| Type.Array(t1), Type.Array(t2) -> unify t1 t2
	| Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
	| Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
	| _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
	| Type.Var({ contents = None } as r1), _ -> (* 一方が未定義の型変数の場合 (caml2html: typing_undef) *)
			if occur r1 t2 then raise (Unify(t1, t2));
			r1 := Some(t2)
	| _, Type.Var({ contents = None } as r2) ->
			if occur r2 t1 then raise (Unify(t1, t2));
			r2 := Some(t1)
	| _, _ -> raise (Unify(t1, t2))

(* M.t -> Closure.t -> Type.t *)
let rec g env = function
	| Unit -> Type.Unit
	| Int _ -> Type.Int
	| Float _ -> Type.Float
	| Neg x -> 
		(try
			unify Type.Int (M.find x env)
		with Unify (t1, t2) -> raise Error);
		Type.Int
	| Add (x1, x2) | Sub (x1, x2) | Mul (x1, x2) | Div (x1, x2) | ShiftIL (x1, x2) | ShiftIR (x1, x2) -> 
		(try
			unify Type.Int (M.find x1 env);
			unify Type.Int (M.find x2 env)
		with Unify (t1, t2) -> raise Error);
		Type.Int
	| FNeg x | Floor x | Sqrt x -> 
		(try
			unify Type.Int (M.find x env)
		with Unify (t1, t2) -> raise Error);
		Type.Floor
	| FAdd(x1, x2) | FSub(x1, x2) | FMul(x1, x2) | FDiv(x1, x2) ->
		(try
			unify Type.Int (M.find x env)
		with Unify (t1, t2) -> raise Error);
		Type.Floor
	| FtoI x ->
		(try
			unify Type.Float (M.find x env)
		with Unify (t1, t2) -> raise Error);
		Type.Int
	| ItoF x ->
		(try
			unify Type.Int (M.find x env)
		with Unify (t1, t2) -> raise Error);
		Type.Float
	| IfEq (x1, x2, e1, e2) -> 
		(try 
			unify Type.Int (M.find x1 env);
			unify Type.Int (M.find x2 env)
		with Unify (t1, t2) -> raise Error);
	| IfLE (x1, x2, e1, e2) -> 
		(try
			unify Type.Int (M.find x1 env);
			unify Type.Int (M.find x2 env)
		with Unify (t1, t2) -> raise Error);
		let tx1, tx2 = (g env tx1), (g env tx2) in
		(try 
			unify tx1 tx2
		with Unify (t1, t2) -> raise Error);
		tx2
	| Let ((x, t), e1, e2) ->
		(try 
			unify t (g env e1)
		with Unify (t1, t2) -> raise Error);
		g (M.add x t env) e2
	| Var (x, _) when M.mem x env -> M.find x env (* 変数の型推論 (caml2html: typing_var) *)
	| Var (x, _) when M.mem x !extenv -> M.find x !extenv
	| Var (x, _) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
		Format.eprintf "free variable %s assumed as external@ found when closure type checking." x;
		let t = Type.gentyp () in
		extenv := M.add x t !extenv;
		t
	| MakeCls ((x, t), {entry = Id.L(entry); actual_fv = fvs}, e) -> 
		
	| AppCls (x, xs) -> 
		let t = Type.gentyp () in
		(try
			unify (g env x) (Type.Fun())
		with Unify (t1, t2) -> raise Error);

	| AppDir (Id.L(x), xs) -> 
		let t = Type.gentyp () in
		(try 
			unify (g env x) (Type.Fun ())
		with Unify (t1, t2) -> raise Error);
		
	| Tuple xs -> Type.Tuple(List.map (g env) xs)
	| LetTuple (xs, tuple, e) -> 
		(try
			unify (Type.Tuple(List.map snd xs)) (g env tuple);
		with Unify (t1, t2) -> raise Error);
		g (M.add_list xs env) e
	| Get (x1, x2) ->
		let t = Type.gentyp () in
		(try
			unify (Type.Array(t)) (g env x1)
		with Unify (t1, t2) -> raise Error);
		t
	| Put (x1, x2) ->
	| ExtArray Id.L(x) ->
	| Read_I x ->
		(try
			unify Type.Unit (g env x)
		with Unify (t1, t2) -> raise Error);
		Type.Int
	| Read_F x -> 
		(try
			unify Type.Unit (g env x)
		with Unify (t1, t2) -> raise Error);
		Type.Float
	| e -> raise Error

let rec h env 

let rec f print_flag Prog (fundef_list, t) =
	extenv := <.enpty;
	(try 
		unify Type.Unit (g M.empty t) 
	with Unify _ -> failwith "top level does not have type unit");
	(if print_flag = 1 then 
		(print_string "<dump Syntax.t>\n=================================================================================================\n"; 
		(Syntax.print_code 0 e); 
		print_string "=================================================================================================\n\n") 
	else ());
	Prog (fundef_list, t)
	
