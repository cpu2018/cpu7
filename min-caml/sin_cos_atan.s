	.data
	.literal8
	.align 3
l.375:	 # 13.000000
	.long	0
	.long	1076494336
	.align 3
l.374:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.373:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.372:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.371:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.370:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.369:	 # 479001600.000000
	.long	0
	.long	1102875900
	.align 3
l.368:	 # 3628800.000000
	.long	0
	.long	1095479168
	.align 3
l.367:	 # 40320.000000
	.long	0
	.long	1088663552
	.align 3
l.366:	 # 720.000000
	.long	0
	.long	1082556416
	.align 3
l.365:	 # 24.000000
	.long	0
	.long	1077411840
	.align 3
l.364:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.363:	 # 1.000000
	.long	0
	.long	1072693248
	.text
	.align 	2
	.globl _min_caml_start
min_caml_print_char:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	stw	r2, 4(r3)
	addi	r3, r3, 8
	addi	r2, r2, 48
	out	r2
	subi	r3, r3, 8
	lwz	r2, 4(r3)
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	blr
min_caml_print_int:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	stw	r2, 4(r3)
	addi	r3, r3, 8
	stw	r5, 4(r3)
	addi	r3, r3, 8
	stw	r6, 4(r3)
	addi	r3, r3, 8
	stw	r7, 4(r3)
	addi	r3, r3, 8
	stw	r8, 4(r3)
	addi	r3, r3, 8
	stw	r9, 4(r3)
	addi	r3, r3, 8
	stw	r10, 4(r3)
	addi	r3, r3, 8
	stw	r11, 4(r3)
	addi	r3, r3, 8
	stw	r12, 4(r3)
	addi	r3, r3, 8
	li	r10, 10
	li	r6, 4
	bl	print_int
	subi	r3, r3, 8
	lwz	r12, 4(r3)
	subi	r3, r3, 8
	lwz	r11, 4(r3)
	subi	r3, r3, 8
	lwz	r10, 4(r3)
	subi	r3, r3, 8
	lwz	r9, 4(r3)
	subi	r3, r3, 8
	lwz	r8, 4(r3)
	subi	r3, r3, 8
	lwz	r7, 4(r3)
	subi	r3, r3, 8
	lwz	r6, 4(r3)
	subi	r3, r3, 8
	lwz	r5, 4(r3)
	subi	r3, r3, 8
	lwz	r2, 4(r3)
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
print_int:
	mr	r5, r2
	li	r2, 0
	add	r9, r9, r6
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	addi	r11, r7, 48
	cmpwi	cr7, r6, 4
	bne	cr7, r61or0
	addi	r12, r7, 48
	subi	r6, r6, 3
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	out	r12
	blr
r61or0:
	cmpwi	cr7, r6, 1
	bne	cr7, r6eq0
	subi	r6, r6, 1
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	out	r11
	blr
r6eq0:
	addi	r7, r7, 48
	out	r7
	blr
q2r7:
	slw	r8, r10, r9
	sub	r8, r5, r8
	cmpwi	cr7, r8, 0
	blt	cr7, idle
	mr	r7, r8
	mr	r5, r8
	li	r8, 1
	slw	r8, r8, r9
	add	r2, r2, r8
	cmpwi	cr7, r9, 0
	bgt	cr7, r9eq0
	subi	r9, r9, 1
	b	q2r7
idle:
	cmpwi	cr7, r9, 0
	bgt	cr7, r9eq0
	subi	r9, r9, 1
	b	q2r7
r9eq0:
	blr
min_caml_cos.179:
	lis	r31, ha16(l.363)
	addi	r31, r31, lo16(l.363)
	lfd	f1, 0(r31)
	fmul	f2, f0, f0
	lis	r31, ha16(l.364)
	addi	r31, r31, lo16(l.364)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
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
	fmul	f0, f2, f0
	lis	r31, ha16(l.369)
	addi	r31, r31, lo16(l.369)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_sin.181:
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(l.370)
	addi	r31, r31, lo16(l.370)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.371)
	addi	r31, r31, lo16(l.371)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.372)
	addi	r31, r31, lo16(l.372)
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
	lis	r31, ha16(l.373)
	addi	r31, r31, lo16(l.373)
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
	lis	r31, ha16(l.374)
	addi	r31, r31, lo16(l.374)
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
	lis	r31, ha16(l.375)
	addi	r31, r31, lo16(l.375)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
_min_caml_start:
	lis	r31, ha16(l.363)
	addi	r31, r31, lo16(l.363)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_sin.181
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r31, ha16(l.363)
	addi	r31, r31, lo16(l.363)
	lfd	f1, 0(r31)
	stfd	f0, 0(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_cos.179
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, ha16(l.363)
	addi	r31, r31, lo16(l.363)
	lfd	f1, 0(r31)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_min_caml_atan
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	fadd	f1, f2, f1
	fadd	f0, f1, f0
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_print_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
