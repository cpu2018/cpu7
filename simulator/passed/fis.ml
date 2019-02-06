let n = -1.0 in
let z = 0.0 in
let p = 1.0 in
let rec btoi x = if x then 1 else 0 in
print_int (btoi (fisneg n)); print_char 10;
print_int (btoi (fisneg z)); print_char 10;
print_int (btoi (fisneg p)); print_char 10;
print_int (btoi (fiszero n)); print_char 10;
print_int (btoi (fiszero z)); print_char 10;
print_int (btoi (fiszero p)); print_char 10;
print_int (btoi (fispos n)); print_char 10;
print_int (btoi (fispos z)); print_char 10;
print_int (btoi (fispos p)); print_char 10

