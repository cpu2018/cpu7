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
	| Fun (args, e, pos) ->
		let fun_name = Id.gen_fun_name () in
		LetRec ({name = ((fun_name, Type.gentyp ()), pos); args = args; body = g e}, Var (fun_name, pos))
	| LetRec ({name = ((name, t), pos); args = args; body = e1}, e2) -> 
		LetRec ({name = ((name, t), pos); args = args; body = g e1}, g e2)
	| App (e, e_list) -> App (g e, List.map g e_list)
	| Tuple e_list -> Tuple (List.map g e_list)
	| LetTuple (names, e1, e2) -> LetTuple (names, g e1, g e2)
	| Array (x, y) -> Array (g x, g y)
	| Get (x, y) -> Get (g x, g y)
	| Put (x, y, z) -> Put (g x, g y, g z)
	| e -> e

let f print_flag exp =
	let new_exp = g exp in
	if print_flag = 1
	then
		(print_string "<dump Syntax.t before type check>\n=================================================================================================\n"; 
		 print_code 0 new_exp; 
		 print_string "=================================================================================================\n\n";
		 new_exp)
	else
		new_exp
