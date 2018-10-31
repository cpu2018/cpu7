type t = (* MinCaml�η���ɽ������ǡ����� (caml2html: type_t) *)
	| Unit
	| Bool
	| Int
	| Float
	| Fun of t list * t (* arguments are uncurried *)
	| Tuple of t list
	| Array of t
	| Var of t option ref
	| WildCard

let gentyp () = Var(ref None) (* ���������ѿ����� *)

let rec print_type = function
	| Unit  -> print_string " Unit "
	| Bool  -> print_string " Bool "
	| Int   -> print_string " Int "
	| Float -> print_string " Float "
	| Fun (t_list, t) -> 
		print_string " Fun ( args = (";
		List.iter print_type t_list;
		print_string ") exp = (";
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