	.data
	.literal8
	.align 3
l.5714:	 # 128.000000
	.long	0
	.long	1080033280
	.align 3
l.5681:	 # 0.900000
	.long	-858993459
	.long	1072483532
	.align 3
l.5680:	 # 0.200000
	.long	-1717986918
	.long	1070176665
	.align 3
l.5586:	 # 150.000000
	.long	0
	.long	1080213504
	.align 3
l.5584:	 # -150.000000
	.long	0
	.long	-1067270144
	.align 3
l.5568:	 # 0.100000
	.long	-1717986918
	.long	1069128089
	.align 3
l.5565:	 # -2.000000
	.long	0
	.long	-1073741824
	.align 3
l.5563:	 # 0.003906
	.long	0
	.long	1064304640
	.align 3
l.5541:	 # 20.000000
	.long	0
	.long	1077149696
	.align 3
l.5540:	 # 0.050000
	.long	-1717986918
	.long	1068079513
	.align 3
l.5536:	 # 0.250000
	.long	0
	.long	1070596096
	.align 3
l.5532:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.5528:	 # 0.300000
	.long	858993459
	.long	1070805811
	.align 3
l.5527:	 # 255.000000
	.long	0
	.long	1081073664
	.align 3
l.5526:	 # 0.500000
	.long	0
	.long	1071644672
	.align 3
l.5525:	 # 0.150000
	.long	858993459
	.long	1069757235
	.align 3
l.5523:	 # 3.141593
	.long	1518260631
	.long	1074340347
	.align 3
l.5522:	 # 30.000000
	.long	0
	.long	1077805056
	.align 3
l.5521:	 # 15.000000
	.long	0
	.long	1076756480
	.align 3
l.5520:	 # 0.000100
	.long	-350469331
	.long	1058682594
	.align 3
l.5477:	 # 100000000.000000
	.long	0
	.long	1100470148
	.align 3
l.5473:	 # 1000000000.000000
	.long	0
	.long	1104006501
	.align 3
l.5453:	 # -0.100000
	.long	-1717986918
	.long	-1078355559
	.align 3
l.5440:	 # 0.010000
	.long	1202590843
	.long	1065646817
	.align 3
l.5439:	 # -0.200000
	.long	-1717986918
	.long	-1077306983
	.align 3
l.5248:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.5214:	 # -200.000000
	.long	0
	.long	-1066860544
	.align 3
l.5212:	 # 200.000000
	.long	0
	.long	1080623104
	.align 3
l.5208:	 # 0.017453
	.long	-1433277178
	.long	1066524486
	.align 3
l.5125:	 # -1.000000
	.long	0
	.long	-1074790400
	.align 3
l.5124:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.5123:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
min_caml_fabs:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fabs
	blr
ble_else_fabs:
	fneg	f0, f0
	blr
min_caml_fsqr:
	fmul	f0, f0, f0
	blr
min_caml_fneg:
	fneg	f0, f0
	blr
min_Caml_sqrt:
	fsqrt	f0, f0
	blr
min_caml_floor:
	floor	f0, f0
	blr
min_caml_fhalf:
	lis	r31, ha16(lhalf)
	addi	r31, r31, lo16(lhalf)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
min_caml_fisneg:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
min_caml_fispos:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
min_caml_fiszero:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else_fis_fless
	li	r2, 1
	blr
min_caml_fless:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
ble_else_fis_fless:
	li	r2, 1
	blr

reverse_flag.52:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else_reverse_flag
	li	r2, 1
	blr
beq_else_reverse_flag
	li	r2, 0
	blr
add_flag.54:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else_add_flag
	fneg	f0, f0
	blr
beq_else_add_flag:
	blr
while1.57:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_while1
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
ble_else_while1:
	fmr	f0, f1
	blr
while2.60:
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else_while2_1
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_while2_2
	fsub	f0, f0, f1
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.60
ble_else_while2_2:
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while2.60
ble_else_while2_1:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi.64:
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
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
	lis	r31, ha16(lsc.160)
	addi	r31, r31, lo16(lsc.160)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(lsc.161)
	addi	r31, r31, lo16(lsc.161)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, ha16(lsc.162)
	addi	r31, r31, lo16(lsc.162)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos.69:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, ha16(lsc.163)
	addi	r31, r31, lo16(lsc.163)
	lfd	f3, 0(r31)
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, ha16(lsc.164)
	addi	r31, r31, lo16(lsc.164)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, ha16(lsc.165)
	addi	r31, r31, lo16(lsc.165)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin:
	lis	r31, ha16(lsc.166)
	addi	r31, r31, lo16(lsc.166)
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
	bgt	cr7, ble_else_sin_1
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
	b	ble_cont_sin_1
ble_else_sin_1:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont_sin_1:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_sin_2
	fsub	f0, f2, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	ble_cont_sin_2
ble_else_sin_2:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont_sin_2:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.179)
	addi	r31, r31, lo16(lsc.179)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_sin_3
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos.69
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont_sin_3
ble_else_sin_3:
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
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
ble_cont_sin_3:
	lwz	r2, 24(r3)
	b	add_flag.54
min_caml_cos:
	lis	r31, ha16(lsc.166)
	addi	r31, r31, lo16(lsc.166)
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
	bgt	cr7, ble_else_cos_1
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
	b	ble_cont_cos_1
ble_else_cos_1:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont_cos_1:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_cos_2
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
	b	ble_cont_cos_2
ble_else_cos_2:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont_cos_2:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc.179)
	addi	r31, r31, lo16(lsc.179)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_cos_3
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos.69
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont_cos_3
ble_else_cos_3:
	lis	r31, ha16(lsc.156)
	addi	r31, r31, lo16(lsc.156)
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
ble_cont_cos_3:
	lwz	r2, 32(r3)
	b	add_flag.54
kernel_atan.35:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, ha16(latan.84)
	addi	r31, r31, lo16(latan.84)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, ha16(latan.85)
	addi	r31, r31, lo16(latan.85)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, ha16(latan.86)
	addi	r31, r31, lo16(latan.86)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(latan.87)
	addi	r31, r31, lo16(latan.87)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, ha16(latan.88)
	addi	r31, r31, lo16(latan.88)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, ha16(latan.89)
	addi	r31, r31, lo16(latan.89)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan:
	lis	r31, ha16(latan.90)
	addi	r31, r31, lo16(latan.90)
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
	lis	r31, ha16(latan.91)
	addi	r31, r31, lo16(latan.91)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_atan_1
	lis	r31, ha16(latan.92)
	addi	r31, r31, lo16(latan.92)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else_atan_2
	lis	r31, ha16(latan.96)
	addi	r31, r31, lo16(latan.96)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	lis	r31, ha16(latan.94)
	addi	r31, r31, lo16(latan.94)
	lfd	f2, 0(r31)
	fsub	f2, f0, f2
	lis	r31, ha16(latan.94)
	addi	r31, r31, lo16(latan.94)
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
	lis	r31, ha16(latan.95)
	addi	r31, r31, lo16(latan.95)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else_atan_3
	blr
ble_else_atan_3:
	fneg	f0, f0
	blr
ble_else_atan_2:
	lis	r31, ha16(latan.93)
	addi	r31, r31, lo16(latan.93)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	lis	r31, ha16(latan.94)
	addi	r31, r31, lo16(latan.94)
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
	lis	r31, ha16(latan.95)
	addi	r31, r31, lo16(latan.95)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else_atan_4
	blr
ble_else_atan_4:
	fneg	f0, f0
	blr
ble_else_atan_1:
	lfd	f0, 0(r3)
	b	kernel_atan.35
div10:
	slwi	r5, r2, 7
	slwi	r6, r2, 6
	add	r5, r5, r6
	slwi	r6, r2, 3
	add	r5, r5, r6
	slwi	r6, r2, 2
	add	r5, r5, r6
	add	r2, r5, r2
	srwi	r2, r2, 11
	blr
print_int_main:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	div10
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	slwi	r5, r2, 3
	lwz	r6, 0(r3)
	sub	r5, r6, r5
	slwi	r6, r2, 1
	sub	r5, r5, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else_print_int
	mr	r2, r5
	addi	r2, r2, 48
	out	r2
	blr
beq_else_print_int:
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	print_int_main
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r2, r2, 48
	out	r2
	blr
min_caml_print_int:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int_main
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	blr
min_caml_create_array:	
	mr	r6, r2
	mr	r2, r4
create_array_loop:
	cmpwi	cr7, r6, 0
	bne	cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	blr
create_array_cont:
	stw	r5, 0(r4)
	subi  	r6, r6, 1
	addi	r4, r4, 4
	b	create_array_loop
min_caml_create_float_array:
	mr	r5, r2
	mr	r2, r4
create_float_array_loop:
	cmpwi	cr7, r5, 0
	bne	cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfd	f0, 0(r4)
	subi	r5, r5, 1
	addi	r4, r4, 8
	b	create_float_array_loop
xor.2461:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7731
	mr	r2, r5
	blr
beq_else.7731:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7732
	li	r2, 1
	blr
beq_else.7732:
	li	r2, 0
	blr
sgn.2464:
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fiszero
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7733
	lfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fispos
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7734
	lis	r31, ha16(l.5125)
	addi	r31, r31, lo16(l.5125)
	lfd	f0, 0(r31)
	blr
beq_else.7734:
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	blr
beq_else.7733:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	blr
fneg_cond.2466:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7735
	b	min_caml_fneg
beq_else.7735:
	blr
add_mod5.2469:
	add	r2, r2, r5
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else.7736
	subi	r2, r2, 5
	blr
bge_else.7736:
	blr
vecset.2472:
	stfd	f0, 0(r2)
	stfd	f1, 8(r2)
	stfd	f2, 16(r2)
	blr
vecfill.2477:
	stfd	f0, 0(r2)
	stfd	f0, 8(r2)
	stfd	f0, 16(r2)
	blr
vecbzero.2480:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	b	vecfill.2477
veccpy.2482:
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lfd	f0, 16(r5)
	stfd	f0, 16(r2)
	blr
vecunit_sgn.2490:
	lfd	f0, 0(r2)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fsqr
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fsqr
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	stfd	f0, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fsqr
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fadd	f0, f1, f0
	fsqrt	f0, f0
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fiszero
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7740
	lwz	r2, 0(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7742
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lfd	f1, 24(r3)
	fdiv	f0, f0, f1
	b	beq_cont.7743
beq_else.7742:
	lis	r31, ha16(l.5125)
	addi	r31, r31, lo16(l.5125)
	lfd	f0, 0(r31)
	lfd	f1, 24(r3)
	fdiv	f0, f0, f1
beq_cont.7743:
	b	beq_cont.7741
beq_else.7740:
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
beq_cont.7741:
	lwz	r2, 4(r3)
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lfd	f1, 8(r2)
	fmul	f1, f1, f0
	stfd	f1, 8(r2)
	lfd	f1, 16(r2)
	fmul	f0, f1, f0
	stfd	f0, 16(r2)
	blr
veciprod.2493:
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	lfd	f2, 16(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
veciprod2.2496:
	lfd	f3, 0(r2)
	fmul	f0, f3, f0
	lfd	f3, 8(r2)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum.2501:
	lfd	f1, 0(r2)
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 8(r5)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 8(r2)
	lfd	f1, 16(r2)
	lfd	f2, 16(r5)
	fmul	f0, f0, f2
	fadd	f0, f1, f0
	stfd	f0, 16(r2)
	blr
vecadd.2505:
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	lfd	f1, 8(r5)
	fadd	f0, f0, f1
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	lfd	f1, 16(r5)
	fadd	f0, f0, f1
	stfd	f0, 16(r2)
	blr
vecscale.2511:
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lfd	f1, 8(r2)
	fmul	f1, f1, f0
	stfd	f1, 8(r2)
	lfd	f1, 16(r2)
	fmul	f0, f1, f0
	stfd	f0, 16(r2)
	blr
vecaccumv.2514:
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	lfd	f2, 0(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	lfd	f1, 16(r5)
	lfd	f2, 16(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 16(r2)
	blr
o_texturetype.2518:
	lwz	r2, 0(r2)
	blr
o_form.2520:
	lwz	r2, 4(r2)
	blr
o_reflectiontype.2522:
	lwz	r2, 8(r2)
	blr
o_isinvert.2524:
	lwz	r2, 24(r2)
	blr
o_isrot.2526:
	lwz	r2, 12(r2)
	blr
o_param_a.2528:
	lwz	r2, 16(r2)
	lfd	f0, 0(r2)
	blr
o_param_b.2530:
	lwz	r2, 16(r2)
	lfd	f0, 8(r2)
	blr
o_param_c.2532:
	lwz	r2, 16(r2)
	lfd	f0, 16(r2)
	blr
o_param_abc.2534:
	lwz	r2, 16(r2)
	blr
o_param_x.2536:
	lwz	r2, 20(r2)
	lfd	f0, 0(r2)
	blr
o_param_y.2538:
	lwz	r2, 20(r2)
	lfd	f0, 8(r2)
	blr
o_param_z.2540:
	lwz	r2, 20(r2)
	lfd	f0, 16(r2)
	blr
o_diffuse.2542:
	lwz	r2, 28(r2)
	lfd	f0, 0(r2)
	blr
o_hilight.2544:
	lwz	r2, 28(r2)
	lfd	f0, 8(r2)
	blr
o_color_red.2546:
	lwz	r2, 32(r2)
	lfd	f0, 0(r2)
	blr
o_color_green.2548:
	lwz	r2, 32(r2)
	lfd	f0, 8(r2)
	blr
o_color_blue.2550:
	lwz	r2, 32(r2)
	lfd	f0, 16(r2)
	blr
o_param_r1.2552:
	lwz	r2, 36(r2)
	lfd	f0, 0(r2)
	blr
o_param_r2.2554:
	lwz	r2, 36(r2)
	lfd	f0, 8(r2)
	blr
o_param_r3.2556:
	lwz	r2, 36(r2)
	lfd	f0, 16(r2)
	blr
o_param_ctbl.2558:
	lwz	r2, 40(r2)
	blr
p_rgb.2560:
	lwz	r2, 0(r2)
	blr
p_intersection_points.2562:
	lwz	r2, 4(r2)
	blr
p_surface_ids.2564:
	lwz	r2, 8(r2)
	blr
p_calc_diffuse.2566:
	lwz	r2, 12(r2)
	blr
p_energy.2568:
	lwz	r2, 16(r2)
	blr
p_received_ray_20percent.2570:
	lwz	r2, 20(r2)
	blr
p_group_id.2572:
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	blr
p_set_group_id.2574:
	lwz	r2, 24(r2)
	stw	r5, 0(r2)
	blr
p_nvectors.2577:
	lwz	r2, 28(r2)
	blr
d_vec.2579:
	lwz	r2, 0(r2)
	blr
d_const.2581:
	lwz	r2, 4(r2)
	blr
r_surface_id.2583:
	lwz	r2, 0(r2)
	blr
r_dvec.2585:
	lwz	r2, 4(r2)
	blr
r_bright.2587:
	lfd	f0, 8(r2)
	blr
rad.2589:
	lis	r31, ha16(l.5208)
	addi	r31, r31, lo16(l.5208)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
read_screen_settings.2591:
	lwz	r2, 20(r30)
	lwz	r5, 16(r30)
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	stw	r5, 12(r3)
	stw	r8, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_float
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_float
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_float
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 16(r2)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_float
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad.2589
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_cos
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_sin
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_read_float
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2589
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_cos
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	stfd	f0, 56(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_sin
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f2, f1, f0
	lis	r31, ha16(l.5212)
	addi	r31, r31, lo16(l.5212)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	lwz	r2, 12(r3)
	stfd	f2, 0(r2)
	lis	r31, ha16(l.5214)
	addi	r31, r31, lo16(l.5214)
	lfd	f2, 0(r31)
	lfd	f3, 40(r3)
	fmul	f2, f3, f2
	stfd	f2, 8(r2)
	lfd	f2, 56(r3)
	fmul	f4, f1, f2
	lis	r31, ha16(l.5212)
	addi	r31, r31, lo16(l.5212)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	stfd	f4, 16(r2)
	lwz	r5, 8(r3)
	stfd	f2, 0(r5)
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f4, 0(r31)
	stfd	f4, 8(r5)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fneg
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lfd	f0, 40(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fneg
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f0, f1
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lfd	f0, 32(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fneg
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	lfd	f0, 40(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fneg
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f0, f1
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	lwz	r2, 16(r3)
	lfd	f0, 0(r2)
	lwz	r5, 12(r3)
	lfd	f1, 0(r5)
	fsub	f0, f0, f1
	lwz	r6, 0(r3)
	stfd	f0, 0(r6)
	lfd	f0, 8(r2)
	lfd	f1, 8(r5)
	fsub	f0, f0, f1
	stfd	f0, 8(r6)
	lfd	f0, 16(r2)
	lfd	f1, 16(r5)
	fsub	f0, f0, f1
	stfd	f0, 16(r6)
	blr
read_light.2593:
	lwz	r2, 8(r30)
	lwz	r5, 4(r30)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_read_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_read_float
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	rad.2589
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_sin
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fneg
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_float
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad.2589
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_cos
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_sin
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lfd	f0, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_cos
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_read_float
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	blr
rotate_quadratic_matrix.2595:
	lfd	f0, 0(r5)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_cos
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 0(r2)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_sin
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	stfd	f0, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_cos
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	stfd	f0, 24(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_sin
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_cos
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_sin
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	lfd	f2, 24(r3)
	fmul	f3, f2, f1
	lfd	f4, 32(r3)
	lfd	f5, 16(r3)
	fmul	f6, f5, f4
	fmul	f6, f6, f1
	lfd	f7, 8(r3)
	fmul	f8, f7, f0
	fsub	f6, f6, f8
	fmul	f8, f7, f4
	fmul	f8, f8, f1
	fmul	f9, f5, f0
	fadd	f8, f8, f9
	fmul	f9, f2, f0
	fmul	f10, f5, f4
	fmul	f10, f10, f0
	fmul	f11, f7, f1
	fadd	f10, f10, f11
	fmul	f11, f7, f4
	fmul	f0, f11, f0
	fmul	f1, f5, f1
	fsub	f0, f0, f1
	stfd	f0, 48(r3)
	stfd	f8, 56(r3)
	stfd	f10, 64(r3)
	stfd	f6, 72(r3)
	stfd	f9, 80(r3)
	stfd	f3, 88(r3)
	mflr	r31
	fmr	f0, f4
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fneg
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	fmul	f2, f2, f1
	lfd	f3, 8(r3)
	fmul	f1, f3, f1
	lwz	r2, 0(r3)
	lfd	f3, 0(r2)
	lfd	f4, 8(r2)
	lfd	f5, 16(r2)
	lfd	f6, 88(r3)
	stfd	f1, 96(r3)
	stfd	f2, 104(r3)
	stfd	f5, 112(r3)
	stfd	f0, 120(r3)
	stfd	f4, 128(r3)
	stfd	f3, 136(r3)
	mflr	r31
	fmr	f0, f6
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fsqr
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 80(r3)
	stfd	f0, 144(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_fsqr
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lfd	f1, 128(r3)
	fmul	f0, f1, f0
	lfd	f2, 144(r3)
	fadd	f0, f2, f0
	lfd	f2, 120(r3)
	stfd	f0, 152(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_fsqr
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f2, 152(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	lfd	f0, 72(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_fsqr
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 64(r3)
	stfd	f0, 160(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	min_caml_fsqr
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lfd	f1, 128(r3)
	fmul	f0, f1, f0
	lfd	f2, 160(r3)
	fadd	f0, f2, f0
	lfd	f2, 104(r3)
	stfd	f0, 168(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fsqr
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f2, 168(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 8(r2)
	lfd	f0, 56(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fsqr
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 48(r3)
	stfd	f0, 176(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_fsqr
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lfd	f1, 128(r3)
	fmul	f0, f1, f0
	lfd	f2, 176(r3)
	fadd	f0, f2, f0
	lfd	f2, 96(r3)
	stfd	f0, 184(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fsqr
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f2, 184(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 16(r2)
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f0, 0(r31)
	lfd	f2, 72(r3)
	lfd	f3, 136(r3)
	fmul	f4, f3, f2
	lfd	f5, 56(r3)
	fmul	f4, f4, f5
	lfd	f6, 64(r3)
	lfd	f7, 128(r3)
	fmul	f8, f7, f6
	lfd	f9, 48(r3)
	fmul	f8, f8, f9
	fadd	f4, f4, f8
	lfd	f8, 104(r3)
	fmul	f10, f1, f8
	lfd	f11, 96(r3)
	fmul	f10, f10, f11
	fadd	f4, f4, f10
	fmul	f0, f0, f4
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f0, 0(r31)
	lfd	f4, 88(r3)
	fmul	f10, f3, f4
	fmul	f5, f10, f5
	lfd	f10, 80(r3)
	fmul	f12, f7, f10
	fmul	f9, f12, f9
	fadd	f5, f5, f9
	lfd	f9, 120(r3)
	fmul	f12, f1, f9
	fmul	f11, f12, f11
	fadd	f5, f5, f11
	fmul	f0, f0, f5
	stfd	f0, 8(r2)
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f0, 0(r31)
	fmul	f3, f3, f4
	fmul	f2, f3, f2
	fmul	f3, f7, f10
	fmul	f3, f3, f6
	fadd	f2, f2, f3
	fmul	f1, f1, f9
	fmul	f1, f1, f8
	fadd	f1, f2, f1
	fmul	f0, f0, f1
	stfd	f0, 16(r2)
	blr
read_nth_object.2598:
	lwz	r5, 4(r30)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_read_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else.7754
	li	r2, 0
	blr
beq_else.7754:
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_read_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_read_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_read_float
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_read_float
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_read_float
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	stw	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_read_float
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_read_float
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_read_float
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	stfd	f0, 16(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_read_float
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fisneg
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 2
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	stw	r2, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_read_float
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_read_float
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	stfd	f0, 8(r2)
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_read_float
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_read_float
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_read_float
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7755
	b	beq_cont.7756
beq_else.7755:
	stw	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_read_float
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2589
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 0(r2)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_read_float
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2589
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 8(r2)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_read_float
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2589
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 16(r2)
beq_cont.7756:
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7757
	li	r6, 1
	b	beq_cont.7758
beq_else.7757:
	lwz	r6, 32(r3)
beq_cont.7758:
	li	r7, 4
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r6, 48(r3)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 48
	stw	r2, 40(r5)
	lwz	r2, 44(r3)
	stw	r2, 36(r5)
	lwz	r6, 40(r3)
	stw	r6, 32(r5)
	lwz	r6, 36(r3)
	stw	r6, 28(r5)
	lwz	r6, 48(r3)
	stw	r6, 24(r5)
	lwz	r6, 28(r3)
	stw	r6, 20(r5)
	lwz	r6, 24(r3)
	stw	r6, 16(r5)
	lwz	r7, 20(r3)
	stw	r7, 12(r5)
	lwz	r8, 16(r3)
	stw	r8, 8(r5)
	lwz	r8, 12(r3)
	stw	r8, 4(r5)
	lwz	r9, 8(r3)
	stw	r9, 0(r5)
	lwz	r9, 4(r3)
	slwi	r9, r9, 2
	lwz	r10, 0(r3)
	stwx	r5, r10, r9
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else.7759
	lfd	f0, 0(r6)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fiszero
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7762
	lfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	sgn.2464
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	stfd	f0, 64(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fsqr
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fdiv	f0, f1, f0
	b	beq_cont.7763
beq_else.7762:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
beq_cont.7763:
	lwz	r2, 24(r3)
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fiszero
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7764
	lfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	sgn.2464
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	stfd	f0, 80(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fsqr
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fdiv	f0, f1, f0
	b	beq_cont.7765
beq_else.7764:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
beq_cont.7765:
	lwz	r2, 24(r3)
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fiszero
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7766
	lfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	sgn.2464
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	stfd	f0, 96(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_fsqr
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fdiv	f0, f1, f0
	b	beq_cont.7767
beq_else.7766:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
beq_cont.7767:
	lwz	r2, 24(r3)
	stfd	f0, 16(r2)
	b	beq_cont.7760
beq_else.7759:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else.7768
	lwz	r5, 32(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7770
	li	r5, 1
	b	beq_cont.7771
beq_else.7770:
	li	r5, 0
beq_cont.7771:
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	vecunit_sgn.2490
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	beq_cont.7769
beq_else.7768:
beq_cont.7769:
beq_cont.7760:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7772
	b	beq_cont.7773
beq_else.7772:
	lwz	r2, 24(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	rotate_quadratic_matrix.2595
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
beq_cont.7773:
	li	r2, 1
	blr
read_object.2600:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else.7774
	blr
bge_else.7774:
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r30, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7776
	lwz	r2, 4(r3)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else.7776:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_all_object.2602:
	lwz	r30, 4(r30)
	li	r2, 0
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_net_item.2604:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_read_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else.7778
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else.7778:
	lwz	r5, 0(r3)
	addi	r6, r5, 1
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item.2604
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	stwx	r6, r2, r5
	blr
read_or_network.2606:
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_net_item.2604
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else.7779
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else.7779:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_or_network.2606
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	stwx	r6, r2, r5
	blr
read_and_network.2608:
	lwz	r5, 4(r30)
	li	r6, 0
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item.2604
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else.7780
	blr
beq_else.7780:
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	addi	r2, r5, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_parameter.2610:
	lwz	r2, 20(r30)
	lwz	r5, 16(r30)
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r8, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	mr	r30, r2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r30, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r30, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 0
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 0
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_or_network.2606
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
solver_rect_surface.2612:
	lwz	r9, 4(r30)
	slwi	r10, r6, 3
	lfdx	f3, r5, r10
	stw	r9, 0(r3)
	stfd	f2, 8(r3)
	stw	r8, 16(r3)
	stfd	f1, 24(r3)
	stw	r7, 32(r3)
	stfd	f0, 40(r3)
	stw	r5, 48(r3)
	stw	r6, 52(r3)
	stw	r2, 56(r3)
	mflr	r31
	fmr	f0, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_fiszero
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7786
	lwz	r2, 56(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_abc.2534
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 56(r3)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_isinvert.2524
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 3
	lwz	r7, 48(r3)
	lfdx	f0, r7, r6
	stw	r2, 64(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fisneg
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 64(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	xor.2461
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 3
	lwz	r7, 60(r3)
	lfdx	f0, r7, r6
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	fneg_cond.2466
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f0, f1
	lwz	r2, 52(r3)
	slwi	r2, r2, 3
	lwz	r5, 48(r3)
	lfdx	f1, r5, r2
	fdiv	f0, f0, f1
	lwz	r2, 32(r3)
	slwi	r6, r2, 3
	lfdx	f1, r5, r6
	fmul	f1, f0, f1
	lfd	f2, 24(r3)
	fadd	f1, f1, f2
	stfd	f0, 72(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fabs
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	slwi	r2, r2, 3
	lwz	r5, 60(r3)
	lfdx	f1, r5, r2
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fless
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7788
	li	r2, 0
	blr
beq_else.7788:
	lwz	r2, 16(r3)
	slwi	r5, r2, 3
	lwz	r6, 48(r3)
	lfdx	f0, r6, r5
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lfd	f2, 8(r3)
	fadd	f0, f0, f2
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fabs
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	slwi	r2, r2, 3
	lwz	r5, 60(r3)
	lfdx	f1, r5, r2
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fless
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7789
	li	r2, 0
	blr
beq_else.7789:
	lwz	r2, 0(r3)
	lfd	f0, 72(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
beq_else.7786:
	li	r2, 0
	blr
solver_rect.2621:
	lwz	r30, 4(r30)
	li	r6, 0
	li	r7, 1
	li	r8, 2
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stw	r5, 24(r3)
	stw	r2, 28(r3)
	stw	r30, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7790
	li	r6, 1
	li	r7, 2
	li	r8, 0
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 28(r3)
	lwz	r5, 24(r3)
	lwz	r30, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7791
	li	r6, 2
	li	r7, 0
	li	r8, 1
	lfd	f0, 8(r3)
	lfd	f1, 0(r3)
	lfd	f2, 16(r3)
	lwz	r2, 28(r3)
	lwz	r5, 24(r3)
	lwz	r30, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7792
	li	r2, 0
	blr
beq_else.7792:
	li	r2, 3
	blr
beq_else.7791:
	li	r2, 2
	blr
beq_else.7790:
	li	r2, 1
	blr
solver_surface.2627:
	lwz	r6, 4(r30)
	stw	r6, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	stw	r5, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc.2534
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	stw	r5, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod.2493
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fispos
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7794
	li	r2, 0
	blr
beq_else.7794:
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod2.2496
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fneg
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
quadratic.2633:
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fsqr
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_a.2528
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f1, 16(r3)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fsqr
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_b.2530
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lfd	f1, 8(r3)
	stfd	f0, 56(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fsqr
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c.2532
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lfd	f1, 56(r3)
	fadd	f0, f1, f0
	lwz	r2, 24(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_isrot.2526
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7796
	lfd	f0, 72(r3)
	blr
beq_else.7796:
	lfd	f0, 8(r3)
	lfd	f1, 16(r3)
	fmul	f2, f1, f0
	lwz	r2, 24(r3)
	stfd	f2, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r1.2552
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fmul	f0, f1, f0
	lfd	f1, 72(r3)
	fadd	f0, f1, f0
	lfd	f1, 0(r3)
	lfd	f2, 8(r3)
	fmul	f2, f2, f1
	lwz	r2, 24(r3)
	stfd	f0, 88(r3)
	stfd	f2, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r2.2554
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lfd	f1, 88(r3)
	fadd	f0, f1, f0
	lfd	f1, 16(r3)
	lfd	f2, 0(r3)
	fmul	f1, f2, f1
	lwz	r2, 24(r3)
	stfd	f0, 104(r3)
	stfd	f1, 112(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_r3.2556
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	blr
bilinear.2638:
	fmul	f6, f0, f3
	stfd	f3, 0(r3)
	stfd	f0, 8(r3)
	stfd	f5, 16(r3)
	stfd	f2, 24(r3)
	stw	r2, 32(r3)
	stfd	f4, 40(r3)
	stfd	f1, 48(r3)
	stfd	f6, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_a.2528
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	fmul	f3, f2, f1
	lwz	r2, 32(r3)
	stfd	f0, 64(r3)
	stfd	f3, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_b.2530
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lfd	f1, 64(r3)
	fadd	f0, f1, f0
	lfd	f1, 16(r3)
	lfd	f2, 24(r3)
	fmul	f3, f2, f1
	lwz	r2, 32(r3)
	stfd	f0, 80(r3)
	stfd	f3, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_c.2532
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lwz	r2, 32(r3)
	stfd	f0, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_isrot.2526
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7798
	lfd	f0, 96(r3)
	blr
beq_else.7798:
	lfd	f0, 40(r3)
	lfd	f1, 24(r3)
	fmul	f2, f1, f0
	lfd	f3, 16(r3)
	lfd	f4, 48(r3)
	fmul	f5, f4, f3
	fadd	f2, f2, f5
	lwz	r2, 32(r3)
	stfd	f2, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_r1.2552
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fmul	f0, f1, f0
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	fmul	f1, f2, f1
	lfd	f3, 0(r3)
	lfd	f4, 24(r3)
	fmul	f4, f4, f3
	fadd	f1, f1, f4
	lwz	r2, 32(r3)
	stfd	f0, 112(r3)
	stfd	f1, 120(r3)
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_r2.2554
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lfd	f1, 112(r3)
	fadd	f0, f1, f0
	lfd	f1, 40(r3)
	lfd	f2, 8(r3)
	fmul	f1, f2, f1
	lfd	f2, 0(r3)
	lfd	f3, 48(r3)
	fmul	f2, f3, f2
	fadd	f1, f1, f2
	lwz	r2, 32(r3)
	stfd	f0, 128(r3)
	stfd	f1, 136(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	o_param_r3.2556
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fhalf
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	blr
solver_second.2646:
	lwz	r6, 4(r30)
	lfd	f3, 0(r5)
	lfd	f4, 8(r5)
	lfd	f5, 16(r5)
	stw	r6, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	stw	r2, 32(r3)
	stw	r5, 36(r3)
	mflr	r31
	fmr	f2, f5
	fmr	f1, f4
	fmr	f0, f3
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	quadratic.2633
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fiszero
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7800
	lwz	r2, 36(r3)
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
	lfd	f3, 24(r3)
	lfd	f4, 16(r3)
	lfd	f5, 8(r3)
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	bilinear.2638
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lfd	f3, 8(r3)
	lwz	r2, 32(r3)
	stfd	f0, 48(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	quadratic.2633
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_form.2520
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7801
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	b	beq_cont.7802
beq_else.7801:
	lfd	f0, 56(r3)
beq_cont.7802:
	lfd	f1, 48(r3)
	stfd	f0, 64(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fsqr
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	lfd	f2, 40(r3)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fispos
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7803
	li	r2, 0
	blr
beq_else.7803:
	lfd	f0, 72(r3)
	fsqrt	f0, f0
	lwz	r2, 32(r3)
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_isinvert.2524
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7804
	lfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fneg
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont.7805
beq_else.7804:
	lfd	f0, 80(r3)
beq_cont.7805:
	lfd	f1, 48(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
beq_else.7800:
	li	r2, 0
	blr
solver.2652:
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r2, r2, 2
	lwzx	r2, r10, r2
	lfd	f0, 0(r6)
	stw	r8, 0(r3)
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	stw	r9, 12(r3)
	stw	r2, 16(r3)
	stw	r6, 20(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x.2536
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 20(r3)
	lfd	f1, 8(r2)
	lwz	r5, 16(r3)
	stfd	f0, 32(r3)
	stfd	f1, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_y.2538
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 20(r3)
	lfd	f1, 16(r2)
	lwz	r2, 16(r3)
	stfd	f0, 48(r3)
	stfd	f1, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_z.2540
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_form.2520
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7806
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7806:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7807
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7807:
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_rect_fast.2656:
	lwz	r7, 4(r30)
	lfd	f3, 0(r6)
	fsub	f3, f3, f0
	lfd	f4, 8(r6)
	fmul	f3, f3, f4
	lfd	f4, 8(r5)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	stw	r7, 0(r3)
	stfd	f0, 8(r3)
	stfd	f1, 16(r3)
	stw	r6, 24(r3)
	stfd	f2, 32(r3)
	stfd	f3, 40(r3)
	stw	r5, 48(r3)
	stw	r2, 52(r3)
	mflr	r31
	fmr	f0, f4
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_fabs
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_b.2530
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fless
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7810
	li	r2, 0
	b	beq_cont.7811
beq_else.7810:
	lwz	r2, 48(r3)
	lfd	f0, 16(r2)
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lfd	f2, 32(r3)
	fadd	f0, f0, f2
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fabs
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c.2532
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fless
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7812
	li	r2, 0
	b	beq_cont.7813
beq_else.7812:
	lwz	r2, 24(r3)
	lfd	f0, 8(r2)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fiszero
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7814
	li	r2, 1
	b	beq_cont.7815
beq_else.7814:
	li	r2, 0
beq_cont.7815:
beq_cont.7813:
beq_cont.7811:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7816
	lwz	r2, 24(r3)
	lfd	f0, 16(r2)
	lfd	f1, 16(r3)
	fsub	f0, f0, f1
	lfd	f2, 24(r2)
	fmul	f0, f0, f2
	lwz	r5, 48(r3)
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	lfd	f3, 8(r3)
	fadd	f2, f2, f3
	stfd	f0, 72(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fabs
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_a.2528
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fless
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7817
	li	r2, 0
	b	beq_cont.7818
beq_else.7817:
	lwz	r2, 48(r3)
	lfd	f0, 16(r2)
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lfd	f2, 32(r3)
	fadd	f0, f0, f2
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fabs
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_c.2532
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fless
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7819
	li	r2, 0
	b	beq_cont.7820
beq_else.7819:
	lwz	r2, 24(r3)
	lfd	f0, 24(r2)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fiszero
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7821
	li	r2, 1
	b	beq_cont.7822
beq_else.7821:
	li	r2, 0
beq_cont.7822:
beq_cont.7820:
beq_cont.7818:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7823
	lwz	r2, 24(r3)
	lfd	f0, 32(r2)
	lfd	f1, 32(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r2)
	fmul	f0, f0, f1
	lwz	r5, 48(r3)
	lfd	f1, 0(r5)
	fmul	f1, f0, f1
	lfd	f2, 8(r3)
	fadd	f1, f1, f2
	stfd	f0, 96(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_fabs
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_a.2528
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_fless
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7824
	li	r2, 0
	b	beq_cont.7825
beq_else.7824:
	lwz	r2, 48(r3)
	lfd	f0, 8(r2)
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lfd	f2, 16(r3)
	fadd	f0, f0, f2
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_fabs
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	stfd	f0, 112(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_b.2530
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 112(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_fless
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7826
	li	r2, 0
	b	beq_cont.7827
beq_else.7826:
	lwz	r2, 24(r3)
	lfd	f0, 40(r2)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_fiszero
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7828
	li	r2, 1
	b	beq_cont.7829
beq_else.7828:
	li	r2, 0
beq_cont.7829:
beq_cont.7827:
beq_cont.7825:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7830
	li	r2, 0
	blr
beq_else.7830:
	lwz	r2, 0(r3)
	lfd	f0, 96(r3)
	stfd	f0, 0(r2)
	li	r2, 3
	blr
beq_else.7823:
	lwz	r2, 0(r3)
	lfd	f0, 72(r3)
	stfd	f0, 0(r2)
	li	r2, 2
	blr
beq_else.7816:
	lwz	r2, 0(r3)
	lfd	f0, 40(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_surface_fast.2663:
	lwz	r2, 4(r30)
	lfd	f3, 0(r5)
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	stw	r5, 32(r3)
	mflr	r31
	fmr	f0, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fisneg
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7832
	li	r2, 0
	blr
beq_else.7832:
	lwz	r2, 32(r3)
	lfd	f0, 8(r2)
	lfd	f1, 24(r3)
	fmul	f0, f0, f1
	lfd	f1, 16(r2)
	lfd	f2, 16(r3)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r2)
	lfd	f2, 8(r3)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast.2669:
	lwz	r6, 4(r30)
	lfd	f3, 0(r5)
	stw	r6, 0(r3)
	stfd	f3, 8(r3)
	stw	r2, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	stfd	f0, 40(r3)
	stw	r5, 48(r3)
	mflr	r31
	fmr	f0, f3
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fiszero
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7835
	lwz	r2, 48(r3)
	lfd	f0, 8(r2)
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lfd	f2, 16(r2)
	lfd	f3, 32(r3)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lfd	f2, 24(r2)
	lfd	f4, 24(r3)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r5, 16(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r2, r5
	fmr	f2, f4
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	quadratic.2633
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_form.2520
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7837
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	b	beq_cont.7838
beq_else.7837:
	lfd	f0, 64(r3)
beq_cont.7838:
	lfd	f1, 56(r3)
	stfd	f0, 72(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fsqr
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	lfd	f2, 8(r3)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fispos
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7839
	li	r2, 0
	blr
beq_else.7839:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_isinvert.2524
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7840
	lfd	f0, 80(r3)
	fsqrt	f0, f0
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	lwz	r2, 48(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont.7841
beq_else.7840:
	lfd	f0, 80(r3)
	fsqrt	f0, f0
	lfd	f1, 56(r3)
	fadd	f0, f1, f0
	lwz	r2, 48(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont.7841:
	li	r2, 1
	blr
beq_else.7835:
	li	r2, 0
	blr
solver_fast.2675:
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r10, r10, r11
	lfd	f0, 0(r6)
	stw	r8, 0(r3)
	stw	r7, 4(r3)
	stw	r9, 8(r3)
	stw	r2, 12(r3)
	stw	r5, 16(r3)
	stw	r10, 20(r3)
	stw	r6, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r10
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_x.2536
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 24(r3)
	lfd	f1, 8(r2)
	lwz	r5, 20(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_y.2538
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	lwz	r2, 24(r3)
	lfd	f1, 16(r2)
	lwz	r2, 20(r3)
	stfd	f0, 56(r3)
	stfd	f1, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_z.2540
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	d_const.2581
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r5, 20(r3)
	stw	r2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_form.2520
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7843
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	d_vec.2579
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r6, 80(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7843:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7844
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7844:
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_surface_fast2.2679:
	lwz	r2, 4(r30)
	lfd	f0, 0(r5)
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fisneg
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7845
	li	r2, 0
	blr
beq_else.7845:
	lwz	r2, 8(r3)
	lfd	f0, 0(r2)
	lwz	r2, 4(r3)
	lfd	f1, 24(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast2.2686:
	lwz	r7, 4(r30)
	lfd	f3, 0(r5)
	stw	r7, 0(r3)
	stw	r2, 4(r3)
	stfd	f3, 8(r3)
	stw	r6, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	stfd	f0, 40(r3)
	stw	r5, 48(r3)
	mflr	r31
	fmr	f0, f3
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fiszero
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7847
	lwz	r2, 48(r3)
	lfd	f0, 8(r2)
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lfd	f1, 16(r2)
	lfd	f2, 32(r3)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r2)
	lfd	f2, 24(r3)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r5, 16(r3)
	lfd	f1, 24(r5)
	stfd	f0, 56(r3)
	stfd	f1, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fsqr
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	lfd	f2, 8(r3)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fispos
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7849
	li	r2, 0
	blr
beq_else.7849:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_isinvert.2524
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7850
	lfd	f0, 72(r3)
	fsqrt	f0, f0
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	lwz	r2, 48(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont.7851
beq_else.7850:
	lfd	f0, 72(r3)
	fsqrt	f0, f0
	lfd	f1, 56(r3)
	fadd	f0, f1, f0
	lwz	r2, 48(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont.7851:
	li	r2, 1
	blr
beq_else.7847:
	li	r2, 0
	blr
solver_fast2.2693:
	lwz	r6, 16(r30)
	lwz	r7, 12(r30)
	lwz	r8, 8(r30)
	lwz	r9, 4(r30)
	slwi	r10, r2, 2
	lwzx	r9, r9, r10
	stw	r7, 0(r3)
	stw	r6, 4(r3)
	stw	r8, 8(r3)
	stw	r9, 12(r3)
	stw	r2, 16(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_ctbl.2558
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
	lwz	r5, 20(r3)
	stw	r2, 24(r3)
	stfd	f2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f0, 48(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_const.2581
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r5, 12(r3)
	stw	r2, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_form.2520
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7853
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec.2579
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	lwz	r2, 12(r3)
	lwz	r6, 56(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7853:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7854
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	lwz	r2, 12(r3)
	lwz	r5, 56(r3)
	lwz	r6, 24(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7854:
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	lwz	r2, 12(r3)
	lwz	r5, 56(r3)
	lwz	r6, 24(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
setup_rect_table.2696:
	li	r6, 6
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fiszero
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7855
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert.2524
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fisneg
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor.2461
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_a.2528
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond.2466
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
	b	beq_cont.7856
beq_else.7855:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
beq_cont.7856:
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fiszero
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7857
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert.2524
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fisneg
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor.2461
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_b.2530
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	fneg_cond.2466
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 24(r2)
	b	beq_cont.7858
beq_else.7857:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
beq_cont.7858:
	lwz	r5, 4(r3)
	lfd	f0, 16(r5)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fiszero
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7859
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert.2524
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 16(r5)
	stw	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fisneg
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	xor.2461
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_c.2532
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	fneg_cond.2466
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 32(r2)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fdiv	f0, f0, f1
	stfd	f0, 40(r2)
	b	beq_cont.7860
beq_else.7859:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 40(r2)
beq_cont.7860:
	blr
setup_surface_table.2699:
	li	r6, 4
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_a.2528
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_b.2530
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f1, 24(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	lwz	r2, 0(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_c.2532
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fispos
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7862
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	b	beq_cont.7863
beq_else.7862:
	lis	r31, ha16(l.5125)
	addi	r31, r31, lo16(l.5125)
	lfd	f0, 0(r31)
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_a.2528
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fneg
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_b.2530
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fneg
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c.2532
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fneg
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
beq_cont.7863:
	blr
setup_second_table.2702:
	li	r6, 5
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	lfd	f1, 8(r5)
	lfd	f2, 16(r5)
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	quadratic.2633
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 0(r2)
	lwz	r5, 0(r3)
	stfd	f0, 16(r3)
	stfd	f1, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a.2528
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fneg
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 32(r3)
	stfd	f1, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_b.2530
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fneg
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	lwz	r5, 0(r3)
	stfd	f0, 48(r3)
	stfd	f1, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c.2532
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fneg
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	lfd	f1, 16(r3)
	stfd	f1, 0(r2)
	lwz	r5, 0(r3)
	stfd	f0, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_isrot.2526
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7865
	lwz	r2, 8(r3)
	lfd	f0, 32(r3)
	stfd	f0, 8(r2)
	lfd	f0, 48(r3)
	stfd	f0, 16(r2)
	lfd	f0, 64(r3)
	stfd	f0, 24(r2)
	b	beq_cont.7866
beq_else.7865:
	lwz	r2, 4(r3)
	lfd	f0, 16(r2)
	lwz	r5, 0(r3)
	stfd	f0, 72(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_r2.2554
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 80(r3)
	stfd	f1, 88(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r3.2556
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fhalf
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	lfd	f0, 16(r5)
	lwz	r6, 0(r3)
	stfd	f0, 96(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r1.2552
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 0(r2)
	lwz	r5, 0(r3)
	stfd	f0, 104(r3)
	stfd	f1, 112(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_r3.2556
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_fhalf
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
	lwz	r6, 0(r3)
	stfd	f0, 120(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_r1.2552
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 0(r2)
	lwz	r2, 0(r3)
	stfd	f0, 128(r3)
	stfd	f1, 136(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	o_param_r2.2554
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fhalf
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
beq_cont.7866:
	lfd	f0, 16(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fiszero
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7867
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fdiv	f0, f0, f1
	lwz	r2, 8(r3)
	stfd	f0, 32(r2)
	b	beq_cont.7868
beq_else.7867:
beq_cont.7868:
	lwz	r2, 8(r3)
	blr
iter_setup_dirvec_constants.2705:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.7869
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r6, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_const.2581
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec.2579
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_form.2520
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7870
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_rect_table.2696
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont.7871
beq_else.7870:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7872
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_surface_table.2699
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont.7873
beq_else.7872:
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_second_table.2702
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
beq_cont.7873:
beq_cont.7871:
	subi	r5, r5, 1
	lwz	r2, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.7869:
	blr
setup_dirvec_constants.2708:
	lwz	r5, 8(r30)
	lwz	r30, 4(r30)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
setup_startp_constants.2710:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.7875
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r6, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_ctbl.2558
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2520
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	lfd	f0, 0(r5)
	lwz	r6, 12(r3)
	stw	r2, 20(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x.2536
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 0(r2)
	lwz	r5, 8(r3)
	lfd	f0, 8(r5)
	lwz	r6, 12(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y.2538
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 8(r2)
	lwz	r5, 8(r3)
	lfd	f0, 16(r5)
	lwz	r6, 12(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_z.2540
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 16(r2)
	lwz	r5, 20(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7876
	lwz	r5, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_abc.2534
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	lfd	f0, 0(r5)
	lfd	f1, 8(r5)
	lfd	f2, 16(r5)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod2.2496
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
	b	beq_cont.7877
beq_else.7876:
	cmpwi	cr7, r5, 2
	bgt	cr7, ble_else.7878
	b	ble_cont.7879
ble_else.7878:
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
	lwz	r6, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	quadratic.2633
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7880
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont.7881
beq_else.7880:
beq_cont.7881:
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
ble_cont.7879:
beq_cont.7877:
	lwz	r2, 4(r3)
	subi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.7875:
	blr
setup_startp.2713:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	veccpy.2482
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	lwz	r2, 0(r2)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
is_rect_outside.2715:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fabs
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a.2528
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fless
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7884
	li	r2, 0
	b	beq_cont.7885
beq_else.7884:
	lfd	f0, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fabs
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_b.2530
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fless
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7886
	li	r2, 0
	b	beq_cont.7887
beq_else.7886:
	lfd	f0, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fabs
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_c.2532
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fless
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont.7887:
beq_cont.7885:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7888
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert.2524
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7889
	li	r2, 1
	blr
beq_else.7889:
	li	r2, 0
	blr
beq_else.7888:
	lwz	r2, 16(r3)
	b	o_isinvert.2524
is_plane_outside.2720:
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc.2534
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod2.2496
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_isinvert.2524
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f0, 32(r3)
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fisneg
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	xor.2461
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7891
	li	r2, 1
	blr
beq_else.7891:
	li	r2, 0
	blr
is_second_outside.2725:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	quadratic.2633
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2520
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7893
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	b	beq_cont.7894
beq_else.7893:
	lfd	f0, 8(r3)
beq_cont.7894:
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert.2524
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f0, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fisneg
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor.2461
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7895
	li	r2, 1
	blr
beq_else.7895:
	li	r2, 0
	blr
is_outside.2730:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x.2536
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y.2538
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_z.2540
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_form.2520
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7897
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_rect_outside.2715
beq_else.7897:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7898
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_plane_outside.2720
beq_else.7898:
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_second_outside.2725
check_all_inside.2735:
	lwz	r6, 4(r30)
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else.7899
	li	r2, 1
	blr
beq_else.7899:
	slwi	r7, r7, 2
	lwzx	r6, r6, r7
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r5, 24(r3)
	stw	r30, 28(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	is_outside.2730
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7900
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r5, 24(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7900:
	li	r2, 0
	blr
shadow_check_and_group.2741:
	lwz	r6, 28(r30)
	lwz	r7, 24(r30)
	lwz	r8, 20(r30)
	lwz	r9, 16(r30)
	lwz	r10, 12(r30)
	lwz	r11, 8(r30)
	lwz	r12, 4(r30)
	slwi	r13, r2, 2
	lwzx	r13, r5, r13
	cmpwi	cr7, r13, -1
	bne	cr7, beq_else.7901
	li	r2, 0
	blr
beq_else.7901:
	slwi	r13, r2, 2
	lwzx	r13, r5, r13
	stw	r12, 0(r3)
	stw	r11, 4(r3)
	stw	r10, 8(r3)
	stw	r5, 12(r3)
	stw	r30, 16(r3)
	stw	r2, 20(r3)
	stw	r8, 24(r3)
	stw	r13, 28(r3)
	stw	r7, 32(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r13
	mr	r30, r6
	mr	r6, r11
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	lfd	f0, 0(r5)
	stfd	f0, 40(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7903
	li	r2, 0
	b	beq_cont.7904
beq_else.7903:
	lis	r31, ha16(l.5439)
	addi	r31, r31, lo16(l.5439)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fless
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont.7904:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7905
	lwz	r2, 28(r3)
	slwi	r2, r2, 2
	lwz	r5, 24(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert.2524
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7906
	li	r2, 0
	blr
beq_else.7906:
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7905:
	lis	r31, ha16(l.5440)
	addi	r31, r31, lo16(l.5440)
	lfd	f0, 0(r31)
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lwz	r2, 8(r3)
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	lwz	r5, 4(r3)
	lfd	f2, 0(r5)
	fadd	f1, f1, f2
	lfd	f2, 8(r2)
	fmul	f2, f2, f0
	lfd	f3, 8(r5)
	fadd	f2, f2, f3
	lfd	f3, 16(r2)
	fmul	f0, f3, f0
	lfd	f3, 16(r5)
	fadd	f0, f0, f3
	li	r2, 0
	lwz	r5, 12(r3)
	lwz	r30, 0(r3)
	mflr	r31
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7907
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7907:
	li	r2, 1
	blr
shadow_check_one_or_group.2744:
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	slwi	r8, r2, 2
	lwzx	r8, r5, r8
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else.7908
	li	r2, 0
	blr
beq_else.7908:
	slwi	r8, r8, 2
	lwzx	r7, r7, r8
	li	r8, 0
	stw	r5, 0(r3)
	stw	r30, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r8
	mr	r30, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7909
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7909:
	li	r2, 1
	blr
shadow_check_one_or_matrix.2747:
	lwz	r6, 20(r30)
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else.7910
	li	r2, 0
	blr
beq_else.7910:
	stw	r11, 0(r3)
	stw	r8, 4(r3)
	stw	r5, 8(r3)
	stw	r30, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else.7911
	li	r2, 1
	b	beq_cont.7912
beq_else.7911:
	stw	r7, 20(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r12
	mr	r30, r6
	mr	r6, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7913
	li	r2, 0
	b	beq_cont.7914
beq_else.7913:
	lwz	r2, 20(r3)
	lfd	f0, 0(r2)
	lis	r31, ha16(l.5453)
	addi	r31, r31, lo16(l.5453)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fless
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7915
	li	r2, 0
	b	beq_cont.7916
beq_else.7915:
	li	r2, 1
	lwz	r5, 0(r3)
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7917
	li	r2, 0
	b	beq_cont.7918
beq_else.7917:
	li	r2, 1
beq_cont.7918:
beq_cont.7916:
beq_cont.7914:
beq_cont.7912:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7919
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7919:
	li	r2, 1
	lwz	r5, 0(r3)
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7920
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7920:
	li	r2, 1
	blr
solve_each_element.2750:
	lwz	r7, 36(r30)
	lwz	r8, 32(r30)
	lwz	r9, 28(r30)
	lwz	r10, 24(r30)
	lwz	r11, 20(r30)
	lwz	r12, 16(r30)
	lwz	r13, 12(r30)
	lwz	r14, 8(r30)
	lwz	r15, 4(r30)
	slwi	r16, r2, 2
	lwzx	r16, r5, r16
	cmpwi	cr7, r16, -1
	bne	cr7, beq_else.7921
	blr
beq_else.7921:
	stw	r12, 0(r3)
	stw	r14, 4(r3)
	stw	r13, 8(r3)
	stw	r15, 12(r3)
	stw	r8, 16(r3)
	stw	r7, 20(r3)
	stw	r9, 24(r3)
	stw	r6, 28(r3)
	stw	r5, 32(r3)
	stw	r30, 36(r3)
	stw	r2, 40(r3)
	stw	r11, 44(r3)
	stw	r16, 48(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r16
	mr	r30, r10
	mr	r6, r8
	stw	r31, 52(r3)
	addi	r3, r3, 56
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7923
	lwz	r2, 48(r3)
	slwi	r2, r2, 2
	lwz	r5, 44(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert.2524
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7924
	blr
beq_else.7924:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7923:
	lwz	r5, 24(r3)
	lfd	f1, 0(r5)
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 52(r3)
	stfd	f1, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fless
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7926
	b	beq_cont.7927
beq_else.7926:
	lwz	r2, 20(r3)
	lfd	f1, 0(r2)
	lfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_fless
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7928
	b	beq_cont.7929
beq_else.7928:
	lis	r31, ha16(l.5440)
	addi	r31, r31, lo16(l.5440)
	lfd	f0, 0(r31)
	lfd	f1, 56(r3)
	fadd	f0, f1, f0
	lwz	r2, 28(r3)
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	lwz	r5, 16(r3)
	lfd	f2, 0(r5)
	fadd	f1, f1, f2
	lfd	f2, 8(r2)
	fmul	f2, f2, f0
	lfd	f3, 8(r5)
	fadd	f2, f2, f3
	lfd	f3, 16(r2)
	fmul	f3, f3, f0
	lfd	f4, 16(r5)
	fadd	f3, f3, f4
	li	r5, 0
	lwz	r6, 32(r3)
	lwz	r30, 12(r3)
	stfd	f3, 64(r3)
	stfd	f2, 72(r3)
	stfd	f1, 80(r3)
	stfd	f0, 88(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 100(r3)
	addi	r3, r3, 104
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7930
	b	beq_cont.7931
beq_else.7930:
	lwz	r2, 20(r3)
	lfd	f0, 88(r3)
	stfd	f0, 0(r2)
	lfd	f0, 80(r3)
	lfd	f1, 72(r3)
	lfd	f2, 64(r3)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	vecset.2472
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 48(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 52(r3)
	stw	r5, 0(r2)
beq_cont.7931:
beq_cont.7929:
beq_cont.7927:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network.2754:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.7932
	blr
beq_else.7932:
	slwi	r9, r9, 2
	lwzx	r8, r8, r9
	li	r9, 0
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
trace_or_matrix.2758:
	lwz	r7, 20(r30)
	lwz	r8, 16(r30)
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r5, r12
	lwz	r13, 0(r12)
	cmpwi	cr7, r13, -1
	bne	cr7, beq_else.7934
	blr
beq_else.7934:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r13, 99
	bne	cr7, beq_else.7936
	li	r7, 1
	mflr	r31
	mr	r5, r12
	mr	r2, r7
	mr	r30, r11
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont.7937
beq_else.7936:
	stw	r12, 16(r3)
	stw	r11, 20(r3)
	stw	r7, 24(r3)
	stw	r9, 28(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r13
	mr	r30, r10
	mr	r6, r8
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7938
	b	beq_cont.7939
beq_else.7938:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fless
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7940
	b	beq_cont.7941
beq_else.7940:
	li	r2, 1
	lwz	r5, 16(r3)
	lwz	r6, 0(r3)
	lwz	r30, 20(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.7941:
beq_cont.7939:
beq_cont.7937:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection.2762:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l.5473)
	addi	r31, r31, lo16(l.5473)
	lfd	f0, 0(r31)
	stfd	f0, 0(r6)
	li	r8, 0
	lwz	r7, 0(r7)
	stw	r6, 0(r3)
	mflr	r31
	mr	r6, r2
	mr	r30, r5
	mr	r5, r7
	mr	r2, r8
	stw	r31, 4(r3)
	addi	r3, r3, 8
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f1, 0(r2)
	lis	r31, ha16(l.5453)
	addi	r31, r31, lo16(l.5453)
	lfd	f0, 0(r31)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fless
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7943
	li	r2, 0
	blr
beq_else.7943:
	lis	r31, ha16(l.5477)
	addi	r31, r31, lo16(l.5477)
	lfd	f1, 0(r31)
	lfd	f0, 8(r3)
	b	min_caml_fless
solve_each_element_fast.2764:
	lwz	r7, 36(r30)
	lwz	r8, 32(r30)
	lwz	r9, 28(r30)
	lwz	r10, 24(r30)
	lwz	r11, 20(r30)
	lwz	r12, 16(r30)
	lwz	r13, 12(r30)
	lwz	r14, 8(r30)
	lwz	r15, 4(r30)
	stw	r12, 0(r3)
	stw	r14, 4(r3)
	stw	r13, 8(r3)
	stw	r15, 12(r3)
	stw	r8, 16(r3)
	stw	r7, 20(r3)
	stw	r10, 24(r3)
	stw	r30, 28(r3)
	stw	r11, 32(r3)
	stw	r6, 36(r3)
	stw	r9, 40(r3)
	stw	r5, 44(r3)
	stw	r2, 48(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	d_vec.2579
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else.7944
	blr
beq_else.7944:
	lwz	r8, 36(r3)
	lwz	r30, 40(r3)
	stw	r2, 52(r3)
	stw	r6, 56(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7946
	lwz	r2, 56(r3)
	slwi	r2, r2, 2
	lwz	r5, 32(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_isinvert.2524
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7947
	blr
beq_else.7947:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7946:
	lwz	r5, 24(r3)
	lfd	f1, 0(r5)
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 60(r3)
	stfd	f1, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fless
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7949
	b	beq_cont.7950
beq_else.7949:
	lwz	r2, 20(r3)
	lfd	f1, 0(r2)
	lfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fless
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7951
	b	beq_cont.7952
beq_else.7951:
	lis	r31, ha16(l.5440)
	addi	r31, r31, lo16(l.5440)
	lfd	f0, 0(r31)
	lfd	f1, 64(r3)
	fadd	f0, f1, f0
	lwz	r2, 52(r3)
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	lwz	r5, 16(r3)
	lfd	f2, 0(r5)
	fadd	f1, f1, f2
	lfd	f2, 8(r2)
	fmul	f2, f2, f0
	lfd	f3, 8(r5)
	fadd	f2, f2, f3
	lfd	f3, 16(r2)
	fmul	f3, f3, f0
	lfd	f4, 16(r5)
	fadd	f3, f3, f4
	li	r2, 0
	lwz	r5, 44(r3)
	lwz	r30, 12(r3)
	stfd	f3, 72(r3)
	stfd	f2, 80(r3)
	stfd	f1, 88(r3)
	stfd	f0, 96(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 108(r3)
	addi	r3, r3, 112
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7953
	b	beq_cont.7954
beq_else.7953:
	lwz	r2, 20(r3)
	lfd	f0, 96(r3)
	stfd	f0, 0(r2)
	lfd	f0, 88(r3)
	lfd	f1, 80(r3)
	lfd	f2, 72(r3)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	vecset.2472
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 56(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 60(r3)
	stw	r5, 0(r2)
beq_cont.7954:
beq_cont.7952:
beq_cont.7950:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network_fast.2768:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.7955
	blr
beq_else.7955:
	slwi	r9, r9, 2
	lwzx	r8, r8, r9
	li	r9, 0
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
trace_or_matrix_fast.2772:
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else.7957
	blr
beq_else.7957:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else.7959
	li	r7, 1
	mflr	r31
	mr	r5, r11
	mr	r2, r7
	mr	r30, r10
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont.7960
beq_else.7959:
	stw	r11, 16(r3)
	stw	r10, 20(r3)
	stw	r7, 24(r3)
	stw	r9, 28(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r12
	mr	r30, r8
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7961
	b	beq_cont.7962
beq_else.7961:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fless
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7963
	b	beq_cont.7964
beq_else.7963:
	li	r2, 1
	lwz	r5, 16(r3)
	lwz	r6, 0(r3)
	lwz	r30, 20(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.7964:
beq_cont.7962:
beq_cont.7960:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection_fast.2776:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l.5473)
	addi	r31, r31, lo16(l.5473)
	lfd	f0, 0(r31)
	stfd	f0, 0(r6)
	li	r8, 0
	lwz	r7, 0(r7)
	stw	r6, 0(r3)
	mflr	r31
	mr	r6, r2
	mr	r30, r5
	mr	r5, r7
	mr	r2, r8
	stw	r31, 4(r3)
	addi	r3, r3, 8
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f1, 0(r2)
	lis	r31, ha16(l.5453)
	addi	r31, r31, lo16(l.5453)
	lfd	f0, 0(r31)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fless
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7966
	li	r2, 0
	blr
beq_else.7966:
	lis	r31, ha16(l.5477)
	addi	r31, r31, lo16(l.5477)
	lfd	f1, 0(r31)
	lfd	f0, 8(r3)
	b	min_caml_fless
get_nvector_rect.2778:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	lwz	r6, 0(r6)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	vecbzero.2480
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	subi	r5, r2, 1
	subi	r2, r2, 1
	slwi	r2, r2, 3
	lwz	r6, 4(r3)
	lfdx	f0, r6, r2
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	sgn.2464
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fneg
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	slwi	r2, r2, 3
	lwz	r5, 0(r3)
	stfdx	f0, r5, r2
	blr
get_nvector_plane.2780:
	lwz	r5, 4(r30)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_a.2528
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fneg
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_b.2530
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fneg
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_c.2532
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_fneg
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
get_nvector_second.2782:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	lfd	f0, 0(r6)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x.2536
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	lfd	f1, 8(r2)
	lwz	r5, 4(r3)
	stfd	f0, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y.2538
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	lfd	f1, 16(r2)
	lwz	r2, 4(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_z.2540
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_a.2528
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b.2530
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_c.2532
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_isrot.2526
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7970
	lwz	r2, 0(r3)
	lfd	f0, 64(r3)
	stfd	f0, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 8(r2)
	lfd	f0, 80(r3)
	stfd	f0, 16(r2)
	b	beq_cont.7971
beq_else.7970:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r3.2556
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r2.2554
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f2, 88(r3)
	fadd	f0, f2, f0
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_fhalf
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r3.2556
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r1.2552
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_fhalf
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r2.2554
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_r1.2552
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_fhalf
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 16(r2)
beq_cont.7971:
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_isinvert.2524
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	b	vecunit_sgn.2490
get_nvector.2784:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stw	r8, 8(r3)
	stw	r5, 12(r3)
	stw	r7, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2520
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7972
	lwz	r2, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7972:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7973
	lwz	r2, 4(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7973:
	lwz	r2, 4(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
utexture.2787:
	lwz	r6, 4(r30)
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_texturetype.2518
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_red.2546
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lwz	r5, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_green.2548
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	lwz	r5, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_blue.2550
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 1
	bne	cr7, beq_else.7974
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x.2536
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5540)
	addi	r31, r31, lo16(l.5540)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l.5541)
	addi	r31, r31, lo16(l.5541)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f0, f0, f1
	lis	r31, ha16(l.5532)
	addi	r31, r31, lo16(l.5532)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fless
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	lfd	f0, 16(r5)
	lwz	r5, 8(r3)
	stw	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_z.2540
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5540)
	addi	r31, r31, lo16(l.5540)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l.5541)
	addi	r31, r31, lo16(l.5541)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f0, f0, f1
	lis	r31, ha16(l.5532)
	addi	r31, r31, lo16(l.5532)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fless
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7976
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7978
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f0, 0(r31)
	b	beq_cont.7979
beq_else.7978:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
beq_cont.7979:
	b	beq_cont.7977
beq_else.7976:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7980
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	b	beq_cont.7981
beq_else.7980:
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f0, 0(r31)
beq_cont.7981:
beq_cont.7977:
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	blr
beq_else.7974:
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7983
	lwz	r5, 0(r3)
	lfd	f0, 8(r5)
	lis	r31, ha16(l.5536)
	addi	r31, r31, lo16(l.5536)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_sin
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fsqr
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	lwz	r2, 4(r3)
	stfd	f1, 0(r2)
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 8(r2)
	blr
beq_else.7983:
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else.7985
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_x.2536
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 16(r2)
	lwz	r2, 8(r3)
	stfd	f0, 48(r3)
	stfd	f1, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_z.2540
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	lfd	f1, 48(r3)
	stfd	f0, 64(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fsqr
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	stfd	f0, 72(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fsqr
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5532)
	addi	r31, r31, lo16(l.5532)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	fsqrt	f0, f0
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l.5523)
	addi	r31, r31, lo16(l.5523)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_cos
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fsqr
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lwz	r2, 4(r3)
	stfd	f1, 8(r2)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 16(r2)
	blr
beq_else.7985:
	cmpwi	cr7, r5, 4
	bne	cr7, beq_else.7987
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 80(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_x.2536
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_a.2528
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 16(r2)
	lwz	r5, 8(r3)
	stfd	f0, 96(r3)
	stfd	f1, 104(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_z.2540
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 112(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_c.2532
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 96(r3)
	stfd	f0, 120(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_fsqr
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	stfd	f0, 128(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_fsqr
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lfd	f1, 96(r3)
	stfd	f0, 136(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fabs
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lis	r31, ha16(l.5520)
	addi	r31, r31, lo16(l.5520)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fless
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7988
	lfd	f0, 96(r3)
	lfd	f1, 120(r3)
	fdiv	f0, f1, f0
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fabs
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_atan
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lis	r31, ha16(l.5522)
	addi	r31, r31, lo16(l.5522)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5523)
	addi	r31, r31, lo16(l.5523)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	beq_cont.7989
beq_else.7988:
	lis	r31, ha16(l.5521)
	addi	r31, r31, lo16(l.5521)
	lfd	f0, 0(r31)
beq_cont.7989:
	floor	f1, f0
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
	lwz	r2, 8(r3)
	stfd	f0, 144(r3)
	stfd	f1, 152(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	o_param_y.2538
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 152(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 160(r3)
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	o_param_b.2530
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 160(r3)
	fmul	f0, f1, f0
	lfd	f1, 136(r3)
	stfd	f0, 168(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fabs
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lis	r31, ha16(l.5520)
	addi	r31, r31, lo16(l.5520)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fless
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7990
	lfd	f0, 136(r3)
	lfd	f1, 168(r3)
	fdiv	f0, f1, f0
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fabs
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_atan
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lis	r31, ha16(l.5522)
	addi	r31, r31, lo16(l.5522)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5523)
	addi	r31, r31, lo16(l.5523)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	beq_cont.7991
beq_else.7990:
	lis	r31, ha16(l.5521)
	addi	r31, r31, lo16(l.5521)
	lfd	f0, 0(r31)
beq_cont.7991:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l.5525)
	addi	r31, r31, lo16(l.5525)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5526)
	addi	r31, r31, lo16(l.5526)
	lfd	f2, 0(r31)
	lfd	f3, 144(r3)
	fsub	f2, f2, f3
	stfd	f0, 176(r3)
	stfd	f1, 184(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fsqr
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 184(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5526)
	addi	r31, r31, lo16(l.5526)
	lfd	f1, 0(r31)
	lfd	f2, 176(r3)
	fsub	f1, f1, f2
	stfd	f0, 192(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	min_caml_fsqr
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	lfd	f1, 192(r3)
	fsub	f0, f1, f0
	stfd	f0, 200(r3)
	mflr	r31
	stw	r31, 212(r3)
	addi	r3, r3, 216
	bl	min_caml_fisneg
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7992
	lfd	f0, 200(r3)
	b	beq_cont.7993
beq_else.7992:
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
beq_cont.7993:
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, ha16(l.5528)
	addi	r31, r31, lo16(l.5528)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
beq_else.7987:
	blr
add_light.2790:
	lwz	r2, 8(r30)
	lwz	r5, 4(r30)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r2, 24(r3)
	stw	r5, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fispos
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7996
	b	beq_cont.7997
beq_else.7996:
	lfd	f0, 16(r3)
	lwz	r2, 28(r3)
	lwz	r5, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecaccum.2501
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.7997:
	lfd	f0, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fispos
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7998
	blr
beq_else.7998:
	lfd	f0, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fsqr
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fsqr
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fmul	f0, f0, f1
	lwz	r2, 28(r3)
	lfd	f1, 0(r2)
	fadd	f1, f1, f0
	stfd	f1, 0(r2)
	lfd	f1, 8(r2)
	fadd	f1, f1, f0
	stfd	f1, 8(r2)
	lfd	f1, 16(r2)
	fadd	f0, f1, f0
	stfd	f0, 16(r2)
	blr
trace_reflections.2794:
	lwz	r6, 32(r30)
	lwz	r7, 28(r30)
	lwz	r8, 24(r30)
	lwz	r9, 20(r30)
	lwz	r10, 16(r30)
	lwz	r11, 12(r30)
	lwz	r12, 8(r30)
	lwz	r13, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8001
	slwi	r14, r2, 2
	lwzx	r7, r7, r14
	stw	r30, 0(r3)
	stw	r2, 4(r3)
	stfd	f1, 8(r3)
	stw	r13, 16(r3)
	stw	r5, 20(r3)
	stfd	f0, 24(r3)
	stw	r9, 32(r3)
	stw	r6, 36(r3)
	stw	r8, 40(r3)
	stw	r7, 44(r3)
	stw	r11, 48(r3)
	stw	r12, 52(r3)
	stw	r10, 56(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	r_dvec.2585
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r30, 56(r3)
	stw	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8002
	b	beq_cont.8003
beq_else.8002:
	lwz	r2, 52(r3)
	lwz	r2, 0(r2)
	li	r5, 4
	slw	r2, r2, r5
	lwz	r5, 48(r3)
	lwz	r5, 0(r5)
	add	r2, r2, r5
	lwz	r5, 44(r3)
	stw	r2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	r_surface_id.2583
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	cmpw	cr7, r5, r2
	bne	cr7, beq_else.8004
	li	r2, 0
	lwz	r5, 40(r3)
	lwz	r5, 0(r5)
	lwz	r30, 36(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8006
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	d_vec.2579
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veciprod.2493
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	r_bright.2587
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f2, f0, f1
	lfd	f3, 72(r3)
	fmul	f2, f2, f3
	lwz	r2, 60(r3)
	stfd	f2, 80(r3)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	d_vec.2579
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	veciprod.2493
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f1, f1, f0
	lfd	f0, 80(r3)
	lfd	f2, 8(r3)
	lwz	r30, 16(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	b	beq_cont.8007
beq_else.8006:
beq_cont.8007:
	b	beq_cont.8005
beq_else.8004:
beq_cont.8005:
beq_cont.8003:
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8001:
	blr
trace_ray.2799:
	lwz	r7, 80(r30)
	lwz	r8, 76(r30)
	lwz	r9, 72(r30)
	lwz	r10, 68(r30)
	lwz	r11, 64(r30)
	lwz	r12, 60(r30)
	lwz	r13, 56(r30)
	lwz	r14, 52(r30)
	lwz	r15, 48(r30)
	lwz	r16, 44(r30)
	lwz	r17, 40(r30)
	lwz	r18, 36(r30)
	lwz	r19, 32(r30)
	lwz	r20, 28(r30)
	lwz	r21, 24(r30)
	lwz	r22, 20(r30)
	lwz	r23, 16(r30)
	lwz	r24, 12(r30)
	lwz	r25, 8(r30)
	lwz	r26, 4(r30)
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else.8010
	stw	r30, 0(r3)
	stfd	f1, 8(r3)
	stw	r9, 16(r3)
	stw	r8, 20(r3)
	stw	r18, 24(r3)
	stw	r13, 28(r3)
	stw	r26, 32(r3)
	stw	r12, 36(r3)
	stw	r15, 40(r3)
	stw	r17, 44(r3)
	stw	r10, 48(r3)
	stw	r6, 52(r3)
	stw	r21, 56(r3)
	stw	r7, 60(r3)
	stw	r22, 64(r3)
	stw	r11, 68(r3)
	stw	r24, 72(r3)
	stw	r16, 76(r3)
	stw	r23, 80(r3)
	stw	r14, 84(r3)
	stw	r25, 88(r3)
	stfd	f0, 96(r3)
	stw	r19, 104(r3)
	stw	r2, 108(r3)
	stw	r5, 112(r3)
	stw	r20, 116(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	p_surface_ids.2564
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r5, 112(r3)
	lwz	r30, 116(r3)
	stw	r2, 120(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8013
	li	r2, -1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 120(r3)
	stwx	r2, r7, r6
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.8014
	blr
beq_else.8014:
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	veciprod.2493
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_fneg
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	stfd	f0, 128(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_fispos
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8017
	blr
beq_else.8017:
	lfd	f0, 128(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_fsqr
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lfd	f1, 128(r3)
	fmul	f0, f0, f1
	lfd	f1, 96(r3)
	fmul	f0, f0, f1
	lwz	r2, 88(r3)
	lfd	f1, 0(r2)
	fmul	f0, f0, f1
	lwz	r2, 84(r3)
	lfd	f1, 0(r2)
	fadd	f1, f1, f0
	stfd	f1, 0(r2)
	lfd	f1, 8(r2)
	fadd	f1, f1, f0
	stfd	f1, 8(r2)
	lfd	f1, 16(r2)
	fadd	f0, f1, f0
	stfd	f0, 16(r2)
	blr
beq_else.8013:
	lwz	r2, 80(r3)
	lwz	r2, 0(r2)
	slwi	r5, r2, 2
	lwz	r6, 76(r3)
	lwzx	r5, r6, r5
	stw	r2, 136(r3)
	stw	r5, 140(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	o_reflectiontype.2522
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 140(r3)
	stw	r2, 144(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	o_diffuse.2542
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f0, f1
	lwz	r2, 140(r3)
	lwz	r5, 112(r3)
	lwz	r30, 72(r3)
	stfd	f0, 152(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 68(r3)
	lwz	r5, 64(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	veccpy.2482
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 140(r3)
	lwz	r5, 64(r3)
	lwz	r30, 60(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 136(r3)
	slw	r2, r5, r2
	lwz	r5, 56(r3)
	lwz	r5, 0(r5)
	add	r2, r2, r5
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 120(r3)
	stwx	r2, r7, r6
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_intersection_points.2562
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 64(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	veccpy.2482
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_calc_diffuse.2566
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r5, 140(r3)
	stw	r2, 160(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	o_diffuse.2542
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lis	r31, ha16(l.5526)
	addi	r31, r31, lo16(l.5526)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_fless
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8021
	li	r2, 1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 160(r3)
	stwx	r2, r7, r6
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_energy.2568
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	lwz	r7, 48(r3)
	stw	r2, 164(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	veccpy.2482
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lwz	r2, 108(r3)
	slwi	r5, r2, 2
	lwz	r6, 164(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5563)
	addi	r31, r31, lo16(l.5563)
	lfd	f0, 0(r31)
	lfd	f1, 152(r3)
	fmul	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	vecscale.2511
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	p_nvectors.2577
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 44(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	veccpy.2482
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	b	beq_cont.8022
beq_else.8021:
	li	r2, 0
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 160(r3)
	stwx	r2, r7, r6
beq_cont.8022:
	lis	r31, ha16(l.5565)
	addi	r31, r31, lo16(l.5565)
	lfd	f0, 0(r31)
	lwz	r2, 112(r3)
	lwz	r5, 44(r3)
	stfd	f0, 168(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	veciprod.2493
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 168(r3)
	fmul	f0, f1, f0
	lwz	r2, 112(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	vecaccum.2501
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r2, 140(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	o_hilight.2544
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	li	r2, 0
	lwz	r5, 40(r3)
	lwz	r5, 0(r5)
	lwz	r30, 36(r3)
	stfd	f0, 176(r3)
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8023
	lwz	r2, 44(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	veciprod.2493
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_fneg
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lfd	f1, 152(r3)
	fmul	f0, f0, f1
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	stfd	f0, 184(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	veciprod.2493
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fneg
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 184(r3)
	lfd	f2, 176(r3)
	lwz	r30, 32(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	b	beq_cont.8024
beq_else.8023:
beq_cont.8024:
	lwz	r2, 64(r3)
	lwz	r30, 28(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lfd	f0, 152(r3)
	lfd	f1, 176(r3)
	lwz	r5, 112(r3)
	lwz	r30, 20(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lis	r31, ha16(l.5568)
	addi	r31, r31, lo16(l.5568)
	lfd	f0, 0(r31)
	lfd	f1, 96(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fless
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8025
	blr
beq_else.8025:
	lwz	r2, 108(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else.8027
	b	bge_cont.8028
bge_else.8027:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 120(r3)
	stwx	r6, r7, r5
bge_cont.8028:
	lwz	r5, 144(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.8029
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lwz	r5, 140(r3)
	stfd	f0, 192(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	o_diffuse.2542
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	lfd	f1, 192(r3)
	fsub	f0, f1, f0
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lwz	r2, 108(r3)
	addi	r2, r2, 1
	lwz	r5, 16(r3)
	lfd	f1, 0(r5)
	lfd	f2, 8(r3)
	fadd	f1, f2, f1
	lwz	r5, 112(r3)
	lwz	r6, 52(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8029:
	blr
ble_else.8010:
	blr
trace_diffuse_ray.2805:
	lwz	r5, 48(r30)
	lwz	r6, 44(r30)
	lwz	r7, 40(r30)
	lwz	r8, 36(r30)
	lwz	r9, 32(r30)
	lwz	r10, 28(r30)
	lwz	r11, 24(r30)
	lwz	r12, 20(r30)
	lwz	r13, 16(r30)
	lwz	r14, 12(r30)
	lwz	r15, 8(r30)
	lwz	r16, 4(r30)
	stw	r6, 0(r3)
	stw	r16, 4(r3)
	stfd	f0, 8(r3)
	stw	r11, 16(r3)
	stw	r10, 20(r3)
	stw	r7, 24(r3)
	stw	r8, 28(r3)
	stw	r13, 32(r3)
	stw	r5, 36(r3)
	stw	r15, 40(r3)
	stw	r2, 44(r3)
	stw	r9, 48(r3)
	stw	r14, 52(r3)
	mflr	r31
	mr	r30, r12
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8032
	blr
beq_else.8032:
	lwz	r2, 52(r3)
	lwz	r2, 0(r2)
	slwi	r2, r2, 2
	lwz	r5, 48(r3)
	lwzx	r2, r5, r2
	lwz	r5, 44(r3)
	stw	r2, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec.2579
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r30, 40(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 32(r3)
	lwz	r30, 36(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r2, 0
	lwz	r5, 28(r3)
	lwz	r5, 0(r5)
	lwz	r30, 24(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8034
	lwz	r2, 20(r3)
	lwz	r5, 16(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veciprod.2493
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_fneg
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fispos
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8036
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	b	beq_cont.8037
beq_else.8036:
	lfd	f0, 64(r3)
beq_cont.8037:
	lfd	f1, 8(r3)
	fmul	f0, f1, f0
	lwz	r2, 56(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_diffuse.2542
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	vecaccum.2501
beq_else.8034:
	blr
iter_trace_diffuse_rays.2808:
	lwz	r8, 4(r30)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else.8039
	slwi	r9, r7, 2
	lwzx	r9, r2, r9
	stw	r6, 0(r3)
	stw	r30, 4(r3)
	stw	r8, 8(r3)
	stw	r2, 12(r3)
	stw	r7, 16(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	d_vec.2579
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	veciprod.2493
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fisneg
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8040
	lwz	r2, 16(r3)
	slwi	r5, r2, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5586)
	addi	r31, r31, lo16(l.5586)
	lfd	f0, 0(r31)
	lfd	f1, 24(r3)
	fdiv	f0, f1, f0
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	beq_cont.8041
beq_else.8040:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5584)
	addi	r31, r31, lo16(l.5584)
	lfd	f0, 0(r31)
	lfd	f1, 24(r3)
	fdiv	f0, f1, f0
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.8041:
	lwz	r2, 16(r3)
	subi	r7, r2, 2
	lwz	r2, 12(r3)
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8039:
	blr
trace_diffuse_rays.2813:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r8, 12(r3)
	mflr	r31
	mr	r2, r6
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 8(r3)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
trace_diffuse_ray_80percent.2817:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8043
	b	beq_cont.8044
beq_else.8043:
	lwz	r9, 0(r8)
	mflr	r31
	mr	r2, r9
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont.8044:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.8045
	b	beq_cont.8046
beq_else.8045:
	lwz	r5, 12(r3)
	lwz	r6, 4(r5)
	lwz	r7, 4(r3)
	lwz	r8, 0(r3)
	lwz	r30, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont.8046:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8047
	b	beq_cont.8048
beq_else.8047:
	lwz	r5, 12(r3)
	lwz	r6, 8(r5)
	lwz	r7, 4(r3)
	lwz	r8, 0(r3)
	lwz	r30, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont.8048:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.8049
	b	beq_cont.8050
beq_else.8049:
	lwz	r5, 12(r3)
	lwz	r6, 12(r5)
	lwz	r7, 4(r3)
	lwz	r8, 0(r3)
	lwz	r30, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont.8050:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else.8051
	blr
beq_else.8051:
	lwz	r2, 12(r3)
	lwz	r2, 16(r2)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_diffuse_using_1point.2821:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r7, 0(r3)
	stw	r6, 4(r3)
	stw	r8, 8(r3)
	stw	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors.2577
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_intersection_points.2562
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_energy.2568
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 20(r3)
	lwzx	r6, r7, r6
	lwz	r7, 8(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veccpy.2482
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_group_id.2572
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	lwzx	r6, r7, r6
	slwi	r7, r5, 2
	lwz	r8, 28(r3)
	lwzx	r7, r8, r7
	lwz	r30, 4(r3)
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	slwi	r2, r2, 2
	lwz	r5, 32(r3)
	lwzx	r5, r5, r2
	lwz	r2, 0(r3)
	lwz	r6, 8(r3)
	b	vecaccumv.2514
calc_diffuse_using_5points.2824:
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r5, r5, r11
	stw	r9, 0(r3)
	stw	r10, 4(r3)
	stw	r8, 8(r3)
	stw	r7, 12(r3)
	stw	r6, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	subi	r6, r5, 1
	slwi	r6, r6, 2
	lwz	r7, 16(r3)
	lwzx	r6, r7, r6
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	lwzx	r6, r7, r6
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	addi	r6, r5, 1
	slwi	r6, r6, 2
	lwz	r7, 16(r3)
	lwzx	r6, r7, r6
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	lwzx	r6, r7, r6
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	lwzx	r6, r7, r6
	lwz	r7, 4(r3)
	stw	r2, 40(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veccpy.2482
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 28(r3)
	lwzx	r5, r6, r5
	lwz	r6, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	vecadd.2505
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 32(r3)
	lwzx	r5, r6, r5
	lwz	r6, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	vecadd.2505
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 36(r3)
	lwzx	r5, r6, r5
	lwz	r6, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	vecadd.2505
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	lwz	r6, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	vecadd.2505
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	slwi	r2, r2, 2
	lwz	r5, 16(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_energy.2568
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r2, 0(r3)
	lwz	r6, 4(r3)
	b	vecaccumv.2514
do_without_neighbors.2830:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else.8053
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_surface_ids.2564
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8054
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_calc_diffuse.2566
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8055
	b	beq_cont.8056
beq_else.8055:
	lwz	r2, 8(r3)
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont.8056:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8054:
	blr
ble_else.8053:
	blr
neighbors_exist.2833:
	lwz	r6, 4(r30)
	lwz	r7, 4(r6)
	addi	r8, r5, 1
	cmpw	cr7, r7, r8
	bgt	cr7, ble_else.8059
	li	r2, 0
	blr
ble_else.8059:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else.8060
	li	r2, 0
	blr
ble_else.8060:
	lwz	r5, 0(r6)
	addi	r6, r2, 1
	cmpw	cr7, r5, r6
	bgt	cr7, ble_else.8061
	li	r2, 0
	blr
ble_else.8061:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else.8062
	li	r2, 0
	blr
ble_else.8062:
	li	r2, 1
	blr
get_surface_id.2837:
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	p_surface_ids.2564
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	blr
neighbors_are_available.2840:
	slwi	r9, r2, 2
	lwzx	r9, r6, r9
	stw	r6, 0(r3)
	stw	r7, 4(r3)
	stw	r8, 8(r3)
	stw	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	get_surface_id.2837
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	lwzx	r6, r7, r6
	lwz	r7, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2837
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8063
	lwz	r2, 16(r3)
	slwi	r6, r2, 2
	lwz	r7, 4(r3)
	lwzx	r6, r7, r6
	lwz	r7, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2837
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8064
	lwz	r2, 16(r3)
	subi	r6, r2, 1
	slwi	r6, r6, 2
	lwz	r7, 0(r3)
	lwzx	r6, r7, r6
	lwz	r8, 8(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2837
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8065
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	slwi	r2, r2, 2
	lwz	r6, 0(r3)
	lwzx	r2, r6, r2
	lwz	r6, 8(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2837
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8066
	li	r2, 1
	blr
beq_else.8066:
	li	r2, 0
	blr
beq_else.8065:
	li	r2, 0
	blr
beq_else.8064:
	li	r2, 0
	blr
beq_else.8063:
	li	r2, 0
	blr
try_exploit_neighbors.2846:
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r7, r12
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else.8067
	stw	r5, 0(r3)
	stw	r30, 4(r3)
	stw	r11, 8(r3)
	stw	r12, 12(r3)
	stw	r10, 16(r3)
	stw	r9, 20(r3)
	stw	r8, 24(r3)
	stw	r7, 28(r3)
	stw	r6, 32(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r12
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	get_surface_id.2837
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8068
	lwz	r2, 36(r3)
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r7, 24(r3)
	lwz	r8, 20(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	neighbors_are_available.2840
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8069
	lwz	r2, 36(r3)
	slwi	r2, r2, 2
	lwz	r5, 28(r3)
	lwzx	r2, r5, r2
	lwz	r5, 20(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8069:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_calc_diffuse.2566
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r8, 20(r3)
	slwi	r5, r8, 2
	lwzx	r2, r2, r5
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8070
	b	beq_cont.8071
beq_else.8070:
	lwz	r2, 36(r3)
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r7, 24(r3)
	lwz	r30, 8(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont.8071:
	lwz	r2, 20(r3)
	addi	r9, r2, 1
	lwz	r2, 36(r3)
	lwz	r5, 0(r3)
	lwz	r6, 32(r3)
	lwz	r7, 28(r3)
	lwz	r8, 24(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8068:
	blr
ble_else.8067:
	blr
write_ppm_header.2853:
	lwz	r2, 4(r30)
	li	r5, 80
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 51
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lwz	r5, 0(r2)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lwz	r2, 4(r2)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 255
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	b	min_caml_print_char
write_rgb_element.2855:
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else.8074
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8076
	b	bge_cont.8077
bge_else.8076:
	li	r2, 0
bge_cont.8077:
	b	ble_cont.8075
ble_else.8074:
	li	r2, 255
ble_cont.8075:
	b	min_caml_print_int
write_rgb.2857:
	lwz	r2, 4(r30)
	lfd	f0, 0(r2)
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element.2855
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f0, 8(r2)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element.2855
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_char
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f0, 16(r2)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element.2855
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	b	min_caml_print_char
pretrace_diffuse_rays.2859:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else.8078
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2837
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8079
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_calc_diffuse.2566
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8080
	b	beq_cont.8081
beq_else.8080:
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_group_id.2572
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	vecbzero.2480
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors.2577
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_intersection_points.2562
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r5, r5, 2
	lwz	r6, 8(r3)
	lwzx	r5, r6, r5
	lwz	r6, 16(r3)
	slwi	r7, r6, 2
	lwz	r8, 28(r3)
	lwzx	r7, r8, r7
	slwi	r8, r6, 2
	lwzx	r2, r2, r8
	lwz	r30, 4(r3)
	mflr	r31
	mr	r6, r2
	mr	r2, r5
	mr	r5, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_received_ray_20percent.2570
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 12(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veccpy.2482
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.8081:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	lwz	r2, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8079:
	blr
ble_else.8078:
	blr
pretrace_pixels.2862:
	lwz	r7, 36(r30)
	lwz	r8, 32(r30)
	lwz	r9, 28(r30)
	lwz	r10, 24(r30)
	lwz	r11, 20(r30)
	lwz	r12, 16(r30)
	lwz	r13, 12(r30)
	lwz	r14, 8(r30)
	lwz	r15, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8084
	lfd	f3, 0(r11)
	lwz	r11, 0(r15)
	sub	r11, r5, r11
	itof	f4, r11
	fmul	f3, f3, f4
	lfd	f4, 0(r10)
	fmul	f4, f3, f4
	fadd	f4, f4, f0
	stfd	f4, 0(r13)
	lfd	f4, 8(r10)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	stfd	f4, 8(r13)
	lfd	f4, 16(r10)
	fmul	f3, f3, f4
	fadd	f3, f3, f2
	stfd	f3, 16(r13)
	li	r10, 0
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r30, 24(r3)
	stw	r14, 28(r3)
	stw	r6, 32(r3)
	stw	r13, 36(r3)
	stw	r8, 40(r3)
	stw	r2, 44(r3)
	stw	r5, 48(r3)
	stw	r7, 52(r3)
	stw	r9, 56(r3)
	stw	r12, 60(r3)
	mflr	r31
	mr	r5, r10
	mr	r2, r13
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	vecunit_sgn.2490
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	vecbzero.2480
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy.2482
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r2, 0
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f1, 0(r31)
	lwz	r8, 36(r3)
	lwz	r30, 40(r3)
	mflr	r31
	mr	r5, r8
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	slwi	r5, r2, 2
	lwz	r6, 44(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	p_rgb.2560
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy.2482
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	slwi	r5, r2, 2
	lwz	r6, 44(r3)
	lwzx	r5, r6, r5
	lwz	r7, 32(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	p_set_group_id.2574
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	slwi	r5, r2, 2
	lwz	r6, 44(r3)
	lwzx	r5, r6, r5
	li	r7, 0
	lwz	r30, 28(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	subi	r2, r2, 1
	li	r5, 1
	lwz	r6, 32(r3)
	stw	r2, 64(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	add_mod5.2469
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r6, r2
	mtlr	r31
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 44(r3)
	lwz	r5, 64(r3)
	lwz	r30, 24(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8084:
	blr
pretrace_line.2869:
	lwz	r7, 24(r30)
	lwz	r8, 20(r30)
	lwz	r9, 16(r30)
	lwz	r10, 12(r30)
	lwz	r11, 8(r30)
	lwz	r12, 4(r30)
	lfd	f0, 0(r9)
	lwz	r9, 4(r12)
	sub	r5, r5, r9
	itof	f1, r5
	fmul	f0, f0, f1
	lfd	f1, 0(r8)
	fmul	f1, f0, f1
	lfd	f2, 0(r7)
	fadd	f1, f1, f2
	lfd	f2, 8(r8)
	fmul	f2, f0, f2
	lfd	f3, 8(r7)
	fadd	f2, f2, f3
	lfd	f3, 16(r8)
	fmul	f0, f0, f3
	lfd	f3, 16(r7)
	fadd	f0, f0, f3
	lwz	r5, 0(r11)
	subi	r5, r5, 1
	mr	r30, r10
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
scan_pixel.2873:
	lwz	r9, 24(r30)
	lwz	r10, 20(r30)
	lwz	r11, 16(r30)
	lwz	r12, 12(r30)
	lwz	r13, 8(r30)
	lwz	r14, 4(r30)
	lwz	r13, 0(r13)
	cmpw	cr7, r13, r2
	bgt	cr7, ble_else.8086
	blr
ble_else.8086:
	slwi	r13, r2, 2
	lwzx	r13, r7, r13
	stw	r30, 0(r3)
	stw	r9, 4(r3)
	stw	r6, 8(r3)
	stw	r10, 12(r3)
	stw	r14, 16(r3)
	stw	r7, 20(r3)
	stw	r8, 24(r3)
	stw	r5, 28(r3)
	stw	r2, 32(r3)
	stw	r12, 36(r3)
	stw	r11, 40(r3)
	mflr	r31
	mr	r2, r13
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_rgb.2560
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veccpy.2482
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 28(r3)
	lwz	r6, 24(r3)
	lwz	r30, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8088
	lwz	r2, 32(r3)
	slwi	r5, r2, 2
	lwz	r6, 20(r3)
	lwzx	r5, r6, r5
	li	r7, 0
	lwz	r30, 16(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont.8089
beq_else.8088:
	li	r9, 0
	lwz	r2, 32(r3)
	lwz	r5, 28(r3)
	lwz	r6, 8(r3)
	lwz	r7, 20(r3)
	lwz	r8, 24(r3)
	lwz	r30, 12(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont.8089:
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lwz	r5, 28(r3)
	lwz	r6, 8(r3)
	lwz	r7, 20(r3)
	lwz	r8, 24(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
scan_line.2879:
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	lwz	r12, 4(r11)
	cmpw	cr7, r12, r2
	bgt	cr7, ble_else.8090
	blr
ble_else.8090:
	lwz	r11, 4(r11)
	subi	r11, r11, 1
	stw	r30, 0(r3)
	stw	r8, 4(r3)
	stw	r7, 8(r3)
	stw	r6, 12(r3)
	stw	r5, 16(r3)
	stw	r2, 20(r3)
	stw	r9, 24(r3)
	cmpw	cr7, r11, r2
	bgt	cr7, ble_else.8092
	b	ble_cont.8093
ble_else.8092:
	addi	r11, r2, 1
	mflr	r31
	mr	r6, r8
	mr	r5, r11
	mr	r2, r7
	mr	r30, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont.8093:
	li	r2, 0
	lwz	r5, 20(r3)
	lwz	r6, 16(r3)
	lwz	r7, 12(r3)
	lwz	r8, 8(r3)
	lwz	r30, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	li	r5, 2
	lwz	r6, 4(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	add_mod5.2469
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r8, r2
	mtlr	r31
	lwz	r2, 28(r3)
	lwz	r5, 12(r3)
	lwz	r6, 8(r3)
	lwz	r7, 16(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
create_float5x3array.2885:
	li	r2, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 16(r5)
	mr	r2, r5
	blr
create_pixel.2887:
	li	r2, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_float5x3array.2885
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 5
	li	r6, 0
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 5
	li	r6, 0
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_float5x3array.2885
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_float5x3array.2885
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 1
	li	r6, 0
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	create_float5x3array.2885
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 32
	stw	r2, 28(r5)
	lwz	r2, 24(r3)
	stw	r2, 24(r5)
	lwz	r2, 20(r3)
	stw	r2, 20(r5)
	lwz	r2, 16(r3)
	stw	r2, 16(r5)
	lwz	r2, 12(r3)
	stw	r2, 12(r5)
	lwz	r2, 8(r3)
	stw	r2, 8(r5)
	lwz	r2, 4(r3)
	stw	r2, 4(r5)
	lwz	r2, 0(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	blr
init_line_elements.2889:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8094
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel.2887
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements.2889
bge_else.8094:
	blr
create_pixelline.2892:
	lwz	r2, 4(r30)
	lwz	r5, 0(r2)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel.2887
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	b	init_line_elements.2889
tan.2894:
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_sin
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_cos
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fdiv	f0, f1, f0
	blr
adjust_position.2896:
	fmul	f0, f0, f0
	lis	r31, ha16(l.5568)
	addi	r31, r31, lo16(l.5568)
	lfd	f2, 0(r31)
	fadd	f0, f0, f2
	fsqrt	f0, f0
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f2, 0(r31)
	fdiv	f2, f2, f0
	stfd	f0, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_atan
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fmul	f0, f0, f1
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	tan.2894
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fmul	f0, f0, f1
	blr
calc_dirvec.2899:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else.8095
	stw	r6, 0(r3)
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	stfd	f0, 16(r3)
	stfd	f1, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_fsqr
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fsqr
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fdiv	f1, f1, f0
	lfd	f2, 24(r3)
	fdiv	f2, f2, f0
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f3, 0(r31)
	fdiv	f0, f3, f0
	lwz	r2, 8(r3)
	slwi	r2, r2, 2
	lwz	r5, 4(r3)
	lwzx	r2, r5, r2
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	stw	r2, 40(r3)
	stfd	f0, 48(r3)
	stfd	f2, 56(r3)
	stfd	f1, 64(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2579
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	lfd	f1, 56(r3)
	lfd	f2, 48(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2472
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 40
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2579
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 56(r3)
	stw	r2, 72(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_fneg
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	fmr	f2, f0
	mtlr	r31
	lfd	f0, 64(r3)
	lfd	f1, 48(r3)
	lwz	r2, 72(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2472
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 80
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2579
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	stw	r2, 76(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_fneg
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	stfd	f0, 80(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fneg
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	fmr	f2, f0
	mtlr	r31
	lfd	f0, 48(r3)
	lfd	f1, 80(r3)
	lwz	r2, 76(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	vecset.2472
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	d_vec.2579
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	stw	r2, 88(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_fneg
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	stfd	f0, 96(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_fneg
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	stfd	f0, 104(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_fneg
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	fmr	f2, f0
	mtlr	r31
	lfd	f0, 96(r3)
	lfd	f1, 104(r3)
	lwz	r2, 88(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	vecset.2472
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 41
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	d_vec.2579
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	stw	r2, 112(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_fneg
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	stfd	f0, 120(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_fneg
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 120(r3)
	lfd	f2, 56(r3)
	lwz	r2, 112(r3)
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	vecset.2472
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r2, r2, 81
	slwi	r2, r2, 2
	lwz	r5, 40(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	d_vec.2579
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f0, 48(r3)
	stw	r2, 128(r3)
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_fneg
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	lfd	f2, 56(r3)
	lwz	r2, 128(r3)
	b	vecset.2472
bge_else.8095:
	stfd	f2, 136(r3)
	stw	r6, 0(r3)
	stw	r5, 8(r3)
	stw	r30, 144(r3)
	stfd	f3, 152(r3)
	stw	r2, 160(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	adjust_position.2896
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 160(r3)
	addi	r2, r2, 1
	lfd	f1, 152(r3)
	stfd	f0, 168(r3)
	stw	r2, 176(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	adjust_position.2896
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 168(r3)
	lfd	f2, 136(r3)
	lfd	f3, 152(r3)
	lwz	r2, 176(r3)
	lwz	r5, 8(r3)
	lwz	r6, 0(r3)
	lwz	r30, 144(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_dirvecs.2907:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8103
	itof	f1, r2
	lis	r31, ha16(l.5680)
	addi	r31, r31, lo16(l.5680)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l.5681)
	addi	r31, r31, lo16(l.5681)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r8, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f3, 0(r31)
	stw	r30, 0(r3)
	stfd	f0, 8(r3)
	stw	r5, 16(r3)
	stw	r7, 20(r3)
	stw	r6, 24(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r8
	mr	r30, r7
	fmr	f31, f3
	fmr	f3, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	itof	f0, r2
	lis	r31, ha16(l.5680)
	addi	r31, r31, lo16(l.5680)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5568)
	addi	r31, r31, lo16(l.5568)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f1, 0(r31)
	lwz	r6, 24(r3)
	addi	r7, r6, 2
	lfd	f3, 8(r3)
	lwz	r8, 16(r3)
	lwz	r30, 20(r3)
	mflr	r31
	mr	r6, r7
	mr	r2, r5
	mr	r5, r8
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	subi	r2, r2, 1
	li	r5, 1
	lwz	r6, 16(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	add_mod5.2469
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 8(r3)
	lwz	r2, 32(r3)
	lwz	r6, 24(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8103:
	blr
calc_dirvec_rows.2912:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8106
	itof	f0, r2
	lis	r31, ha16(l.5680)
	addi	r31, r31, lo16(l.5680)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5681)
	addi	r31, r31, lo16(l.5681)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	li	r8, 4
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r8
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	subi	r2, r2, 1
	li	r5, 2
	lwz	r6, 8(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	add_mod5.2469
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r6, r2, 4
	lwz	r2, 16(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8106:
	blr
create_dirvec.2916:
	lwz	r2, 4(r30)
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	lwz	r2, 0(r2)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 4(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	blr
create_dirvec_elements.2918:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8108
	stw	r30, 0(r3)
	stw	r2, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r30, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	lwz	r30, 0(r3)
	mr	r2, r7
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8108:
	blr
create_dirvecs.2921:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8110
	li	r8, 120
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r2, 12(r3)
	stw	r8, 16(r3)
	mflr	r31
	mr	r30, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 8(r3)
	stwx	r2, r7, r6
	slwi	r2, r5, 2
	lwzx	r2, r7, r2
	li	r6, 118
	lwz	r30, 4(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	subi	r2, r2, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8110:
	blr
init_dirvec_constants.2923:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8112
	slwi	r7, r5, 2
	lwzx	r7, r2, r7
	stw	r2, 0(r3)
	stw	r30, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r2, r7
	mr	r30, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8112:
	blr
init_vecset_constants.2926:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8114
	slwi	r7, r2, 2
	lwzx	r6, r6, r7
	li	r7, 119
	stw	r30, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	mr	r30, r5
	mr	r5, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8114:
	blr
init_dirvecs.2928:
	lwz	r2, 12(r30)
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	li	r7, 4
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	mflr	r31
	mr	r2, r7
	mr	r30, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	li	r5, 0
	li	r6, 0
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 4
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
add_reflection.2930:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r30, 4(r30)
	stw	r7, 0(r3)
	stw	r2, 4(r3)
	stw	r5, 8(r3)
	stfd	f0, 16(r3)
	stw	r6, 24(r3)
	stfd	f3, 32(r3)
	stfd	f2, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	stw	r2, 56(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec.2579
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	vecset.2472
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r30, 24(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	mr	r2, r4
	addi	r4, r4, 16
	lfd	f0, 16(r3)
	stfd	f0, 8(r2)
	lwz	r5, 56(r3)
	stw	r5, 4(r2)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	stwx	r2, r6, r5
	blr
setup_rect_reflection.2937:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	lwz	r9, 0(r6)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	stw	r6, 0(r3)
	stw	r9, 4(r3)
	stw	r8, 8(r3)
	stw	r2, 12(r3)
	stw	r7, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_diffuse.2542
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	lfd	f1, 0(r2)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fneg
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	lfd	f1, 8(r2)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_fneg
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	lfd	f1, 16(r2)
	stfd	f0, 48(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_fneg
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	fmr	f3, f0
	mtlr	r31
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r6, 16(r3)
	lfd	f1, 0(r6)
	lfd	f0, 32(r3)
	lfd	f2, 48(r3)
	lwz	r7, 4(r3)
	lwz	r30, 8(r3)
	stfd	f3, 56(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lwz	r6, 12(r3)
	addi	r7, r6, 2
	lwz	r8, 16(r3)
	lfd	f2, 8(r8)
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f3, 56(r3)
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 2
	lwz	r6, 12(r3)
	addi	r6, r6, 3
	lwz	r7, 16(r3)
	lfd	f3, 16(r7)
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r2, r2, 3
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
setup_surface_reflection.2940:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	addi	r2, r2, 1
	lwz	r9, 0(r6)
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f0, 0(r31)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stw	r9, 8(r3)
	stw	r8, 12(r3)
	stw	r7, 16(r3)
	stw	r5, 20(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_diffuse.2542
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 20(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_abc.2534
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod.2493
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f1, 0(r31)
	lwz	r2, 20(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_a.2528
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lwz	r2, 16(r3)
	lfd	f2, 0(r2)
	fsub	f0, f0, f2
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 56(r3)
	stfd	f2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b.2530
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lwz	r2, 16(r3)
	lfd	f2, 8(r2)
	fsub	f0, f0, f2
	lis	r31, ha16(l.5248)
	addi	r31, r31, lo16(l.5248)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 72(r3)
	stfd	f2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_c.2532
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lwz	r2, 16(r3)
	lfd	f1, 16(r2)
	fsub	f3, f0, f1
	lfd	f0, 32(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 8(r3)
	lwz	r5, 4(r3)
	lwz	r30, 12(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
setup_reflections.2943:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8122
	slwi	r8, r2, 2
	lwzx	r7, r7, r8
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_reflectiontype.2522
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8123
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_diffuse.2542
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l.5124)
	addi	r31, r31, lo16(l.5124)
	lfd	f1, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_fless
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8124
	blr
beq_else.8124:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2520
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.8126
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8126:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8127
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8127:
	blr
beq_else.8123:
	blr
bge_else.8122:
	blr
rt.2945:
	lwz	r6, 56(r30)
	lwz	r7, 52(r30)
	lwz	r8, 48(r30)
	lwz	r9, 44(r30)
	lwz	r10, 40(r30)
	lwz	r11, 36(r30)
	lwz	r12, 32(r30)
	lwz	r13, 28(r30)
	lwz	r14, 24(r30)
	lwz	r15, 20(r30)
	lwz	r16, 16(r30)
	lwz	r17, 12(r30)
	lwz	r18, 8(r30)
	lwz	r30, 4(r30)
	stw	r2, 0(r17)
	stw	r5, 4(r17)
	li	r17, 2
	srw	r17, r2, r17
	stw	r17, 0(r18)
	li	r17, 2
	srw	r5, r5, r17
	stw	r5, 4(r18)
	lis	r31, ha16(l.5714)
	addi	r31, r31, lo16(l.5714)
	lfd	f0, 0(r31)
	itof	f1, r2
	fdiv	f0, f0, f1
	stfd	f0, 0(r9)
	stw	r10, 0(r3)
	stw	r12, 4(r3)
	stw	r7, 8(r3)
	stw	r13, 12(r3)
	stw	r8, 16(r3)
	stw	r15, 20(r3)
	stw	r14, 24(r3)
	stw	r16, 28(r3)
	stw	r6, 32(r3)
	stw	r11, 36(r3)
	stw	r30, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r30, 40(r3)
	stw	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r30, 40(r3)
	stw	r2, 48(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r30, 36(r3)
	stw	r2, 52(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r30, 32(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r30, 28(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec.2579
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veccpy.2482
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	lwz	r30, 16(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lwz	r30, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r5, 0
	li	r6, 0
	lwz	r2, 48(r3)
	lwz	r30, 4(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r2, 0
	li	r8, 2
	lwz	r5, 44(r3)
	lwz	r6, 48(r3)
	lwz	r7, 52(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
_min_caml_start:
	li	r2, 1
	li	r5, 0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 60
	li	r6, 0
	li	r7, 0
	li	r8, 0
	li	r9, 0
	li	r10, 0
	mr	r11, r4
	addi	r4, r4, 48
	stw	r2, 40(r11)
	stw	r2, 36(r11)
	stw	r2, 32(r11)
	stw	r2, 28(r11)
	stw	r10, 24(r11)
	stw	r2, 20(r11)
	stw	r2, 16(r11)
	stw	r9, 12(r11)
	stw	r8, 8(r11)
	stw	r7, 4(r11)
	stw	r6, 0(r11)
	mr	r2, r11
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 1
	lis	r31, ha16(l.5527)
	addi	r31, r31, lo16(l.5527)
	lfd	f0, 0(r31)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 50
	li	r6, 1
	li	r7, -1
	stw	r2, 20(r3)
	stw	r5, 24(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 1
	li	r6, 1
	lwz	r7, 0(r2)
	stw	r2, 28(r3)
	stw	r5, 32(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 1
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r5, 1
	li	r6, 0
	stw	r2, 40(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r5, 1
	lis	r31, ha16(l.5473)
	addi	r31, r31, lo16(l.5473)
	lfd	f0, 0(r31)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 48(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r5, 1
	li	r6, 0
	stw	r2, 52(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 68(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	li	r5, 2
	li	r6, 0
	stw	r2, 72(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	li	r5, 2
	li	r6, 0
	stw	r2, 76(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	li	r5, 1
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 84(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 88(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 92(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 96(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 100(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_float_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 104(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_float_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	li	r5, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 108(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_float_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 0
	stw	r5, 112(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	li	r5, 0
	mr	r6, r4
	addi	r4, r4, 8
	stw	r2, 4(r6)
	lwz	r2, 112(r3)
	stw	r2, 0(r6)
	mr	r2, r6
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	li	r5, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 116(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 120(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	li	r5, 60
	lwz	r6, 120(r3)
	stw	r2, 124(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_create_array
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 124(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	li	r5, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	stw	r2, 128(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_create_float_array
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 0
	stw	r5, 132(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 132(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	li	r5, 180
	li	r6, 0
	lis	r31, ha16(l.5123)
	addi	r31, r31, lo16(l.5123)
	lfd	f0, 0(r31)
	mr	r7, r4
	addi	r4, r4, 16
	stfd	f0, 8(r7)
	stw	r2, 4(r7)
	stw	r6, 0(r7)
	mr	r2, r7
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	li	r5, 1
	li	r6, 0
	stw	r2, 136(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 24
	lis	r6, ha16(read_screen_settings.2591)
	addi	r6, r6, lo16(read_screen_settings.2591)
	stw	r6, 0(r5)
	lwz	r6, 12(r3)
	stw	r6, 20(r5)
	lwz	r7, 104(r3)
	stw	r7, 16(r5)
	lwz	r8, 100(r3)
	stw	r8, 12(r5)
	lwz	r9, 96(r3)
	stw	r9, 8(r5)
	lwz	r10, 8(r3)
	stw	r10, 4(r5)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r11, ha16(read_light.2593)
	addi	r11, r11, lo16(read_light.2593)
	stw	r11, 0(r10)
	lwz	r11, 16(r3)
	stw	r11, 8(r10)
	lwz	r12, 20(r3)
	stw	r12, 4(r10)
	mr	r13, r4
	addi	r4, r4, 8
	lis	r14, ha16(read_nth_object.2598)
	addi	r14, r14, lo16(read_nth_object.2598)
	stw	r14, 0(r13)
	lwz	r14, 4(r3)
	stw	r14, 4(r13)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r16, ha16(read_object.2600)
	addi	r16, r16, lo16(read_object.2600)
	stw	r16, 0(r15)
	stw	r13, 8(r15)
	lwz	r13, 0(r3)
	stw	r13, 4(r15)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_all_object.2602)
	addi	r17, r17, lo16(read_all_object.2602)
	stw	r17, 0(r16)
	stw	r15, 4(r16)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_and_network.2608)
	addi	r17, r17, lo16(read_and_network.2608)
	stw	r17, 0(r15)
	lwz	r17, 28(r3)
	stw	r17, 4(r15)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r19, ha16(read_parameter.2610)
	addi	r19, r19, lo16(read_parameter.2610)
	stw	r19, 0(r18)
	stw	r5, 20(r18)
	stw	r10, 16(r18)
	stw	r15, 12(r18)
	stw	r16, 8(r18)
	lwz	r5, 36(r3)
	stw	r5, 4(r18)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r15, ha16(solver_rect_surface.2612)
	addi	r15, r15, lo16(solver_rect_surface.2612)
	stw	r15, 0(r10)
	lwz	r15, 40(r3)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_rect.2621)
	addi	r19, r19, lo16(solver_rect.2621)
	stw	r19, 0(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface.2627)
	addi	r19, r19, lo16(solver_surface.2627)
	stw	r19, 0(r10)
	stw	r15, 4(r10)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r20, ha16(solver_second.2646)
	addi	r20, r20, lo16(solver_second.2646)
	stw	r20, 0(r19)
	stw	r15, 4(r19)
	mr	r20, r4
	addi	r4, r4, 24
	lis	r21, ha16(solver.2652)
	addi	r21, r21, lo16(solver.2652)
	stw	r21, 0(r20)
	stw	r10, 16(r20)
	stw	r19, 12(r20)
	stw	r16, 8(r20)
	stw	r14, 4(r20)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(solver_rect_fast.2656)
	addi	r16, r16, lo16(solver_rect_fast.2656)
	stw	r16, 0(r10)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast.2663)
	addi	r19, r19, lo16(solver_surface_fast.2663)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r21, ha16(solver_second_fast.2669)
	addi	r21, r21, lo16(solver_second_fast.2669)
	stw	r21, 0(r19)
	stw	r15, 4(r19)
	mr	r21, r4
	addi	r4, r4, 24
	lis	r22, ha16(solver_fast.2675)
	addi	r22, r22, lo16(solver_fast.2675)
	stw	r22, 0(r21)
	stw	r16, 16(r21)
	stw	r19, 12(r21)
	stw	r10, 8(r21)
	stw	r14, 4(r21)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast2.2679)
	addi	r19, r19, lo16(solver_surface_fast2.2679)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r22, ha16(solver_second_fast2.2686)
	addi	r22, r22, lo16(solver_second_fast2.2686)
	stw	r22, 0(r19)
	stw	r15, 4(r19)
	mr	r22, r4
	addi	r4, r4, 24
	lis	r23, ha16(solver_fast2.2693)
	addi	r23, r23, lo16(solver_fast2.2693)
	stw	r23, 0(r22)
	stw	r16, 16(r22)
	stw	r19, 12(r22)
	stw	r10, 8(r22)
	stw	r14, 4(r22)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(iter_setup_dirvec_constants.2705)
	addi	r16, r16, lo16(iter_setup_dirvec_constants.2705)
	stw	r16, 0(r10)
	stw	r14, 4(r10)
	mr	r16, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_dirvec_constants.2708)
	addi	r19, r19, lo16(setup_dirvec_constants.2708)
	stw	r19, 0(r16)
	stw	r13, 8(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(setup_startp_constants.2710)
	addi	r19, r19, lo16(setup_startp_constants.2710)
	stw	r19, 0(r10)
	stw	r14, 4(r10)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r23, ha16(setup_startp.2713)
	addi	r23, r23, lo16(setup_startp.2713)
	stw	r23, 0(r19)
	lwz	r23, 92(r3)
	stw	r23, 12(r19)
	stw	r10, 8(r19)
	stw	r13, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r24, ha16(check_all_inside.2735)
	addi	r24, r24, lo16(check_all_inside.2735)
	stw	r24, 0(r10)
	stw	r14, 4(r10)
	mr	r24, r4
	addi	r4, r4, 32
	lis	r25, ha16(shadow_check_and_group.2741)
	addi	r25, r25, lo16(shadow_check_and_group.2741)
	stw	r25, 0(r24)
	stw	r21, 28(r24)
	stw	r15, 24(r24)
	stw	r14, 20(r24)
	lwz	r25, 128(r3)
	stw	r25, 16(r24)
	stw	r11, 12(r24)
	lwz	r26, 52(r3)
	stw	r26, 8(r24)
	stw	r10, 4(r24)
	mr	r27, r4
	addi	r4, r4, 16
	lis	r28, ha16(shadow_check_one_or_group.2744)
	addi	r28, r28, lo16(shadow_check_one_or_group.2744)
	stw	r28, 0(r27)
	stw	r24, 8(r27)
	stw	r17, 4(r27)
	mr	r24, r4
	addi	r4, r4, 24
	lis	r28, ha16(shadow_check_one_or_matrix.2747)
	addi	r28, r28, lo16(shadow_check_one_or_matrix.2747)
	stw	r28, 0(r24)
	stw	r21, 20(r24)
	stw	r15, 16(r24)
	stw	r27, 12(r24)
	stw	r25, 8(r24)
	stw	r26, 4(r24)
	mr	r21, r4
	addi	r4, r4, 40
	lis	r27, ha16(solve_each_element.2750)
	addi	r27, r27, lo16(solve_each_element.2750)
	stw	r27, 0(r21)
	lwz	r27, 48(r3)
	stw	r27, 36(r21)
	lwz	r28, 88(r3)
	stw	r28, 32(r21)
	stw	r15, 28(r21)
	stw	r20, 24(r21)
	stw	r14, 20(r21)
	lwz	r29, 44(r3)
	stw	r29, 16(r21)
	stw	r26, 12(r21)
	lwz	r30, 56(r3)
	stw	r30, 8(r21)
	stw	r10, 4(r21)
	mr	r25, r4
	addi	r4, r4, 16
	stw	r18, 140(r3)
	lis	r18, ha16(solve_one_or_network.2754)
	addi	r18, r18, lo16(solve_one_or_network.2754)
	stw	r18, 0(r25)
	stw	r21, 8(r25)
	stw	r17, 4(r25)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r21, ha16(trace_or_matrix.2758)
	addi	r21, r21, lo16(trace_or_matrix.2758)
	stw	r21, 0(r18)
	stw	r27, 20(r18)
	stw	r28, 16(r18)
	stw	r15, 12(r18)
	stw	r20, 8(r18)
	stw	r25, 4(r18)
	mr	r20, r4
	addi	r4, r4, 16
	lis	r21, ha16(judge_intersection.2762)
	addi	r21, r21, lo16(judge_intersection.2762)
	stw	r21, 0(r20)
	stw	r18, 12(r20)
	stw	r27, 8(r20)
	stw	r5, 4(r20)
	mr	r18, r4
	addi	r4, r4, 40
	lis	r21, ha16(solve_each_element_fast.2764)
	addi	r21, r21, lo16(solve_each_element_fast.2764)
	stw	r21, 0(r18)
	stw	r27, 36(r18)
	stw	r23, 32(r18)
	stw	r22, 28(r18)
	stw	r15, 24(r18)
	stw	r14, 20(r18)
	stw	r29, 16(r18)
	stw	r26, 12(r18)
	stw	r30, 8(r18)
	stw	r10, 4(r18)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r21, ha16(solve_one_or_network_fast.2768)
	addi	r21, r21, lo16(solve_one_or_network_fast.2768)
	stw	r21, 0(r10)
	stw	r18, 8(r10)
	stw	r17, 4(r10)
	mr	r17, r4
	addi	r4, r4, 24
	lis	r18, ha16(trace_or_matrix_fast.2772)
	addi	r18, r18, lo16(trace_or_matrix_fast.2772)
	stw	r18, 0(r17)
	stw	r27, 16(r17)
	stw	r22, 12(r17)
	stw	r15, 8(r17)
	stw	r10, 4(r17)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r15, ha16(judge_intersection_fast.2776)
	addi	r15, r15, lo16(judge_intersection_fast.2776)
	stw	r15, 0(r10)
	stw	r17, 12(r10)
	stw	r27, 8(r10)
	stw	r5, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(get_nvector_rect.2778)
	addi	r17, r17, lo16(get_nvector_rect.2778)
	stw	r17, 0(r15)
	lwz	r17, 60(r3)
	stw	r17, 8(r15)
	stw	r29, 4(r15)
	mr	r18, r4
	addi	r4, r4, 8
	lis	r21, ha16(get_nvector_plane.2780)
	addi	r21, r21, lo16(get_nvector_plane.2780)
	stw	r21, 0(r18)
	stw	r17, 4(r18)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(get_nvector_second.2782)
	addi	r22, r22, lo16(get_nvector_second.2782)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r26, 4(r21)
	mr	r22, r4
	addi	r4, r4, 16
	lis	r23, ha16(get_nvector.2784)
	addi	r23, r23, lo16(get_nvector.2784)
	stw	r23, 0(r22)
	stw	r21, 12(r22)
	stw	r15, 8(r22)
	stw	r18, 4(r22)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(utexture.2787)
	addi	r18, r18, lo16(utexture.2787)
	stw	r18, 0(r15)
	lwz	r18, 64(r3)
	stw	r18, 4(r15)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r23, ha16(add_light.2790)
	addi	r23, r23, lo16(add_light.2790)
	stw	r23, 0(r21)
	stw	r18, 8(r21)
	lwz	r23, 72(r3)
	stw	r23, 4(r21)
	mr	r25, r4
	addi	r4, r4, 40
	stw	r16, 144(r3)
	lis	r16, ha16(trace_reflections.2794)
	addi	r16, r16, lo16(trace_reflections.2794)
	stw	r16, 0(r25)
	stw	r24, 32(r25)
	lwz	r16, 136(r3)
	stw	r16, 28(r25)
	stw	r5, 24(r25)
	stw	r17, 20(r25)
	stw	r10, 16(r25)
	stw	r29, 12(r25)
	stw	r30, 8(r25)
	stw	r21, 4(r25)
	mr	r16, r4
	addi	r4, r4, 88
	lis	r13, ha16(trace_ray.2799)
	addi	r13, r13, lo16(trace_ray.2799)
	stw	r13, 0(r16)
	stw	r15, 80(r16)
	stw	r25, 76(r16)
	stw	r27, 72(r16)
	stw	r18, 68(r16)
	stw	r28, 64(r16)
	stw	r24, 60(r16)
	stw	r19, 56(r16)
	stw	r23, 52(r16)
	stw	r5, 48(r16)
	stw	r14, 44(r16)
	stw	r17, 40(r16)
	stw	r2, 36(r16)
	stw	r11, 32(r16)
	stw	r20, 28(r16)
	stw	r29, 24(r16)
	stw	r26, 20(r16)
	stw	r30, 16(r16)
	stw	r22, 12(r16)
	stw	r12, 8(r16)
	stw	r21, 4(r16)
	mr	r12, r4
	addi	r4, r4, 56
	lis	r13, ha16(trace_diffuse_ray.2805)
	addi	r13, r13, lo16(trace_diffuse_ray.2805)
	stw	r13, 0(r12)
	stw	r15, 48(r12)
	stw	r18, 44(r12)
	stw	r24, 40(r12)
	stw	r5, 36(r12)
	stw	r14, 32(r12)
	stw	r17, 28(r12)
	stw	r11, 24(r12)
	stw	r10, 20(r12)
	stw	r26, 16(r12)
	stw	r30, 12(r12)
	stw	r22, 8(r12)
	lwz	r5, 68(r3)
	stw	r5, 4(r12)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r13, ha16(iter_trace_diffuse_rays.2808)
	addi	r13, r13, lo16(iter_trace_diffuse_rays.2808)
	stw	r13, 0(r10)
	stw	r12, 4(r10)
	mr	r12, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_rays.2813)
	addi	r13, r13, lo16(trace_diffuse_rays.2813)
	stw	r13, 0(r12)
	stw	r19, 8(r12)
	stw	r10, 4(r12)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_ray_80percent.2817)
	addi	r13, r13, lo16(trace_diffuse_ray_80percent.2817)
	stw	r13, 0(r10)
	stw	r12, 8(r10)
	lwz	r13, 116(r3)
	stw	r13, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_1point.2821)
	addi	r17, r17, lo16(calc_diffuse_using_1point.2821)
	stw	r17, 0(r15)
	stw	r10, 12(r15)
	stw	r23, 8(r15)
	stw	r5, 4(r15)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_5points.2824)
	addi	r17, r17, lo16(calc_diffuse_using_5points.2824)
	stw	r17, 0(r10)
	stw	r23, 8(r10)
	stw	r5, 4(r10)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r18, ha16(do_without_neighbors.2830)
	addi	r18, r18, lo16(do_without_neighbors.2830)
	stw	r18, 0(r17)
	stw	r15, 4(r17)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(neighbors_exist.2833)
	addi	r18, r18, lo16(neighbors_exist.2833)
	stw	r18, 0(r15)
	lwz	r18, 76(r3)
	stw	r18, 4(r15)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(try_exploit_neighbors.2846)
	addi	r20, r20, lo16(try_exploit_neighbors.2846)
	stw	r20, 0(r19)
	stw	r17, 8(r19)
	stw	r10, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r20, ha16(write_ppm_header.2853)
	addi	r20, r20, lo16(write_ppm_header.2853)
	stw	r20, 0(r10)
	stw	r18, 4(r10)
	mr	r20, r4
	addi	r4, r4, 8
	lis	r21, ha16(write_rgb.2857)
	addi	r21, r21, lo16(write_rgb.2857)
	stw	r21, 0(r20)
	stw	r23, 4(r20)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(pretrace_diffuse_rays.2859)
	addi	r22, r22, lo16(pretrace_diffuse_rays.2859)
	stw	r22, 0(r21)
	stw	r12, 12(r21)
	stw	r13, 8(r21)
	stw	r5, 4(r21)
	mr	r5, r4
	addi	r4, r4, 40
	lis	r12, ha16(pretrace_pixels.2862)
	addi	r12, r12, lo16(pretrace_pixels.2862)
	stw	r12, 0(r5)
	stw	r6, 36(r5)
	stw	r16, 32(r5)
	stw	r28, 28(r5)
	stw	r9, 24(r5)
	lwz	r6, 84(r3)
	stw	r6, 20(r5)
	stw	r23, 16(r5)
	lwz	r9, 108(r3)
	stw	r9, 12(r5)
	stw	r21, 8(r5)
	lwz	r9, 80(r3)
	stw	r9, 4(r5)
	mr	r12, r4
	addi	r4, r4, 32
	lis	r16, ha16(pretrace_line.2869)
	addi	r16, r16, lo16(pretrace_line.2869)
	stw	r16, 0(r12)
	stw	r7, 24(r12)
	stw	r8, 20(r12)
	stw	r6, 16(r12)
	stw	r5, 12(r12)
	stw	r18, 8(r12)
	stw	r9, 4(r12)
	mr	r5, r4
	addi	r4, r4, 32
	lis	r7, ha16(scan_pixel.2873)
	addi	r7, r7, lo16(scan_pixel.2873)
	stw	r7, 0(r5)
	stw	r20, 24(r5)
	stw	r19, 20(r5)
	stw	r23, 16(r5)
	stw	r15, 12(r5)
	stw	r18, 8(r5)
	stw	r17, 4(r5)
	mr	r7, r4
	addi	r4, r4, 16
	lis	r8, ha16(scan_line.2879)
	addi	r8, r8, lo16(scan_line.2879)
	stw	r8, 0(r7)
	stw	r5, 12(r7)
	stw	r12, 8(r7)
	stw	r18, 4(r7)
	mr	r5, r4
	addi	r4, r4, 8
	lis	r8, ha16(create_pixelline.2892)
	addi	r8, r8, lo16(create_pixelline.2892)
	stw	r8, 0(r5)
	stw	r18, 4(r5)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r15, ha16(calc_dirvec.2899)
	addi	r15, r15, lo16(calc_dirvec.2899)
	stw	r15, 0(r8)
	stw	r13, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvecs.2907)
	addi	r16, r16, lo16(calc_dirvecs.2907)
	stw	r16, 0(r15)
	stw	r8, 4(r15)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvec_rows.2912)
	addi	r16, r16, lo16(calc_dirvec_rows.2912)
	stw	r16, 0(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(create_dirvec.2916)
	addi	r16, r16, lo16(create_dirvec.2916)
	stw	r16, 0(r15)
	lwz	r16, 0(r3)
	stw	r16, 4(r15)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r19, ha16(create_dirvec_elements.2918)
	addi	r19, r19, lo16(create_dirvec_elements.2918)
	stw	r19, 0(r17)
	stw	r15, 4(r17)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(create_dirvecs.2921)
	addi	r20, r20, lo16(create_dirvecs.2921)
	stw	r20, 0(r19)
	stw	r13, 12(r19)
	stw	r17, 8(r19)
	stw	r15, 4(r19)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r20, ha16(init_dirvec_constants.2923)
	addi	r20, r20, lo16(init_dirvec_constants.2923)
	stw	r20, 0(r17)
	lwz	r20, 144(r3)
	stw	r20, 4(r17)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(init_vecset_constants.2926)
	addi	r22, r22, lo16(init_vecset_constants.2926)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r13, 4(r21)
	mr	r13, r4
	addi	r4, r4, 16
	lis	r17, ha16(init_dirvecs.2928)
	addi	r17, r17, lo16(init_dirvecs.2928)
	stw	r17, 0(r13)
	stw	r21, 12(r13)
	stw	r19, 8(r13)
	stw	r8, 4(r13)
	mr	r8, r4
	addi	r4, r4, 16
	lis	r17, ha16(add_reflection.2930)
	addi	r17, r17, lo16(add_reflection.2930)
	stw	r17, 0(r8)
	stw	r20, 12(r8)
	lwz	r17, 136(r3)
	stw	r17, 8(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(setup_rect_reflection.2937)
	addi	r17, r17, lo16(setup_rect_reflection.2937)
	stw	r17, 0(r15)
	stw	r2, 12(r15)
	stw	r11, 8(r15)
	stw	r8, 4(r15)
	mr	r17, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_surface_reflection.2940)
	addi	r19, r19, lo16(setup_surface_reflection.2940)
	stw	r19, 0(r17)
	stw	r2, 12(r17)
	stw	r11, 8(r17)
	stw	r8, 4(r17)
	mr	r2, r4
	addi	r4, r4, 16
	lis	r8, ha16(setup_reflections.2943)
	addi	r8, r8, lo16(setup_reflections.2943)
	stw	r8, 0(r2)
	stw	r17, 12(r2)
	stw	r15, 8(r2)
	stw	r14, 4(r2)
	mr	r30, r4
	addi	r4, r4, 64
	lis	r8, ha16(rt.2945)
	addi	r8, r8, lo16(rt.2945)
	stw	r8, 0(r30)
	stw	r10, 56(r30)
	stw	r2, 52(r30)
	stw	r20, 48(r30)
	stw	r6, 44(r30)
	stw	r7, 40(r30)
	lwz	r2, 140(r3)
	stw	r2, 36(r30)
	stw	r12, 32(r30)
	stw	r16, 28(r30)
	lwz	r2, 128(r3)
	stw	r2, 24(r30)
	stw	r11, 20(r30)
	stw	r13, 16(r30)
	stw	r18, 12(r30)
	stw	r9, 8(r30)
	stw	r5, 4(r30)
	li	r2, 512
	li	r5, 512
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	blr
