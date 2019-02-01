let rec dec x = x *. 10.0 in
let a = dec 3.0 in
print_int (int_of_float a)
