	.text
	.globl _min_caml_start
	.align 2
min_caml_fneg.1:
	fneg	f0, f0
	blr
_min_caml_start:
	blr
