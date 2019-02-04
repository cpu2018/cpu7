let a = 10.0 *. cos 0.0 in (* 1 *)
let b = 10.0 *. cos 1.0 in (* -4 *)
let c = 10.0 *. cos (-. 1.0) in (* -4 *)
let d = 10.0 *. cos 5.0 in (* 3 *)
let e = 10.0 *. cos (-. 5.0) in (* 3 *)
print_int (int_of_float a);
print_char 10;
print_int (int_of_float b);
print_char 10;
print_int (int_of_float c);
print_char 10;
print_int (int_of_float d);
print_char 10;
print_int (int_of_float e);
print_char 10
