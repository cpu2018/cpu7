let a = create_array 3 2.0 in
let rec create_array a = a + 1 in
print_int (create_array 2)
