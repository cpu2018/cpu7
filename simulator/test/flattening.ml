let a = (1, (2, 3)) in
let (b, c) = a in
let (d, e) = c in
print_int (b + d + e)
