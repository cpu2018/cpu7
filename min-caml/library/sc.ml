let rec reverse_flag flag = if flag then false else flag
in
let rec add_flag x flag = if flag then x else -. x
in
let rec while1 x p = if x >= p then p *. 2.0 else p
in
let rec while2 x p pi =
	if x >= 2.0 *. pi 
	then 
		(if x >= p then
			let x = x -. p in while2 x (p /. 2.0) pi
		else
			while2 x (p /. 2.0) pi)
	else x, p
in
let rec reduction_2pi x pi =
	let p = pi *. 2.0 in
	let p = while1 x p in
	let (x, p) = while2 x p pi in 
	x
in
let rec kernel_sin x =
	let x2 = x *. x in
	let x3 = x *. x2 in
	let x5 = x3 *. x2 in
	let x7 = x5 *. x2 in
	x -. x3 /. 3.0 +. x5 /. 120.0 -. x7 /. 5040.0
in
let rec kernel_cos x =
	let x2 = x *. x in
	let x4 = x2 *. x2 in
	let x6 = x4 *. x2 in
	1.0 -. x2 /. 2.0 +. x4 /. 24.0 -. x6 /. 720.0
in
let rec min_caml_sin x =
	let pi = 3.1415927410125732421875 in
	let flag = fispos x in
	let x = fabs x in
	let x = reduction_2pi x pi in
	let (x, flag) = 
		if x >= pi then (x -. pi), (reverse_flag flag) else x, flag
	in
	let (x, flag) =
		if x >= pi /. 2.0 then (pi -. x), flag else x, flag
	in
	let ans = 
		(if x <= pi /. 4.0 then kernel_sin x
		else let x = pi /. 2.0 -. x in kernel_cos x)
	in add_flag ans flag
in
let rec min_caml_cos x =
	let pi = 3.1415927410125732421875 in
	let flag = true in
	let x = fabs x in
	let x = reduction_2pi x pi in
	let (x, flag) = 
		if x >= pi then (x -. pi), (reverse_flag flag) else x, flag
	in
	let (x, flag) =
		if x >= pi /. 2.0 then (pi -. x), (reverse_flag flag) else x, flag
	in
	let ans = 
		(if x <= pi /. 4.0 then kernel_cos x
		else let x = pi /. 2.0 -. x in kernel_sin x)
	in add_flag ans flag
in
print_int (min_caml_sin 1.0);
print_int (min_caml_cos 1.0)
