let rec ackcps x y k =
	if x <= 0 then k (y + 1)
	else if y <= 0 then ackcps (x - 1) 1 k
	else ackcps x (y - 1) (fun r -> ackcps (x - 1) r k)
in 
ackcps 3 10 (fun r -> print_string (string_of_int r))
