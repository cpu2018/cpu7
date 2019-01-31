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
l5849:
	1124073472
l5816:
	1063675494
l5815:
	1045220557
l5721:
	1125515264
l5719:
	-1021968384
l5703:
	1036831949
l5700:
	-1073741824
l5698:
	998244352
l5676:
	1101004800
l5675:
	1028443341
l5670:
	1048576000
l5666:
	1092616192
l5662:
	1050253722
l5661:
	1132396544
l5660:
	1041865114
l5658:
	1078530011
l5657:
	1106247680
l5656:
	1097859072
l5655:
	953267991
l5612:
	1287568416
l5608:
	1315859240
l5587:
	-1110651699
l5575:
	1008981770
l5574:
	-1102263091
l5424:
	1056964608
l5366:
	1073741824
l5332:
	-1018691584
l5330:
	1128792064
l5326:
	1016003125
l5240:
	-1082130432
l5239:
	1065353216
l5238:
	0
	.globl _min_caml_start
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5608)
	addi	r31, r31, lo16(l5608)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r6, ha16(read_screen_settings2634)
	addi	r6, r6, lo16(read_screen_settings2634)
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
	lis	r11, ha16(read_light2636)
	addi	r11, r11, lo16(read_light2636)
	stw	r11, 0(r10)
	lwz	r11, 16(r3)
	stw	r11, 8(r10)
	lwz	r12, 20(r3)
	stw	r12, 4(r10)
	mr	r13, r4
	addi	r4, r4, 8
	lis	r14, ha16(read_nth_object2641)
	addi	r14, r14, lo16(read_nth_object2641)
	stw	r14, 0(r13)
	lwz	r14, 4(r3)
	stw	r14, 4(r13)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r16, ha16(read_object2643)
	addi	r16, r16, lo16(read_object2643)
	stw	r16, 0(r15)
	stw	r13, 8(r15)
	lwz	r13, 0(r3)
	stw	r13, 4(r15)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_all_object2645)
	addi	r17, r17, lo16(read_all_object2645)
	stw	r17, 0(r16)
	stw	r15, 4(r16)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r17, ha16(read_and_network2651)
	addi	r17, r17, lo16(read_and_network2651)
	stw	r17, 0(r15)
	lwz	r17, 28(r3)
	stw	r17, 4(r15)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r19, ha16(read_parameter2653)
	addi	r19, r19, lo16(read_parameter2653)
	stw	r19, 0(r18)
	stw	r5, 20(r18)
	stw	r10, 16(r18)
	stw	r15, 12(r18)
	stw	r16, 8(r18)
	lwz	r5, 36(r3)
	stw	r5, 4(r18)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r15, ha16(solver_rect_surface2655)
	addi	r15, r15, lo16(solver_rect_surface2655)
	stw	r15, 0(r10)
	lwz	r15, 40(r3)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_rect2664)
	addi	r19, r19, lo16(solver_rect2664)
	stw	r19, 0(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface2670)
	addi	r19, r19, lo16(solver_surface2670)
	stw	r19, 0(r10)
	stw	r15, 4(r10)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r20, ha16(solver_second2689)
	addi	r20, r20, lo16(solver_second2689)
	stw	r20, 0(r19)
	stw	r15, 4(r19)
	mr	r20, r4
	addi	r4, r4, 24
	lis	r21, ha16(solver2695)
	addi	r21, r21, lo16(solver2695)
	stw	r21, 0(r20)
	stw	r10, 16(r20)
	stw	r19, 12(r20)
	stw	r16, 8(r20)
	stw	r14, 4(r20)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(solver_rect_fast2699)
	addi	r16, r16, lo16(solver_rect_fast2699)
	stw	r16, 0(r10)
	stw	r15, 4(r10)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast2706)
	addi	r19, r19, lo16(solver_surface_fast2706)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r21, ha16(solver_second_fast2712)
	addi	r21, r21, lo16(solver_second_fast2712)
	stw	r21, 0(r19)
	stw	r15, 4(r19)
	mr	r21, r4
	addi	r4, r4, 24
	lis	r22, ha16(solver_fast2718)
	addi	r22, r22, lo16(solver_fast2718)
	stw	r22, 0(r21)
	stw	r16, 16(r21)
	stw	r19, 12(r21)
	stw	r10, 8(r21)
	stw	r14, 4(r21)
	mr	r16, r4
	addi	r4, r4, 8
	lis	r19, ha16(solver_surface_fast22722)
	addi	r19, r19, lo16(solver_surface_fast22722)
	stw	r19, 0(r16)
	stw	r15, 4(r16)
	mr	r19, r4
	addi	r4, r4, 8
	lis	r22, ha16(solver_second_fast22729)
	addi	r22, r22, lo16(solver_second_fast22729)
	stw	r22, 0(r19)
	stw	r15, 4(r19)
	mr	r22, r4
	addi	r4, r4, 24
	lis	r23, ha16(solver_fast22736)
	addi	r23, r23, lo16(solver_fast22736)
	stw	r23, 0(r22)
	stw	r16, 16(r22)
	stw	r19, 12(r22)
	stw	r10, 8(r22)
	stw	r14, 4(r22)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r16, ha16(iter_setup_dirvec_constants2748)
	addi	r16, r16, lo16(iter_setup_dirvec_constants2748)
	stw	r16, 0(r10)
	stw	r14, 4(r10)
	mr	r16, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_dirvec_constants2751)
	addi	r19, r19, lo16(setup_dirvec_constants2751)
	stw	r19, 0(r16)
	stw	r13, 8(r16)
	stw	r10, 4(r16)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r19, ha16(setup_startp_constants2753)
	addi	r19, r19, lo16(setup_startp_constants2753)
	stw	r19, 0(r10)
	stw	r14, 4(r10)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r23, ha16(setup_startp2756)
	addi	r23, r23, lo16(setup_startp2756)
	stw	r23, 0(r19)
	lwz	r23, 92(r3)
	stw	r23, 12(r19)
	stw	r10, 8(r19)
	stw	r13, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r24, ha16(check_all_inside2778)
	addi	r24, r24, lo16(check_all_inside2778)
	stw	r24, 0(r10)
	stw	r14, 4(r10)
	mr	r24, r4
	addi	r4, r4, 32
	lis	r25, ha16(shadow_check_and_group2784)
	addi	r25, r25, lo16(shadow_check_and_group2784)
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
	lis	r28, ha16(shadow_check_one_or_group2787)
	addi	r28, r28, lo16(shadow_check_one_or_group2787)
	stw	r28, 0(r27)
	stw	r24, 8(r27)
	stw	r17, 4(r27)
	mr	r24, r4
	addi	r4, r4, 24
	lis	r28, ha16(shadow_check_one_or_matrix2790)
	addi	r28, r28, lo16(shadow_check_one_or_matrix2790)
	stw	r28, 0(r24)
	stw	r21, 20(r24)
	stw	r15, 16(r24)
	stw	r27, 12(r24)
	stw	r25, 8(r24)
	stw	r26, 4(r24)
	mr	r21, r4
	addi	r4, r4, 40
	lis	r27, ha16(solve_each_element2793)
	addi	r27, r27, lo16(solve_each_element2793)
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
	lis	r18, ha16(solve_one_or_network2797)
	addi	r18, r18, lo16(solve_one_or_network2797)
	stw	r18, 0(r25)
	stw	r21, 8(r25)
	stw	r17, 4(r25)
	mr	r18, r4
	addi	r4, r4, 24
	lis	r21, ha16(trace_or_matrix2801)
	addi	r21, r21, lo16(trace_or_matrix2801)
	stw	r21, 0(r18)
	stw	r27, 20(r18)
	stw	r28, 16(r18)
	stw	r15, 12(r18)
	stw	r20, 8(r18)
	stw	r25, 4(r18)
	mr	r20, r4
	addi	r4, r4, 16
	lis	r21, ha16(judge_intersection2805)
	addi	r21, r21, lo16(judge_intersection2805)
	stw	r21, 0(r20)
	stw	r18, 12(r20)
	stw	r27, 8(r20)
	stw	r5, 4(r20)
	mr	r18, r4
	addi	r4, r4, 40
	lis	r21, ha16(solve_each_element_fast2807)
	addi	r21, r21, lo16(solve_each_element_fast2807)
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
	lis	r21, ha16(solve_one_or_network_fast2811)
	addi	r21, r21, lo16(solve_one_or_network_fast2811)
	stw	r21, 0(r10)
	stw	r18, 8(r10)
	stw	r17, 4(r10)
	mr	r17, r4
	addi	r4, r4, 24
	lis	r18, ha16(trace_or_matrix_fast2815)
	addi	r18, r18, lo16(trace_or_matrix_fast2815)
	stw	r18, 0(r17)
	stw	r27, 16(r17)
	stw	r22, 12(r17)
	stw	r15, 8(r17)
	stw	r10, 4(r17)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r15, ha16(judge_intersection_fast2819)
	addi	r15, r15, lo16(judge_intersection_fast2819)
	stw	r15, 0(r10)
	stw	r17, 12(r10)
	stw	r27, 8(r10)
	stw	r5, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(get_nvector_rect2821)
	addi	r17, r17, lo16(get_nvector_rect2821)
	stw	r17, 0(r15)
	lwz	r17, 60(r3)
	stw	r17, 8(r15)
	stw	r29, 4(r15)
	mr	r18, r4
	addi	r4, r4, 8
	lis	r21, ha16(get_nvector_plane2823)
	addi	r21, r21, lo16(get_nvector_plane2823)
	stw	r21, 0(r18)
	stw	r17, 4(r18)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(get_nvector_second2825)
	addi	r22, r22, lo16(get_nvector_second2825)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r26, 4(r21)
	mr	r22, r4
	addi	r4, r4, 16
	lis	r23, ha16(get_nvector2827)
	addi	r23, r23, lo16(get_nvector2827)
	stw	r23, 0(r22)
	stw	r21, 12(r22)
	stw	r15, 8(r22)
	stw	r18, 4(r22)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(utexture2830)
	addi	r18, r18, lo16(utexture2830)
	stw	r18, 0(r15)
	lwz	r18, 64(r3)
	stw	r18, 4(r15)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r23, ha16(add_light2833)
	addi	r23, r23, lo16(add_light2833)
	stw	r23, 0(r21)
	stw	r18, 8(r21)
	lwz	r23, 72(r3)
	stw	r23, 4(r21)
	mr	r25, r4
	addi	r4, r4, 40
	stw	r16, 144(r3)
	lis	r16, ha16(trace_reflections2837)
	addi	r16, r16, lo16(trace_reflections2837)
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
	lis	r13, ha16(trace_ray2842)
	addi	r13, r13, lo16(trace_ray2842)
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
	lis	r13, ha16(trace_diffuse_ray2848)
	addi	r13, r13, lo16(trace_diffuse_ray2848)
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
	lis	r13, ha16(iter_trace_diffuse_rays2851)
	addi	r13, r13, lo16(iter_trace_diffuse_rays2851)
	stw	r13, 0(r10)
	stw	r12, 4(r10)
	mr	r12, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_rays2856)
	addi	r13, r13, lo16(trace_diffuse_rays2856)
	stw	r13, 0(r12)
	stw	r19, 8(r12)
	stw	r10, 4(r12)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r13, ha16(trace_diffuse_ray_80percent2860)
	addi	r13, r13, lo16(trace_diffuse_ray_80percent2860)
	stw	r13, 0(r10)
	stw	r12, 8(r10)
	lwz	r13, 116(r3)
	stw	r13, 4(r10)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_1point2864)
	addi	r17, r17, lo16(calc_diffuse_using_1point2864)
	stw	r17, 0(r15)
	stw	r10, 12(r15)
	stw	r23, 8(r15)
	stw	r5, 4(r15)
	mr	r10, r4
	addi	r4, r4, 16
	lis	r17, ha16(calc_diffuse_using_5points2867)
	addi	r17, r17, lo16(calc_diffuse_using_5points2867)
	stw	r17, 0(r10)
	stw	r23, 8(r10)
	stw	r5, 4(r10)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r18, ha16(do_without_neighbors2873)
	addi	r18, r18, lo16(do_without_neighbors2873)
	stw	r18, 0(r17)
	stw	r15, 4(r17)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r18, ha16(neighbors_exist2876)
	addi	r18, r18, lo16(neighbors_exist2876)
	stw	r18, 0(r15)
	lwz	r18, 76(r3)
	stw	r18, 4(r15)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(try_exploit_neighbors2889)
	addi	r20, r20, lo16(try_exploit_neighbors2889)
	stw	r20, 0(r19)
	stw	r17, 8(r19)
	stw	r10, 4(r19)
	mr	r10, r4
	addi	r4, r4, 8
	lis	r20, ha16(write_ppm_header2896)
	addi	r20, r20, lo16(write_ppm_header2896)
	stw	r20, 0(r10)
	stw	r18, 4(r10)
	mr	r20, r4
	addi	r4, r4, 8
	lis	r21, ha16(write_rgb2900)
	addi	r21, r21, lo16(write_rgb2900)
	stw	r21, 0(r20)
	stw	r23, 4(r20)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(pretrace_diffuse_rays2902)
	addi	r22, r22, lo16(pretrace_diffuse_rays2902)
	stw	r22, 0(r21)
	stw	r12, 12(r21)
	stw	r13, 8(r21)
	stw	r5, 4(r21)
	mr	r5, r4
	addi	r4, r4, 40
	lis	r12, ha16(pretrace_pixels2905)
	addi	r12, r12, lo16(pretrace_pixels2905)
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
	lis	r16, ha16(pretrace_line2912)
	addi	r16, r16, lo16(pretrace_line2912)
	stw	r16, 0(r12)
	stw	r7, 24(r12)
	stw	r8, 20(r12)
	stw	r6, 16(r12)
	stw	r5, 12(r12)
	stw	r18, 8(r12)
	stw	r9, 4(r12)
	mr	r5, r4
	addi	r4, r4, 32
	lis	r7, ha16(scan_pixel2916)
	addi	r7, r7, lo16(scan_pixel2916)
	stw	r7, 0(r5)
	stw	r20, 24(r5)
	stw	r19, 20(r5)
	stw	r23, 16(r5)
	stw	r15, 12(r5)
	stw	r18, 8(r5)
	stw	r17, 4(r5)
	mr	r7, r4
	addi	r4, r4, 16
	lis	r8, ha16(scan_line2922)
	addi	r8, r8, lo16(scan_line2922)
	stw	r8, 0(r7)
	stw	r5, 12(r7)
	stw	r12, 8(r7)
	stw	r18, 4(r7)
	mr	r5, r4
	addi	r4, r4, 8
	lis	r8, ha16(create_pixelline2935)
	addi	r8, r8, lo16(create_pixelline2935)
	stw	r8, 0(r5)
	stw	r18, 4(r5)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r15, ha16(calc_dirvec2942)
	addi	r15, r15, lo16(calc_dirvec2942)
	stw	r15, 0(r8)
	stw	r13, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvecs2950)
	addi	r16, r16, lo16(calc_dirvecs2950)
	stw	r16, 0(r15)
	stw	r8, 4(r15)
	mr	r8, r4
	addi	r4, r4, 8
	lis	r16, ha16(calc_dirvec_rows2955)
	addi	r16, r16, lo16(calc_dirvec_rows2955)
	stw	r16, 0(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 8
	lis	r16, ha16(create_dirvec2959)
	addi	r16, r16, lo16(create_dirvec2959)
	stw	r16, 0(r15)
	lwz	r16, 0(r3)
	stw	r16, 4(r15)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r19, ha16(create_dirvec_elements2961)
	addi	r19, r19, lo16(create_dirvec_elements2961)
	stw	r19, 0(r17)
	stw	r15, 4(r17)
	mr	r19, r4
	addi	r4, r4, 16
	lis	r20, ha16(create_dirvecs2964)
	addi	r20, r20, lo16(create_dirvecs2964)
	stw	r20, 0(r19)
	stw	r13, 12(r19)
	stw	r17, 8(r19)
	stw	r15, 4(r19)
	mr	r17, r4
	addi	r4, r4, 8
	lis	r20, ha16(init_dirvec_constants2966)
	addi	r20, r20, lo16(init_dirvec_constants2966)
	stw	r20, 0(r17)
	lwz	r20, 144(r3)
	stw	r20, 4(r17)
	mr	r21, r4
	addi	r4, r4, 16
	lis	r22, ha16(init_vecset_constants2969)
	addi	r22, r22, lo16(init_vecset_constants2969)
	stw	r22, 0(r21)
	stw	r17, 8(r21)
	stw	r13, 4(r21)
	mr	r13, r4
	addi	r4, r4, 16
	lis	r17, ha16(init_dirvecs2971)
	addi	r17, r17, lo16(init_dirvecs2971)
	stw	r17, 0(r13)
	stw	r21, 12(r13)
	stw	r19, 8(r13)
	stw	r8, 4(r13)
	mr	r8, r4
	addi	r4, r4, 16
	lis	r17, ha16(add_reflection2973)
	addi	r17, r17, lo16(add_reflection2973)
	stw	r17, 0(r8)
	stw	r20, 12(r8)
	lwz	r17, 136(r3)
	stw	r17, 8(r8)
	stw	r15, 4(r8)
	mr	r15, r4
	addi	r4, r4, 16
	lis	r17, ha16(setup_rect_reflection2980)
	addi	r17, r17, lo16(setup_rect_reflection2980)
	stw	r17, 0(r15)
	stw	r2, 12(r15)
	stw	r11, 8(r15)
	stw	r8, 4(r15)
	mr	r17, r4
	addi	r4, r4, 16
	lis	r19, ha16(setup_surface_reflection2983)
	addi	r19, r19, lo16(setup_surface_reflection2983)
	stw	r19, 0(r17)
	stw	r2, 12(r17)
	stw	r11, 8(r17)
	stw	r8, 4(r17)
	mr	r2, r4
	addi	r4, r4, 16
	lis	r8, ha16(setup_reflections2986)
	addi	r8, r8, lo16(setup_reflections2986)
	stw	r8, 0(r2)
	stw	r17, 12(r2)
	stw	r15, 8(r2)
	stw	r14, 4(r2)
	mr	r30, r4
	addi	r4, r4, 64
	lis	r8, ha16(rt2988)
	addi	r8, r8, lo16(rt2988)
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
xor2504:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7680
	mr	r2, r5
	blr
beq_else7680:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7681
	li	r2, 1
	blr
beq_else7681:
	li	r2, 0
	blr
sgn2507:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7682
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	blr
beq_else7682:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7683
	lis	r31, ha16(l5240)
	addi	r31, r31, lo16(l5240)
	lfd	f0, 0(r31)
	blr
ble_else7683:
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	blr
fneg_cond2509:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7684
	fneg	f0, f0
	blr
beq_else7684:
	blr
add_mod52512:
	add	r2, r2, r5
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else7685
	subi	r2, r2, 5
	blr
bge_else7685:
	blr
vecset2515:
	stfd	f0, 0(r2)
	stfd	f1, 8(r2)
	stfd	f2, 16(r2)
	blr
vecfill2520:
	stfd	f0, 0(r2)
	stfd	f0, 8(r2)
	stfd	f0, 16(r2)
	blr
vecbzero2523:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	vecfill2520
veccpy2525:
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lfd	f0, 16(r5)
	stfd	f0, 16(r2)
	blr
vecunit_sgn2533:
	lfd	f0, 0(r2)
	lfd	f1, 0(r2)
	fmul	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	lfd	f2, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7689
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	b	beq_cont7690
beq_else7689:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7691
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont7692
beq_else7691:
	lis	r31, ha16(l5240)
	addi	r31, r31, lo16(l5240)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont7692:
beq_cont7690:
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
veciprod2536:
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
veciprod22539:
	lfd	f3, 0(r2)
	fmul	f0, f3, f0
	lfd	f3, 8(r2)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum2544:
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
vecadd2548:
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
vecscale2554:
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
vecaccumv2557:
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
o_texturetype2561:
	lwz	r2, 0(r2)
	blr
o_form2563:
	lwz	r2, 4(r2)
	blr
o_reflectiontype2565:
	lwz	r2, 8(r2)
	blr
o_isinvert2567:
	lwz	r2, 24(r2)
	blr
o_isrot2569:
	lwz	r2, 12(r2)
	blr
o_param_a2571:
	lwz	r2, 16(r2)
	lfd	f0, 0(r2)
	blr
o_param_b2573:
	lwz	r2, 16(r2)
	lfd	f0, 8(r2)
	blr
o_param_c2575:
	lwz	r2, 16(r2)
	lfd	f0, 16(r2)
	blr
o_param_abc2577:
	lwz	r2, 16(r2)
	blr
o_param_x2579:
	lwz	r2, 20(r2)
	lfd	f0, 0(r2)
	blr
o_param_y2581:
	lwz	r2, 20(r2)
	lfd	f0, 8(r2)
	blr
o_param_z2583:
	lwz	r2, 20(r2)
	lfd	f0, 16(r2)
	blr
o_diffuse2585:
	lwz	r2, 28(r2)
	lfd	f0, 0(r2)
	blr
o_hilight2587:
	lwz	r2, 28(r2)
	lfd	f0, 8(r2)
	blr
o_color_red2589:
	lwz	r2, 32(r2)
	lfd	f0, 0(r2)
	blr
o_color_green2591:
	lwz	r2, 32(r2)
	lfd	f0, 8(r2)
	blr
o_color_blue2593:
	lwz	r2, 32(r2)
	lfd	f0, 16(r2)
	blr
o_param_r12595:
	lwz	r2, 36(r2)
	lfd	f0, 0(r2)
	blr
o_param_r22597:
	lwz	r2, 36(r2)
	lfd	f0, 8(r2)
	blr
o_param_r32599:
	lwz	r2, 36(r2)
	lfd	f0, 16(r2)
	blr
o_param_ctbl2601:
	lwz	r2, 40(r2)
	blr
p_rgb2603:
	lwz	r2, 0(r2)
	blr
p_intersection_points2605:
	lwz	r2, 4(r2)
	blr
p_surface_ids2607:
	lwz	r2, 8(r2)
	blr
p_calc_diffuse2609:
	lwz	r2, 12(r2)
	blr
p_energy2611:
	lwz	r2, 16(r2)
	blr
p_received_ray_20percent2613:
	lwz	r2, 20(r2)
	blr
p_group_id2615:
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	blr
p_set_group_id2617:
	lwz	r2, 24(r2)
	stw	r5, 0(r2)
	blr
p_nvectors2620:
	lwz	r2, 28(r2)
	blr
d_vec2622:
	lwz	r2, 0(r2)
	blr
d_const2624:
	lwz	r2, 4(r2)
	blr
r_surface_id2626:
	lwz	r2, 0(r2)
	blr
r_dvec2628:
	lwz	r2, 4(r2)
	blr
r_bright2630:
	lfd	f0, 8(r2)
	blr
rad2632:
	lis	r31, ha16(l5326)
	addi	r31, r31, lo16(l5326)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
read_screen_settings2634:
	lwz	r2, 20(r30)
	lwz	r5, 16(r30)
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r8)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r8)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 16(r8)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stw	r2, 0(r3)
	stw	r8, 4(r3)
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	stw	r5, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad2632
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
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad2632
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
	lis	r31, ha16(l5330)
	addi	r31, r31, lo16(l5330)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	lwz	r2, 16(r3)
	stfd	f2, 0(r2)
	lis	r31, ha16(l5332)
	addi	r31, r31, lo16(l5332)
	lfd	f2, 0(r31)
	lfd	f3, 40(r3)
	fmul	f2, f3, f2
	stfd	f2, 8(r2)
	lfd	f2, 56(r3)
	fmul	f4, f1, f2
	lis	r31, ha16(l5330)
	addi	r31, r31, lo16(l5330)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	stfd	f4, 16(r2)
	lwz	r5, 12(r3)
	stfd	f2, 0(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
read_light2636:
	lwz	r2, 8(r30)
	lwz	r5, 4(r30)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	rad2632
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	rad2632
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	blr
rotate_quadratic_matrix2638:
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
	fmul	f12, f3, f3
	fmul	f12, f5, f12
	fmul	f13, f9, f9
	fmul	f13, f7, f13
	fadd	f12, f12, f13
	fmul	f13, f1, f1
	fmul	f13, f11, f13
	fadd	f12, f12, f13
	stfd	f12, 0(r2)
	fmul	f12, f6, f6
	fmul	f12, f5, f12
	fmul	f13, f10, f10
	fmul	f13, f7, f13
	fadd	f12, f12, f13
	fmul	f13, f4, f4
	fmul	f13, f11, f13
	fadd	f12, f12, f13
	stfd	f12, 8(r2)
	fmul	f12, f8, f8
	fmul	f12, f5, f12
	fmul	f13, f0, f0
	fmul	f13, f7, f13
	fadd	f12, f12, f13
	fmul	f13, f2, f2
	fmul	f13, f11, f13
	fadd	f12, f12, f13
	stfd	f12, 16(r2)
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f12, 0(r31)
	fmul	f13, f5, f6
	fmul	f13, f13, f8
	fmul	f14, f7, f10
	fmul	f14, f14, f0
	fadd	f13, f13, f14
	fmul	f14, f11, f4
	fmul	f14, f14, f2
	fadd	f13, f13, f14
	fmul	f12, f12, f13
	lwz	r2, 4(r3)
	stfd	f12, 0(r2)
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f12, 0(r31)
	fmul	f13, f5, f3
	fmul	f8, f13, f8
	fmul	f13, f7, f9
	fmul	f0, f13, f0
	fadd	f0, f8, f0
	fmul	f8, f11, f1
	fmul	f2, f8, f2
	fadd	f0, f0, f2
	fmul	f0, f12, f0
	stfd	f0, 8(r2)
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f0, 0(r31)
	fmul	f2, f5, f3
	fmul	f2, f2, f6
	fmul	f3, f7, f9
	fmul	f3, f3, f10
	fadd	f2, f2, f3
	fmul	f1, f11, f1
	fmul	f1, f1, f4
	fadd	f1, f2, f1
	fmul	f0, f0, f1
	stfd	f0, 16(r2)
	blr
read_nth_object2641:
	lwz	r5, 4(r30)
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7703
	li	r2, 0
	blr
beq_else7703:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	li	r10, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 16(r2)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7704
	li	r5, 0
	b	ble_cont7705
ble_else7704:
	li	r5, 1
ble_cont7705:
	li	r6, 2
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	li	r5, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 16(r2)
	li	r5, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bne	cr7, beq_else7706
	b	beq_cont7707
beq_else7706:
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stw	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad2632
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad2632
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 8(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rad2632
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 16(r2)
beq_cont7707:
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7708
	li	r6, 1
	b	beq_cont7709
beq_else7708:
	lwz	r6, 32(r3)
beq_cont7709:
	li	r7, 4
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bne	cr7, beq_else7710
	lfd	f0, 0(r6)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7712
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	beq_cont7713
beq_else7712:
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	sgn2507
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7713:
	lwz	r2, 24(r3)
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7715
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	beq_cont7716
beq_else7715:
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	sgn2507
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7716:
	lwz	r2, 24(r3)
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7717
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	beq_cont7718
beq_else7717:
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	sgn2507
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7718:
	lwz	r2, 24(r3)
	stfd	f0, 16(r2)
	b	beq_cont7711
beq_else7710:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else7719
	lwz	r5, 32(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7721
	li	r5, 1
	b	beq_cont7722
beq_else7721:
	li	r5, 0
beq_cont7722:
	mflr	r31
	mr	r2, r6
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	vecunit_sgn2533
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	b	beq_cont7720
beq_else7719:
beq_cont7720:
beq_cont7711:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7723
	b	beq_cont7724
beq_else7723:
	lwz	r2, 24(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	rotate_quadratic_matrix2638
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
beq_cont7724:
	li	r2, 1
	blr
read_object2643:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else7725
	blr
bge_else7725:
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
	bne	cr7, beq_else7727
	lwz	r2, 4(r3)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else7727:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_all_object2645:
	lwz	r30, 4(r30)
	li	r2, 0
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_net_item2647:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else7729
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else7729:
	addi	r6, r2, 1
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item2647
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	stwx	r6, r2, r5
	blr
read_or_network2649:
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_net_item2647
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else7730
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else7730:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_or_network2649
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	stwx	r6, r2, r5
	blr
read_and_network2651:
	lwz	r5, 4(r30)
	li	r6, 0
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item2647
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else7731
	blr
beq_else7731:
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	addi	r2, r5, 1
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
read_parameter2653:
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
	bl	read_or_network2649
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
solver_rect_surface2655:
	lwz	r9, 4(r30)
	slwi	r10, r6, 3
	lfdx	f3, r5, r10
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7734
	li	r2, 0
	blr
beq_else7734:
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
	bl	o_param_abc2577
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 56(r3)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_isinvert2567
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lwz	r5, 52(r3)
	slwi	r6, r5, 3
	lwz	r7, 48(r3)
	lfdx	f1, r7, r6
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7738
	li	r6, 0
	b	ble_cont7739
ble_else7738:
	li	r6, 1
ble_cont7739:
	mflr	r31
	mr	r5, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	xor2504
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
	bl	fneg_cond2509
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else7740
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont7741
ble_else7740:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont7741:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7742
	li	r2, 0
	blr
ble_else7742:
	lwz	r2, 16(r3)
	slwi	r6, r2, 3
	lfdx	f1, r7, r6
	slwi	r6, r2, 3
	lfdx	f2, r5, r6
	fmul	f2, f0, f2
	lfd	f3, 8(r3)
	fadd	f2, f2, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else7743
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont7744
ble_else7743:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont7744:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7745
	li	r2, 0
	blr
ble_else7745:
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_rect2664:
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
	bne	cr7, beq_else7746
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
	bne	cr7, beq_else7747
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
	bne	cr7, beq_else7748
	li	r2, 0
	blr
beq_else7748:
	li	r2, 3
	blr
beq_else7747:
	li	r2, 2
	blr
beq_else7746:
	li	r2, 1
	blr
solver_surface2670:
	lwz	r6, 4(r30)
	stw	r6, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	stw	r5, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc2577
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	stw	r5, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod2536
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7750
	li	r2, 0
	blr
ble_else7750:
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
	bl	veciprod22539
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
quadratic2676:
	fmul	f3, f0, f0
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	stw	r2, 16(r3)
	stfd	f1, 24(r3)
	stfd	f3, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_a2571
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f1, 24(r3)
	fmul	f2, f1, f1
	lwz	r2, 16(r3)
	stfd	f0, 40(r3)
	stfd	f2, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_b2573
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lfd	f1, 8(r3)
	fmul	f2, f1, f1
	lwz	r2, 16(r3)
	stfd	f0, 56(r3)
	stfd	f2, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c2575
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lfd	f1, 56(r3)
	fadd	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_isrot2569
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7752
	lfd	f0, 72(r3)
	blr
beq_else7752:
	lfd	f0, 8(r3)
	lfd	f1, 24(r3)
	fmul	f2, f1, f0
	lwz	r2, 16(r3)
	stfd	f2, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r12595
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
	lwz	r2, 16(r3)
	stfd	f0, 88(r3)
	stfd	f2, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r22597
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lfd	f1, 88(r3)
	fadd	f0, f1, f0
	lfd	f1, 24(r3)
	lfd	f2, 0(r3)
	fmul	f1, f2, f1
	lwz	r2, 16(r3)
	stfd	f0, 104(r3)
	stfd	f1, 112(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_r32599
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	blr
bilinear2681:
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
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
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
	bl	o_isrot2569
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7754
	lfd	f0, 96(r3)
	blr
beq_else7754:
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
	bl	o_param_r12595
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
	bl	o_param_r22597
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
	bl	o_param_r32599
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	blr
solver_second2689:
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
	bl	quadratic2676
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7756
	li	r2, 0
	blr
beq_else7756:
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
	bl	bilinear2681
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
	bl	quadratic2676
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_form2563
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7757
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	b	beq_cont7758
beq_else7757:
	lfd	f0, 56(r3)
beq_cont7758:
	lfd	f1, 48(r3)
	fmul	f2, f1, f1
	lfd	f3, 40(r3)
	fmul	f0, f3, f0
	fsub	f0, f2, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else7759
	li	r2, 0
	blr
ble_else7759:
	fsqrt	f0, f0
	lwz	r2, 32(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_isinvert2567
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7760
	lfd	f0, 64(r3)
	fneg	f0, f0
	b	beq_cont7761
beq_else7760:
	lfd	f0, 64(r3)
beq_cont7761:
	lfd	f1, 48(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver2695:
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
	bl	o_param_x2579
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
	bl	o_param_y2581
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
	bl	o_param_z2583
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
	bl	o_form2563
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7762
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7762:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7763
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7763:
	lfd	f0, 32(r3)
	lfd	f1, 48(r3)
	lfd	f2, 64(r3)
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_rect_fast2699:
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
	bl	o_param_b2573
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 8(r2)
	lfd	f2, 48(r3)
	fmul	f1, f2, f1
	lfd	f3, 40(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7767
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7768
ble_else7767:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7768:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7769
	li	r5, 0
	b	ble_cont7770
ble_else7769:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_c2575
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 16(r2)
	lfd	f2, 48(r3)
	fmul	f1, f2, f1
	lfd	f3, 24(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7771
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7772
ble_else7771:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7772:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7773
	li	r5, 0
	b	ble_cont7774
ble_else7773:
	lwz	r5, 16(r3)
	lfd	f0, 8(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7775
	li	r5, 0
	b	beq_cont7776
beq_else7775:
	li	r5, 1
beq_cont7776:
ble_cont7774:
ble_cont7770:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7777
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
	bl	o_param_a2571
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 0(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 8(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7779
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7780
ble_else7779:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7780:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7781
	li	r5, 0
	b	ble_cont7782
ble_else7781:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c2575
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 16(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 24(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7783
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7784
ble_else7783:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7784:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7785
	li	r5, 0
	b	ble_cont7786
ble_else7785:
	lwz	r5, 16(r3)
	lfd	f0, 24(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7787
	li	r5, 0
	b	beq_cont7788
beq_else7787:
	li	r5, 1
beq_cont7788:
ble_cont7786:
ble_cont7782:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7789
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
	bl	o_param_a2571
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 0(r2)
	lfd	f2, 72(r3)
	fmul	f1, f2, f1
	lfd	f3, 8(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7790
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7791
ble_else7790:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7791:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7792
	li	r2, 0
	b	ble_cont7793
ble_else7792:
	lwz	r5, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_b2573
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lfd	f1, 8(r2)
	lfd	f2, 72(r3)
	fmul	f1, f2, f1
	lfd	f3, 40(r3)
	fadd	f1, f1, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7794
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7795
ble_else7794:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7795:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7796
	li	r2, 0
	b	ble_cont7797
ble_else7796:
	lwz	r2, 16(r3)
	lfd	f0, 40(r2)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7798
	li	r2, 0
	b	beq_cont7799
beq_else7798:
	li	r2, 1
beq_cont7799:
ble_cont7797:
ble_cont7793:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7800
	li	r2, 0
	blr
beq_else7800:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 3
	blr
beq_else7789:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 2
	blr
beq_else7777:
	lwz	r2, 0(r3)
	stfd	f2, 0(r2)
	li	r2, 1
	blr
solver_surface_fast2706:
	lwz	r2, 4(r30)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f3, 0(r31)
	lfd	f4, 0(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7801
	li	r2, 0
	blr
ble_else7801:
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
solver_second_fast2712:
	lwz	r6, 4(r30)
	lfd	f3, 0(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7802
	li	r2, 0
	blr
beq_else7802:
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
	bl	quadratic2676
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_form2563
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7804
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	b	beq_cont7805
beq_else7804:
	lfd	f0, 32(r3)
beq_cont7805:
	lfd	f1, 16(r3)
	fmul	f2, f1, f1
	lfd	f3, 8(r3)
	fmul	f0, f3, f0
	fsub	f0, f2, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else7806
	li	r2, 0
	blr
ble_else7806:
	lwz	r2, 24(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert2567
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7807
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont7808
beq_else7807:
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont7808:
	li	r2, 1
	blr
solver_fast2718:
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
	bl	o_param_x2579
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
	bl	o_param_y2581
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
	bl	o_param_z2583
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
	bl	d_const2624
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
	bl	o_form2563
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7810
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	d_vec2622
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
beq_else7810:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7811
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7811:
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 20(r3)
	lwz	r5, 80(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solver_surface_fast22722:
	lwz	r2, 4(r30)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7812
	li	r2, 0
	blr
ble_else7812:
	lfd	f0, 0(r5)
	lfd	f1, 24(r6)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast22729:
	lwz	r7, 4(r30)
	lfd	f3, 0(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7813
	li	r2, 0
	blr
beq_else7813:
	lfd	f4, 8(r5)
	fmul	f0, f4, f0
	lfd	f4, 16(r5)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 24(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r6)
	fmul	f2, f0, f0
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7814
	li	r2, 0
	blr
ble_else7814:
	stw	r7, 0(r3)
	stw	r5, 4(r3)
	stfd	f0, 8(r3)
	stfd	f1, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert2567
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7815
	lfd	f0, 16(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
	b	beq_cont7816
beq_else7815:
	lfd	f0, 16(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 32(r2)
	fmul	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 0(r2)
beq_cont7816:
	li	r2, 1
	blr
solver_fast22736:
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
	bl	o_param_ctbl2601
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
	bl	d_const2624
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
	bl	o_form2563
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7818
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	d_vec2622
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
beq_else7818:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7819
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
beq_else7819:
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
setup_rect_table2739:
	li	r6, 6
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7820
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	stfd	f0, 8(r2)
	b	beq_cont7821
beq_else7820:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert2567
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7822
	li	r6, 0
	b	ble_cont7823
ble_else7822:
	li	r6, 1
ble_cont7823:
	mflr	r31
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	xor2504
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_a2571
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond2509
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont7821:
	lfd	f0, 8(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7824
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	stfd	f0, 24(r2)
	b	beq_cont7825
beq_else7824:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2567
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7826
	li	r6, 0
	b	ble_cont7827
ble_else7826:
	li	r6, 1
ble_cont7827:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor2504
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_b2573
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond2509
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 24(r2)
beq_cont7825:
	lfd	f0, 16(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7828
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	stfd	f0, 40(r2)
	b	beq_cont7829
beq_else7828:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2567
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7830
	li	r6, 0
	b	ble_cont7831
ble_else7830:
	li	r6, 1
ble_cont7831:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor2504
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_c2575
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	fneg_cond2509
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 32(r2)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fdiv	f0, f0, f1
	stfd	f0, 40(r2)
beq_cont7829:
	blr
setup_surface_table2742:
	li	r6, 4
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7833
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	b	ble_cont7834
ble_else7833:
	lis	r31, ha16(l5240)
	addi	r31, r31, lo16(l5240)
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
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
ble_cont7834:
	blr
setup_second_table2745:
	li	r6, 5
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bl	quadratic2676
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
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
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
	bl	o_isrot2569
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7836
	lwz	r2, 8(r3)
	lfd	f0, 32(r3)
	stfd	f0, 8(r2)
	lfd	f0, 48(r3)
	stfd	f0, 16(r2)
	lfd	f0, 64(r3)
	stfd	f0, 24(r2)
	b	beq_cont7837
beq_else7836:
	lwz	r2, 4(r3)
	lfd	f0, 16(r2)
	lwz	r5, 0(r3)
	stfd	f0, 72(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_r22597
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
	bl	o_param_r32599
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
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
	bl	o_param_r12595
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
	bl	o_param_r32599
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
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
	bl	o_param_r12595
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
	bl	o_param_r22597
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 24(r2)
beq_cont7837:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bne	cr7, beq_else7838
	b	beq_cont7839
beq_else7838:
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 32(r2)
beq_cont7839:
	blr
iter_setup_dirvec_constants2748:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7840
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r30, 0(r3)
	stw	r5, 4(r3)
	stw	r6, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_const2624
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec2622
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_form2563
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7841
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_rect_table2739
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont7842
beq_else7841:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7843
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_surface_table2742
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont7844
beq_else7843:
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_second_table2745
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
beq_cont7844:
beq_cont7842:
	subi	r5, r5, 1
	lwz	r2, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else7840:
	blr
setup_dirvec_constants2751:
	lwz	r5, 8(r30)
	lwz	r30, 4(r30)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
setup_startp_constants2753:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7846
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
	bl	o_param_ctbl2601
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2563
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
	bl	o_param_x2579
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
	bl	o_param_y2581
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
	bl	o_param_z2583
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 16(r3)
	stfd	f0, 16(r2)
	lwz	r5, 20(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7847
	lwz	r5, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_abc2577
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
	bl	veciprod22539
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
	b	beq_cont7848
beq_else7847:
	cmpwi	cr7, r5, 2
	bgt	cr7, ble_else7849
	b	ble_cont7850
ble_else7849:
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
	lwz	r6, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	quadratic2676
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7851
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont7852
beq_else7851:
beq_cont7852:
	lwz	r2, 16(r3)
	stfd	f0, 24(r2)
ble_cont7850:
beq_cont7848:
	lwz	r2, 4(r3)
	subi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else7846:
	blr
setup_startp2756:
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
	bl	veccpy2525
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
is_rect_outside2758:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a2571
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	lfd	f2, 24(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7855
	fneg	f1, f2
	b	ble_cont7856
ble_else7855:
	fmr	f1, f2
ble_cont7856:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7857
	li	r2, 0
	b	ble_cont7858
ble_else7857:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_b2573
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7859
	fneg	f1, f2
	b	ble_cont7860
ble_else7859:
	fmr	f1, f2
ble_cont7860:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7861
	li	r2, 0
	b	ble_cont7862
ble_else7861:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_c2575
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7863
	fneg	f1, f2
	b	ble_cont7864
ble_else7863:
	fmr	f1, f2
ble_cont7864:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7865
	li	r2, 0
	b	ble_cont7866
ble_else7865:
	li	r2, 1
ble_cont7866:
ble_cont7862:
ble_cont7858:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7867
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_isinvert2567
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7868
	li	r2, 1
	blr
beq_else7868:
	li	r2, 0
	blr
beq_else7867:
	lwz	r2, 16(r3)
	b	o_isinvert2567
is_plane_outside2763:
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc2577
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod22539
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_isinvert2567
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7870
	li	r5, 0
	b	ble_cont7871
ble_else7870:
	li	r5, 1
ble_cont7871:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	xor2504
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7872
	li	r2, 1
	blr
beq_else7872:
	li	r2, 0
	blr
is_second_outside2768:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	quadratic2676
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2563
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7874
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	b	beq_cont7875
beq_else7874:
	lfd	f0, 8(r3)
beq_cont7875:
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert2567
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7876
	li	r5, 0
	b	ble_cont7877
ble_else7876:
	li	r5, 1
ble_cont7877:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor2504
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7878
	li	r2, 1
	blr
beq_else7878:
	li	r2, 0
	blr
is_outside2773:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x2579
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
	bl	o_param_y2581
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
	bl	o_param_z2583
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
	bl	o_form2563
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7880
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_rect_outside2758
beq_else7880:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7881
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_plane_outside2763
beq_else7881:
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_second_outside2768
check_all_inside2778:
	lwz	r6, 4(r30)
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7882
	li	r2, 1
	blr
beq_else7882:
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
	bl	is_outside2773
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7883
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
beq_else7883:
	li	r2, 0
	blr
shadow_check_and_group2784:
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
	bne	cr7, beq_else7884
	li	r2, 0
	blr
beq_else7884:
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
	bne	cr7, beq_else7885
	li	r2, 0
	b	beq_cont7886
beq_else7885:
	lis	r31, ha16(l5574)
	addi	r31, r31, lo16(l5574)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7887
	li	r2, 0
	b	ble_cont7888
ble_else7887:
	li	r2, 1
ble_cont7888:
beq_cont7886:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7889
	lwz	r2, 28(r3)
	slwi	r2, r2, 2
	lwz	r5, 24(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_isinvert2567
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7890
	li	r2, 0
	blr
beq_else7890:
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7889:
	lis	r31, ha16(l5575)
	addi	r31, r31, lo16(l5575)
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
	bne	cr7, beq_else7891
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7891:
	li	r2, 1
	blr
shadow_check_one_or_group2787:
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	slwi	r8, r2, 2
	lwzx	r8, r5, r8
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else7892
	li	r2, 0
	blr
beq_else7892:
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
	bne	cr7, beq_else7893
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7893:
	li	r2, 1
	blr
shadow_check_one_or_matrix2790:
	lwz	r6, 20(r30)
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else7894
	li	r2, 0
	blr
beq_else7894:
	stw	r11, 0(r3)
	stw	r8, 4(r3)
	stw	r5, 8(r3)
	stw	r30, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else7895
	li	r2, 1
	b	beq_cont7896
beq_else7895:
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
	bne	cr7, beq_else7897
	li	r2, 0
	b	beq_cont7898
beq_else7897:
	lis	r31, ha16(l5587)
	addi	r31, r31, lo16(l5587)
	lfd	f0, 0(r31)
	lwz	r2, 20(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7899
	li	r2, 0
	b	ble_cont7900
ble_else7899:
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
	bne	cr7, beq_else7901
	li	r2, 0
	b	beq_cont7902
beq_else7901:
	li	r2, 1
beq_cont7902:
ble_cont7900:
beq_cont7898:
beq_cont7896:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7903
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7903:
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
	bne	cr7, beq_else7904
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r30, 12(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7904:
	li	r2, 1
	blr
solve_each_element2793:
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
	bne	cr7, beq_else7905
	blr
beq_else7905:
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
	bne	cr7, beq_else7907
	lwz	r2, 48(r3)
	slwi	r2, r2, 2
	lwz	r5, 44(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert2567
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7908
	blr
beq_else7908:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7907:
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7910
	b	ble_cont7911
ble_else7910:
	lwz	r5, 20(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7912
	b	ble_cont7913
ble_else7912:
	lis	r31, ha16(l5575)
	addi	r31, r31, lo16(l5575)
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
	bne	cr7, beq_else7914
	b	beq_cont7915
beq_else7914:
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
	bl	vecset2515
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 48(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 52(r3)
	stw	r5, 0(r2)
beq_cont7915:
ble_cont7913:
ble_cont7911:
	lwz	r2, 40(r3)
	addi	r2, r2, 1
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r30, 36(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network2797:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else7916
	blr
beq_else7916:
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
trace_or_matrix2801:
	lwz	r7, 20(r30)
	lwz	r8, 16(r30)
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r5, r12
	lwz	r13, 0(r12)
	cmpwi	cr7, r13, -1
	bne	cr7, beq_else7918
	blr
beq_else7918:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r13, 99
	bne	cr7, beq_else7920
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
	b	beq_cont7921
beq_else7920:
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
	bne	cr7, beq_else7922
	b	beq_cont7923
beq_else7922:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7924
	b	ble_cont7925
ble_else7924:
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
ble_cont7925:
beq_cont7923:
beq_cont7921:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection2805:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l5608)
	addi	r31, r31, lo16(l5608)
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
	lis	r31, ha16(l5587)
	addi	r31, r31, lo16(l5587)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7926
	li	r2, 0
	blr
ble_else7926:
	lis	r31, ha16(l5612)
	addi	r31, r31, lo16(l5612)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7927
	li	r2, 0
	blr
ble_else7927:
	li	r2, 1
	blr
solve_each_element_fast2807:
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
	bl	d_vec2622
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7928
	blr
beq_else7928:
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
	bne	cr7, beq_else7930
	lwz	r2, 56(r3)
	slwi	r2, r2, 2
	lwz	r5, 32(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_isinvert2567
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7931
	blr
beq_else7931:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7930:
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7933
	b	ble_cont7934
ble_else7933:
	lwz	r5, 20(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7935
	b	ble_cont7936
ble_else7935:
	lis	r31, ha16(l5575)
	addi	r31, r31, lo16(l5575)
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
	bne	cr7, beq_else7937
	b	beq_cont7938
beq_else7937:
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
	bl	vecset2515
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 56(r3)
	stw	r5, 0(r2)
	lwz	r2, 0(r3)
	lwz	r5, 60(r3)
	stw	r5, 0(r2)
beq_cont7938:
ble_cont7936:
ble_cont7934:
	lwz	r2, 48(r3)
	addi	r2, r2, 1
	lwz	r5, 44(r3)
	lwz	r6, 36(r3)
	lwz	r30, 28(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
solve_one_or_network_fast2811:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	slwi	r9, r2, 2
	lwzx	r9, r5, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else7939
	blr
beq_else7939:
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
trace_or_matrix_fast2815:
	lwz	r7, 16(r30)
	lwz	r8, 12(r30)
	lwz	r9, 8(r30)
	lwz	r10, 4(r30)
	slwi	r11, r2, 2
	lwzx	r11, r5, r11
	lwz	r12, 0(r11)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else7941
	blr
beq_else7941:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r30, 8(r3)
	stw	r2, 12(r3)
	cmpwi	cr7, r12, 99
	bne	cr7, beq_else7943
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
	b	beq_cont7944
beq_else7943:
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
	bne	cr7, beq_else7945
	b	beq_cont7946
beq_else7945:
	lwz	r2, 28(r3)
	lfd	f0, 0(r2)
	lwz	r2, 24(r3)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7947
	b	ble_cont7948
ble_else7947:
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
ble_cont7948:
beq_cont7946:
beq_cont7944:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
judge_intersection_fast2819:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	lis	r31, ha16(l5608)
	addi	r31, r31, lo16(l5608)
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
	lis	r31, ha16(l5587)
	addi	r31, r31, lo16(l5587)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7949
	li	r2, 0
	blr
ble_else7949:
	lis	r31, ha16(l5612)
	addi	r31, r31, lo16(l5612)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7950
	li	r2, 0
	blr
ble_else7950:
	li	r2, 1
	blr
get_nvector_rect2821:
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
	bl	vecbzero2523
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
	bl	sgn2507
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 12(r3)
	slwi	r2, r2, 3
	lwz	r5, 0(r3)
	stfdx	f0, r5, r2
	blr
get_nvector_plane2823:
	lwz	r5, 4(r30)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
get_nvector_second2825:
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
	bl	o_param_x2579
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
	bl	o_param_y2581
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
	bl	o_param_z2583
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
	bl	o_param_a2571
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
	bl	o_param_b2573
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
	bl	o_param_c2575
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
	bl	o_isrot2569
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7954
	lwz	r2, 0(r3)
	lfd	f0, 64(r3)
	stfd	f0, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 8(r2)
	lfd	f0, 80(r3)
	stfd	f0, 16(r2)
	b	beq_cont7955
beq_else7954:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r32599
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
	bl	o_param_r22597
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f2, 88(r3)
	fadd	f0, f2, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
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
	bl	o_param_r32599
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
	bl	o_param_r12595
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f0, f1, f0
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
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
	bl	o_param_r22597
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
	bl	o_param_r12595
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 16(r2)
beq_cont7955:
	lwz	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_isinvert2567
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	b	vecunit_sgn2533
get_nvector2827:
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
	bl	o_form2563
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7956
	lwz	r2, 12(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7956:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7957
	lwz	r2, 4(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else7957:
	lwz	r2, 4(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
utexture2830:
	lwz	r6, 4(r30)
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_texturetype2561
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_red2589
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
	bl	o_color_green2591
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
	bl	o_color_blue2593
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 1
	bne	cr7, beq_else7958
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x2579
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l5675)
	addi	r31, r31, lo16(l5675)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l5676)
	addi	r31, r31, lo16(l5676)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l5666)
	addi	r31, r31, lo16(l5666)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else7959
	li	r2, 0
	b	ble_cont7960
ble_else7959:
	li	r2, 1
ble_cont7960:
	lwz	r5, 0(r3)
	lfd	f0, 16(r5)
	lwz	r5, 8(r3)
	stw	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_z2583
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lis	r31, ha16(l5675)
	addi	r31, r31, lo16(l5675)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, ha16(l5676)
	addi	r31, r31, lo16(l5676)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l5666)
	addi	r31, r31, lo16(l5666)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else7962
	li	r2, 0
	b	ble_cont7963
ble_else7962:
	li	r2, 1
ble_cont7963:
	lwz	r5, 24(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7964
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7966
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f0, 0(r31)
	b	beq_cont7967
beq_else7966:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
beq_cont7967:
	b	beq_cont7965
beq_else7964:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7968
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	beq_cont7969
beq_else7968:
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f0, 0(r31)
beq_cont7969:
beq_cont7965:
	lwz	r2, 4(r3)
	stfd	f0, 8(r2)
	blr
beq_else7958:
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7971
	lwz	r5, 0(r3)
	lfd	f0, 8(r5)
	lis	r31, ha16(l5670)
	addi	r31, r31, lo16(l5670)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_sin
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
	lis	r31, ha16(l5670)
	addi	r31, r31, lo16(l5670)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
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
	fmul	f0, f1, f0
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	lwz	r2, 4(r3)
	stfd	f1, 0(r2)
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f1, 0(r31)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 8(r2)
	blr
beq_else7971:
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else7973
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 48(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_x2579
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 16(r2)
	lwz	r2, 8(r3)
	stfd	f0, 56(r3)
	stfd	f1, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_z2583
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lfd	f1, 56(r3)
	fmul	f1, f1, f1
	fmul	f0, f0, f0
	fadd	f0, f1, f0
	lis	r31, ha16(l5666)
	addi	r31, r31, lo16(l5666)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	fsqrt	f0, f0
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l5658)
	addi	r31, r31, lo16(l5658)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_cos
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	stfd	f0, 80(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_cos
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fmul	f0, f1, f0
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lwz	r2, 4(r3)
	stfd	f1, 8(r2)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 16(r2)
	blr
beq_else7973:
	cmpwi	cr7, r5, 4
	bne	cr7, beq_else7975
	lwz	r5, 0(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stfd	f0, 88(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_x2579
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_a2571
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 96(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 16(r2)
	lwz	r5, 8(r3)
	stfd	f0, 104(r3)
	stfd	f1, 112(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	o_param_z2583
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 120(r3)
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_c2575
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 120(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fmul	f2, f1, f1
	fmul	f3, f0, f0
	fadd	f2, f2, f3
	lis	r31, ha16(l5655)
	addi	r31, r31, lo16(l5655)
	lfd	f3, 0(r31)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7976
	fneg	f4, f1
	b	ble_cont7977
ble_else7976:
	fmr	f4, f1
ble_cont7977:
	stfd	f2, 128(r3)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7978
	fdiv	f3, f0, f1
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7980
	fdiv	f0, f0, f1
	fneg	f0, f0
	b	ble_cont7981
ble_else7980:
	fdiv	f0, f0, f1
ble_cont7981:
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_atan
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lis	r31, ha16(l5657)
	addi	r31, r31, lo16(l5657)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l5658)
	addi	r31, r31, lo16(l5658)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont7979
ble_else7978:
	lis	r31, ha16(l5656)
	addi	r31, r31, lo16(l5656)
	lfd	f0, 0(r31)
ble_cont7979:
	floor	f1, f0
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
	lwz	r2, 8(r3)
	stfd	f0, 136(r3)
	stfd	f1, 144(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	o_param_y2581
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lfd	f1, 144(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 152(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	o_param_b2573
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 152(r3)
	fmul	f0, f1, f0
	lis	r31, ha16(l5655)
	addi	r31, r31, lo16(l5655)
	lfd	f1, 0(r31)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f2, 0(r31)
	lfd	f3, 128(r3)
	fcmpu	cr7, f3, f2
	bgt	cr7, ble_else7982
	fneg	f2, f3
	b	ble_cont7983
ble_else7982:
	fmr	f2, f3
ble_cont7983:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7984
	fdiv	f1, f0, f3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7986
	fdiv	f0, f0, f3
	fneg	f0, f0
	b	ble_cont7987
ble_else7986:
	fdiv	f0, f0, f3
ble_cont7987:
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	min_caml_atan
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lis	r31, ha16(l5657)
	addi	r31, r31, lo16(l5657)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l5658)
	addi	r31, r31, lo16(l5658)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont7985
ble_else7984:
	lis	r31, ha16(l5656)
	addi	r31, r31, lo16(l5656)
	lfd	f0, 0(r31)
ble_cont7985:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, ha16(l5660)
	addi	r31, r31, lo16(l5660)
	lfd	f1, 0(r31)
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f2, 0(r31)
	lfd	f3, 136(r3)
	fsub	f2, f2, f3
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f4, 0(r31)
	fsub	f3, f4, f3
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f2, 0(r31)
	fsub	f2, f2, f0
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f3, 0(r31)
	fsub	f0, f3, f0
	fmul	f0, f2, f0
	fsub	f0, f1, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7988
	b	ble_cont7989
ble_else7988:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
ble_cont7989:
	lis	r31, ha16(l5661)
	addi	r31, r31, lo16(l5661)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, ha16(l5662)
	addi	r31, r31, lo16(l5662)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r2, 4(r3)
	stfd	f0, 16(r2)
	blr
beq_else7975:
	blr
add_light2833:
	lwz	r5, 8(r30)
	lwz	r2, 4(r30)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f3, 0(r31)
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7993
	b	ble_cont7994
ble_else7993:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	vecaccum2544
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont7994:
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7995
	blr
ble_else7995:
	fmul	f0, f1, f1
	fmul	f1, f1, f1
	fmul	f0, f0, f1
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
trace_reflections2837:
	lwz	r6, 32(r30)
	lwz	r7, 28(r30)
	lwz	r8, 24(r30)
	lwz	r9, 20(r30)
	lwz	r10, 16(r30)
	lwz	r11, 12(r30)
	lwz	r12, 8(r30)
	lwz	r13, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7998
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
	bl	r_dvec2628
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
	bne	cr7, beq_else7999
	b	beq_cont8000
beq_else7999:
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
	bl	r_surface_id2626
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	cmpw	cr7, r5, r2
	bne	cr7, beq_else8001
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
	bne	cr7, beq_else8003
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	d_vec2622
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veciprod2536
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	r_bright2630
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
	bl	d_vec2622
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	veciprod2536
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
	b	beq_cont8004
beq_else8003:
beq_cont8004:
	b	beq_cont8002
beq_else8001:
beq_cont8002:
beq_cont8000:
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else7998:
	blr
trace_ray2842:
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
	bgt	cr7, ble_else8007
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
	bl	p_surface_ids2607
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
	bne	cr7, beq_else8010
	li	r2, -1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 120(r3)
	stwx	r2, r7, r6
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else8011
	blr
beq_else8011:
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	veciprod2536
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else8013
	blr
ble_else8013:
	fmul	f1, f0, f0
	fmul	f0, f1, f0
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
beq_else8010:
	lwz	r2, 80(r3)
	lwz	r2, 0(r2)
	slwi	r5, r2, 2
	lwz	r6, 76(r3)
	lwzx	r5, r6, r5
	stw	r2, 124(r3)
	stw	r5, 128(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_reflectiontype2565
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lwz	r5, 128(r3)
	stw	r2, 132(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	o_diffuse2585
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fmul	f0, f0, f1
	lwz	r2, 128(r3)
	lwz	r5, 112(r3)
	lwz	r30, 72(r3)
	stfd	f0, 136(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r2, 68(r3)
	lwz	r5, 64(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	veccpy2525
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r2, 128(r3)
	lwz	r5, 64(r3)
	lwz	r30, 60(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 124(r3)
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
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	p_intersection_points2605
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 64(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	veccpy2525
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	p_calc_diffuse2609
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lis	r31, ha16(l5424)
	addi	r31, r31, lo16(l5424)
	lfd	f0, 0(r31)
	lwz	r5, 128(r3)
	stw	r2, 144(r3)
	stfd	f0, 152(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	o_diffuse2585
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 152(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else8017
	li	r2, 1
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 144(r3)
	stwx	r2, r7, r6
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_energy2611
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	lwz	r7, 48(r3)
	stw	r2, 160(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	veccpy2525
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 108(r3)
	slwi	r5, r2, 2
	lwz	r6, 160(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l5698)
	addi	r31, r31, lo16(l5698)
	lfd	f0, 0(r31)
	lfd	f1, 136(r3)
	fmul	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	vecscale2554
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	p_nvectors2620
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lwz	r6, 44(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	veccpy2525
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	b	ble_cont8018
ble_else8017:
	li	r2, 0
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 144(r3)
	stwx	r2, r7, r6
ble_cont8018:
	lis	r31, ha16(l5700)
	addi	r31, r31, lo16(l5700)
	lfd	f0, 0(r31)
	lwz	r2, 112(r3)
	lwz	r5, 44(r3)
	stfd	f0, 168(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	veciprod2536
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
	bl	vecaccum2544
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lwz	r2, 128(r3)
	mflr	r31
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	o_hilight2587
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
	bne	cr7, beq_else8020
	lwz	r2, 44(r3)
	lwz	r5, 104(r3)
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	veciprod2536
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	fneg	f0, f0
	lfd	f1, 136(r3)
	fmul	f0, f0, f1
	lwz	r2, 112(r3)
	lwz	r5, 104(r3)
	stfd	f0, 184(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	veciprod2536
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	fneg	f1, f0
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
	b	beq_cont8021
beq_else8020:
beq_cont8021:
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
	lfd	f0, 136(r3)
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
	lis	r31, ha16(l5703)
	addi	r31, r31, lo16(l5703)
	lfd	f0, 0(r31)
	lfd	f1, 96(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else8022
	blr
ble_else8022:
	lwz	r2, 108(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else8024
	b	bge_cont8025
bge_else8024:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 120(r3)
	stwx	r6, r7, r5
bge_cont8025:
	lwz	r5, 132(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else8026
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r5, 128(r3)
	stfd	f0, 192(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	o_diffuse2585
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
beq_else8026:
	blr
ble_else8007:
	blr
trace_diffuse_ray2848:
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
	bne	cr7, beq_else8029
	blr
beq_else8029:
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
	bl	d_vec2622
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
	bne	cr7, beq_else8031
	lwz	r2, 20(r3)
	lwz	r5, 16(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veciprod2536
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else8032
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	b	ble_cont8033
ble_else8032:
ble_cont8033:
	lfd	f1, 8(r3)
	fmul	f0, f1, f0
	lwz	r2, 56(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_diffuse2585
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	vecaccum2544
beq_else8031:
	blr
iter_trace_diffuse_rays2851:
	lwz	r8, 4(r30)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else8036
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
	bl	d_vec2622
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	veciprod2536
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else8037
	lwz	r2, 16(r3)
	slwi	r5, r2, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l5721)
	addi	r31, r31, lo16(l5721)
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
	b	ble_cont8038
ble_else8037:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 12(r3)
	lwzx	r5, r6, r5
	lis	r31, ha16(l5719)
	addi	r31, r31, lo16(l5719)
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
ble_cont8038:
	lwz	r2, 16(r3)
	subi	r7, r2, 2
	lwz	r2, 12(r3)
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	lwz	r30, 4(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else8036:
	blr
trace_diffuse_rays2856:
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
trace_diffuse_ray_80percent2860:
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else8040
	b	beq_cont8041
beq_else8040:
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
beq_cont8041:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else8042
	b	beq_cont8043
beq_else8042:
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
beq_cont8043:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else8044
	b	beq_cont8045
beq_else8044:
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
beq_cont8045:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else8046
	b	beq_cont8047
beq_else8046:
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
beq_cont8047:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else8048
	blr
beq_else8048:
	lwz	r2, 12(r3)
	lwz	r2, 16(r2)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_diffuse_using_1point2864:
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
	bl	p_received_ray_20percent2613
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors2620
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_intersection_points2605
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_energy2611
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
	bl	veccpy2525
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_group_id2615
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
	b	vecaccumv2557
calc_diffuse_using_5points2867:
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
	bl	p_received_ray_20percent2613
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
	bl	p_received_ray_20percent2613
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
	bl	p_received_ray_20percent2613
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
	bl	p_received_ray_20percent2613
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
	bl	p_received_ray_20percent2613
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
	bl	veccpy2525
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
	bl	vecadd2548
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
	bl	vecadd2548
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
	bl	vecadd2548
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
	bl	vecadd2548
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
	bl	p_energy2611
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r2, 0(r3)
	lwz	r6, 4(r3)
	b	vecaccumv2557
do_without_neighbors2873:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else8050
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_surface_ids2607
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8051
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_calc_diffuse2609
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else8052
	b	beq_cont8053
beq_else8052:
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
beq_cont8053:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 8(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else8051:
	blr
ble_else8050:
	blr
neighbors_exist2876:
	lwz	r6, 4(r30)
	lwz	r7, 4(r6)
	addi	r8, r5, 1
	cmpw	cr7, r7, r8
	bgt	cr7, ble_else8056
	li	r2, 0
	blr
ble_else8056:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else8057
	li	r2, 0
	blr
ble_else8057:
	lwz	r5, 0(r6)
	addi	r6, r2, 1
	cmpw	cr7, r5, r6
	bgt	cr7, ble_else8058
	li	r2, 0
	blr
ble_else8058:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else8059
	li	r2, 0
	blr
ble_else8059:
	li	r2, 1
	blr
get_surface_id2880:
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	p_surface_ids2607
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	blr
neighbors_are_available2883:
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
	bl	get_surface_id2880
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
	bl	get_surface_id2880
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else8060
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
	bl	get_surface_id2880
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else8061
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
	bl	get_surface_id2880
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else8062
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
	bl	get_surface_id2880
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else8063
	li	r2, 1
	blr
beq_else8063:
	li	r2, 0
	blr
beq_else8062:
	li	r2, 0
	blr
beq_else8061:
	li	r2, 0
	blr
beq_else8060:
	li	r2, 0
	blr
try_exploit_neighbors2889:
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	slwi	r12, r2, 2
	lwzx	r12, r7, r12
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else8064
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
	bl	get_surface_id2880
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8065
	lwz	r2, 36(r3)
	lwz	r5, 32(r3)
	lwz	r6, 28(r3)
	lwz	r7, 24(r3)
	lwz	r8, 20(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	neighbors_are_available2883
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else8066
	lwz	r2, 36(r3)
	slwi	r2, r2, 2
	lwz	r5, 28(r3)
	lwzx	r2, r5, r2
	lwz	r5, 20(r3)
	lwz	r30, 16(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else8066:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	p_calc_diffuse2609
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r8, 20(r3)
	slwi	r5, r8, 2
	lwzx	r2, r2, r5
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else8067
	b	beq_cont8068
beq_else8067:
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
beq_cont8068:
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
bge_else8065:
	blr
ble_else8064:
	blr
write_ppm_header2896:
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
write_rgb_element2898:
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else8071
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8073
	b	bge_cont8074
bge_else8073:
	li	r2, 0
bge_cont8074:
	b	ble_cont8072
ble_else8071:
	li	r2, 255
ble_cont8072:
	b	min_caml_print_int
write_rgb2900:
	lwz	r2, 4(r30)
	lfd	f0, 0(r2)
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element2898
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
	bl	write_rgb_element2898
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
	bl	write_rgb_element2898
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	b	min_caml_print_char
pretrace_diffuse_rays2902:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else8075
	stw	r30, 0(r3)
	stw	r6, 4(r3)
	stw	r7, 8(r3)
	stw	r8, 12(r3)
	stw	r5, 16(r3)
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id2880
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8076
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_calc_diffuse2609
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else8077
	b	beq_cont8078
beq_else8077:
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_group_id2615
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	vecbzero2523
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_nvectors2620
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_intersection_points2605
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
	bl	p_received_ray_20percent2613
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
	bl	veccpy2525
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont8078:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	lwz	r2, 20(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
bge_else8076:
	blr
ble_else8075:
	blr
pretrace_pixels2905:
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
	blt	cr7, bge_else8081
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
	bl	vecunit_sgn2533
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	vecbzero2523
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy2525
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r2, 0
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	lwzx	r6, r7, r6
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bl	p_rgb2603
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy2525
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
	bl	p_set_group_id2617
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
	bl	add_mod52512
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
bge_else8081:
	blr
pretrace_line2912:
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
scan_pixel2916:
	lwz	r9, 24(r30)
	lwz	r10, 20(r30)
	lwz	r11, 16(r30)
	lwz	r12, 12(r30)
	lwz	r13, 8(r30)
	lwz	r14, 4(r30)
	lwz	r13, 0(r13)
	cmpw	cr7, r13, r2
	bgt	cr7, ble_else8083
	blr
ble_else8083:
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
	bl	p_rgb2603
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veccpy2525
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
	bne	cr7, beq_else8085
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
	b	beq_cont8086
beq_else8085:
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
beq_cont8086:
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
scan_line2922:
	lwz	r9, 12(r30)
	lwz	r10, 8(r30)
	lwz	r11, 4(r30)
	lwz	r12, 4(r11)
	cmpw	cr7, r12, r2
	bgt	cr7, ble_else8087
	blr
ble_else8087:
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
	bgt	cr7, ble_else8089
	b	ble_cont8090
ble_else8089:
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
ble_cont8090:
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
	bl	add_mod52512
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
create_float5x3array2928:
	li	r2, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
create_pixel2930:
	li	r2, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bl	create_float5x3array2928
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
	bl	create_float5x3array2928
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_float5x3array2928
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
	bl	create_float5x3array2928
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
init_line_elements2932:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else8091
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel2930
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements2932
bge_else8091:
	blr
create_pixelline2935:
	lwz	r2, 4(r30)
	lwz	r5, 0(r2)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel2930
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
	b	init_line_elements2932
tan2937:
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
adjust_position2939:
	fmul	f0, f0, f0
	lis	r31, ha16(l5703)
	addi	r31, r31, lo16(l5703)
	lfd	f2, 0(r31)
	fadd	f0, f0, f2
	fsqrt	f0, f0
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
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
	bl	tan2937
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fmul	f0, f0, f1
	blr
calc_dirvec2942:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else8092
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f2, f2, f3
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f3, 0(r31)
	fadd	f2, f2, f3
	fsqrt	f2, f2
	fdiv	f0, f0, f2
	fdiv	f1, f1, f2
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f3, 0(r31)
	fdiv	f2, f3, f2
	slwi	r2, r5, 2
	lwzx	r2, r7, r2
	slwi	r5, r6, 2
	lwzx	r5, r2, r5
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2515
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 40
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 16(r3)
	fneg	f2, f0
	lfd	f1, 24(r3)
	lfd	f3, 8(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2515
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 80
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	fneg	f1, f0
	lfd	f2, 16(r3)
	fneg	f3, f2
	lfd	f4, 8(r3)
	mflr	r31
	fmr	f2, f3
	fmr	f0, f4
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2515
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	fneg	f1, f0
	lfd	f2, 16(r3)
	fneg	f3, f2
	lfd	f4, 8(r3)
	fneg	f5, f4
	mflr	r31
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2515
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 41
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	fneg	f1, f0
	lfd	f2, 8(r3)
	fneg	f3, f2
	lfd	f4, 16(r3)
	mflr	r31
	fmr	f2, f4
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2515
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r2, r2, 81
	slwi	r2, r2, 2
	lwz	r5, 0(r3)
	lwzx	r2, r5, r2
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2622
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 8(r3)
	fneg	f0, f0
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	b	vecset2515
bge_else8092:
	stfd	f2, 32(r3)
	stw	r6, 4(r3)
	stw	r5, 40(r3)
	stw	r30, 44(r3)
	stfd	f3, 48(r3)
	stw	r2, 56(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	adjust_position2939
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	addi	r2, r2, 1
	lfd	f1, 48(r3)
	stfd	f0, 64(r3)
	stw	r2, 72(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	adjust_position2939
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 64(r3)
	lfd	f2, 32(r3)
	lfd	f3, 48(r3)
	lwz	r2, 72(r3)
	lwz	r5, 40(r3)
	lwz	r6, 4(r3)
	lwz	r30, 44(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
calc_dirvecs2950:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8094
	itof	f1, r2
	lis	r31, ha16(l5815)
	addi	r31, r31, lo16(l5815)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, ha16(l5816)
	addi	r31, r31, lo16(l5816)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r8, 0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f1, 0(r31)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	lis	r31, ha16(l5815)
	addi	r31, r31, lo16(l5815)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l5703)
	addi	r31, r31, lo16(l5703)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
	lfd	f0, 0(r31)
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
	bl	add_mod52512
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
bge_else8094:
	blr
calc_dirvec_rows2955:
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8097
	itof	f0, r2
	lis	r31, ha16(l5815)
	addi	r31, r31, lo16(l5815)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, ha16(l5816)
	addi	r31, r31, lo16(l5816)
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
	bl	add_mod52512
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
bge_else8097:
	blr
create_dirvec2959:
	lwz	r2, 4(r30)
	li	r5, 3
	lis	r31, ha16(l5238)
	addi	r31, r31, lo16(l5238)
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
create_dirvec_elements2961:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else8099
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
bge_else8099:
	blr
create_dirvecs2964:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8101
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
bge_else8101:
	blr
init_dirvec_constants2966:
	lwz	r6, 4(r30)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else8103
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
bge_else8103:
	blr
init_vecset_constants2969:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8105
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
bge_else8105:
	blr
init_dirvecs2971:
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
add_reflection2973:
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
	bl	d_vec2622
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f0, 48(r3)
	lfd	f1, 40(r3)
	lfd	f2, 32(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	vecset2515
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
setup_rect_reflection2980:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	lwz	r9, 0(r6)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
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
	bl	o_diffuse2585
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
setup_surface_reflection2983:
	lwz	r6, 12(r30)
	lwz	r7, 8(r30)
	lwz	r8, 4(r30)
	li	r9, 4
	slw	r2, r2, r9
	addi	r2, r2, 1
	lwz	r9, 0(r6)
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
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
	bl	o_diffuse2585
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
	bl	o_param_abc2577
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	veciprod2536
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f1, 0(r31)
	lwz	r2, 20(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_a2571
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
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 56(r3)
	stfd	f2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b2573
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
	lis	r31, ha16(l5366)
	addi	r31, r31, lo16(l5366)
	lfd	f2, 0(r31)
	lwz	r5, 20(r3)
	stfd	f0, 72(r3)
	stfd	f2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_c2575
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
setup_reflections2986:
	lwz	r5, 12(r30)
	lwz	r6, 8(r30)
	lwz	r7, 4(r30)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else8113
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
	bl	o_reflectiontype2565
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else8114
	lis	r31, ha16(l5239)
	addi	r31, r31, lo16(l5239)
	lfd	f0, 0(r31)
	lwz	r2, 12(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_diffuse2585
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else8115
	blr
ble_else8115:
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_form2563
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else8117
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 8(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else8117:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else8118
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r30, 0(r3)
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
beq_else8118:
	blr
beq_else8114:
	blr
bge_else8113:
	blr
rt2988:
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
	lis	r31, ha16(l5849)
	addi	r31, r31, lo16(l5849)
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
	bl	d_vec2622
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veccpy2525
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
min_caml_fin: