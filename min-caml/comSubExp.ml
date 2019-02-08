open KNormal
exception Remove_Error

let int_flag = ref 0
let float_flag = ref 0

let rec print_env_list env =
	match env with
	| [] -> ()
	| (exp, name, depth)::yd -> 
		print_string "(";
		Id.print_t name;
		print_string ", ";
		print_string (string_of_int depth);
		print_string "); ";
		print_env_list yd

let print_env env =
	print_string "[";
	print_env_list env;
	print_string "]\n"

(* (KNormal.t * Id.t * int) list -> KNormal.t -> Id.t -> int -> ( KNormal.t * Id.t * int) list *)
let add_common_exp env e name depth = 
	match e with
	| Int i -> (e, name, depth)::env
	| Float f -> (e, name, depth)::env
	| Add (a, b) | Sub (a, b) | Mul (a, b) | Div (a, b) | FAdd (a, b) | FSub (a, b) | FMul (a, b) | FDiv (a, b)
		-> (e, name, depth)::env
	| Neg a | FNeg a
		-> (e, name, depth)::env
	| Tuple a -> (e, name, depth)::env
	| Let (_,_,_) -> (e, name, depth)::env
	| _ -> env

(* (KNormal.t * Id.t * int) list -> int -> (KNormal.t * Id.t * int) list *)
let rec remove_common_exp env target_d = 
	match env with
	| [] -> []
	| (exp, name, depth)::yd -> 
		if target_d > depth && String.get name 0 <> 'I' then
			env
		else if String.get name 0 = 'I' then
			(exp, name, depth)::(remove_common_exp yd target_d)
		else
			(
			(*
			print_string "\nremove\n"; Id.print_t name; print_newline ();
			*)
			 remove_common_exp yd target_d)


(* (KNormal.t * Id.t * int) list -> KNormal.t -> Id.t *)
let rec find_common_exp env e =
	match env with
	| [] -> "None"
	| (exp, name, depth)::yd -> 
		if exp = e then 
			(match exp with
			| Int i -> int_flag := 1; name
			| _ -> name)
		else 
			find_common_exp yd e

(* (KNormal.t * Id.t * int) list ref -> int -> KNormal.t -> KNormal.t *)
let rec g env depth = function
	| Let ((x, t), e1, e2) ->
		let cse_e1 = g env (depth + 1) e1 in 
		(*
		print_string "\nlooking\n";
		Id.print_t x;
		print_newline ();
		KNormal.print_code 0 cse_e1;
		*)
		env := remove_common_exp !env (depth + 1);
		(*
		print_env !env; print_newline;
		*)
		(* (x, e1) $B$r(B env $B$+$iC5$7!"M-$C$?$iCV49!"L5$+$C$?$iDI2C(B *)
		(* e2 $B$K$D$$$F!":F5"E*$K(Bg$B$r:nMQ$5$;$F$d$k(B *)
		(* let$B$N%9%3!<%W$+$i30$l$?$i:o=|(B (alpha$BJQ498e$J$N$G0l1~$3$l$O$7$J$/$F$bNI$$(B) *)
		let name = find_common_exp !env cse_e1 in
		if name = "None" then 
			 (env := add_common_exp !env cse_e1 x depth;
			 (*
			 print_string "\nadd \n";
			 Id.print_t x; print_string " "; print_string (string_of_int depth);
			 print_newline ();
			 KNormal.print_code 0 cse_e1;
			 *)
			 Let ((x, t), cse_e1, g env depth e2))
		else 
			if !int_flag = 1 then
				(int_flag := 0; 
				 Let ((x, t), cse_e1, g env depth e2))
			else
				Let ((x, t), Var name, g env depth e2)
	| e -> e

(* int -> KNormal.t -> KNormal.t *)
let f print_flag e =
	let env = ref [] in
	let a = g env 0 e in
	if print_flag = 1 
		then (print_string "<dump after elimsubexp>\n=================================================================================================\n";
			  print_code 0 a;
			  print_string "=================================================================================================\n\n";
			  a) 
		else a
