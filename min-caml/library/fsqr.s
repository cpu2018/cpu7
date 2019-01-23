	.text
	.globl _min_caml_start
	.align 2
min_caml_fsqr.1:
	fmul	f0, f0, f0
	blr
_min_caml_start:
	blr
