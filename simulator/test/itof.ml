let rec f x y =
	let a = 128.0 /. float_of_int x in
	print_int (int_of_float a)
in f 512 512
