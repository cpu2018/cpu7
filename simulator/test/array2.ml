let a = create_array 3 4 in
let b = create_array 5 6.0 in
print_int a.(1);
print_int (int_of_float b.(2))
