let rec compare x y =
	if x < y then print_int (x + y) else print_int (x - y)
in
let a = 1 in
let b = 2 in
compare a b
