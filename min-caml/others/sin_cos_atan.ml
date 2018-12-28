let rec min_caml_resize_pi x =
	let pi2 = 6.28318530718 in
	if fabs x > pi2
	then
		(if fisneg x 
		then 
			x -. (floor (x /. pi2) +. 1.0) *. pi2 
		else 
			x -. floor (x /. pi2) *. pi2)
	else
		x
in
let rec min_caml_sin x =
	let x1 = min_caml_resize_pi x in
	let x2 = x1 *. x1 in
	let x3 = x1 *. x2 in
	let x5 = x3 *. x2 in
	let x7 = x5 *. x2 in
	let x9 = x7 *. x2 in
	let x11 = x9 *. x2 in
	x1 -. x3 /. 6.0 +. x5 /. 120.0 -. x7 /. 5040.0 +. x9 /. 362880.0 -. x11 /. 39916800.0
in
let rec min_caml_cos x = 
	let x1 = min_caml_resize_pi x in
	let x2 = x1 *. x1 in
	let x4 = x2 *. x2 in
	let x6 = x4 *. x2 in
	let x8 = x6 *. x2 in
	let x10 = x8 *. x2 in
	1.0 -. x2 /. 2.0 +. x4 /. 24.0 -. x6 /. 720.0 +. x8 /. 40320.0 -. x10 /. 3628800.0
in
let rec min_caml_atan x =
	let x1 = min_caml_resize_pi x in
	let x2 = x1 *. x1 in
	let x3 = x1 *. x2 in
	let x5 = x3 *. x2 in
	let x7 = x5 *. x2 in
	let x9 = x7 *. x2 in
	let x11 = x9 *. x2 in
	x1 -. x3 /. 3.0 +. x5 /. 5.0 -. x7 /. 7.0 +. x9 /. 9.0 -. x11 /. 11.0
in
()
(*
let a = min_caml_sin 1.0 in
let b = min_caml_cos 1.0 in
let c = min_caml_atan 1.0 in
let d = a +. b +. c in
print_int (int_of_float d)
*)
