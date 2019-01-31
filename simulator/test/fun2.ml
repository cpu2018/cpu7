let rec f x y z = x + y + z in
let rec g x = f x 2 3 in
print_int (g 1);
print_int (f 1 2 3)
