let rec g x = x + 1 in
let rec f x = x + g x in
print_int (f 1)
