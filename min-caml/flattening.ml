open Closure

let g env =
	

let rec f print_flag prog =
	let flatten_prog = g env prog in
	if print_flag = 1
	then
		(print_prog 0 flatten_prog;
		 flatten_prog)
	else
		flatten_prog
