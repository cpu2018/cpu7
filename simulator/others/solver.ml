objects.(0) <- 0;
objects.(1) <- 1;
let rec solver index =
	let m = objects.(index) in
	print_int m
in
solver 1
