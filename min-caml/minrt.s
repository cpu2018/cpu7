	.data
min_caml_n_objects:
	120000
min_caml_objects:
	120004
min_caml_screen:
	122644
min_caml_viewpoint:
	122656
min_caml_light:
	122668
min_caml_beam:
	122680
min_caml_and_net:
	122684
min_caml_or_net:
	122884
min_caml_solver_dist:
	122888
min_caml_intsec_rectside:
	122892
min_caml_tmin:
	122896
min_caml_intersection_point:
	122900
min_caml_intersected_object_id:
	122912
min_caml_nvector:
	122916
min_caml_texture_color:
	122928
min_caml_diffuse_ray:
	122940
min_caml_rgb:
	122952
min_caml_image_size:
	122964
min_caml_image_center:
	122972
min_caml_scan_pitch:
	122980
min_caml_startp:
	122984
min_caml_startp_fast:
	122996
min_caml_screenx_dir:
	123008
min_caml_screeny_dir:
	123020
min_caml_screenz_dir:
	123032
min_caml_ptrace_dirvec:
	123044
min_caml_dirvecs:
	123056
min_caml_light_dirvec:
	123096
min_caml_reflections:
	123600
min_caml_n_reflections:
	126480
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
	1041385765
latan91:
	1045220557
latan90:
	1051372202
l6201:
	1124073472
l6168:
	1063675494
l6167:
	1045220557
l6073:
	1125515264
l6071:
	-1021968384
l6055:
	1036831949
l6052:
	-1073741824
l6050:
	998244352
l6028:
	1101004800
l6027:
	1028443341
l6022:
	1048576000
l6018:
	1092616192
l6014:
	1050253722
l6013:
	1132396544
l6012:
	1041865114
l6010:
	1078530011
l6009:
	1106247680
l6008:
	1097859072
l6007:
	953267991
l5964:
	1287568416
l5960:
	1315859240
l5940:
	-1110651699
l5927:
	1008981770
l5926:
	-1102263091
l5776:
	1056964608
l5718:
	1073741824
l5684:
	-1018691584
l5682:
	1128792064
l5678:
	1016003125
l5592:
	-1082130432
l5591:
	1065353216
l5590:
	0
	.globl _min_caml_start
_min_caml_start:
	li	r3, 30000
	addi	r3, r3, 30000
	addi	r3, r3, 30000
	addi	r3, r3, 30000
	addi	r3, r3, 10000
	li	r4, 30000
	addi	r4, r4, 30000
	addi	r4, r4, 30000
	addi	r4, r4, 30000
	addi	r4, r4, 11000
	li	r2, 30000
	addi	r2, r2, 30000
	addi	r2, r2, 30000
	addi	r2, r2, 10000
	addi	r2, r2, 23096
	li	r5, 30000
	addi	r5, r5, 30000
	addi	r5, r5, 30000
	addi	r5, r5, 10000
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
xor2643:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7344
	mr	r2, r5
	blr
beq_else7344:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7345
	li	r2, 1
	blr
beq_else7345:
	li	r2, 0
	blr
sgn2646:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7346
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	blr
beq_else7346:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7347
	lis	r31, lo16(l5592)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5592)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5592)
	lfd	f0, 0(r31)
	blr
ble_else7347:
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	blr
fneg_cond2648:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7348
	fneg	f0, f0
	blr
beq_else7348:
	blr
add_mod52651:
	add	r2, r2, r5
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else7349
	subi	r2, r2, 5
	blr
bge_else7349:
	blr
vecset2654:
	stfd	f0, 0(r2)
	stfd	f1, 4(r2)
	stfd	f2, 8(r2)
	blr
vecfill2659:
	stfd	f0, 0(r2)
	stfd	f0, 4(r2)
	stfd	f0, 8(r2)
	blr
vecbzero2662:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	vecfill2659
veccpy2664:
	lfd	f0, 0(r5)
	stfd	f0, 0(r2)
	lfd	f0, 4(r5)
	stfd	f0, 4(r2)
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7353
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	b	beq_cont7354
beq_else7353:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7355
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont7356
beq_else7355:
	lis	r31, lo16(l5592)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5592)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5592)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont7356:
beq_cont7354:
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
veciprod2675:
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
	blr
veciprod22678:
	lfd	f3, 0(r2)
	fmul	f0, f3, f0
	lfd	f3, 4(r2)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum2683:
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
vecadd2687:
	lfd	f0, 0(r2)
	lfd	f1, 0(r5)
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	lfd	f0, 4(r2)
	lfd	f1, 4(r5)
	fadd	f0, f0, f1
	stfd	f0, 4(r2)
	lfd	f0, 8(r2)
	lfd	f1, 8(r5)
	fadd	f0, f0, f1
	stfd	f0, 8(r2)
	blr
vecscale2693:
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
vecaccumv2696:
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
o_texturetype2700:
	lwz	r2, 0(r2)
	blr
o_form2702:
	lwz	r2, 4(r2)
	blr
o_reflectiontype2704:
	lwz	r2, 8(r2)
	blr
o_isinvert2706:
	lwz	r2, 24(r2)
	blr
o_isrot2708:
	lwz	r2, 12(r2)
	blr
o_param_a2710:
	lwz	r2, 16(r2)
	lfd	f0, 0(r2)
	blr
o_param_b2712:
	lwz	r2, 16(r2)
	lfd	f0, 4(r2)
	blr
o_param_c2714:
	lwz	r2, 16(r2)
	lfd	f0, 8(r2)
	blr
o_param_abc2716:
	lwz	r2, 16(r2)
	blr
o_param_x2718:
	lwz	r2, 20(r2)
	lfd	f0, 0(r2)
	blr
o_param_y2720:
	lwz	r2, 20(r2)
	lfd	f0, 4(r2)
	blr
o_param_z2722:
	lwz	r2, 20(r2)
	lfd	f0, 8(r2)
	blr
o_diffuse2724:
	lwz	r2, 28(r2)
	lfd	f0, 0(r2)
	blr
o_hilight2726:
	lwz	r2, 28(r2)
	lfd	f0, 4(r2)
	blr
o_color_red2728:
	lwz	r2, 32(r2)
	lfd	f0, 0(r2)
	blr
o_color_green2730:
	lwz	r2, 32(r2)
	lfd	f0, 4(r2)
	blr
o_color_blue2732:
	lwz	r2, 32(r2)
	lfd	f0, 8(r2)
	blr
o_param_r12734:
	lwz	r2, 36(r2)
	lfd	f0, 0(r2)
	blr
o_param_r22736:
	lwz	r2, 36(r2)
	lfd	f0, 4(r2)
	blr
o_param_r32738:
	lwz	r2, 36(r2)
	lfd	f0, 8(r2)
	blr
o_param_ctbl2740:
	lwz	r2, 40(r2)
	blr
p_rgb2742:
	lwz	r2, 0(r2)
	blr
p_intersection_points2744:
	lwz	r2, 4(r2)
	blr
p_surface_ids2746:
	lwz	r2, 8(r2)
	blr
p_calc_diffuse2748:
	lwz	r2, 12(r2)
	blr
p_energy2750:
	lwz	r2, 16(r2)
	blr
p_received_ray_20percent2752:
	lwz	r2, 20(r2)
	blr
p_group_id2754:
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	blr
p_set_group_id2756:
	lwz	r2, 24(r2)
	stw	r5, 0(r2)
	blr
p_nvectors2759:
	lwz	r2, 28(r2)
	blr
d_vec2761:
	lwz	r2, 0(r2)
	blr
d_const2763:
	lwz	r2, 4(r2)
	blr
r_surface_id2765:
	lwz	r2, 0(r2)
	blr
r_dvec2767:
	lwz	r2, 4(r2)
	blr
r_bright2769:
	lfd	f0, 8(r2)
	blr
rad2771:
	lis	r31, lo16(l5678)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5678)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5678)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
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
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	rad2771
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
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
	stfd	f0, 16(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	rad2771
	subi	r3, r3, 32
	lwz	r31, 28(r3)
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
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f1, 8(r3)
	fmul	f2, f1, f0
	lis	r31, lo16(l5682)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5682)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5682)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	stfd	f2, 0(r2)
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lis	r31, lo16(l5684)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5684)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5684)
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
	lis	r31, lo16(l5682)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5682)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5682)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	rad2771
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
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
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	rad2771
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
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
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
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
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
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
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
	bne	cr7, beq_else7366
	li	r2, 0
	blr
beq_else7366:
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7367
	li	r5, 0
	b	ble_cont7368
ble_else7367:
	li	r5, 1
ble_cont7368:
	li	r6, 2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	bne	cr7, beq_else7369
	b	beq_cont7370
beq_else7369:
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	rad2771
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 0(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	rad2771
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 4(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	rad2771
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	stfd	f0, 8(r2)
beq_cont7370:
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7371
	li	r6, 1
	b	beq_cont7372
beq_else7371:
	lwz	r6, 28(r3)
beq_cont7372:
	li	r7, 4
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stw	r6, 44(r3)
	stw	r2, 40(r3)
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
	lwz	r2, 40(r3)
	stw	r2, 36(r5)
	lwz	r6, 36(r3)
	stw	r6, 32(r5)
	lwz	r6, 32(r3)
	stw	r6, 28(r5)
	lwz	r6, 44(r3)
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
	add	r31, r9, r10
	stw	r5, 0(r31)
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else7373
	lfd	f0, 0(r6)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7375
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7376
beq_else7375:
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	sgn2646
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7376:
	lwz	r2, 20(r3)
	stfd	f0, 0(r2)
	lfd	f0, 4(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7377
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7378
beq_else7377:
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	sgn2646
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7378:
	lwz	r2, 20(r3)
	stfd	f0, 4(r2)
	lfd	f0, 8(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7379
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7380
beq_else7379:
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	sgn2646
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f1, f1, f1
	fdiv	f0, f0, f1
beq_cont7380:
	lwz	r2, 20(r3)
	stfd	f0, 8(r2)
	b	beq_cont7374
beq_else7373:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else7381
	lwz	r5, 28(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7383
	li	r5, 1
	b	beq_cont7384
beq_else7383:
	li	r5, 0
beq_cont7384:
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecunit_sgn2672
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont7382
beq_else7381:
beq_cont7382:
beq_cont7374:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7385
	b	beq_cont7386
beq_else7385:
	lwz	r2, 20(r3)
	lwz	r5, 40(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	rotate_quadratic_matrix2777
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
beq_cont7386:
	li	r2, 1
	blr
read_object2782:
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else7387
	blr
bge_else7387:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object2780
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7389
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
beq_else7389:
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	read_object2782
read_all_object2784:
	li	r2, 0
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
	bne	cr7, beq_else7391
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else7391:
	addi	r6, r2, 1
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item2786
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
	blr
read_or_network2788:
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_net_item2786
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else7392
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else7392:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_or_network2788
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
	blr
read_and_network2790:
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_net_item2786
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else7393
	blr
beq_else7393:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	add	r31, r5, r7
	stw	r2, 0(r31)
	addi	r2, r6, 1
	b	read_and_network2790
read_parameter2792:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_screen_settings2773
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_light2775
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_all_object2784
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_and_network2790
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	li	r5, 0
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_or_network2788
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 0(r5)
	blr
solver_rect_surface2794:
	slwi	r9, r6, 2
	add	r31, r5, r9
	lfd	f3, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7396
	li	r2, 0
	blr
beq_else7396:
	stfd	f2, 0(r3)
	stw	r8, 8(r3)
	stfd	f1, 16(r3)
	stw	r7, 24(r3)
	stfd	f0, 32(r3)
	stw	r5, 40(r3)
	stw	r6, 44(r3)
	stw	r2, 48(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_abc2716
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 48(r3)
	stw	r2, 52(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_isinvert2706
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r5, 44(r3)
	slwi	r6, r5, 2
	lwz	r7, 40(r3)
	add	r31, r7, r6
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7399
	li	r6, 0
	b	ble_cont7400
ble_else7399:
	li	r6, 1
ble_cont7400:
	mflr	r31
	mr	r5, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	xor2643
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 44(r3)
	slwi	r6, r5, 2
	lwz	r7, 52(r3)
	add	r31, r7, r6
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	fneg_cond2648
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f0, f1
	lwz	r2, 44(r3)
	slwi	r2, r2, 2
	lwz	r5, 40(r3)
	add	r31, r5, r2
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lwz	r2, 24(r3)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lfd	f2, 16(r3)
	fadd	f1, f1, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7401
	slwi	r6, r2, 2
	add	r31, r5, r6
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
	fneg	f1, f1
	b	ble_cont7402
ble_else7401:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
ble_cont7402:
	slwi	r2, r2, 2
	lwz	r6, 52(r3)
	add	r31, r6, r2
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7403
	li	r2, 0
	blr
ble_else7403:
	lwz	r2, 8(r3)
	slwi	r7, r2, 2
	add	r31, r5, r7
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	lfd	f2, 0(r3)
	fadd	f1, f1, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7404
	slwi	r7, r2, 2
	add	r31, r5, r7
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
	fneg	f1, f1
	b	ble_cont7405
ble_else7404:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
ble_cont7405:
	slwi	r2, r2, 2
	add	r31, r6, r2
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7406
	li	r2, 0
	blr
ble_else7406:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_rect2803:
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
	bne	cr7, beq_else7407
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
	bne	cr7, beq_else7408
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
	bne	cr7, beq_else7409
	li	r2, 0
	blr
beq_else7409:
	li	r2, 3
	blr
beq_else7408:
	li	r2, 2
	blr
beq_else7407:
	li	r2, 1
	blr
solver_surface2809:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r5, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_abc2716
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 24(r3)
	stw	r5, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod2675
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7410
	li	r2, 0
	blr
ble_else7410:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	lfd	f3, 0(r3)
	lwz	r5, 28(r3)
	stw	r2, 32(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r5
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod22678
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	fneg	f0, f0
	lfd	f1, 40(r3)
	fdiv	f0, f0, f1
	lwz	r2, 32(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
quadratic2815:
	fmul	f3, f0, f0
	stfd	f0, 0(r3)
	stfd	f2, 8(r3)
	stw	r2, 16(r3)
	stfd	f1, 24(r3)
	stfd	f3, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_a2710
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
	bl	o_param_b2712
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
	bl	o_param_c2714
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
	bl	o_isrot2708
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7413
	lfd	f0, 72(r3)
	blr
beq_else7413:
	lfd	f0, 8(r3)
	lfd	f1, 24(r3)
	fmul	f2, f1, f0
	lwz	r2, 16(r3)
	stfd	f2, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_r12734
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
	bl	o_param_r22736
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
	bl	o_param_r32738
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	blr
bilinear2820:
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
	bl	o_param_a2710
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
	bl	o_param_b2712
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
	bl	o_param_c2714
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
	bl	o_isrot2708
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7415
	lfd	f0, 96(r3)
	blr
beq_else7415:
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
	bl	o_param_r12734
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
	bl	o_param_r22736
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
	bl	o_param_r32738
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 96(r3)
	fadd	f0, f1, f0
	blr
solver_second2828:
	lfd	f3, 0(r5)
	lfd	f4, 4(r5)
	lfd	f5, 8(r5)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r2, 24(r3)
	stw	r5, 28(r3)
	mflr	r31
	fmr	f2, f5
	fmr	f1, f4
	fmr	f0, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	quadratic2815
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7416
	li	r2, 0
	blr
beq_else7416:
	lwz	r2, 28(r3)
	lfd	f1, 0(r2)
	lfd	f2, 4(r2)
	lfd	f3, 8(r2)
	lfd	f4, 16(r3)
	lfd	f5, 8(r3)
	lfd	f6, 0(r3)
	lwz	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	fmr	f3, f4
	fmr	f4, f5
	fmr	f5, f6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	bilinear2820
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	lfd	f3, 0(r3)
	lwz	r2, 24(r3)
	stfd	f0, 40(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	quadratic2815
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_form2702
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7417
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	b	beq_cont7418
beq_else7417:
	lfd	f0, 48(r3)
beq_cont7418:
	lfd	f1, 40(r3)
	fmul	f2, f1, f1
	lfd	f3, 32(r3)
	fmul	f0, f3, f0
	fsub	f0, f2, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else7419
	li	r2, 0
	blr
ble_else7419:
	fsqrt	f0, f0
	lwz	r2, 24(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_isinvert2706
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7420
	lfd	f0, 56(r3)
	fneg	f0, f0
	b	beq_cont7421
beq_else7420:
	lfd	f0, 56(r3)
beq_cont7421:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 40(r3)
	fsub	f0, f0, f1
	lfd	f1, 32(r3)
	fdiv	f0, f0, f1
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
	add	r31, r7, r2
	lwz	r2, 0(r31)
	lfd	f0, 0(r6)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x2718
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	lfd	f1, 4(r2)
	lwz	r5, 4(r3)
	stfd	f0, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y2720
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	lfd	f1, 8(r2)
	lwz	r2, 4(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_z2722
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
	bl	o_form2702
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7423
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_rect2803
beq_else7423:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7424
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_surface2809
beq_else7424:
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_second2828
solver_rect_fast2838:
	lfd	f3, 0(r6)
	fsub	f3, f3, f0
	lfd	f4, 4(r6)
	fmul	f3, f3, f4
	lfd	f4, 4(r5)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else7425
	lfd	f4, 4(r5)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	fneg	f4, f4
	b	ble_cont7426
ble_else7425:
	lfd	f4, 4(r5)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
ble_cont7426:
	stfd	f0, 0(r3)
	stfd	f1, 8(r3)
	stw	r6, 16(r3)
	stw	r2, 20(r3)
	stfd	f2, 24(r3)
	stfd	f3, 32(r3)
	stw	r5, 40(r3)
	stfd	f4, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_b2712
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7428
	li	r2, 0
	b	ble_cont7429
ble_else7428:
	lwz	r2, 40(r3)
	lfd	f0, 8(r2)
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f2, 24(r3)
	fadd	f0, f0, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7430
	lfd	f0, 8(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
	fneg	f0, f0
	b	ble_cont7431
ble_else7430:
	lfd	f0, 8(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
ble_cont7431:
	lwz	r5, 20(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c2714
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7432
	li	r2, 0
	b	ble_cont7433
ble_else7432:
	lwz	r2, 16(r3)
	lfd	f0, 4(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7434
	li	r2, 0
	b	beq_cont7435
beq_else7434:
	li	r2, 1
beq_cont7435:
ble_cont7433:
ble_cont7429:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7436
	lwz	r2, 16(r3)
	lfd	f0, 8(r2)
	lfd	f1, 8(r3)
	fsub	f0, f0, f1
	lfd	f2, 12(r2)
	fmul	f0, f0, f2
	lwz	r5, 40(r3)
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	lfd	f3, 0(r3)
	fadd	f2, f2, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else7437
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont7438
ble_else7437:
	lfd	f2, 0(r5)
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont7438:
	lwz	r6, 20(r3)
	stfd	f0, 64(r3)
	stfd	f2, 72(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_a2710
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7439
	li	r2, 0
	b	ble_cont7440
ble_else7439:
	lwz	r2, 40(r3)
	lfd	f0, 8(r2)
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lfd	f2, 24(r3)
	fadd	f0, f0, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7441
	lfd	f0, 8(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
	fneg	f0, f0
	b	ble_cont7442
ble_else7441:
	lfd	f0, 8(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
ble_cont7442:
	lwz	r5, 20(r3)
	stfd	f0, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_c2714
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7443
	li	r2, 0
	b	ble_cont7444
ble_else7443:
	lwz	r2, 16(r3)
	lfd	f0, 12(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7445
	li	r2, 0
	b	beq_cont7446
beq_else7445:
	li	r2, 1
beq_cont7446:
ble_cont7444:
ble_cont7440:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7447
	lwz	r2, 16(r3)
	lfd	f0, 16(r2)
	lfd	f1, 24(r3)
	fsub	f0, f0, f1
	lfd	f1, 20(r2)
	fmul	f0, f0, f1
	lwz	r5, 40(r3)
	lfd	f1, 0(r5)
	fmul	f1, f0, f1
	lfd	f2, 0(r3)
	fadd	f1, f1, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7448
	lfd	f1, 0(r5)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
	fneg	f1, f1
	b	ble_cont7449
ble_else7448:
	lfd	f1, 0(r5)
	fmul	f1, f0, f1
	fadd	f1, f1, f2
ble_cont7449:
	lwz	r6, 20(r3)
	stfd	f0, 88(r3)
	stfd	f1, 96(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_a2710
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7450
	li	r2, 0
	b	ble_cont7451
ble_else7450:
	lwz	r2, 40(r3)
	lfd	f0, 4(r2)
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f2, 8(r3)
	fadd	f0, f0, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7452
	lfd	f0, 4(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
	fneg	f0, f0
	b	ble_cont7453
ble_else7452:
	lfd	f0, 4(r2)
	fmul	f0, f1, f0
	fadd	f0, f0, f2
ble_cont7453:
	lwz	r2, 20(r3)
	stfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_b2712
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 104(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7454
	li	r2, 0
	b	ble_cont7455
ble_else7454:
	lwz	r2, 16(r3)
	lfd	f0, 20(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7456
	li	r2, 0
	b	beq_cont7457
beq_else7456:
	li	r2, 1
beq_cont7457:
ble_cont7455:
ble_cont7451:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7458
	li	r2, 0
	blr
beq_else7458:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 88(r3)
	stfd	f0, 0(r2)
	li	r2, 3
	blr
beq_else7447:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 64(r3)
	stfd	f0, 0(r2)
	li	r2, 2
	blr
beq_else7436:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 32(r3)
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_surface_fast2845:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	lfd	f4, 0(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7459
	li	r2, 0
	blr
ble_else7459:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f3, 4(r5)
	fmul	f0, f3, f0
	lfd	f3, 8(r5)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast2851:
	lfd	f3, 0(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7460
	li	r2, 0
	blr
beq_else7460:
	lfd	f4, 4(r5)
	fmul	f4, f4, f0
	lfd	f5, 8(r5)
	fmul	f5, f5, f1
	fadd	f4, f4, f5
	lfd	f5, 12(r5)
	fmul	f5, f5, f2
	fadd	f4, f4, f5
	stw	r5, 0(r3)
	stfd	f3, 8(r3)
	stfd	f4, 16(r3)
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	quadratic2815
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_form2702
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7463
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	b	beq_cont7464
beq_else7463:
	lfd	f0, 32(r3)
beq_cont7464:
	lfd	f1, 16(r3)
	fmul	f2, f1, f1
	lfd	f3, 8(r3)
	fmul	f0, f3, f0
	fsub	f0, f2, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else7465
	li	r2, 0
	blr
ble_else7465:
	lwz	r2, 24(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert2706
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7466
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r5, 0(r3)
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont7467
beq_else7466:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 40(r3)
	fsqrt	f0, f0
	lfd	f1, 16(r3)
	fadd	f0, f1, f0
	lwz	r5, 0(r3)
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont7467:
	li	r2, 1
	blr
solver_fast2857:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r8, r2, 2
	add	r31, r7, r8
	lwz	r7, 0(r31)
	lfd	f0, 0(r6)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	stw	r7, 8(r3)
	stw	r6, 12(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_x2718
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r2, 12(r3)
	lfd	f1, 4(r2)
	lwz	r5, 8(r3)
	stfd	f0, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y2720
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 12(r3)
	lfd	f1, 8(r2)
	lwz	r2, 8(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_z2722
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
	bl	d_const2763
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	lwz	r5, 8(r3)
	stw	r2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_form2702
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7468
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	d_vec2761
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 8(r3)
	lwz	r6, 64(r3)
	b	solver_rect_fast2838
beq_else7468:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7469
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 8(r3)
	lwz	r5, 64(r3)
	b	solver_surface_fast2845
beq_else7469:
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 8(r3)
	lwz	r5, 64(r3)
	b	solver_second_fast2851
solver_surface_fast22861:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7470
	li	r2, 0
	blr
ble_else7470:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r5)
	lfd	f1, 12(r6)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
solver_second_fast22868:
	lfd	f3, 0(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7471
	li	r2, 0
	blr
beq_else7471:
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7472
	li	r2, 0
	blr
ble_else7472:
	stw	r5, 0(r3)
	stfd	f0, 8(r3)
	stfd	f1, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert2706
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7474
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 16(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lwz	r5, 0(r3)
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont7475
beq_else7474:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 16(r3)
	fsqrt	f0, f0
	lfd	f1, 8(r3)
	fadd	f0, f1, f0
	lwz	r5, 0(r3)
	lfd	f1, 16(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont7475:
	li	r2, 1
	blr
solver_fast22875:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_ctbl2740
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	lfd	f1, 4(r2)
	lfd	f2, 8(r2)
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	stfd	f2, 16(r3)
	stfd	f1, 24(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	d_const2763
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	lwz	r5, 0(r3)
	stw	r2, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_form2702
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7476
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	d_vec2761
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 0(r3)
	lwz	r6, 40(r3)
	b	solver_rect_fast2838
beq_else7476:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7477
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 0(r3)
	lwz	r5, 40(r3)
	lwz	r6, 12(r3)
	b	solver_surface_fast22861
beq_else7477:
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 0(r3)
	lwz	r5, 40(r3)
	lwz	r6, 12(r3)
	b	solver_second_fast22868
setup_rect_table2878:
	li	r6, 6
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7478
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 4(r2)
	b	beq_cont7479
beq_else7478:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert2706
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7480
	li	r6, 0
	b	ble_cont7481
ble_else7480:
	li	r6, 1
ble_cont7481:
	mflr	r31
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	xor2643
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_a2710
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond2648
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 4(r2)
beq_cont7479:
	lfd	f0, 4(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7482
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 12(r2)
	b	beq_cont7483
beq_else7482:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 4(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7484
	li	r6, 0
	b	ble_cont7485
ble_else7484:
	li	r6, 1
ble_cont7485:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor2643
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_b2712
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	fneg_cond2648
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 4(r5)
	fdiv	f0, f0, f1
	stfd	f0, 12(r2)
beq_cont7483:
	lfd	f0, 8(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7486
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 20(r2)
	b	beq_cont7487
beq_else7486:
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7488
	li	r6, 0
	b	ble_cont7489
ble_else7488:
	li	r6, 1
ble_cont7489:
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	xor2643
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_param_c2714
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	fneg_cond2648
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	stfd	f0, 16(r2)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 20(r2)
beq_cont7487:
	blr
setup_surface_table2881:
	li	r6, 4
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	bl	o_param_a2710
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 4(r2)
	lwz	r5, 0(r3)
	stfd	f0, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_b2712
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f1, 24(r3)
	fadd	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r2, 0(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_c2714
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7491
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	b	ble_cont7492
ble_else7491:
	lis	r31, lo16(l5592)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5592)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5592)
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
	bl	o_param_a2710
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 4(r2)
	lwz	r5, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_b2712
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
	bl	o_param_c2714
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fdiv	f0, f0, f1
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 12(r2)
ble_cont7492:
	blr
setup_second_table2884:
	li	r6, 5
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lwz	r6, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	quadratic2815
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
	bl	o_param_a2710
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	fneg	f0, f0
	lwz	r2, 4(r3)
	lfd	f1, 4(r2)
	lwz	r5, 0(r3)
	stfd	f0, 32(r3)
	stfd	f1, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_b2712
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	fneg	f0, f0
	lwz	r2, 4(r3)
	lfd	f1, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 48(r3)
	stfd	f1, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c2714
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
	bl	o_isrot2708
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7494
	lwz	r2, 8(r3)
	lfd	f0, 32(r3)
	stfd	f0, 4(r2)
	lfd	f0, 48(r3)
	stfd	f0, 8(r2)
	lfd	f0, 64(r3)
	stfd	f0, 12(r2)
	b	beq_cont7495
beq_else7494:
	lwz	r2, 4(r3)
	lfd	f0, 8(r2)
	lwz	r5, 0(r3)
	stfd	f0, 72(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_r22736
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fmul	f0, f1, f0
	lwz	r2, 4(r3)
	lfd	f1, 4(r2)
	lwz	r5, 0(r3)
	stfd	f0, 80(r3)
	stfd	f1, 88(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r32738
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fmul	f0, f1, f0
	lfd	f1, 80(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 4(r2)
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
	lwz	r6, 0(r3)
	stfd	f0, 96(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_r12734
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
	bl	o_param_r32738
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lfd	f1, 112(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	lfd	f0, 4(r5)
	lwz	r6, 0(r3)
	stfd	f0, 120(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_r12734
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
	bl	o_param_r22736
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lfd	f1, 136(r3)
	fmul	f0, f1, f0
	lfd	f1, 128(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 64(r3)
	fsub	f0, f1, f0
	lwz	r2, 8(r3)
	stfd	f0, 12(r2)
beq_cont7495:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bne	cr7, beq_else7496
	b	beq_cont7497
beq_else7496:
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 16(r2)
beq_cont7497:
	blr
iter_setup_dirvec_constants2887:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7498
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	d_const2763
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec2761
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2702
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7499
	lwz	r2, 16(r3)
	lwz	r5, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_rect_table2878
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont7500
beq_else7499:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7501
	lwz	r2, 16(r3)
	lwz	r5, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_surface_table2881
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont7502
beq_else7501:
	lwz	r2, 16(r3)
	lwz	r5, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_second_table2884
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont7502:
beq_cont7500:
	subi	r5, r5, 1
	lwz	r2, 8(r3)
	b	iter_setup_dirvec_constants2887
bge_else7498:
	blr
setup_dirvec_constants2890:
	lis	r5, lo16(min_caml_n_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_n_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_n_objects)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 1
	b	iter_setup_dirvec_constants2887
setup_startp_constants2892:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7504
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_ctbl2740
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2702
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	lfd	f0, 0(r5)
	lwz	r6, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x2718
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lwz	r2, 12(r3)
	stfd	f0, 0(r2)
	lwz	r5, 4(r3)
	lfd	f0, 4(r5)
	lwz	r6, 8(r3)
	stfd	f0, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_y2720
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r2, 12(r3)
	stfd	f0, 4(r2)
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
	lwz	r6, 8(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_z2722
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 12(r3)
	stfd	f0, 8(r2)
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7506
	lwz	r5, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_abc2716
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	lfd	f0, 0(r5)
	lfd	f1, 4(r5)
	lfd	f2, 8(r5)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod22678
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	stfd	f0, 12(r2)
	b	beq_cont7507
beq_else7506:
	cmpwi	cr7, r5, 2
	bgt	cr7, ble_else7508
	b	ble_cont7509
ble_else7508:
	lfd	f0, 0(r2)
	lfd	f1, 4(r2)
	lfd	f2, 8(r2)
	lwz	r6, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	quadratic2815
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7510
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont7511
beq_else7510:
beq_cont7511:
	lwz	r2, 12(r3)
	stfd	f0, 12(r2)
ble_cont7509:
beq_cont7507:
	lwz	r2, 0(r3)
	subi	r5, r2, 1
	lwz	r2, 4(r3)
	b	setup_startp_constants2892
bge_else7504:
	blr
setup_startp2895:
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	stw	r2, 0(r3)
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	veccpy2664
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	b	setup_startp_constants2892
is_rect_outside2897:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7513
	fneg	f0, f0
	b	ble_cont7514
ble_else7513:
ble_cont7514:
	stfd	f2, 0(r3)
	stw	r2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a2710
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7516
	li	r2, 0
	b	ble_cont7517
ble_else7516:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7518
	fneg	f0, f1
	b	ble_cont7519
ble_else7518:
	fmr	f0, f1
ble_cont7519:
	lwz	r2, 8(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_param_b2712
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7520
	li	r2, 0
	b	ble_cont7521
ble_else7520:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 0(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7522
	fneg	f0, f1
	b	ble_cont7523
ble_else7522:
	fmr	f0, f1
ble_cont7523:
	lwz	r2, 8(r3)
	stfd	f0, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_c2714
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7524
	li	r2, 0
	b	ble_cont7525
ble_else7524:
	li	r2, 1
ble_cont7525:
ble_cont7521:
ble_cont7517:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7526
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_isinvert2706
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7527
	li	r2, 1
	blr
beq_else7527:
	li	r2, 0
	blr
beq_else7526:
	lwz	r2, 8(r3)
	b	o_isinvert2706
is_plane_outside2902:
	stw	r2, 0(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc2716
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod22678
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_isinvert2706
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7529
	li	r5, 0
	b	ble_cont7530
ble_else7529:
	li	r5, 1
ble_cont7530:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	xor2643
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7531
	li	r2, 1
	blr
beq_else7531:
	li	r2, 0
	blr
is_second_outside2907:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	quadratic2815
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2702
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7533
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	b	beq_cont7534
beq_else7533:
	lfd	f0, 8(r3)
beq_cont7534:
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_isinvert2706
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7535
	li	r5, 0
	b	ble_cont7536
ble_else7535:
	li	r5, 1
ble_cont7536:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor2643
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7537
	li	r2, 1
	blr
beq_else7537:
	li	r2, 0
	blr
is_outside2912:
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x2718
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
	bl	o_param_y2720
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
	bl	o_param_z2722
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
	bl	o_form2702
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7539
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_rect_outside2897
beq_else7539:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7540
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_plane_outside2902
beq_else7540:
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_second_outside2907
check_all_inside2917:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7541
	li	r2, 1
	blr
beq_else7541:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	add	r31, r7, r6
	lwz	r6, 0(r31)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r5, 24(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	is_outside2912
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7542
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r5, 24(r3)
	b	check_all_inside2917
beq_else7542:
	li	r2, 0
	blr
shadow_check_and_group2923:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7543
	li	r2, 0
	blr
beq_else7543:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
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
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_fast2857
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7544
	li	r2, 0
	b	beq_cont7545
beq_else7544:
	lis	r31, lo16(l5926)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5926)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5926)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7546
	li	r2, 0
	b	ble_cont7547
ble_else7546:
	li	r2, 1
ble_cont7547:
beq_cont7545:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7548
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert2706
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7549
	li	r2, 0
	blr
beq_else7549:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else7548:
	lis	r31, lo16(l5927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5927)
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
	li	r2, 0
	lwz	r5, 0(r3)
	mflr	r31
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	check_all_inside2917
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7550
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else7550:
	li	r2, 1
	blr
shadow_check_one_or_group2926:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7551
	li	r2, 0
	blr
beq_else7551:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
	bne	cr7, beq_else7552
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_one_or_group2926
beq_else7552:
	li	r2, 1
	blr
shadow_check_one_or_matrix2929:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	lwz	r7, 0(r6)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7553
	li	r2, 0
	blr
beq_else7553:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else7554
	li	r2, 1
	b	beq_cont7555
beq_else7554:
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
	mflr	r31
	mr	r6, r9
	mr	r5, r8
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_fast2857
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7556
	li	r2, 0
	b	beq_cont7557
beq_else7556:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l5940)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5940)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5940)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7558
	li	r2, 0
	b	ble_cont7559
ble_else7558:
	li	r2, 1
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7560
	li	r2, 0
	b	beq_cont7561
beq_else7560:
	li	r2, 1
beq_cont7561:
ble_cont7559:
beq_cont7557:
beq_cont7555:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7562
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else7562:
	li	r2, 1
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7563
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else7563:
	li	r2, 1
	blr
solve_each_element2932:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7564
	blr
beq_else7564:
	lis	r8, lo16(min_caml_startp)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_startp)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_startp)
	lwz	r8, 0(r8)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	mr	r6, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver2834
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7566
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7567
	blr
beq_else7567:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
beq_else7566:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7569
	b	ble_cont7570
ble_else7569:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7571
	b	ble_cont7572
ble_else7571:
	lis	r31, lo16(l5927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5927)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r5, 0(r3)
	lfd	f1, 0(r5)
	fmul	f1, f1, f0
	lis	r6, lo16(min_caml_startp)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp)
	lwz	r6, 0(r6)
	lfd	f2, 0(r6)
	fadd	f1, f1, f2
	lfd	f2, 4(r5)
	fmul	f2, f2, f0
	lis	r6, lo16(min_caml_startp)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp)
	lwz	r6, 0(r6)
	lfd	f3, 4(r6)
	fadd	f2, f2, f3
	lfd	f3, 8(r5)
	fmul	f3, f3, f0
	lis	r6, lo16(min_caml_startp)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp)
	lwz	r6, 0(r6)
	lfd	f4, 8(r6)
	fadd	f3, f3, f4
	li	r6, 0
	lwz	r7, 4(r3)
	stw	r2, 16(r3)
	stfd	f3, 24(r3)
	stfd	f2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f0, 48(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	check_all_inside2917
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7574
	b	beq_cont7575
beq_else7574:
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
	lfd	f1, 32(r3)
	lfd	f2, 24(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	vecset2654
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
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
	lwz	r5, 16(r3)
	stw	r5, 0(r2)
beq_cont7575:
ble_cont7572:
ble_cont7570:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
solve_one_or_network2936:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7576
	blr
beq_else7576:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	add	r31, r8, r7
	lwz	r7, 0(r31)
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
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network2936
trace_or_matrix2940:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else7578
	blr
beq_else7578:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else7580
	li	r8, 1
	mflr	r31
	mr	r5, r7
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solve_one_or_network2936
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont7581
beq_else7580:
	lis	r9, lo16(min_caml_startp)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_startp)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_startp)
	lwz	r9, 0(r9)
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	mr	r6, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver2834
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7582
	b	beq_cont7583
beq_else7582:
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
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7584
	b	ble_cont7585
ble_else7584:
	li	r2, 1
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network2936
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont7585:
beq_cont7583:
beq_cont7581:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_or_matrix2940
judge_intersection2944:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lis	r31, lo16(l5960)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5960)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5960)
	lfd	f0, 0(r31)
	stfd	f0, 0(r5)
	li	r5, 0
	lis	r6, lo16(min_caml_or_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_or_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_or_net)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r29, r6
	mr	r6, r2
	mr	r2, r5
	mr	r5, r29
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	trace_or_matrix2940
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l5940)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5940)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5940)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7586
	li	r2, 0
	blr
ble_else7586:
	lis	r31, lo16(l5964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5964)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7587
	li	r2, 0
	blr
ble_else7587:
	li	r2, 1
	blr
solve_each_element_fast2946:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	d_vec2761
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7588
	blr
beq_else7588:
	lwz	r8, 0(r3)
	stw	r2, 12(r3)
	stw	r6, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_fast22875
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7590
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 16(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7591
	blr
beq_else7591:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element_fast2946
beq_else7590:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7593
	b	ble_cont7594
ble_else7593:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7595
	b	ble_cont7596
ble_else7595:
	lis	r31, lo16(l5927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5927)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	lwz	r5, 12(r3)
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
	li	r5, 0
	lwz	r6, 4(r3)
	stw	r2, 20(r3)
	stfd	f3, 24(r3)
	stfd	f2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f0, 48(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	check_all_inside2917
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7597
	b	beq_cont7598
beq_else7597:
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
	lfd	f1, 32(r3)
	lfd	f2, 24(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	vecset2654
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
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
beq_cont7598:
ble_cont7596:
ble_cont7594:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element_fast2946
solve_one_or_network_fast2950:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7599
	blr
beq_else7599:
	lis	r8, lo16(min_caml_and_net)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_and_net)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_and_net)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	add	r31, r8, r7
	lwz	r7, 0(r31)
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
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network_fast2950
trace_or_matrix_fast2954:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else7601
	blr
beq_else7601:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else7603
	li	r8, 1
	mflr	r31
	mr	r5, r7
	mr	r2, r8
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont7604
beq_else7603:
	stw	r7, 12(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_fast22875
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7605
	b	beq_cont7606
beq_else7605:
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
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7607
	b	ble_cont7608
ble_else7607:
	li	r2, 1
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont7608:
beq_cont7606:
beq_cont7604:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_or_matrix_fast2954
judge_intersection_fast2958:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lis	r31, lo16(l5960)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5960)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5960)
	lfd	f0, 0(r31)
	stfd	f0, 0(r5)
	li	r5, 0
	lis	r6, lo16(min_caml_or_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_or_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_or_net)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r29, r6
	mr	r6, r2
	mr	r2, r5
	mr	r5, r29
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l5940)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5940)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5940)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7609
	li	r2, 0
	blr
ble_else7609:
	lis	r31, lo16(l5964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5964)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7610
	li	r2, 0
	blr
ble_else7610:
	li	r2, 1
	blr
get_nvector_rect2960:
	lis	r5, lo16(min_caml_intsec_rectside)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intsec_rectside)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intsec_rectside)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	lis	r6, lo16(min_caml_nvector)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_nvector)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_nvector)
	lwz	r6, 0(r6)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	vecbzero2662
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	subi	r6, r5, 1
	subi	r5, r5, 1
	slwi	r5, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r5
	lfd	f0, 0(r31)
	stw	r2, 8(r3)
	stw	r6, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	sgn2646
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 12(r3)
	slwi	r2, r2, 2
	lwz	r5, 8(r3)
	add	r31, r5, r2
	stfd	f0, 0(r31)
	blr
get_nvector_plane2962:
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_a2710
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 4(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_param_b2712
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 8(r3)
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_c2714
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fneg	f0, f0
	lwz	r2, 12(r3)
	stfd	f0, 8(r2)
	blr
get_nvector_second2964:
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	stw	r2, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_param_x2718
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f1, 4(r2)
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	stfd	f1, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_y2720
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f1, 8(r2)
	lwz	r2, 0(r3)
	stfd	f0, 32(r3)
	stfd	f1, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_z2722
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_a2710
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 56(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_b2712
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_c2714
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_isrot2708
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7614
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lfd	f0, 56(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lfd	f0, 64(r3)
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 8(r2)
	b	beq_cont7615
beq_else7614:
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 80(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_r32738
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r22736
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f2, 88(r3)
	fadd	f0, f2, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f2, 0(r31)
	fmul	f0, f0, f2
	lfd	f2, 56(r3)
	fadd	f0, f2, f0
	lwz	r2, 80(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 96(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_param_r32738
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_r12734
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 104(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 64(r3)
	fadd	f0, f1, f0
	lwz	r2, 96(r3)
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 112(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_r22736
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	stfd	f0, 120(r3)
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_r12734
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 32(r3)
	fmul	f0, f1, f0
	lfd	f1, 120(r3)
	fadd	f0, f1, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 72(r3)
	fadd	f0, f1, f0
	lwz	r2, 112(r3)
	stfd	f0, 8(r2)
beq_cont7615:
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r2, 128(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_isinvert2706
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 128(r3)
	b	vecunit_sgn2672
get_nvector2966:
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_form2702
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7619
	lwz	r2, 4(r3)
	b	get_nvector_rect2960
beq_else7619:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7620
	lwz	r2, 0(r3)
	b	get_nvector_plane2962
beq_else7620:
	lwz	r2, 0(r3)
	b	get_nvector_second2964
utexture2969:
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_texturetype2700
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lwz	r6, 4(r3)
	stw	r2, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_red2728
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	stfd	f0, 0(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_color_green2730
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	stfd	f0, 4(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_color_blue2732
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	stfd	f0, 8(r2)
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7621
	lwz	r2, 0(r3)
	lfd	f0, 0(r2)
	lwz	r5, 4(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_x2718
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fsub	f0, f1, f0
	lis	r31, lo16(l6027)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6027)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6027)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l6028)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6028)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6028)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f0, f0, f1
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7622
	li	r2, 0
	b	ble_cont7623
ble_else7622:
	li	r2, 1
ble_cont7623:
	lwz	r5, 0(r3)
	lfd	f0, 8(r5)
	lwz	r5, 4(r3)
	stw	r2, 32(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_z2722
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lis	r31, lo16(l6027)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6027)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6027)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l6028)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6028)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6028)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f0, f0, f1
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7625
	li	r2, 0
	b	ble_cont7626
ble_else7625:
	li	r2, 1
ble_cont7626:
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lwz	r6, 32(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else7627
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7629
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f0, 0(r31)
	b	beq_cont7630
beq_else7629:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
beq_cont7630:
	b	beq_cont7628
beq_else7627:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7631
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7632
beq_else7631:
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f0, 0(r31)
beq_cont7632:
beq_cont7628:
	stfd	f0, 4(r5)
	blr
beq_else7621:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7634
	lwz	r2, 0(r3)
	lfd	f0, 4(r2)
	lis	r31, lo16(l6022)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6022)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6022)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_sin
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	lfd	f1, 4(r2)
	lis	r31, lo16(l6022)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6022)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6022)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	stfd	f0, 48(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_sin
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f1, 0(r31)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 4(r2)
	blr
beq_else7634:
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7636
	lwz	r2, 0(r3)
	lfd	f0, 0(r2)
	lwz	r5, 4(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_x2718
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lfd	f1, 56(r3)
	fsub	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
	lwz	r2, 4(r3)
	stfd	f0, 64(r3)
	stfd	f1, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	o_param_z2722
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lfd	f1, 72(r3)
	fsub	f0, f1, f0
	lfd	f1, 64(r3)
	fmul	f1, f1, f1
	fmul	f0, f0, f0
	fadd	f0, f1, f0
	fsqrt	f0, f0
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l6010)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6010)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6010)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_cos
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
	fmul	f0, f1, f0
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	stfd	f1, 4(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else7636:
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else7638
	lwz	r2, 0(r3)
	lfd	f0, 0(r2)
	lwz	r5, 4(r3)
	stfd	f0, 96(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	o_param_x2718
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lfd	f1, 96(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 104(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_param_a2710
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 104(r3)
	fmul	f0, f1, f0
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
	lwz	r5, 4(r3)
	stfd	f0, 112(r3)
	stfd	f1, 120(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	o_param_z2722
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	lfd	f1, 120(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 128(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	o_param_c2714
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 128(r3)
	fmul	f0, f1, f0
	lfd	f1, 112(r3)
	fmul	f2, f1, f1
	fmul	f3, f0, f0
	fadd	f2, f2, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7639
	fneg	f3, f1
	b	ble_cont7640
ble_else7639:
	fmr	f3, f1
ble_cont7640:
	lis	r31, lo16(l6007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6007)
	lfd	f4, 0(r31)
	stfd	f2, 136(r3)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7641
	fdiv	f3, f0, f1
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7643
	fdiv	f0, f0, f1
	fneg	f0, f0
	b	ble_cont7644
ble_else7643:
	fdiv	f0, f0, f1
ble_cont7644:
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_atan
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lis	r31, lo16(l6009)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6009)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6009)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l6010)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6010)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6010)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont7642
ble_else7641:
	lis	r31, lo16(l6008)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6008)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6008)
	lfd	f0, 0(r31)
ble_cont7642:
	floor	f1, f0
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	lfd	f1, 4(r2)
	lwz	r2, 4(r3)
	stfd	f0, 144(r3)
	stfd	f1, 152(r3)
	mflr	r31
	stw	r31, 164(r3)
	addi	r3, r3, 168
	bl	o_param_y2720
	subi	r3, r3, 168
	lwz	r31, 164(r3)
	mtlr	r31
	lfd	f1, 152(r3)
	fsub	f0, f1, f0
	lwz	r2, 4(r3)
	stfd	f0, 160(r3)
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	o_param_b2712
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	fsqrt	f0, f0
	lfd	f1, 160(r3)
	fmul	f0, f1, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	lfd	f2, 136(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7645
	fneg	f1, f2
	b	ble_cont7646
ble_else7645:
	fmr	f1, f2
ble_cont7646:
	lis	r31, lo16(l6007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6007)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7647
	fdiv	f1, f0, f2
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else7649
	fdiv	f0, f0, f2
	fneg	f0, f0
	b	ble_cont7650
ble_else7649:
	fdiv	f0, f0, f2
ble_cont7650:
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	min_caml_atan
	subi	r3, r3, 176
	lwz	r31, 172(r3)
	mtlr	r31
	lis	r31, lo16(l6009)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6009)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6009)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l6010)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6010)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6010)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont7648
ble_else7647:
	lis	r31, lo16(l6008)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6008)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6008)
	lfd	f0, 0(r31)
ble_cont7648:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l6012)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6012)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6012)
	lfd	f1, 0(r31)
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f2, 0(r31)
	lfd	f3, 144(r3)
	fsub	f2, f2, f3
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f4, 0(r31)
	fsub	f3, f4, f3
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f2, 0(r31)
	fsub	f2, f2, f0
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f3, 0(r31)
	fsub	f0, f3, f0
	fmul	f0, f2, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7651
	b	ble_cont7652
ble_else7651:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
ble_cont7652:
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, lo16(l6014)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6014)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6014)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else7638:
	blr
add_light2972:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f3, 0(r31)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else7655
	b	ble_cont7656
ble_else7655:
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
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	vecaccum2683
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont7656:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7657
	blr
ble_else7657:
	fmul	f0, f1, f1
	fmul	f1, f1, f1
	fmul	f0, f0, f1
	lfd	f1, 0(r3)
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
trace_reflections2976:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7660
	lis	r6, lo16(min_caml_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_reflections)
	lwz	r6, 0(r6)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	stw	r5, 16(r3)
	stfd	f0, 24(r3)
	stw	r6, 32(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	r_dvec2767
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	stw	r2, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	judge_intersection_fast2958
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7663
	b	beq_cont7664
beq_else7663:
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
	lwz	r5, 32(r3)
	stw	r2, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	r_surface_id2765
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	cmpw	cr7, r5, r2
	bne	cr7, beq_else7665
	li	r2, 0
	lis	r5, lo16(min_caml_or_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_or_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_or_net)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7667
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 36(r3)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	d_vec2761
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod2675
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	r_bright2769
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f2, f0, f1
	lfd	f3, 48(r3)
	fmul	f2, f2, f3
	lwz	r2, 36(r3)
	stfd	f2, 56(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	d_vec2761
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	veciprod2675
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f1, f1, f0
	lfd	f0, 56(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	add_light2972
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont7668
beq_else7667:
beq_cont7668:
	b	beq_cont7666
beq_else7665:
beq_cont7666:
beq_cont7664:
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 16(r3)
	b	trace_reflections2976
bge_else7660:
	blr
trace_ray2981:
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else7670
	stfd	f1, 0(r3)
	stw	r6, 8(r3)
	stfd	f0, 16(r3)
	stw	r2, 24(r3)
	stw	r5, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_surface_ids2746
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	judge_intersection2944
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7672
	li	r2, -1
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 32(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7673
	blr
beq_else7673:
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lwz	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod2675
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7675
	blr
ble_else7675:
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
beq_else7672:
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
	add	r31, r5, r6
	lwz	r5, 0(r31)
	stw	r2, 36(r3)
	stw	r5, 40(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	o_reflectiontype2704
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_diffuse2724
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f0, f1
	lwz	r2, 40(r3)
	lwz	r5, 28(r3)
	stfd	f0, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	get_nvector2966
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
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
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veccpy2664
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	utexture2969
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	slwi	r2, r2, 2
	lis	r5, lo16(min_caml_intsec_rectside)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intsec_rectside)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intsec_rectside)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	add	r2, r2, r5
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 32(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	p_intersection_points2744
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	lis	r6, lo16(min_caml_intersection_point)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_intersection_point)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_intersection_point)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r5, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	veccpy2664
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	p_calc_diffuse2748
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	stw	r2, 56(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_diffuse2724
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7678
	li	r2, 1
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	p_energy2750
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r6, 0(r31)
	lis	r7, lo16(min_caml_texture_color)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_texture_color)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_texture_color)
	lwz	r7, 0(r7)
	stw	r2, 60(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy2664
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	slwi	r5, r2, 2
	lwz	r6, 60(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r31, lo16(l6050)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6050)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6050)
	lfd	f0, 0(r31)
	lfd	f1, 48(r3)
	fmul	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	vecscale2693
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	p_nvectors2759
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	lis	r6, lo16(min_caml_nvector)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_nvector)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_nvector)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r5, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	veccpy2664
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	ble_cont7679
ble_else7678:
	li	r2, 0
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
ble_cont7679:
	lis	r31, lo16(l6052)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6052)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6052)
	lfd	f0, 0(r31)
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r2, 28(r3)
	stfd	f0, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	veciprod2675
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r2, 28(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecaccum2683
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_hilight2726
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	li	r2, 0
	lis	r5, lo16(min_caml_or_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_or_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_or_net)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	stfd	f0, 72(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7680
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
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	veciprod2675
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	fneg	f0, f0
	lfd	f1, 48(r3)
	fmul	f0, f0, f1
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	lwz	r2, 28(r3)
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	veciprod2675
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	fneg	f1, f0
	lfd	f0, 80(r3)
	lfd	f2, 72(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	add_light2972
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont7681
beq_else7680:
beq_cont7681:
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	setup_startp2895
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lfd	f0, 48(r3)
	lfd	f1, 72(r3)
	lwz	r5, 28(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	trace_reflections2976
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lis	r31, lo16(l6055)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6055)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6055)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7682
	blr
ble_else7682:
	lwz	r2, 24(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else7684
	b	bge_cont7685
bge_else7684:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 32(r3)
	add	r31, r7, r5
	stw	r6, 0(r31)
bge_cont7685:
	lwz	r5, 44(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7686
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 40(r3)
	stfd	f0, 88(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	o_diffuse2724
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lfd	f1, 88(r3)
	fsub	f0, f1, f0
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r2, 24(r3)
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
	lwz	r5, 28(r3)
	lwz	r6, 8(r3)
	b	trace_ray2981
beq_else7686:
	blr
ble_else7670:
	blr
trace_diffuse_ray2987:
	stfd	f0, 0(r3)
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	judge_intersection_fast2958
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7689
	blr
beq_else7689:
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
	add	r31, r2, r5
	lwz	r2, 0(r31)
	lwz	r5, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec2761
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	get_nvector2966
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
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
	bne	cr7, beq_else7691
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
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	veciprod2675
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	fneg	f0, f0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7692
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	ble_cont7693
ble_else7692:
ble_cont7693:
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lfd	f1, 0(r3)
	fmul	f0, f1, f0
	lwz	r5, 12(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_diffuse2724
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f1, 24(r3)
	fmul	f0, f1, f0
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lwz	r2, 16(r3)
	b	vecaccum2683
beq_else7691:
	blr
iter_trace_diffuse_rays2990:
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else7696
	slwi	r8, r7, 2
	add	r31, r2, r8
	lwz	r8, 0(r31)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stw	r7, 8(r3)
	stw	r5, 12(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	d_vec2761
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	veciprod2675
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7697
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r31, lo16(l6073)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6073)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6073)
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
	b	ble_cont7698
ble_else7697:
	lwz	r2, 8(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r31, lo16(l6071)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6071)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6071)
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
ble_cont7698:
	lwz	r2, 8(r3)
	subi	r7, r2, 2
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	b	iter_trace_diffuse_rays2990
bge_else7696:
	blr
trace_diffuse_rays2995:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_startp2895
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 8(r3)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	iter_trace_diffuse_rays2990
trace_diffuse_ray_80percent2999:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7700
	b	beq_cont7701
beq_else7700:
	lis	r7, lo16(min_caml_dirvecs)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_dirvecs)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_dirvecs)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	mflr	r31
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_diffuse_rays2995
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7701:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7702
	b	beq_cont7703
beq_else7702:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	lwz	r6, 4(r3)
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	mr	r6, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_diffuse_rays2995
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7703:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7704
	b	beq_cont7705
beq_else7704:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 8(r5)
	lwz	r6, 4(r3)
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	mr	r6, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_diffuse_rays2995
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7705:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7706
	b	beq_cont7707
beq_else7706:
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r5, 12(r5)
	lwz	r6, 4(r3)
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	mr	r6, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	trace_diffuse_rays2995
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7707:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else7708
	blr
beq_else7708:
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_diffuse_rays2995
calc_diffuse_using_1point3003:
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_received_ray_20percent2752
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_nvectors2759
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_intersection_points2744
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_energy2750
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	lwz	r8, 8(r3)
	add	r31, r8, r7
	lwz	r7, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	veccpy2664
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_group_id2754
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	slwi	r7, r5, 2
	lwz	r8, 16(r3)
	add	r31, r8, r7
	lwz	r7, 0(r31)
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 20(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	b	vecaccumv2696
calc_diffuse_using_5points3006:
	slwi	r9, r2, 2
	add	r31, r5, r9
	lwz	r5, 0(r31)
	stw	r8, 0(r3)
	stw	r7, 4(r3)
	stw	r6, 8(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_received_ray_20percent2752
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	subi	r6, r5, 1
	slwi	r6, r6, 2
	lwz	r7, 8(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	stw	r2, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_received_ray_20percent2752
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 8(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_received_ray_20percent2752
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	addi	r6, r5, 1
	slwi	r6, r6, 2
	lwz	r7, 8(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_received_ray_20percent2752
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_received_ray_20percent2752
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	lwz	r8, 16(r3)
	add	r31, r8, r7
	lwz	r7, 0(r31)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veccpy2664
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 20(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecadd2687
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 24(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecadd2687
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 28(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecadd2687
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	lwz	r7, 32(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	mflr	r31
	mr	r5, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecadd2687
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	slwi	r2, r2, 2
	lwz	r5, 8(r3)
	add	r31, r5, r2
	lwz	r2, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_energy2750
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	lwz	r6, 0(r3)
	slwi	r6, r6, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	b	vecaccumv2696
do_without_neighbors3012:
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else7710
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_surface_ids2746
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7711
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_calc_diffuse2748
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7712
	b	beq_cont7713
beq_else7712:
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7713:
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else7711:
	blr
ble_else7710:
	blr
neighbors_exist3015:
	lis	r6, lo16(min_caml_image_size)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_size)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_size)
	lwz	r6, 0(r6)
	lwz	r6, 4(r6)
	addi	r7, r5, 1
	cmpw	cr7, r6, r7
	bgt	cr7, ble_else7716
	li	r2, 0
	blr
ble_else7716:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else7717
	li	r2, 0
	blr
ble_else7717:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	addi	r6, r2, 1
	cmpw	cr7, r5, r6
	bgt	cr7, ble_else7718
	li	r2, 0
	blr
ble_else7718:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else7719
	li	r2, 0
	blr
ble_else7719:
	li	r2, 1
	blr
get_surface_id3019:
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	p_surface_ids2746
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	blr
neighbors_are_available3022:
	slwi	r9, r2, 2
	add	r31, r6, r9
	lwz	r9, 0(r31)
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
	bl	get_surface_id3019
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	lwz	r7, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7720
	lwz	r2, 16(r3)
	slwi	r6, r2, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	lwz	r7, 8(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7721
	lwz	r2, 16(r3)
	subi	r6, r2, 1
	slwi	r6, r6, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
	lwz	r8, 8(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7722
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	slwi	r2, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r2
	lwz	r2, 0(r31)
	lwz	r6, 8(r3)
	mflr	r31
	mr	r5, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7723
	li	r2, 1
	blr
beq_else7723:
	li	r2, 0
	blr
beq_else7722:
	li	r2, 0
	blr
beq_else7721:
	li	r2, 0
	blr
beq_else7720:
	li	r2, 0
	blr
try_exploit_neighbors3028:
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else7724
	stw	r5, 0(r3)
	stw	r10, 4(r3)
	stw	r9, 8(r3)
	stw	r8, 12(r3)
	stw	r7, 16(r3)
	stw	r6, 20(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7725
	lwz	r2, 24(r3)
	lwz	r5, 20(r3)
	lwz	r6, 16(r3)
	lwz	r7, 12(r3)
	lwz	r8, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	neighbors_are_available3022
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7726
	lwz	r2, 24(r3)
	slwi	r2, r2, 2
	lwz	r5, 16(r3)
	add	r31, r5, r2
	lwz	r2, 0(r31)
	lwz	r5, 8(r3)
	b	do_without_neighbors3012
beq_else7726:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_calc_diffuse2748
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r8, 8(r3)
	slwi	r5, r8, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7727
	b	beq_cont7728
beq_else7727:
	lwz	r2, 24(r3)
	lwz	r5, 20(r3)
	lwz	r6, 16(r3)
	lwz	r7, 12(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont7728:
	lwz	r2, 8(r3)
	addi	r9, r2, 1
	lwz	r2, 24(r3)
	lwz	r5, 0(r3)
	lwz	r6, 20(r3)
	lwz	r7, 16(r3)
	lwz	r8, 12(r3)
	b	try_exploit_neighbors3028
bge_else7725:
	blr
ble_else7724:
	blr
write_ppm_header3035:
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
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
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
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	li	r2, 255
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
write_rgb_element3037:
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else7732
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7734
	b	bge_cont7735
bge_else7734:
	li	r2, 0
bge_cont7735:
	b	ble_cont7733
ble_else7732:
	li	r2, 255
ble_cont7733:
	b	min_caml_print_int
write_rgb3039:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element3037
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
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element3037
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
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	write_rgb_element3037
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	blr
pretrace_diffuse_rays3041:
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else7737
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	get_surface_id3019
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7738
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_calc_diffuse2748
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7739
	b	beq_cont7740
beq_else7739:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_group_id2754
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_diffuse_ray)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_diffuse_ray)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_diffuse_ray)
	lwz	r5, 0(r5)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	vecbzero2662
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	p_nvectors2759
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_intersection_points2744
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	lwz	r6, 8(r3)
	slwi	r6, r6, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	lwz	r8, 12(r3)
	add	r31, r8, r7
	lwz	r7, 0(r31)
	slwi	r8, r6, 2
	add	r31, r2, r8
	lwz	r2, 0(r31)
	mflr	r31
	mr	r6, r2
	mr	r2, r5
	mr	r5, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_rays2995
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	p_received_ray_20percent2752
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 0(r3)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r5, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	veccpy2664
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont7740:
	lwz	r2, 0(r3)
	addi	r5, r2, 1
	lwz	r2, 4(r3)
	b	pretrace_diffuse_rays3041
bge_else7738:
	blr
ble_else7737:
	blr
pretrace_pixels3044:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7743
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
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecbzero2662
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
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
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veccpy2664
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 0
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
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
	add	r31, r8, r7
	lwz	r7, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_rgb2742
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veccpy2664
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	slwi	r5, r2, 2
	lwz	r6, 28(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	p_set_group_id2756
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	slwi	r5, r2, 2
	lwz	r6, 28(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r7, 0
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	pretrace_diffuse_rays3041
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	subi	r2, r2, 1
	li	r5, 1
	lwz	r6, 24(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	add_mod52651
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r6, r2
	mtlr	r31
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 28(r3)
	lwz	r5, 36(r3)
	b	pretrace_pixels3044
bge_else7743:
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
	bgt	cr7, ble_else7745
	blr
ble_else7745:
	lis	r9, lo16(min_caml_rgb)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_rgb)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_rgb)
	lwz	r9, 0(r9)
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	stw	r6, 0(r3)
	stw	r7, 4(r3)
	stw	r8, 8(r3)
	stw	r5, 12(r3)
	stw	r2, 16(r3)
	stw	r9, 20(r3)
	mflr	r31
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	p_rgb2742
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	veccpy2664
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	lwz	r5, 12(r3)
	lwz	r6, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	neighbors_exist3015
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7747
	lwz	r2, 16(r3)
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r7, 0
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont7748
beq_else7747:
	li	r9, 0
	lwz	r2, 16(r3)
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	lwz	r7, 4(r3)
	lwz	r8, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	try_exploit_neighbors3028
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont7748:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	write_rgb3039
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	lwz	r7, 4(r3)
	lwz	r8, 8(r3)
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
	bgt	cr7, ble_else7749
	blr
ble_else7749:
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
	stw	r6, 8(r3)
	stw	r5, 12(r3)
	stw	r2, 16(r3)
	cmpw	cr7, r9, r2
	bgt	cr7, ble_else7751
	b	ble_cont7752
ble_else7751:
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
ble_cont7752:
	li	r2, 0
	lwz	r5, 16(r3)
	lwz	r6, 12(r3)
	lwz	r7, 8(r3)
	lwz	r8, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	scan_pixel3055
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	li	r5, 2
	lwz	r6, 0(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	add_mod52651
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r8, r2
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	lwz	r7, 12(r3)
	b	scan_line3061
create_float5x3array3067:
	li	r2, 3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
create_pixel3069:
	li	r2, 3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	bl	create_float5x3array3067
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
	bl	create_float5x3array3067
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	create_float5x3array3067
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
	bl	create_float5x3array3067
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
init_line_elements3071:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7753
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixel3069
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3071
bge_else7753:
	blr
create_pixelline3074:
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
	b	init_line_elements3071
tan3076:
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
adjust_position3078:
	fmul	f0, f0, f0
	lis	r31, lo16(l6055)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6055)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6055)
	lfd	f2, 0(r31)
	fadd	f0, f0, f2
	fsqrt	f0, f0
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
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
	bl	tan3076
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 0(r3)
	fmul	f0, f0, f1
	blr
calc_dirvec3081:
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else7754
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f2, f2, f3
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f3, 0(r31)
	fadd	f2, f2, f3
	fsqrt	f2, f2
	fdiv	f0, f0, f2
	fdiv	f1, f1, f2
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f3, 0(r31)
	fdiv	f2, f3, f2
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	slwi	r5, r6, 2
	add	r31, r2, r5
	lwz	r5, 0(r31)
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stfd	f2, 8(r3)
	stfd	f1, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 24(r3)
	lfd	f1, 16(r3)
	lfd	f2, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	vecset2654
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 40
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
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
	bl	vecset2654
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 80
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
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
	bl	vecset2654
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
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
	bl	vecset2654
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r5, r2, 41
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
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
	bl	vecset2654
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	addi	r2, r2, 81
	slwi	r2, r2, 2
	lwz	r5, 0(r3)
	add	r31, r5, r2
	lwz	r2, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	d_vec2761
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lfd	f0, 8(r3)
	fneg	f0, f0
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	b	vecset2654
bge_else7754:
	stfd	f2, 32(r3)
	stw	r6, 4(r3)
	stw	r5, 40(r3)
	stfd	f3, 48(r3)
	stw	r2, 56(r3)
	mflr	r31
	fmr	f0, f1
	fmr	f1, f2
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	adjust_position3078
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
	bl	adjust_position3078
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
	b	calc_dirvec3081
calc_dirvecs3089:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7757
	itof	f1, r2
	lis	r31, lo16(l6167)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6167)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6167)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l6168)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6168)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6168)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r7, 0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	lis	r31, lo16(l6167)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6167)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6167)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l6055)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6055)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6055)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
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
	li	r5, 1
	lwz	r6, 8(r3)
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	add_mod52651
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mr	r5, r2
	mtlr	r31
	lfd	f0, 0(r3)
	lwz	r2, 20(r3)
	lwz	r6, 12(r3)
	b	calc_dirvecs3089
bge_else7757:
	blr
calc_dirvec_rows3094:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7759
	itof	f0, r2
	lis	r31, lo16(l6167)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6167)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6167)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l6168)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6168)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6168)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	li	r7, 4
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	calc_dirvecs3089
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	subi	r2, r2, 1
	li	r5, 2
	lwz	r6, 4(r3)
	stw	r2, 12(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	add_mod52651
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r6, r2, 4
	lwz	r2, 12(r3)
	b	calc_dirvec_rows3094
bge_else7759:
	blr
create_dirvec3098:
	li	r2, 3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 0(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	blr
create_dirvec_elements3100:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7761
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_dirvec3098
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	create_dirvec_elements3100
bge_else7761:
	blr
create_dirvecs3103:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7763
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_dirvec3098
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
	lwz	r5, 4(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
	li	r6, 118
	mflr	r31
	mr	r5, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_dirvec_elements3100
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	b	create_dirvecs3103
bge_else7763:
	blr
init_dirvec_constants3105:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7765
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r6, 0(r31)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_dirvec_constants2890
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	b	init_dirvec_constants3105
bge_else7765:
	blr
init_vecset_constants3108:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7767
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	li	r6, 119
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	init_dirvec_constants3105
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	b	init_vecset_constants3108
bge_else7767:
	blr
init_dirvecs3110:
	li	r2, 4
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_dirvecs3103
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 9
	li	r5, 0
	li	r6, 0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	calc_dirvec_rows3094
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 4
	b	init_vecset_constants3108
add_reflection3112:
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	stfd	f0, 8(r3)
	stfd	f3, 16(r3)
	stfd	f2, 24(r3)
	stfd	f1, 32(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	create_dirvec3098
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	d_vec2761
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	vecset2654
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_dirvec_constants2890
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
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
	lwz	r6, 40(r3)
	stw	r6, 4(r5)
	lwz	r6, 4(r3)
	stw	r6, 0(r5)
	lwz	r6, 0(r3)
	slwi	r6, r6, 2
	add	r31, r2, r6
	stw	r5, 0(r31)
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
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	stw	r6, 0(r3)
	stw	r2, 4(r3)
	stfd	f0, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_diffuse2724
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fneg	f1, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fneg	f2, f2
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fneg	f3, f3
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lis	r6, lo16(min_caml_light)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_light)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_light)
	lwz	r6, 0(r6)
	lfd	f4, 0(r6)
	lwz	r6, 0(r3)
	stfd	f2, 16(r3)
	stfd	f3, 24(r3)
	stfd	f1, 32(r3)
	stfd	f0, 40(r3)
	mflr	r31
	mr	r2, r6
	fmr	f1, f4
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	add_reflection3112
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 1
	lwz	r6, 4(r3)
	addi	r7, r6, 2
	lis	r8, lo16(min_caml_light)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_light)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_light)
	lwz	r8, 0(r8)
	lfd	f2, 4(r8)
	lfd	f0, 40(r3)
	lfd	f1, 32(r3)
	lfd	f3, 24(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	add_reflection3112
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	addi	r5, r2, 2
	lwz	r6, 4(r3)
	addi	r6, r6, 3
	lis	r7, lo16(min_caml_light)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_light)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_light)
	lwz	r7, 0(r7)
	lfd	f3, 8(r7)
	lfd	f0, 40(r3)
	lfd	f1, 32(r3)
	lfd	f2, 16(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	add_reflection3112
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
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
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	stw	r2, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stfd	f0, 16(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	o_diffuse2724
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	stfd	f0, 24(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_abc2716
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	veciprod2675
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
	lfd	f1, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 40(r3)
	stfd	f1, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	o_param_a2710
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lfd	f1, 48(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f2, 0(r2)
	fsub	f0, f0, f2
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
	lfd	f2, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 56(r3)
	stfd	f2, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b2712
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fsub	f0, f0, f2
	lis	r31, lo16(l5718)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5718)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5718)
	lfd	f2, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 72(r3)
	stfd	f2, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_param_c2714
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fmul	f0, f1, f0
	lfd	f1, 40(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 8(r2)
	fsub	f3, f0, f1
	lfd	f0, 24(r3)
	lfd	f1, 56(r3)
	lfd	f2, 72(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	add_reflection3112
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	addi	r5, r5, 1
	stw	r5, 0(r2)
	blr
setup_reflections3125:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7774
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_reflectiontype2704
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7775
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_diffuse2724
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7776
	blr
ble_else7776:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_form2702
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7778
	lwz	r2, 0(r3)
	lwz	r5, 4(r3)
	b	setup_rect_reflection3119
beq_else7778:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7779
	lwz	r2, 0(r3)
	lwz	r5, 4(r3)
	b	setup_surface_reflection3122
beq_else7779:
	blr
beq_else7775:
	blr
bge_else7774:
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
	lis	r31, lo16(l6201)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6201)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6201)
	lfd	f0, 0(r31)
	itof	f1, r2
	fdiv	f0, f0, f1
	stfd	f0, 0(r5)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixelline3074
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixelline3074
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	create_pixelline3074
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_parameter2792
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	write_ppm_header3035
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	init_dirvecs3110
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light_dirvec)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light_dirvec)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light_dirvec)
	lwz	r2, 0(r2)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	d_vec2761
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_light)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_light)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_light)
	lwz	r5, 0(r5)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	veccpy2664
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light_dirvec)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light_dirvec)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light_dirvec)
	lwz	r2, 0(r2)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_dirvec_constants2890
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	setup_reflections3125
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 0
	li	r6, 0
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	pretrace_line3051
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 0
	li	r8, 2
	lwz	r5, 0(r3)
	lwz	r6, 4(r3)
	lwz	r7, 8(r3)
	b	scan_line3061
min_caml_fin: