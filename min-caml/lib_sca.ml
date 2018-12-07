let print_external_methods oc = Printf.fprintf oc
"	.data
	.literal8
	.align 3
lf.381:	 # 13.000000
	.long	0
	.long	1076494336
	.align 3
lf.380:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
lf.379:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
lf.378:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
lf.377:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
lf.376:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
lf.375:	 # 479001600.000000
	.long	0
	.long	1102875900
	.align 3
lf.374:	 # 3628800.000000
	.long	0
	.long	1095479168
	.align 3
lf.373:	 # 40320.000000
	.long	0
	.long	1088663552
	.align 3
lf.372:	 # 720.000000
	.long	0
	.long	1082556416
	.align 3
lf.371:	 # 24.000000
	.long	0
	.long	1077411840
	.align 3
lf.370:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
lf.369:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
lf.368:	 # 6227020800.000000
	.long	-1073741824
	.long	1106719372
	.align 3
lf.367:	 # 39916800.000000
	.long	0
	.long	1099106472
	.align 3
lf.366:	 # 362880.000000
	.long	0
	.long	1091970560
	.align 3
lf.365:	 # 5040.000000
	.long	0
	.long	1085517824
	.align 3
lf.364:	 # 120.000000
	.long	0
	.long	1079902208
	.align 3
lf.363:	 # 6.000000
	.long	0
	.long	1075314688
	.text
	.align 2
	.globl _min_caml_start
min_caml_sin:
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(lf.363)
	addi	r31, r31, lo16(lf.363)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.364)
	addi	r31, r31, lo16(lf.364)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.365)
	addi	r31, r31, lo16(lf.365)
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
	lis	r31, ha16(lf.366)
	addi	r31, r31, lo16(lf.366)
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
	lis	r31, ha16(lf.367)
	addi	r31, r31, lo16(lf.367)
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
	lis	r31, ha16(lf.368)
	addi	r31, r31, lo16(lf.368)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_cos:
	lis	r31, ha16(lf.369)
	addi	r31, r31, lo16(lf.369)
	lfd	f1, 0(r31)
	fmul	f2, f0, f0
	lis	r31, ha16(lf.370)
	addi	r31, r31, lo16(lf.370)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fsub	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.371)
	addi	r31, r31, lo16(lf.371)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.372)
	addi	r31, r31, lo16(lf.372)
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
	lis	r31, ha16(lf.373)
	addi	r31, r31, lo16(lf.373)
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
	lis	r31, ha16(lf.374)
	addi	r31, r31, lo16(lf.374)
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
	lis	r31, ha16(lf.375)
	addi	r31, r31, lo16(lf.375)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
min_caml_atan:
	fmul	f1, f0, f0
	fmul	f1, f1, f0
	lis	r31, ha16(lf.376)
	addi	r31, r31, lo16(lf.376)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f1, f0, f1
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.377)
	addi	r31, r31, lo16(lf.377)
	lfd	f3, 0(r31)
	fdiv	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	fmul	f2, f2, f0
	lis	r31, ha16(lf.378)
	addi	r31, r31, lo16(lf.378)
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
	lis	r31, ha16(lf.379)
	addi	r31, r31, lo16(lf.379)
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
	lis	r31, ha16(lf.380)
	addi	r31, r31, lo16(lf.380)
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
	lis	r31, ha16(lf.381)
	addi	r31, r31, lo16(lf.381)
	lfd	f2, 0(r31)
	fdiv	f0, f0, f2
	fadd	f0, f1, f0
	blr
"
