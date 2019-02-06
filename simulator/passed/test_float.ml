let rec btoi x = if x then 1 else 0 in
print_int (int_of_float (fhalf 123.456));
print_char 10;
print_int (int_of_float (fneg (-123.456)));
print_char 10;
print_int (btoi (fless 1.0 2.0));
print_char 10;
print_int (btoi (fless 1.0 1.0));
print_char 10;
print_int (int_of_float (fsqr 2.0));
print_char 10
