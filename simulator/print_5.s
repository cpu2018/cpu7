	.text
	.globl _min_caml_start
	.align 2
min_caml_print_int:
	addi	r2, r2, 48
	out	r2
	blr
_min_caml_start:
	li	r2, 3
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
