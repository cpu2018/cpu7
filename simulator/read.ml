let a = create_array 3 3 in
a.(0) <- read_int ();
a.(1) <- read_int ();
a.(2) <- read_int ();
print_int a.(2);
print_int a.(1)
