let print_external_methods oc = Printf.fprintf oc
"	.text
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
"
