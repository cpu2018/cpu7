	.data
min_caml_n_objects:
	80000
min_caml_objects:
	80004
min_caml_screen:
	82644
min_caml_viewpoint:
	82656
min_caml_light:
	82668
min_caml_beam:
	82680
min_caml_and_net:
	82684
min_caml_or_net:
	82884
min_caml_solver_dist:
	82888
min_caml_intsec_rectside:
	82892
min_caml_tmin:
	82896
min_caml_intersection_point:
	82900
min_caml_intersected_object_id:
	82912
min_caml_nvector:
	82916
min_caml_texture_color:
	82928
min_caml_diffuse_ray:
	82940
min_caml_rgb:
	82952
min_caml_image_size:
	82964
min_caml_image_center:
	82972
min_caml_scan_pitch:
	82980
min_caml_startp:
	82984
min_caml_startp_fast:
	82996
min_caml_screenx_dir:
	83008
min_caml_screeny_dir:
	83020
min_caml_screenz_dir:
	83032
min_caml_ptrace_dirvec:
	83044
min_caml_dirvecs:
	83056
min_caml_light_dirvec:
	83096
min_caml_reflections:
	83600
min_caml_n_reflections:
	86480
lsc199:
	1061752795
lsc192:
	1070141403
lsc185:
	0
lsc184:
	1078530011
lsc183:
	1144258560
lsc182:
	1103101952
lsc181:
	1065353216
lsc180:
	1167949824
lsc179:
	1123024896
lsc178:
	1086324736
lsc174:
	1073741824
latan101:
	1061752795
latan100:
	1065353216
latan99:
	1070141403
latan98:
	1075576832
latan97:
	1054867456
latan96:
	0
latan95:
	1031137221
latan94:
	1035458158
latan93:
	1038323256
latan92:
	-1106097883
latan91:
	1045220557
latan90:
	1051372202
l13283:
	1124073472
l13081:
	1063675494
l13080:
	1045220557
l12539:
	1125515264
l12537:
	-1021968384
l12477:
	1036831949
l12439:
	-1073741824
l12425:
	998244352
l12365:
	1287568416
l12361:
	1315859240
l12341:
	1101004800
l12340:
	1028443341
l12334:
	1048576000
l12330:
	1092616192
l12324:
	1050253722
l12323:
	1132396544
l12322:
	1041865114
l12318:
	1078530011
l12317:
	1106247680
l12316:
	1097859072
l12315:
	953267991
l12119:
	-1110651699
l12086:
	1008981770
l12085:
	-1102263091
l11840:
	1056964608
l11737:
	1073741824
l11703:
	-1018691584
l11701:
	1128792064
l11700:
	1016003125
l11690:
	1065353216
l11689:
	-1082130432
l11688:
	0
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 25000
	addi	r4, r4, 25000
	addi	r4, r4, 25000
	addi	r4, r4, 25000
	li	r2, 30000
	addi	r2, r2, 30000
	addi	r2, r2, 23096
	li	r5, 30000
	addi	r5, r5, 30000
	addi	r5, r5, 23104
	stw	r5, 0(r2)
	addi	r5, r5, 12
	stw	r5, 4(r2)
	li	r2, 512
	li	r5, 512
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	rt3127
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	min_caml_fin
reverse_flag61:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else236
	li	r2, 1
	blr
sc_beq_else236:
	li	r2, 0
	blr
add_flag63:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else237
	fneg	f0, f0
	blr
sc_beq_else237:
	blr
while166:
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else238
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	b	while166
sc_ble_else238:
	fmr	f0, f1
	blr
while269:
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, sc_ble_else239
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else240
	fsub	f0, f0, f1
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while269
sc_ble_else240:
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while269
sc_ble_else239:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi73:
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while166
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while269
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin76:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, lo16(lsc178)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc178)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc178)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(lsc179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc179)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, lo16(lsc180)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc180)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc180)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos78:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, lo16(lsc181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc181)
	lfd	f3, 0(r31)
	lis	r31, lo16(lsc174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc174)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, lo16(lsc182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc182)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin:
	lis	r31, lo16(lsc184)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc184)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc184)
	lfd	f1, 0(r31)
	lis	r31, lo16(lsc185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else241
	li	r2, 0
	b	sc_ble_cont242
sc_ble_else241:
	li	r2, 1
sc_ble_cont242:
	lis	r31, lo16(lsc185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else243
	fneg	f0, f0
	b	sc_ble_cont244
sc_ble_else243:
sc_ble_cont244:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi73
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else246
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag61
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont247
sc_ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc192)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else248
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	sc_ble_cont249
sc_ble_else248:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont249:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc199)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc199)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc199)
	lfd	f1, 0(r31)
	stw	r5, 24(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, sc_ble_else250
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin76
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	sc_ble_cont251
sc_ble_else250:
	lis	r31, lo16(lsc192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc192)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos78
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
sc_ble_cont251:
	lwz	r2, 24(r3)
	b	add_flag63
min_caml_cos:
	lis	r31, lo16(lsc184)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc184)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc184)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, lo16(lsc185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else252
	fneg	f0, f0
	b	sc_ble_cont253
sc_ble_else252:
sc_ble_cont253:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi73
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else255
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag61
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont256
sc_ble_else255:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont256:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc192)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else257
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag61
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont258
sc_ble_else257:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont258:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc199)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc199)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc199)
	lfd	f1, 0(r31)
	stw	r5, 32(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, sc_ble_else259
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos78
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	sc_ble_cont260
sc_ble_else259:
	lis	r31, lo16(lsc192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc192)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin76
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
sc_ble_cont260:
	lwz	r2, 32(r3)
	b	add_flag63
kernel_atan38:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, lo16(latan90)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan90)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan90)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, lo16(latan91)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan91)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan91)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, lo16(latan92)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan92)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan92)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(latan93)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan93)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan93)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, lo16(latan94)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan94)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan94)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, lo16(latan95)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan95)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan95)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan:
	lis	r31, lo16(latan96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan96)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, atan_ble_else107
	fneg	f1, f0
	b	atan_ble_cont108
atan_ble_else107:
	fmr	f1, f0
atan_ble_cont108:
	lis	r31, lo16(latan97)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan97)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan97)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f1
	bgt	cr7, atan_ble_else109
	lis	r31, lo16(latan98)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan98)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan98)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else110
	lis	r31, lo16(latan101)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan101)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan101)
	lfd	f2, 0(r31)
	lis	r31, lo16(latan100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan100)
	lfd	f3, 0(r31)
	fsub	f3, f1, f3
	lis	r31, lo16(latan100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan100)
	lfd	f4, 0(r31)
	fadd	f1, f1, f4
	fdiv	f1, f3, f1
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	kernel_atan38
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(latan96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan96)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else111
	blr
atan_ble_else111:
	fneg	f0, f0
	blr
atan_ble_else110:
	lis	r31, lo16(latan99)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan99)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan99)
	lfd	f2, 0(r31)
	lis	r31, lo16(latan100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan100)
	lfd	f3, 0(r31)
	fdiv	f1, f3, f1
	stfd	f0, 0(r3)
	stfd	f2, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_atan38
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r31, lo16(latan96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(latan96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(latan96)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, atan_ble_else112
	blr
atan_ble_else112:
	fneg	f0, f0
	blr
atan_ble_else109:
	b	kernel_atan38
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
vecunit_sgn2672:
	lfd	f0, 0(r2)
	lfd	f1, 0(r2)
	fmul	f0, f0, f1
	lfd	f1, 4(r2)
	lfd	f2, 4(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14667
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	b	beq_cont14668
beq_else14667:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14669
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont14670
beq_else14669:
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont14670:
beq_cont14668:
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lfd	f1, 4(r2)
	fmul	f1, f1, f0
	stfd	f1, 4(r2)
	lfd	f1, 8(r2)
	fmul	f0, f1, f0
	stfd	f0, 8(r2)
	blr
read_screen_settings2773:
	lis	r2, lo16(min_caml_screen)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screen)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screen)
	lwz	r2, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_screen)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screen)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screen)
	lwz	r2, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_screen)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screen)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screen)
	lwz	r2, 0(r2)
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
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_cos
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_sin
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	stfd	f0, 16(r3)
	stfd	f1, 24(r3)
	mflr	r31
	fmr	f0, f1
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
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f1, 8(r3)
	fmul	f2, f1, f0
	lis	r31, lo16(l11701)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11701)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11701)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	stfd	f2, 0(r2)
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lis	r31, lo16(l11703)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11703)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11703)
	lfd	f2, 0(r31)
	lfd	f3, 16(r3)
	fmul	f2, f3, f2
	stfd	f2, 4(r2)
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f2, 32(r3)
	fmul	f4, f1, f2
	lis	r31, lo16(l11701)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11701)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11701)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	stfd	f4, 8(r2)
	lis	r2, lo16(min_caml_screenx_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenx_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenx_dir)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	lis	r2, lo16(min_caml_screenx_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenx_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenx_dir)
	lwz	r2, 0(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	stfd	f4, 4(r2)
	lis	r2, lo16(min_caml_screenx_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenx_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenx_dir)
	lwz	r2, 0(r2)
	fneg	f4, f0
	stfd	f4, 8(r2)
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	fneg	f4, f3
	fmul	f0, f4, f0
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	fneg	f0, f1
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	fneg	f0, f3
	fmul	f0, f0, f2
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_viewpoint)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_viewpoint)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_viewpoint)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_screen)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screen)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screen)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fsub	f0, f0, f1
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_viewpoint)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_viewpoint)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_viewpoint)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_screen)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screen)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screen)
	lwz	r5, 0(r5)
	lfd	f0, 4(r5)
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f1, 4(r5)
	fsub	f0, f0, f1
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_viewpoint)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_viewpoint)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_viewpoint)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_screen)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screen)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screen)
	lwz	r5, 0(r5)
	lfd	f0, 8(r5)
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f1, 8(r5)
	fsub	f0, f0, f1
	stfd	f0, 8(r2)
	blr
read_light2775:
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_sin
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	fneg	f0, f0
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
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
	stfd	f0, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_sin
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	stfd	f0, 0(r2)
	lfd	f0, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_cos
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_beam)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_beam)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_beam)
	lwz	r2, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 0(r2)
	blr
rotate_quadratic_matrix2777:
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
	lfd	f1, 4(r2)
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
	lfd	f1, 4(r2)
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
	lfd	f1, 8(r2)
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
	lfd	f1, 8(r2)
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
	lfd	f7, 4(r2)
	lfd	f11, 8(r2)
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
	stfd	f12, 4(r2)
	fmul	f12, f8, f8
	fmul	f12, f5, f12
	fmul	f13, f0, f0
	fmul	f13, f7, f13
	fadd	f12, f12, f13
	fmul	f13, f2, f2
	fmul	f13, f11, f13
	fadd	f12, f12, f13
	stfd	f12, 8(r2)
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
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
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
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
	stfd	f0, 4(r2)
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
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
	stfd	f0, 8(r2)
	blr
read_nth_object2780:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14675
	li	r2, 0
	blr
beq_else14675:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
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
	li	r9, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	stw	r7, 8(r3)
	stw	r6, 12(r3)
	stw	r8, 16(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
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
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 20(r3)
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
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14676
	li	r5, 0
	b	ble_cont14677
ble_else14676:
	li	r5, 1
ble_cont14677:
	li	r6, 2
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 24(r3)
	stw	r5, 28(r3)
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
	stfd	f0, 4(r2)
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
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
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 8(r2)
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14678
	b	beq_cont14679
beq_else14678:
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l11700)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11700)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11700)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont14679:
	lwz	r6, 12(r3)
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else14680
	li	r7, 1
	b	beq_cont14681
beq_else14680:
	lwz	r7, 28(r3)
beq_cont14681:
	li	r8, 4
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r7, 40(r3)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r8
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
	lwz	r6, 36(r3)
	stw	r6, 32(r5)
	lwz	r6, 32(r3)
	stw	r6, 28(r5)
	lwz	r6, 40(r3)
	stw	r6, 24(r5)
	lwz	r6, 24(r3)
	stw	r6, 20(r5)
	lwz	r6, 20(r3)
	stw	r6, 16(r5)
	lwz	r7, 16(r3)
	stw	r7, 12(r5)
	lwz	r8, 8(r3)
	stw	r8, 8(r5)
	lwz	r8, 12(r3)
	stw	r8, 4(r5)
	lwz	r9, 4(r3)
	stw	r9, 0(r5)
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	lwz	r10, 0(r3)
	slwi	r10, r10, 2
	stwx	r5, r9, r10
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else14682
	lfd	f0, 0(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14684
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	beq_cont14685
beq_else14684:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14686
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	b	beq_cont14687
beq_else14686:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14688
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f1, 0(r31)
	b	ble_cont14689
ble_else14688:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
ble_cont14689:
beq_cont14687:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont14685:
	stfd	f0, 0(r6)
	lfd	f0, 4(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14690
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	beq_cont14691
beq_else14690:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14692
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	b	beq_cont14693
beq_else14692:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14694
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f1, 0(r31)
	b	ble_cont14695
ble_else14694:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
ble_cont14695:
beq_cont14693:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont14691:
	stfd	f0, 4(r6)
	lfd	f0, 8(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14696
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	beq_cont14697
beq_else14696:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14698
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	b	beq_cont14699
beq_else14698:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14700
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f1, 0(r31)
	b	ble_cont14701
ble_else14700:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
ble_cont14701:
beq_cont14699:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont14697:
	stfd	f0, 8(r6)
	b	beq_cont14683
beq_else14682:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else14702
	lwz	r5, 28(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14704
	li	r5, 1
	b	beq_cont14705
beq_else14704:
	li	r5, 0
beq_cont14705:
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	vecunit_sgn2672
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont14703
beq_else14702:
beq_cont14703:
beq_cont14683:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14706
	b	beq_cont14707
beq_else14706:
	lwz	r2, 20(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rotate_quadratic_matrix2777
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont14707:
	li	r2, 1
	blr
read_object2782:
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else14708
	blr
bge_else14708:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object2780
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14710
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
beq_else14710:
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else14712
	blr
bge_else14712:
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object2780
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14714
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	blr
beq_else14714:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else14716
	blr
bge_else14716:
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object2780
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14718
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else14718:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else14720
	blr
bge_else14720:
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_nth_object2780
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14722
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
	blr
beq_else14722:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	b	read_object2782
read_net_item2786:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14724
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else14724:
	addi	r6, r2, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else14725
	addi	r6, r6, 1
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14726
beq_else14725:
	addi	r8, r6, 1
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r7, 8(r3)
	stw	r6, 12(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else14727
	addi	r8, r8, 1
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont14728
beq_else14727:
	addi	r10, r8, 1
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	stw	r9, 16(r3)
	stw	r8, 20(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else14729
	addi	r10, r10, 1
	li	r11, -1
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont14730
beq_else14729:
	addi	r12, r10, 1
	stw	r11, 24(r3)
	stw	r10, 28(r3)
	mflr	r31
	mr	r2, r12
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	slwi	r5, r5, 2
	lwz	r6, 24(r3)
	stwx	r6, r2, r5
beq_cont14730:
	lwz	r5, 20(r3)
	slwi	r5, r5, 2
	lwz	r6, 16(r3)
	stwx	r6, r2, r5
beq_cont14728:
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwz	r6, 8(r3)
	stwx	r6, r2, r5
beq_cont14726:
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	stwx	r6, r2, r5
	blr
read_or_network2788:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14731
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont14732
beq_else14731:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 4(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14733
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14734
beq_else14733:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 8(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else14735
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14736
beq_else14735:
	li	r8, 3
	stw	r7, 12(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_net_item2786
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
beq_cont14736:
	lwz	r5, 8(r3)
	stw	r5, 4(r2)
beq_cont14734:
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont14732:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else14737
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else14737:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r5, 16(r3)
	stw	r6, 20(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else14738
	li	r7, 1
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont14739
beq_else14738:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 24(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else14740
	li	r8, 2
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont14741
beq_else14740:
	li	r9, 2
	stw	r8, 28(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r5, 4(r2)
beq_cont14741:
	lwz	r5, 24(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont14739:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else14742
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	beq_cont14743
beq_else14742:
	lwz	r2, 20(r3)
	addi	r6, r2, 1
	stw	r5, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_or_network2788
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r5, r5, 2
	lwz	r6, 32(r3)
	stwx	r6, r2, r5
beq_cont14743:
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 16(r3)
	stwx	r6, r2, r5
	blr
read_and_network2790:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14744
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	beq_cont14745
beq_else14744:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 4(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14746
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14747
beq_else14746:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 8(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else14748
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14749
beq_else14748:
	li	r8, 3
	stw	r7, 12(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_net_item2786
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
beq_cont14749:
	lwz	r5, 8(r3)
	stw	r5, 4(r2)
beq_cont14747:
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
beq_cont14745:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14750
	blr
beq_else14750:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	stwx	r2, r5, r7
	addi	r2, r6, 1
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 16(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14752
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont14753
beq_else14752:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 20(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14754
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont14755
beq_else14754:
	li	r7, 2
	stw	r6, 24(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_net_item2786
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	stw	r5, 4(r2)
beq_cont14755:
	lwz	r5, 20(r3)
	stw	r5, 0(r2)
beq_cont14753:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14756
	blr
beq_else14756:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 16(r3)
	slwi	r7, r6, 2
	stwx	r2, r5, r7
	addi	r2, r6, 1
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 28(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14758
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	beq_cont14759
beq_else14758:
	li	r6, 1
	stw	r5, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	stw	r5, 0(r2)
beq_cont14759:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14760
	blr
beq_else14760:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 28(r3)
	slwi	r7, r6, 2
	stwx	r2, r5, r7
	addi	r2, r6, 1
	li	r5, 0
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	read_net_item2786
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14762
	blr
beq_else14762:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 36(r3)
	slwi	r7, r6, 2
	stwx	r2, r5, r7
	addi	r2, r6, 1
	b	read_and_network2790
solver_rect_surface2794:
	slwi	r9, r6, 2
	lfdx	f3, r5, r9
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else14764
	li	r2, 0
	blr
beq_else14764:
	lwz	r9, 16(r2)
	lwz	r2, 24(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	slwi	r10, r6, 2
	lfdx	f4, r5, r10
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14765
	li	r10, 0
	b	ble_cont14766
ble_else14765:
	li	r10, 1
ble_cont14766:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14767
	mr	r2, r10
	b	beq_cont14768
beq_else14767:
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else14769
	li	r2, 1
	b	beq_cont14770
beq_else14769:
	li	r2, 0
beq_cont14770:
beq_cont14768:
	slwi	r10, r6, 2
	lfdx	f3, r9, r10
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14771
	fneg	f3, f3
	b	beq_cont14772
beq_else14771:
beq_cont14772:
	fsub	f0, f3, f0
	slwi	r2, r6, 2
	lfdx	f3, r5, r2
	fdiv	f0, f0, f3
	slwi	r2, r7, 2
	lfdx	f3, r9, r2
	slwi	r2, r7, 2
	lfdx	f4, r5, r2
	fmul	f4, f0, f4
	fadd	f4, f4, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14773
	slwi	r2, r7, 2
	lfdx	f4, r5, r2
	fmul	f4, f0, f4
	fadd	f1, f4, f1
	fneg	f1, f1
	b	ble_cont14774
ble_else14773:
	slwi	r2, r7, 2
	lfdx	f4, r5, r2
	fmul	f4, f0, f4
	fadd	f1, f4, f1
ble_cont14774:
	fcmpu	cr7, f3, f1
	bgt	cr7, ble_else14775
	li	r2, 0
	blr
ble_else14775:
	slwi	r2, r8, 2
	lfdx	f1, r9, r2
	slwi	r2, r8, 2
	lfdx	f3, r5, r2
	fmul	f3, f0, f3
	fadd	f3, f3, f2
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14776
	slwi	r2, r8, 2
	lfdx	f3, r5, r2
	fmul	f3, f0, f3
	fadd	f2, f3, f2
	fneg	f2, f2
	b	ble_cont14777
ble_else14776:
	slwi	r2, r8, 2
	lfdx	f3, r5, r2
	fmul	f3, f0, f3
	fadd	f2, f3, f2
ble_cont14777:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else14778
	li	r2, 0
	blr
ble_else14778:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_surface2809:
	lwz	r2, 16(r2)
	lfd	f3, 0(r5)
	lfd	f4, 0(r2)
	fmul	f3, f3, f4
	lfd	f4, 4(r5)
	lfd	f5, 4(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r5)
	lfd	f5, 8(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14779
	li	r2, 0
	blr
ble_else14779:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f4, 0(r2)
	fmul	f0, f4, f0
	lfd	f4, 4(r2)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	fdiv	f0, f0, f3
	stfd	f0, 0(r5)
	li	r2, 1
	blr
quadratic2815:
	fmul	f3, f0, f0
	lwz	r5, 16(r2)
	lfd	f4, 0(r5)
	fmul	f3, f3, f4
	fmul	f4, f1, f1
	lwz	r5, 16(r2)
	lfd	f5, 4(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f4, f2, f2
	lwz	r5, 16(r2)
	lfd	f5, 8(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14780
	fmr	f0, f3
	blr
beq_else14780:
	fmul	f4, f1, f2
	lwz	r5, 36(r2)
	lfd	f5, 0(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f2, f2, f0
	lwz	r5, 36(r2)
	lfd	f4, 4(r5)
	fmul	f2, f2, f4
	fadd	f2, f3, f2
	fmul	f0, f0, f1
	lwz	r2, 36(r2)
	lfd	f1, 8(r2)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
	blr
bilinear2820:
	fmul	f6, f0, f3
	lwz	r5, 16(r2)
	lfd	f7, 0(r5)
	fmul	f6, f6, f7
	fmul	f7, f1, f4
	lwz	r5, 16(r2)
	lfd	f8, 4(r5)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f2, f5
	lwz	r5, 16(r2)
	lfd	f8, 8(r5)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14781
	fmr	f0, f6
	blr
beq_else14781:
	fmul	f7, f2, f4
	fmul	f8, f1, f5
	fadd	f7, f7, f8
	lwz	r5, 36(r2)
	lfd	f8, 0(r5)
	fmul	f7, f7, f8
	fmul	f5, f0, f5
	fmul	f2, f2, f3
	fadd	f2, f5, f2
	lwz	r5, 36(r2)
	lfd	f5, 4(r5)
	fmul	f2, f2, f5
	fadd	f2, f7, f2
	fmul	f0, f0, f4
	fmul	f1, f1, f3
	fadd	f0, f0, f1
	lwz	r2, 36(r2)
	lfd	f1, 8(r2)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	fadd	f0, f6, f0
	blr
solver_second2828:
	lfd	f3, 0(r5)
	lfd	f4, 4(r5)
	lfd	f5, 8(r5)
	fmul	f6, f3, f3
	lwz	r6, 16(r2)
	lfd	f7, 0(r6)
	fmul	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r6, 16(r2)
	lfd	f8, 4(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f5, f5
	lwz	r6, 16(r2)
	lfd	f8, 8(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r6, 12(r2)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else14782
	fmr	f3, f6
	b	beq_cont14783
beq_else14782:
	fmul	f7, f4, f5
	lwz	r6, 36(r2)
	lfd	f8, 0(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f5, f5, f3
	lwz	r6, 36(r2)
	lfd	f7, 4(r6)
	fmul	f5, f5, f7
	fadd	f5, f6, f5
	fmul	f3, f3, f4
	lwz	r6, 36(r2)
	lfd	f4, 8(r6)
	fmul	f3, f3, f4
	fadd	f3, f5, f3
beq_cont14783:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else14784
	li	r2, 0
	blr
beq_else14784:
	lfd	f4, 0(r5)
	lfd	f5, 4(r5)
	lfd	f6, 8(r5)
	stfd	f3, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stw	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f3, f0
	fmr	f0, f4
	fmr	f4, f1
	fmr	f1, f5
	fmr	f5, f2
	fmr	f2, f6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	bilinear2820
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f2, f1, f1
	lwz	r2, 24(r3)
	lwz	r5, 16(r2)
	lfd	f3, 0(r5)
	fmul	f2, f2, f3
	lfd	f3, 16(r3)
	fmul	f4, f3, f3
	lwz	r5, 16(r2)
	lfd	f5, 4(r5)
	fmul	f4, f4, f5
	fadd	f2, f2, f4
	lfd	f4, 8(r3)
	fmul	f5, f4, f4
	lwz	r5, 16(r2)
	lfd	f6, 8(r5)
	fmul	f5, f5, f6
	fadd	f2, f2, f5
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14786
	fmr	f1, f2
	b	beq_cont14787
beq_else14786:
	fmul	f5, f3, f4
	lwz	r5, 36(r2)
	lfd	f6, 0(r5)
	fmul	f5, f5, f6
	fadd	f2, f2, f5
	fmul	f4, f4, f1
	lwz	r5, 36(r2)
	lfd	f5, 4(r5)
	fmul	f4, f4, f5
	fadd	f2, f2, f4
	fmul	f1, f1, f3
	lwz	r5, 36(r2)
	lfd	f3, 8(r5)
	fmul	f1, f1, f3
	fadd	f1, f2, f1
beq_cont14787:
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else14788
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f2, 0(r31)
	fsub	f1, f1, f2
	b	beq_cont14789
beq_else14788:
beq_cont14789:
	fmul	f2, f0, f0
	lfd	f3, 0(r3)
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else14790
	li	r2, 0
	blr
ble_else14790:
	fsqrt	f1, f1
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14791
	fneg	f1, f1
	b	beq_cont14792
beq_else14791:
beq_cont14792:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsub	f0, f1, f0
	fdiv	f0, f0, f3
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver2834:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r2, r2, 2
	lwzx	r2, r7, r2
	lfd	f0, 0(r6)
	lwz	r7, 20(r2)
	lfd	f1, 0(r7)
	fsub	f0, f0, f1
	lfd	f1, 4(r6)
	lwz	r7, 20(r2)
	lfd	f2, 4(r7)
	fsub	f1, f1, f2
	lfd	f2, 8(r6)
	lwz	r6, 20(r2)
	lfd	f3, 8(r6)
	fsub	f2, f2, f3
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else14793
	li	r6, 0
	li	r7, 1
	li	r8, 2
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stw	r5, 24(r3)
	stw	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solver_rect_surface2794
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14794
	li	r6, 1
	li	r7, 2
	li	r8, 0
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 28(r3)
	lwz	r5, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solver_rect_surface2794
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14795
	li	r6, 2
	li	r7, 0
	li	r8, 1
	lfd	f0, 8(r3)
	lfd	f1, 0(r3)
	lfd	f2, 16(r3)
	lwz	r2, 28(r3)
	lwz	r5, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solver_rect_surface2794
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14796
	li	r2, 0
	blr
beq_else14796:
	li	r2, 3
	blr
beq_else14795:
	li	r2, 2
	blr
beq_else14794:
	li	r2, 1
	blr
beq_else14793:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else14797
	lwz	r2, 16(r2)
	lfd	f3, 0(r5)
	lfd	f4, 0(r2)
	fmul	f3, f3, f4
	lfd	f4, 4(r5)
	lfd	f5, 4(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r5)
	lfd	f5, 8(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14798
	li	r2, 0
	blr
ble_else14798:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f4, 0(r2)
	fmul	f0, f4, f0
	lfd	f4, 4(r2)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	fdiv	f0, f0, f3
	stfd	f0, 0(r5)
	li	r2, 1
	blr
beq_else14797:
	b	solver_second2828
solver_rect_fast2838:
	lfd	f3, 0(r6)
	fsub	f3, f3, f0
	lfd	f4, 4(r6)
	fmul	f3, f3, f4
	lwz	r7, 16(r2)
	lfd	f4, 4(r7)
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else14799
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	fneg	f5, f5
	b	ble_cont14800
ble_else14799:
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
ble_cont14800:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14801
	li	r7, 0
	b	ble_cont14802
ble_else14801:
	lwz	r7, 16(r2)
	lfd	f4, 8(r7)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else14803
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont14804
ble_else14803:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont14804:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14805
	li	r7, 0
	b	ble_cont14806
ble_else14805:
	lfd	f4, 4(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bne	cr7, beq_else14807
	li	r7, 0
	b	beq_cont14808
beq_else14807:
	li	r7, 1
beq_cont14808:
ble_cont14806:
ble_cont14802:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14809
	lfd	f3, 8(r6)
	fsub	f3, f3, f1
	lfd	f4, 12(r6)
	fmul	f3, f3, f4
	lwz	r7, 16(r2)
	lfd	f4, 0(r7)
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else14810
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	fneg	f5, f5
	b	ble_cont14811
ble_else14810:
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
ble_cont14811:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14812
	li	r7, 0
	b	ble_cont14813
ble_else14812:
	lwz	r7, 16(r2)
	lfd	f4, 8(r7)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else14814
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont14815
ble_else14814:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont14815:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14816
	li	r7, 0
	b	ble_cont14817
ble_else14816:
	lfd	f4, 12(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bne	cr7, beq_else14818
	li	r7, 0
	b	beq_cont14819
beq_else14818:
	li	r7, 1
beq_cont14819:
ble_cont14817:
ble_cont14813:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14820
	lfd	f3, 16(r6)
	fsub	f2, f3, f2
	lfd	f3, 20(r6)
	fmul	f2, f2, f3
	lwz	r7, 16(r2)
	lfd	f3, 0(r7)
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f4, f4, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else14821
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
	fneg	f0, f0
	b	ble_cont14822
ble_else14821:
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
ble_cont14822:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else14823
	li	r2, 0
	b	ble_cont14824
ble_else14823:
	lwz	r2, 16(r2)
	lfd	f0, 4(r2)
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f3, f3, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14825
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
	fneg	f1, f1
	b	ble_cont14826
ble_else14825:
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
ble_cont14826:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14827
	li	r2, 0
	b	ble_cont14828
ble_else14827:
	lfd	f0, 20(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14829
	li	r2, 0
	b	beq_cont14830
beq_else14829:
	li	r2, 1
beq_cont14830:
ble_cont14828:
ble_cont14824:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14831
	li	r2, 0
	blr
beq_else14831:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 3
	blr
beq_else14820:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f3, 0(r2)
	li	r2, 2
	blr
beq_else14809:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f3, 0(r2)
	li	r2, 1
	blr
solver_second_fast2851:
	lfd	f3, 0(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else14832
	li	r2, 0
	blr
beq_else14832:
	lfd	f4, 4(r5)
	fmul	f4, f4, f0
	lfd	f5, 8(r5)
	fmul	f5, f5, f1
	fadd	f4, f4, f5
	lfd	f5, 12(r5)
	fmul	f5, f5, f2
	fadd	f4, f4, f5
	fmul	f5, f0, f0
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	fmul	f5, f5, f6
	fmul	f6, f1, f1
	lwz	r6, 16(r2)
	lfd	f7, 4(r6)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f6, f2, f2
	lwz	r6, 16(r2)
	lfd	f7, 8(r6)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	lwz	r6, 12(r2)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else14833
	fmr	f0, f5
	b	beq_cont14834
beq_else14833:
	fmul	f6, f1, f2
	lwz	r6, 36(r2)
	lfd	f7, 0(r6)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f2, f2, f0
	lwz	r6, 36(r2)
	lfd	f6, 4(r6)
	fmul	f2, f2, f6
	fadd	f2, f5, f2
	fmul	f0, f0, f1
	lwz	r6, 36(r2)
	lfd	f1, 8(r6)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont14834:
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else14835
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont14836
beq_else14835:
beq_cont14836:
	fmul	f1, f4, f4
	fmul	f0, f3, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14837
	li	r2, 0
	blr
ble_else14837:
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14838
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f0, f0
	fsub	f0, f4, f0
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont14839
beq_else14838:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f0, f0
	fadd	f0, f4, f0
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont14839:
	li	r2, 1
	blr
solver_second_fast22868:
	lfd	f3, 0(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else14840
	li	r2, 0
	blr
beq_else14840:
	lfd	f4, 4(r5)
	fmul	f0, f4, f0
	lfd	f4, 8(r5)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 12(r6)
	fmul	f2, f0, f0
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else14841
	li	r2, 0
	blr
ble_else14841:
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14842
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f1, f1
	fsub	f0, f0, f1
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont14843
beq_else14842:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f1, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont14843:
	li	r2, 1
	blr
setup_rect_table2878:
	li	r6, 6
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14844
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 4(r2)
	b	beq_cont14845
beq_else14844:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14846
	li	r8, 0
	b	ble_cont14847
ble_else14846:
	li	r8, 1
ble_cont14847:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14848
	mr	r7, r8
	b	beq_cont14849
beq_else14848:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else14850
	li	r7, 1
	b	beq_cont14851
beq_else14850:
	li	r7, 0
beq_cont14851:
beq_cont14849:
	lwz	r8, 16(r6)
	lfd	f0, 0(r8)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14852
	fneg	f0, f0
	b	beq_cont14853
beq_else14852:
beq_cont14853:
	stfd	f0, 0(r2)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 4(r2)
beq_cont14845:
	lfd	f0, 4(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14854
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 12(r2)
	b	beq_cont14855
beq_else14854:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 4(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14856
	li	r8, 0
	b	ble_cont14857
ble_else14856:
	li	r8, 1
ble_cont14857:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14858
	mr	r7, r8
	b	beq_cont14859
beq_else14858:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else14860
	li	r7, 1
	b	beq_cont14861
beq_else14860:
	li	r7, 0
beq_cont14861:
beq_cont14859:
	lwz	r8, 16(r6)
	lfd	f0, 4(r8)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14862
	fneg	f0, f0
	b	beq_cont14863
beq_else14862:
beq_cont14863:
	stfd	f0, 8(r2)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lfd	f1, 4(r5)
	fdiv	f0, f0, f1
	stfd	f0, 12(r2)
beq_cont14855:
	lfd	f0, 8(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14864
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 20(r2)
	b	beq_cont14865
beq_else14864:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 8(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14866
	li	r8, 0
	b	ble_cont14867
ble_else14866:
	li	r8, 1
ble_cont14867:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14868
	mr	r7, r8
	b	beq_cont14869
beq_else14868:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else14870
	li	r7, 1
	b	beq_cont14871
beq_else14870:
	li	r7, 0
beq_cont14871:
beq_cont14869:
	lwz	r6, 16(r6)
	lfd	f0, 8(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14872
	fneg	f0, f0
	b	beq_cont14873
beq_else14872:
beq_cont14873:
	stfd	f0, 16(r2)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 20(r2)
beq_cont14865:
	blr
setup_surface_table2881:
	li	r6, 4
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r7, 16(r6)
	lfd	f1, 0(r7)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lwz	r7, 16(r6)
	lfd	f2, 4(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lwz	r5, 16(r6)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14874
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont14875
ble_else14874:
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f1, 0(r31)
	fdiv	f1, f1, f0
	stfd	f1, 0(r2)
	lwz	r5, 16(r6)
	lfd	f1, 0(r5)
	fdiv	f1, f1, f0
	fneg	f1, f1
	stfd	f1, 4(r2)
	lwz	r5, 16(r6)
	lfd	f1, 4(r5)
	fdiv	f1, f1, f0
	fneg	f1, f1
	stfd	f1, 8(r2)
	lwz	r5, 16(r6)
	lfd	f1, 8(r5)
	fdiv	f0, f1, f0
	fneg	f0, f0
	stfd	f0, 12(r2)
ble_cont14875:
	blr
setup_second_table2884:
	li	r6, 5
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lfd	f1, 4(r5)
	lfd	f2, 8(r5)
	fmul	f3, f0, f0
	lwz	r6, 0(r3)
	lwz	r7, 16(r6)
	lfd	f4, 0(r7)
	fmul	f3, f3, f4
	fmul	f4, f1, f1
	lwz	r7, 16(r6)
	lfd	f5, 4(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f4, f2, f2
	lwz	r7, 16(r6)
	lfd	f5, 8(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lwz	r7, 12(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14876
	fmr	f0, f3
	b	beq_cont14877
beq_else14876:
	fmul	f4, f1, f2
	lwz	r7, 36(r6)
	lfd	f5, 0(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f2, f2, f0
	lwz	r7, 36(r6)
	lfd	f4, 4(r7)
	fmul	f2, f2, f4
	fadd	f2, f3, f2
	fmul	f0, f0, f1
	lwz	r7, 36(r6)
	lfd	f1, 8(r7)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont14877:
	lfd	f1, 0(r5)
	lwz	r7, 16(r6)
	lfd	f2, 0(r7)
	fmul	f1, f1, f2
	fneg	f1, f1
	lfd	f2, 4(r5)
	lwz	r7, 16(r6)
	lfd	f3, 4(r7)
	fmul	f2, f2, f3
	fneg	f2, f2
	lfd	f3, 8(r5)
	lwz	r7, 16(r6)
	lfd	f4, 8(r7)
	fmul	f3, f3, f4
	fneg	f3, f3
	stfd	f0, 0(r2)
	lwz	r7, 12(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14878
	stfd	f1, 4(r2)
	stfd	f2, 8(r2)
	stfd	f3, 12(r2)
	b	beq_cont14879
beq_else14878:
	lfd	f4, 8(r5)
	lwz	r7, 36(r6)
	lfd	f5, 4(r7)
	fmul	f4, f4, f5
	lfd	f5, 4(r5)
	lwz	r7, 36(r6)
	lfd	f6, 8(r7)
	fmul	f5, f5, f6
	fadd	f4, f4, f5
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	fsub	f1, f1, f4
	stfd	f1, 4(r2)
	lfd	f1, 8(r5)
	lwz	r7, 36(r6)
	lfd	f4, 0(r7)
	fmul	f1, f1, f4
	lfd	f4, 0(r5)
	lwz	r7, 36(r6)
	lfd	f5, 8(r7)
	fmul	f4, f4, f5
	fadd	f1, f1, f4
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f4, 0(r31)
	fmul	f1, f1, f4
	fsub	f1, f2, f1
	stfd	f1, 8(r2)
	lfd	f1, 4(r5)
	lwz	r7, 36(r6)
	lfd	f2, 0(r7)
	fmul	f1, f1, f2
	lfd	f2, 0(r5)
	lwz	r5, 36(r6)
	lfd	f4, 4(r5)
	fmul	f2, f2, f4
	fadd	f1, f1, f2
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f1, f3, f1
	stfd	f1, 12(r2)
beq_cont14879:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else14880
	b	beq_cont14881
beq_else14880:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	stfd	f0, 16(r2)
beq_cont14881:
	blr
iter_setup_dirvec_constants2887:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else14882
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	lwz	r7, 4(r2)
	lwz	r8, 0(r2)
	lwz	r9, 4(r6)
	stw	r2, 0(r3)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else14883
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_rect_table2878
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	b	beq_cont14884
beq_else14883:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else14885
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_surface_table2881
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
	b	beq_cont14886
beq_else14885:
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_second_table2884
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	stwx	r2, r7, r6
beq_cont14886:
beq_cont14884:
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else14887
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 0(r3)
	lwz	r7, 4(r6)
	lwz	r8, 0(r6)
	lwz	r9, 4(r5)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else14888
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_rect_table2878
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
	b	beq_cont14889
beq_else14888:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else14890
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_surface_table2881
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
	b	beq_cont14891
beq_else14890:
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_second_table2884
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
beq_cont14891:
beq_cont14889:
	subi	r5, r5, 1
	lwz	r2, 0(r3)
	b	iter_setup_dirvec_constants2887
bge_else14887:
	blr
bge_else14882:
	blr
setup_startp_constants2892:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else14894
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	lwz	r7, 40(r6)
	lwz	r8, 4(r6)
	lfd	f0, 0(r2)
	lwz	r9, 20(r6)
	lfd	f1, 0(r9)
	fsub	f0, f0, f1
	stfd	f0, 0(r7)
	lfd	f0, 4(r2)
	lwz	r9, 20(r6)
	lfd	f1, 4(r9)
	fsub	f0, f0, f1
	stfd	f0, 4(r7)
	lfd	f0, 8(r2)
	lwz	r9, 20(r6)
	lfd	f1, 8(r9)
	fsub	f0, f0, f1
	stfd	f0, 8(r7)
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else14895
	lwz	r6, 16(r6)
	lfd	f0, 0(r7)
	lfd	f1, 4(r7)
	lfd	f2, 8(r7)
	lfd	f3, 0(r6)
	fmul	f0, f3, f0
	lfd	f3, 4(r6)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 12(r7)
	b	beq_cont14896
beq_else14895:
	cmpwi	cr7, r8, 2
	bgt	cr7, ble_else14897
	b	ble_cont14898
ble_else14897:
	lfd	f0, 0(r7)
	lfd	f1, 4(r7)
	lfd	f2, 8(r7)
	fmul	f3, f0, f0
	lwz	r9, 16(r6)
	lfd	f4, 0(r9)
	fmul	f3, f3, f4
	fmul	f4, f1, f1
	lwz	r9, 16(r6)
	lfd	f5, 4(r9)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f4, f2, f2
	lwz	r9, 16(r6)
	lfd	f5, 8(r9)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lwz	r9, 12(r6)
	cmpwi	cr7, r9, 0
	bne	cr7, beq_else14899
	fmr	f0, f3
	b	beq_cont14900
beq_else14899:
	fmul	f4, f1, f2
	lwz	r9, 36(r6)
	lfd	f5, 0(r9)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f2, f2, f0
	lwz	r9, 36(r6)
	lfd	f4, 4(r9)
	fmul	f2, f2, f4
	fadd	f2, f3, f2
	fmul	f0, f0, f1
	lwz	r6, 36(r6)
	lfd	f1, 8(r6)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont14900:
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else14901
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont14902
beq_else14901:
beq_cont14902:
	stfd	f0, 12(r7)
ble_cont14898:
beq_cont14896:
	subi	r5, r5, 1
	b	setup_startp_constants2892
bge_else14894:
	blr
is_second_outside2907:
	fmul	f3, f0, f0
	lwz	r5, 16(r2)
	lfd	f4, 0(r5)
	fmul	f3, f3, f4
	fmul	f4, f1, f1
	lwz	r5, 16(r2)
	lfd	f5, 4(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f4, f2, f2
	lwz	r5, 16(r2)
	lfd	f5, 8(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14904
	fmr	f0, f3
	b	beq_cont14905
beq_else14904:
	fmul	f4, f1, f2
	lwz	r5, 36(r2)
	lfd	f5, 0(r5)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f2, f2, f0
	lwz	r5, 36(r2)
	lfd	f4, 4(r5)
	fmul	f2, f2, f4
	fadd	f2, f3, f2
	fmul	f0, f0, f1
	lwz	r5, 36(r2)
	lfd	f1, 8(r5)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont14905:
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else14906
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont14907
beq_else14906:
beq_cont14907:
	lwz	r2, 24(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else14908
	li	r5, 0
	b	ble_cont14909
ble_else14908:
	li	r5, 1
ble_cont14909:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14910
	mr	r2, r5
	b	beq_cont14911
beq_else14910:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14912
	li	r2, 1
	b	beq_cont14913
beq_else14912:
	li	r2, 0
beq_cont14913:
beq_cont14911:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14914
	li	r2, 1
	blr
beq_else14914:
	li	r2, 0
	blr
is_outside2912:
	lwz	r5, 20(r2)
	lfd	f3, 0(r5)
	fsub	f0, f0, f3
	lwz	r5, 20(r2)
	lfd	f3, 4(r5)
	fsub	f1, f1, f3
	lwz	r5, 20(r2)
	lfd	f3, 8(r5)
	fsub	f2, f2, f3
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 1
	bne	cr7, beq_else14915
	lwz	r5, 16(r2)
	lfd	f3, 0(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f0, f4
	bgt	cr7, ble_else14916
	fneg	f0, f0
	b	ble_cont14917
ble_else14916:
ble_cont14917:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else14918
	li	r5, 0
	b	ble_cont14919
ble_else14918:
	lwz	r5, 16(r2)
	lfd	f0, 4(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else14920
	fneg	f1, f1
	b	ble_cont14921
ble_else14920:
ble_cont14921:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14922
	li	r5, 0
	b	ble_cont14923
ble_else14922:
	lwz	r5, 16(r2)
	lfd	f0, 8(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else14924
	fneg	f1, f2
	b	ble_cont14925
ble_else14924:
	fmr	f1, f2
ble_cont14925:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else14926
	li	r5, 0
	b	ble_cont14927
ble_else14926:
	li	r5, 1
ble_cont14927:
ble_cont14923:
ble_cont14919:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14928
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14929
	li	r2, 1
	blr
beq_else14929:
	li	r2, 0
	blr
beq_else14928:
	lwz	r2, 24(r2)
	blr
beq_else14915:
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else14930
	lwz	r5, 16(r2)
	lfd	f3, 0(r5)
	fmul	f0, f3, f0
	lfd	f3, 4(r5)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r2, 24(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else14931
	li	r5, 0
	b	ble_cont14932
ble_else14931:
	li	r5, 1
ble_cont14932:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14933
	mr	r2, r5
	b	beq_cont14934
beq_else14933:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14935
	li	r2, 1
	b	beq_cont14936
beq_else14935:
	li	r2, 0
beq_cont14936:
beq_cont14934:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14937
	li	r2, 1
	blr
beq_else14937:
	li	r2, 0
	blr
beq_else14930:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	quadratic2815
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else14938
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont14939
beq_else14938:
beq_cont14939:
	lwz	r2, 24(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else14940
	li	r5, 0
	b	ble_cont14941
ble_else14940:
	li	r5, 1
ble_cont14941:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14942
	mr	r2, r5
	b	beq_cont14943
beq_else14942:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else14944
	li	r2, 1
	b	beq_cont14945
beq_else14944:
	li	r2, 0
beq_cont14945:
beq_cont14943:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14946
	li	r2, 1
	blr
beq_else14946:
	li	r2, 0
	blr
check_all_inside2917:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14947
	li	r2, 1
	blr
beq_else14947:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	lwzx	r6, r7, r6
	lwz	r7, 20(r6)
	lfd	f3, 0(r7)
	fsub	f3, f0, f3
	lwz	r7, 20(r6)
	lfd	f4, 4(r7)
	fsub	f4, f1, f4
	lwz	r7, 20(r6)
	lfd	f5, 8(r7)
	fsub	f5, f2, f5
	lwz	r7, 4(r6)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r5, 24(r3)
	stw	r2, 28(r3)
	cmpwi	cr7, r7, 1
	bne	cr7, beq_else14948
	lwz	r7, 16(r6)
	lfd	f6, 0(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f7, 0(r31)
	fcmpu	cr7, f3, f7
	bgt	cr7, ble_else14950
	fneg	f3, f3
	b	ble_cont14951
ble_else14950:
ble_cont14951:
	fcmpu	cr7, f6, f3
	bgt	cr7, ble_else14952
	li	r7, 0
	b	ble_cont14953
ble_else14952:
	lwz	r7, 16(r6)
	lfd	f3, 4(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f6, 0(r31)
	fcmpu	cr7, f4, f6
	bgt	cr7, ble_else14954
	fneg	f4, f4
	b	ble_cont14955
ble_else14954:
ble_cont14955:
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14956
	li	r7, 0
	b	ble_cont14957
ble_else14956:
	lwz	r7, 16(r6)
	lfd	f3, 8(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f5, f4
	bgt	cr7, ble_else14958
	fneg	f4, f5
	b	ble_cont14959
ble_else14958:
	fmr	f4, f5
ble_cont14959:
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14960
	li	r7, 0
	b	ble_cont14961
ble_else14960:
	li	r7, 1
ble_cont14961:
ble_cont14957:
ble_cont14953:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14962
	lwz	r6, 24(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else14964
	li	r2, 1
	b	beq_cont14965
beq_else14964:
	li	r2, 0
beq_cont14965:
	b	beq_cont14963
beq_else14962:
	lwz	r6, 24(r6)
	mr	r2, r6
beq_cont14963:
	b	beq_cont14949
beq_else14948:
	cmpwi	cr7, r7, 2
	bne	cr7, beq_else14966
	lwz	r7, 16(r6)
	lfd	f6, 0(r7)
	fmul	f3, f6, f3
	lfd	f6, 4(r7)
	fmul	f4, f6, f4
	fadd	f3, f3, f4
	lfd	f4, 8(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lwz	r6, 24(r6)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f4, f3
	bgt	cr7, ble_else14968
	li	r7, 0
	b	ble_cont14969
ble_else14968:
	li	r7, 1
ble_cont14969:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else14970
	mr	r6, r7
	b	beq_cont14971
beq_else14970:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else14972
	li	r6, 1
	b	beq_cont14973
beq_else14972:
	li	r6, 0
beq_cont14973:
beq_cont14971:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else14974
	li	r2, 1
	b	beq_cont14975
beq_else14974:
	li	r2, 0
beq_cont14975:
	b	beq_cont14967
beq_else14966:
	mflr	r31
	mr	r2, r6
	fmr	f2, f5
	fmr	f1, f4
	fmr	f0, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	is_second_outside2907
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont14967:
beq_cont14949:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14976
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 24(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else14977
	li	r2, 1
	blr
beq_else14977:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	is_outside2912
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14978
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r5, 24(r3)
	b	check_all_inside2917
beq_else14978:
	li	r2, 0
	blr
beq_else14976:
	li	r2, 0
	blr
shadow_check_and_group2923:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14979
	li	r2, 0
	blr
beq_else14979:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	lis	r7, lo16(min_caml_light_dirvec)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light_dirvec)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light_dirvec)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_intersection_point)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_intersection_point)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_intersection_point)
	lwz	r8, 0(r8)
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r6, 2
	lwzx	r9, r9, r10
	lfd	f0, 0(r8)
	lwz	r10, 20(r9)
	lfd	f1, 0(r10)
	fsub	f0, f0, f1
	lfd	f1, 4(r8)
	lwz	r10, 20(r9)
	lfd	f2, 4(r10)
	fsub	f1, f1, f2
	lfd	f2, 8(r8)
	lwz	r8, 20(r9)
	lfd	f3, 8(r8)
	fsub	f2, f2, f3
	lwz	r8, 4(r7)
	slwi	r10, r6, 2
	lwzx	r8, r8, r10
	lwz	r10, 4(r9)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	cmpwi	cr7, r10, 1
	bne	cr7, beq_else14980
	lwz	r7, 0(r7)
	mflr	r31
	mr	r6, r8
	mr	r5, r7
	mr	r2, r9
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_rect_fast2838
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont14981
beq_else14980:
	cmpwi	cr7, r10, 2
	bne	cr7, beq_else14982
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	lfd	f4, 0(r8)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else14984
	li	r2, 0
	b	ble_cont14985
ble_else14984:
	lis	r7, lo16(min_caml_solver_dist)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_solver_dist)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_solver_dist)
	lwz	r7, 0(r7)
	lfd	f3, 4(r8)
	fmul	f0, f3, f0
	lfd	f3, 8(r8)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r8)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r7)
	li	r2, 1
ble_cont14985:
	b	beq_cont14983
beq_else14982:
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_second_fast2851
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont14983:
beq_cont14981:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14986
	li	r2, 0
	b	beq_cont14987
beq_else14986:
	lis	r31, lo16(l12085)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12085)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12085)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else14988
	li	r2, 0
	b	ble_cont14989
ble_else14988:
	li	r2, 1
ble_cont14989:
beq_cont14987:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14990
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14991
	li	r2, 0
	blr
beq_else14991:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else14990:
	lis	r31, lo16(l12086)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12086)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12086)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fmul	f1, f1, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f2, 0(r2)
	fadd	f1, f1, f2
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fmul	f2, f2, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f3, 4(r2)
	fadd	f2, f2, f3
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fmul	f0, f3, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fadd	f0, f0, f3
	lwz	r5, 0(r3)
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else14992
	li	r2, 1
	b	beq_cont14993
beq_else14992:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	lwzx	r2, r6, r2
	stfd	f0, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	is_outside2912
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14995
	li	r2, 1
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	check_all_inside2917
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont14996
beq_else14995:
	li	r2, 0
beq_cont14996:
beq_cont14993:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14997
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else14997:
	li	r2, 1
	blr
shadow_check_one_or_group2926:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else14998
	li	r2, 0
	blr
beq_else14998:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	lwzx	r6, r7, r6
	li	r7, 0
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else14999
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15000
	li	r2, 0
	blr
beq_else15000:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15001
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15002
	li	r2, 0
	blr
beq_else15002:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15003
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15004
	li	r2, 0
	blr
beq_else15004:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15005
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_one_or_group2926
beq_else15005:
	li	r2, 1
	blr
beq_else15003:
	li	r2, 1
	blr
beq_else15001:
	li	r2, 1
	blr
beq_else14999:
	li	r2, 1
	blr
shadow_check_one_or_matrix2929:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	lwz	r7, 0(r6)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15006
	li	r2, 0
	blr
beq_else15006:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else15007
	li	r2, 1
	b	beq_cont15008
beq_else15007:
	lis	r8, lo16(min_caml_light_dirvec)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_light_dirvec)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_light_dirvec)
	lwz	r8, 0(r8)
	lis	r9, lo16(min_caml_intersection_point)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_intersection_point)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_intersection_point)
	lwz	r9, 0(r9)
	lis	r10, lo16(min_caml_objects)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_objects)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_objects)
	lwz	r10, 0(r10)
	slwi	r11, r7, 2
	lwzx	r10, r10, r11
	lfd	f0, 0(r9)
	lwz	r11, 20(r10)
	lfd	f1, 0(r11)
	fsub	f0, f0, f1
	lfd	f1, 4(r9)
	lwz	r11, 20(r10)
	lfd	f2, 4(r11)
	fsub	f1, f1, f2
	lfd	f2, 8(r9)
	lwz	r9, 20(r10)
	lfd	f3, 8(r9)
	fsub	f2, f2, f3
	lwz	r9, 4(r8)
	slwi	r7, r7, 2
	lwzx	r7, r9, r7
	lwz	r9, 4(r10)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15009
	lwz	r8, 0(r8)
	mflr	r31
	mr	r6, r7
	mr	r5, r8
	mr	r2, r10
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_rect_fast2838
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont15010
beq_else15009:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15011
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	lfd	f4, 0(r7)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else15013
	li	r2, 0
	b	ble_cont15014
ble_else15013:
	lis	r8, lo16(min_caml_solver_dist)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_solver_dist)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_solver_dist)
	lwz	r8, 0(r8)
	lfd	f3, 4(r7)
	fmul	f0, f3, f0
	lfd	f3, 8(r7)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r8)
	li	r2, 1
ble_cont15014:
	b	beq_cont15012
beq_else15011:
	mflr	r31
	mr	r5, r7
	mr	r2, r10
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_second_fast2851
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont15012:
beq_cont15010:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15015
	li	r2, 0
	b	beq_cont15016
beq_else15015:
	lis	r31, lo16(l12119)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12119)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12119)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15017
	li	r2, 0
	b	ble_cont15018
ble_else15017:
	lwz	r2, 0(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15019
	li	r2, 0
	b	beq_cont15020
beq_else15019:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15021
	lwz	r2, 0(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15023
	li	r2, 0
	b	beq_cont15024
beq_else15023:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15025
	lwz	r2, 0(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15027
	li	r2, 0
	b	beq_cont15028
beq_else15027:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15029
	li	r2, 4
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont15030
beq_else15029:
	li	r2, 1
beq_cont15030:
beq_cont15028:
	b	beq_cont15026
beq_else15025:
	li	r2, 1
beq_cont15026:
beq_cont15024:
	b	beq_cont15022
beq_else15021:
	li	r2, 1
beq_cont15022:
beq_cont15020:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15031
	li	r2, 0
	b	beq_cont15032
beq_else15031:
	li	r2, 1
beq_cont15032:
ble_cont15018:
beq_cont15016:
beq_cont15008:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15033
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else15033:
	lwz	r2, 0(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15034
	li	r2, 0
	b	beq_cont15035
beq_else15034:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15036
	lwz	r2, 0(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15038
	li	r2, 0
	b	beq_cont15039
beq_else15038:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15040
	lwz	r2, 0(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15042
	li	r2, 0
	b	beq_cont15043
beq_else15042:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_and_group2923
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15044
	li	r2, 4
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont15045
beq_else15044:
	li	r2, 1
beq_cont15045:
beq_cont15043:
	b	beq_cont15041
beq_else15040:
	li	r2, 1
beq_cont15041:
beq_cont15039:
	b	beq_cont15037
beq_else15036:
	li	r2, 1
beq_cont15037:
beq_cont15035:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15046
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else15046:
	li	r2, 1
	blr
solve_each_element2932:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15047
	blr
beq_else15047:
	lis	r8, lo16(min_caml_startp)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_startp)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_startp)
	lwz	r8, 0(r8)
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r7, 2
	lwzx	r9, r9, r10
	lfd	f0, 0(r8)
	lwz	r10, 20(r9)
	lfd	f1, 0(r10)
	fsub	f0, f0, f1
	lfd	f1, 4(r8)
	lwz	r10, 20(r9)
	lfd	f2, 4(r10)
	fsub	f1, f1, f2
	lfd	f2, 8(r8)
	lwz	r8, 20(r9)
	lfd	f3, 8(r8)
	fsub	f2, f2, f3
	lwz	r8, 4(r9)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r7, 12(r3)
	cmpwi	cr7, r8, 1
	bne	cr7, beq_else15049
	li	r8, 0
	li	r10, 1
	li	r11, 2
	stfd	f0, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	stw	r9, 40(r3)
	mflr	r31
	mr	r7, r10
	mr	r5, r6
	mr	r2, r9
	mr	r6, r8
	mr	r8, r11
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15051
	li	r6, 1
	li	r7, 2
	li	r8, 0
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 40(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15053
	li	r6, 2
	li	r7, 0
	li	r8, 1
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 32(r3)
	lwz	r2, 40(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15055
	li	r2, 0
	b	beq_cont15056
beq_else15055:
	li	r2, 3
beq_cont15056:
	b	beq_cont15054
beq_else15053:
	li	r2, 2
beq_cont15054:
	b	beq_cont15052
beq_else15051:
	li	r2, 1
beq_cont15052:
	b	beq_cont15050
beq_else15049:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else15057
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_surface2809
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont15058
beq_else15057:
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_second2828
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont15058:
beq_cont15050:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15059
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15060
	blr
beq_else15060:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
beq_else15059:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15062
	b	ble_cont15063
ble_else15062:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15064
	b	ble_cont15065
ble_else15064:
	lis	r31, lo16(l12086)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12086)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12086)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r6, 0(r3)
	lfd	f1, 0(r6)
	fmul	f1, f1, f0
	lis	r5, lo16(min_caml_startp)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp)
	lwz	r5, 0(r5)
	lfd	f2, 0(r5)
	fadd	f1, f1, f2
	lfd	f2, 4(r6)
	fmul	f2, f2, f0
	lis	r5, lo16(min_caml_startp)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp)
	lwz	r5, 0(r5)
	lfd	f3, 4(r5)
	fadd	f2, f2, f3
	lfd	f3, 8(r6)
	fmul	f3, f3, f0
	lis	r5, lo16(min_caml_startp)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp)
	lwz	r5, 0(r5)
	lfd	f4, 8(r5)
	fadd	f3, f3, f4
	lwz	r5, 4(r3)
	lwz	r7, 0(r5)
	stw	r2, 44(r3)
	stfd	f3, 48(r3)
	stfd	f2, 56(r3)
	stfd	f1, 64(r3)
	stfd	f0, 72(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15066
	li	r2, 1
	b	beq_cont15067
beq_else15066:
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	lwzx	r7, r8, r7
	mflr	r31
	mr	r2, r7
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	is_outside2912
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15068
	li	r2, 1
	lfd	f0, 64(r3)
	lfd	f1, 56(r3)
	lfd	f2, 48(r3)
	lwz	r5, 4(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	check_all_inside2917
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	b	beq_cont15069
beq_else15068:
	li	r2, 0
beq_cont15069:
beq_cont15067:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15070
	b	beq_cont15071
beq_else15070:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f0, 64(r3)
	stfd	f0, 0(r2)
	lfd	f0, 56(r3)
	stfd	f0, 4(r2)
	lfd	f0, 48(r3)
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_intersected_object_id)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersected_object_id)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersected_object_id)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
	lis	r2, lo16(min_caml_intsec_rectside)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intsec_rectside)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intsec_rectside)
	lwz	r2, 0(r2)
	lwz	r5, 44(r3)
	stw	r5, 0(r2)
beq_cont15071:
ble_cont15065:
ble_cont15063:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
solve_one_or_network2936:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15072
	blr
beq_else15072:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	lwzx	r7, r8, r7
	li	r8, 0
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solve_each_element2932
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15074
	blr
beq_else15074:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element2932
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15076
	blr
beq_else15076:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element2932
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15078
	blr
beq_else15078:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network2936
trace_or_matrix2940:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else15080
	blr
beq_else15080:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else15082
	lwz	r8, 4(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else15084
	b	beq_cont15085
beq_else15084:
	lis	r9, lo16(min_caml_and_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_and_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_and_net)
	lwz	r9, 0(r9)
	slwi	r8, r8, 2
	lwzx	r8, r9, r8
	li	r9, 0
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element2932
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15086
	b	beq_cont15087
beq_else15086:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element2932
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15088
	b	beq_cont15089
beq_else15088:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element2932
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network2936
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15089:
beq_cont15087:
beq_cont15085:
	b	beq_cont15083
beq_else15082:
	lis	r9, lo16(min_caml_startp)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_startp)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_startp)
	lwz	r9, 0(r9)
	lis	r10, lo16(min_caml_objects)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_objects)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_objects)
	lwz	r10, 0(r10)
	slwi	r8, r8, 2
	lwzx	r8, r10, r8
	lfd	f0, 0(r9)
	lwz	r10, 20(r8)
	lfd	f1, 0(r10)
	fsub	f0, f0, f1
	lfd	f1, 4(r9)
	lwz	r10, 20(r8)
	lfd	f2, 4(r10)
	fsub	f1, f1, f2
	lfd	f2, 8(r9)
	lwz	r9, 20(r8)
	lfd	f3, 8(r9)
	fsub	f2, f2, f3
	lwz	r9, 4(r8)
	stw	r7, 12(r3)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15090
	li	r9, 0
	li	r10, 1
	li	r11, 2
	stfd	f0, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	stw	r8, 40(r3)
	mflr	r31
	mr	r7, r10
	mr	r5, r6
	mr	r2, r8
	mr	r8, r11
	mr	r6, r9
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15092
	li	r6, 1
	li	r7, 2
	li	r8, 0
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 40(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15094
	li	r6, 2
	li	r7, 0
	li	r8, 1
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 32(r3)
	lwz	r2, 40(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_rect_surface2794
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15096
	li	r2, 0
	b	beq_cont15097
beq_else15096:
	li	r2, 3
beq_cont15097:
	b	beq_cont15095
beq_else15094:
	li	r2, 2
beq_cont15095:
	b	beq_cont15093
beq_else15092:
	li	r2, 1
beq_cont15093:
	b	beq_cont15091
beq_else15090:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15098
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_surface2809
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont15099
beq_else15098:
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solver_second2828
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont15099:
beq_cont15091:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15100
	b	beq_cont15101
beq_else15100:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15102
	b	ble_cont15103
ble_else15102:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15104
	b	beq_cont15105
beq_else15104:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_each_element2932
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15106
	b	beq_cont15107
beq_else15106:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_each_element2932
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15108
	b	beq_cont15109
beq_else15108:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_each_element2932
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_one_or_network2936
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont15109:
beq_cont15107:
beq_cont15105:
ble_cont15103:
beq_cont15101:
beq_cont15083:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15110
	blr
beq_else15110:
	stw	r2, 44(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else15112
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15114
	b	beq_cont15115
beq_else15114:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	lwzx	r7, r8, r7
	li	r8, 0
	lwz	r9, 0(r3)
	stw	r5, 48(r3)
	mflr	r31
	mr	r6, r9
	mr	r5, r7
	mr	r2, r8
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_each_element2932
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15116
	b	beq_cont15117
beq_else15116:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_each_element2932
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r2, 3
	lwz	r5, 48(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_one_or_network2936
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont15117:
beq_cont15115:
	b	beq_cont15113
beq_else15112:
	lis	r8, lo16(min_caml_startp)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_startp)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_startp)
	lwz	r8, 0(r8)
	lwz	r9, 0(r3)
	stw	r5, 48(r3)
	mflr	r31
	mr	r6, r8
	mr	r5, r9
	mr	r2, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solver2834
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15118
	b	beq_cont15119
beq_else15118:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15120
	b	ble_cont15121
ble_else15120:
	lwz	r2, 48(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15122
	b	beq_cont15123
beq_else15122:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_each_element2932
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15124
	b	beq_cont15125
beq_else15124:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_each_element2932
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r2, 3
	lwz	r5, 48(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solve_one_or_network2936
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont15125:
beq_cont15123:
ble_cont15121:
beq_cont15119:
beq_cont15113:
	lwz	r2, 44(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_or_matrix2940
solve_each_element_fast2946:
	lwz	r7, 0(r6)
	slwi	r8, r2, 2
	lwzx	r8, r5, r8
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else15126
	blr
beq_else15126:
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r8, 2
	lwzx	r9, r9, r10
	lwz	r10, 40(r9)
	lfd	f0, 0(r10)
	lfd	f1, 4(r10)
	lfd	f2, 8(r10)
	lwz	r11, 4(r6)
	slwi	r12, r8, 2
	lwzx	r11, r11, r12
	lwz	r12, 4(r9)
	stw	r7, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r2, 12(r3)
	stw	r8, 16(r3)
	cmpwi	cr7, r12, 1
	bne	cr7, beq_else15128
	lwz	r10, 0(r6)
	mflr	r31
	mr	r6, r11
	mr	r5, r10
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_rect_fast2838
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont15129
beq_else15128:
	cmpwi	cr7, r12, 2
	bne	cr7, beq_else15130
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 0(r11)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15132
	li	r2, 0
	b	ble_cont15133
ble_else15132:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	lfd	f0, 0(r11)
	lfd	f1, 12(r10)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
	li	r2, 1
ble_cont15133:
	b	beq_cont15131
beq_else15130:
	mflr	r31
	mr	r6, r10
	mr	r5, r11
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_second_fast22868
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15131:
beq_cont15129:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15134
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 16(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15135
	blr
beq_else15135:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	b	solve_each_element_fast2946
beq_else15134:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15137
	b	ble_cont15138
ble_else15137:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15139
	b	ble_cont15140
ble_else15139:
	lis	r31, lo16(l12086)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12086)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12086)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r5, 0(r3)
	lfd	f1, 0(r5)
	fmul	f1, f1, f0
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lfd	f2, 0(r6)
	fadd	f1, f1, f2
	lfd	f2, 4(r5)
	fmul	f2, f2, f0
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lfd	f3, 4(r6)
	fadd	f2, f2, f3
	lfd	f3, 8(r5)
	fmul	f3, f3, f0
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	lfd	f4, 8(r5)
	fadd	f3, f3, f4
	lwz	r5, 8(r3)
	lwz	r6, 0(r5)
	stw	r2, 20(r3)
	stfd	f3, 24(r3)
	stfd	f2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f0, 48(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else15141
	li	r2, 1
	b	beq_cont15142
beq_else15141:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	lwzx	r6, r7, r6
	mflr	r31
	mr	r2, r6
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	is_outside2912
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15143
	li	r2, 1
	lfd	f0, 40(r3)
	lfd	f1, 32(r3)
	lfd	f2, 24(r3)
	lwz	r5, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	check_all_inside2917
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont15144
beq_else15143:
	li	r2, 0
beq_cont15144:
beq_cont15142:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15145
	b	beq_cont15146
beq_else15145:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 48(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f0, 40(r3)
	stfd	f0, 0(r2)
	lfd	f0, 32(r3)
	stfd	f0, 4(r2)
	lfd	f0, 24(r3)
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_intersected_object_id)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersected_object_id)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersected_object_id)
	lwz	r2, 0(r2)
	lwz	r5, 16(r3)
	stw	r5, 0(r2)
	lis	r2, lo16(min_caml_intsec_rectside)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intsec_rectside)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intsec_rectside)
	lwz	r2, 0(r2)
	lwz	r5, 20(r3)
	stw	r5, 0(r2)
beq_cont15146:
ble_cont15140:
ble_cont15138:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	b	solve_each_element_fast2946
solve_one_or_network_fast2950:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15147
	blr
beq_else15147:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	lwzx	r7, r8, r7
	li	r8, 0
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solve_each_element_fast2946
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15149
	blr
beq_else15149:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15151
	blr
beq_else15151:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15153
	blr
beq_else15153:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	lwzx	r5, r7, r5
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network_fast2950
trace_or_matrix_fast2954:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else15155
	blr
beq_else15155:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else15157
	lwz	r8, 4(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else15159
	b	beq_cont15160
beq_else15159:
	lis	r9, lo16(min_caml_and_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_and_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_and_net)
	lwz	r9, 0(r9)
	slwi	r8, r8, 2
	lwzx	r8, r9, r8
	li	r9, 0
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15161
	b	beq_cont15162
beq_else15161:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15163
	b	beq_cont15164
beq_else15163:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15164:
beq_cont15162:
beq_cont15160:
	b	beq_cont15158
beq_else15157:
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r8, 2
	lwzx	r9, r9, r10
	lwz	r10, 40(r9)
	lfd	f0, 0(r10)
	lfd	f1, 4(r10)
	lfd	f2, 8(r10)
	lwz	r11, 4(r6)
	slwi	r8, r8, 2
	lwzx	r8, r11, r8
	lwz	r11, 4(r9)
	stw	r7, 12(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15165
	lwz	r10, 0(r6)
	mflr	r31
	mr	r6, r8
	mr	r5, r10
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_rect_fast2838
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont15166
beq_else15165:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15167
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 0(r8)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15169
	li	r2, 0
	b	ble_cont15170
ble_else15169:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	lfd	f0, 0(r8)
	lfd	f1, 12(r10)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
	li	r2, 1
ble_cont15170:
	b	beq_cont15168
beq_else15167:
	mflr	r31
	mr	r6, r10
	mr	r5, r8
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_second_fast22868
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15168:
beq_cont15166:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15171
	b	beq_cont15172
beq_else15171:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15173
	b	ble_cont15174
ble_else15173:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15175
	b	beq_cont15176
beq_else15175:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15177
	b	beq_cont15178
beq_else15177:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15179
	b	beq_cont15180
beq_else15179:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_each_element_fast2946
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 4
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15180:
beq_cont15178:
beq_cont15176:
ble_cont15174:
beq_cont15172:
beq_cont15158:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15181
	blr
beq_else15181:
	stw	r2, 16(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else15183
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else15185
	b	beq_cont15186
beq_else15185:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	lwzx	r7, r8, r7
	li	r8, 0
	lwz	r9, 0(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r6, r9
	mr	r5, r7
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15187
	b	beq_cont15188
beq_else15187:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 3
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15188:
beq_cont15186:
	b	beq_cont15184
beq_else15183:
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 40(r8)
	lfd	f0, 0(r9)
	lfd	f1, 4(r9)
	lfd	f2, 8(r9)
	lwz	r10, 0(r3)
	lwz	r11, 4(r10)
	slwi	r7, r7, 2
	lwzx	r7, r11, r7
	lwz	r11, 4(r8)
	stw	r5, 20(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15189
	lwz	r9, 0(r10)
	mflr	r31
	mr	r6, r7
	mr	r5, r9
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver_rect_fast2838
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont15190
beq_else15189:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15191
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lfd	f1, 0(r7)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15193
	li	r2, 0
	b	ble_cont15194
ble_else15193:
	lis	r8, lo16(min_caml_solver_dist)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_solver_dist)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_solver_dist)
	lwz	r8, 0(r8)
	lfd	f0, 0(r7)
	lfd	f1, 12(r9)
	fmul	f0, f0, f1
	stfd	f0, 0(r8)
	li	r2, 1
ble_cont15194:
	b	beq_cont15192
beq_else15191:
	mflr	r31
	mr	r6, r9
	mr	r5, r7
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver_second_fast22868
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15192:
beq_cont15190:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15195
	b	beq_cont15196
beq_else15195:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15197
	b	ble_cont15198
ble_else15197:
	lwz	r2, 20(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15199
	b	beq_cont15200
beq_else15199:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15201
	b	beq_cont15202
beq_else15201:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 3
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15202:
beq_cont15200:
ble_cont15198:
beq_cont15196:
beq_cont15184:
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_or_matrix_fast2954
get_nvector_second2964:
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r5, 20(r2)
	lfd	f1, 0(r5)
	fsub	f0, f0, f1
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lfd	f1, 4(r5)
	lwz	r5, 20(r2)
	lfd	f2, 4(r5)
	fsub	f1, f1, f2
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lfd	f2, 8(r5)
	lwz	r5, 20(r2)
	lfd	f3, 8(r5)
	fsub	f2, f2, f3
	lwz	r5, 16(r2)
	lfd	f3, 0(r5)
	fmul	f3, f0, f3
	lwz	r5, 16(r2)
	lfd	f4, 4(r5)
	fmul	f4, f1, f4
	lwz	r5, 16(r2)
	lfd	f5, 8(r5)
	fmul	f5, f2, f5
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else15203
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	stfd	f3, 0(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	stfd	f4, 4(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	stfd	f5, 8(r5)
	b	beq_cont15204
beq_else15203:
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 36(r2)
	lfd	f6, 8(r6)
	fmul	f6, f1, f6
	lwz	r6, 36(r2)
	lfd	f7, 4(r6)
	fmul	f7, f2, f7
	fadd	f6, f6, f7
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f7, 0(r31)
	fmul	f6, f6, f7
	fadd	f3, f3, f6
	stfd	f3, 0(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 36(r2)
	lfd	f3, 8(r6)
	fmul	f3, f0, f3
	lwz	r6, 36(r2)
	lfd	f6, 0(r6)
	fmul	f2, f2, f6
	fadd	f2, f3, f2
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	fadd	f2, f4, f2
	stfd	f2, 4(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 36(r2)
	lfd	f2, 4(r6)
	fmul	f0, f0, f2
	lwz	r6, 36(r2)
	lfd	f2, 0(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	fadd	f0, f5, f0
	stfd	f0, 8(r5)
beq_cont15204:
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r2, 24(r2)
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	b	vecunit_sgn2672
utexture2969:
	lwz	r6, 0(r2)
	lis	r7, lo16(min_caml_texture_color)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_texture_color)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_texture_color)
	lwz	r7, 0(r7)
	lwz	r8, 32(r2)
	lfd	f0, 0(r8)
	stfd	f0, 0(r7)
	lis	r7, lo16(min_caml_texture_color)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_texture_color)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_texture_color)
	lwz	r7, 0(r7)
	lwz	r8, 32(r2)
	lfd	f0, 4(r8)
	stfd	f0, 4(r7)
	lis	r7, lo16(min_caml_texture_color)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_texture_color)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_texture_color)
	lwz	r7, 0(r7)
	lwz	r8, 32(r2)
	lfd	f0, 8(r8)
	stfd	f0, 8(r7)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else15205
	lfd	f0, 0(r5)
	lwz	r6, 20(r2)
	lfd	f1, 0(r6)
	fsub	f0, f0, f1
	lis	r31, lo16(l12340)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12340)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12340)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l12341)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12341)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12341)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l12330)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12330)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12330)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else15206
	li	r6, 0
	b	ble_cont15207
ble_else15206:
	li	r6, 1
ble_cont15207:
	lfd	f0, 8(r5)
	lwz	r2, 20(r2)
	lfd	f1, 8(r2)
	fsub	f0, f0, f1
	lis	r31, lo16(l12340)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12340)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12340)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l12341)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12341)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12341)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l12330)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12330)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12330)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else15208
	li	r2, 0
	b	ble_cont15209
ble_else15208:
	li	r2, 1
ble_cont15209:
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15210
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15212
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f0, 0(r31)
	b	beq_cont15213
beq_else15212:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
beq_cont15213:
	b	beq_cont15211
beq_else15210:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15214
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	beq_cont15215
beq_else15214:
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f0, 0(r31)
beq_cont15215:
beq_cont15211:
	stfd	f0, 4(r5)
	blr
beq_else15205:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else15217
	lfd	f0, 4(r5)
	lis	r31, lo16(l12334)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12334)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12334)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_sin
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f1, 4(r2)
	lis	r31, lo16(l12334)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12334)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12334)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_sin
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fmul	f0, f1, f0
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f1, 0(r31)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 4(r2)
	blr
beq_else15217:
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else15220
	lfd	f0, 0(r5)
	lwz	r6, 20(r2)
	lfd	f1, 0(r6)
	fsub	f0, f0, f1
	lfd	f1, 8(r5)
	lwz	r2, 20(r2)
	lfd	f2, 8(r2)
	fsub	f1, f1, f2
	fmul	f0, f0, f0
	fmul	f1, f1, f1
	fadd	f0, f0, f1
	lis	r31, lo16(l12330)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12330)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12330)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	fsqrt	f0, f0
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l12318)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12318)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12318)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 16(r3)
	mflr	r31
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
	bl	min_caml_cos
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	stfd	f1, 4(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else15220:
	cmpwi	cr7, r6, 4
	bne	cr7, beq_else15222
	lfd	f0, 0(r5)
	lwz	r6, 20(r2)
	lfd	f1, 0(r6)
	fsub	f0, f0, f1
	lwz	r6, 16(r2)
	lfd	f1, 0(r6)
	fsqrt	f1, f1
	fmul	f0, f0, f1
	lfd	f1, 8(r5)
	lwz	r6, 20(r2)
	lfd	f2, 8(r6)
	fsub	f1, f1, f2
	lwz	r6, 16(r2)
	lfd	f2, 8(r6)
	fsqrt	f2, f2
	fmul	f1, f1, f2
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f2, f2, f3
	lis	r31, lo16(l12315)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12315)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12315)
	lfd	f3, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f0, f4
	bgt	cr7, ble_else15223
	fneg	f4, f0
	b	ble_cont15224
ble_else15223:
	fmr	f4, f0
ble_cont15224:
	stfd	f2, 32(r3)
	stw	r2, 40(r3)
	stw	r5, 0(r3)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else15225
	fdiv	f3, f1, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else15227
	fdiv	f0, f1, f0
	fneg	f0, f0
	b	ble_cont15228
ble_else15227:
	fdiv	f0, f1, f0
ble_cont15228:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_atan
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, lo16(l12317)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12317)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12317)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l12318)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12318)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12318)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont15226
ble_else15225:
	lis	r31, lo16(l12316)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12316)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12316)
	lfd	f0, 0(r31)
ble_cont15226:
	floor	f1, f0
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	lfd	f1, 4(r2)
	lwz	r2, 40(r3)
	lwz	r5, 20(r2)
	lfd	f2, 4(r5)
	fsub	f1, f1, f2
	lwz	r2, 16(r2)
	lfd	f2, 4(r2)
	fsqrt	f2, f2
	fmul	f1, f1, f2
	lis	r31, lo16(l12315)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12315)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12315)
	lfd	f2, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	lfd	f4, 32(r3)
	fcmpu	cr7, f4, f3
	bgt	cr7, ble_else15229
	fneg	f3, f4
	b	ble_cont15230
ble_else15229:
	fmr	f3, f4
ble_cont15230:
	stfd	f0, 48(r3)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else15232
	fdiv	f2, f1, f4
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else15234
	fdiv	f1, f1, f4
	fneg	f1, f1
	b	ble_cont15235
ble_else15234:
	fdiv	f1, f1, f4
ble_cont15235:
	mflr	r31
	fmr	f0, f1
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_atan
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r31, lo16(l12317)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12317)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12317)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l12318)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12318)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12318)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont15233
ble_else15232:
	lis	r31, lo16(l12316)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12316)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12316)
	lfd	f0, 0(r31)
ble_cont15233:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l12322)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12322)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12322)
	lfd	f1, 0(r31)
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f2, 0(r31)
	lfd	f3, 48(r3)
	fsub	f2, f2, f3
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f4, 0(r31)
	fsub	f3, f4, f3
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f2, 0(r31)
	fsub	f2, f2, f0
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f3, 0(r31)
	fsub	f0, f3, f0
	fmul	f0, f2, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15236
	b	ble_cont15237
ble_else15236:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
ble_cont15237:
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l12323)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12323)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12323)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, lo16(l12324)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12324)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12324)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else15222:
	blr
add_light2972:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else15240
	b	ble_cont15241
ble_else15240:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lfd	f3, 0(r2)
	lfd	f4, 0(r5)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 0(r2)
	lfd	f3, 4(r2)
	lfd	f4, 4(r5)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 4(r2)
	lfd	f3, 8(r2)
	lfd	f4, 8(r5)
	fmul	f0, f0, f4
	fadd	f0, f3, f0
	stfd	f0, 8(r2)
ble_cont15241:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15242
	blr
ble_else15242:
	fmul	f0, f1, f1
	fmul	f1, f1, f1
	fmul	f0, f0, f1
	fmul	f0, f0, f2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fadd	f1, f1, f0
	stfd	f1, 0(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 4(r5)
	fadd	f1, f1, f0
	stfd	f1, 4(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 8(r5)
	fadd	f0, f1, f0
	stfd	f0, 8(r2)
	blr
trace_reflections2976:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15245
	lis	r6, lo16(min_caml_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_reflections)
	lwz	r6, 0(r6)
	slwi	r7, r2, 2
	lwzx	r6, r6, r7
	lwz	r7, 4(r6)
	lis	r8, lo16(min_caml_tmin)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_tmin)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_tmin)
	lwz	r8, 0(r8)
	lis	r31, lo16(l12361)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12361)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12361)
	lfd	f2, 0(r31)
	stfd	f2, 0(r8)
	li	r8, 0
	lis	r9, lo16(min_caml_or_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_or_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_or_net)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	stw	r5, 16(r3)
	stfd	f0, 24(r3)
	stw	r7, 32(r3)
	stw	r6, 36(r3)
	mflr	r31
	mr	r6, r7
	mr	r5, r9
	mr	r2, r8
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l12119)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12119)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12119)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15248
	li	r2, 0
	b	ble_cont15249
ble_else15248:
	lis	r31, lo16(l12365)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12365)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12365)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15250
	li	r2, 0
	b	ble_cont15251
ble_else15250:
	li	r2, 1
ble_cont15251:
ble_cont15249:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15252
	b	beq_cont15253
beq_else15252:
	lis	r2, lo16(min_caml_intersected_object_id)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersected_object_id)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersected_object_id)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	slwi	r2, r2, 2
	lis	r5, lo16(min_caml_intsec_rectside)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intsec_rectside)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intsec_rectside)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	add	r2, r2, r5
	lwz	r5, 36(r3)
	lwz	r6, 0(r5)
	cmpw	cr7, r2, r6
	bne	cr7, beq_else15254
	li	r2, 0
	lis	r6, lo16(min_caml_or_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_or_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_or_net)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r5, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15256
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 32(r3)
	lwz	r6, 0(r5)
	lfd	f0, 0(r2)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r2)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r2, 36(r3)
	lfd	f1, 8(r2)
	lfd	f2, 24(r3)
	fmul	f3, f1, f2
	fmul	f0, f3, f0
	lwz	r2, 0(r5)
	lwz	r5, 16(r3)
	lfd	f3, 0(r5)
	lfd	f4, 0(r2)
	fmul	f3, f3, f4
	lfd	f4, 4(r5)
	lfd	f5, 4(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r5)
	lfd	f5, 8(r2)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fmul	f1, f1, f3
	lfd	f3, 8(r3)
	mflr	r31
	fmr	f2, f3
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	add_light2972
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont15257
beq_else15256:
beq_cont15257:
	b	beq_cont15255
beq_else15254:
beq_cont15255:
beq_cont15253:
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 16(r3)
	b	trace_reflections2976
bge_else15245:
	blr
trace_ray2981:
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else15259
	lwz	r7, 8(r6)
	lis	r8, lo16(min_caml_tmin)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_tmin)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_tmin)
	lwz	r8, 0(r8)
	lis	r31, lo16(l12361)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12361)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12361)
	lfd	f2, 0(r31)
	stfd	f2, 0(r8)
	li	r8, 0
	lis	r9, lo16(min_caml_or_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_or_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_or_net)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	stfd	f1, 0(r3)
	stw	r6, 8(r3)
	stfd	f0, 16(r3)
	stw	r5, 24(r3)
	stw	r7, 28(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r6, r5
	mr	r2, r8
	mr	r5, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_or_matrix2940
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l12119)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12119)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12119)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15261
	li	r2, 0
	b	ble_cont15262
ble_else15261:
	lis	r31, lo16(l12365)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12365)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12365)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15263
	li	r2, 0
	b	ble_cont15264
ble_else15263:
	li	r2, 1
ble_cont15264:
ble_cont15262:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15265
	li	r2, -1
	lwz	r5, 32(r3)
	slwi	r6, r5, 2
	lwz	r7, 28(r3)
	stwx	r2, r7, r6
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else15266
	blr
beq_else15266:
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lfd	f1, 0(r2)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15268
	blr
ble_else15268:
	fmul	f1, f0, f0
	fmul	f0, f1, f0
	lfd	f1, 16(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_beam)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_beam)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_beam)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fadd	f1, f1, f0
	stfd	f1, 0(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 4(r5)
	fadd	f1, f1, f0
	stfd	f1, 4(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lfd	f1, 8(r5)
	fadd	f0, f1, f0
	stfd	f0, 8(r2)
	blr
beq_else15265:
	lis	r2, lo16(min_caml_intersected_object_id)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersected_object_id)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersected_object_id)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 8(r5)
	lwz	r7, 28(r5)
	lfd	f0, 0(r7)
	lfd	f1, 16(r3)
	fmul	f0, f0, f1
	lwz	r7, 4(r5)
	stw	r6, 36(r3)
	stfd	f0, 40(r3)
	stw	r2, 48(r3)
	stw	r5, 52(r3)
	cmpwi	cr7, r7, 1
	bne	cr7, beq_else15271
	lis	r7, lo16(min_caml_intsec_rectside)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_intsec_rectside)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_intsec_rectside)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_nvector)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_nvector)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_nvector)
	lwz	r8, 0(r8)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	stfd	f2, 0(r8)
	stfd	f2, 4(r8)
	stfd	f2, 8(r8)
	lis	r8, lo16(min_caml_nvector)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_nvector)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_nvector)
	lwz	r8, 0(r8)
	subi	r9, r7, 1
	subi	r7, r7, 1
	slwi	r7, r7, 2
	lwz	r10, 24(r3)
	lfdx	f2, r10, r7
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bne	cr7, beq_else15273
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	b	beq_cont15274
beq_else15273:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else15275
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f2, 0(r31)
	b	ble_cont15276
ble_else15275:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f2, 0(r31)
ble_cont15276:
beq_cont15274:
	fneg	f2, f2
	slwi	r7, r9, 2
	stfdx	f2, r8, r7
	b	beq_cont15272
beq_else15271:
	cmpwi	cr7, r7, 2
	bne	cr7, beq_else15277
	lis	r7, lo16(min_caml_nvector)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_nvector)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_nvector)
	lwz	r7, 0(r7)
	lwz	r8, 16(r5)
	lfd	f2, 0(r8)
	fneg	f2, f2
	stfd	f2, 0(r7)
	lis	r7, lo16(min_caml_nvector)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_nvector)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_nvector)
	lwz	r7, 0(r7)
	lwz	r8, 16(r5)
	lfd	f2, 4(r8)
	fneg	f2, f2
	stfd	f2, 4(r7)
	lis	r7, lo16(min_caml_nvector)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_nvector)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_nvector)
	lwz	r7, 0(r7)
	lwz	r8, 16(r5)
	lfd	f2, 8(r8)
	fneg	f2, f2
	stfd	f2, 8(r7)
	b	beq_cont15278
beq_else15277:
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	get_nvector_second2964
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont15278:
beq_cont15272:
	lis	r2, lo16(min_caml_startp)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_startp)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_startp)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 4(r5)
	stfd	f0, 4(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	utexture2969
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	slwi	r2, r2, 2
	lis	r5, lo16(min_caml_intsec_rectside)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intsec_rectside)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intsec_rectside)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	add	r2, r2, r5
	lwz	r5, 32(r3)
	slwi	r6, r5, 2
	lwz	r7, 28(r3)
	stwx	r2, r7, r6
	lwz	r2, 8(r3)
	lwz	r6, 4(r2)
	slwi	r8, r5, 2
	lwzx	r6, r6, r8
	lis	r8, lo16(min_caml_intersection_point)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_intersection_point)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_intersection_point)
	lwz	r8, 0(r8)
	lfd	f0, 0(r8)
	stfd	f0, 0(r6)
	lfd	f0, 4(r8)
	stfd	f0, 4(r6)
	lfd	f0, 8(r8)
	stfd	f0, 8(r6)
	lwz	r6, 12(r2)
	lis	r31, lo16(l11840)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11840)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11840)
	lfd	f0, 0(r31)
	lwz	r8, 52(r3)
	lwz	r9, 28(r8)
	lfd	f1, 0(r9)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15279
	li	r9, 1
	slwi	r10, r5, 2
	stwx	r9, r6, r10
	lwz	r6, 16(r2)
	slwi	r9, r5, 2
	lwzx	r9, r6, r9
	lis	r10, lo16(min_caml_texture_color)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_texture_color)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_texture_color)
	lwz	r10, 0(r10)
	lfd	f0, 0(r10)
	stfd	f0, 0(r9)
	lfd	f0, 4(r10)
	stfd	f0, 4(r9)
	lfd	f0, 8(r10)
	stfd	f0, 8(r9)
	slwi	r9, r5, 2
	lwzx	r6, r6, r9
	lis	r31, lo16(l12425)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12425)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12425)
	lfd	f0, 0(r31)
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lfd	f2, 0(r6)
	fmul	f2, f2, f0
	stfd	f2, 0(r6)
	lfd	f2, 4(r6)
	fmul	f2, f2, f0
	stfd	f2, 4(r6)
	lfd	f2, 8(r6)
	fmul	f0, f2, f0
	stfd	f0, 8(r6)
	lwz	r6, 28(r2)
	slwi	r9, r5, 2
	lwzx	r6, r6, r9
	lis	r9, lo16(min_caml_nvector)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_nvector)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_nvector)
	lwz	r9, 0(r9)
	lfd	f0, 0(r9)
	stfd	f0, 0(r6)
	lfd	f0, 4(r9)
	stfd	f0, 4(r6)
	lfd	f0, 8(r9)
	stfd	f0, 8(r6)
	b	ble_cont15280
ble_else15279:
	li	r9, 0
	slwi	r10, r5, 2
	stwx	r9, r6, r10
ble_cont15280:
	lis	r31, lo16(l12439)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12439)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12439)
	lfd	f0, 0(r31)
	lis	r6, lo16(min_caml_nvector)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_nvector)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_nvector)
	lwz	r6, 0(r6)
	lwz	r9, 24(r3)
	lfd	f1, 0(r9)
	lfd	f2, 0(r6)
	fmul	f1, f1, f2
	lfd	f2, 4(r9)
	lfd	f3, 4(r6)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lfd	f2, 8(r9)
	lfd	f3, 8(r6)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	fmul	f0, f0, f1
	lis	r6, lo16(min_caml_nvector)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_nvector)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_nvector)
	lwz	r6, 0(r6)
	lfd	f1, 0(r9)
	lfd	f2, 0(r6)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 0(r9)
	lfd	f1, 4(r9)
	lfd	f2, 4(r6)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 4(r9)
	lfd	f1, 8(r9)
	lfd	f2, 8(r6)
	fmul	f0, f0, f2
	fadd	f0, f1, f0
	stfd	f0, 8(r9)
	lwz	r6, 28(r8)
	lfd	f0, 4(r6)
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	li	r6, 0
	lis	r10, lo16(min_caml_or_net)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_or_net)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_or_net)
	lwz	r10, 0(r10)
	lwz	r10, 0(r10)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r5, r10
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15281
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lfd	f1, 4(r2)
	lfd	f2, 4(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lwz	r5, 24(r3)
	lfd	f2, 0(r5)
	lfd	f3, 0(r2)
	fmul	f2, f2, f3
	lfd	f3, 4(r5)
	lfd	f4, 4(r2)
	fmul	f3, f3, f4
	fadd	f2, f2, f3
	lfd	f3, 8(r5)
	lfd	f4, 8(r2)
	fmul	f3, f3, f4
	fadd	f2, f2, f3
	fneg	f2, f2
	lfd	f3, 56(r3)
	mflr	r31
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	add_light2972
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	beq_cont15282
beq_else15281:
beq_cont15282:
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	lfd	f0, 0(r2)
	stfd	f0, 0(r5)
	lfd	f0, 4(r2)
	stfd	f0, 4(r5)
	lfd	f0, 8(r2)
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_n_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_n_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_n_objects)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	setup_startp_constants2892
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lwz	r5, 24(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	trace_reflections2976
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15283
	blr
ble_else15283:
	lwz	r2, 32(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else15285
	b	bge_cont15286
bge_else15285:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 28(r3)
	stwx	r6, r7, r5
bge_cont15286:
	lwz	r5, 36(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else15287
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lwz	r5, 52(r3)
	lwz	r5, 28(r5)
	lfd	f2, 0(r5)
	fsub	f0, f0, f2
	fmul	f0, f1, f0
	addi	r2, r2, 1
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	lfd	f2, 0(r3)
	fadd	f1, f2, f1
	lwz	r5, 24(r3)
	lwz	r6, 8(r3)
	b	trace_ray2981
beq_else15287:
	blr
ble_else15259:
	blr
trace_diffuse_ray2987:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lis	r31, lo16(l12361)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12361)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12361)
	lfd	f1, 0(r31)
	stfd	f1, 0(r5)
	li	r5, 0
	lis	r6, lo16(min_caml_or_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_or_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_or_net)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	stfd	f0, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r29, r6
	mr	r6, r2
	mr	r2, r5
	mr	r5, r29
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l12119)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12119)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12119)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15290
	li	r2, 0
	b	ble_cont15291
ble_else15290:
	lis	r31, lo16(l12365)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12365)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12365)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15292
	li	r2, 0
	b	ble_cont15293
ble_else15292:
	li	r2, 1
ble_cont15293:
ble_cont15291:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15294
	blr
beq_else15294:
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_intersected_object_id)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersected_object_id)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersected_object_id)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r5, 8(r3)
	lwz	r5, 0(r5)
	lwz	r6, 4(r2)
	stw	r2, 12(r3)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else15296
	lis	r6, lo16(min_caml_intsec_rectside)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_intsec_rectside)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_intsec_rectside)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	lis	r7, lo16(min_caml_nvector)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_nvector)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_nvector)
	lwz	r7, 0(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r7)
	stfd	f0, 4(r7)
	stfd	f0, 8(r7)
	lis	r7, lo16(min_caml_nvector)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_nvector)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_nvector)
	lwz	r7, 0(r7)
	subi	r8, r6, 1
	subi	r6, r6, 1
	slwi	r6, r6, 2
	lfdx	f0, r5, r6
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else15298
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	beq_cont15299
beq_else15298:
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15300
	lis	r31, lo16(l11689)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11689)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11689)
	lfd	f0, 0(r31)
	b	ble_cont15301
ble_else15300:
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
ble_cont15301:
beq_cont15299:
	fneg	f0, f0
	slwi	r5, r8, 2
	stfdx	f0, r7, r5
	b	beq_cont15297
beq_else15296:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else15302
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 16(r2)
	lfd	f0, 0(r6)
	fneg	f0, f0
	stfd	f0, 0(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 16(r2)
	lfd	f0, 4(r6)
	fneg	f0, f0
	stfd	f0, 4(r5)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r6, 16(r2)
	lfd	f0, 8(r6)
	fneg	f0, f0
	stfd	f0, 8(r5)
	b	beq_cont15303
beq_else15302:
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	get_nvector_second2964
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15303:
beq_cont15297:
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	utexture2969
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 0
	lis	r5, lo16(min_caml_or_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_or_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_or_net)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15304
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lfd	f1, 4(r2)
	lfd	f2, 4(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15305
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	b	ble_cont15306
ble_else15305:
ble_cont15306:
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lfd	f1, 0(r3)
	fmul	f0, f1, f0
	lwz	r5, 12(r3)
	lwz	r5, 28(r5)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lfd	f1, 0(r2)
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 0(r2)
	lfd	f1, 4(r2)
	lfd	f2, 4(r5)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 4(r2)
	lfd	f1, 8(r2)
	lfd	f2, 8(r5)
	fmul	f0, f0, f2
	fadd	f0, f1, f0
	stfd	f0, 8(r2)
	blr
beq_else15304:
	blr
iter_trace_diffuse_rays2990:
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15309
	slwi	r8, r7, 2
	lwzx	r8, r2, r8
	lwz	r8, 0(r8)
	lfd	f0, 0(r8)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lfd	f1, 4(r8)
	lfd	f2, 4(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r8)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r7, 12(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15310
	slwi	r8, r7, 2
	lwzx	r8, r2, r8
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_ray2987
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	ble_cont15311
ble_else15310:
	addi	r8, r7, 1
	slwi	r8, r8, 2
	lwzx	r8, r2, r8
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_ray2987
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont15311:
	lwz	r2, 12(r3)
	subi	r2, r2, 2
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15312
	slwi	r5, r2, 2
	lwz	r6, 8(r3)
	lwzx	r5, r6, r5
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r7, 4(r3)
	lfd	f1, 0(r7)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	stw	r2, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15313
	slwi	r5, r2, 2
	lwzx	r5, r6, r5
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_ray2987
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	ble_cont15314
ble_else15313:
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwzx	r5, r6, r5
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_ray2987
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont15314:
	lwz	r2, 16(r3)
	subi	r7, r2, 2
	lwz	r2, 8(r3)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	iter_trace_diffuse_rays2990
bge_else15312:
	blr
bge_else15309:
	blr
trace_diffuse_ray_80percent2999:
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15317
	b	beq_cont15318
beq_else15317:
	lis	r7, lo16(min_caml_dirvecs)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_dirvecs)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_dirvecs)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_startp_fast)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_startp_fast)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_startp_fast)
	lwz	r8, 0(r8)
	lfd	f0, 0(r6)
	stfd	f0, 0(r8)
	lfd	f0, 4(r6)
	stfd	f0, 4(r8)
	lfd	f0, 8(r6)
	stfd	f0, 8(r8)
	lis	r8, lo16(min_caml_n_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_n_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_n_objects)
	lwz	r8, 0(r8)
	lwz	r8, 0(r8)
	subi	r8, r8, 1
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_startp_constants2892
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 12(r3)
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15318:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else15319
	b	beq_cont15320
beq_else15319:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 4(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 16(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_startp_constants2892
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 16(r3)
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15320:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else15321
	b	beq_cont15322
beq_else15321:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 8(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 4(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 20(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_startp_constants2892
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 20(r3)
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15322:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else15323
	b	beq_cont15324
beq_else15323:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 12(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 4(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 24(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_startp_constants2892
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 24(r3)
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15324:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else15325
	blr
beq_else15325:
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	lwz	r6, 4(r3)
	lfd	f0, 0(r6)
	stfd	f0, 0(r5)
	lfd	f0, 4(r6)
	stfd	f0, 4(r5)
	lfd	f0, 8(r6)
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_n_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_n_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_n_objects)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_startp_constants2892
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 28(r3)
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	b	iter_trace_diffuse_rays2990
calc_diffuse_using_1point3003:
	lwz	r6, 20(r2)
	lwz	r7, 28(r2)
	lwz	r8, 4(r2)
	lwz	r9, 16(r2)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r5, 2
	lwzx	r6, r6, r11
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	lwzx	r6, r7, r6
	slwi	r7, r5, 2
	lwzx	r7, r8, r7
	stw	r9, 0(r3)
	stw	r5, 4(r3)
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15327
	b	beq_cont15328
beq_else15327:
	lis	r8, lo16(min_caml_dirvecs)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_dirvecs)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_dirvecs)
	lwz	r8, 0(r8)
	lwz	r8, 0(r8)
	lis	r10, lo16(min_caml_startp_fast)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_startp_fast)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_startp_fast)
	lwz	r10, 0(r10)
	lfd	f0, 0(r7)
	stfd	f0, 0(r10)
	lfd	f0, 4(r7)
	stfd	f0, 4(r10)
	lfd	f0, 8(r7)
	stfd	f0, 8(r10)
	lis	r10, lo16(min_caml_n_objects)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_n_objects)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_n_objects)
	lwz	r10, 0(r10)
	lwz	r10, 0(r10)
	subi	r10, r10, 1
	stw	r8, 20(r3)
	mflr	r31
	mr	r5, r10
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_startp_constants2892
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15329
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	trace_diffuse_ray2987
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont15330
ble_else15329:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	trace_diffuse_ray2987
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont15330:
	li	r7, 116
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	lwz	r6, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15328:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else15331
	b	beq_cont15332
beq_else15331:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 12(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 24(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_startp_constants2892
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15333
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	trace_diffuse_ray2987
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont15334
ble_else15333:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	trace_diffuse_ray2987
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont15334:
	li	r7, 116
	lwz	r2, 24(r3)
	lwz	r5, 8(r3)
	lwz	r6, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15332:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else15335
	b	beq_cont15336
beq_else15335:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 8(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 12(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 28(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_startp_constants2892
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15337
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont15338
ble_else15337:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont15338:
	li	r7, 116
	lwz	r2, 28(r3)
	lwz	r5, 8(r3)
	lwz	r6, 12(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont15336:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else15339
	b	beq_cont15340
beq_else15339:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 12(r5)
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lwz	r7, 12(r3)
	lfd	f0, 0(r7)
	stfd	f0, 0(r6)
	lfd	f0, 4(r7)
	stfd	f0, 4(r6)
	lfd	f0, 8(r7)
	stfd	f0, 8(r6)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r5, 32(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_startp_constants2892
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15341
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont15342
ble_else15341:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont15342:
	li	r7, 116
	lwz	r2, 32(r3)
	lwz	r5, 8(r3)
	lwz	r6, 12(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont15340:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else15343
	b	beq_cont15344
beq_else15343:
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	lwz	r6, 12(r3)
	lfd	f0, 0(r6)
	stfd	f0, 0(r5)
	lfd	f0, 4(r6)
	stfd	f0, 4(r5)
	lfd	f0, 8(r6)
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_n_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_n_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_n_objects)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_startp_constants2892
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15345
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	trace_diffuse_ray2987
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	ble_cont15346
ble_else15345:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	trace_diffuse_ray2987
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
ble_cont15346:
	li	r7, 116
	lwz	r2, 36(r3)
	lwz	r5, 8(r3)
	lwz	r6, 12(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont15344:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	lfd	f2, 0(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	lfd	f0, 4(r2)
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 4(r2)
	lfd	f0, 8(r2)
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r2)
	blr
calc_diffuse_using_5points3006:
	slwi	r9, r2, 2
	lwzx	r5, r5, r9
	lwz	r5, 20(r5)
	subi	r9, r2, 1
	slwi	r9, r9, 2
	lwzx	r9, r6, r9
	lwz	r9, 20(r9)
	slwi	r10, r2, 2
	lwzx	r10, r6, r10
	lwz	r10, 20(r10)
	addi	r11, r2, 1
	slwi	r11, r11, 2
	lwzx	r11, r6, r11
	lwz	r11, 20(r11)
	slwi	r12, r2, 2
	lwzx	r7, r7, r12
	lwz	r7, 20(r7)
	lis	r12, lo16(min_caml_diffuse_ray)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_diffuse_ray)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_diffuse_ray)
	lwz	r12, 0(r12)
	slwi	r13, r8, 2
	lwzx	r5, r5, r13
	lfd	f0, 0(r5)
	stfd	f0, 0(r12)
	lfd	f0, 4(r5)
	stfd	f0, 4(r12)
	lfd	f0, 8(r5)
	stfd	f0, 8(r12)
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	slwi	r12, r8, 2
	lwzx	r9, r9, r12
	lfd	f0, 0(r5)
	lfd	f1, 0(r9)
	fadd	f0, f0, f1
	stfd	f0, 0(r5)
	lfd	f0, 4(r5)
	lfd	f1, 4(r9)
	fadd	f0, f0, f1
	stfd	f0, 4(r5)
	lfd	f0, 8(r5)
	lfd	f1, 8(r9)
	fadd	f0, f0, f1
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	slwi	r9, r8, 2
	lwzx	r9, r10, r9
	lfd	f0, 0(r5)
	lfd	f1, 0(r9)
	fadd	f0, f0, f1
	stfd	f0, 0(r5)
	lfd	f0, 4(r5)
	lfd	f1, 4(r9)
	fadd	f0, f0, f1
	stfd	f0, 4(r5)
	lfd	f0, 8(r5)
	lfd	f1, 8(r9)
	fadd	f0, f0, f1
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	slwi	r9, r8, 2
	lwzx	r9, r11, r9
	lfd	f0, 0(r5)
	lfd	f1, 0(r9)
	fadd	f0, f0, f1
	stfd	f0, 0(r5)
	lfd	f0, 4(r5)
	lfd	f1, 4(r9)
	fadd	f0, f0, f1
	stfd	f0, 4(r5)
	lfd	f0, 8(r5)
	lfd	f1, 8(r9)
	fadd	f0, f0, f1
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	slwi	r9, r8, 2
	lwzx	r7, r7, r9
	lfd	f0, 0(r5)
	lfd	f1, 0(r7)
	fadd	f0, f0, f1
	stfd	f0, 0(r5)
	lfd	f0, 4(r5)
	lfd	f1, 4(r7)
	fadd	f0, f0, f1
	stfd	f0, 4(r5)
	lfd	f0, 8(r5)
	lfd	f1, 8(r7)
	fadd	f0, f0, f1
	stfd	f0, 8(r5)
	slwi	r2, r2, 2
	lwzx	r2, r6, r2
	lwz	r2, 16(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	slwi	r6, r8, 2
	lwzx	r2, r2, r6
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	lfd	f0, 0(r5)
	lfd	f1, 0(r2)
	lfd	f2, 0(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r5)
	lfd	f0, 4(r5)
	lfd	f1, 4(r2)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 4(r5)
	lfd	f0, 8(r5)
	lfd	f1, 8(r2)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r5)
	blr
do_without_neighbors3012:
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else15349
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15350
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r2, 0(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15351
	b	beq_cont15352
beq_else15351:
	lwz	r6, 20(r2)
	lwz	r7, 28(r2)
	lwz	r8, 4(r2)
	lwz	r9, 16(r2)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r5, 2
	lwzx	r6, r6, r11
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	slwi	r10, r5, 2
	lwzx	r7, r7, r10
	slwi	r10, r5, 2
	lwzx	r8, r8, r10
	stw	r9, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	lwzx	r6, r7, r6
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lfd	f0, 0(r2)
	lfd	f1, 0(r6)
	lfd	f2, 0(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	lfd	f0, 4(r2)
	lfd	f1, 4(r6)
	lfd	f2, 4(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 4(r2)
	lfd	f0, 8(r2)
	lfd	f1, 8(r6)
	lfd	f2, 8(r7)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont15352:
	addi	r5, r5, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else15353
	lwz	r2, 0(r3)
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15354
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r5, 12(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15355
	b	beq_cont15356
beq_else15355:
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15356:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else15354:
	blr
ble_else15353:
	blr
bge_else15350:
	blr
ble_else15349:
	blr
try_exploit_neighbors3028:
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else15361
	lwz	r11, 8(r10)
	slwi	r12, r9, 2
	lwzx	r11, r11, r12
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else15362
	slwi	r11, r2, 2
	lwzx	r11, r7, r11
	lwz	r11, 8(r11)
	slwi	r12, r9, 2
	lwzx	r11, r11, r12
	slwi	r12, r2, 2
	lwzx	r12, r6, r12
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	lwzx	r12, r12, r13
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15363
	slwi	r12, r2, 2
	lwzx	r12, r8, r12
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	lwzx	r12, r12, r13
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15365
	subi	r12, r2, 1
	slwi	r12, r12, 2
	lwzx	r12, r7, r12
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	lwzx	r12, r12, r13
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15367
	addi	r12, r2, 1
	slwi	r12, r12, 2
	lwzx	r12, r7, r12
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	lwzx	r12, r12, r13
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15369
	li	r11, 1
	b	beq_cont15370
beq_else15369:
	li	r11, 0
beq_cont15370:
	b	beq_cont15368
beq_else15367:
	li	r11, 0
beq_cont15368:
	b	beq_cont15366
beq_else15365:
	li	r11, 0
beq_cont15366:
	b	beq_cont15364
beq_else15363:
	li	r11, 0
beq_cont15364:
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else15371
	slwi	r2, r2, 2
	lwzx	r2, r7, r2
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else15372
	lwz	r5, 8(r2)
	slwi	r6, r9, 2
	lwzx	r5, r5, r6
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else15373
	lwz	r5, 12(r2)
	slwi	r6, r9, 2
	lwzx	r5, r5, r6
	stw	r2, 0(r3)
	stw	r9, 4(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else15374
	b	beq_cont15375
beq_else15374:
	mflr	r31
	mr	r5, r9
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont15375:
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else15373:
	blr
ble_else15372:
	blr
beq_else15371:
	lwz	r10, 12(r10)
	slwi	r11, r9, 2
	lwzx	r10, r10, r11
	stw	r5, 8(r3)
	stw	r8, 12(r3)
	stw	r6, 16(r3)
	stw	r7, 20(r3)
	stw	r2, 24(r3)
	stw	r9, 4(r3)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else15378
	b	beq_cont15379
beq_else15378:
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	mr	r7, r8
	mr	r8, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15379:
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lwz	r2, 24(r3)
	slwi	r6, r2, 2
	lwz	r7, 20(r3)
	lwzx	r6, r7, r6
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else15380
	lwz	r8, 8(r6)
	slwi	r9, r5, 2
	lwzx	r8, r8, r9
	cmpwi	cr7, r8, 0
	blt	cr7, bge_else15381
	slwi	r8, r2, 2
	lwzx	r8, r7, r8
	lwz	r8, 8(r8)
	slwi	r9, r5, 2
	lwzx	r8, r8, r9
	slwi	r9, r2, 2
	lwz	r10, 16(r3)
	lwzx	r9, r10, r9
	lwz	r9, 8(r9)
	slwi	r11, r5, 2
	lwzx	r9, r9, r11
	cmpw	cr7, r9, r8
	bne	cr7, beq_else15382
	slwi	r9, r2, 2
	lwz	r11, 12(r3)
	lwzx	r9, r11, r9
	lwz	r9, 8(r9)
	slwi	r12, r5, 2
	lwzx	r9, r9, r12
	cmpw	cr7, r9, r8
	bne	cr7, beq_else15384
	subi	r9, r2, 1
	slwi	r9, r9, 2
	lwzx	r9, r7, r9
	lwz	r9, 8(r9)
	slwi	r12, r5, 2
	lwzx	r9, r9, r12
	cmpw	cr7, r9, r8
	bne	cr7, beq_else15386
	addi	r9, r2, 1
	slwi	r9, r9, 2
	lwzx	r9, r7, r9
	lwz	r9, 8(r9)
	slwi	r12, r5, 2
	lwzx	r9, r9, r12
	cmpw	cr7, r9, r8
	bne	cr7, beq_else15388
	li	r8, 1
	b	beq_cont15389
beq_else15388:
	li	r8, 0
beq_cont15389:
	b	beq_cont15387
beq_else15386:
	li	r8, 0
beq_cont15387:
	b	beq_cont15385
beq_else15384:
	li	r8, 0
beq_cont15385:
	b	beq_cont15383
beq_else15382:
	li	r8, 0
beq_cont15383:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else15390
	slwi	r2, r2, 2
	lwzx	r2, r7, r2
	b	do_without_neighbors3012
beq_else15390:
	lwz	r6, 12(r6)
	slwi	r8, r5, 2
	lwzx	r6, r6, r8
	stw	r5, 28(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15391
	b	beq_cont15392
beq_else15391:
	lwz	r6, 12(r3)
	mflr	r31
	mr	r8, r5
	mr	r5, r10
	mr	r29, r7
	mr	r7, r6
	mr	r6, r29
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont15392:
	lwz	r2, 28(r3)
	addi	r9, r2, 1
	lwz	r2, 24(r3)
	lwz	r5, 8(r3)
	lwz	r6, 16(r3)
	lwz	r7, 20(r3)
	lwz	r8, 12(r3)
	b	try_exploit_neighbors3028
bge_else15381:
	blr
ble_else15380:
	blr
bge_else15362:
	blr
ble_else15361:
	blr
write_rgb3039:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15397
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15399
	b	bge_cont15400
bge_else15399:
	li	r2, 0
bge_cont15400:
	b	ble_cont15398
ble_else15397:
	li	r2, 255
ble_cont15398:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 4(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15401
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15403
	b	bge_cont15404
bge_else15403:
	li	r2, 0
bge_cont15404:
	b	ble_cont15402
ble_else15401:
	li	r2, 255
ble_cont15402:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 8(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15405
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15407
	b	bge_cont15408
bge_else15407:
	li	r2, 0
bge_cont15408:
	b	ble_cont15406
ble_else15405:
	li	r2, 255
ble_cont15406:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	blr
pretrace_diffuse_rays3041:
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else15410
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15411
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r5, 0(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15412
	b	beq_cont15413
beq_else15412:
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r7)
	stfd	f0, 4(r7)
	stfd	f0, 8(r7)
	lwz	r7, 28(r2)
	lwz	r8, 4(r2)
	lis	r9, lo16(min_caml_dirvecs)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_dirvecs)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_dirvecs)
	lwz	r9, 0(r9)
	slwi	r6, r6, 2
	lwzx	r6, r9, r6
	slwi	r9, r5, 2
	lwzx	r7, r7, r9
	slwi	r9, r5, 2
	lwzx	r8, r8, r9
	lis	r9, lo16(min_caml_startp_fast)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_startp_fast)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_startp_fast)
	lwz	r9, 0(r9)
	lfd	f0, 0(r8)
	stfd	f0, 0(r9)
	lfd	f0, 4(r8)
	stfd	f0, 4(r9)
	lfd	f0, 8(r8)
	stfd	f0, 8(r9)
	lis	r9, lo16(min_caml_n_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_n_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_n_objects)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	subi	r9, r9, 1
	stw	r2, 4(r3)
	stw	r8, 8(r3)
	stw	r7, 12(r3)
	stw	r6, 16(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_startp_constants2892
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 16(r3)
	lwz	r5, 12(r3)
	lwz	r6, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 20(r2)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	lwzx	r5, r5, r7
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lfd	f0, 0(r7)
	stfd	f0, 0(r5)
	lfd	f0, 4(r7)
	stfd	f0, 4(r5)
	lfd	f0, 8(r7)
	stfd	f0, 8(r5)
beq_cont15413:
	lwz	r5, 0(r3)
	addi	r5, r5, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else15414
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15415
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
	stw	r5, 20(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else15416
	b	beq_cont15417
beq_else15416:
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r7)
	stfd	f0, 4(r7)
	stfd	f0, 8(r7)
	lwz	r7, 28(r2)
	lwz	r8, 4(r2)
	lis	r9, lo16(min_caml_dirvecs)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_dirvecs)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_dirvecs)
	lwz	r9, 0(r9)
	slwi	r6, r6, 2
	lwzx	r6, r9, r6
	slwi	r9, r5, 2
	lwzx	r7, r7, r9
	slwi	r9, r5, 2
	lwzx	r8, r8, r9
	lis	r9, lo16(min_caml_startp_fast)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_startp_fast)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_startp_fast)
	lwz	r9, 0(r9)
	lfd	f0, 0(r8)
	stfd	f0, 0(r9)
	lfd	f0, 4(r8)
	stfd	f0, 4(r9)
	lfd	f0, 8(r8)
	stfd	f0, 8(r9)
	lis	r9, lo16(min_caml_n_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_n_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_n_objects)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	subi	r9, r9, 1
	stw	r2, 4(r3)
	stw	r8, 24(r3)
	stw	r7, 28(r3)
	stw	r6, 32(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_startp_constants2892
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 28(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15418
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont15419
ble_else15418:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray2987
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont15419:
	li	r7, 116
	lwz	r2, 32(r3)
	lwz	r5, 28(r3)
	lwz	r6, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 20(r2)
	lwz	r6, 20(r3)
	slwi	r7, r6, 2
	lwzx	r5, r5, r7
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lfd	f0, 0(r7)
	stfd	f0, 0(r5)
	lfd	f0, 4(r7)
	stfd	f0, 4(r5)
	lfd	f0, 8(r7)
	stfd	f0, 8(r5)
beq_cont15417:
	lwz	r5, 20(r3)
	addi	r5, r5, 1
	b	pretrace_diffuse_rays3041
bge_else15415:
	blr
ble_else15414:
	blr
bge_else15411:
	blr
ble_else15410:
	blr
pretrace_pixels3044:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else15424
	lis	r7, lo16(min_caml_scan_pitch)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_scan_pitch)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_scan_pitch)
	lwz	r7, 0(r7)
	lfd	f3, 0(r7)
	lis	r7, lo16(min_caml_image_center)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_image_center)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_image_center)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	sub	r7, r5, r7
	itof	f4, r7
	fmul	f3, f3, f4
	lis	r7, lo16(min_caml_ptrace_dirvec)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_ptrace_dirvec)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_ptrace_dirvec)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_screenx_dir)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_screenx_dir)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_screenx_dir)
	lwz	r8, 0(r8)
	lfd	f4, 0(r8)
	fmul	f4, f3, f4
	fadd	f4, f4, f0
	stfd	f4, 0(r7)
	lis	r7, lo16(min_caml_ptrace_dirvec)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_ptrace_dirvec)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_ptrace_dirvec)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_screenx_dir)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_screenx_dir)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_screenx_dir)
	lwz	r8, 0(r8)
	lfd	f4, 4(r8)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	stfd	f4, 4(r7)
	lis	r7, lo16(min_caml_ptrace_dirvec)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_ptrace_dirvec)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_ptrace_dirvec)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_screenx_dir)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_screenx_dir)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_screenx_dir)
	lwz	r8, 0(r8)
	lfd	f4, 8(r8)
	fmul	f3, f3, f4
	fadd	f3, f3, f2
	stfd	f3, 8(r7)
	lis	r7, lo16(min_caml_ptrace_dirvec)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_ptrace_dirvec)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_ptrace_dirvec)
	lwz	r7, 0(r7)
	li	r8, 0
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r6, 24(r3)
	stw	r2, 28(r3)
	stw	r5, 32(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecunit_sgn2672
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	stfd	f0, 4(r2)
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_startp)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_startp)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_startp)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_viewpoint)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_viewpoint)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_viewpoint)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 4(r5)
	stfd	f0, 4(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	li	r2, 0
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lis	r5, lo16(min_caml_ptrace_dirvec)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_ptrace_dirvec)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_ptrace_dirvec)
	lwz	r5, 0(r5)
	lwz	r6, 32(r3)
	slwi	r7, r6, 2
	lwz	r8, 28(r3)
	lwzx	r7, r8, r7
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	mflr	r31
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_ray2981
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	slwi	r5, r2, 2
	lwz	r6, 28(r3)
	lwzx	r5, r6, r5
	lwz	r5, 0(r5)
	lis	r7, lo16(min_caml_rgb)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_rgb)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_rgb)
	lwz	r7, 0(r7)
	lfd	f0, 0(r7)
	stfd	f0, 0(r5)
	lfd	f0, 4(r7)
	stfd	f0, 4(r5)
	lfd	f0, 8(r7)
	stfd	f0, 8(r5)
	slwi	r5, r2, 2
	lwzx	r5, r6, r5
	lwz	r5, 24(r5)
	lwz	r7, 24(r3)
	stw	r7, 0(r5)
	slwi	r5, r2, 2
	lwzx	r5, r6, r5
	lwz	r8, 8(r5)
	lwz	r8, 0(r8)
	cmpwi	cr7, r8, 0
	blt	cr7, bge_else15425
	lwz	r8, 12(r5)
	lwz	r8, 0(r8)
	stw	r5, 36(r3)
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else15427
	b	beq_cont15428
beq_else15427:
	lwz	r8, 24(r5)
	lwz	r8, 0(r8)
	lis	r9, lo16(min_caml_diffuse_ray)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_diffuse_ray)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_diffuse_ray)
	lwz	r9, 0(r9)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stfd	f0, 0(r9)
	stfd	f0, 4(r9)
	stfd	f0, 8(r9)
	lwz	r9, 28(r5)
	lwz	r10, 4(r5)
	lis	r11, lo16(min_caml_dirvecs)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_dirvecs)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_dirvecs)
	lwz	r11, 0(r11)
	slwi	r8, r8, 2
	lwzx	r8, r11, r8
	lwz	r9, 0(r9)
	lwz	r10, 0(r10)
	lis	r11, lo16(min_caml_startp_fast)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_startp_fast)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_startp_fast)
	lwz	r11, 0(r11)
	lfd	f0, 0(r10)
	stfd	f0, 0(r11)
	lfd	f0, 4(r10)
	stfd	f0, 4(r11)
	lfd	f0, 8(r10)
	stfd	f0, 8(r11)
	lis	r11, lo16(min_caml_n_objects)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_n_objects)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_n_objects)
	lwz	r11, 0(r11)
	lwz	r11, 0(r11)
	subi	r11, r11, 1
	stw	r10, 40(r3)
	stw	r9, 44(r3)
	stw	r8, 48(r3)
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_startp_constants2892
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lwz	r5, 472(r2)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lwz	r6, 44(r3)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else15429
	lwz	r5, 472(r2)
	lis	r31, lo16(l12539)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12539)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12539)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	trace_diffuse_ray2987
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	ble_cont15430
ble_else15429:
	lwz	r5, 476(r2)
	lis	r31, lo16(l12537)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12537)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12537)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	trace_diffuse_ray2987
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
ble_cont15430:
	li	r7, 116
	lwz	r2, 48(r3)
	lwz	r5, 44(r3)
	lwz	r6, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	lwz	r5, 20(r2)
	lwz	r5, 0(r5)
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	lfd	f0, 0(r6)
	stfd	f0, 0(r5)
	lfd	f0, 4(r6)
	stfd	f0, 4(r5)
	lfd	f0, 8(r6)
	stfd	f0, 8(r5)
beq_cont15428:
	li	r5, 1
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	pretrace_diffuse_rays3041
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont15426
bge_else15425:
bge_cont15426:
	lwz	r2, 32(r3)
	subi	r5, r2, 1
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else15431
	subi	r6, r2, 5
	b	bge_cont15432
bge_else15431:
	mr	r6, r2
bge_cont15432:
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 28(r3)
	b	pretrace_pixels3044
bge_else15424:
	blr
pretrace_line3051:
	lis	r7, lo16(min_caml_scan_pitch)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_scan_pitch)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_scan_pitch)
	lwz	r7, 0(r7)
	lfd	f0, 0(r7)
	lis	r7, lo16(min_caml_image_center)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_image_center)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_image_center)
	lwz	r7, 0(r7)
	lwz	r7, 4(r7)
	sub	r5, r5, r7
	itof	f1, r5
	fmul	f0, f0, f1
	lis	r5, lo16(min_caml_screeny_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screeny_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screeny_dir)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fmul	f1, f0, f1
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f2, 0(r5)
	fadd	f1, f1, f2
	lis	r5, lo16(min_caml_screeny_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screeny_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screeny_dir)
	lwz	r5, 0(r5)
	lfd	f2, 4(r5)
	fmul	f2, f0, f2
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f3, 4(r5)
	fadd	f2, f2, f3
	lis	r5, lo16(min_caml_screeny_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screeny_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screeny_dir)
	lwz	r5, 0(r5)
	lfd	f3, 8(r5)
	fmul	f0, f0, f3
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f3, 8(r5)
	fadd	f0, f0, f3
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	b	pretrace_pixels3044
scan_pixel3055:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	cmpw	cr7, r9, r2
	bgt	cr7, ble_else15434
	blr
ble_else15434:
	lis	r9, lo16(min_caml_rgb)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_rgb)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_rgb)
	lwz	r9, 0(r9)
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
	lwz	r10, 0(r10)
	lfd	f0, 0(r10)
	stfd	f0, 0(r9)
	lfd	f0, 4(r10)
	stfd	f0, 4(r9)
	lfd	f0, 8(r10)
	stfd	f0, 8(r9)
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 4(r9)
	addi	r10, r5, 1
	cmpw	cr7, r9, r10
	bgt	cr7, ble_else15436
	li	r9, 0
	b	ble_cont15437
ble_else15436:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else15438
	li	r9, 0
	b	ble_cont15439
ble_else15438:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	addi	r10, r2, 1
	cmpw	cr7, r9, r10
	bgt	cr7, ble_else15440
	li	r9, 0
	b	ble_cont15441
ble_else15440:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else15442
	li	r9, 0
	b	ble_cont15443
ble_else15442:
	li	r9, 1
ble_cont15443:
ble_cont15441:
ble_cont15439:
ble_cont15437:
	stw	r8, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r9, 0
	bne	cr7, beq_else15444
	slwi	r9, r2, 2
	lwzx	r9, r7, r9
	li	r10, 0
	lwz	r11, 8(r9)
	lwz	r11, 0(r11)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else15446
	lwz	r11, 12(r9)
	lwz	r11, 0(r11)
	stw	r9, 20(r3)
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else15448
	b	beq_cont15449
beq_else15448:
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15449:
	li	r5, 1
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	bge_cont15447
bge_else15446:
bge_cont15447:
	b	beq_cont15445
beq_else15444:
	li	r9, 0
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
	lwz	r11, 8(r10)
	lwz	r11, 0(r11)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else15450
	slwi	r11, r2, 2
	lwzx	r11, r7, r11
	lwz	r11, 8(r11)
	lwz	r11, 0(r11)
	slwi	r12, r2, 2
	lwzx	r12, r6, r12
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15452
	slwi	r12, r2, 2
	lwzx	r12, r8, r12
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15454
	subi	r12, r2, 1
	slwi	r12, r12, 2
	lwzx	r12, r7, r12
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15456
	addi	r12, r2, 1
	slwi	r12, r12, 2
	lwzx	r12, r7, r12
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else15458
	li	r11, 1
	b	beq_cont15459
beq_else15458:
	li	r11, 0
beq_cont15459:
	b	beq_cont15457
beq_else15456:
	li	r11, 0
beq_cont15457:
	b	beq_cont15455
beq_else15454:
	li	r11, 0
beq_cont15455:
	b	beq_cont15453
beq_else15452:
	li	r11, 0
beq_cont15453:
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else15460
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
	mflr	r31
	mr	r5, r9
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont15461
beq_else15460:
	lwz	r10, 12(r10)
	lwz	r10, 0(r10)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else15462
	b	beq_cont15463
beq_else15462:
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	mr	r7, r8
	mr	r8, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15463:
	li	r9, 1
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	lwz	r7, 12(r3)
	lwz	r8, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	try_exploit_neighbors3028
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15461:
	b	bge_cont15451
bge_else15450:
bge_cont15451:
beq_cont15445:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15464
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15466
	b	bge_cont15467
bge_else15466:
	li	r2, 0
bge_cont15467:
	b	ble_cont15465
ble_else15464:
	li	r2, 255
ble_cont15465:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 4(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15468
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15470
	b	bge_cont15471
bge_else15470:
	li	r2, 0
bge_cont15471:
	b	ble_cont15469
ble_else15468:
	li	r2, 255
ble_cont15469:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 8(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else15472
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15474
	b	bge_cont15475
bge_else15474:
	li	r2, 0
bge_cont15475:
	b	ble_cont15473
ble_else15472:
	li	r2, 255
ble_cont15473:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	cmpw	cr7, r5, r2
	bgt	cr7, ble_else15476
	blr
ble_else15476:
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwz	r7, 12(r3)
	lwzx	r6, r7, r6
	lwz	r6, 0(r6)
	lfd	f0, 0(r6)
	stfd	f0, 0(r5)
	lfd	f0, 4(r6)
	stfd	f0, 4(r5)
	lfd	f0, 8(r6)
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	lwz	r6, 8(r3)
	addi	r8, r6, 1
	cmpw	cr7, r5, r8
	bgt	cr7, ble_else15478
	li	r5, 0
	b	ble_cont15479
ble_else15478:
	cmpwi	cr7, r6, 0
	bgt	cr7, ble_else15480
	li	r5, 0
	b	ble_cont15481
ble_else15480:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	addi	r8, r2, 1
	cmpw	cr7, r5, r8
	bgt	cr7, ble_else15482
	li	r5, 0
	b	ble_cont15483
ble_else15482:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else15484
	li	r5, 0
	b	ble_cont15485
ble_else15484:
	li	r5, 1
ble_cont15485:
ble_cont15483:
ble_cont15481:
ble_cont15479:
	stw	r2, 24(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else15486
	slwi	r5, r2, 2
	lwzx	r5, r7, r5
	li	r8, 0
	mflr	r31
	mr	r2, r5
	mr	r5, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont15487
beq_else15486:
	li	r9, 0
	lwz	r5, 4(r3)
	lwz	r8, 0(r3)
	mflr	r31
	mr	r29, r6
	mr	r6, r5
	mr	r5, r29
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	try_exploit_neighbors3028
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15487:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	write_rgb3039
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	lwz	r7, 12(r3)
	lwz	r8, 0(r3)
	b	scan_pixel3055
scan_line3061:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 4(r9)
	cmpw	cr7, r9, r2
	bgt	cr7, ble_else15488
	blr
ble_else15488:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 4(r9)
	subi	r9, r9, 1
	stw	r8, 0(r3)
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	stw	r2, 12(r3)
	stw	r6, 16(r3)
	cmpw	cr7, r9, r2
	bgt	cr7, ble_else15490
	b	ble_cont15491
ble_else15490:
	addi	r9, r2, 1
	mflr	r31
	mr	r6, r8
	mr	r5, r9
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	pretrace_line3051
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont15491:
	li	r2, 0
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else15492
	b	ble_cont15493
ble_else15492:
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lwz	r7, 16(r3)
	lwz	r6, 0(r7)
	lwz	r6, 0(r6)
	lfd	f0, 0(r6)
	stfd	f0, 0(r5)
	lfd	f0, 4(r6)
	stfd	f0, 4(r5)
	lfd	f0, 8(r6)
	stfd	f0, 8(r5)
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	lwz	r6, 12(r3)
	addi	r8, r6, 1
	cmpw	cr7, r5, r8
	bgt	cr7, ble_else15494
	li	r5, 0
	b	ble_cont15495
ble_else15494:
	cmpwi	cr7, r6, 0
	bgt	cr7, ble_else15496
	li	r5, 0
	b	ble_cont15497
ble_else15496:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	cmpwi	cr7, r5, 1
	bgt	cr7, ble_else15498
	li	r5, 0
	b	ble_cont15499
ble_else15498:
	li	r5, 0
ble_cont15499:
ble_cont15497:
ble_cont15495:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else15500
	lwz	r2, 0(r7)
	li	r5, 0
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	do_without_neighbors3012
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont15501
beq_else15500:
	li	r9, 0
	lwz	r5, 8(r3)
	lwz	r8, 4(r3)
	mflr	r31
	mr	r29, r6
	mr	r6, r5
	mr	r5, r29
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	try_exploit_neighbors3028
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont15501:
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	write_rgb3039
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 1
	lwz	r5, 12(r3)
	lwz	r6, 8(r3)
	lwz	r7, 16(r3)
	lwz	r8, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	scan_pixel3055
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont15493:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	addi	r2, r2, 2
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else15502
	subi	r6, r2, 5
	b	bge_cont15503
bge_else15502:
	mr	r6, r2
bge_cont15503:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	cmpw	cr7, r2, r5
	bgt	cr7, ble_else15504
	blr
ble_else15504:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	subi	r2, r2, 1
	stw	r6, 20(r3)
	stw	r5, 24(r3)
	cmpw	cr7, r2, r5
	bgt	cr7, ble_else15506
	b	ble_cont15507
ble_else15506:
	addi	r2, r5, 1
	lwz	r7, 8(r3)
	mflr	r31
	mr	r5, r2
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	pretrace_line3051
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont15507:
	li	r2, 0
	lwz	r5, 24(r3)
	lwz	r6, 16(r3)
	lwz	r7, 4(r3)
	lwz	r8, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	scan_pixel3055
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	lwz	r5, 20(r3)
	addi	r5, r5, 2
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else15508
	subi	r8, r5, 5
	b	bge_cont15509
bge_else15508:
	mr	r8, r5
bge_cont15509:
	lwz	r5, 4(r3)
	lwz	r6, 8(r3)
	lwz	r7, 16(r3)
	b	scan_line3061
create_pixel3069:
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	li	r2, 5
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 4(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 16(r5)
	li	r2, 5
	li	r6, 0
	mflr	r31
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
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 16(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	stw	r2, 16(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	stw	r2, 16(r5)
	li	r2, 1
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 24(r3)
	stw	r5, 24(r2)
	lwz	r5, 20(r3)
	stw	r5, 20(r2)
	lwz	r5, 16(r3)
	stw	r5, 16(r2)
	lwz	r5, 12(r3)
	stw	r5, 12(r2)
	lwz	r5, 8(r3)
	stw	r5, 8(r2)
	lwz	r5, 4(r3)
	stw	r5, 4(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
init_line_elements3071:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else15510
	li	r6, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 12(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r2, 16(r5)
	li	r2, 5
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 5
	li	r6, 0
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 24(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	stw	r2, 16(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 16(r5)
	li	r2, 1
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
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
	lwz	r5, 36(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 36(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 36(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 36(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 32(r3)
	stw	r5, 24(r2)
	lwz	r5, 28(r3)
	stw	r5, 20(r2)
	lwz	r5, 24(r3)
	stw	r5, 16(r2)
	lwz	r5, 20(r3)
	stw	r5, 12(r2)
	lwz	r5, 16(r3)
	stw	r5, 8(r2)
	lwz	r5, 12(r3)
	stw	r5, 4(r2)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15511
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	create_pixel3069
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3071
bge_else15511:
	mr	r2, r7
	blr
bge_else15510:
	blr
calc_dirvec3081:
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else15512
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f2, f2, f3
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f3, 0(r31)
	fadd	f2, f2, f3
	fsqrt	f2, f2
	fdiv	f0, f0, f2
	fdiv	f1, f1, f2
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f3, 0(r31)
	fdiv	f2, f3, f2
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	slwi	r5, r6, 2
	lwzx	r5, r2, r5
	lwz	r5, 0(r5)
	stfd	f0, 0(r5)
	stfd	f1, 4(r5)
	stfd	f2, 8(r5)
	addi	r5, r6, 40
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r5, 0(r5)
	fneg	f3, f1
	stfd	f0, 0(r5)
	stfd	f2, 4(r5)
	stfd	f3, 8(r5)
	addi	r5, r6, 80
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f1
	stfd	f2, 0(r5)
	stfd	f3, 4(r5)
	stfd	f4, 8(r5)
	addi	r5, r6, 1
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f1
	fneg	f5, f2
	stfd	f3, 0(r5)
	stfd	f4, 4(r5)
	stfd	f5, 8(r5)
	addi	r5, r6, 41
	slwi	r5, r5, 2
	lwzx	r5, r2, r5
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f2
	stfd	f3, 0(r5)
	stfd	f4, 4(r5)
	stfd	f1, 8(r5)
	addi	r5, r6, 81
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	lwz	r2, 0(r2)
	fneg	f2, f2
	stfd	f2, 0(r2)
	stfd	f0, 4(r2)
	stfd	f1, 8(r2)
	blr
bge_else15512:
	fmul	f0, f1, f1
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f1, 0(r31)
	fdiv	f1, f1, f0
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stfd	f3, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	stfd	f2, 32(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_atan
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f0, f1
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_sin
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	stfd	f0, 48(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_cos
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fdiv	f0, f1, f0
	lfd	f1, 24(r3)
	fmul	f0, f0, f1
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	fmul	f1, f0, f0
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f2, 0(r31)
	fadd	f1, f1, f2
	fsqrt	f1, f1
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f2, 0(r31)
	fdiv	f2, f2, f1
	stfd	f0, 56(r3)
	stw	r2, 64(r3)
	stfd	f1, 72(r3)
	mflr	r31
	fmr	f0, f2
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_atan
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fmul	f0, f0, f1
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_sin
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	stfd	f0, 88(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_cos
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fdiv	f0, f1, f0
	lfd	f1, 72(r3)
	fmul	f1, f0, f1
	lfd	f0, 56(r3)
	lfd	f2, 32(r3)
	lfd	f3, 8(r3)
	lwz	r2, 64(r3)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	calc_dirvec3081
calc_dirvecs3089:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15516
	itof	f1, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l13081)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13081)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13081)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r7, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f3, 0(r31)
	stfd	f0, 0(r3)
	stw	r5, 8(r3)
	stw	r6, 12(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r7
	fmr	f31, f3
	fmr	f3, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	calc_dirvec3081
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	lwz	r6, 12(r3)
	addi	r7, r6, 2
	lfd	f3, 0(r3)
	lwz	r8, 8(r3)
	mflr	r31
	mr	r6, r7
	mr	r2, r5
	mr	r5, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	calc_dirvec3081
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	subi	r2, r2, 1
	lwz	r5, 8(r3)
	addi	r5, r5, 1
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else15517
	subi	r5, r5, 5
	b	bge_cont15518
bge_else15517:
bge_cont15518:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15519
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l13081)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13081)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13081)
	lfd	f1, 0(r31)
	fsub	f2, f0, f1
	li	r6, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	lfd	f3, 0(r3)
	lwz	r7, 12(r3)
	stw	r5, 20(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_dirvec3081
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	lwz	r6, 12(r3)
	addi	r7, r6, 2
	lfd	f3, 0(r3)
	lwz	r8, 20(r3)
	mflr	r31
	mr	r6, r7
	mr	r2, r5
	mr	r5, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_dirvec3081
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	subi	r2, r2, 1
	lwz	r5, 20(r3)
	addi	r5, r5, 1
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else15520
	subi	r5, r5, 5
	b	bge_cont15521
bge_else15520:
bge_cont15521:
	lfd	f0, 0(r3)
	lwz	r6, 12(r3)
	b	calc_dirvecs3089
bge_else15519:
	blr
bge_else15516:
	blr
calc_dirvec_rows3094:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15524
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l13081)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13081)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13081)
	lfd	f1, 0(r31)
	fsub	f3, f0, f1
	li	r7, 4
	itof	f0, r7
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l13081)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13081)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13081)
	lfd	f1, 0(r31)
	fsub	f2, f0, f1
	li	r8, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	stw	r2, 0(r3)
	stfd	f3, 8(r3)
	stw	r5, 16(r3)
	stw	r6, 20(r3)
	stw	r7, 24(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_dirvec3081
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l12477)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l12477)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l12477)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r2, 0
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f1, 0(r31)
	lwz	r5, 20(r3)
	addi	r6, r5, 2
	lfd	f3, 8(r3)
	lwz	r7, 16(r3)
	mflr	r31
	mr	r5, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_dirvec3081
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 3
	lwz	r5, 16(r3)
	addi	r6, r5, 1
	cmpwi	cr7, r6, 5
	blt	cr7, bge_else15526
	subi	r6, r6, 5
	b	bge_cont15527
bge_else15526:
bge_cont15527:
	lfd	f0, 8(r3)
	lwz	r7, 20(r3)
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_dirvecs3089
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	lwz	r5, 16(r3)
	addi	r5, r5, 2
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else15528
	subi	r5, r5, 5
	b	bge_cont15529
bge_else15528:
bge_cont15529:
	lwz	r6, 20(r3)
	addi	r6, r6, 4
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15530
	itof	f0, r2
	lis	r31, lo16(l13080)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13080)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13080)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l13081)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13081)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13081)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	li	r7, 4
	stw	r6, 28(r3)
	stw	r5, 32(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	calc_dirvecs3089
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	subi	r2, r2, 1
	lwz	r5, 32(r3)
	addi	r5, r5, 2
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else15531
	subi	r5, r5, 5
	b	bge_cont15532
bge_else15531:
bge_cont15532:
	lwz	r6, 28(r3)
	addi	r6, r6, 4
	b	calc_dirvec_rows3094
bge_else15530:
	blr
bge_else15524:
	blr
create_dirvec_elements3100:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else15535
	li	r6, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 8(r3)
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
	lwz	r2, 8(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15536
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 16(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15537
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 24(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15538
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 32(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 28(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	create_dirvec_elements3100
bge_else15538:
	blr
bge_else15537:
	blr
bge_else15536:
	blr
bge_else15535:
	blr
create_dirvecs3103:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15543
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 12(r3)
	stw	r2, 0(r5)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	stwx	r2, r7, r6
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	li	r6, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_float_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 20(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 24(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 28(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 464(r5)
	li	r2, 115
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	create_dirvec_elements3100
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15544
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r5, 32(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 40(r3)
	stw	r2, 0(r5)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 36(r3)
	slwi	r6, r5, 2
	lwz	r7, 32(r3)
	stwx	r2, r7, r6
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	li	r6, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 48(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 48(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 44(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 52(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 52(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 44(r3)
	stw	r2, 468(r5)
	li	r2, 116
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	create_dirvec_elements3100
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	subi	r2, r2, 1
	b	create_dirvecs3103
bge_else15544:
	blr
bge_else15543:
	blr
init_dirvec_constants3105:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else15547
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15548
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 8(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15549
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r5)
	lwz	r10, 0(r5)
	lwz	r11, 4(r8)
	stw	r5, 12(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15551
	stw	r9, 16(r3)
	stw	r7, 20(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_rect_table2878
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont15552
beq_else15551:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15553
	stw	r9, 16(r3)
	stw	r7, 20(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_surface_table2881
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
	b	beq_cont15554
beq_else15553:
	stw	r9, 16(r3)
	stw	r7, 20(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_second_table2884
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	stwx	r2, r7, r6
beq_cont15554:
beq_cont15552:
	subi	r5, r5, 1
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	bge_cont15550
bge_else15549:
bge_cont15550:
	lwz	r2, 8(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15555
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15556
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	lwzx	r5, r6, r5
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 28(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15557
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r5)
	lwz	r10, 0(r5)
	lwz	r11, 4(r8)
	stw	r5, 32(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15559
	stw	r9, 36(r3)
	stw	r7, 40(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_rect_table2878
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 36(r3)
	stwx	r2, r7, r6
	b	beq_cont15560
beq_else15559:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15561
	stw	r9, 36(r3)
	stw	r7, 40(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_surface_table2881
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 36(r3)
	stwx	r2, r7, r6
	b	beq_cont15562
beq_else15561:
	stw	r9, 36(r3)
	stw	r7, 40(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_second_table2884
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 36(r3)
	stwx	r2, r7, r6
beq_cont15562:
beq_cont15560:
	subi	r5, r5, 1
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	bge_cont15558
bge_else15557:
bge_cont15558:
	lwz	r2, 28(r3)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	b	init_dirvec_constants3105
bge_else15556:
	blr
bge_else15555:
	blr
bge_else15548:
	blr
bge_else15547:
	blr
init_vecset_constants3108:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15567
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 476(r5)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15568
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r6)
	lwz	r10, 0(r6)
	lwz	r11, 4(r8)
	stw	r6, 8(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15570
	stw	r9, 12(r3)
	stw	r7, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_rect_table2878
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
	b	beq_cont15571
beq_else15570:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15572
	stw	r9, 12(r3)
	stw	r7, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_surface_table2881
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
	b	beq_cont15573
beq_else15572:
	stw	r9, 12(r3)
	stw	r7, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_second_table2884
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	stwx	r2, r7, r6
beq_cont15573:
beq_cont15571:
	subi	r5, r5, 1
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	bge_cont15569
bge_else15568:
bge_cont15569:
	lwz	r2, 4(r3)
	lwz	r5, 472(r2)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 468(r2)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15574
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r8, r6, 2
	lwzx	r7, r7, r8
	lwz	r8, 4(r5)
	lwz	r9, 0(r5)
	lwz	r10, 4(r7)
	stw	r5, 20(r3)
	cmpwi	cr7, r10, 1
	bne	cr7, beq_else15576
	stw	r8, 24(r3)
	stw	r6, 28(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_rect_table2878
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	stwx	r2, r7, r6
	b	beq_cont15577
beq_else15576:
	cmpwi	cr7, r10, 2
	bne	cr7, beq_else15578
	stw	r8, 24(r3)
	stw	r6, 28(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_surface_table2881
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	stwx	r2, r7, r6
	b	beq_cont15579
beq_else15578:
	stw	r8, 24(r3)
	stw	r6, 28(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_second_table2884
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	stwx	r2, r7, r6
beq_cont15579:
beq_cont15577:
	subi	r5, r5, 1
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	bge_cont15575
bge_else15574:
bge_cont15575:
	li	r5, 116
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	init_dirvec_constants3105
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15580
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 476(r5)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 32(r3)
	stw	r5, 36(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	lwz	r5, 472(r2)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15581
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r8, r6, 2
	lwzx	r7, r7, r8
	lwz	r8, 4(r5)
	lwz	r9, 0(r5)
	lwz	r10, 4(r7)
	stw	r5, 40(r3)
	cmpwi	cr7, r10, 1
	bne	cr7, beq_else15583
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_rect_table2878
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
	b	beq_cont15584
beq_else15583:
	cmpwi	cr7, r10, 2
	bne	cr7, beq_else15585
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_surface_table2881
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
	b	beq_cont15586
beq_else15585:
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_second_table2884
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
beq_cont15586:
beq_cont15584:
	subi	r5, r5, 1
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont15582
bge_else15581:
bge_cont15582:
	li	r5, 117
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_dirvec_constants3105
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15587
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 476(r5)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 52(r3)
	stw	r5, 56(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15588
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r6)
	lwz	r10, 0(r6)
	lwz	r11, 4(r8)
	stw	r6, 60(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else15590
	stw	r9, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_rect_table2878
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
	b	beq_cont15591
beq_else15590:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else15592
	stw	r9, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_surface_table2881
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
	b	beq_cont15593
beq_else15592:
	stw	r9, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_second_table2884
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
beq_cont15593:
beq_cont15591:
	subi	r5, r5, 1
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	bge_cont15589
bge_else15588:
bge_cont15589:
	li	r5, 118
	lwz	r2, 56(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	init_dirvec_constants3105
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15594
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	li	r6, 119
	stw	r2, 72(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	init_dirvec_constants3105
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 72(r3)
	subi	r2, r2, 1
	b	init_vecset_constants3108
bge_else15594:
	blr
bge_else15587:
	blr
bge_else15580:
	blr
bge_else15567:
	blr
setup_rect_reflection3119:
	slwi	r2, r2, 2
	lis	r6, lo16(min_caml_n_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_reflections)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lwz	r5, 28(r5)
	lfd	f1, 0(r5)
	fsub	f0, f0, f1
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fneg	f1, f1
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f2, 4(r5)
	fneg	f2, f2
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f3, 8(r5)
	fneg	f3, f3
	addi	r5, r2, 1
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lfd	f4, 0(r7)
	li	r7, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f5, 0(r31)
	stfd	f1, 0(r3)
	stw	r2, 8(r3)
	stw	r6, 12(r3)
	stw	r5, 16(r3)
	stfd	f0, 24(r3)
	stfd	f3, 32(r3)
	stfd	f2, 40(r3)
	stfd	f4, 48(r3)
	mflr	r31
	mr	r2, r7
	fmr	f0, f5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 56(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r6, 56(r3)
	stw	r6, 0(r5)
	lfd	f0, 48(r3)
	stfd	f0, 0(r6)
	lfd	f0, 40(r3)
	stfd	f0, 4(r6)
	lfd	f1, 32(r3)
	stfd	f1, 8(r6)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r5, 60(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15600
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15602
	stw	r2, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_rect_table2878
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
	b	beq_cont15603
beq_else15602:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15604
	stw	r2, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_surface_table2881
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
	b	beq_cont15605
beq_else15604:
	stw	r2, 64(r3)
	stw	r7, 68(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_second_table2884
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	stwx	r2, r7, r6
beq_cont15605:
beq_cont15603:
	subi	r5, r5, 1
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	bge_cont15601
bge_else15600:
bge_cont15601:
	lis	r2, lo16(min_caml_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_reflections)
	lwz	r2, 0(r2)
	mr	r5, r4
	addi	r4, r4, 16
	lfd	f0, 24(r3)
	stfd	f0, 8(r5)
	lwz	r6, 60(r3)
	stw	r6, 4(r5)
	lwz	r6, 16(r3)
	stw	r6, 0(r5)
	lwz	r6, 12(r3)
	slwi	r7, r6, 2
	stwx	r5, r2, r7
	addi	r2, r6, 1
	lwz	r5, 8(r3)
	addi	r7, r5, 2
	lis	r8, lo16(min_caml_light)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_light)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_light)
	lwz	r8, 0(r8)
	lfd	f1, 4(r8)
	li	r8, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	stw	r2, 72(r3)
	stw	r7, 76(r3)
	stfd	f1, 80(r3)
	mflr	r31
	mr	r2, r8
	fmr	f0, f2
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 88(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r6, 88(r3)
	stw	r6, 0(r5)
	lfd	f0, 0(r3)
	stfd	f0, 0(r6)
	lfd	f1, 80(r3)
	stfd	f1, 4(r6)
	lfd	f1, 32(r3)
	stfd	f1, 8(r6)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r5, 92(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15606
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15608
	stw	r2, 96(r3)
	stw	r7, 100(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	setup_rect_table2878
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r5, 100(r3)
	slwi	r6, r5, 2
	lwz	r7, 96(r3)
	stwx	r2, r7, r6
	b	beq_cont15609
beq_else15608:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15610
	stw	r2, 96(r3)
	stw	r7, 100(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	setup_surface_table2881
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r5, 100(r3)
	slwi	r6, r5, 2
	lwz	r7, 96(r3)
	stwx	r2, r7, r6
	b	beq_cont15611
beq_else15610:
	stw	r2, 96(r3)
	stw	r7, 100(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	setup_second_table2884
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r5, 100(r3)
	slwi	r6, r5, 2
	lwz	r7, 96(r3)
	stwx	r2, r7, r6
beq_cont15611:
beq_cont15609:
	subi	r5, r5, 1
	lwz	r2, 92(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	bge_cont15607
bge_else15606:
bge_cont15607:
	lis	r2, lo16(min_caml_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_reflections)
	lwz	r2, 0(r2)
	mr	r5, r4
	addi	r4, r4, 16
	lfd	f0, 24(r3)
	stfd	f0, 8(r5)
	lwz	r6, 92(r3)
	stw	r6, 4(r5)
	lwz	r6, 76(r3)
	stw	r6, 0(r5)
	lwz	r6, 72(r3)
	slwi	r6, r6, 2
	stwx	r5, r2, r6
	lwz	r2, 12(r3)
	addi	r5, r2, 2
	lwz	r6, 8(r3)
	addi	r6, r6, 3
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lfd	f1, 8(r7)
	li	r7, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f2, 0(r31)
	stw	r5, 104(r3)
	stw	r6, 108(r3)
	stfd	f1, 112(r3)
	mflr	r31
	mr	r2, r7
	fmr	f0, f2
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 120(r3)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r6, 120(r3)
	stw	r6, 0(r5)
	lfd	f0, 0(r3)
	stfd	f0, 0(r6)
	lfd	f0, 40(r3)
	stfd	f0, 4(r6)
	lfd	f0, 112(r3)
	stfd	f0, 8(r6)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r5, 124(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15612
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15614
	stw	r2, 128(r3)
	stw	r7, 132(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	setup_rect_table2878
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	slwi	r6, r5, 2
	lwz	r7, 128(r3)
	stwx	r2, r7, r6
	b	beq_cont15615
beq_else15614:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15616
	stw	r2, 128(r3)
	stw	r7, 132(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	setup_surface_table2881
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	slwi	r6, r5, 2
	lwz	r7, 128(r3)
	stwx	r2, r7, r6
	b	beq_cont15617
beq_else15616:
	stw	r2, 128(r3)
	stw	r7, 132(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	setup_second_table2884
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	slwi	r6, r5, 2
	lwz	r7, 128(r3)
	stwx	r2, r7, r6
beq_cont15617:
beq_cont15615:
	subi	r5, r5, 1
	lwz	r2, 124(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	b	bge_cont15613
bge_else15612:
bge_cont15613:
	lis	r2, lo16(min_caml_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_reflections)
	lwz	r2, 0(r2)
	mr	r5, r4
	addi	r4, r4, 16
	lfd	f0, 24(r3)
	stfd	f0, 8(r5)
	lwz	r6, 124(r3)
	stw	r6, 4(r5)
	lwz	r6, 108(r3)
	stw	r6, 0(r5)
	lwz	r6, 104(r3)
	slwi	r6, r6, 2
	stwx	r5, r2, r6
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	addi	r5, r5, 3
	stw	r5, 0(r2)
	blr
setup_surface_reflection3122:
	slwi	r2, r2, 2
	addi	r2, r2, 1
	lis	r6, lo16(min_caml_n_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_reflections)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lwz	r7, 28(r5)
	lfd	f1, 0(r7)
	fsub	f0, f0, f1
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lwz	r8, 16(r5)
	lfd	f1, 0(r7)
	lfd	f2, 0(r8)
	fmul	f1, f1, f2
	lfd	f2, 4(r7)
	lfd	f3, 4(r8)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lfd	f2, 8(r7)
	lfd	f3, 8(r8)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
	lfd	f2, 0(r31)
	lwz	r7, 16(r5)
	lfd	f3, 0(r7)
	fmul	f2, f2, f3
	fmul	f2, f2, f1
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lfd	f3, 0(r7)
	fsub	f2, f2, f3
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
	lfd	f3, 0(r31)
	lwz	r7, 16(r5)
	lfd	f4, 4(r7)
	fmul	f3, f3, f4
	fmul	f3, f3, f1
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lfd	f4, 4(r7)
	fsub	f3, f3, f4
	lis	r31, lo16(l11737)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11737)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11737)
	lfd	f4, 0(r31)
	lwz	r5, 16(r5)
	lfd	f5, 8(r5)
	fmul	f4, f4, f5
	fmul	f1, f4, f1
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f4, 8(r5)
	fsub	f1, f1, f4
	li	r5, 3
	lis	r31, lo16(l11688)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11688)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11688)
	lfd	f4, 0(r31)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stfd	f0, 8(r3)
	stfd	f1, 16(r3)
	stfd	f3, 24(r3)
	stfd	f2, 32(r3)
	mflr	r31
	mr	r2, r5
	fmr	f0, f4
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r6, 40(r3)
	stw	r6, 0(r5)
	lfd	f0, 32(r3)
	stfd	f0, 0(r6)
	lfd	f0, 24(r3)
	stfd	f0, 4(r6)
	lfd	f0, 16(r3)
	stfd	f0, 8(r6)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r5, 44(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else15619
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	lwzx	r8, r8, r9
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else15621
	stw	r2, 48(r3)
	stw	r7, 52(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	setup_rect_table2878
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 48(r3)
	stwx	r2, r7, r6
	b	beq_cont15622
beq_else15621:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else15623
	stw	r2, 48(r3)
	stw	r7, 52(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	setup_surface_table2881
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 48(r3)
	stwx	r2, r7, r6
	b	beq_cont15624
beq_else15623:
	stw	r2, 48(r3)
	stw	r7, 52(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	setup_second_table2884
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 48(r3)
	stwx	r2, r7, r6
beq_cont15624:
beq_cont15622:
	subi	r5, r5, 1
	lwz	r2, 44(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	bge_cont15620
bge_else15619:
bge_cont15620:
	lis	r2, lo16(min_caml_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_reflections)
	lwz	r2, 0(r2)
	mr	r5, r4
	addi	r4, r4, 16
	lfd	f0, 8(r3)
	stfd	f0, 8(r5)
	lwz	r6, 44(r3)
	stw	r6, 4(r5)
	lwz	r6, 4(r3)
	stw	r6, 0(r5)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	stwx	r5, r2, r7
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	addi	r5, r6, 1
	stw	r5, 0(r2)
	blr
rt3127:
	lis	r6, lo16(min_caml_image_size)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_size)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_size)
	lwz	r6, 0(r6)
	stw	r2, 0(r6)
	lis	r6, lo16(min_caml_image_size)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_size)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_size)
	lwz	r6, 0(r6)
	stw	r5, 4(r6)
	lis	r6, lo16(min_caml_image_center)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_center)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_center)
	lwz	r6, 0(r6)
	srwi	r7, r2, 1
	stw	r7, 0(r6)
	lis	r6, lo16(min_caml_image_center)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_center)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_center)
	lwz	r6, 0(r6)
	srwi	r5, r5, 1
	stw	r5, 4(r6)
	lis	r5, lo16(min_caml_scan_pitch)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_scan_pitch)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_scan_pitch)
	lwz	r5, 0(r5)
	lis	r31, lo16(l13283)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l13283)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l13283)
	lfd	f0, 0(r31)
	itof	f1, r2
	fdiv	f0, f0, f1
	stfd	f0, 0(r5)
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixel3069
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	init_line_elements3071
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	stw	r2, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel3069
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	init_line_elements3071
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	stw	r2, 12(r3)
	stw	r5, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_pixel3069
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
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	init_line_elements3071
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_screen_settings2773
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_light2775
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 0
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_nth_object2780
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else15626
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 24(r3)
	stw	r5, 0(r2)
	b	beq_cont15627
beq_else15626:
	li	r2, 1
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_object2782
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont15627:
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else15628
	li	r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont15629
beq_else15628:
	li	r5, 1
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r5, 0(r2)
beq_cont15629:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15630
	b	beq_cont15631
beq_else15630:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	stw	r2, 0(r5)
	li	r2, 0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else15632
	b	beq_cont15633
beq_else15632:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	stw	r2, 4(r5)
	li	r2, 2
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_and_network2790
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont15633:
beq_cont15631:
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	li	r5, 0
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_or_network2788
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	stw	r2, 0(r5)
	li	r2, 80
	out	r2
	li	r2, 51
	out	r2
	li	r2, 10
	out	r2
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	li	r2, 255
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	li	r2, 4
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	create_dirvecs3103
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 9
	li	r5, 0
	li	r6, 0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	calc_dirvec_rows3094
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	lwz	r5, 476(r2)
	lis	r6, lo16(min_caml_n_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_n_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_n_objects)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	subi	r6, r6, 1
	stw	r2, 36(r3)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else15634
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r8, r6, 2
	lwzx	r7, r7, r8
	lwz	r8, 4(r5)
	lwz	r9, 0(r5)
	lwz	r10, 4(r7)
	stw	r5, 40(r3)
	cmpwi	cr7, r10, 1
	bne	cr7, beq_else15636
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_rect_table2878
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
	b	beq_cont15637
beq_else15636:
	cmpwi	cr7, r10, 2
	bne	cr7, beq_else15638
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_surface_table2881
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
	b	beq_cont15639
beq_else15638:
	stw	r8, 44(r3)
	stw	r6, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_second_table2884
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 44(r3)
	stwx	r2, r7, r6
beq_cont15639:
beq_cont15637:
	subi	r5, r5, 1
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont15635
bge_else15634:
bge_cont15635:
	li	r5, 118
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_dirvec_constants3105
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 12(r2)
	li	r5, 119
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_dirvec_constants3105
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_vecset_constants3108
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light_dirvec)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light_dirvec)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light_dirvec)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 4(r5)
	stfd	f0, 4(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_light_dirvec)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light_dirvec)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light_dirvec)
	lwz	r2, 0(r2)
	lis	r5, lo16(min_caml_n_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_n_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_n_objects)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else15640
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
	lwz	r6, 8(r5)
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else15642
	lis	r31, lo16(l11690)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l11690)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l11690)
	lfd	f0, 0(r31)
	lwz	r6, 28(r5)
	lfd	f1, 0(r6)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else15644
	b	ble_cont15645
ble_else15644:
	lwz	r6, 4(r5)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else15646
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_rect_reflection3119
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont15647
beq_else15646:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else15648
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	setup_surface_reflection3122
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont15649
beq_else15648:
beq_cont15649:
beq_cont15647:
ble_cont15645:
	b	beq_cont15643
beq_else15642:
beq_cont15643:
	b	bge_cont15641
bge_else15640:
bge_cont15641:
	li	r5, 0
	li	r6, 0
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	pretrace_line3051
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r5, 0
	li	r6, 2
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else15650
	blr
ble_else15650:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	subi	r2, r2, 1
	stw	r5, 52(r3)
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else15652
	b	ble_cont15653
ble_else15652:
	li	r2, 1
	lwz	r7, 20(r3)
	mflr	r31
	mr	r5, r2
	mr	r2, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	pretrace_line3051
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
ble_cont15653:
	li	r2, 0
	lwz	r5, 52(r3)
	lwz	r6, 4(r3)
	lwz	r7, 12(r3)
	lwz	r8, 20(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	scan_pixel3055
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r2, 1
	li	r8, 4
	lwz	r5, 12(r3)
	lwz	r6, 20(r3)
	lwz	r7, 4(r3)
	b	scan_line3061
min_caml_fin: