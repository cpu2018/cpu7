	.data
lsc186:
	1082130432
lsc173:
	0
lsc172:
	1078530011
lsc171:
	1144258560
lsc170:
	1103101952
lsc169:
	1065353216
lsc168:
	1167949824
lsc167:
	1123024896
lsc166:
	1077936128
lsc162:
	1073741824
latan98:
	1082130432
latan97:
	1065353216
latan96:
	1073741824
latan95:
	1075576832
latan94:
	1054867456
latan93:
	0
latan92:
	1078530011
latan91:
	1031137221
latan90:
	1035458158
latan89:
	1038323256
latan88:
	-1106097883
latan87:
	1045220557
latan86:
	1051372202
	.globl _min_caml_start
_min_caml_start:
	lis	r2, ha16(min_caml_a)
	addi	r2, r2, lo16(min_caml_a)
	li	r5, 3
	stw	r5, 4(r2)
	lis	r2, ha16(min_caml_a)
	addi	r2, r2, lo16(min_caml_a)
	lwz	r2, 12(r2)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	min_caml_fin
reverse_flag55:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else225
	blr
sc_beq_else225:
	li	r2, 0
	blr
add_flag57:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else226
	fneg	f0, f0
	blr
sc_beq_else226:
	blr
while160:
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else227
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
sc_ble_else227:
	fmr	f0, f1
	blr
while263:
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, sc_ble_else228
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else229
	fsub	f0, f0, f1
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while263
sc_ble_else229:
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while263
sc_ble_else228:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi67:
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while160
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while263
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin70:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, ha16(lsc166)
	addi	r31, r31, lo16(lsc166)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, ha16(lsc167)
	addi	r31, r31, lo16(lsc167)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, ha16(lsc168)
	addi	r31, r31, lo16(lsc168)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos72:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, ha16(lsc169)
	addi	r31, r31, lo16(lsc169)
	lfd	f3, 0(r31)
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, ha16(lsc170)
	addi	r31, r31, lo16(lsc170)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, ha16(lsc171)
	addi	r31, r31, lo16(lsc171)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin74:
	lis	r31, ha16(lsc172)
	addi	r31, r31, lo16(lsc172)
	lfd	f1, 0(r31)
	lis	r31, ha16(lsc173)
	addi	r31, r31, lo16(lsc173)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else230
	li	r2, 0
	b	sc_ble_cont231
sc_ble_else230:
	li	r2, 1
sc_ble_cont231:
	lis	r31, ha16(lsc173)
	addi	r31, r31, lo16(lsc173)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else232
	fneg	f0, f0
	b	sc_ble_cont233
sc_ble_else232:
sc_ble_cont233:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi67
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else235
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag55
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont236
sc_ble_else235:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont236:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else237
	fsub	f0, f2, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	sc_ble_cont238
sc_ble_else237:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont238:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc186)
	addi	r31, r31, lo16(lsc186)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else239
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos72
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	sc_ble_cont240
sc_ble_else239:
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin70
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
sc_ble_cont240:
	lwz	r2, 24(r3)
	b	add_flag57
min_caml_cos76:
	lis	r31, ha16(lsc172)
	addi	r31, r31, lo16(lsc172)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, ha16(lsc173)
	addi	r31, r31, lo16(lsc173)
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
	bl	reduction_2pi67
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
	bl	reverse_flag55
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
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else246
	fsub	f0, f2, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag55
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont247
sc_ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, ha16(lsc186)
	addi	r31, r31, lo16(lsc186)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fdiv	f1, f2, f1
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else248
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos72
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	sc_ble_cont249
sc_ble_else248:
	lis	r31, ha16(lsc162)
	addi	r31, r31, lo16(lsc162)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin70
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
sc_ble_cont249:
	lwz	r2, 32(r3)
	b	add_flag57
kernel_atan36:
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
min_caml_fin: