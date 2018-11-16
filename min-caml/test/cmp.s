	.text
	.globl _min_caml_start
	.align 2
compare.3:
	cmpw	cr7, r5, r2
	bgt	cr7, ble_else.12
	sub	r2, r2, r5
	b	min_caml_print_int
ble_else.12:
	add	r2, r2, r5
	b	min_caml_print_int
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
#	main program starts
	li	r2, 1
	li	r5, 2
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	compare.3
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	main program ends
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
