type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
	| Unit
	| Bool
	| Int
	| Float
	| Fun of t list * t (* arguments are uncurried *)
	| Cls of t list * t list * t
	| Tuple of t list
	| Array of t
	| Var of t option ref
	| WildCard

let gentyp () = Var(ref None) (* 新しい型変数を作る *)

let rec convert = function
	| Fun (args, ret) -> Cls (List.map convert args, [], convert ret)
	| e -> e

let rec print_type = function
	| Unit  -> print_string " Unit "
	| Bool  -> print_string " Bool "
	| Int   -> print_string " Int "
	| Float -> print_string " Float "
	| Fun (t_list, t) -> 
		print_string " Fun ( args = (";
		List.iter print_type t_list;
		print_string ") -> exp = (";
		print_type t;
		print_string ") ) "
	| Cls (args, fvs, t) -> 
		print_string " Cls ( args = (";
		List.iter print_type args;
		print_string ") [fvs = (";
		List.iter print_type fvs;
		print_string ")] -> exp = (";
		print_type t;
		print_string ") ) "
	| Tuple t_list -> 
		print_string " Tuple (";
		List.iter print_type t_list;
		print_string ") "
	| Array t ->
		print_string " Array (";
		print_type t;
		print_string ") "
	| Var {contents = None} -> 
		print_string " Var (ref None) "
	| Var {contents = Some t} -> 
		print_string " Var (ref Some (";
		print_type t;
		print_string ")) "
	| WildCard -> ()

let print_code t = print_type t; print_newline ()
