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
let rec min_caml_atan x =
	let pi = 3.1415927410125732421875 in
	let xabs = fabs x in
	if xabs < 0.4375 then kernel_atan x
	else if xabs > 2.4375 then 
		let ans = pi /. 2.0 -. kernel_atan (1.0 /. xabs) in
		if x < 0.0 then -. ans else ans
	else
		let ans = pi /. 4.0 +. kernel_atan ((xabs -. 1.0) /. (xabs +. 1.0)) in
		if x < 0.0 then -. ans else ans
in 
print_int(min_caml_atan 1.0)
