let size = 100 in

let rec write_ppm_header size =
(
	print_char 80;
	print_char (48 + 3);
	print_char 10;
	print_int size;
	print_char 32;
	print_int size;
	print_char 32;
	print_int 255;
	print_char 10
)
in

let rec paint_red x =
(
	print_int (int_of_float (fabs (255.0 *. (sin (float_of_int x)))));
	print_char 32;
	print_int 0;
	print_char 32;
	print_int 0;
	print_char 10
)
in

let rec paint_row x =
	if x = 0 then
		paint_red x
	else
		(paint_red x;
		paint_row (x - 1))
in

let rec paint_all x y =
	if x = 0 then
		paint_row y
	else
		(paint_row y;
		paint_all (x - 1) y)
in

write_ppm_header size;
paint_all size size
