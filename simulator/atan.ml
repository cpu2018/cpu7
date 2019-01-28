let a = 10.0 *. atan 0.0 in (* 0 *)
let b = 10.0 *. atan 1.0 in (* 8 *)
let c = 10.0 *. atan -1.0 in (* -8 *)
let d = 10.0 *. atan 5.0 in (* 14 *)
let e = 10.0 *. atan -5.0 in (* -14 *)
print_int (int_of_float a);
print_int (int_of_float b);
print_int (int_of_float c);
print_int (int_of_float d);
print_int (int_of_float e)
