	.data
lzero:
	0
lhalf:
	1056964608
lsc.186:
	1082130432
lsc.173:
	0
lsc.172:
	1078530011
lsc.171:
	1144258560
lsc.170:
	1103101952
lsc.169:
	1065353216
lsc.168:
	1167949824
lsc.167:
	1123024896
lsc.166:
	1077936128
lsc.162:
	1073741824
latan.98:
	1082130432
latan.97:
	1065353216
latan.96:
	1073741824
latan.95:
	1075576832
latan.94:
	1054867456
latan.93:
	0
latan.92:
	1078530011
latan.91:
	1031137221
latan.90:
	1035458158
latan.89:
	1038323256
latan.88:
	-1106097883
latan.87:
	1045220557
latan.86:
	1051372202
l.29:
	1056964608
l.28:
	0
l.27:
	-1072902963
	.text
	.globl _min_caml_start
	.align 2
reverse_flag.55:
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
kernel_atan.36:
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
	lis	r31, ha16(l.27)
	addi	r31, r31, lo16(l.27)
	lfd	f0, 0(r31)
	lis	r31, ha16(l.28)
	addi	r31, r31, lo16(l.28)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.32
	fneg	f1, f0
	b	ble_cont.33
ble_else.32:
	fmr	f1, f0
ble_cont.33:
	fmul	f1, f0, f0
	fneg	f1, f0
	fsqrt	f1, f0
	floor	f1, f0
	lis	r31, ha16(l.29)
	addi	r31, r31, lo16(l.29)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lis	r31, ha16(l.28)
	addi	r31, r31, lo16(l.28)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else.34
	li	r2, 0
	b	ble_cont.35
ble_else.34:
	li	r2, 1
ble_cont.35:
	lis	r31, ha16(l.28)
	addi	r31, r31, lo16(l.28)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else.36
	li	r2, 1
	b	beq_cont.37
beq_else.36:
	li	r2, 0
beq_cont.37:
	lis	r31, ha16(l.28)
	addi	r31, r31, lo16(l.28)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.38
	li	r2, 0
	b	ble_cont.39
ble_else.38:
	li	r2, 1
ble_cont.39:
	fcmpu	cr7, f0, f0
	bgt	cr7, ble_else.40
	li	r2, 0
	b	ble_cont.41
ble_else.40:
	li	r2, 1
ble_cont.41:
	li	r2, 3
	li	r5, 4
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 3
	lfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	blr
