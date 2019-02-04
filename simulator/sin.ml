let a = 10.0 *. sin 0.0 in (* 0 *)
let b = 10.0 *. sin 1.0 in (* 8 *)
let c = fabs (10.0 *. sin (-. 1.0)) in (* -8 *)
let d = fabs (10.0 *. sin 5.0) in (* -10 *)
let e = fabs (10.0 *. sin (-. 5.0)) in (* 10 *)
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
