let rec div10 i = ((i << 7) + (i << 6) + (i << 3) + (i << 2) + i) >> 11
in
let rec out i = let a = i + 48 in print_int a
in
let rec print_int_main i =
	let divided = div10 i in
	let out_value = i - (divided << 4) - (divided << 2) in
	if divided = 0 
	then
		out out_value
	else 
		(print_int_main divided;
		out out_value)
in
let rec min_caml_print_int i = print_int_main i
in
min_caml_print_int 10
