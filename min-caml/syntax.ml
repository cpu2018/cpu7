type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
	| Unit of pos
	| Bool of bool * pos
	| Int of int * pos
	| Float of float * pos
	| Not of t
	| Neg of t
	| AdHoc of t * t
	| Add of t * t
	| Sub of t * t
	| Mul of t * t
	| Div of t * t
	| FNeg of t
	| FAdd of t * t
	| FSub of t * t
	| FMul of t * t
	| FDiv of t * t
	| Floor of t
	| Sqrt of t
	| FtoI of t
	| ItoF of t
	| Eq of t * t
	| LE of t * t
	| If of t * t * t
	| Let of (Id.t * Type.t) * t * t
	| Var of Id.t * pos
	| Fun of (Id.t * Type.t) list * t * pos
	| LetRec of fundef * t
	| App of t * t list
	| Tuple of t list
	| LetTuple of (Id.t * Type.t) list * t * t
	| Array of t * t
	| Get of t * t
	| Put of t * t * t
	| ShiftIL of t * t
	| ShiftIR of t * t
	| Read_I of t
	| Read_F of t
	| Out of t
and fundef = { name : (Id.t * Type.t) * pos; args : (Id.t * Type.t) list; body : t }
and pos = {ls : int; le: int; chs : int; che : int}

let rec errpos e =
	match e with
	| Unit pos | Bool (_, pos) | Int (_, pos) | Float (_, pos) | Var (_, pos) 
		-> pos
	| Not t | Neg t | AdHoc (t, _) | Add (t, _) | Sub (t, _) | Mul (t, _) | Div (t, _)
    | FNeg t | FAdd (t, _) | FSub (t, _) | FMul (t, _) | FDiv (t, _) 
    | Floor t | Sqrt t | FtoI t | ItoF t
	| Eq (t, _) | LE (t, _) | If (t, _, _) | App (t, _) | Tuple (t::_) 
	| Array (t, _) | Get (t, _) | Put (t, _, _)
    	-> errpos t
	| Let (_, t, _) | LetTuple (_, t, _)
    	-> errpos t
	| LetRec ({name = (_, pos); args = _; body =_}, _)
    	-> pos
	| Fun (_, _, pos)
		-> pos
	| ShiftIL (t, _) | ShiftIR (t, _)
		-> errpos t
	| Read_I t | Read_F t | Out t
		-> errpos t

let print_pos {ls = ls; le = le; chs = chs; che = che} =
	Printf.printf "typing error near line %d-%d character %d-%d\n" ls le chs che; ()

let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".   "; print_indent (depth - 1))

let print_t depth x =
	print_indent depth;
	Id.print_t x;
	print_newline ()

let print_t_tuple (x, t) = Id.print_t x; print_string ", "

let newline_flag = ref 0

let is_already_newline flag = 
	if !flag = 0 then (print_newline (); flag := 1)
	else ()

let rec print_syntax depth expr =
	print_indent depth; newline_flag := 0;
	match expr with
	| Unit _	 -> print_string "<UNIT> "
	| Bool (b, _)-> print_string "<BOOL> "; print_string (string_of_bool b)
	| Int (i, _) -> print_string "<INT> "	; print_string (string_of_int i)
	| Float(d, _)-> print_string "<FLOAT> "; print_string (string_of_float d)
	| Not x      -> print_string "<NOT> "	; print_newline ();
					print_code (depth + 1) x
	| Neg x      -> print_string "<NEG> "	; print_newline (); 
					print_code (depth + 1) x
	| AdHoc (x, y) -> print_string "<ADHOC> "	; print_newline ();
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| Add (x, y) -> print_string "<ADD> "	; print_newline ();
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| Sub (x, y) -> print_string "<SUB> "	; print_newline ();
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| Mul (x, y) -> print_string "<MUL> "	; print_newline ();
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| Div (x, y) -> print_string "<DIV> "	; print_newline ();
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| FNeg x  	 -> print_string "<FNEG> "	; print_newline ();
					print_code (depth + 1) x
	| FAdd (x, y)-> print_string "<FADD> "	; print_newline (); 
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| FSub (x, y)-> print_string "<FSUB> "	; print_newline (); 
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| FMul (x, y)-> print_string "<FMUL> "	; print_newline (); 
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| FDiv (x, y)-> print_string "<FDIV> "	; print_newline (); 
					print_code (depth + 1) x; 
					print_code (depth + 1) y
	| Floor x  	 -> print_string "<Floor> "	; print_newline ();
					print_code (depth + 1) x
	| Sqrt x  	 -> print_string "<Sqrt> "	; print_newline ();
					print_code (depth + 1) x
	| FtoI x  	 -> print_string "<FtoI> "	; print_newline ();
					print_code (depth + 1) x
	| ItoF x  	 -> print_string "<ItoF> "	; print_newline ();
					print_code (depth + 1) x
	| Eq (x, y)	 -> print_string "<EQ> "	; print_newline ();
					print_code (depth + 1) x;
					print_code (depth + 1) y
	| LE (x, y)	 -> print_string "<LE> "	; print_newline ();
					print_code (depth + 1) x;
					print_code (depth + 1) y
	| If (x, e1, e2)	 	 -> print_string "<IF>"; print_newline ();
								print_code (depth + 1)  x;
								print_indent depth; print_string "<THEN>"; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<ELSE>"; print_newline ();
								print_code (depth + 1) e2
	| Let ((x, t), e1, e2)	 -> print_string "<LET> "	 ;
								Id.print_t x    		 ; print_string " ------ Type : "; Type.print_code t;
								print_code (depth + 1) e1; 
								print_indent depth; print_string "<IN>"; print_newline ();
								(*print_code (depth + 1) e2*)
								print_code depth e2
	| Var (x, _)			 -> print_string "<VAR> "	 ; Id.print_t x;
	| Fun (args, e, _)		 ->	print_string "<FUN> "	 ; print_newline ();
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter print_t_tuple args;
								print_string " </ARGS>"; print_newline ();
								print_code (depth + 1) e
	| LetRec ({name = ((x, t), _); args = yts; body = e1}, e2)
							 -> print_string "<LETREC> " ; 
								Id.print_t x    		 ; print_string " ------ Type : "; Type.print_code t;
								print_indent (depth + 1); print_string "<ARGS> ";
								List.iter print_t_tuple yts;
								print_string " </ARGS>"; print_newline ();
								print_code (depth + 1) e1;
								print_indent depth; print_string "<IN>"; print_newline ();
								(*print_code (depth + 1) e2*)
								print_code depth e2
	| App (x, xs) 		 	 -> print_string "<APP> "	 ; print_newline ();
								print_code (depth + 1)  x;
								print_indent (depth + 1) ; print_string "<ARGS> "; print_newline ();
								List.iter (print_code (depth + 2)) xs
	| Tuple xs  		 	 -> print_string "<TUPLE> "	 ; print_newline ();
								List.iter (print_code (depth + 1)) xs
	| LetTuple (xts, y, e)   -> print_string "<LETTUPLE> " ; print_newline ();
								print_indent (depth + 1); print_string "<TUPLE> ";
								List.iter print_t_tuple xts;
								print_string "</TUPLE> "; print_newline ();
								print_code (depth + 1)  y;
								print_indent depth; print_string "<IN>"; print_newline ();
								(*print_code (depth + 1)  e*)
								print_code depth e
	| Array (x, y)     	 	 -> print_string "<ARRAY> "	 ; print_newline ();
								print_code (depth + 1)  x;
								print_code (depth + 1)  y
	| Get (x, y)     		 -> print_string "<GET> "	 ; print_newline ();
								print_code (depth + 1)  x;
								print_code (depth + 1)  y
	| Put (x, y, z) 		 -> print_string "<PUT> "	 ; print_newline ();
								print_code (depth + 1)  x;
								print_code (depth + 1)  y;
								print_code (depth + 1)  z
	| ShiftIL (x, y)     	 -> print_string "<SHIFT_INT_LEFT> "; print_newline ();
								print_code (depth + 1)  x;
								print_code (depth + 1)  y
	| ShiftIR (x, y)     	 -> print_string "<SHIFT_INT_RIGHT> "; print_newline ();
								print_code (depth + 1)  x;
								print_code (depth + 1)  y
	| Read_I x      -> print_string "<Read_Int> "	; print_newline ();
					print_code (depth + 1) x
	| Read_F x      -> print_string "<Read_Float> "	; print_newline ();
					print_code (depth + 1) x
	| Out x 		-> print_string "<Out> "		; print_newline ();
					print_code (depth + 1) x

and print_code depth expr = print_syntax depth expr; is_already_newline newline_flag
