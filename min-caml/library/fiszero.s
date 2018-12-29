	.data
	.literal8
l.5:	 # 0.000000
	0
	.text
	.globl _min_caml_start
	.align 2
min_caml_fiszero.2:
	lis	r31, ha16(l.5)
	addi	r31, r31, lo16(l.5)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7
	li	r2, 1
	blr
beq_else.7:
	li	r2, 0
	blr
_min_caml_start:
	blr
