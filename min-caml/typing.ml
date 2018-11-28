(* type inference/reconstruction *)

open Syntax

exception Unify of Type.t * Type.t
exception Error of Type.t * Type.t * pos

let extenv = ref M.empty

(* Type.t -> Type.t *)
(* for pretty printing (and type normalization) *)
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

let rec deref_id_typ (x, t) = (x, deref_typ t) (* (Id.t * Type.t) の処理 *)

(* Syntax.t -> Syntax.t *)
(* Syntax.t の中のType.t を中身に置き換えている *)
let rec deref_term = function
	| Not(e) -> Not(deref_term e)
	| Neg(e) -> Neg(deref_term e)
	| AdHoc(e1, e2) -> AdHoc(deref_term e1, deref_term e2)
	| Add(e1, e2) -> Add(deref_term e1, deref_term e2)
	| Sub(e1, e2) -> Sub(deref_term e1, deref_term e2)
	| Mul(e1, e2) -> Mul(deref_term e1, deref_term e2)
	| Div(e1, e2) -> Div(deref_term e1, deref_term e2)
	| Eq(e1, e2) -> Eq(deref_term e1, deref_term e2)
	| LE(e1, e2) -> LE(deref_term e1, deref_term e2)
	| FNeg(e) -> FNeg(deref_term e)
	| FAdd(e1, e2) -> FAdd(deref_term e1, deref_term e2)
	| FSub(e1, e2) -> FSub(deref_term e1, deref_term e2)
	| FMul(e1, e2) -> FMul(deref_term e1, deref_term e2)
	| FDiv(e1, e2) -> FDiv(deref_term e1, deref_term e2)
	| If(e1, e2, e3) -> If(deref_term e1, deref_term e2, deref_term e3)
	| Let(xt, e1, e2) -> Let(deref_id_typ xt, deref_term e1, deref_term e2)
	| LetRec({ name = (xt, pos); args = yts; body = e1 }, e2) ->
			LetRec({ name = (deref_id_typ xt, pos);
					 args = List.map deref_id_typ yts;
					 body = deref_term e1 },
					deref_term e2)
	| App(e, es) -> App(deref_term e, List.map deref_term es)
	| Tuple(es) -> Tuple(List.map deref_term es)
	| LetTuple(xts, e1, e2) -> LetTuple(List.map deref_id_typ xts, deref_term e1, deref_term e2)
	| Array(e1, e2) -> Array(deref_term e1, deref_term e2)
	| Get(e1, e2) -> Get(deref_term e1, deref_term e2)
	| Put(e1, e2, e3) -> Put(deref_term e1, deref_term e2, deref_term e3)
	| e -> e (* Unit, Bool, Int, Float はそのまま(最終形態) *)

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

(* Syntax.t -> Type.t *)
(* 深さ優先で再帰的に検査している *)
let rec g env e = (* 型推論ルーチン (caml2html: typing_g) *)
	match e with
	| Unit pos  -> Type.Unit
	| Bool(_, pos) -> Type.Bool
	| Int(_, pos) -> Type.Int
	| Float(_, pos) -> Type.Float
	| Not(e) ->
			(try
				unify Type.Bool (g env e) 
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e))));
			Type.Bool
	| Neg(e) ->
			(try
				unify Type.Int (g env e)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e))));
			Type.Int
	| AdHoc(e1, e2) ->
			(try
				(unify (g env e1) (g env e2);
				 unify Type.Int (g env e1);
				 unify Type.Int (g env e2);
				 Type.Int)
			with
			| Unify (t1, t2) 
				-> (try
						(unify Type.Float (g env e1);
						 unify Type.Float (g env e2);
						 Type.Float)
					with
					| Unify (tt1, tt2) -> 
							(Syntax.print_pos (errpos e1);
							print_string "expected : "; Type.print_type tt1; print_newline ();
							print_string "actual   : "; Type.print_type tt2; print_newline ();
							raise (Error (deref_typ t1, deref_typ t2, errpos e1)))))
	| Add(e1, e2) | Sub(e1, e2) | Mul(e1, e2) | Div (e1, e2) -> (* 足し算（と引き算）の型推論 (caml2html: typing_add) *)
			(try
				unify Type.Int (g env e1)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			(try
				unify Type.Int (g env e2)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e2);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e2))));
			Type.Int
	| FNeg(e) ->
			(try
				unify Type.Float (g env e);
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e))));
			Type.Float
	| FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
			(try
				unify Type.Float (g env e1)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			(try
				unify Type.Float (g env e2)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e2);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e2))));
			Type.Float
	| Eq(e1, e2) | LE(e1, e2) ->
			(try
				unify (g env e1) (g env e2);
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			Type.Bool
	| If(e1, e2, e3) ->
			(try
				unify (g env e1) Type.Bool;
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			let t2 = g env e2 in
			let t3 = g env e3 in
			(try
				unify t2 t3
			with
			| Unify (t_1, t_2) 
				-> (Syntax.print_pos (errpos e2);
					print_string "expected : "; Type.print_type t_1; print_newline ();
					print_string "actual   : "; Type.print_type t_2; print_newline ();
					raise (Error (deref_typ t_1, deref_typ t_2, errpos e2))));
			t2
	| Let((x, t), e1, e2) -> (* letの型推論 (caml2html: typing_let) *)
			(try
				unify t (g env e1)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			g (M.add x t env) e2
	| Var(x, _) when M.mem x env -> M.find x env (* 変数の型推論 (caml2html: typing_var) *)
	| Var(x, _) when M.mem x !extenv -> M.find x !extenv
	| Var(x, _) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
			Format.eprintf "free variable %s assumed as external@." x;
			let t = Type.gentyp () in
			extenv := M.add x t !extenv;
			t
	| LetRec({ name = ((x, t), pos); args = yts; body = e1 }, e2) -> (* let recの型推論 (caml2html: typing_letrec) *)
			let env = M.add x t env in
			(try
				unify t (Type.Fun(List.map snd yts, g (M.add_list yts env) e1))
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			g env e2
	| App(e, es) -> (* 関数適用の型推論 (caml2html: typing_app) *)
			let t = Type.gentyp () in
			(try
				unify (g env e) (Type.Fun(List.map (g env) es, t))
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e))));
			t
	| Tuple(es) -> Type.Tuple(List.map (g env) es)
	| LetTuple(xts, e1, e2) ->
			(try
				unify (Type.Tuple(List.map snd xts)) (g env e1);
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			g (M.add_list xts env) e2
	| Array(e1, e2) -> (* must be a primitive for "polymorphic" typing *)
			(try
				unify (g env e1) Type.Int
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			Type.Array(g env e2)
	| Get(e1, e2) ->
			let t = Type.gentyp () in
			(try
				unify (Type.Array(t)) (g env e1);
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			(try
				unify Type.Int (g env e2)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e2);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e2))));
			t
	| Put(e1, e2, e3) ->
			let t = g env e3 in
			(try
				unify (Type.Array(t)) (g env e1);
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e1);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e1))));
			(try
				unify Type.Int (g env e2)
			with
			| Unify (t1, t2) 
				-> (Syntax.print_pos (errpos e2);
					print_string "expected : "; Type.print_type t1; print_newline ();
					print_string "actual   : "; Type.print_type t2; print_newline ();
					raise (Error (deref_typ t1, deref_typ t2, errpos e2))));
			Type.Unit

(* int -> Syntax.t -> unit *)
let f print_flag e =
	extenv := M.empty;
(*
	(match deref_typ (g M.empty e) with
	| Type.Unit -> ()
	| _ -> Format.eprintf "warning: final result does not have type unit@.");
*)
	(try unify Type.Unit (g M.empty e)
	with Unify _ -> failwith "top level does not have type unit");
	(if print_flag = 1 
	 then (print_string "<dump Syntax.t>\n=================================================================================================\n"; 
	       (Syntax.print_code 0 e); 
		   print_string "=================================================================================================\n\n") 
	 else ());
	extenv := M.map deref_typ !extenv;
	deref_term e
