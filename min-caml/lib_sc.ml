let print_external_methods oc = Printf.fprintf oc
"reverse_flag.55:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else.225
	blr
sc_beq_else.225:
	li	r2, 0
	blr
add_flag.57:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else.226
	fneg	f0, f0
	blr
sc_beq_else.226:
	blr
while1.60:
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.227
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
sc_ble_else.227:
	fmr	f0, f1
	blr
while2.63:
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, sc_ble_else.228
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.229
	fsub	f0, f0, f1
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.63
sc_ble_else.229:
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.63
sc_ble_else.228:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi.67:
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while1.60
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while2.63
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin.70:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, ha16(lsc.166)
	addi	r31, r31, lo16(lsc.166)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(lsc.167)
	addi	r31, r31, lo16(lsc.167)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, ha16(lsc.168)
	addi	r31, r31, lo16(lsc.168)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos.72:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, ha16(lsc.169)
	addi	r31, r31, lo16(lsc.169)
	lfd	f3, 0(r31)
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, ha16(lsc.170)
	addi	r31, r31, lo16(lsc.170)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, ha16(lsc.171)
	addi	r31, r31, lo16(lsc.171)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin.74:
	lis	r31, ha16(lsc.172)
	addi	r31, r31, lo16(lsc.172)
	lfd	f1, 0(r31)
	lis	r31, ha16(lsc.173)
	addi	r31, r31, lo16(lsc.173)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else.230
	li	r2, 0
	b	sc_ble_cont.231
sc_ble_else.230:
	li	r2, 1
sc_ble_cont.231:
	lis	r31, ha16(lsc.173)
	addi	r31, r31, lo16(lsc.173)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else.232
	fneg	f0, f0
	b	sc_ble_cont.233
sc_ble_else.232:
sc_ble_cont.233:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi.67
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.235
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag.55
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont.236
sc_ble_else.235:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont.236:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.237
	fsub	f0, f2, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	sc_ble_cont.238
sc_ble_else.237:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont.238:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.186)
	addi	r31, r31, lo16(lsc.186)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.239
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos.72
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	sc_ble_cont.240
sc_ble_else.239:
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin.70
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
sc_ble_cont.240:
	lwz	r2, 24(r3)
	b	add_flag.57
min_caml_cos.76:
	lis	r31, ha16(lsc.172)
	addi	r31, r31, lo16(lsc.172)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, ha16(lsc.173)
	addi	r31, r31, lo16(lsc.173)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else.241
	fneg	f0, f0
	b	sc_ble_cont.242
sc_ble_else.241:
sc_ble_cont.242:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi.67
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.244
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag.55
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont.245
sc_ble_else.244:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont.245:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.246
	fsub	f0, f2, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag.55
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont.247
sc_ble_else.246:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont.247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.186)
	addi	r31, r31, lo16(lsc.186)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else.248
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos.72
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	sc_ble_cont.249
sc_ble_else.248:
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin.70
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
sc_ble_cont.249:
	lwz	r2, 32(r3)
	b	add_flag.57
"
