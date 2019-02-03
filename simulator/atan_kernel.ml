let rec kernel_atan x =
	let x2 = x *. x in
	let x3 = x *. x2 in
	let x5 = x3 *. x2 in
	let x7 = x5 *. x2 in
	let x9 = x7 *. x2 in
	let x11 = x9 *. x2 in
	let x13 = x11 *. x2 in
	x -. 0.3333333 *. x3 +. 0.2 *. x5 -. 0.142857142 *. x7 +. 0.111111104 *. x9 -. 0.08976446 *. x11 +. 0.060035485 *. x13
in
let a = kernel_atan 0.5 in
print_int (int_of_float (10.0 *. a));
print_char 10
