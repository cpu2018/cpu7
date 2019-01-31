let rec write_ppm_header _ =
(
	print_char 80;
	print_char (48 + 3);
	print_char 10;
	print_int 10;
	print_char 32;
	print_int 10;
	print_char 32;
	print_int 255;
	print_char 10
)
in

let rec paint_red _ =
(
	print_int 255;
	print_char 32;
	print_int 0;
	print_char 32;
	print_int 0;
	print_char 10
)
in

let rec paint_row x =
	if x = 0 then
		paint_red ()
	else
		(paint_red ();
		paint_row (x - 1))
in

let rec paint_all x y =
	if x = 0 then
		paint_row y
	else
		(paint_row y;
		paint_all (x - 1) y)
in
write_ppm_header ();
