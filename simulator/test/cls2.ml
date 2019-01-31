let pi = 3.14 in
let rec min_caml_resize_pi x = floor (x +. pi) in
let rec sin y =
	let x = min_caml_resize_pi y in
	x -. x *. x /. 12.0
in
let rec cos y = 
	let x = min_caml_resize_pi y in
	x +. x *. x /. 14.0
in
()

