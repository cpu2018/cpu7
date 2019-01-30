let a = create_array 4 5 in
let b = create_float_array 5 6.0 in
a.(2) <- 2;
b.(2) <- 2.3;
a.(3) <- -3;
b.(3) <- -.7.8;
print_int a.(1);
print_int (int_of_float b.(1));
print_int a.(2);
print_int (int_of_float b.(2));
print_int a.(3);
print_int (int_of_float b.(3))
