open Closure

exception Unify of Type.t * Type.t
exception Error of Type.t * Type.t
exception Err

let extenv = ref M.empty
let (env : Type.t M.t ref) = ref M.empty

let find x env = try M.find x !env with Not_found -> print_string x; print_string " was not found\n"; raise Err
let print_env n t = print_string ("name : " ^ n ^ " ------ Type : "); Type.print_code t
let print_error t1 t2 = 
	print_string "expected : "; Type.print_type t1; print_newline ();
	print_string "actual   : "; Type.print_type t2; print_newline ()

let rec deref_typ = function (* 型変数を中身でおきかえる関数 (caml2html: typing_deref) *)
	| Type.Fun(t1s, t2) -> Type.Fun(List.map deref_typ t1s, deref_typ t2)
	| Type.Tuple(ts) -> Type.Tuple(List.map deref_typ ts)
	| Type.Array(t) -> Type.Array(deref_typ t)
	| Type.Var({ contents = None } as r) ->
			Format.eprintf "uninstantiated type variable detected; assuming int@.";
			r := Some(Type.Int);
			Type.Int
	| Type.Var({ contents = Some(t) } as r) ->
			let t' = deref_typ t in
			r := Some(t');
			t'
	| t -> t

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
	| Type.Bool, Type.Int | Type.Int, Type.Bool -> ()
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
			unify Type.Int (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Neg : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Int
	| Add (x1, x2) | Sub (x1, x2) | Mul (x1, x2) | Div (x1, x2) | ShiftIL (x1, x2) | ShiftIR (x1, x2) -> 
		(try
			unify Type.Int (find x1 env);
			unify Type.Int (find x2 env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Add/Sub/Mul/Div/ShiftIL/ShiftIR : variable " ^ x1 ^ " or " ^ x2 ^ "\n");
			print_string "var Type is "; Type.print_code (find x1 env);
			print_string "var Type is "; Type.print_code (find x2 env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Int
	| FNeg x | Floor x | Sqrt x -> 
		(try
			unify Type.Float (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in FNeg/Floor/Sqrt : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Float
	| FAdd (x1, x2) | FSub (x1, x2) | FMul (x1, x2) | FDiv (x1, x2) ->
		(try
			unify Type.Float (find x1 env);
			unify Type.Float (find x2 env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in FAdd/FSub/FMul/FDiv : variable " ^ x1 ^ " or " ^ x2 ^ "\n");
			print_string "var Type is "; Type.print_code (find x1 env);
			print_string "var Type is "; Type.print_code (find x2 env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Float
	| FtoI x ->
		(try
			unify Type.Float (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in FtoI : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Int
	| ItoF x ->
		(try
			unify Type.Int (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in ItoF : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Float
	| IfEq (x1, x2, e1, e2) -> 
		(try 
			unify (find x1 env) (find x2 env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in IfEq : variable " ^ x1 ^ " and variable " ^ x2 ^ " \n");
			print_string "var Type is "; Type.print_code (find x1 env);
			print_string "var Type is "; Type.print_code (find x2 env);
			raise (Error (deref_typ t1, deref_typ t2)));
		let tx1, tx2 = (g env e1), (g env e2) in
		(try 
			unify tx1 tx2
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in IfEq : e1 and e2 \n");
			raise (Error (deref_typ t1, deref_typ t2)));
		tx2
	| IfLE (x1, x2, e1, e2) -> 
		(try
			unify (find x1 env) (find x2 env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in IfLE : variable " ^ x1 ^ " and variable " ^ x2 ^ " \n");
			print_string "var Type is "; Type.print_code (find x1 env);
			print_string "var Type is "; Type.print_code (find x2 env);
			raise (Error (deref_typ t1, deref_typ t2)));
		let tx1, tx2 = (g env e1), (g env e2) in
		(try 
			unify tx1 tx2
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in IfLE : e1 and e2 \n");
			raise (Error (deref_typ t1, deref_typ t2)));
		tx2
	| Let ((x, t), e1, e2) ->
		(try 
			unify t (g env e1)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Let : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code t;
			print_string "\n Type env is \n\n"; M.iter print_env !env; print_newline ();
			raise (Error (deref_typ t1, deref_typ t2)));
		env := M.add x t !env;
		g env e2
	| Var x when M.mem x !env -> find x env (* 変数の型推論 (caml2html: typing_var) *)
	| Var x when M.mem x !extenv -> find x extenv
	| Var x -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
		Format.eprintf "free variable %s assumed as external@ found when closure type checking." x;
		let t = Type.gentyp () in
		extenv := M.add x t !extenv;
		t
	| MakeCls ((x, Type.Fun (ty_args, ty_ret)), {entry = Id.L(entry); actual_fv = fvs}, e) -> 
		(try
			unify (Type.Fun (ty_args, ty_ret)) (find entry env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in MakeCls \n");
			print_string "entry Type is "; Type.print_code (find entry env);
			raise (Error (deref_typ t1, deref_typ t2)));
		g env e
	| AppCls (x, xs) -> 
		let t = Type.gentyp () in
		(try
			unify (find x env) (Type.Fun (List.map (fun x -> find x env) xs, t))
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in AppCls \n");
			print_string "appfun Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		t
	| AppDir (Id.L(x), xs) -> 
		let t = Type.gentyp () in
		let fun_ty = 
			(try M.find x !env 
			with Not_found -> Type.gentyp ()) in
		env := if fun_ty = Type.gentyp () then M.add x (Type.gentyp ()) !env else !env;
		(try 
			unify (find x env) (Type.Fun (List.map (fun x -> find x env) xs, t))
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in AppDir \n");
			print_string "appfun Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		t
	| Tuple xs -> Type.Tuple(List.map (fun x -> find x env) xs)
	| LetTuple (xs, tuple, e) -> 
		(try
			unify (Type.Tuple(List.map snd xs)) (find tuple env);
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in LetTuple \n");
			print_string "tuple Type is "; Type.print_code (find tuple env);
			raise (Error (deref_typ t1, deref_typ t2)));
		env := M.add_list xs !env;
		g env e
	| Get (arr, index) ->
		let t = Type.gentyp () in
		(try
			unify (Type.Array(t)) (find arr env);
			unify Type.Int (find index env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Get \n");
			print_string "arr Type is "; Type.print_code (find arr env);
			print_string "index Type is "; Type.print_code (find index env);
			raise (Error (deref_typ t1, deref_typ t2)));
		t
	| Put (arr, index, value) ->
		(try
			unify (Type.Array (find value env)) (find arr env);
			unify Type.Int (find index env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Put \n");
			print_string "arr Type is "; Type.print_code (find arr env);
			print_string "index Type is "; Type.print_code (find index env);
			print_string "value Type is "; Type.print_code (find value env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Unit
	| ExtArray Id.L(x) ->
		let t = Type.gentyp () in 
		Type.Array t
	| Read_I x ->
		(try
			unify Type.Unit (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Read_I : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Int
	| Read_F x -> 
		(try
			unify Type.Unit (find x env)
		with Unify (t1, t2) -> 
			print_error t1 t2;
			print_string ("in Read_F : variable " ^ x ^ "\n");
			print_string "var Type is "; Type.print_code (find x env);
			raise (Error (deref_typ t1, deref_typ t2)));
		Type.Float
	| _ -> raise Err

let rec harg_iter ty_args args =
	match ty_args, args with
	| [], [] -> ()
	| tya::tyad, a::ad -> unify tya a; harg_iter tyad ad
	| _, _ -> raise Err

let rec h env {name = (Id.L(x), fun_type); args = args; formal_fv = fvs; body = e} =
	(*
	M.iter print_env !env; print_newline ();
	*)
	(try
		env := M.add_list fvs !env;
		env := M.add_list args !env;
		env := M.add x fun_type !env;
		unify fun_type (Type.Fun (List.map snd args, (g env e)))
	with Unify (t1, t2) -> 
		print_error t1 t2;
		raise (Error (deref_typ t1, deref_typ t2)));
	env

let rec h_iter (env: Type.t M.t ref) = function
	| [] -> env
	| fundef::fundefs -> 
		(env := !(h env fundef);
		(*
		print_string "in h_iter\n"; M.iter print_env !env; print_newline ();
		*)
		h_iter env fundefs)

let rec f print_flag prog =
	let Prog (fundefs, t) = prog in
	extenv := M.empty;
	(try 
		env := !(h_iter env fundefs);
		(*
		print_string "in f\n"; M.iter print_env !env; print_newline ();
		*)
		unify Type.Unit (g env t) 
	with Unify _ -> failwith "top level does not have type unit");
	(if print_flag = 1 then 
		(print_string "<dump Closure.t after type check>\n=================================================================================================\n"; 
		print_prog 0 (Prog (fundefs, t)); 
		print_string "=================================================================================================\n\n") 
	else ());
	prog
