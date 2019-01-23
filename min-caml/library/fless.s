	.data
	.literal8
l.8:	 # 0.000000
	0
	.text
	.globl _min_caml_start
	.align 2
min_caml_fless.3:
	lis	r31, ha16(l.8)
	addi	r31, r31, lo16(l.8)
	lfd	f2, 0(r31)
	fadd	f0, f0, f2
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.10
	li	r2, 0
	blr
ble_else.10:
	li	r2, 1
	blr
_min_caml_start:
	blr
