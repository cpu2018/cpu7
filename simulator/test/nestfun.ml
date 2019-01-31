let rec f x = 
	let rec g y = y + 1 in
	g x + 1
in print_int (f 1)
