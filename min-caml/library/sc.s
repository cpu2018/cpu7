	.data
	.literal8
l.179:	 # 4.000000
	1082130432
l.166:	 # 3.141593
	1078530011
l.165:	 # 720.000000
	1144258560
l.164:	 # 24.000000
	1103101952
l.163:	 # 1.000000
	1065353216
l.162:	 # 5040.000000
	1167949824
l.161:	 # 120.000000
	1123024896
l.160:	 # 3.000000
	1077936128
l.156:	 # 2.000000
	1073741824
	.text
	.globl _min_caml_start
	.align 2
reverse_flag.52:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.221
	li	r2, 1
	blr
beq_else.221:
	li	r2, 0
	blr
add_flag.54:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.222
	fneg	f0, f0
	blr
beq_else.222:
	blr
while1.57:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.223
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
ble_else.223:
	fmr	f0, f1
	blr
while2.60:
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else.224
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.225
	fsub	f0, f0, f1
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.60
ble_else.225:
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.60
ble_else.224:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi.64:
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while1.57
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while2.60
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin.67:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, ha16(l.160)
	addi	r31, r31, lo16(l.160)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(l.161)
	addi	r31, r31, lo16(l.161)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, ha16(l.162)
	addi	r31, r31, lo16(l.162)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos.69:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, ha16(l.163)
	addi	r31, r31, lo16(l.163)
	lfd	f3, 0(r31)
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, ha16(l.164)
	addi	r31, r31, lo16(l.164)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, ha16(l.165)
	addi	r31, r31, lo16(l.165)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin.71:
	lis	r31, ha16(l.166)
	addi	r31, r31, lo16(l.166)
	lfd	f0, 0(r31)
	stfd	f0, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fispos
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fabs
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi.64
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.226
	fsub	f0, f0, f1
	lwz	r2, 12(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag.52
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	ble_cont.227
ble_else.226:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont.227:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.228
	fsub	f0, f2, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	ble_cont.229
ble_else.228:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont.229:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(l.179)
	addi	r31, r31, lo16(l.179)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.230
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos.69
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont.231
ble_else.230:
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin.67
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont.231:
	lwz	r2, 24(r3)
	b	add_flag.54
min_caml_cos.73:
	lis	r31, ha16(l.166)
	addi	r31, r31, lo16(l.166)
	lfd	f0, 0(r31)
	li	r5, 1
	stw	r5, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fabs
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi.64
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.233
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag.52
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	ble_cont.234
ble_else.233:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont.234:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.235
	fsub	f0, f2, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag.52
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	ble_cont.236
ble_else.235:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont.236:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(l.179)
	addi	r31, r31, lo16(l.179)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.237
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos.69
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont.238
ble_else.237:
	lis	r31, ha16(l.156)
	addi	r31, r31, lo16(l.156)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin.67
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont.238:
	lwz	r2, 32(r3)
	b	add_flag.54
_min_caml_start:
	blr
