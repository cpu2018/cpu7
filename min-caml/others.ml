
	| Add (a, b) -> 
		let name = find_common_exp !env (Add (a, b)) in 
		if name = "None"
			then Add (a, b)
			else Var name
	| Sub (a, b) -> 
		let name = find_common_exp !env (Sub (a, b)) in 
		if name = "None"
			then Sub (a, b)
			else Var name
	| Mul (a, b) -> 
		let name = find_common_exp !env (Mul (a, b)) in
		if name = "None"
			then Mul (a, b)
			else Var name
	| Div (a, b) -> 
		let name = find_common_exp !env (Div (a, b)) in
		if name = "None"
			then Div (a, b)
			else Var name
	| FAdd (a, b) -> 
		let name = find_common_exp !env (FAdd (a, b)) in
		if name = "None"
			then FAdd (a, b)
			else Var name
	| FSub (a, b) -> 
		let name = find_common_exp !env (FSub (a, b)) in
		if name = "None"
			then FSub (a, b)
			else Var name
	| FMul (a, b) -> 
		let name = find_common_exp !env (FMul (a, b)) in
		if name = "None"
			then FMul (a, b)
			else Var name
	| FDiv (a, b) -> 
		let name = find_common_exp !env (FDiv (a, b)) in
		if name = "None"
			then FDiv (a, b)
			else Var name
	| Neg a -> 
		let name = find_common_exp !env (Neg a) in
		if name = "None"
			then Neg a
			else Var name
	| FNeg a -> 
		let name = find_common_exp !env (FNeg a) in
		if name = "None"
			then FNeg a
			else Var name



(* ここからデバッグ用print関数 *)
(*
let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".   "; print_indent (depth - 1))
(*
let print_indent_t depth x =
	print_indent depth;
	Id.print_t x
*)
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

let rec print_t depth ty =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match ty with
	| Ans exp -> print_string "Ans "; print_exp (depth + 1) exp
	| Let ((x, y), exp, t) ->
		print_string "Let "	 ;
		Id.print_t x; print_string " ------ Type : "; Type.print_code t;
		print_exp (depth + 1) exp;
		print_indent depth; print_string "in"; print_newline ();
		print_t depth e2
and print_exp depth expr =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match expr with
	| Nop -> 
	| Set i -> 
	| SetL x
	| Mov x
	| Neg x
	| Add (x, y)
	| Sub (x, y)
	| Mul (x, y)
	| Div (x, y)
	| Ld (x, y, )
