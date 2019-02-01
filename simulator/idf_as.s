	.data
l12:
	1077936128
l11:
	0
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 50000
	lis	r31, ha16(l12)
	addi	r31, r31, lo16(l12)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	f5
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	ftoi	r2, f0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	min_caml_fin
f5:
	lis	r31, ha16(l11)
	addi	r31, r31, lo16(l11)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	blr
min_caml_fin:
