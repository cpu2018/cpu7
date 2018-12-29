	.data
	.literal8
l.96:	 # 4.000000
	1082130432
l.95:	 # 0.000000
	0
l.94:	 # 1.000000
	1065353216
l.93:	 # 2.000000
	1073741824
l.92:	 # 2.437500
	1075576832
l.91:	 # 0.437500
	1054867456
l.90:	 # 3.141593
	1078530011
l.89:	 # 0.060035
	1031137221
l.88:	 # 0.089764
	1035458158
l.87:	 # 0.111111
	1038323256
l.86:	 # -0.142857
	-1106097883
l.85:	 # 0.200000
	1045220557
l.84:	 # 0.333333
	1051372202
	.text
	.globl _min_caml_start
	.align 2
kernel_atan.35:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, ha16(l.84)
	addi	r31, r31, lo16(l.84)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, ha16(l.85)
	addi	r31, r31, lo16(l.85)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, ha16(l.86)
	addi	r31, r31, lo16(l.86)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(l.87)
	addi	r31, r31, lo16(l.87)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, ha16(l.88)
	addi	r31, r31, lo16(l.88)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, ha16(l.89)
	addi	r31, r31, lo16(l.89)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan.37:
	lis	r31, ha16(l.90)
	addi	r31, r31, lo16(l.90)
	lfd	f1, 0(r31)
	stfd	f0, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fabs
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l.91)
	addi	r31, r31, lo16(l.91)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.102
	lis	r31, ha16(l.92)
	addi	r31, r31, lo16(l.92)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.103
	lis	r31, ha16(l.96)
	addi	r31, r31, lo16(l.96)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	lis	r31, ha16(l.94)
	addi	r31, r31, lo16(l.94)
	lfd	f2, 0(r31)
	fsub	f2, f0, f2
	lis	r31, ha16(l.94)
	addi	r31, r31, lo16(l.94)
	lfd	f3, 0(r31)
	fadd	f0, f0, f3
	fdiv	f0, f2, f0
	stfd	f1, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_atan.35
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.95)
	addi	r31, r31, lo16(l.95)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.104
	blr
ble_else.104:
	fneg	f0, f0
	blr
ble_else.103:
	lis	r31, ha16(l.93)
	addi	r31, r31, lo16(l.93)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	lis	r31, ha16(l.94)
	addi	r31, r31, lo16(l.94)
	lfd	f2, 0(r31)
	fdiv	f0, f2, f0
	stfd	f1, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_atan.35
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.95)
	addi	r31, r31, lo16(l.95)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.105
	blr
ble_else.105:
	fneg	f0, f0
	blr
ble_else.102:
	lfd	f0, 0(r3)
	b	kernel_atan.35
_min_caml_start:
	blr
