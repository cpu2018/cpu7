let print_external_methods oc = Printf.fprintf oc
"kernel_atan36:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, ha16(latan86)
	addi	r31, r31, lo16(latan86)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, ha16(latan87)
	addi	r31, r31, lo16(latan87)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, ha16(latan88)
	addi	r31, r31, lo16(latan88)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(latan89)
	addi	r31, r31, lo16(latan89)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, ha16(latan90)
	addi	r31, r31, lo16(latan90)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, ha16(latan91)
	addi	r31, r31, lo16(latan91)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan38:
	lis	r31, ha16(latan92)
	addi	r31, r31, lo16(latan92)
	lfd	f1, 0(r31)
	lis	r31, ha16(latan93)
	addi	r31, r31, lo16(latan93)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, atan_ble_else104
	fneg	f2, f0
	b	atan_ble_cont105
atan_ble_else104:
	fmr	f2, f0
atan_ble_cont105:
	lis	r31, ha16(latan94)
	addi	r31, r31, lo16(latan94)
	lfd	f3, 0(r31)
	fcmpu	cr7, f3, f2
	bgt	cr7, atan_ble_else106
	lis	r31, ha16(latan95)
	addi	r31, r31, lo16(latan95)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, atan_ble_else107
	lis	r31, ha16(latan98)
	addi	r31, r31, lo16(latan98)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	lis	r31, ha16(latan97)
	addi	r31, r31, lo16(latan97)
	lfd	f3, 0(r31)
	fsub	f3, f2, f3
	lis	r31, ha16(latan97)
	addi	r31, r31, lo16(latan97)
	lfd	f4, 0(r31)
	fadd	f2, f2, f4
	fdiv	f2, f3, f2
	stfd	f0, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	kernel_atan36
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(latan93)
	addi	r31, r31, lo16(latan93)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else108
	blr
atan_ble_else108:
	fneg	f0, f0
	blr
atan_ble_else107:
	lis	r31, ha16(latan96)
	addi	r31, r31, lo16(latan96)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	lis	r31, ha16(latan97)
	addi	r31, r31, lo16(latan97)
	lfd	f3, 0(r31)
	fdiv	f2, f3, f2
	stfd	f0, 0(r3)
	stfd	f1, 16(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_atan36
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(latan93)
	addi	r31, r31, lo16(latan93)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else109
	blr
atan_ble_else109:
	fneg	f0, f0
	blr
atan_ble_else106:
	b	kernel_atan36
"
