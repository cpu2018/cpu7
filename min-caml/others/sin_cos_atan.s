	.data
	.literal8
	.align 3
l.382:	 # 13.000000
	.long	0
	.long	1076494336
	.align 3
l.381:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.380:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.379:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.378:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.377:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.376:	 # 479001600.000000
	.long	0
	.long	1102875900
	.align 3
l.375:	 # 3628800.000000
	.long	0
	.long	1095479168
	.align 3
l.374:	 # 40320.000000
	.long	0
	.long	1088663552
	.align 3
l.373:	 # 720.000000
	.long	0
	.long	1082556416
	.align 3
l.372:	 # 24.000000
	.long	0
	.long	1077411840
	.align 3
l.371:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.370:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.369:	 # 6227020800.000000
	.long	-1073741824
	.long	1106719372
	.align 3
l.368:	 # 39916800.000000
	.long	0
	.long	1099106472
	.align 3
l.367:	 # 362880.000000
	.long	0
	.long	1091970560
	.align 3
l.366:	 # 5040.000000
	.long	0
	.long	1085517824
	.align 3
l.365:	 # 120.000000
	.long	0
	.long	1079902208
	.align 3
l.364:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.363:	 # 3.141593
	.long	1413754129
	.long	1074340347
	.text
	.globl _min_caml_start
	.align 2
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
min_caml_resize_pi.176:
	lis	r31, ha16(l.363)
	addi	r31, r31, lo16(l.363)
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
	lfd	f1, 8(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else.388
	lfd	f0, 0(r3)
	blr
ble_else.388:
	lfd	f0, 0(r3)
	fdiv	f1, f0, f1
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_floor
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fsub	f0, f1, f0
	blr
min_caml_sin.178:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_resize_pi.176
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(l.364)
	addi	r31, r31, lo16(l.364)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.365)
	addi	r31, r31, lo16(l.365)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.366)
	addi	r31, r31, lo16(l.366)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.367)
	addi	r31, r31, lo16(l.367)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.368)
	addi	r31, r31, lo16(l.368)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f0, f2, f0
	lis	r31, ha16(l.369)
	addi	r31, r31, lo16(l.369)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_cos.180:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_resize_pi.176
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r31, ha16(l.370)
	addi	r31, r31, lo16(l.370)
	lfd	f1, 0(r31)
	fmul	f2, f0, f0
	lis	r31, ha16(l.371)
	addi	r31, r31, lo16(l.371)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.372)
	addi	r31, r31, lo16(l.372)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.373)
	addi	r31, r31, lo16(l.373)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.374)
	addi	r31, r31, lo16(l.374)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.375)
	addi	r31, r31, lo16(l.375)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f0, f2, f0
	lis	r31, ha16(l.376)
	addi	r31, r31, lo16(l.376)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_atan.182:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_resize_pi.176
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(l.377)
	addi	r31, r31, lo16(l.377)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.378)
	addi	r31, r31, lo16(l.378)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.379)
	addi	r31, r31, lo16(l.379)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.380)
	addi	r31, r31, lo16(l.380)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.381)
	addi	r31, r31, lo16(l.381)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f0, f2, f0
	lis	r31, ha16(l.382)
	addi	r31, r31, lo16(l.382)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
_min_caml_start:
	blr
