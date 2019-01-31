let a = create_array 3 4.2 in
a.(2) <- 5.1;
let b = a.(0) in
print_int a.(1);
(*
print_int (int_of_float b)
*)
