let rec gcd m n =
	let ans =
		(if m = 0 then n + 0 else
		if m <= n then gcd m (n - m) + 0 else
		gcd n (m - n) + 0)
	in
	ans + 0
in
print_int (gcd 21600 337500)
