open Syntax

let rec g = function
	| Not t -> Not (g t)
	| Neg t -> Neg (g t)
	| Add (x, y) -> Add (g x, g y)
	| Sub (x, y) -> Sub (g x, g y)
	| Mul (x, y) -> Mul (g x, g y)
	| Div (x, y) -> Div (g x, g y)
	| FNeg t -> FNeg (g t)
	| FAdd (x, y) -> FAdd (g x, g y)
	| FSub (x, y) -> FSub (g x, g y)
	| FMul (x, y) -> FMul (g x, g y)
	| FDiv (x, y) -> FDiv (g x, g y)
	| Eq (x, y) -> Eq (g x, g y)
	| LE (x, y) -> LE (g x, g y)
	| If (x, y, z) -> If (g x, g y, g z)
	| Let ((x, t), e1, e2) -> Let ((x, t), g e1, g e2)

	| Fun (arg::[], e, pos) ->
		let fun_name = Id.gen_fun_name () in
		LetRec ({name = ((fun_name, Type.gentyp ()), pos); args = [arg]; body = g e}, Var (fun_name, pos))

	| Fun (arg::args, e, pos) ->
		let fun_name = Id.gen_fun_name () in
		LetRec ({name = ((fun_name, Type.gentyp ()), pos); args = [arg]; body = g (Fun (args, e, pos))}, Var (fun_name, pos))

	| LetRec ({name = ((name, t), pos); args = arg::[]; body = e1}, e2) -> 
		LetRec ({name = ((name, t), pos); args = [arg]; body = g e1}, g e2)

	| LetRec ({name = ((name, t), pos); args = arg::args; body = e1}, e2) ->
		let letrec_name = Id.gen_letrec_name name in
		let new_body = g (LetRec ({name = ((letrec_name, Type.gentyp ()), pos); args = args; body = e1}, Var (letrec_name, pos))) in
		LetRec ({name = ((name, t), pos); args = [arg]; body = new_body}, g e2)

	(*
	| App (e, e_list) -> App (g e, List.map g e_list)
	*)

	| App (e, args) ->
		let rev_args = List.rev args in
		(match rev_args with
		| arg::[] -> App (g e, [g arg])
		| outer::remain_args -> App (g (App (e, remain_args)), [g outer]))
	
	| Tuple e_list -> Tuple (List.map g e_list)
	| LetTuple (names, e1, e2) -> LetTuple (names, g e1, g e2)
	| Array (x, y) -> Array (g x, g y)
	| Get (x, y) -> Get (g x, g y)
	| Put (x, y, z) -> Put (g x, g y, g z)
	| e -> e

let f before_flag print_flag exp =
	let new_exp = g exp in
	match (before_flag, print_flag) with
	| (0, 0) -> new_exp
	| (_, 0) -> 
		print_string "<dump raw Syntax.t>\n=================================================================================================\n"; 
		print_code 0 exp; 
		print_string "=================================================================================================\n\n";
		new_exp
	| (0, _) ->
		print_string "<dump Syntax.t before type check>\n=================================================================================================\n"; 
		print_code 0 new_exp; 
		print_string "=================================================================================================\n\n";
		new_exp
	| (_, _) ->
		print_string "<dump raw Syntax.t>\n=================================================================================================\n"; 
		print_code 0 exp; 
		print_string "=================================================================================================\n\n";
		print_string "<dump Syntax.t before type check>\n=================================================================================================\n"; 
		print_code 0 new_exp; 
		print_string "=================================================================================================\n\n";
		new_exp
