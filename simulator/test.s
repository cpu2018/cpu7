	.text
	.align 2
	.globl _min_caml_start
int:
	li	r10, 10
	blr
_min_caml_start:
	bl	int
	li	r6, 10
	li	r10, 9
