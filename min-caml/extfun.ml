open Syntax

let dummy_pos = {ls = 0; le = 0; chs = 0; che = 0}

let rec g env = function
	| Not e -> Not (g env e)
	| Neg e -> Neg (g env e)
	| AdHoc (e1, e2) -> AdHoc (g env e1, g env e2)
	| Add (e1, e2) -> Add (g env e1, g env e2)
	| Sub (e1, e2) -> Sub (g env e1, g env e2)
	| Mul (e1, e2) -> Mul (g env e1, g env e2)
	| Div (e1, e2) -> Div (g env e1, g env e2)
	| FNeg e -> FNeg (g env e)
	| FAdd (e1, e2) -> FAdd (g env e1, g env e2)
	| FSub (e1, e2) -> FSub (g env e1, g env e2)
	| FMul (e1, e2) -> FMul (g env e1, g env e2)
	| FDiv (e1, e2) -> FDiv (g env e1, g env e2)
	| Floor e -> Floor (g env e)
	| Sqrt e -> Sqrt (g env e)
	| FtoI e -> FtoI (g env e)
	| ItoF e -> ItoF (g env e)
	| Eq (e1, e2) -> Eq (g env e1, g env e2)
	| LE (e1, e2) -> LE (g env e1, g env e2)
	| If (e1, e2, e3) -> If (g env e1, g env e2, g env e3)
	| Let ((x, t), e1, e2) -> Let ((x, t), g env e1, g (M.add x t env) e2)
	| Fun (args, e, pos) -> Fun (args, g env e, pos)
	| LetRec ({name = ((x, t), pos); args = yts; body = e1}, e2) -> 
		LetRec ({name = ((x, t), pos); 
				args = yts;
				body = g env e1}, 
				g (M.add x t env) e2)
	| App (Var("create_array", _), argc::argv::[]) when not (M.mem "create_array" env) -> 
		Array (g env argc, g env argv)
	| App (Var("floor", _), arg::[]) when not (M.mem "floor" env) -> 
		Floor (g env arg)
	| App (Var("sqrt", _), arg::[]) when not (M.mem "sqrt" env) -> 
		Sqrt (g env arg)
	| App (Var("int_of_float", _), arg::[]) when not (M.mem "int_of_float" env) -> 
		FtoI (g env arg)
	| App (Var("float_of_int", _), arg::[]) when not (M.mem "float_of_int" env) -> 
		ItoF (g env arg)
	| App (Var("read_int", _), arg::[]) when not (M.mem "read_int" env) -> 
		Read_I (g env arg)
	| App (Var("read_float", _), arg::[]) when not (M.mem "read_float" env) -> 
		Read_F (g env arg)
	| App (Var("fabs", pos), arg::[]) when not (M.mem "fabs" env) -> 
		let arg' = g env arg in
		If (LE (arg', Float (0.0, pos)), FNeg(arg'), arg')
	| App (Var("fsqr", _), arg::[]) when not (M.mem "fsqr" env) -> 
		let arg' = g env arg in
		FMul (arg', arg')
	| App (Var("fiszero", pos), arg::[]) when not (M.mem "fiszero" env) -> 
		Eq (g env arg, Float (0.0, pos))
	| App (Var("fispos", pos), arg::[]) when not (M.mem "fispos" env) -> 
		Not (LE (g env arg, Float (0.0, pos)))
	| App (Var("fisneg", pos), arg::[]) when not (M.mem "fisneg" env) -> 
		Not (LE (Float (0.0, pos), g env arg))
	| App (Var("fhalf", pos), arg::[]) when not (M.mem "fhalf" env) -> 
		FMul (g env arg, Float(0.5, pos))
	| App (Var("fneg", _), arg::[]) when not (M.mem "fneg" env) -> 
		FNeg (g env arg)
	| App (Var("fless", _), arg1::arg2::[]) when not (M.mem "fless" env) -> 
		Not (LE (g env arg2, g env arg1))
	| App (Var("print_char", _), arg::[]) when not (M.mem "print_char" env) -> 
		Out (g env arg)
	| App (e, es) -> App (g env e, List.map (g env) es)
	| Tuple xts -> Tuple (List.map (g env) xts)
	| LetTuple (xts, e1, e2) -> LetTuple (xts, g env e1, g (M.add_list xts env) e2)
	| Array (e1, e2) -> Array (g env e1, g env e2)
	| Get (e1, e2) -> Get (g env e1, g env e2)
	| Put (e1, e2, e3) -> Put (g env e1, g env e2, g env e3)
	| ShiftIL (e1, e2) -> ShiftIL (g env e1, g env e2)
	| ShiftIR (e1, e2) -> ShiftIR (g env e1, g env e2)
	| Read_I e -> Read_I (g env e)
	| Read_F e -> Read_F (g env e)
	| Out e -> Out (g env e)
	| e -> e

let f p_flag e = 
	let e' = g M.empty e in
	(if p_flag = 1 then 
		(print_string "<dump after extfun>\n=================================================================================================\n"; 
	 	print_code 0 e';
		print_string "=================================================================================================\n\n") 
	 else ());
	e'
