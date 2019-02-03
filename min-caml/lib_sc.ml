let print_external_methods oc = Printf.fprintf oc
"reverse_flag60:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else234
	blr
sc_beq_else234:
	li	r2, 0
	blr
add_flag62:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else235
	fneg	f0, f0
	blr
sc_beq_else235:
	blr
while165:
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else236
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
sc_ble_else236:
	fmr	f0, f1
	blr
while268:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, sc_ble_else237
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else238
	fsub	f0, f0, f1
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
sc_ble_else238:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
sc_ble_else237:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi72:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while165
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while268
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin75:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, lo16(lsc176)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc176)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc176)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(lsc177)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc177)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc177)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, lo16(lsc178)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc178)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc178)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos77:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, lo16(lsc179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc179)
	lfd	f3, 0(r31)
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, lo16(lsc180)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc180)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc180)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, lo16(lsc181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc181)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin:
	lis	r31, lo16(lsc182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc182)
	lfd	f1, 0(r31)
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else239
	li	r2, 0
	b	sc_ble_cont240
sc_ble_else239:
	li	r2, 1
sc_ble_cont240:
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else241
	fneg	f0, f0
	b	sc_ble_cont242
sc_ble_else241:
sc_ble_cont242:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi72
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else244
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag60
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont245
sc_ble_else244:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont245:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else246
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	sc_ble_cont247
sc_ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc197)
	lfd	f1, 0(r31)
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else248
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos77
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	sc_ble_cont249
sc_ble_else248:
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin75
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
sc_ble_cont249:
	lwz	r2, 24(r3)
	b	add_flag62
min_caml_cos:
	lis	r31, lo16(lsc182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc182)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else250
	fneg	f0, f0
	b	sc_ble_cont251
sc_ble_else250:
sc_ble_cont251:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi72
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else253
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag60
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont254
sc_ble_else253:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont254:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else255
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag60
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont256
sc_ble_else255:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont256:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc197)
	lfd	f1, 0(r31)
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else257
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos77
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	sc_ble_cont258
sc_ble_else257:
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin75
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
sc_ble_cont258:
	lwz	r2, 32(r3)
	b	add_flag62
"
