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
_min_caml_start:
	read	f0
	ftoi	r2, f0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	blr
