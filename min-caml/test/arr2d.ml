let a = create_array 3 (create_array 4 2.0) in
let b = a.(1) in
print_int (int_of_float b.(2))
