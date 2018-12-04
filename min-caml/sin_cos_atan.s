	.data
	.literal8
	.align 3
l.260:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.259:	 # 479001600.000000
	.long	0
	.long	1102875900
	.align 3
l.258:	 # 3628800.000000
	.long	0
	.long	1095479168
	.align 3
l.257:	 # 40320.000000
	.long	0
	.long	1088663552
	.align 3
l.256:	 # 720.000000
	.long	0
	.long	1082556416
	.align 3
l.255:	 # 24.000000
	.long	0
	.long	1077411840
	.align 3
l.254:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.253:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.252:	 # 6227020800.000000
	.long	-1073741824
	.long	1106719372
	.align 3
l.251:	 # 39916800.000000
	.long	0
	.long	1099106472
	.align 3
l.250:	 # 362880.000000
	.long	0
	.long	1091970560
	.align 3
l.249:	 # 5040.000000
	.long	0
	.long	1085517824
	.align 3
l.248:	 # 120.000000
	.long	0
	.long	1079902208
	.align 3
l.247:	 # 6.000000
	.long	0
	.long	1075314688
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
min_caml_sin.119:
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(l.247)
	addi	r31, r31, lo16(l.247)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fadd	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.248)
	addi	r31, r31, lo16(l.248)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.249)
	addi	r31, r31, lo16(l.249)
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
	lis	r31, ha16(l.250)
	addi	r31, r31, lo16(l.250)
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
	lis	r31, ha16(l.251)
	addi	r31, r31, lo16(l.251)
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
	fmul	f2, f2, f0
	fmul	f0, f2, f0
	lis	r31, ha16(l.252)
	addi	r31, r31, lo16(l.252)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_cos.121:
	lis	r31, ha16(l.253)
	addi	r31, r31, lo16(l.253)
	lfd	f1, 0(r31)
	fmul	f2, f0, f0
	lis	r31, ha16(l.254)
	addi	r31, r31, lo16(l.254)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.255)
	addi	r31, r31, lo16(l.255)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(l.256)
	addi	r31, r31, lo16(l.256)
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
	lis	r31, ha16(l.257)
	addi	r31, r31, lo16(l.257)
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
	lis	r31, ha16(l.258)
	addi	r31, r31, lo16(l.258)
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
	fmul	f0, f2, f0
	lis	r31, ha16(l.259)
	addi	r31, r31, lo16(l.259)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_atan.123:
	lis	r31, ha16(l.260)
	addi	r31, r31, lo16(l.260)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	blr
_min_caml_start:
	lis	r31, ha16(l.253)
	addi	r31, r31, lo16(l.253)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_sin.119
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r31, ha16(l.253)
	addi	r31, r31, lo16(l.253)
	lfd	f1, 0(r31)
	stfd	f0, 0(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_cos.121
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, ha16(l.253)
	addi	r31, r31, lo16(l.253)
	lfd	f1, 0(r31)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_atan.123
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
