	.data
lzero:
	0
lhalf:
	1056964608
lsc.179:
	1082130432
lsc.166:
	1078530011
lsc.165:
	1144258560
lsc.164:
	1103101952
lsc.163:
	1065353216
lsc.162:
	1167949824
lsc.161:
	1123024896
lsc.160:
	1077936128
lsc.156:
	1073741824
latan.96:
	1082130432
latan.95:
	0
latan.94:
	1065353216
latan.93:
	1073741824
latan.92:
	1075576832
latan.91:
	1054867456
latan.90:
	1078530011
latan.89:
	1031137221
latan.88:
	1035458158
latan.87:
	1038323256
latan.86:
	-1106097883
latan.85:
	1045220557
latan.84:
	1051372202
l.5782:
	1124073472
l.5749:
	1063675494
l.5748:
	1045220557
l.5654:
	1125515264
l.5652:
	-1021968384
l.5636:
	1036831949
l.5633:
	-1073741824
l.5631:
	998244352
l.5609:
	1101004800
l.5608:
	1028443341
l.5604:
	1048576000
l.5600:
	1092616192
l.5596:
	1050253722
l.5595:
	1132396544
l.5594:
	1041865114
l.5592:
	1078530011
l.5591:
	1106247680
l.5590:
	1097859072
l.5589:
	953267991
l.5546:
	1287568416
l.5542:
	1315859240
l.5521:
	-1110651699
l.5509:
	1008981770
l.5508:
	-1102263091
l.5358:
	1056964608
l.5300:
	1073741824
l.5266:
	-1018691584
l.5264:
	1128792064
l.5260:
	1016003125
l.5177:
	-1082130432
l.5176:
	1065353216
l.5175:
	0
	.text
	.globl _min_caml_start
	.align 2

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
xor.2466:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7702
	mr	r2, r5
	blr
beq_else.7702:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7703
	li	r2, 1
	blr
beq_else.7703:
	li	r2, 0
	blr
sgn.2469:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7704
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	blr
beq_else.7704:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7705
	lis	r31, ha16(l.5177)
	addi	r31, r31, lo16(l.5177)
	lfd	f0, 0(r31)
	blr
ble_else.7705:
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	blr
fneg_cond.2471:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7706
	fneg	f0, f0
	blr
beq_else.7706:
	blr
add_mod5.2474:
	add	r2, r2, r5
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else.7707
	subi	r2, r2, 5
	blr
bge_else.7707:
	blr
vecset.2477:
	stfd	f0, 0(r2)
	stfd	f1, 8(r2)
	stfd	f2, 16(r2)
	blr
vecfill.2482:
	stfd	f0, 0(r2)
	stfd	f0, 8(r2)
	stfd	f0, 16(r2)
	blr
vecbzero.2485:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	vecfill.2482
veccpy.2487:
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lfd	f0, 16(r5)
	stfd	f0, 16(r2)
	blr
vecunit_sgn.2495:
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7711
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	b	beq_cont.7712
beq_else.7711:
	lwz	r2, 0(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7713
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont.7714
beq_else.7713:
	lis	r31, ha16(l.5177)
	addi	r31, r31, lo16(l.5177)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont.7714:
beq_cont.7712:
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
veciprod.2498:
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
veciprod2.2501:
	lfd	f3, 0(r2)
	fmul	f0, f3, f0
	lfd	f3, 8(r2)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum.2506:
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
vecadd.2510:
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
vecscale.2516:
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
vecaccumv.2519:
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
o_texturetype.2523:
	lwz	r2, 0(r2)
	blr
o_form.2525:
	lwz	r2, 4(r2)
	blr
o_reflectiontype.2527:
	lwz	r2, 8(r2)
	blr
o_isinvert.2529:
	lwz	r2, 24(r2)
	blr
o_isrot.2531:
	lwz	r2, 12(r2)
	blr
o_param_a.2533:
	lwz	r2, 16(r2)
	lfd	f0, 0(r2)
	blr
o_param_b.2535:
	lwz	r2, 16(r2)
	lfd	f0, 8(r2)
	blr
o_param_c.2537:
	lwz	r2, 16(r2)
	lfd	f0, 16(r2)
	blr
o_param_abc.2539:
	lwz	r2, 16(r2)
	blr
o_param_x.2541:
	lwz	r2, 20(r2)
	lfd	f0, 0(r2)
	blr
o_param_y.2543:
	lwz	r2, 20(r2)
	lfd	f0, 8(r2)
	blr
o_param_z.2545:
	lwz	r2, 20(r2)
	lfd	f0, 16(r2)
	blr
o_diffuse.2547:
	lwz	r2, 28(r2)
	lfd	f0, 0(r2)
	blr
o_hilight.2549:
	lwz	r2, 28(r2)
	lfd	f0, 8(r2)
	blr
o_color_red.2551:
	lwz	r2, 32(r2)
	lfd	f0, 0(r2)
	blr
o_color_green.2553:
	lwz	r2, 32(r2)
	lfd	f0, 8(r2)
	blr
o_color_blue.2555:
	lwz	r2, 32(r2)
	lfd	f0, 16(r2)
	blr
o_param_r1.2557:
	lwz	r2, 36(r2)
	lfd	f0, 0(r2)
	blr
o_param_r2.2559:
	lwz	r2, 36(r2)
	lfd	f0, 8(r2)
	blr
o_param_r3.2561:
	lwz	r2, 36(r2)
	lfd	f0, 16(r2)
	blr
o_param_ctbl.2563:
	lwz	r2, 40(r2)
	blr
p_rgb.2565:
	lwz	r2, 0(r2)
	blr
p_intersection_points.2567:
	lwz	r2, 4(r2)
	blr
p_surface_ids.2569:
	lwz	r2, 8(r2)
	blr
p_calc_diffuse.2571:
	lwz	r2, 12(r2)
	blr
p_energy.2573:
	lwz	r2, 16(r2)
	blr
p_received_ray_20percent.2575:
	lwz	r2, 20(r2)
	blr
p_group_id.2577:
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	blr
p_set_group_id.2579:
	lwz	r2, 24(r2)
	stw	r5, 0(r2)
	blr
p_nvectors.2582:
	lwz	r2, 28(r2)
	blr
d_vec.2584:
	lwz	r2, 0(r2)
	blr
d_const.2586:
	lwz	r2, 4(r2)
	blr
r_surface_id.2588:
	lwz	r2, 0(r2)
	blr
r_dvec.2590:
	lwz	r2, 4(r2)
	blr
r_bright.2592:
	lfd	f0, 8(r2)
	blr
rad.2594:
	lis	r31, ha16(l.5260)
	addi	r31, r31, lo16(l.5260)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
read_screen_settings.2596:
	lwz	r2, 20(r30)
	lwz	r5, 16(r30)
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	read	r0
	stfd	r0, 0(r8)
	read	r0
	stfd	r0, 8(r8)
	read	r0
	stfd	r0, 16(r8)
	read	r0
	stw	r2, 0(r3)
	stw	r8, 4(r3)
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	stw	r5, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad.2594
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
	read	r0
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2594
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
	lis	r31, ha16(l.5264)
	addi	r31, r31, lo16(l.5264)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	lwz	r2, 16(r3)
	stfd	f2, 0(r2)
	lis	r31, ha16(l.5266)
	addi	r31, r31, lo16(l.5266)
	lfd	f2, 0(r31)
	lfd	f3, 40(r3)
	fmul	f2, f3, f2
	stfd	f2, 8(r2)
	lfd	f2, 56(r3)
	fmul	f4, f1, f2
	lis	r31, ha16(l.5264)
	addi	r31, r31, lo16(l.5264)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	stfd	f4, 16(r2)
	lwz	r5, 12(r3)
	stfd	f2, 0(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	stfd	f4, 8(r5)
	fneg	f4, f0
	stfd	f4, 16(r5)
	fneg	f4, f3
	fmul	f0, f4, f0
	lwz	r5, 8(r3)
	stfd	f0, 0(r5)
	fneg	f0, f1
	stfd	f0, 8(r5)
	fneg	f0, f3
	fmul	f0, f0, f2
	stfd	f0, 16(r5)
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	lfd	f1, 0(r2)
	fsub	f0, f0, f1
	lwz	r6, 0(r3)
	stfd	f0, 0(r6)
	lfd	f0, 8(r5)
	lfd	f1, 8(r2)
	fsub	f0, f0, f1
	stfd	f0, 8(r6)
	lfd	f0, 16(r5)
	lfd	f1, 16(r2)
	fsub	f0, f0, f1
	stfd	f0, 16(r6)
	blr
read_light.2598:
	lwz	r2, 8(r30)
	lwz	r5, 4(r30)
	read	r0
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	rad.2594
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
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	read	r0
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad.2594
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
	read	r0
	lwz	r2, 0(r3)
	stfd	r0, 0(r2)
	blr
rotate_quadratic_matrix.2600:
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
	fneg	f1, f4
	fmul	f4, f5, f2
	fmul	f2, f7, f2
	lwz	r2, 0(r3)
	lfd	f5, 0(r2)
	lfd	f7, 8(r2)
	lfd	f11, 16(r2)
	stfd	f3, 48(r3)
	stfd	f2, 56(r3)
	stfd	f0, 64(r3)
	stfd	f8, 72(r3)
	stfd	f4, 80(r3)
	stfd	f10, 88(r3)
	stfd	f6, 96(r3)
	stfd	f11, 104(r3)
	stfd	f1, 112(r3)
	stfd	f7, 120(r3)
	stfd	f9, 128(r3)
	stfd	f5, 136(r3)
	mflr	r31
	fmr	f0, f3
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_fsqr
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 128(r3)
	stfd	f0, 144(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_fsqr
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lfd	f2, 144(r3)
	fadd	f0, f2, f0
	lfd	f2, 112(r3)
	stfd	f0, 152(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_fsqr
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fmul	f0, f1, f0
	lfd	f2, 152(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	lfd	f0, 96(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_fsqr
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 88(r3)
	stfd	f0, 160(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	min_caml_fsqr
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lfd	f2, 160(r3)
	fadd	f0, f2, f0
	lfd	f2, 80(r3)
	stfd	f0, 168(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fsqr
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fmul	f0, f1, f0
	lfd	f2, 168(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 8(r2)
	lfd	f0, 72(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_fsqr
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f2, 64(r3)
	stfd	f0, 176(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_fsqr
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lfd	f2, 176(r3)
	fadd	f0, f2, f0
	lfd	f2, 56(r3)
	stfd	f0, 184(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fsqr
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fmul	f0, f1, f0
	lfd	f2, 184(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 16(r2)
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
	lfd	f0, 0(r31)
	lfd	f2, 96(r3)
	lfd	f3, 136(r3)
	fmul	f4, f3, f2
	lfd	f5, 72(r3)
	fmul	f4, f4, f5
	lfd	f6, 88(r3)
	lfd	f7, 120(r3)
	fmul	f8, f7, f6
	lfd	f9, 64(r3)
	fmul	f8, f8, f9
	fadd	f4, f4, f8
	lfd	f8, 80(r3)
	fmul	f10, f1, f8
	lfd	f11, 56(r3)
	fmul	f10, f10, f11
	fadd	f4, f4, f10
	fmul	f0, f0, f4
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
	lfd	f0, 0(r31)
	lfd	f4, 48(r3)
	fmul	f10, f3, f4
	fmul	f5, f10, f5
	lfd	f10, 128(r3)
	fmul	f12, f7, f10
	fmul	f9, f12, f9
	fadd	f5, f5, f9
	lfd	f9, 112(r3)
	fmul	f12, f1, f9
	fmul	f11, f12, f11
	fadd	f5, f5, f11
	fmul	f0, f0, f5
	stfd	f0, 8(r2)
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
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
read_nth_object.2603:
	lwz	r5, 4(r30)
	read	r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else.7725
	li	r2, 0
	blr
beq_else.7725:
	read	r7
	read	r8
	read	r9
	li	r10, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	stw	r8, 12(r3)
	stw	r7, 16(r3)
	stw	r9, 20(r3)
	mflr	r31
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	read	r0
	stfd	r0, 0(r2)
	read	r0
	stfd	r0, 8(r2)
	read	r0
	stfd	r0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	read	r0
	stfd	r0, 0(r2)
	read	r0
	stfd	r0, 8(r2)
	read	r0
	stfd	r0, 16(r2)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	read	r0
	fcmpu	cr7, f0, r0
	bgt	cr7, ble_else.7726
	li	r5, 0
	b	ble_cont.7727
ble_else.7726:
	li	r5, 1
ble_cont.7727:
	li	r6, 2
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stw	r2, 28(r3)
	stw	r5, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	read	r0
	stfd	r0, 0(r2)
	read	r0
	stfd	r0, 8(r2)
	li	r5, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	read	r0
	stfd	r0, 0(r2)
	read	r0
	stfd	r0, 8(r2)
	read	r0
	stfd	r0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stw	r2, 40(r3)
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
	bne	cr7, beq_else.7728
	b	beq_cont.7729
beq_else.7728:
	read	r0
	stw	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2594
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 0(r2)
	read	r0
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2594
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 8(r2)
	read	r0
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad.2594
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 16(r2)
beq_cont.7729:
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7730
	li	r6, 1
	b	beq_cont.7731
beq_else.7730:
	lwz	r6, 32(r3)
beq_cont.7731:
	li	r7, 4
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lwz	r8, 12(r3)
	stw	r8, 8(r5)
	lwz	r8, 16(r3)
	stw	r8, 4(r5)
	lwz	r9, 8(r3)
	stw	r9, 0(r5)
	lwz	r9, 4(r3)
	slwi	r9, r9, 2
	lwz	r10, 0(r3)
	stwx	r5, r10, r9
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else.7732
	lfd	f0, 0(r6)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7734
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	beq_cont.7735
beq_else.7734:
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	sgn.2469
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
beq_cont.7735:
	lwz	r2, 24(r3)
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7737
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	beq_cont.7738
beq_else.7737:
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	sgn.2469
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
beq_cont.7738:
	lwz	r2, 24(r3)
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7739
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	beq_cont.7740
beq_else.7739:
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	sgn.2469
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
beq_cont.7740:
	lwz	r2, 24(r3)
	stfd	f0, 16(r2)
	b	beq_cont.7733
beq_else.7732:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else.7741
	lwz	r5, 32(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7743
	li	r5, 1
	b	beq_cont.7744
beq_else.7743:
	li	r5, 0
beq_cont.7744:
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	vecunit_sgn.2495
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	beq_cont.7742
beq_else.7741:
beq_cont.7742:
beq_cont.7733:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7745
	b	beq_cont.7746
beq_else.7745:
	lwz	r2, 24(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	rotate_quadratic_matrix.2600
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
beq_cont.7746:
	li	r2, 1
	blr
read_object.2605:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else.7747
	blr
bge_else.7747:
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
	bne	cr7, beq_else.7749
	lwz	r2, 4(r3)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else.7749:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_all_object.2607:
	lwz	r30, 4(r30)
	li	r2, 0
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_net_item.2609:
	read	r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else.7751
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else.7751:
	addi	r6, r2, 1
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item.2609
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	stwx	r6, r2, r5
	blr
read_or_network.2611:
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_net_item.2609
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else.7752
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else.7752:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_or_network.2611
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	stwx	r6, r2, r5
	blr
read_and_network.2613:
	lwz	r5, 4(r30)
	li	r6, 0
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item.2609
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else.7753
	blr
beq_else.7753:
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	addi	r2, r5, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_parameter.2615:
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
	bl	read_or_network.2611
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
solver_rect_surface.2617:
	lwz	r9, 4(r30)
	slwi	r10, r6, 3
	lfdx	f3, r5, r10
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else.7756
	li	r2, 0
	blr
beq_else.7756:
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
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_abc.2539
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 56(r3)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_isinvert.2529
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lwz	r5, 52(r3)
	slwi	r6, r5, 3
	lwz	r7, 48(r3)
	lfdx	f1, r7, r6
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7760
	li	r6, 0
	b	ble_cont.7761
ble_else.7760:
	li	r6, 1
ble_cont.7761:
	mflr	r31
	mr	r5, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	xor.2466
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
	bl	fneg_cond.2471
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
	lwz	r7, 60(r3)
	lfdx	f1, r7, r6
	slwi	r6, r2, 3
	lfdx	f2, r5, r6
	fmul	f2, f0, f2
	lfd	f3, 24(r3)
	fadd	f2, f2, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else.7762
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont.7763
ble_else.7762:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont.7763:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.7764
	li	r2, 0
	blr
ble_else.7764:
	lwz	r2, 16(r3)
	slwi	r6, r2, 3
	lfdx	f1, r7, r6
	slwi	r6, r2, 3
	lfdx	f2, r5, r6
	fmul	f2, f0, f2
	lfd	f3, 8(r3)
	fadd	f2, f2, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else.7765
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont.7766
ble_else.7765:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont.7766:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.7767
	li	r2, 0
	blr
ble_else.7767:
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_rect.2626:
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
	bne	cr7, beq_else.7768
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
	bne	cr7, beq_else.7769
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
	bne	cr7, beq_else.7770
	li	r2, 0
	blr
beq_else.7770:
	li	r2, 3
	blr
beq_else.7769:
	li	r2, 2
	blr
beq_else.7768:
	li	r2, 1
	blr
solver_surface.2632:
	lwz	r6, 4(r30)
	stw	r6, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	stw	r5, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc.2539
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	stw	r5, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod.2498
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7772
	li	r2, 0
	blr
ble_else.7772:
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lfd	f3, 8(r3)
	lwz	r2, 36(r3)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod2.2501
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	fneg	f0, f0
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
quadratic.2638:
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
	bl	o_param_a.2533
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
	bl	o_param_b.2535
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
	bl	o_param_c.2537
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
	bl	o_isrot.2531
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7774
	lfd	f0, 72(r3)
	blr
beq_else.7774:
	lfd	f0, 8(r3)
	lfd	f1, 16(r3)
	fmul	f2, f1, f0
	lwz	r2, 24(r3)
	stfd	f2, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r1.2557
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
	bl	o_param_r2.2559
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
	bl	o_param_r3.2561
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	blr
bilinear.2643:
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
	bl	o_param_a.2533
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
	bl	o_param_b.2535
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
	bl	o_param_c.2537
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
	bl	o_isrot.2531
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7776
	lfd	f0, 96(r3)
	blr
beq_else.7776:
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
	bl	o_param_r1.2557
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
	bl	o_param_r2.2559
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
	bl	o_param_r3.2561
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	blr
solver_second.2651:
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
	bl	quadratic.2638
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7778
	li	r2, 0
	blr
beq_else.7778:
	lwz	r2, 36(r3)
	lfd	f1, 0(r2)
	lfd	f2, 8(r2)
	lfd	f3, 16(r2)
	lfd	f4, 24(r3)
	lfd	f5, 16(r3)
	lfd	f6, 8(r3)
	lwz	r2, 32(r3)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	fmr	f3, f4
	fmr	f4, f5
	fmr	f5, f6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	bilinear.2643
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
	bl	quadratic.2638
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_form.2525
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7779
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	b	beq_cont.7780
beq_else.7779:
	lfd	f0, 56(r3)
beq_cont.7780:
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7781
	li	r2, 0
	blr
ble_else.7781:
	fsqrt	f0, f0
	lwz	r2, 32(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_isinvert.2529
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7782
	lfd	f0, 72(r3)
	fneg	f0, f0
	b	beq_cont.7783
beq_else.7782:
	lfd	f0, 72(r3)
beq_cont.7783:
	lfd	f1, 48(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver.2657:
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
	bl	o_param_x.2541
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
	bl	o_param_y.2543
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
	bl	o_param_z.2545
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
	bl	o_form.2525
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7784
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7784:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7785
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7785:
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_rect_fast.2661:
	lwz	r7, 4(r30)
	lfd	f3, 0(r6)
	fsub	f3, f3, f0
	lfd	f4, 8(r6)
	fmul	f3, f3, f4
	stw	r7, 0(r3)
	stfd	f0, 8(r3)
	stw	r6, 16(r3)
	stfd	f2, 24(r3)
	stw	r2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f3, 48(r3)
	stw	r5, 56(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_b.2535
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 8(r2)
	lfd	f2, 48(r3)
	fmul	f1, f2, f1
	lfd	f3, 40(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7789
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7790
ble_else.7789:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7790:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7791
	li	r5, 0
	b	ble_cont.7792
ble_else.7791:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_c.2537
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 16(r2)
	lfd	f2, 48(r3)
	fmul	f1, f2, f1
	lfd	f3, 24(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7793
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7794
ble_else.7793:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7794:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7795
	li	r5, 0
	b	ble_cont.7796
ble_else.7795:
	lwz	r5, 16(r3)
	lfd	f0, 8(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7797
	li	r5, 0
	b	beq_cont.7798
beq_else.7797:
	li	r5, 1
beq_cont.7798:
ble_cont.7796:
ble_cont.7792:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7799
	lwz	r5, 16(r3)
	lfd	f0, 16(r5)
	lfd	f1, 40(r3)
	fsub	f0, f0, f1
	lfd	f2, 24(r5)
	fmul	f0, f0, f2
	lwz	r6, 32(r3)
	stfd	f0, 64(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_a.2533
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 0(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 8(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7801
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7802
ble_else.7801:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7802:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7803
	li	r5, 0
	b	ble_cont.7804
ble_else.7803:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c.2537
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 16(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 24(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7805
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7806
ble_else.7805:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7806:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7807
	li	r5, 0
	b	ble_cont.7808
ble_else.7807:
	lwz	r5, 16(r3)
	lfd	f0, 24(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7809
	li	r5, 0
	b	beq_cont.7810
beq_else.7809:
	li	r5, 1
beq_cont.7810:
ble_cont.7808:
ble_cont.7804:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7811
	lwz	r5, 16(r3)
	lfd	f0, 32(r5)
	lfd	f1, 24(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r5)
	fmul	f0, f0, f1
	lwz	r6, 32(r3)
	stfd	f0, 72(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_a.2533
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 0(r2)
	lfd	f2, 72(r3)
	fmul	f1, f2, f1
	lfd	f3, 8(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7812
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7813
ble_else.7812:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7813:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7814
	li	r2, 0
	b	ble_cont.7815
ble_else.7814:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_b.2535
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 8(r2)
	lfd	f2, 72(r3)
	fmul	f1, f2, f1
	lfd	f3, 40(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else.7816
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.7817
ble_else.7816:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont.7817:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7818
	li	r2, 0
	b	ble_cont.7819
ble_else.7818:
	lwz	r2, 16(r3)
	lfd	f0, 40(r2)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7820
	li	r2, 0
	b	beq_cont.7821
beq_else.7820:
	li	r2, 1
beq_cont.7821:
ble_cont.7819:
ble_cont.7815:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7822
	li	r2, 0
	blr
beq_else.7822:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 3
	blr
beq_else.7811:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 2
	blr
beq_else.7799:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 1
	blr
solver_surface_fast.2668:
	lwz	r2, 4(r30)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f3, 0(r31)
	lfd	f4, 0(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else.7823
	li	r2, 0
	blr
ble_else.7823:
	lfd	f3, 8(r5)
	fmul	f0, f3, f0
	lfd	f3, 16(r5)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 24(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast.2674:
	lwz	r6, 4(r30)
	lfd	f3, 0(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else.7824
	li	r2, 0
	blr
beq_else.7824:
	lfd	f4, 8(r5)
	fmul	f4, f4, f0
	lfd	f5, 16(r5)
	fmul	f5, f5, f1
	fadd	f4, f4, f5
	lfd	f5, 24(r5)
	fmul	f5, f5, f2
	fadd	f4, f4, f5
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stfd	f3, 8(r3)
	stfd	f4, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	quadratic.2638
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_form.2525
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7826
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	b	beq_cont.7827
beq_else.7826:
	lfd	f0, 32(r3)
beq_cont.7827:
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
	lfd	f1, 40(r3)
	lfd	f2, 8(r3)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7828
	li	r2, 0
	blr
ble_else.7828:
	lwz	r2, 24(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_isinvert.2529
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7829
	lfd	f0, 48(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont.7830
beq_else.7829:
	lfd	f0, 48(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont.7830:
	li	r2, 1
	blr
solver_fast.2680:
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
	bl	o_param_x.2541
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
	bl	o_param_y.2543
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
	bl	o_param_z.2545
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
	bl	d_const.2586
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
	bl	o_form.2525
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7832
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	d_vec.2584
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
beq_else.7832:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7833
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7833:
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_surface_fast2.2684:
	lwz	r2, 4(r30)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7834
	li	r2, 0
	blr
ble_else.7834:
	lfd	f0, 0(r5)
	lfd	f1, 24(r6)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast2.2691:
	lwz	r7, 4(r30)
	lfd	f3, 0(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else.7835
	li	r2, 0
	blr
beq_else.7835:
	lfd	f4, 8(r5)
	fmul	f0, f4, f0
	lfd	f4, 16(r5)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 24(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r6)
	stw	r7, 0(r3)
	stw	r5, 4(r3)
	stfd	f0, 8(r3)
	stw	r2, 16(r3)
	stfd	f1, 24(r3)
	stfd	f3, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_fsqr
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	lfd	f2, 32(r3)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7837
	li	r2, 0
	blr
ble_else.7837:
	lwz	r2, 16(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert.2529
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7838
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont.7839
beq_else.7838:
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont.7839:
	li	r2, 1
	blr
solver_fast2.2698:
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
	bl	o_param_ctbl.2563
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
	bl	d_const.2586
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
	bl	o_form.2525
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7841
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec.2584
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
beq_else.7841:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7842
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
beq_else.7842:
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
setup_rect_table.2701:
	li	r6, 6
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7843
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stfd	f0, 8(r2)
	b	beq_cont.7844
beq_else.7843:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert.2529
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7845
	li	r6, 0
	b	ble_cont.7846
ble_else.7845:
	li	r6, 1
ble_cont.7846:
	mflr	r31
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	xor.2466
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_a.2533
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond.2471
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont.7844:
	lfd	f0, 8(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7847
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stfd	f0, 24(r2)
	b	beq_cont.7848
beq_else.7847:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert.2529
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7849
	li	r6, 0
	b	ble_cont.7850
ble_else.7849:
	li	r6, 1
ble_cont.7850:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor.2466
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_b.2535
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond.2471
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 24(r2)
beq_cont.7848:
	lfd	f0, 16(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.7851
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	stfd	f0, 40(r2)
	b	beq_cont.7852
beq_else.7851:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert.2529
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7853
	li	r6, 0
	b	ble_cont.7854
ble_else.7853:
	li	r6, 1
ble_cont.7854:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor.2466
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_c.2537
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	fneg_cond.2471
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 32(r2)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fdiv	f0, f0, f1
	stfd	f0, 40(r2)
beq_cont.7852:
	blr
setup_surface_table.2704:
	li	r6, 4
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	bl	o_param_a.2533
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
	bl	o_param_b.2535
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
	bl	o_param_c.2537
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7856
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	b	ble_cont.7857
ble_else.7856:
	lis	r31, ha16(l.5177)
	addi	r31, r31, lo16(l.5177)
	lfd	f1, 0(r31)
	fdiv	f1, f1, f0
	lwz	r2, 8(r3)
	stfd	f1, 0(r2)
	lwz	r5, 0(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_a.2533
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_b.2535
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c.2537
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
ble_cont.7857:
	blr
setup_second_table.2707:
	li	r6, 5
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	bl	quadratic.2638
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
	bl	o_param_a.2533
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	fneg	f0, f0
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 32(r3)
	stfd	f1, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_b.2535
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	fneg	f0, f0
	lwz	r2, 4(r3)
	lfd	f1, 16(r2)
	lwz	r5, 0(r3)
	stfd	f0, 48(r3)
	stfd	f1, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c.2537
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	fneg	f0, f0
	lwz	r2, 8(r3)
	lfd	f1, 16(r3)
	stfd	f1, 0(r2)
	lwz	r5, 0(r3)
	stfd	f0, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_isrot.2531
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7859
	lwz	r2, 8(r3)
	lfd	f0, 32(r3)
	stfd	f0, 8(r2)
	lfd	f0, 48(r3)
	stfd	f0, 16(r2)
	lfd	f0, 64(r3)
	stfd	f0, 24(r2)
	b	beq_cont.7860
beq_else.7859:
	lwz	r2, 4(r3)
	lfd	f0, 16(r2)
	lwz	r5, 0(r3)
	stfd	f0, 72(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_r2.2559
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
	bl	o_param_r3.2561
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
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
	bl	o_param_r1.2557
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
	bl	o_param_r3.2561
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
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
	bl	o_param_r1.2557
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
	bl	o_param_r2.2559
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
beq_cont.7860:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bne	cr7, beq_else.7861
	b	beq_cont.7862
beq_else.7861:
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 32(r2)
beq_cont.7862:
	blr
iter_setup_dirvec_constants.2710:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.7863
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r6, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_const.2586
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec.2584
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_form.2525
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7864
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_rect_table.2701
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont.7865
beq_else.7864:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7866
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_surface_table.2704
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont.7867
beq_else.7866:
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_second_table.2707
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
beq_cont.7867:
beq_cont.7865:
	subi	r5, r5, 1
	lwz	r2, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.7863:
	blr
setup_dirvec_constants.2713:
	lwz	r5, 8(r30)
	lwz	r30, 4(r30)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
setup_startp_constants.2715:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.7869
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
	bl	o_param_ctbl.2563
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2525
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
	bl	o_param_x.2541
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
	bl	o_param_y.2543
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
	bl	o_param_z.2545
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 16(r2)
	lwz	r5, 20(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7870
	lwz	r5, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_abc.2539
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
	bl	veciprod2.2501
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
	b	beq_cont.7871
beq_else.7870:
	cmpwi	cr7, r5, 2
	bgt	cr7, ble_else.7872
	b	ble_cont.7873
ble_else.7872:
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
	lwz	r6, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	quadratic.2638
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7874
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont.7875
beq_else.7874:
beq_cont.7875:
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
ble_cont.7873:
beq_cont.7871:
	lwz	r2, 4(r3)
	subi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.7869:
	blr
setup_startp.2718:
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
	bl	veccpy.2487
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
is_rect_outside.2720:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a.2533
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	lfd	f2, 24(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else.7878
	fneg	f1, f2
	b	ble_cont.7879
ble_else.7878:
	fmr	f1, f2
ble_cont.7879:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7880
	li	r2, 0
	b	ble_cont.7881
ble_else.7880:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_b.2535
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else.7882
	fneg	f1, f2
	b	ble_cont.7883
ble_else.7882:
	fmr	f1, f2
ble_cont.7883:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7884
	li	r2, 0
	b	ble_cont.7885
ble_else.7884:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_c.2537
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else.7886
	fneg	f1, f2
	b	ble_cont.7887
ble_else.7886:
	fmr	f1, f2
ble_cont.7887:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7888
	li	r2, 0
	b	ble_cont.7889
ble_else.7888:
	li	r2, 1
ble_cont.7889:
ble_cont.7885:
ble_cont.7881:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7890
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_isinvert.2529
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7891
	li	r2, 1
	blr
beq_else.7891:
	li	r2, 0
	blr
beq_else.7890:
	lwz	r2, 16(r3)
	b	o_isinvert.2529
is_plane_outside.2725:
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc.2539
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod2.2501
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_isinvert.2529
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7893
	li	r5, 0
	b	ble_cont.7894
ble_else.7893:
	li	r5, 1
ble_cont.7894:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	xor.2466
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7895
	li	r2, 1
	blr
beq_else.7895:
	li	r2, 0
	blr
is_second_outside.2730:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	quadratic.2638
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form.2525
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.7897
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	b	beq_cont.7898
beq_else.7897:
	lfd	f0, 8(r3)
beq_cont.7898:
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert.2529
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7899
	li	r5, 0
	b	ble_cont.7900
ble_else.7899:
	li	r5, 1
ble_cont.7900:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor.2466
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7901
	li	r2, 1
	blr
beq_else.7901:
	li	r2, 0
	blr
is_outside.2735:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x.2541
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
	bl	o_param_y.2543
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
	bl	o_param_z.2545
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
	bl	o_form.2525
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7903
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_rect_outside.2720
beq_else.7903:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7904
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_plane_outside.2725
beq_else.7904:
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_second_outside.2730
check_all_inside.2740:
	lwz	r6, 4(r30)
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else.7905
	li	r2, 1
	blr
beq_else.7905:
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
	bl	is_outside.2735
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7906
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
beq_else.7906:
	li	r2, 0
	blr
shadow_check_and_group.2746:
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
	bne	cr7, beq_else.7907
	li	r2, 0
	blr
beq_else.7907:
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
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7908
	li	r2, 0
	b	beq_cont.7909
beq_else.7908:
	lis	r31, ha16(l.5508)
	addi	r31, r31, lo16(l.5508)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7910
	li	r2, 0
	b	ble_cont.7911
ble_else.7910:
	li	r2, 1
ble_cont.7911:
beq_cont.7909:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7912
	lwz	r2, 28(r3)
	slwi	r2, r2, 2
	lwz	r5, 24(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_isinvert.2529
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7913
	li	r2, 0
	blr
beq_else.7913:
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7912:
	lis	r31, ha16(l.5509)
	addi	r31, r31, lo16(l.5509)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
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
	stw	r31, 36(r3)
	addi	r3, r3, 40
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7914
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7914:
	li	r2, 1
	blr
shadow_check_one_or_group.2749:
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	slwi	r8, r2, 2
	lwzx	r8, r5, r8
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else.7915
	li	r2, 0
	blr
beq_else.7915:
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
	bne	cr7, beq_else.7916
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7916:
	li	r2, 1
	blr
shadow_check_one_or_matrix.2752:
	lwz	r6, 20(r30)
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else.7917
	li	r2, 0
	blr
beq_else.7917:
	stw	r11, 0(r3)
	stw	r8, 4(r3)
	stw	r5, 8(r3)
	stw	r30, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else.7918
	li	r2, 1
	b	beq_cont.7919
beq_else.7918:
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
	bne	cr7, beq_else.7920
	li	r2, 0
	b	beq_cont.7921
beq_else.7920:
	lis	r31, ha16(l.5521)
	addi	r31, r31, lo16(l.5521)
	lfd	f0, 0(r31)
	lwz	r2, 20(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7922
	li	r2, 0
	b	ble_cont.7923
ble_else.7922:
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
	bne	cr7, beq_else.7924
	li	r2, 0
	b	beq_cont.7925
beq_else.7924:
	li	r2, 1
beq_cont.7925:
ble_cont.7923:
beq_cont.7921:
beq_cont.7919:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7926
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7926:
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
	bne	cr7, beq_else.7927
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7927:
	li	r2, 1
	blr
solve_each_element.2755:
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
	bne	cr7, beq_else.7928
	blr
beq_else.7928:
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
	bne	cr7, beq_else.7930
	lwz	r2, 48(r3)
	slwi	r2, r2, 2
	lwz	r5, 44(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert.2529
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7931
	blr
beq_else.7931:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7930:
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7933
	b	ble_cont.7934
ble_else.7933:
	lwz	r5, 20(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7935
	b	ble_cont.7936
ble_else.7935:
	lis	r31, ha16(l.5509)
	addi	r31, r31, lo16(l.5509)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r6, 28(r3)
	lfd	f1, 0(r6)
	fmul	f1, f1, f0
	lwz	r7, 16(r3)
	lfd	f2, 0(r7)
	fadd	f1, f1, f2
	lfd	f2, 8(r6)
	fmul	f2, f2, f0
	lfd	f3, 8(r7)
	fadd	f2, f2, f3
	lfd	f3, 16(r6)
	fmul	f3, f3, f0
	lfd	f4, 16(r7)
	fadd	f3, f3, f4
	li	r7, 0
	lwz	r8, 32(r3)
	lwz	r30, 12(r3)
	stw	r2, 52(r3)
	stfd	f3, 56(r3)
	stfd	f2, 64(r3)
	stfd	f1, 72(r3)
	stfd	f0, 80(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 92(r3)
	addi	r3, r3, 96
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7937
	b	beq_cont.7938
beq_else.7937:
	lwz	r2, 20(r3)
	lfd	f0, 80(r3)
	stfd	f0, 0(r2)
	lfd	f0, 72(r3)
	lfd	f1, 64(r3)
	lfd	f2, 56(r3)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	vecset.2477
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 48(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 52(r3)
	stw	r5, 0(r2)
beq_cont.7938:
ble_cont.7936:
ble_cont.7934:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network.2759:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.7939
	blr
beq_else.7939:
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
trace_or_matrix.2763:
	lwz	r7, 20(r30)
	lwz	r8, 16(r30)
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r5, r12
	lwz	r13, 0(r12)
	cmpwi	cr7, r13, -1
	bne	cr7, beq_else.7941
	blr
beq_else.7941:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r13, 99
	bne	cr7, beq_else.7943
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
	b	beq_cont.7944
beq_else.7943:
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
	bne	cr7, beq_else.7945
	b	beq_cont.7946
beq_else.7945:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7947
	b	ble_cont.7948
ble_else.7947:
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
ble_cont.7948:
beq_cont.7946:
beq_cont.7944:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection.2767:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l.5542)
	addi	r31, r31, lo16(l.5542)
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
	lfd	f0, 0(r2)
	lis	r31, ha16(l.5521)
	addi	r31, r31, lo16(l.5521)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7949
	li	r2, 0
	blr
ble_else.7949:
	lis	r31, ha16(l.5546)
	addi	r31, r31, lo16(l.5546)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7950
	li	r2, 0
	blr
ble_else.7950:
	li	r2, 1
	blr
solve_each_element_fast.2769:
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
	bl	d_vec.2584
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else.7951
	blr
beq_else.7951:
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
	bne	cr7, beq_else.7953
	lwz	r2, 56(r3)
	slwi	r2, r2, 2
	lwz	r5, 32(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_isinvert.2529
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7954
	blr
beq_else.7954:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7953:
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7956
	b	ble_cont.7957
ble_else.7956:
	lwz	r5, 20(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7958
	b	ble_cont.7959
ble_else.7958:
	lis	r31, ha16(l.5509)
	addi	r31, r31, lo16(l.5509)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r6, 52(r3)
	lfd	f1, 0(r6)
	fmul	f1, f1, f0
	lwz	r7, 16(r3)
	lfd	f2, 0(r7)
	fadd	f1, f1, f2
	lfd	f2, 8(r6)
	fmul	f2, f2, f0
	lfd	f3, 8(r7)
	fadd	f2, f2, f3
	lfd	f3, 16(r6)
	fmul	f3, f3, f0
	lfd	f4, 16(r7)
	fadd	f3, f3, f4
	li	r6, 0
	lwz	r7, 44(r3)
	lwz	r30, 12(r3)
	stw	r2, 60(r3)
	stfd	f3, 64(r3)
	stfd	f2, 72(r3)
	stfd	f1, 80(r3)
	stfd	f0, 88(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
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
	bne	cr7, beq_else.7960
	b	beq_cont.7961
beq_else.7960:
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
	bl	vecset.2477
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 56(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 60(r3)
	stw	r5, 0(r2)
beq_cont.7961:
ble_cont.7959:
ble_cont.7957:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network_fast.2773:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.7962
	blr
beq_else.7962:
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
trace_or_matrix_fast.2777:
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else.7964
	blr
beq_else.7964:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else.7966
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
	b	beq_cont.7967
beq_else.7966:
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
	bne	cr7, beq_else.7968
	b	beq_cont.7969
beq_else.7968:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7970
	b	ble_cont.7971
ble_else.7970:
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
ble_cont.7971:
beq_cont.7969:
beq_cont.7967:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection_fast.2781:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l.5542)
	addi	r31, r31, lo16(l.5542)
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
	lfd	f0, 0(r2)
	lis	r31, ha16(l.5521)
	addi	r31, r31, lo16(l.5521)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.7972
	li	r2, 0
	blr
ble_else.7972:
	lis	r31, ha16(l.5546)
	addi	r31, r31, lo16(l.5546)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.7973
	li	r2, 0
	blr
ble_else.7973:
	li	r2, 1
	blr
get_nvector_rect.2783:
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
	bl	vecbzero.2485
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
	bl	sgn.2469
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 12(r3)
	slwi	r2, r2, 3
	lwz	r5, 0(r3)
	stfdx	f0, r5, r2
	blr
get_nvector_plane.2785:
	lwz	r5, 4(r30)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_a.2533
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_b.2535
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_c.2537
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
get_nvector_second.2787:
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
	bl	o_param_x.2541
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
	bl	o_param_y.2543
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
	bl	o_param_z.2545
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
	bl	o_param_a.2533
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
	bl	o_param_b.2535
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
	bl	o_param_c.2537
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
	bl	o_isrot.2531
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7977
	lwz	r2, 0(r3)
	lfd	f0, 64(r3)
	stfd	f0, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 8(r2)
	lfd	f0, 80(r3)
	stfd	f0, 16(r2)
	b	beq_cont.7978
beq_else.7977:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r3.2561
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
	bl	o_param_r2.2559
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f2, 88(r3)
	fadd	f0, f2, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f2, 0(r31)
	fmul	f0, f0, f2
	lfd	f2, 64(r3)
	fadd	f0, f2, f0
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r3.2561
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
	bl	o_param_r1.2557
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 72(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r2.2559
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
	bl	o_param_r1.2557
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 16(r2)
beq_cont.7978:
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_isinvert.2529
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	b	vecunit_sgn.2495
get_nvector.2789:
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
	bl	o_form.2525
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.7979
	lwz	r2, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7979:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.7980
	lwz	r2, 4(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.7980:
	lwz	r2, 4(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
utexture.2792:
	lwz	r6, 4(r30)
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_texturetype.2523
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_red.2551
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
	bl	o_color_green.2553
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
	bl	o_color_blue.2555
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 1
	bne	cr7, beq_else.7981
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x.2541
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5608)
	addi	r31, r31, lo16(l.5608)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l.5609)
	addi	r31, r31, lo16(l.5609)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l.5600)
	addi	r31, r31, lo16(l.5600)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else.7982
	li	r2, 0
	b	ble_cont.7983
ble_else.7982:
	li	r2, 1
ble_cont.7983:
	lwz	r5, 0(r3)
	lfd	f0, 16(r5)
	lwz	r5, 8(r3)
	stw	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_z.2545
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5608)
	addi	r31, r31, lo16(l.5608)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l.5609)
	addi	r31, r31, lo16(l.5609)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l.5600)
	addi	r31, r31, lo16(l.5600)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else.7985
	li	r2, 0
	b	ble_cont.7986
ble_else.7985:
	li	r2, 1
ble_cont.7986:
	lwz	r5, 24(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.7987
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7989
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f0, 0(r31)
	b	beq_cont.7990
beq_else.7989:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
beq_cont.7990:
	b	beq_cont.7988
beq_else.7987:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.7991
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	beq_cont.7992
beq_else.7991:
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f0, 0(r31)
beq_cont.7992:
beq_cont.7988:
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	blr
beq_else.7981:
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.7994
	lwz	r5, 0(r3)
	lfd	f0, 8(r5)
	lis	r31, ha16(l.5604)
	addi	r31, r31, lo16(l.5604)
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
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	lwz	r2, 4(r3)
	stfd	f1, 0(r2)
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 8(r2)
	blr
beq_else.7994:
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else.7996
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_x.2541
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
	bl	o_param_z.2545
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
	lis	r31, ha16(l.5600)
	addi	r31, r31, lo16(l.5600)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	fsqrt	f0, f0
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l.5592)
	addi	r31, r31, lo16(l.5592)
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
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lwz	r2, 4(r3)
	stfd	f1, 8(r2)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 16(r2)
	blr
beq_else.7996:
	cmpwi	cr7, r5, 4
	bne	cr7, beq_else.7998
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 80(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_x.2541
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
	bl	o_param_a.2533
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
	bl	o_param_z.2545
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
	bl	o_param_c.2537
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
	lis	r31, ha16(l.5589)
	addi	r31, r31, lo16(l.5589)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f2, 0(r31)
	lfd	f3, 96(r3)
	fcmpu	cr7, f3, f2
	bgt	cr7, ble_else.7999
	fneg	f2, f3
	b	ble_cont.8000
ble_else.7999:
	fmr	f2, f3
ble_cont.8000:
	stfd	f0, 136(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.8001
	lfd	f1, 120(r3)
	fdiv	f2, f1, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else.8003
	fdiv	f1, f1, f3
	fneg	f1, f1
	b	ble_cont.8004
ble_else.8003:
	fdiv	f1, f1, f3
ble_cont.8004:
	mflr	r31
	fmr	f0, f1
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_atan
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lis	r31, ha16(l.5591)
	addi	r31, r31, lo16(l.5591)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5592)
	addi	r31, r31, lo16(l.5592)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont.8002
ble_else.8001:
	lis	r31, ha16(l.5590)
	addi	r31, r31, lo16(l.5590)
	lfd	f0, 0(r31)
ble_cont.8002:
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
	bl	o_param_y.2543
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
	bl	o_param_b.2535
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 160(r3)
	fmul	f0, f1, f0
	lis	r31, ha16(l.5589)
	addi	r31, r31, lo16(l.5589)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f2, 0(r31)
	lfd	f3, 136(r3)
	fcmpu	cr7, f3, f2
	bgt	cr7, ble_else.8005
	fneg	f2, f3
	b	ble_cont.8006
ble_else.8005:
	fmr	f2, f3
ble_cont.8006:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.8007
	fdiv	f1, f0, f3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else.8009
	fdiv	f0, f0, f3
	fneg	f0, f0
	b	ble_cont.8010
ble_else.8009:
	fdiv	f0, f0, f3
ble_cont.8010:
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	min_caml_atan
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lis	r31, ha16(l.5591)
	addi	r31, r31, lo16(l.5591)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5592)
	addi	r31, r31, lo16(l.5592)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont.8008
ble_else.8007:
	lis	r31, ha16(l.5590)
	addi	r31, r31, lo16(l.5590)
	lfd	f0, 0(r31)
ble_cont.8008:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l.5594)
	addi	r31, r31, lo16(l.5594)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f2, 0(r31)
	lfd	f3, 144(r3)
	fsub	f2, f2, f3
	stfd	f0, 168(r3)
	stfd	f1, 176(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_fsqr
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lfd	f1, 176(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f1, 0(r31)
	lfd	f2, 168(r3)
	fsub	f1, f1, f2
	stfd	f0, 184(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	min_caml_fsqr
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 184(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8011
	b	ble_cont.8012
ble_else.8011:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
ble_cont.8012:
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, ha16(l.5596)
	addi	r31, r31, lo16(l.5596)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
beq_else.7998:
	blr
add_light.2795:
	lwz	r5, 8(r30)
	lwz	r2, 4(r30)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f3, 0(r31)
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else.8016
	b	ble_cont.8017
ble_else.8016:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	vecaccum.2506
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont.8017:
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8018
	blr
ble_else.8018:
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fsqr
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_fsqr
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
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
trace_reflections.2799:
	lwz	r6, 32(r30)
	lwz	r7, 28(r30)
	lwz	r8, 24(r30)
	lwz	r9, 20(r30)
	lwz	r10, 16(r30)
	lwz	r11, 12(r30)
	lwz	r12, 8(r30)
	lwz	r13, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8021
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
	bl	r_dvec.2590
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
	bne	cr7, beq_else.8022
	b	beq_cont.8023
beq_else.8022:
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
	bl	r_surface_id.2588
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	cmpw	cr7, r5, r2
	bne	cr7, beq_else.8024
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
	bne	cr7, beq_else.8026
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	d_vec.2584
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veciprod.2498
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	r_bright.2592
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
	bl	d_vec.2584
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	veciprod.2498
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
	b	beq_cont.8027
beq_else.8026:
beq_cont.8027:
	b	beq_cont.8025
beq_else.8024:
beq_cont.8025:
beq_cont.8023:
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8021:
	blr
trace_ray.2804:
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
	bgt	cr7, ble_else.8030
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
	bl	p_surface_ids.2569
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
	bne	cr7, beq_else.8033
	li	r2, -1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 120(r3)
	stwx	r2, r7, r6
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else.8034
	blr
beq_else.8034:
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	veciprod.2498
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.8036
	blr
ble_else.8036:
	stfd	f0, 128(r3)
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
beq_else.8033:
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
	bl	o_reflectiontype.2527
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 140(r3)
	stw	r2, 144(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	o_diffuse.2547
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
	bl	veccpy.2487
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
	bl	p_intersection_points.2567
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
	bl	veccpy.2487
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_calc_diffuse.2571
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lis	r31, ha16(l.5358)
	addi	r31, r31, lo16(l.5358)
	lfd	f0, 0(r31)
	lwz	r5, 140(r3)
	stw	r2, 160(r3)
	stfd	f0, 168(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	o_diffuse.2547
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 168(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8042
	li	r2, 1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 160(r3)
	stwx	r2, r7, r6
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	p_energy.2573
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	lwz	r7, 48(r3)
	stw	r2, 176(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	veccpy.2487
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r2, 108(r3)
	slwi	r5, r2, 2
	lwz	r6, 176(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5631)
	addi	r31, r31, lo16(l.5631)
	lfd	f0, 0(r31)
	lfd	f1, 152(r3)
	fmul	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	vecscale.2516
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	p_nvectors.2582
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 44(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	veccpy.2487
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	b	ble_cont.8043
ble_else.8042:
	li	r2, 0
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 160(r3)
	stwx	r2, r7, r6
ble_cont.8043:
	lis	r31, ha16(l.5633)
	addi	r31, r31, lo16(l.5633)
	lfd	f0, 0(r31)
	lwz	r2, 112(r3)
	lwz	r5, 44(r3)
	stfd	f0, 184(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	veciprod.2498
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 184(r3)
	fmul	f0, f1, f0
	lwz	r2, 112(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	vecaccum.2506
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lwz	r2, 140(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	o_hilight.2549
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	li	r2, 0
	lwz	r5, 40(r3)
	lwz	r5, 0(r5)
	lwz	r30, 36(r3)
	stfd	f0, 192(r3)
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8045
	lwz	r2, 44(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	veciprod.2498
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	fneg	f0, f0
	lfd	f1, 152(r3)
	fmul	f0, f0, f1
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	stfd	f0, 200(r3)
	mflr	r31
	stw	r31, 212(r3)
	addi	r3, r3, 216
	bl	veciprod.2498
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	fneg	f1, f0
	lfd	f0, 200(r3)
	lfd	f2, 192(r3)
	lwz	r30, 32(r3)
	mflr	r31
	stw	r31, 212(r3)
	addi	r3, r3, 216
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	b	beq_cont.8046
beq_else.8045:
beq_cont.8046:
	lwz	r2, 64(r3)
	lwz	r30, 28(r3)
	mflr	r31
	stw	r31, 212(r3)
	addi	r3, r3, 216
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lfd	f0, 152(r3)
	lfd	f1, 192(r3)
	lwz	r5, 112(r3)
	lwz	r30, 20(r3)
	mflr	r31
	stw	r31, 212(r3)
	addi	r3, r3, 216
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	lis	r31, ha16(l.5636)
	addi	r31, r31, lo16(l.5636)
	lfd	f0, 0(r31)
	lfd	f1, 96(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8047
	blr
ble_else.8047:
	lwz	r2, 108(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else.8049
	b	bge_cont.8050
bge_else.8049:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 120(r3)
	stwx	r6, r7, r5
bge_cont.8050:
	lwz	r5, 144(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else.8051
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r5, 140(r3)
	stfd	f0, 208(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 220(r3)
	addi	r3, r3, 224
	bl	o_diffuse.2547
	subi	r3, r3, 224
	lwz	r31, 220(r3)
	mtlr	r31
	lfd	f1, 208(r3)
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
beq_else.8051:
	blr
ble_else.8030:
	blr
trace_diffuse_ray.2810:
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
	bne	cr7, beq_else.8054
	blr
beq_else.8054:
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
	bl	d_vec.2584
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
	bne	cr7, beq_else.8056
	lwz	r2, 20(r3)
	lwz	r5, 16(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veciprod.2498
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.8057
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	b	ble_cont.8058
ble_else.8057:
ble_cont.8058:
	lfd	f1, 8(r3)
	fmul	f0, f1, f0
	lwz	r2, 56(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_diffuse.2547
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	vecaccum.2506
beq_else.8056:
	blr
iter_trace_diffuse_rays.2813:
	lwz	r8, 4(r30)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else.8061
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
	bl	d_vec.2584
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	veciprod.2498
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8062
	lwz	r2, 16(r3)
	slwi	r5, r2, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5654)
	addi	r31, r31, lo16(l.5654)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont.8063
ble_else.8062:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l.5652)
	addi	r31, r31, lo16(l.5652)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r30, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont.8063:
	lwz	r2, 16(r3)
	subi	r7, r2, 2
	lwz	r2, 12(r3)
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8061:
	blr
trace_diffuse_rays.2818:
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
trace_diffuse_ray_80percent.2822:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8065
	b	beq_cont.8066
beq_else.8065:
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
beq_cont.8066:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.8067
	b	beq_cont.8068
beq_else.8067:
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
beq_cont.8068:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8069
	b	beq_cont.8070
beq_else.8069:
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
beq_cont.8070:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else.8071
	b	beq_cont.8072
beq_else.8071:
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
beq_cont.8072:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else.8073
	blr
beq_else.8073:
	lwz	r2, 12(r3)
	lwz	r2, 16(r2)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_diffuse_using_1point.2826:
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
	bl	p_received_ray_20percent.2575
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors.2582
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_intersection_points.2567
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_energy.2573
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
	bl	veccpy.2487
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_group_id.2577
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
	b	vecaccumv.2519
calc_diffuse_using_5points.2829:
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
	bl	p_received_ray_20percent.2575
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
	bl	p_received_ray_20percent.2575
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
	bl	p_received_ray_20percent.2575
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
	bl	p_received_ray_20percent.2575
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
	bl	p_received_ray_20percent.2575
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
	bl	veccpy.2487
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
	bl	vecadd.2510
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
	bl	vecadd.2510
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
	bl	vecadd.2510
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
	bl	vecadd.2510
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
	bl	p_energy.2573
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r2, 0(r3)
	lwz	r6, 4(r3)
	b	vecaccumv.2519
do_without_neighbors.2835:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else.8075
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_surface_ids.2569
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8076
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_calc_diffuse.2571
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8077
	b	beq_cont.8078
beq_else.8077:
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
beq_cont.8078:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8076:
	blr
ble_else.8075:
	blr
neighbors_exist.2838:
	lwz	r6, 4(r30)
	lwz	r7, 4(r6)
	addi	r8, r5, 1
	cmpw	cr7, r7, r8
	bgt	cr7, ble_else.8081
	li	r2, 0
	blr
ble_else.8081:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else.8082
	li	r2, 0
	blr
ble_else.8082:
	lwz	r5, 0(r6)
	addi	r6, r2, 1
	cmpw	cr7, r5, r6
	bgt	cr7, ble_else.8083
	li	r2, 0
	blr
ble_else.8083:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else.8084
	li	r2, 0
	blr
ble_else.8084:
	li	r2, 1
	blr
get_surface_id.2842:
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	p_surface_ids.2569
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	blr
neighbors_are_available.2845:
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
	bl	get_surface_id.2842
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
	bl	get_surface_id.2842
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8085
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
	bl	get_surface_id.2842
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8086
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
	bl	get_surface_id.2842
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8087
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
	bl	get_surface_id.2842
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else.8088
	li	r2, 1
	blr
beq_else.8088:
	li	r2, 0
	blr
beq_else.8087:
	li	r2, 0
	blr
beq_else.8086:
	li	r2, 0
	blr
beq_else.8085:
	li	r2, 0
	blr
try_exploit_neighbors.2851:
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r7, r12
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else.8089
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
	bl	get_surface_id.2842
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8090
	lwz	r2, 36(r3)
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r7, 24(r3)
	lwz	r8, 20(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	neighbors_are_available.2845
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8091
	lwz	r2, 36(r3)
	slwi	r2, r2, 2
	lwz	r5, 28(r3)
	lwzx	r2, r5, r2
	lwz	r5, 20(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8091:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_calc_diffuse.2571
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r8, 20(r3)
	slwi	r5, r8, 2
	lwzx	r2, r2, r5
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8092
	b	beq_cont.8093
beq_else.8092:
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
beq_cont.8093:
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
bge_else.8090:
	blr
ble_else.8089:
	blr
write_ppm_header.2858:
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
write_rgb_element.2860:
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else.8096
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8098
	b	bge_cont.8099
bge_else.8098:
	li	r2, 0
bge_cont.8099:
	b	ble_cont.8097
ble_else.8096:
	li	r2, 255
ble_cont.8097:
	b	min_caml_print_int
write_rgb.2862:
	lwz	r2, 4(r30)
	lfd	f0, 0(r2)
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element.2860
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
	bl	write_rgb_element.2860
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
	bl	write_rgb_element.2860
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	b	min_caml_print_char
pretrace_diffuse_rays.2864:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else.8100
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id.2842
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8101
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_calc_diffuse.2571
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.8102
	b	beq_cont.8103
beq_else.8102:
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_group_id.2577
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	vecbzero.2485
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors.2582
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_intersection_points.2567
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
	bl	p_received_ray_20percent.2575
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
	bl	veccpy.2487
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont.8103:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	lwz	r2, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else.8101:
	blr
ble_else.8100:
	blr
pretrace_pixels.2867:
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
	blt	cr7, bge_else.8106
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
	bl	vecunit_sgn.2495
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	vecbzero.2485
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy.2487
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r2, 0
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	bl	p_rgb.2565
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy.2487
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
	bl	p_set_group_id.2579
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
	bl	add_mod5.2474
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
bge_else.8106:
	blr
pretrace_line.2874:
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
scan_pixel.2878:
	lwz	r9, 24(r30)
	lwz	r10, 20(r30)
	lwz	r11, 16(r30)
	lwz	r12, 12(r30)
	lwz	r13, 8(r30)
	lwz	r14, 4(r30)
	lwz	r13, 0(r13)
	cmpw	cr7, r13, r2
	bgt	cr7, ble_else.8108
	blr
ble_else.8108:
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
	bl	p_rgb.2565
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veccpy.2487
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
	bne	cr7, beq_else.8110
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
	b	beq_cont.8111
beq_else.8110:
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
beq_cont.8111:
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
scan_line.2884:
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	lwz	r12, 4(r11)
	cmpw	cr7, r12, r2
	bgt	cr7, ble_else.8112
	blr
ble_else.8112:
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
	bgt	cr7, ble_else.8114
	b	ble_cont.8115
ble_else.8114:
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
ble_cont.8115:
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
	bl	add_mod5.2474
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
create_float5x3array.2890:
	li	r2, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
create_pixel.2892:
	li	r2, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	bl	create_float5x3array.2890
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
	bl	create_float5x3array.2890
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_float5x3array.2890
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
	bl	create_float5x3array.2890
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
init_line_elements.2894:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8116
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel.2892
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements.2894
bge_else.8116:
	blr
create_pixelline.2897:
	lwz	r2, 4(r30)
	lwz	r5, 0(r2)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel.2892
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
	b	init_line_elements.2894
tan.2899:
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
adjust_position.2901:
	fmul	f0, f0, f0
	lis	r31, ha16(l.5636)
	addi	r31, r31, lo16(l.5636)
	lfd	f2, 0(r31)
	fadd	f0, f0, f2
	fsqrt	f0, f0
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
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
	bl	tan.2899
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fmul	f0, f0, f1
	blr
calc_dirvec.2904:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else.8117
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
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fdiv	f1, f1, f0
	lfd	f2, 24(r3)
	fdiv	f2, f2, f0
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
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
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	lfd	f1, 56(r3)
	lfd	f2, 48(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2477
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
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 56(r3)
	fneg	f2, f0
	lfd	f1, 64(r3)
	lfd	f3, 48(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2477
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
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	fneg	f1, f0
	lfd	f2, 56(r3)
	fneg	f3, f2
	lfd	f4, 48(r3)
	mflr	r31
	fmr	f2, f3
	fmr	f0, f4
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2477
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	fneg	f1, f0
	lfd	f2, 56(r3)
	fneg	f3, f2
	lfd	f4, 48(r3)
	fneg	f5, f4
	mflr	r31
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2477
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 41
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 64(r3)
	fneg	f1, f0
	lfd	f2, 48(r3)
	fneg	f3, f2
	lfd	f4, 56(r3)
	mflr	r31
	fmr	f2, f4
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecset.2477
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r2, r2, 81
	slwi	r2, r2, 2
	lwz	r5, 40(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec.2584
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f0, 48(r3)
	fneg	f0, f0
	lfd	f1, 64(r3)
	lfd	f2, 56(r3)
	b	vecset.2477
bge_else.8117:
	stfd	f2, 72(r3)
	stw	r6, 0(r3)
	stw	r5, 8(r3)
	stw	r30, 80(r3)
	stfd	f3, 88(r3)
	stw	r2, 96(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	adjust_position.2901
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r2, 96(r3)
	addi	r2, r2, 1
	lfd	f1, 88(r3)
	stfd	f0, 104(r3)
	stw	r2, 112(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	adjust_position.2901
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 104(r3)
	lfd	f2, 72(r3)
	lfd	f3, 88(r3)
	lwz	r2, 112(r3)
	lwz	r5, 8(r3)
	lwz	r6, 0(r3)
	lwz	r30, 80(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_dirvecs.2912:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8122
	itof	f1, r2
	lis	r31, ha16(l.5748)
	addi	r31, r31, lo16(l.5748)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l.5749)
	addi	r31, r31, lo16(l.5749)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r8, 0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5748)
	addi	r31, r31, lo16(l.5748)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5636)
	addi	r31, r31, lo16(l.5636)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
	lfd	f0, 0(r31)
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	bl	add_mod5.2474
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
bge_else.8122:
	blr
calc_dirvec_rows.2917:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8125
	itof	f0, r2
	lis	r31, ha16(l.5748)
	addi	r31, r31, lo16(l.5748)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l.5749)
	addi	r31, r31, lo16(l.5749)
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
	bl	add_mod5.2474
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
bge_else.8125:
	blr
create_dirvec.2921:
	lwz	r2, 4(r30)
	li	r5, 3
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
create_dirvec_elements.2923:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8127
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
bge_else.8127:
	blr
create_dirvecs.2926:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8129
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
bge_else.8129:
	blr
init_dirvec_constants.2928:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else.8131
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
bge_else.8131:
	blr
init_vecset_constants.2931:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8133
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
bge_else.8133:
	blr
init_dirvecs.2933:
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
add_reflection.2935:
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
	bl	d_vec.2584
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	vecset.2477
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
setup_rect_reflection.2942:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	lwz	r9, 0(r6)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
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
	bl	o_diffuse.2547
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	lfd	f1, 0(r2)
	fneg	f1, f1
	lfd	f2, 8(r2)
	fneg	f2, f2
	lfd	f3, 16(r2)
	fneg	f3, f3
	lwz	r5, 12(r3)
	addi	r6, r5, 1
	lfd	f4, 0(r2)
	lwz	r7, 4(r3)
	lwz	r30, 8(r3)
	stfd	f2, 32(r3)
	stfd	f3, 40(r3)
	stfd	f1, 48(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	fmr	f1, f4
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
	lfd	f0, 56(r3)
	lfd	f1, 48(r3)
	lfd	f3, 40(r3)
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
	lfd	f0, 56(r3)
	lfd	f1, 48(r3)
	lfd	f2, 32(r3)
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
setup_surface_reflection.2945:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	addi	r2, r2, 1
	lwz	r9, 0(r6)
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
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
	bl	o_diffuse.2547
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
	bl	o_param_abc.2539
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod.2498
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
	lfd	f1, 0(r31)
	lwz	r2, 20(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_a.2533
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
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 56(r3)
	stfd	f2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b.2535
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
	lis	r31, ha16(l.5300)
	addi	r31, r31, lo16(l.5300)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 72(r3)
	stfd	f2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_c.2537
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
setup_reflections.2948:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else.8141
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
	bl	o_reflectiontype.2527
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8142
	lis	r31, ha16(l.5176)
	addi	r31, r31, lo16(l.5176)
	lfd	f0, 0(r31)
	lwz	r2, 12(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_diffuse.2547
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.8143
	blr
ble_else.8143:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_form.2525
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else.8145
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8145:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else.8146
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else.8146:
	blr
beq_else.8142:
	blr
bge_else.8141:
	blr
rt.2950:
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
	lis	r31, ha16(l.5782)
	addi	r31, r31, lo16(l.5782)
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
	bl	d_vec.2584
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veccpy.2487
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5595)
	addi	r31, r31, lo16(l.5595)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5542)
	addi	r31, r31, lo16(l.5542)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r31, ha16(l.5175)
	addi	r31, r31, lo16(l.5175)
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
	lis	r6, ha16(read_screen_settings.2596)
	addi	r6, r6, lo16(read_screen_settings.2596)
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
	lis	r11, ha16(read_light.2598)
	addi	r11, r11, lo16(read_light.2598)
	stw	r11, 0(r10)
	lwz	r11, 16(r3)
	stw	r11, 8(r10)
	lwz	r12, 20(r3)
	stw	r12, 4(r10)
	mr	r13, r4
	addi	r4, r4, 8
	lis	r14, ha16(read_nth_object.2603)
	addi	r14, r14, lo16(read_nth_object.2603)
	stw	r14, 0(r13)
	lwz	r14, 4(r3)
	stw	r14, 4(r13)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r16, ha16(read_object.2605)
	addi	r16, r16, lo16(read_object.2605)
	stw	r16, 0(r15)
	stw	r13, 8(r15)
	lwz	r13, 0(r3)
	stw	r13, 4(r15)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_all_object.2607)
	addi	r17, r17, lo16(read_all_object.2607)
	stw	r17, 0(r16)
	stw	r15, 4(r16)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_and_network.2613)
	addi	r17, r17, lo16(read_and_network.2613)
	stw	r17, 0(r15)
	lwz	r17, 28(r3)
	stw	r17, 4(r15)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r19, ha16(read_parameter.2615)
	addi	r19, r19, lo16(read_parameter.2615)
	stw	r19, 0(r18)
	stw	r5, 20(r18)
	stw	r10, 16(r18)
	stw	r15, 12(r18)
	stw	r16, 8(r18)
	lwz	r5, 36(r3)
	stw	r5, 4(r18)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r15, ha16(solver_rect_surface.2617)
	addi	r15, r15, lo16(solver_rect_surface.2617)
	stw	r15, 0(r10)
	lwz	r15, 40(r3)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_rect.2626)
	addi	r19, r19, lo16(solver_rect.2626)
	stw	r19, 0(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface.2632)
	addi	r19, r19, lo16(solver_surface.2632)
	stw	r19, 0(r10)
	stw	r15, 4(r10)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r20, ha16(solver_second.2651)
	addi	r20, r20, lo16(solver_second.2651)
	stw	r20, 0(r19)
	stw	r15, 4(r19)
	mr	r20, r4
	addi	r4, r4, 24
	lis	r21, ha16(solver.2657)
	addi	r21, r21, lo16(solver.2657)
	stw	r21, 0(r20)
	stw	r10, 16(r20)
	stw	r19, 12(r20)
	stw	r16, 8(r20)
	stw	r14, 4(r20)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(solver_rect_fast.2661)
	addi	r16, r16, lo16(solver_rect_fast.2661)
	stw	r16, 0(r10)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast.2668)
	addi	r19, r19, lo16(solver_surface_fast.2668)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r21, ha16(solver_second_fast.2674)
	addi	r21, r21, lo16(solver_second_fast.2674)
	stw	r21, 0(r19)
	stw	r15, 4(r19)
	mr	r21, r4
	addi	r4, r4, 24
	lis	r22, ha16(solver_fast.2680)
	addi	r22, r22, lo16(solver_fast.2680)
	stw	r22, 0(r21)
	stw	r16, 16(r21)
	stw	r19, 12(r21)
	stw	r10, 8(r21)
	stw	r14, 4(r21)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast2.2684)
	addi	r19, r19, lo16(solver_surface_fast2.2684)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r22, ha16(solver_second_fast2.2691)
	addi	r22, r22, lo16(solver_second_fast2.2691)
	stw	r22, 0(r19)
	stw	r15, 4(r19)
	mr	r22, r4
	addi	r4, r4, 24
	lis	r23, ha16(solver_fast2.2698)
	addi	r23, r23, lo16(solver_fast2.2698)
	stw	r23, 0(r22)
	stw	r16, 16(r22)
	stw	r19, 12(r22)
	stw	r10, 8(r22)
	stw	r14, 4(r22)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(iter_setup_dirvec_constants.2710)
	addi	r16, r16, lo16(iter_setup_dirvec_constants.2710)
	stw	r16, 0(r10)
	stw	r14, 4(r10)
	mr	r16, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_dirvec_constants.2713)
	addi	r19, r19, lo16(setup_dirvec_constants.2713)
	stw	r19, 0(r16)
	stw	r13, 8(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(setup_startp_constants.2715)
	addi	r19, r19, lo16(setup_startp_constants.2715)
	stw	r19, 0(r10)
	stw	r14, 4(r10)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r23, ha16(setup_startp.2718)
	addi	r23, r23, lo16(setup_startp.2718)
	stw	r23, 0(r19)
	lwz	r23, 92(r3)
	stw	r23, 12(r19)
	stw	r10, 8(r19)
	stw	r13, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r24, ha16(check_all_inside.2740)
	addi	r24, r24, lo16(check_all_inside.2740)
	stw	r24, 0(r10)
	stw	r14, 4(r10)
	mr	r24, r4
	addi	r4, r4, 32
	lis	r25, ha16(shadow_check_and_group.2746)
	addi	r25, r25, lo16(shadow_check_and_group.2746)
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
	lis	r28, ha16(shadow_check_one_or_group.2749)
	addi	r28, r28, lo16(shadow_check_one_or_group.2749)
	stw	r28, 0(r27)
	stw	r24, 8(r27)
	stw	r17, 4(r27)
	mr	r24, r4
	addi	r4, r4, 24
	lis	r28, ha16(shadow_check_one_or_matrix.2752)
	addi	r28, r28, lo16(shadow_check_one_or_matrix.2752)
	stw	r28, 0(r24)
	stw	r21, 20(r24)
	stw	r15, 16(r24)
	stw	r27, 12(r24)
	stw	r25, 8(r24)
	stw	r26, 4(r24)
	mr	r21, r4
	addi	r4, r4, 40
	lis	r27, ha16(solve_each_element.2755)
	addi	r27, r27, lo16(solve_each_element.2755)
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
	lis	r18, ha16(solve_one_or_network.2759)
	addi	r18, r18, lo16(solve_one_or_network.2759)
	stw	r18, 0(r25)
	stw	r21, 8(r25)
	stw	r17, 4(r25)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r21, ha16(trace_or_matrix.2763)
	addi	r21, r21, lo16(trace_or_matrix.2763)
	stw	r21, 0(r18)
	stw	r27, 20(r18)
	stw	r28, 16(r18)
	stw	r15, 12(r18)
	stw	r20, 8(r18)
	stw	r25, 4(r18)
	mr	r20, r4
	addi	r4, r4, 16
	lis	r21, ha16(judge_intersection.2767)
	addi	r21, r21, lo16(judge_intersection.2767)
	stw	r21, 0(r20)
	stw	r18, 12(r20)
	stw	r27, 8(r20)
	stw	r5, 4(r20)
	mr	r18, r4
	addi	r4, r4, 40
	lis	r21, ha16(solve_each_element_fast.2769)
	addi	r21, r21, lo16(solve_each_element_fast.2769)
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
	lis	r21, ha16(solve_one_or_network_fast.2773)
	addi	r21, r21, lo16(solve_one_or_network_fast.2773)
	stw	r21, 0(r10)
	stw	r18, 8(r10)
	stw	r17, 4(r10)
	mr	r17, r4
	addi	r4, r4, 24
	lis	r18, ha16(trace_or_matrix_fast.2777)
	addi	r18, r18, lo16(trace_or_matrix_fast.2777)
	stw	r18, 0(r17)
	stw	r27, 16(r17)
	stw	r22, 12(r17)
	stw	r15, 8(r17)
	stw	r10, 4(r17)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r15, ha16(judge_intersection_fast.2781)
	addi	r15, r15, lo16(judge_intersection_fast.2781)
	stw	r15, 0(r10)
	stw	r17, 12(r10)
	stw	r27, 8(r10)
	stw	r5, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(get_nvector_rect.2783)
	addi	r17, r17, lo16(get_nvector_rect.2783)
	stw	r17, 0(r15)
	lwz	r17, 60(r3)
	stw	r17, 8(r15)
	stw	r29, 4(r15)
	mr	r18, r4
	addi	r4, r4, 8
	lis	r21, ha16(get_nvector_plane.2785)
	addi	r21, r21, lo16(get_nvector_plane.2785)
	stw	r21, 0(r18)
	stw	r17, 4(r18)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(get_nvector_second.2787)
	addi	r22, r22, lo16(get_nvector_second.2787)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r26, 4(r21)
	mr	r22, r4
	addi	r4, r4, 16
	lis	r23, ha16(get_nvector.2789)
	addi	r23, r23, lo16(get_nvector.2789)
	stw	r23, 0(r22)
	stw	r21, 12(r22)
	stw	r15, 8(r22)
	stw	r18, 4(r22)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(utexture.2792)
	addi	r18, r18, lo16(utexture.2792)
	stw	r18, 0(r15)
	lwz	r18, 64(r3)
	stw	r18, 4(r15)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r23, ha16(add_light.2795)
	addi	r23, r23, lo16(add_light.2795)
	stw	r23, 0(r21)
	stw	r18, 8(r21)
	lwz	r23, 72(r3)
	stw	r23, 4(r21)
	mr	r25, r4
	addi	r4, r4, 40
	stw	r16, 144(r3)
	lis	r16, ha16(trace_reflections.2799)
	addi	r16, r16, lo16(trace_reflections.2799)
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
	lis	r13, ha16(trace_ray.2804)
	addi	r13, r13, lo16(trace_ray.2804)
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
	lis	r13, ha16(trace_diffuse_ray.2810)
	addi	r13, r13, lo16(trace_diffuse_ray.2810)
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
	lis	r13, ha16(iter_trace_diffuse_rays.2813)
	addi	r13, r13, lo16(iter_trace_diffuse_rays.2813)
	stw	r13, 0(r10)
	stw	r12, 4(r10)
	mr	r12, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_rays.2818)
	addi	r13, r13, lo16(trace_diffuse_rays.2818)
	stw	r13, 0(r12)
	stw	r19, 8(r12)
	stw	r10, 4(r12)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_ray_80percent.2822)
	addi	r13, r13, lo16(trace_diffuse_ray_80percent.2822)
	stw	r13, 0(r10)
	stw	r12, 8(r10)
	lwz	r13, 116(r3)
	stw	r13, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_1point.2826)
	addi	r17, r17, lo16(calc_diffuse_using_1point.2826)
	stw	r17, 0(r15)
	stw	r10, 12(r15)
	stw	r23, 8(r15)
	stw	r5, 4(r15)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_5points.2829)
	addi	r17, r17, lo16(calc_diffuse_using_5points.2829)
	stw	r17, 0(r10)
	stw	r23, 8(r10)
	stw	r5, 4(r10)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r18, ha16(do_without_neighbors.2835)
	addi	r18, r18, lo16(do_without_neighbors.2835)
	stw	r18, 0(r17)
	stw	r15, 4(r17)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(neighbors_exist.2838)
	addi	r18, r18, lo16(neighbors_exist.2838)
	stw	r18, 0(r15)
	lwz	r18, 76(r3)
	stw	r18, 4(r15)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(try_exploit_neighbors.2851)
	addi	r20, r20, lo16(try_exploit_neighbors.2851)
	stw	r20, 0(r19)
	stw	r17, 8(r19)
	stw	r10, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r20, ha16(write_ppm_header.2858)
	addi	r20, r20, lo16(write_ppm_header.2858)
	stw	r20, 0(r10)
	stw	r18, 4(r10)
	mr	r20, r4
	addi	r4, r4, 8
	lis	r21, ha16(write_rgb.2862)
	addi	r21, r21, lo16(write_rgb.2862)
	stw	r21, 0(r20)
	stw	r23, 4(r20)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(pretrace_diffuse_rays.2864)
	addi	r22, r22, lo16(pretrace_diffuse_rays.2864)
	stw	r22, 0(r21)
	stw	r12, 12(r21)
	stw	r13, 8(r21)
	stw	r5, 4(r21)
	mr	r5, r4
	addi	r4, r4, 40
	lis	r12, ha16(pretrace_pixels.2867)
	addi	r12, r12, lo16(pretrace_pixels.2867)
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
	lis	r16, ha16(pretrace_line.2874)
	addi	r16, r16, lo16(pretrace_line.2874)
	stw	r16, 0(r12)
	stw	r7, 24(r12)
	stw	r8, 20(r12)
	stw	r6, 16(r12)
	stw	r5, 12(r12)
	stw	r18, 8(r12)
	stw	r9, 4(r12)
	mr	r5, r4
	addi	r4, r4, 32
	lis	r7, ha16(scan_pixel.2878)
	addi	r7, r7, lo16(scan_pixel.2878)
	stw	r7, 0(r5)
	stw	r20, 24(r5)
	stw	r19, 20(r5)
	stw	r23, 16(r5)
	stw	r15, 12(r5)
	stw	r18, 8(r5)
	stw	r17, 4(r5)
	mr	r7, r4
	addi	r4, r4, 16
	lis	r8, ha16(scan_line.2884)
	addi	r8, r8, lo16(scan_line.2884)
	stw	r8, 0(r7)
	stw	r5, 12(r7)
	stw	r12, 8(r7)
	stw	r18, 4(r7)
	mr	r5, r4
	addi	r4, r4, 8
	lis	r8, ha16(create_pixelline.2897)
	addi	r8, r8, lo16(create_pixelline.2897)
	stw	r8, 0(r5)
	stw	r18, 4(r5)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r15, ha16(calc_dirvec.2904)
	addi	r15, r15, lo16(calc_dirvec.2904)
	stw	r15, 0(r8)
	stw	r13, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvecs.2912)
	addi	r16, r16, lo16(calc_dirvecs.2912)
	stw	r16, 0(r15)
	stw	r8, 4(r15)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvec_rows.2917)
	addi	r16, r16, lo16(calc_dirvec_rows.2917)
	stw	r16, 0(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(create_dirvec.2921)
	addi	r16, r16, lo16(create_dirvec.2921)
	stw	r16, 0(r15)
	lwz	r16, 0(r3)
	stw	r16, 4(r15)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r19, ha16(create_dirvec_elements.2923)
	addi	r19, r19, lo16(create_dirvec_elements.2923)
	stw	r19, 0(r17)
	stw	r15, 4(r17)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(create_dirvecs.2926)
	addi	r20, r20, lo16(create_dirvecs.2926)
	stw	r20, 0(r19)
	stw	r13, 12(r19)
	stw	r17, 8(r19)
	stw	r15, 4(r19)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r20, ha16(init_dirvec_constants.2928)
	addi	r20, r20, lo16(init_dirvec_constants.2928)
	stw	r20, 0(r17)
	lwz	r20, 144(r3)
	stw	r20, 4(r17)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(init_vecset_constants.2931)
	addi	r22, r22, lo16(init_vecset_constants.2931)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r13, 4(r21)
	mr	r13, r4
	addi	r4, r4, 16
	lis	r17, ha16(init_dirvecs.2933)
	addi	r17, r17, lo16(init_dirvecs.2933)
	stw	r17, 0(r13)
	stw	r21, 12(r13)
	stw	r19, 8(r13)
	stw	r8, 4(r13)
	mr	r8, r4
	addi	r4, r4, 16
	lis	r17, ha16(add_reflection.2935)
	addi	r17, r17, lo16(add_reflection.2935)
	stw	r17, 0(r8)
	stw	r20, 12(r8)
	lwz	r17, 136(r3)
	stw	r17, 8(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(setup_rect_reflection.2942)
	addi	r17, r17, lo16(setup_rect_reflection.2942)
	stw	r17, 0(r15)
	stw	r2, 12(r15)
	stw	r11, 8(r15)
	stw	r8, 4(r15)
	mr	r17, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_surface_reflection.2945)
	addi	r19, r19, lo16(setup_surface_reflection.2945)
	stw	r19, 0(r17)
	stw	r2, 12(r17)
	stw	r11, 8(r17)
	stw	r8, 4(r17)
	mr	r2, r4
	addi	r4, r4, 16
	lis	r8, ha16(setup_reflections.2948)
	addi	r8, r8, lo16(setup_reflections.2948)
	stw	r8, 0(r2)
	stw	r17, 12(r2)
	stw	r15, 8(r2)
	stw	r14, 4(r2)
	mr	r30, r4
	addi	r4, r4, 64
	lis	r8, ha16(rt.2950)
	addi	r8, r8, lo16(rt.2950)
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
