let print_external_methods oc = Printf.fprintf oc
"kernel_atan.36:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, ha16(latan.86)
	addi	r31, r31, lo16(latan.86)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, ha16(latan.87)
	addi	r31, r31, lo16(latan.87)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, ha16(latan.88)
	addi	r31, r31, lo16(latan.88)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(latan.89)
	addi	r31, r31, lo16(latan.89)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, ha16(latan.90)
	addi	r31, r31, lo16(latan.90)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, ha16(latan.91)
	addi	r31, r31, lo16(latan.91)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan.38:
	lis	r31, ha16(latan.92)
	addi	r31, r31, lo16(latan.92)
	lfd	f1, 0(r31)
	lis	r31, ha16(latan.93)
	addi	r31, r31, lo16(latan.93)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, atan_ble_else.104
	fneg	f2, f0
	b	atan_ble_cont.105
atan_ble_else.104:
	fmr	f2, f0
atan_ble_cont.105:
	lis	r31, ha16(latan.94)
	addi	r31, r31, lo16(latan.94)
	lfd	f3, 0(r31)
	fcmpu	cr7, f3, f2
	bgt	cr7, atan_ble_else.106
	lis	r31, ha16(latan.95)
	addi	r31, r31, lo16(latan.95)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, atan_ble_else.107
	lis	r31, ha16(latan.98)
	addi	r31, r31, lo16(latan.98)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	lis	r31, ha16(latan.97)
	addi	r31, r31, lo16(latan.97)
	lfd	f3, 0(r31)
	fsub	f3, f2, f3
	lis	r31, ha16(latan.97)
	addi	r31, r31, lo16(latan.97)
	lfd	f4, 0(r31)
	fadd	f2, f2, f4
	fdiv	f2, f3, f2
	stfd	f0, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	kernel_atan.36
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(latan.93)
	addi	r31, r31, lo16(latan.93)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else.108
	blr
atan_ble_else.108:
	fneg	f0, f0
	blr
atan_ble_else.107:
	lis	r31, ha16(latan.96)
	addi	r31, r31, lo16(latan.96)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	lis	r31, ha16(latan.97)
	addi	r31, r31, lo16(latan.97)
	lfd	f3, 0(r31)
	fdiv	f2, f3, f2
	stfd	f0, 0(r3)
	stfd	f1, 16(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_atan.36
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(latan.93)
	addi	r31, r31, lo16(latan.93)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else.109
	blr
atan_ble_else.109:
	fneg	f0, f0
	blr
atan_ble_else.106:
	b	kernel_atan.36

"
