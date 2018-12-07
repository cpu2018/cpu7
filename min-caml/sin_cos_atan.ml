let rec min_caml_sin x =
	   x
	-. x *. x *. x /. 6.0
	+. x *. x *. x *. x *. x /. 120.0
	-. x *. x *. x *. x *. x *. x *. x /. 5040.0
	+. x *. x *. x *. x *. x *. x *. x *. x *. x /. 362880.0
	-. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 39916800.0
	+. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 6227020800.0
in
let rec min_caml_cos x = 
	   1.0
	-. x *. x /. 2.0
	+. x *. x *. x *. x /. 24.0
	-. x *. x *. x *. x *. x *. x /. 720.0
	+. x *. x *. x *. x *. x *. x *. x *. x /. 40320.0
	-. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 3628800.0
	+. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 479001600.0
in
let rec min_caml_atan x =
	   x
	-. x *. x *. x /. 3.0
	+. x *. x *. x *. x *. x /. 5.0
	-. x *. x *. x *. x *. x *. x *. x /. 7.0
	+. x *. x *. x *. x *. x *. x *. x *. x *. x /. 9.0
	-. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 11.0
	+. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x *. x /. 13.0
in 
let a = min_caml_sin 1.0 in
let b = min_caml_cos 1.0 in
let c = min_caml_atan 1.0 in
let d = a +. b +. c in
print_int d
