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
l21780:
	1124073472
l21397:
	1063675494
l21396:
	1045220557
l20455:
	1125515264
l20399:
	-1021968384
l20312:
	1036831949
l20193:
	-1073741824
l20179:
	998244352
l20038:
	1287568416
l20034:
	1315859240
l20014:
	1101004800
l20013:
	1028443341
l20007:
	1048576000
l20003:
	1092616192
l19997:
	1050253722
l19996:
	1132396544
l19995:
	1041865114
l19991:
	1078530011
l19990:
	1106247680
l19989:
	1097859072
l19988:
	953267991
l19563:
	-1110651699
l19503:
	1008981770
l19502:
	-1102263091
l19111:
	1056964608
l18965:
	1065353216
l18964:
	-1082130432
l18927:
	1073741824
l18900:
	0
l18896:
	-1018691584
l18894:
	1128792064
l18893:
	1016003125
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
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
	lis	r31, lo16(l18894)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18894)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18894)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	stfd	f2, 0(r2)
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lis	r31, lo16(l18896)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18896)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18896)
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
	lis	r31, lo16(l18894)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18894)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18894)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	bne	cr7, beq_else24491
	li	r2, 0
	blr
beq_else24491:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24492
	li	r5, 0
	b	ble_cont24493
ble_else24492:
	li	r5, 1
ble_cont24493:
	li	r6, 2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	bne	cr7, beq_else24494
	b	beq_cont24495
beq_else24494:
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont24495:
	lwz	r6, 12(r3)
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else24496
	li	r7, 1
	b	beq_cont24497
beq_else24496:
	lwz	r7, 28(r3)
beq_cont24497:
	li	r8, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r9, r10
	stw	r5, 0(r31)
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else24498
	lfd	f0, 0(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24500
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont24501
beq_else24500:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24502
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	b	beq_cont24503
beq_else24502:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24504
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f1, 0(r31)
	b	ble_cont24505
ble_else24504:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
ble_cont24505:
beq_cont24503:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont24501:
	stfd	f0, 0(r6)
	lfd	f0, 4(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24506
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont24507
beq_else24506:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24508
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	b	beq_cont24509
beq_else24508:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24510
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f1, 0(r31)
	b	ble_cont24511
ble_else24510:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
ble_cont24511:
beq_cont24509:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont24507:
	stfd	f0, 4(r6)
	lfd	f0, 8(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24512
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont24513
beq_else24512:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24514
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	b	beq_cont24515
beq_else24514:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24516
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f1, 0(r31)
	b	ble_cont24517
ble_else24516:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
ble_cont24517:
beq_cont24515:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont24513:
	stfd	f0, 8(r6)
	b	beq_cont24499
beq_else24498:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else24518
	lwz	r5, 28(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24520
	li	r5, 1
	b	beq_cont24521
beq_else24520:
	li	r5, 0
beq_cont24521:
	lfd	f0, 0(r6)
	lfd	f1, 0(r6)
	fmul	f0, f0, f1
	lfd	f1, 4(r6)
	lfd	f2, 4(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r6)
	lfd	f2, 8(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24522
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	b	beq_cont24523
beq_else24522:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24524
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont24525
beq_else24524:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont24525:
beq_cont24523:
	lfd	f1, 0(r6)
	fmul	f1, f1, f0
	stfd	f1, 0(r6)
	lfd	f1, 4(r6)
	fmul	f1, f1, f0
	stfd	f1, 4(r6)
	lfd	f1, 8(r6)
	fmul	f0, f1, f0
	stfd	f0, 8(r6)
	b	beq_cont24519
beq_else24518:
beq_cont24519:
beq_cont24499:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24526
	b	beq_cont24527
beq_else24526:
	mflr	r31
	mr	r5, r2
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rotate_quadratic_matrix2777
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont24527:
	li	r2, 1
	blr
read_object2782:
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24528
	blr
bge_else24528:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object2780
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24530
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
beq_else24530:
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24532
	blr
bge_else24532:
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object2780
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24534
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	blr
beq_else24534:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24536
	blr
bge_else24536:
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object2780
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24538
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else24538:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24540
	blr
bge_else24540:
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_nth_object2780
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24542
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
	blr
beq_else24542:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24544
	blr
bge_else24544:
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_nth_object2780
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24546
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 16(r3)
	stw	r5, 0(r2)
	blr
beq_else24546:
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24548
	blr
bge_else24548:
	stw	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_nth_object2780
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24550
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 20(r3)
	stw	r5, 0(r2)
	blr
beq_else24550:
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24552
	blr
bge_else24552:
	stw	r2, 24(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	read_nth_object2780
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24554
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 24(r3)
	stw	r5, 0(r2)
	blr
beq_else24554:
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else24556
	blr
bge_else24556:
	stw	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_nth_object2780
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24558
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 28(r3)
	stw	r5, 0(r2)
	blr
beq_else24558:
	lwz	r2, 28(r3)
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
	bne	cr7, beq_else24560
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else24560:
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
	bne	cr7, beq_else24561
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
	b	beq_cont24562
beq_else24561:
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
	bne	cr7, beq_else24563
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
	b	beq_cont24564
beq_else24563:
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
	bne	cr7, beq_else24565
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
	b	beq_cont24566
beq_else24565:
	addi	r12, r10, 1
	in	r13
	slwi	r13, r13, 8
	in	r13
	slwi	r13, r13, 8
	in	r13
	slwi	r13, r13, 8
	in	r13
	stw	r11, 24(r3)
	stw	r10, 28(r3)
	cmpwi	cr7, r13, -1
	bne	cr7, beq_else24567
	addi	r12, r12, 1
	li	r13, -1
	mflr	r31
	mr	r5, r13
	mr	r2, r12
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	beq_cont24568
beq_else24567:
	addi	r14, r12, 1
	in	r15
	slwi	r15, r15, 8
	in	r15
	slwi	r15, r15, 8
	in	r15
	slwi	r15, r15, 8
	in	r15
	stw	r13, 32(r3)
	stw	r12, 36(r3)
	cmpwi	cr7, r15, -1
	bne	cr7, beq_else24569
	addi	r14, r14, 1
	li	r15, -1
	mflr	r31
	mr	r5, r15
	mr	r2, r14
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont24570
beq_else24569:
	addi	r16, r14, 1
	in	r17
	slwi	r17, r17, 8
	in	r17
	slwi	r17, r17, 8
	in	r17
	slwi	r17, r17, 8
	in	r17
	stw	r15, 40(r3)
	stw	r14, 44(r3)
	cmpwi	cr7, r17, -1
	bne	cr7, beq_else24571
	addi	r16, r16, 1
	li	r17, -1
	mflr	r31
	mr	r5, r17
	mr	r2, r16
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont24572
beq_else24571:
	addi	r18, r16, 1
	in	r19
	slwi	r19, r19, 8
	in	r19
	slwi	r19, r19, 8
	in	r19
	slwi	r19, r19, 8
	in	r19
	stw	r17, 48(r3)
	stw	r16, 52(r3)
	cmpwi	cr7, r19, -1
	bne	cr7, beq_else24573
	addi	r18, r18, 1
	li	r19, -1
	mflr	r31
	mr	r5, r19
	mr	r2, r18
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont24574
beq_else24573:
	addi	r20, r18, 1
	stw	r19, 56(r3)
	stw	r18, 60(r3)
	mflr	r31
	mr	r2, r20
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	read_net_item2786
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 60(r3)
	slwi	r5, r5, 2
	lwz	r6, 56(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24574:
	lwz	r5, 52(r3)
	slwi	r5, r5, 2
	lwz	r6, 48(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24572:
	lwz	r5, 44(r3)
	slwi	r5, r5, 2
	lwz	r6, 40(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24570:
	lwz	r5, 36(r3)
	slwi	r5, r5, 2
	lwz	r6, 32(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24568:
	lwz	r5, 28(r3)
	slwi	r5, r5, 2
	lwz	r6, 24(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24566:
	lwz	r5, 20(r3)
	slwi	r5, r5, 2
	lwz	r6, 16(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24564:
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwz	r6, 8(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24562:
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
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
	bne	cr7, beq_else24575
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
	b	beq_cont24576
beq_else24575:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 4(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24577
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
	b	beq_cont24578
beq_else24577:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 8(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24579
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
	b	beq_cont24580
beq_else24579:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 12(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24581
	li	r8, 4
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
	b	beq_cont24582
beq_else24581:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 16(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24583
	li	r9, 5
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont24584
beq_else24583:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 20(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24585
	li	r10, 6
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
	b	beq_cont24586
beq_else24585:
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	stw	r10, 24(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else24587
	li	r11, 7
	li	r12, -1
	mflr	r31
	mr	r5, r12
	mr	r2, r11
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont24588
beq_else24587:
	li	r12, 7
	stw	r11, 28(r3)
	mflr	r31
	mr	r2, r12
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r5, 24(r2)
beq_cont24588:
	lwz	r5, 24(r3)
	stw	r5, 20(r2)
beq_cont24586:
	lwz	r5, 20(r3)
	stw	r5, 16(r2)
beq_cont24584:
	lwz	r5, 16(r3)
	stw	r5, 12(r2)
beq_cont24582:
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
beq_cont24580:
	lwz	r5, 8(r3)
	stw	r5, 4(r2)
beq_cont24578:
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont24576:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else24589
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else24589:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r5, 32(r3)
	stw	r6, 36(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24590
	li	r7, 1
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont24591
beq_else24590:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 40(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24592
	li	r8, 2
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont24593
beq_else24592:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 44(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24594
	li	r9, 3
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont24595
beq_else24594:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 48(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24596
	li	r10, 4
	li	r11, -1
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont24597
beq_else24596:
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	stw	r10, 52(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else24598
	li	r11, 5
	li	r12, -1
	mflr	r31
	mr	r5, r12
	mr	r2, r11
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont24599
beq_else24598:
	in	r12
	slwi	r12, r12, 8
	in	r12
	slwi	r12, r12, 8
	in	r12
	slwi	r12, r12, 8
	in	r12
	stw	r11, 56(r3)
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else24600
	li	r12, 6
	li	r13, -1
	mflr	r31
	mr	r5, r13
	mr	r2, r12
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont24601
beq_else24600:
	li	r13, 6
	stw	r12, 60(r3)
	mflr	r31
	mr	r2, r13
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	read_net_item2786
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 60(r3)
	stw	r5, 20(r2)
beq_cont24601:
	lwz	r5, 56(r3)
	stw	r5, 16(r2)
beq_cont24599:
	lwz	r5, 52(r3)
	stw	r5, 12(r2)
beq_cont24597:
	lwz	r5, 48(r3)
	stw	r5, 8(r2)
beq_cont24595:
	lwz	r5, 44(r3)
	stw	r5, 4(r2)
beq_cont24593:
	lwz	r5, 40(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont24591:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else24602
	lwz	r2, 36(r3)
	addi	r2, r2, 1
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	beq_cont24603
beq_else24602:
	lwz	r2, 36(r3)
	addi	r6, r2, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r5, 64(r3)
	stw	r6, 68(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24604
	li	r7, 1
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont24605
beq_else24604:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 72(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24606
	li	r8, 2
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont24607
beq_else24606:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 76(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24608
	li	r9, 3
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	b	beq_cont24609
beq_else24608:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 80(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24610
	li	r10, 4
	li	r11, -1
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	b	beq_cont24611
beq_else24610:
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	stw	r10, 84(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else24612
	li	r11, 5
	li	r12, -1
	mflr	r31
	mr	r5, r12
	mr	r2, r11
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont24613
beq_else24612:
	li	r12, 5
	stw	r11, 88(r3)
	mflr	r31
	mr	r2, r12
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	read_net_item2786
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r5, 88(r3)
	stw	r5, 16(r2)
beq_cont24613:
	lwz	r5, 84(r3)
	stw	r5, 12(r2)
beq_cont24611:
	lwz	r5, 80(r3)
	stw	r5, 8(r2)
beq_cont24609:
	lwz	r5, 76(r3)
	stw	r5, 4(r2)
beq_cont24607:
	lwz	r5, 72(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont24605:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else24614
	lwz	r2, 68(r3)
	addi	r2, r2, 1
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont24615
beq_else24614:
	lwz	r2, 68(r3)
	addi	r6, r2, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r5, 92(r3)
	stw	r6, 96(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24616
	li	r7, 1
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont24617
beq_else24616:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 100(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24618
	li	r8, 2
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	beq_cont24619
beq_else24618:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 104(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24620
	li	r9, 3
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	beq_cont24621
beq_else24620:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 108(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24622
	li	r10, 4
	li	r11, -1
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	b	beq_cont24623
beq_else24622:
	li	r11, 4
	stw	r10, 112(r3)
	mflr	r31
	mr	r2, r11
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	read_net_item2786
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r5, 112(r3)
	stw	r5, 12(r2)
beq_cont24623:
	lwz	r5, 108(r3)
	stw	r5, 8(r2)
beq_cont24621:
	lwz	r5, 104(r3)
	stw	r5, 4(r2)
beq_cont24619:
	lwz	r5, 100(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont24617:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else24624
	lwz	r2, 96(r3)
	addi	r2, r2, 1
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	b	beq_cont24625
beq_else24624:
	lwz	r2, 96(r3)
	addi	r6, r2, 1
	stw	r5, 116(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	read_or_network2788
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r5, 96(r3)
	slwi	r5, r5, 2
	lwz	r6, 116(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24625:
	lwz	r5, 68(r3)
	slwi	r5, r5, 2
	lwz	r6, 92(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24615:
	lwz	r5, 36(r3)
	slwi	r5, r5, 2
	lwz	r6, 64(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont24603:
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 32(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
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
	bne	cr7, beq_else24626
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
	b	beq_cont24627
beq_else24626:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 4(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24628
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
	b	beq_cont24629
beq_else24628:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 8(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24630
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
	b	beq_cont24631
beq_else24630:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 12(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24632
	li	r8, 4
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
	b	beq_cont24633
beq_else24632:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 16(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24634
	li	r9, 5
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont24635
beq_else24634:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 20(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24636
	li	r10, 6
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
	b	beq_cont24637
beq_else24636:
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	slwi	r11, r11, 8
	in	r11
	stw	r10, 24(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else24638
	li	r11, 7
	li	r12, -1
	mflr	r31
	mr	r5, r12
	mr	r2, r11
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont24639
beq_else24638:
	li	r12, 7
	stw	r11, 28(r3)
	mflr	r31
	mr	r2, r12
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	read_net_item2786
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	stw	r5, 24(r2)
beq_cont24639:
	lwz	r5, 24(r3)
	stw	r5, 20(r2)
beq_cont24637:
	lwz	r5, 20(r3)
	stw	r5, 16(r2)
beq_cont24635:
	lwz	r5, 16(r3)
	stw	r5, 12(r2)
beq_cont24633:
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
beq_cont24631:
	lwz	r5, 8(r3)
	stw	r5, 4(r2)
beq_cont24629:
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
beq_cont24627:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24640
	blr
beq_else24640:
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
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 32(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24642
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
	b	beq_cont24643
beq_else24642:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 36(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24644
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont24645
beq_else24644:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 40(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24646
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	b	beq_cont24647
beq_else24646:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 44(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24648
	li	r8, 4
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont24649
beq_else24648:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 48(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24650
	li	r9, 5
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont24651
beq_else24650:
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	slwi	r10, r10, 8
	in	r10
	stw	r9, 52(r3)
	cmpwi	cr7, r10, -1
	bne	cr7, beq_else24652
	li	r10, 6
	li	r11, -1
	mflr	r31
	mr	r5, r11
	mr	r2, r10
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont24653
beq_else24652:
	li	r11, 6
	stw	r10, 56(r3)
	mflr	r31
	mr	r2, r11
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	read_net_item2786
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 56(r3)
	stw	r5, 20(r2)
beq_cont24653:
	lwz	r5, 52(r3)
	stw	r5, 16(r2)
beq_cont24651:
	lwz	r5, 48(r3)
	stw	r5, 12(r2)
beq_cont24649:
	lwz	r5, 44(r3)
	stw	r5, 8(r2)
beq_cont24647:
	lwz	r5, 40(r3)
	stw	r5, 4(r2)
beq_cont24645:
	lwz	r5, 36(r3)
	stw	r5, 0(r2)
beq_cont24643:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24654
	blr
beq_else24654:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 32(r3)
	slwi	r7, r6, 2
	add	r31, r5, r7
	stw	r2, 0(r31)
	addi	r2, r6, 1
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 60(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24656
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	beq_cont24657
beq_else24656:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 64(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24658
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	beq_cont24659
beq_else24658:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 68(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24660
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont24661
beq_else24660:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 72(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24662
	li	r8, 4
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont24663
beq_else24662:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 76(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else24664
	li	r9, 5
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	b	beq_cont24665
beq_else24664:
	li	r10, 5
	stw	r9, 80(r3)
	mflr	r31
	mr	r2, r10
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	read_net_item2786
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 80(r3)
	stw	r5, 16(r2)
beq_cont24665:
	lwz	r5, 76(r3)
	stw	r5, 12(r2)
beq_cont24663:
	lwz	r5, 72(r3)
	stw	r5, 8(r2)
beq_cont24661:
	lwz	r5, 68(r3)
	stw	r5, 4(r2)
beq_cont24659:
	lwz	r5, 64(r3)
	stw	r5, 0(r2)
beq_cont24657:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24666
	blr
beq_else24666:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 60(r3)
	slwi	r7, r6, 2
	add	r31, r5, r7
	stw	r2, 0(r31)
	addi	r2, r6, 1
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 84(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24668
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont24669
beq_else24668:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 88(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24670
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont24671
beq_else24670:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 92(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else24672
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	b	beq_cont24673
beq_else24672:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 96(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else24674
	li	r8, 4
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	b	beq_cont24675
beq_else24674:
	li	r9, 4
	stw	r8, 100(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	read_net_item2786
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lwz	r5, 100(r3)
	stw	r5, 12(r2)
beq_cont24675:
	lwz	r5, 96(r3)
	stw	r5, 8(r2)
beq_cont24673:
	lwz	r5, 92(r3)
	stw	r5, 4(r2)
beq_cont24671:
	lwz	r5, 88(r3)
	stw	r5, 0(r2)
beq_cont24669:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else24676
	blr
beq_else24676:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 84(r3)
	slwi	r7, r6, 2
	add	r31, r5, r7
	stw	r2, 0(r31)
	addi	r2, r6, 1
	b	read_and_network2790
solver_rect2803:
	lfd	f3, 0(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24678
	li	r6, 0
	b	beq_cont24679
beq_else24678:
	lwz	r6, 16(r2)
	lwz	r7, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 0(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24680
	li	r8, 0
	b	ble_cont24681
ble_else24680:
	li	r8, 1
ble_cont24681:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24682
	mr	r7, r8
	b	beq_cont24683
beq_else24682:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24684
	li	r7, 1
	b	beq_cont24685
beq_else24684:
	li	r7, 0
beq_cont24685:
beq_cont24683:
	lfd	f3, 0(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24686
	fneg	f3, f3
	b	beq_cont24687
beq_else24686:
beq_cont24687:
	fsub	f3, f3, f0
	lfd	f4, 0(r5)
	fdiv	f3, f3, f4
	lfd	f4, 4(r6)
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24688
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	fneg	f5, f5
	b	ble_cont24689
ble_else24688:
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
ble_cont24689:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24690
	li	r6, 0
	b	ble_cont24691
ble_else24690:
	lfd	f4, 8(r6)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24692
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24693
ble_else24692:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24693:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24694
	li	r6, 0
	b	ble_cont24695
ble_else24694:
	lis	r6, lo16(min_caml_solver_dist)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_solver_dist)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_solver_dist)
	lwz	r6, 0(r6)
	stfd	f3, 0(r6)
	li	r6, 1
ble_cont24695:
ble_cont24691:
beq_cont24679:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else24696
	lfd	f3, 4(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24697
	li	r6, 0
	b	beq_cont24698
beq_else24697:
	lwz	r6, 16(r2)
	lwz	r7, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 4(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24699
	li	r8, 0
	b	ble_cont24700
ble_else24699:
	li	r8, 1
ble_cont24700:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24701
	mr	r7, r8
	b	beq_cont24702
beq_else24701:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24703
	li	r7, 1
	b	beq_cont24704
beq_else24703:
	li	r7, 0
beq_cont24704:
beq_cont24702:
	lfd	f3, 4(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24705
	fneg	f3, f3
	b	beq_cont24706
beq_else24705:
beq_cont24706:
	fsub	f3, f3, f1
	lfd	f4, 4(r5)
	fdiv	f3, f3, f4
	lfd	f4, 8(r6)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24707
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24708
ble_else24707:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24708:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24709
	li	r6, 0
	b	ble_cont24710
ble_else24709:
	lfd	f4, 0(r6)
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24711
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	fneg	f5, f5
	b	ble_cont24712
ble_else24711:
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
ble_cont24712:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24713
	li	r6, 0
	b	ble_cont24714
ble_else24713:
	lis	r6, lo16(min_caml_solver_dist)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_solver_dist)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_solver_dist)
	lwz	r6, 0(r6)
	stfd	f3, 0(r6)
	li	r6, 1
ble_cont24714:
ble_cont24710:
beq_cont24698:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else24715
	lfd	f3, 8(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24716
	li	r2, 0
	b	beq_cont24717
beq_else24716:
	lwz	r6, 16(r2)
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 8(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24718
	li	r7, 0
	b	ble_cont24719
ble_else24718:
	li	r7, 1
ble_cont24719:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24720
	mr	r2, r7
	b	beq_cont24721
beq_else24720:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24722
	li	r2, 1
	b	beq_cont24723
beq_else24722:
	li	r2, 0
beq_cont24723:
beq_cont24721:
	lfd	f3, 8(r6)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24724
	fneg	f3, f3
	b	beq_cont24725
beq_else24724:
beq_cont24725:
	fsub	f2, f3, f2
	lfd	f3, 8(r5)
	fdiv	f2, f2, f3
	lfd	f3, 0(r6)
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f4, f4, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24726
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
	fneg	f0, f0
	b	ble_cont24727
ble_else24726:
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
ble_cont24727:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else24728
	li	r2, 0
	b	ble_cont24729
ble_else24728:
	lfd	f0, 4(r6)
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f3, f3, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24730
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
	fneg	f1, f1
	b	ble_cont24731
ble_else24730:
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
ble_cont24731:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24732
	li	r2, 0
	b	ble_cont24733
ble_else24732:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 1
ble_cont24733:
ble_cont24729:
beq_cont24717:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24734
	li	r2, 0
	blr
beq_else24734:
	li	r2, 3
	blr
beq_else24715:
	li	r2, 2
	blr
beq_else24696:
	li	r2, 1
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
	bne	cr7, beq_else24735
	fmr	f3, f6
	b	beq_cont24736
beq_else24735:
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
beq_cont24736:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24737
	li	r2, 0
	blr
beq_else24737:
	lfd	f4, 0(r5)
	lfd	f5, 4(r5)
	lfd	f6, 8(r5)
	fmul	f7, f4, f0
	lwz	r5, 16(r2)
	lfd	f8, 0(r5)
	fmul	f7, f7, f8
	fmul	f8, f5, f1
	lwz	r5, 16(r2)
	lfd	f9, 4(r5)
	fmul	f8, f8, f9
	fadd	f7, f7, f8
	fmul	f8, f6, f2
	lwz	r5, 16(r2)
	lfd	f9, 8(r5)
	fmul	f8, f8, f9
	fadd	f7, f7, f8
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24738
	fmr	f4, f7
	b	beq_cont24739
beq_else24738:
	fmul	f8, f6, f1
	fmul	f9, f5, f2
	fadd	f8, f8, f9
	lwz	r5, 36(r2)
	lfd	f9, 0(r5)
	fmul	f8, f8, f9
	fmul	f9, f4, f2
	fmul	f6, f6, f0
	fadd	f6, f9, f6
	lwz	r5, 36(r2)
	lfd	f9, 4(r5)
	fmul	f6, f6, f9
	fadd	f6, f8, f6
	fmul	f4, f4, f1
	fmul	f5, f5, f0
	fadd	f4, f4, f5
	lwz	r5, 36(r2)
	lfd	f5, 8(r5)
	fmul	f4, f4, f5
	fadd	f4, f6, f4
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	fadd	f4, f7, f4
beq_cont24739:
	fmul	f5, f0, f0
	lwz	r5, 16(r2)
	lfd	f6, 0(r5)
	fmul	f5, f5, f6
	fmul	f6, f1, f1
	lwz	r5, 16(r2)
	lfd	f7, 4(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f6, f2, f2
	lwz	r5, 16(r2)
	lfd	f7, 8(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24740
	fmr	f0, f5
	b	beq_cont24741
beq_else24740:
	fmul	f6, f1, f2
	lwz	r5, 36(r2)
	lfd	f7, 0(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f2, f2, f0
	lwz	r5, 36(r2)
	lfd	f6, 4(r5)
	fmul	f2, f2, f6
	fadd	f2, f5, f2
	fmul	f0, f0, f1
	lwz	r5, 36(r2)
	lfd	f1, 8(r5)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont24741:
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else24742
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24743
beq_else24742:
beq_cont24743:
	fmul	f1, f4, f4
	fmul	f0, f3, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24744
	li	r2, 0
	blr
ble_else24744:
	fsqrt	f0, f0
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24745
	fneg	f0, f0
	b	beq_cont24746
beq_else24745:
beq_cont24746:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsub	f0, f0, f4
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
	add	r31, r7, r2
	lwz	r2, 0(r31)
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
	bne	cr7, beq_else24747
	lfd	f3, 0(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24748
	li	r6, 0
	b	beq_cont24749
beq_else24748:
	lwz	r6, 16(r2)
	lwz	r7, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 0(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24750
	li	r8, 0
	b	ble_cont24751
ble_else24750:
	li	r8, 1
ble_cont24751:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24752
	mr	r7, r8
	b	beq_cont24753
beq_else24752:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24754
	li	r7, 1
	b	beq_cont24755
beq_else24754:
	li	r7, 0
beq_cont24755:
beq_cont24753:
	lfd	f3, 0(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24756
	fneg	f3, f3
	b	beq_cont24757
beq_else24756:
beq_cont24757:
	fsub	f3, f3, f0
	lfd	f4, 0(r5)
	fdiv	f3, f3, f4
	lfd	f4, 4(r6)
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24758
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	fneg	f5, f5
	b	ble_cont24759
ble_else24758:
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
ble_cont24759:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24760
	li	r6, 0
	b	ble_cont24761
ble_else24760:
	lfd	f4, 8(r6)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24762
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24763
ble_else24762:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24763:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24764
	li	r6, 0
	b	ble_cont24765
ble_else24764:
	lis	r6, lo16(min_caml_solver_dist)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_solver_dist)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_solver_dist)
	lwz	r6, 0(r6)
	stfd	f3, 0(r6)
	li	r6, 1
ble_cont24765:
ble_cont24761:
beq_cont24749:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else24766
	lfd	f3, 4(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24767
	li	r6, 0
	b	beq_cont24768
beq_else24767:
	lwz	r6, 16(r2)
	lwz	r7, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 4(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24769
	li	r8, 0
	b	ble_cont24770
ble_else24769:
	li	r8, 1
ble_cont24770:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24771
	mr	r7, r8
	b	beq_cont24772
beq_else24771:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24773
	li	r7, 1
	b	beq_cont24774
beq_else24773:
	li	r7, 0
beq_cont24774:
beq_cont24772:
	lfd	f3, 4(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24775
	fneg	f3, f3
	b	beq_cont24776
beq_else24775:
beq_cont24776:
	fsub	f3, f3, f1
	lfd	f4, 4(r5)
	fdiv	f3, f3, f4
	lfd	f4, 8(r6)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24777
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24778
ble_else24777:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24778:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24779
	li	r6, 0
	b	ble_cont24780
ble_else24779:
	lfd	f4, 0(r6)
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24781
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	fneg	f5, f5
	b	ble_cont24782
ble_else24781:
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
ble_cont24782:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24783
	li	r6, 0
	b	ble_cont24784
ble_else24783:
	lis	r6, lo16(min_caml_solver_dist)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_solver_dist)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_solver_dist)
	lwz	r6, 0(r6)
	stfd	f3, 0(r6)
	li	r6, 1
ble_cont24784:
ble_cont24780:
beq_cont24768:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else24785
	lfd	f3, 8(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24786
	li	r2, 0
	b	beq_cont24787
beq_else24786:
	lwz	r6, 16(r2)
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 8(r5)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24788
	li	r7, 0
	b	ble_cont24789
ble_else24788:
	li	r7, 1
ble_cont24789:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24790
	mr	r2, r7
	b	beq_cont24791
beq_else24790:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24792
	li	r2, 1
	b	beq_cont24793
beq_else24792:
	li	r2, 0
beq_cont24793:
beq_cont24791:
	lfd	f3, 8(r6)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24794
	fneg	f3, f3
	b	beq_cont24795
beq_else24794:
beq_cont24795:
	fsub	f2, f3, f2
	lfd	f3, 8(r5)
	fdiv	f2, f2, f3
	lfd	f3, 0(r6)
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f4, f4, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24796
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
	fneg	f0, f0
	b	ble_cont24797
ble_else24796:
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
ble_cont24797:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else24798
	li	r2, 0
	b	ble_cont24799
ble_else24798:
	lfd	f0, 4(r6)
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f3, f3, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24800
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
	fneg	f1, f1
	b	ble_cont24801
ble_else24800:
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
ble_cont24801:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24802
	li	r2, 0
	b	ble_cont24803
ble_else24802:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 1
ble_cont24803:
ble_cont24799:
beq_cont24787:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24804
	li	r2, 0
	blr
beq_else24804:
	li	r2, 3
	blr
beq_else24785:
	li	r2, 2
	blr
beq_else24766:
	li	r2, 1
	blr
beq_else24747:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else24805
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24806
	li	r2, 0
	blr
ble_else24806:
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
beq_else24805:
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
	bne	cr7, beq_else24807
	fmr	f3, f6
	b	beq_cont24808
beq_else24807:
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
beq_cont24808:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24809
	li	r2, 0
	blr
beq_else24809:
	lfd	f4, 0(r5)
	lfd	f5, 4(r5)
	lfd	f6, 8(r5)
	fmul	f7, f4, f0
	lwz	r5, 16(r2)
	lfd	f8, 0(r5)
	fmul	f7, f7, f8
	fmul	f8, f5, f1
	lwz	r5, 16(r2)
	lfd	f9, 4(r5)
	fmul	f8, f8, f9
	fadd	f7, f7, f8
	fmul	f8, f6, f2
	lwz	r5, 16(r2)
	lfd	f9, 8(r5)
	fmul	f8, f8, f9
	fadd	f7, f7, f8
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24810
	fmr	f4, f7
	b	beq_cont24811
beq_else24810:
	fmul	f8, f6, f1
	fmul	f9, f5, f2
	fadd	f8, f8, f9
	lwz	r5, 36(r2)
	lfd	f9, 0(r5)
	fmul	f8, f8, f9
	fmul	f9, f4, f2
	fmul	f6, f6, f0
	fadd	f6, f9, f6
	lwz	r5, 36(r2)
	lfd	f9, 4(r5)
	fmul	f6, f6, f9
	fadd	f6, f8, f6
	fmul	f4, f4, f1
	fmul	f5, f5, f0
	fadd	f4, f4, f5
	lwz	r5, 36(r2)
	lfd	f5, 8(r5)
	fmul	f4, f4, f5
	fadd	f4, f6, f4
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f5, 0(r31)
	fmul	f4, f4, f5
	fadd	f4, f7, f4
beq_cont24811:
	fmul	f5, f0, f0
	lwz	r5, 16(r2)
	lfd	f6, 0(r5)
	fmul	f5, f5, f6
	fmul	f6, f1, f1
	lwz	r5, 16(r2)
	lfd	f7, 4(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f6, f2, f2
	lwz	r5, 16(r2)
	lfd	f7, 8(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24812
	fmr	f0, f5
	b	beq_cont24813
beq_else24812:
	fmul	f6, f1, f2
	lwz	r5, 36(r2)
	lfd	f7, 0(r5)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f2, f2, f0
	lwz	r5, 36(r2)
	lfd	f6, 4(r5)
	fmul	f2, f2, f6
	fadd	f2, f5, f2
	fmul	f0, f0, f1
	lwz	r5, 36(r2)
	lfd	f1, 8(r5)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont24813:
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else24814
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24815
beq_else24814:
beq_cont24815:
	fmul	f1, f4, f4
	fmul	f0, f3, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24816
	li	r2, 0
	blr
ble_else24816:
	fsqrt	f0, f0
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24817
	fneg	f0, f0
	b	beq_cont24818
beq_else24817:
beq_cont24818:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsub	f0, f0, f4
	fdiv	f0, f0, f3
	stfd	f0, 0(r2)
	li	r2, 1
	blr
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24819
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
	fneg	f5, f5
	b	ble_cont24820
ble_else24819:
	lfd	f5, 4(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f1
ble_cont24820:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24821
	li	r7, 0
	b	ble_cont24822
ble_else24821:
	lwz	r7, 16(r2)
	lfd	f4, 8(r7)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24823
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24824
ble_else24823:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24824:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24825
	li	r7, 0
	b	ble_cont24826
ble_else24825:
	lfd	f4, 4(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bne	cr7, beq_else24827
	li	r7, 0
	b	beq_cont24828
beq_else24827:
	li	r7, 1
beq_cont24828:
ble_cont24826:
ble_cont24822:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24829
	lfd	f3, 8(r6)
	fsub	f3, f3, f1
	lfd	f4, 12(r6)
	fmul	f3, f3, f4
	lwz	r7, 16(r2)
	lfd	f4, 0(r7)
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24830
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
	fneg	f5, f5
	b	ble_cont24831
ble_else24830:
	lfd	f5, 0(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f0
ble_cont24831:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24832
	li	r7, 0
	b	ble_cont24833
ble_else24832:
	lwz	r7, 16(r2)
	lfd	f4, 8(r7)
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f5, f6
	bgt	cr7, ble_else24834
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
	fneg	f5, f5
	b	ble_cont24835
ble_else24834:
	lfd	f5, 8(r5)
	fmul	f5, f3, f5
	fadd	f5, f5, f2
ble_cont24835:
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24836
	li	r7, 0
	b	ble_cont24837
ble_else24836:
	lfd	f4, 12(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bne	cr7, beq_else24838
	li	r7, 0
	b	beq_cont24839
beq_else24838:
	li	r7, 1
beq_cont24839:
ble_cont24837:
ble_cont24833:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24840
	lfd	f3, 16(r6)
	fsub	f2, f3, f2
	lfd	f3, 20(r6)
	fmul	f2, f2, f3
	lwz	r7, 16(r2)
	lfd	f3, 0(r7)
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f4, f4, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f5, 0(r31)
	fcmpu	cr7, f4, f5
	bgt	cr7, ble_else24841
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
	fneg	f0, f0
	b	ble_cont24842
ble_else24841:
	lfd	f4, 0(r5)
	fmul	f4, f2, f4
	fadd	f0, f4, f0
ble_cont24842:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else24843
	li	r2, 0
	b	ble_cont24844
ble_else24843:
	lwz	r2, 16(r2)
	lfd	f0, 4(r2)
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f3, f3, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24845
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
	fneg	f1, f1
	b	ble_cont24846
ble_else24845:
	lfd	f3, 4(r5)
	fmul	f3, f2, f3
	fadd	f1, f3, f1
ble_cont24846:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24847
	li	r2, 0
	b	ble_cont24848
ble_else24847:
	lfd	f0, 20(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24849
	li	r2, 0
	b	beq_cont24850
beq_else24849:
	li	r2, 1
beq_cont24850:
ble_cont24848:
ble_cont24844:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24851
	li	r2, 0
	blr
beq_else24851:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 3
	blr
beq_else24840:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f3, 0(r2)
	li	r2, 2
	blr
beq_else24829:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24852
	li	r2, 0
	blr
beq_else24852:
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
	bne	cr7, beq_else24853
	fmr	f0, f5
	b	beq_cont24854
beq_else24853:
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
beq_cont24854:
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else24855
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24856
beq_else24855:
beq_cont24856:
	fmul	f1, f4, f4
	fmul	f0, f3, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24857
	li	r2, 0
	blr
ble_else24857:
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24858
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
	b	beq_cont24859
beq_else24858:
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
beq_cont24859:
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
	lwz	r8, 20(r7)
	lfd	f1, 0(r8)
	fsub	f0, f0, f1
	lfd	f1, 4(r6)
	lwz	r8, 20(r7)
	lfd	f2, 4(r8)
	fsub	f1, f1, f2
	lfd	f2, 8(r6)
	lwz	r6, 20(r7)
	lfd	f3, 8(r6)
	fsub	f2, f2, f3
	lwz	r6, 4(r5)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r6, 0(r31)
	lwz	r2, 4(r7)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else24860
	lwz	r5, 0(r5)
	mr	r2, r7
	b	solver_rect_fast2838
beq_else24860:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else24861
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 0(r6)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24862
	li	r2, 0
	blr
ble_else24862:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f3, 4(r6)
	fmul	f0, f3, f0
	lfd	f3, 8(r6)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r6)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r2)
	li	r2, 1
	blr
beq_else24861:
	lfd	f3, 0(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24863
	li	r2, 0
	blr
beq_else24863:
	lfd	f4, 4(r6)
	fmul	f4, f4, f0
	lfd	f5, 8(r6)
	fmul	f5, f5, f1
	fadd	f4, f4, f5
	lfd	f5, 12(r6)
	fmul	f5, f5, f2
	fadd	f4, f4, f5
	fmul	f5, f0, f0
	lwz	r2, 16(r7)
	lfd	f6, 0(r2)
	fmul	f5, f5, f6
	fmul	f6, f1, f1
	lwz	r2, 16(r7)
	lfd	f7, 4(r2)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f6, f2, f2
	lwz	r2, 16(r7)
	lfd	f7, 8(r2)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	lwz	r2, 12(r7)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24864
	fmr	f0, f5
	b	beq_cont24865
beq_else24864:
	fmul	f6, f1, f2
	lwz	r2, 36(r7)
	lfd	f7, 0(r2)
	fmul	f6, f6, f7
	fadd	f5, f5, f6
	fmul	f2, f2, f0
	lwz	r2, 36(r7)
	lfd	f6, 4(r2)
	fmul	f2, f2, f6
	fadd	f2, f5, f2
	fmul	f0, f0, f1
	lwz	r2, 36(r7)
	lfd	f1, 8(r2)
	fmul	f0, f0, f1
	fadd	f0, f2, f0
beq_cont24865:
	lwz	r2, 4(r7)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else24866
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24867
beq_else24866:
beq_cont24867:
	fmul	f1, f4, f4
	fmul	f0, f3, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24868
	li	r2, 0
	blr
ble_else24868:
	lwz	r2, 24(r7)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24869
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f0, f0
	fsub	f0, f4, f0
	lfd	f1, 16(r6)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont24870
beq_else24869:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	fsqrt	f0, f0
	fadd	f0, f4, f0
	lfd	f1, 16(r6)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont24870:
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
	lwz	r7, 40(r6)
	lfd	f0, 0(r7)
	lfd	f1, 4(r7)
	lfd	f2, 8(r7)
	lwz	r8, 4(r5)
	slwi	r2, r2, 2
	add	r31, r8, r2
	lwz	r2, 0(r31)
	lwz	r8, 4(r6)
	cmpwi	cr7, r8, 1
	bne	cr7, beq_else24871
	lwz	r5, 0(r5)
	mr	r29, r6
	mr	r6, r2
	mr	r2, r29
	b	solver_rect_fast2838
beq_else24871:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else24872
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24873
	li	r2, 0
	blr
ble_else24873:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r2)
	lfd	f1, 12(r7)
	fmul	f0, f0, f1
	stfd	f0, 0(r5)
	li	r2, 1
	blr
beq_else24872:
	lfd	f3, 0(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else24874
	li	r2, 0
	blr
beq_else24874:
	lfd	f4, 4(r2)
	fmul	f0, f4, f0
	lfd	f4, 8(r2)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 12(r7)
	fmul	f2, f0, f0
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else24875
	li	r2, 0
	blr
ble_else24875:
	lwz	r5, 24(r6)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24876
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	fsqrt	f1, f1
	fsub	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f0, f0, f1
	stfd	f0, 0(r5)
	b	beq_cont24877
beq_else24876:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	fsqrt	f1, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f0, f0, f1
	stfd	f0, 0(r5)
beq_cont24877:
	li	r2, 1
	blr
setup_rect_table2878:
	li	r6, 6
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24878
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 4(r2)
	b	beq_cont24879
beq_else24878:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24880
	li	r8, 0
	b	ble_cont24881
ble_else24880:
	li	r8, 1
ble_cont24881:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24882
	mr	r7, r8
	b	beq_cont24883
beq_else24882:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24884
	li	r7, 1
	b	beq_cont24885
beq_else24884:
	li	r7, 0
beq_cont24885:
beq_cont24883:
	lwz	r8, 16(r6)
	lfd	f0, 0(r8)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24886
	fneg	f0, f0
	b	beq_cont24887
beq_else24886:
beq_cont24887:
	stfd	f0, 0(r2)
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	lfd	f1, 0(r5)
	fdiv	f0, f0, f1
	stfd	f0, 4(r2)
beq_cont24879:
	lfd	f0, 4(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24888
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 12(r2)
	b	beq_cont24889
beq_else24888:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 4(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24890
	li	r8, 0
	b	ble_cont24891
ble_else24890:
	li	r8, 1
ble_cont24891:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24892
	mr	r7, r8
	b	beq_cont24893
beq_else24892:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24894
	li	r7, 1
	b	beq_cont24895
beq_else24894:
	li	r7, 0
beq_cont24895:
beq_cont24893:
	lwz	r8, 16(r6)
	lfd	f0, 4(r8)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24896
	fneg	f0, f0
	b	beq_cont24897
beq_else24896:
beq_cont24897:
	stfd	f0, 8(r2)
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	lfd	f1, 4(r5)
	fdiv	f0, f0, f1
	stfd	f0, 12(r2)
beq_cont24889:
	lfd	f0, 8(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24898
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 20(r2)
	b	beq_cont24899
beq_else24898:
	lwz	r6, 0(r3)
	lwz	r7, 24(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 8(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24900
	li	r8, 0
	b	ble_cont24901
ble_else24900:
	li	r8, 1
ble_cont24901:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24902
	mr	r7, r8
	b	beq_cont24903
beq_else24902:
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else24904
	li	r7, 1
	b	beq_cont24905
beq_else24904:
	li	r7, 0
beq_cont24905:
beq_cont24903:
	lwz	r6, 16(r6)
	lfd	f0, 8(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24906
	fneg	f0, f0
	b	beq_cont24907
beq_else24906:
beq_cont24907:
	stfd	f0, 16(r2)
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	lfd	f1, 8(r5)
	fdiv	f0, f0, f1
	stfd	f0, 20(r2)
beq_cont24899:
	blr
setup_second_table2884:
	li	r6, 5
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	bne	cr7, beq_else24908
	fmr	f0, f3
	b	beq_cont24909
beq_else24908:
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
beq_cont24909:
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
	bne	cr7, beq_else24910
	stfd	f1, 4(r2)
	stfd	f2, 8(r2)
	stfd	f3, 12(r2)
	b	beq_cont24911
beq_else24910:
	lfd	f4, 8(r5)
	lwz	r7, 36(r6)
	lfd	f5, 4(r7)
	fmul	f4, f4, f5
	lfd	f5, 4(r5)
	lwz	r7, 36(r6)
	lfd	f6, 8(r7)
	fmul	f5, f5, f6
	fadd	f4, f4, f5
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	fsub	f1, f3, f1
	stfd	f1, 12(r2)
beq_cont24911:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else24912
	b	beq_cont24913
beq_else24912:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	stfd	f0, 16(r2)
beq_cont24913:
	blr
iter_setup_dirvec_constants2887:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else24914
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	lwz	r7, 4(r2)
	lwz	r8, 0(r2)
	lwz	r9, 4(r6)
	stw	r2, 0(r3)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else24915
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24916
beq_else24915:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else24917
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r7, 4(r3)
	stw	r5, 8(r3)
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
	lwz	r5, 16(r3)
	lfd	f0, 0(r5)
	lwz	r6, 12(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24919
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont24920
ble_else24919:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont24920:
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24918
beq_else24917:
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_second_table2884
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont24918:
beq_cont24916:
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else24921
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 0(r3)
	lwz	r7, 4(r6)
	lwz	r8, 0(r6)
	lwz	r9, 4(r5)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else24922
	stw	r7, 20(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_rect_table2878
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 20(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24923
beq_else24922:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else24924
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r7, 20(r3)
	stw	r2, 24(r3)
	stw	r5, 28(r3)
	stw	r8, 32(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	lfd	f0, 0(r5)
	lwz	r6, 28(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24926
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont24927
ble_else24926:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont24927:
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 20(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24925
beq_else24924:
	stw	r7, 20(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_second_table2884
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 20(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont24925:
beq_cont24923:
	subi	r5, r5, 1
	lwz	r2, 0(r3)
	b	iter_setup_dirvec_constants2887
bge_else24921:
	blr
bge_else24914:
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
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else24930
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	lwz	r7, 4(r2)
	lwz	r8, 0(r2)
	lwz	r9, 4(r6)
	stw	r2, 0(r3)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else24931
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24932
beq_else24931:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else24933
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r7, 4(r3)
	stw	r5, 8(r3)
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
	lwz	r5, 16(r3)
	lfd	f0, 0(r5)
	lwz	r6, 12(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24935
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont24936
ble_else24935:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont24936:
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont24934
beq_else24933:
	stw	r7, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	setup_second_table2884
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont24934:
beq_cont24932:
	subi	r5, r5, 1
	lwz	r2, 0(r3)
	b	iter_setup_dirvec_constants2887
bge_else24930:
	blr
setup_startp_constants2892:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else24938
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
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
	bne	cr7, beq_else24939
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
	b	beq_cont24940
beq_else24939:
	cmpwi	cr7, r8, 2
	bgt	cr7, ble_else24941
	b	ble_cont24942
ble_else24941:
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
	bne	cr7, beq_else24943
	fmr	f0, f3
	b	beq_cont24944
beq_else24943:
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
beq_cont24944:
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else24945
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24946
beq_else24945:
beq_cont24946:
	stfd	f0, 12(r7)
ble_cont24942:
beq_cont24940:
	subi	r5, r5, 1
	b	setup_startp_constants2892
bge_else24938:
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
	bne	cr7, beq_else24948
	lwz	r5, 16(r2)
	lfd	f3, 0(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f0, f4
	bgt	cr7, ble_else24949
	fneg	f0, f0
	b	ble_cont24950
ble_else24949:
ble_cont24950:
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else24951
	li	r5, 0
	b	ble_cont24952
ble_else24951:
	lwz	r5, 16(r2)
	lfd	f0, 4(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f1, f3
	bgt	cr7, ble_else24953
	fneg	f1, f1
	b	ble_cont24954
ble_else24953:
ble_cont24954:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24955
	li	r5, 0
	b	ble_cont24956
ble_else24955:
	lwz	r5, 16(r2)
	lfd	f0, 8(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else24957
	fneg	f1, f2
	b	ble_cont24958
ble_else24957:
	fmr	f1, f2
ble_cont24958:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else24959
	li	r5, 0
	b	ble_cont24960
ble_else24959:
	li	r5, 1
ble_cont24960:
ble_cont24956:
ble_cont24952:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24961
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24962
	li	r2, 1
	blr
beq_else24962:
	li	r2, 0
	blr
beq_else24961:
	lwz	r2, 24(r2)
	blr
beq_else24948:
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else24963
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else24964
	li	r5, 0
	b	ble_cont24965
ble_else24964:
	li	r5, 1
ble_cont24965:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24966
	mr	r2, r5
	b	beq_cont24967
beq_else24966:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24968
	li	r2, 1
	b	beq_cont24969
beq_else24968:
	li	r2, 0
beq_cont24969:
beq_cont24967:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24970
	li	r2, 1
	blr
beq_else24970:
	li	r2, 0
	blr
beq_else24963:
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
	bne	cr7, beq_else24971
	fmr	f0, f3
	b	beq_cont24972
beq_else24971:
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
beq_cont24972:
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, 3
	bne	cr7, beq_else24973
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont24974
beq_else24973:
beq_cont24974:
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else24975
	li	r5, 0
	b	ble_cont24976
ble_else24975:
	li	r5, 1
ble_cont24976:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24977
	mr	r2, r5
	b	beq_cont24978
beq_else24977:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else24979
	li	r2, 1
	b	beq_cont24980
beq_else24979:
	li	r2, 0
beq_cont24980:
beq_cont24978:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else24981
	li	r2, 1
	blr
beq_else24981:
	li	r2, 0
	blr
check_all_inside2917:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else24982
	li	r2, 1
	blr
beq_else24982:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
	cmpwi	cr7, r7, 1
	bne	cr7, beq_else24983
	lwz	r7, 16(r6)
	lfd	f6, 0(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f7, 0(r31)
	fcmpu	cr7, f3, f7
	bgt	cr7, ble_else24985
	fneg	f3, f3
	b	ble_cont24986
ble_else24985:
ble_cont24986:
	fcmpu	cr7, f6, f3
	bgt	cr7, ble_else24987
	li	r7, 0
	b	ble_cont24988
ble_else24987:
	lwz	r7, 16(r6)
	lfd	f3, 4(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f4, f6
	bgt	cr7, ble_else24989
	fneg	f4, f4
	b	ble_cont24990
ble_else24989:
ble_cont24990:
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24991
	li	r7, 0
	b	ble_cont24992
ble_else24991:
	lwz	r7, 16(r6)
	lfd	f3, 8(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f5, f4
	bgt	cr7, ble_else24993
	fneg	f4, f5
	b	ble_cont24994
ble_else24993:
	fmr	f4, f5
ble_cont24994:
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else24995
	li	r7, 0
	b	ble_cont24996
ble_else24995:
	li	r7, 1
ble_cont24996:
ble_cont24992:
ble_cont24988:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else24997
	lwz	r6, 24(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else24999
	li	r6, 1
	b	beq_cont25000
beq_else24999:
	li	r6, 0
beq_cont25000:
	b	beq_cont24998
beq_else24997:
	lwz	r6, 24(r6)
beq_cont24998:
	b	beq_cont24984
beq_else24983:
	cmpwi	cr7, r7, 2
	bne	cr7, beq_else25001
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f4, f3
	bgt	cr7, ble_else25003
	li	r7, 0
	b	ble_cont25004
ble_else25003:
	li	r7, 1
ble_cont25004:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25005
	mr	r6, r7
	b	beq_cont25006
beq_else25005:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25007
	li	r6, 1
	b	beq_cont25008
beq_else25007:
	li	r6, 0
beq_cont25008:
beq_cont25006:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25009
	li	r6, 1
	b	beq_cont25010
beq_else25009:
	li	r6, 0
beq_cont25010:
	b	beq_cont25002
beq_else25001:
	fmul	f6, f3, f3
	lwz	r7, 16(r6)
	lfd	f7, 0(r7)
	fmul	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r7, 16(r6)
	lfd	f8, 4(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f5, f5
	lwz	r7, 16(r6)
	lfd	f8, 8(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r7, 12(r6)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25011
	fmr	f3, f6
	b	beq_cont25012
beq_else25011:
	fmul	f7, f4, f5
	lwz	r7, 36(r6)
	lfd	f8, 0(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f5, f5, f3
	lwz	r7, 36(r6)
	lfd	f7, 4(r7)
	fmul	f5, f5, f7
	fadd	f5, f6, f5
	fmul	f3, f3, f4
	lwz	r7, 36(r6)
	lfd	f4, 8(r7)
	fmul	f3, f3, f4
	fadd	f3, f5, f3
beq_cont25012:
	lwz	r7, 4(r6)
	cmpwi	cr7, r7, 3
	bne	cr7, beq_else25013
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f4, 0(r31)
	fsub	f3, f3, f4
	b	beq_cont25014
beq_else25013:
beq_cont25014:
	lwz	r6, 24(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f4, f3
	bgt	cr7, ble_else25015
	li	r7, 0
	b	ble_cont25016
ble_else25015:
	li	r7, 1
ble_cont25016:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25017
	mr	r6, r7
	b	beq_cont25018
beq_else25017:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25019
	li	r6, 1
	b	beq_cont25020
beq_else25019:
	li	r6, 0
beq_cont25020:
beq_cont25018:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25021
	li	r6, 1
	b	beq_cont25022
beq_else25021:
	li	r6, 0
beq_cont25022:
beq_cont25002:
beq_cont24984:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25023
	addi	r2, r2, 1
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else25024
	li	r2, 1
	blr
beq_else25024:
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
	bne	cr7, beq_else25025
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 24(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25026
	li	r2, 1
	blr
beq_else25026:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	lwz	r7, 20(r5)
	lfd	f0, 0(r7)
	lfd	f1, 16(r3)
	fsub	f0, f1, f0
	lwz	r7, 20(r5)
	lfd	f2, 4(r7)
	lfd	f3, 8(r3)
	fsub	f2, f3, f2
	lwz	r7, 20(r5)
	lfd	f4, 8(r7)
	lfd	f5, 0(r3)
	fsub	f4, f5, f4
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, 1
	bne	cr7, beq_else25027
	lwz	r7, 16(r5)
	lfd	f6, 0(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f7, 0(r31)
	fcmpu	cr7, f0, f7
	bgt	cr7, ble_else25029
	fneg	f0, f0
	b	ble_cont25030
ble_else25029:
ble_cont25030:
	fcmpu	cr7, f6, f0
	bgt	cr7, ble_else25031
	li	r7, 0
	b	ble_cont25032
ble_else25031:
	lwz	r7, 16(r5)
	lfd	f0, 4(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f2, f6
	bgt	cr7, ble_else25033
	fneg	f2, f2
	b	ble_cont25034
ble_else25033:
ble_cont25034:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25035
	li	r7, 0
	b	ble_cont25036
ble_else25035:
	lwz	r7, 16(r5)
	lfd	f0, 8(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f4, f2
	bgt	cr7, ble_else25037
	fneg	f2, f4
	b	ble_cont25038
ble_else25037:
	fmr	f2, f4
ble_cont25038:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25039
	li	r7, 0
	b	ble_cont25040
ble_else25039:
	li	r7, 1
ble_cont25040:
ble_cont25036:
ble_cont25032:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25041
	lwz	r5, 24(r5)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25043
	li	r5, 1
	b	beq_cont25044
beq_else25043:
	li	r5, 0
beq_cont25044:
	b	beq_cont25042
beq_else25041:
	lwz	r5, 24(r5)
beq_cont25042:
	b	beq_cont25028
beq_else25027:
	cmpwi	cr7, r7, 2
	bne	cr7, beq_else25045
	lwz	r7, 16(r5)
	lfd	f6, 0(r7)
	fmul	f0, f6, f0
	lfd	f6, 4(r7)
	fmul	f2, f6, f2
	fadd	f0, f0, f2
	lfd	f2, 8(r7)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r5, 24(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25047
	li	r7, 0
	b	ble_cont25048
ble_else25047:
	li	r7, 1
ble_cont25048:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25049
	mr	r5, r7
	b	beq_cont25050
beq_else25049:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25051
	li	r5, 1
	b	beq_cont25052
beq_else25051:
	li	r5, 0
beq_cont25052:
beq_cont25050:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25053
	li	r5, 1
	b	beq_cont25054
beq_else25053:
	li	r5, 0
beq_cont25054:
	b	beq_cont25046
beq_else25045:
	fmul	f6, f0, f0
	lwz	r7, 16(r5)
	lfd	f7, 0(r7)
	fmul	f6, f6, f7
	fmul	f7, f2, f2
	lwz	r7, 16(r5)
	lfd	f8, 4(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r7, 16(r5)
	lfd	f8, 8(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r7, 12(r5)
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25055
	fmr	f0, f6
	b	beq_cont25056
beq_else25055:
	fmul	f7, f2, f4
	lwz	r7, 36(r5)
	lfd	f8, 0(r7)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f4, f4, f0
	lwz	r7, 36(r5)
	lfd	f7, 4(r7)
	fmul	f4, f4, f7
	fadd	f4, f6, f4
	fmul	f0, f0, f2
	lwz	r7, 36(r5)
	lfd	f2, 8(r7)
	fmul	f0, f0, f2
	fadd	f0, f4, f0
beq_cont25056:
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, 3
	bne	cr7, beq_else25057
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
	fsub	f0, f0, f2
	b	beq_cont25058
beq_else25057:
beq_cont25058:
	lwz	r5, 24(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25059
	li	r7, 0
	b	ble_cont25060
ble_else25059:
	li	r7, 1
ble_cont25060:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25061
	mr	r5, r7
	b	beq_cont25062
beq_else25061:
	cmpwi	cr7, r7, 0
	bne	cr7, beq_else25063
	li	r5, 1
	b	beq_cont25064
beq_else25063:
	li	r5, 0
beq_cont25064:
beq_cont25062:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25065
	li	r5, 1
	b	beq_cont25066
beq_else25065:
	li	r5, 0
beq_cont25066:
beq_cont25046:
beq_cont25028:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25067
	addi	r2, r2, 1
	slwi	r5, r2, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25068
	li	r2, 1
	blr
beq_else25068:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	is_outside2912
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25069
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r5, 24(r3)
	b	check_all_inside2917
beq_else25069:
	li	r2, 0
	blr
beq_else25067:
	li	r2, 0
	blr
beq_else25025:
	li	r2, 0
	blr
beq_else25023:
	li	r2, 0
	blr
shadow_check_and_group2923:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else25070
	li	r2, 0
	blr
beq_else25070:
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
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r6, 2
	add	r31, r9, r10
	lwz	r9, 0(r31)
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
	add	r31, r8, r10
	lwz	r8, 0(r31)
	lwz	r10, 4(r9)
	stw	r5, 0(r3)
	stw	r2, 4(r3)
	stw	r6, 8(r3)
	cmpwi	cr7, r10, 1
	bne	cr7, beq_else25071
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
	b	beq_cont25072
beq_else25071:
	cmpwi	cr7, r10, 2
	bne	cr7, beq_else25073
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 0(r8)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25075
	li	r2, 0
	b	ble_cont25076
ble_else25075:
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
ble_cont25076:
	b	beq_cont25074
beq_else25073:
	mflr	r31
	mr	r5, r8
	mr	r2, r9
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_second_fast2851
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont25074:
beq_cont25072:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25077
	li	r2, 0
	b	beq_cont25078
beq_else25077:
	lis	r31, lo16(l19502)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19502)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19502)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25079
	li	r2, 0
	b	ble_cont25080
ble_else25079:
	li	r2, 1
ble_cont25080:
beq_cont25078:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25081
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
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25082
	li	r2, 0
	blr
beq_else25082:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else25081:
	lis	r31, lo16(l19503)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19503)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19503)
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
	bne	cr7, beq_else25083
	li	r2, 1
	b	beq_cont25084
beq_else25083:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
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
	bne	cr7, beq_else25086
	lwz	r5, 0(r3)
	lwz	r2, 4(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25088
	li	r2, 1
	b	beq_cont25089
beq_else25088:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	lwz	r6, 20(r2)
	lfd	f0, 0(r6)
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	lwz	r6, 20(r2)
	lfd	f2, 4(r6)
	lfd	f3, 24(r3)
	fsub	f2, f3, f2
	lwz	r6, 20(r2)
	lfd	f4, 8(r6)
	lfd	f5, 16(r3)
	fsub	f4, f5, f4
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else25090
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f7, 0(r31)
	fcmpu	cr7, f0, f7
	bgt	cr7, ble_else25092
	fneg	f0, f0
	b	ble_cont25093
ble_else25092:
ble_cont25093:
	fcmpu	cr7, f6, f0
	bgt	cr7, ble_else25094
	li	r6, 0
	b	ble_cont25095
ble_else25094:
	lwz	r6, 16(r2)
	lfd	f0, 4(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f2, f6
	bgt	cr7, ble_else25096
	fneg	f2, f2
	b	ble_cont25097
ble_else25096:
ble_cont25097:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25098
	li	r6, 0
	b	ble_cont25099
ble_else25098:
	lwz	r6, 16(r2)
	lfd	f0, 8(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f4, f2
	bgt	cr7, ble_else25100
	fneg	f2, f4
	b	ble_cont25101
ble_else25100:
	fmr	f2, f4
ble_cont25101:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25102
	li	r6, 0
	b	ble_cont25103
ble_else25102:
	li	r6, 1
ble_cont25103:
ble_cont25099:
ble_cont25095:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25104
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25106
	li	r2, 1
	b	beq_cont25107
beq_else25106:
	li	r2, 0
beq_cont25107:
	b	beq_cont25105
beq_else25104:
	lwz	r2, 24(r2)
beq_cont25105:
	b	beq_cont25091
beq_else25090:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else25108
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	fmul	f0, f6, f0
	lfd	f6, 4(r6)
	fmul	f2, f6, f2
	fadd	f0, f0, f2
	lfd	f2, 8(r6)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25110
	li	r6, 0
	b	ble_cont25111
ble_else25110:
	li	r6, 1
ble_cont25111:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25112
	mr	r2, r6
	b	beq_cont25113
beq_else25112:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25114
	li	r2, 1
	b	beq_cont25115
beq_else25114:
	li	r2, 0
beq_cont25115:
beq_cont25113:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25116
	li	r2, 1
	b	beq_cont25117
beq_else25116:
	li	r2, 0
beq_cont25117:
	b	beq_cont25109
beq_else25108:
	fmul	f6, f0, f0
	lwz	r6, 16(r2)
	lfd	f7, 0(r6)
	fmul	f6, f6, f7
	fmul	f7, f2, f2
	lwz	r6, 16(r2)
	lfd	f8, 4(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r6, 16(r2)
	lfd	f8, 8(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r6, 12(r2)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25118
	fmr	f0, f6
	b	beq_cont25119
beq_else25118:
	fmul	f7, f2, f4
	lwz	r6, 36(r2)
	lfd	f8, 0(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f4, f4, f0
	lwz	r6, 36(r2)
	lfd	f7, 4(r6)
	fmul	f4, f4, f7
	fadd	f4, f6, f4
	fmul	f0, f0, f2
	lwz	r6, 36(r2)
	lfd	f2, 8(r6)
	fmul	f0, f0, f2
	fadd	f0, f4, f0
beq_cont25119:
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else25120
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
	fsub	f0, f0, f2
	b	beq_cont25121
beq_else25120:
beq_cont25121:
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25122
	li	r6, 0
	b	ble_cont25123
ble_else25122:
	li	r6, 1
ble_cont25123:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25124
	mr	r2, r6
	b	beq_cont25125
beq_else25124:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25126
	li	r2, 1
	b	beq_cont25127
beq_else25126:
	li	r2, 0
beq_cont25127:
beq_cont25125:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25128
	li	r2, 1
	b	beq_cont25129
beq_else25128:
	li	r2, 0
beq_cont25129:
beq_cont25109:
beq_cont25091:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25130
	lwz	r2, 8(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25132
	li	r2, 1
	b	beq_cont25133
beq_else25132:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	mflr	r31
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	is_outside2912
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25134
	li	r2, 3
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
	b	beq_cont25135
beq_else25134:
	li	r2, 0
beq_cont25135:
beq_cont25133:
	b	beq_cont25131
beq_else25130:
	li	r2, 0
beq_cont25131:
beq_cont25089:
	b	beq_cont25087
beq_else25086:
	li	r2, 0
beq_cont25087:
beq_cont25084:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25136
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else25136:
	li	r2, 1
	blr
shadow_check_one_or_group2926:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else25137
	li	r2, 0
	blr
beq_else25137:
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
	bne	cr7, beq_else25138
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25139
	li	r2, 0
	blr
beq_else25139:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25140
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25141
	li	r2, 0
	blr
beq_else25141:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25142
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25143
	li	r2, 0
	blr
beq_else25143:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25144
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25145
	li	r2, 0
	blr
beq_else25145:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25146
	lwz	r2, 20(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25147
	li	r2, 0
	blr
beq_else25147:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25148
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25149
	li	r2, 0
	blr
beq_else25149:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	shadow_check_and_group2923
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25150
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25151
	li	r2, 0
	blr
beq_else25151:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	shadow_check_and_group2923
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25152
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_one_or_group2926
beq_else25152:
	li	r2, 1
	blr
beq_else25150:
	li	r2, 1
	blr
beq_else25148:
	li	r2, 1
	blr
beq_else25146:
	li	r2, 1
	blr
beq_else25144:
	li	r2, 1
	blr
beq_else25142:
	li	r2, 1
	blr
beq_else25140:
	li	r2, 1
	blr
beq_else25138:
	li	r2, 1
	blr
shadow_check_one_or_matrix2929:
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r6, 0(r31)
	lwz	r7, 0(r6)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25153
	li	r2, 0
	blr
beq_else25153:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25154
	li	r2, 1
	b	beq_cont25155
beq_else25154:
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
	add	r31, r10, r11
	lwz	r10, 0(r31)
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
	add	r31, r9, r7
	lwz	r7, 0(r31)
	lwz	r9, 4(r10)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else25156
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
	b	beq_cont25157
beq_else25156:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else25158
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 0(r7)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25160
	li	r2, 0
	b	ble_cont25161
ble_else25160:
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
ble_cont25161:
	b	beq_cont25159
beq_else25158:
	mflr	r31
	mr	r5, r7
	mr	r2, r10
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	solver_second_fast2851
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont25159:
beq_cont25157:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25162
	li	r2, 0
	b	beq_cont25163
beq_else25162:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25164
	li	r2, 0
	b	ble_cont25165
ble_else25164:
	lwz	r2, 0(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25166
	li	r2, 0
	b	beq_cont25167
beq_else25166:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25168
	lwz	r2, 0(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25170
	li	r2, 0
	b	beq_cont25171
beq_else25170:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25172
	lwz	r2, 0(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25174
	li	r2, 0
	b	beq_cont25175
beq_else25174:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25176
	lwz	r2, 0(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25178
	li	r2, 0
	b	beq_cont25179
beq_else25178:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25180
	lwz	r2, 0(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25182
	li	r2, 0
	b	beq_cont25183
beq_else25182:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25184
	lwz	r2, 0(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25186
	li	r2, 0
	b	beq_cont25187
beq_else25186:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25188
	lwz	r2, 0(r3)
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25190
	li	r2, 0
	b	beq_cont25191
beq_else25190:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25192
	li	r2, 8
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont25193
beq_else25192:
	li	r2, 1
beq_cont25193:
beq_cont25191:
	b	beq_cont25189
beq_else25188:
	li	r2, 1
beq_cont25189:
beq_cont25187:
	b	beq_cont25185
beq_else25184:
	li	r2, 1
beq_cont25185:
beq_cont25183:
	b	beq_cont25181
beq_else25180:
	li	r2, 1
beq_cont25181:
beq_cont25179:
	b	beq_cont25177
beq_else25176:
	li	r2, 1
beq_cont25177:
beq_cont25175:
	b	beq_cont25173
beq_else25172:
	li	r2, 1
beq_cont25173:
beq_cont25171:
	b	beq_cont25169
beq_else25168:
	li	r2, 1
beq_cont25169:
beq_cont25167:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25194
	li	r2, 0
	b	beq_cont25195
beq_else25194:
	li	r2, 1
beq_cont25195:
ble_cont25165:
beq_cont25163:
beq_cont25155:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25196
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25197
	li	r2, 0
	blr
beq_else25197:
	stw	r5, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25198
	li	r2, 1
	b	beq_cont25199
beq_else25198:
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
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_fast2857
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25200
	li	r2, 0
	b	beq_cont25201
beq_else25200:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25202
	li	r2, 0
	b	ble_cont25203
ble_else25202:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25204
	li	r2, 0
	b	beq_cont25205
beq_else25204:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25206
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25208
	li	r2, 0
	b	beq_cont25209
beq_else25208:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25210
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25212
	li	r2, 0
	b	beq_cont25213
beq_else25212:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25214
	lwz	r2, 12(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25216
	li	r2, 0
	b	beq_cont25217
beq_else25216:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25218
	lwz	r2, 12(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25220
	li	r2, 0
	b	beq_cont25221
beq_else25220:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25222
	lwz	r2, 12(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25224
	li	r2, 0
	b	beq_cont25225
beq_else25224:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25226
	li	r2, 7
	lwz	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont25227
beq_else25226:
	li	r2, 1
beq_cont25227:
beq_cont25225:
	b	beq_cont25223
beq_else25222:
	li	r2, 1
beq_cont25223:
beq_cont25221:
	b	beq_cont25219
beq_else25218:
	li	r2, 1
beq_cont25219:
beq_cont25217:
	b	beq_cont25215
beq_else25214:
	li	r2, 1
beq_cont25215:
beq_cont25213:
	b	beq_cont25211
beq_else25210:
	li	r2, 1
beq_cont25211:
beq_cont25209:
	b	beq_cont25207
beq_else25206:
	li	r2, 1
beq_cont25207:
beq_cont25205:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25228
	li	r2, 0
	b	beq_cont25229
beq_else25228:
	li	r2, 1
beq_cont25229:
ble_cont25203:
beq_cont25201:
beq_cont25199:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25230
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else25230:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25231
	li	r2, 0
	b	beq_cont25232
beq_else25231:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25233
	lwz	r2, 12(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25235
	li	r2, 0
	b	beq_cont25236
beq_else25235:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25237
	lwz	r2, 12(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25239
	li	r2, 0
	b	beq_cont25240
beq_else25239:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25241
	lwz	r2, 12(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25243
	li	r2, 0
	b	beq_cont25244
beq_else25243:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25245
	lwz	r2, 12(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25247
	li	r2, 0
	b	beq_cont25248
beq_else25247:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25249
	lwz	r2, 12(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25251
	li	r2, 0
	b	beq_cont25252
beq_else25251:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25253
	li	r2, 7
	lwz	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont25254
beq_else25253:
	li	r2, 1
beq_cont25254:
beq_cont25252:
	b	beq_cont25250
beq_else25249:
	li	r2, 1
beq_cont25250:
beq_cont25248:
	b	beq_cont25246
beq_else25245:
	li	r2, 1
beq_cont25246:
beq_cont25244:
	b	beq_cont25242
beq_else25241:
	li	r2, 1
beq_cont25242:
beq_cont25240:
	b	beq_cont25238
beq_else25237:
	li	r2, 1
beq_cont25238:
beq_cont25236:
	b	beq_cont25234
beq_else25233:
	li	r2, 1
beq_cont25234:
beq_cont25232:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25255
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else25255:
	li	r2, 1
	blr
beq_else25196:
	lwz	r2, 0(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25256
	li	r2, 0
	b	beq_cont25257
beq_else25256:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25258
	lwz	r2, 0(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25260
	li	r2, 0
	b	beq_cont25261
beq_else25260:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25262
	lwz	r2, 0(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25264
	li	r2, 0
	b	beq_cont25265
beq_else25264:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25266
	lwz	r2, 0(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25268
	li	r2, 0
	b	beq_cont25269
beq_else25268:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25270
	lwz	r2, 0(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25272
	li	r2, 0
	b	beq_cont25273
beq_else25272:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25274
	lwz	r2, 0(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25276
	li	r2, 0
	b	beq_cont25277
beq_else25276:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25278
	lwz	r2, 0(r3)
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25280
	li	r2, 0
	b	beq_cont25281
beq_else25280:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_and_group2923
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25282
	li	r2, 8
	lwz	r5, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont25283
beq_else25282:
	li	r2, 1
beq_cont25283:
beq_cont25281:
	b	beq_cont25279
beq_else25278:
	li	r2, 1
beq_cont25279:
beq_cont25277:
	b	beq_cont25275
beq_else25274:
	li	r2, 1
beq_cont25275:
beq_cont25273:
	b	beq_cont25271
beq_else25270:
	li	r2, 1
beq_cont25271:
beq_cont25269:
	b	beq_cont25267
beq_else25266:
	li	r2, 1
beq_cont25267:
beq_cont25265:
	b	beq_cont25263
beq_else25262:
	li	r2, 1
beq_cont25263:
beq_cont25261:
	b	beq_cont25259
beq_else25258:
	li	r2, 1
beq_cont25259:
beq_cont25257:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25284
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25285
	li	r2, 0
	blr
beq_else25285:
	stw	r5, 20(r3)
	stw	r2, 24(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25286
	li	r2, 1
	b	beq_cont25287
beq_else25286:
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
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver_fast2857
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25288
	li	r2, 0
	b	beq_cont25289
beq_else25288:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25290
	li	r2, 0
	b	ble_cont25291
ble_else25290:
	lwz	r2, 20(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25292
	li	r2, 0
	b	beq_cont25293
beq_else25292:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25294
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25296
	li	r2, 0
	b	beq_cont25297
beq_else25296:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25298
	lwz	r2, 20(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25300
	li	r2, 0
	b	beq_cont25301
beq_else25300:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25302
	lwz	r2, 20(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25304
	li	r2, 0
	b	beq_cont25305
beq_else25304:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25306
	lwz	r2, 20(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25308
	li	r2, 0
	b	beq_cont25309
beq_else25308:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25310
	lwz	r2, 20(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25312
	li	r2, 0
	b	beq_cont25313
beq_else25312:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25314
	li	r2, 7
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont25315
beq_else25314:
	li	r2, 1
beq_cont25315:
beq_cont25313:
	b	beq_cont25311
beq_else25310:
	li	r2, 1
beq_cont25311:
beq_cont25309:
	b	beq_cont25307
beq_else25306:
	li	r2, 1
beq_cont25307:
beq_cont25305:
	b	beq_cont25303
beq_else25302:
	li	r2, 1
beq_cont25303:
beq_cont25301:
	b	beq_cont25299
beq_else25298:
	li	r2, 1
beq_cont25299:
beq_cont25297:
	b	beq_cont25295
beq_else25294:
	li	r2, 1
beq_cont25295:
beq_cont25293:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25316
	li	r2, 0
	b	beq_cont25317
beq_else25316:
	li	r2, 1
beq_cont25317:
ble_cont25291:
beq_cont25289:
beq_cont25287:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25318
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else25318:
	lwz	r2, 20(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25319
	li	r2, 0
	b	beq_cont25320
beq_else25319:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25321
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25323
	li	r2, 0
	b	beq_cont25324
beq_else25323:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25325
	lwz	r2, 20(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25327
	li	r2, 0
	b	beq_cont25328
beq_else25327:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25329
	lwz	r2, 20(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25331
	li	r2, 0
	b	beq_cont25332
beq_else25331:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25333
	lwz	r2, 20(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25335
	li	r2, 0
	b	beq_cont25336
beq_else25335:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25337
	lwz	r2, 20(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25339
	li	r2, 0
	b	beq_cont25340
beq_else25339:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25341
	li	r2, 7
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont25342
beq_else25341:
	li	r2, 1
beq_cont25342:
beq_cont25340:
	b	beq_cont25338
beq_else25337:
	li	r2, 1
beq_cont25338:
beq_cont25336:
	b	beq_cont25334
beq_else25333:
	li	r2, 1
beq_cont25334:
beq_cont25332:
	b	beq_cont25330
beq_else25329:
	li	r2, 1
beq_cont25330:
beq_cont25328:
	b	beq_cont25326
beq_else25325:
	li	r2, 1
beq_cont25326:
beq_cont25324:
	b	beq_cont25322
beq_else25321:
	li	r2, 1
beq_cont25322:
beq_cont25320:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25343
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else25343:
	li	r2, 1
	blr
beq_else25284:
	li	r2, 1
	blr
solve_each_element2932:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25344
	blr
beq_else25344:
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
	add	r31, r9, r10
	lwz	r9, 0(r31)
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
	bne	cr7, beq_else25346
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_rect2803
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont25347
beq_else25346:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else25348
	lwz	r8, 16(r9)
	lfd	f3, 0(r6)
	lfd	f4, 0(r8)
	fmul	f3, f3, f4
	lfd	f4, 4(r6)
	lfd	f5, 4(r8)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r6)
	lfd	f5, 8(r8)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25350
	li	r2, 0
	b	ble_cont25351
ble_else25350:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	lfd	f4, 0(r8)
	fmul	f0, f4, f0
	lfd	f4, 4(r8)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r8)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	fdiv	f0, f0, f3
	stfd	f0, 0(r9)
	li	r2, 1
ble_cont25351:
	b	beq_cont25349
beq_else25348:
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_second2828
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25349:
beq_cont25347:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25352
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
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25353
	blr
beq_else25353:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
beq_else25352:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25355
	b	ble_cont25356
ble_else25355:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25357
	b	ble_cont25358
ble_else25357:
	lis	r31, lo16(l19503)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19503)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19503)
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
	stw	r2, 16(r3)
	stfd	f3, 24(r3)
	stfd	f2, 32(r3)
	stfd	f1, 40(r3)
	stfd	f0, 48(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25360
	li	r2, 1
	b	beq_cont25361
beq_else25360:
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r7, r7, 2
	add	r31, r8, r7
	lwz	r7, 0(r31)
	mflr	r31
	mr	r2, r7
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
	bne	cr7, beq_else25362
	lwz	r5, 4(r3)
	lwz	r2, 4(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25364
	li	r2, 1
	b	beq_cont25365
beq_else25364:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	lwz	r6, 20(r2)
	lfd	f0, 0(r6)
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r6, 20(r2)
	lfd	f2, 4(r6)
	lfd	f3, 32(r3)
	fsub	f2, f3, f2
	lwz	r6, 20(r2)
	lfd	f4, 8(r6)
	lfd	f5, 24(r3)
	fsub	f4, f5, f4
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else25366
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f7, 0(r31)
	fcmpu	cr7, f0, f7
	bgt	cr7, ble_else25368
	fneg	f0, f0
	b	ble_cont25369
ble_else25368:
ble_cont25369:
	fcmpu	cr7, f6, f0
	bgt	cr7, ble_else25370
	li	r6, 0
	b	ble_cont25371
ble_else25370:
	lwz	r6, 16(r2)
	lfd	f0, 4(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f2, f6
	bgt	cr7, ble_else25372
	fneg	f2, f2
	b	ble_cont25373
ble_else25372:
ble_cont25373:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25374
	li	r6, 0
	b	ble_cont25375
ble_else25374:
	lwz	r6, 16(r2)
	lfd	f0, 8(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f4, f2
	bgt	cr7, ble_else25376
	fneg	f2, f4
	b	ble_cont25377
ble_else25376:
	fmr	f2, f4
ble_cont25377:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25378
	li	r6, 0
	b	ble_cont25379
ble_else25378:
	li	r6, 1
ble_cont25379:
ble_cont25375:
ble_cont25371:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25380
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25382
	li	r2, 1
	b	beq_cont25383
beq_else25382:
	li	r2, 0
beq_cont25383:
	b	beq_cont25381
beq_else25380:
	lwz	r2, 24(r2)
beq_cont25381:
	b	beq_cont25367
beq_else25366:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else25384
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	fmul	f0, f6, f0
	lfd	f6, 4(r6)
	fmul	f2, f6, f2
	fadd	f0, f0, f2
	lfd	f2, 8(r6)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25386
	li	r6, 0
	b	ble_cont25387
ble_else25386:
	li	r6, 1
ble_cont25387:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25388
	mr	r2, r6
	b	beq_cont25389
beq_else25388:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25390
	li	r2, 1
	b	beq_cont25391
beq_else25390:
	li	r2, 0
beq_cont25391:
beq_cont25389:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25392
	li	r2, 1
	b	beq_cont25393
beq_else25392:
	li	r2, 0
beq_cont25393:
	b	beq_cont25385
beq_else25384:
	fmul	f6, f0, f0
	lwz	r6, 16(r2)
	lfd	f7, 0(r6)
	fmul	f6, f6, f7
	fmul	f7, f2, f2
	lwz	r6, 16(r2)
	lfd	f8, 4(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r6, 16(r2)
	lfd	f8, 8(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r6, 12(r2)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25394
	fmr	f0, f6
	b	beq_cont25395
beq_else25394:
	fmul	f7, f2, f4
	lwz	r6, 36(r2)
	lfd	f8, 0(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f4, f4, f0
	lwz	r6, 36(r2)
	lfd	f7, 4(r6)
	fmul	f4, f4, f7
	fadd	f4, f6, f4
	fmul	f0, f0, f2
	lwz	r6, 36(r2)
	lfd	f2, 8(r6)
	fmul	f0, f0, f2
	fadd	f0, f4, f0
beq_cont25395:
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else25396
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
	fsub	f0, f0, f2
	b	beq_cont25397
beq_else25396:
beq_cont25397:
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25398
	li	r6, 0
	b	ble_cont25399
ble_else25398:
	li	r6, 1
ble_cont25399:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25400
	mr	r2, r6
	b	beq_cont25401
beq_else25400:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25402
	li	r2, 1
	b	beq_cont25403
beq_else25402:
	li	r2, 0
beq_cont25403:
beq_cont25401:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25404
	li	r2, 1
	b	beq_cont25405
beq_else25404:
	li	r2, 0
beq_cont25405:
beq_cont25385:
beq_cont25367:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25406
	lwz	r2, 8(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25408
	li	r2, 1
	b	beq_cont25409
beq_else25408:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	mflr	r31
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	is_outside2912
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25410
	li	r2, 3
	lfd	f0, 40(r3)
	lfd	f1, 32(r3)
	lfd	f2, 24(r3)
	lwz	r5, 4(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	check_all_inside2917
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	beq_cont25411
beq_else25410:
	li	r2, 0
beq_cont25411:
beq_cont25409:
	b	beq_cont25407
beq_else25406:
	li	r2, 0
beq_cont25407:
beq_cont25365:
	b	beq_cont25363
beq_else25362:
	li	r2, 0
beq_cont25363:
beq_cont25361:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25412
	b	beq_cont25413
beq_else25412:
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
beq_cont25413:
ble_cont25358:
ble_cont25356:
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
	bne	cr7, beq_else25414
	blr
beq_else25414:
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
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25416
	blr
beq_else25416:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25418
	blr
beq_else25418:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25420
	blr
beq_else25420:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25422
	blr
beq_else25422:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25424
	blr
beq_else25424:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element2932
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25426
	blr
beq_else25426:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element2932
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25428
	blr
beq_else25428:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_each_element2932
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
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
	bne	cr7, beq_else25430
	blr
beq_else25430:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else25432
	lwz	r8, 4(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else25434
	b	beq_cont25435
beq_else25434:
	lis	r9, lo16(min_caml_and_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_and_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_and_net)
	lwz	r9, 0(r9)
	slwi	r8, r8, 2
	add	r31, r9, r8
	lwz	r8, 0(r31)
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
	bne	cr7, beq_else25436
	b	beq_cont25437
beq_else25436:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25438
	b	beq_cont25439
beq_else25438:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25440
	b	beq_cont25441
beq_else25440:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25442
	b	beq_cont25443
beq_else25442:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25444
	b	beq_cont25445
beq_else25444:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25446
	b	beq_cont25447
beq_else25446:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 8
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network2936
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25447:
beq_cont25445:
beq_cont25443:
beq_cont25441:
beq_cont25439:
beq_cont25437:
beq_cont25435:
	b	beq_cont25433
beq_else25432:
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
	add	r31, r10, r8
	lwz	r8, 0(r31)
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
	bne	cr7, beq_else25448
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_rect2803
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont25449
beq_else25448:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else25450
	lwz	r8, 16(r8)
	lfd	f3, 0(r6)
	lfd	f4, 0(r8)
	fmul	f3, f3, f4
	lfd	f4, 4(r6)
	lfd	f5, 4(r8)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r6)
	lfd	f5, 8(r8)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25452
	li	r2, 0
	b	ble_cont25453
ble_else25452:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	lfd	f4, 0(r8)
	fmul	f0, f4, f0
	lfd	f4, 4(r8)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 8(r8)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fneg	f0, f0
	fdiv	f0, f0, f3
	stfd	f0, 0(r9)
	li	r2, 1
ble_cont25453:
	b	beq_cont25451
beq_else25450:
	mflr	r31
	mr	r5, r6
	mr	r2, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solver_second2828
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25451:
beq_cont25449:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25454
	b	beq_cont25455
beq_else25454:
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
	bgt	cr7, ble_else25456
	b	ble_cont25457
ble_else25456:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25458
	b	beq_cont25459
beq_else25458:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25460
	b	beq_cont25461
beq_else25460:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25462
	b	beq_cont25463
beq_else25462:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25464
	b	beq_cont25465
beq_else25464:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25466
	b	beq_cont25467
beq_else25466:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25468
	b	beq_cont25469
beq_else25468:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25470
	b	beq_cont25471
beq_else25470:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 8
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network2936
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25471:
beq_cont25469:
beq_cont25467:
beq_cont25465:
beq_cont25463:
beq_cont25461:
beq_cont25459:
ble_cont25457:
beq_cont25455:
beq_cont25433:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25472
	blr
beq_else25472:
	stw	r2, 16(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25474
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25476
	b	beq_cont25477
beq_else25476:
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
	lwz	r9, 0(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r6, r9
	mr	r5, r7
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25478
	b	beq_cont25479
beq_else25478:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25480
	b	beq_cont25481
beq_else25480:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25482
	b	beq_cont25483
beq_else25482:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25484
	b	beq_cont25485
beq_else25484:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25486
	b	beq_cont25487
beq_else25486:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 7
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network2936
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont25487:
beq_cont25485:
beq_cont25483:
beq_cont25481:
beq_cont25479:
beq_cont25477:
	b	beq_cont25475
beq_else25474:
	lis	r8, lo16(min_caml_startp)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_startp)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_startp)
	lwz	r8, 0(r8)
	lwz	r9, 0(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r6, r8
	mr	r5, r9
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver2834
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25488
	b	beq_cont25489
beq_else25488:
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
	bgt	cr7, ble_else25490
	b	ble_cont25491
ble_else25490:
	lwz	r2, 20(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25492
	b	beq_cont25493
beq_else25492:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25494
	b	beq_cont25495
beq_else25494:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25496
	b	beq_cont25497
beq_else25496:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25498
	b	beq_cont25499
beq_else25498:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25500
	b	beq_cont25501
beq_else25500:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 20(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25502
	b	beq_cont25503
beq_else25502:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 0(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element2932
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 7
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network2936
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont25503:
beq_cont25501:
beq_cont25499:
beq_cont25497:
beq_cont25495:
beq_cont25493:
ble_cont25491:
beq_cont25489:
beq_cont25475:
	lwz	r2, 16(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	trace_or_matrix2940
solve_each_element_fast2946:
	lwz	r7, 0(r6)
	slwi	r8, r2, 2
	add	r31, r5, r8
	lwz	r8, 0(r31)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else25504
	blr
beq_else25504:
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r8, 2
	add	r31, r9, r10
	lwz	r9, 0(r31)
	lwz	r10, 40(r9)
	lfd	f0, 0(r10)
	lfd	f1, 4(r10)
	lfd	f2, 8(r10)
	lwz	r11, 4(r6)
	slwi	r12, r8, 2
	add	r31, r11, r12
	lwz	r11, 0(r31)
	lwz	r12, 4(r9)
	stw	r7, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r2, 12(r3)
	stw	r8, 16(r3)
	cmpwi	cr7, r12, 1
	bne	cr7, beq_else25506
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
	b	beq_cont25507
beq_else25506:
	cmpwi	cr7, r12, 2
	bne	cr7, beq_else25508
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 0(r11)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25510
	li	r2, 0
	b	ble_cont25511
ble_else25510:
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
ble_cont25511:
	b	beq_cont25509
beq_else25508:
	lfd	f3, 0(r11)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else25512
	li	r2, 0
	b	beq_cont25513
beq_else25512:
	lfd	f4, 4(r11)
	fmul	f0, f4, f0
	lfd	f4, 8(r11)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r11)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 12(r10)
	fmul	f2, f0, f0
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else25514
	li	r2, 0
	b	ble_cont25515
ble_else25514:
	lwz	r9, 24(r9)
	cmpwi	cr7, r9, 0
	bne	cr7, beq_else25516
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	fsqrt	f1, f1
	fsub	f0, f0, f1
	lfd	f1, 16(r11)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
	b	beq_cont25517
beq_else25516:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	fsqrt	f1, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r11)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
beq_cont25517:
	li	r2, 1
ble_cont25515:
beq_cont25513:
beq_cont25509:
beq_cont25507:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25518
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
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25519
	blr
beq_else25519:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	b	solve_each_element_fast2946
beq_else25518:
	lis	r5, lo16(min_caml_solver_dist)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_solver_dist)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_solver_dist)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25521
	b	ble_cont25522
ble_else25521:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25523
	b	ble_cont25524
ble_else25523:
	lis	r31, lo16(l19503)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19503)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19503)
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
	bne	cr7, beq_else25525
	li	r2, 1
	b	beq_cont25526
beq_else25525:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
	bne	cr7, beq_else25527
	lwz	r5, 8(r3)
	lwz	r2, 4(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25529
	li	r2, 1
	b	beq_cont25530
beq_else25529:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	lwz	r6, 20(r2)
	lfd	f0, 0(r6)
	lfd	f1, 40(r3)
	fsub	f0, f1, f0
	lwz	r6, 20(r2)
	lfd	f2, 4(r6)
	lfd	f3, 32(r3)
	fsub	f2, f3, f2
	lwz	r6, 20(r2)
	lfd	f4, 8(r6)
	lfd	f5, 24(r3)
	fsub	f4, f5, f4
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else25531
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f7, 0(r31)
	fcmpu	cr7, f0, f7
	bgt	cr7, ble_else25533
	fneg	f0, f0
	b	ble_cont25534
ble_else25533:
ble_cont25534:
	fcmpu	cr7, f6, f0
	bgt	cr7, ble_else25535
	li	r6, 0
	b	ble_cont25536
ble_else25535:
	lwz	r6, 16(r2)
	lfd	f0, 4(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f6, 0(r31)
	fcmpu	cr7, f2, f6
	bgt	cr7, ble_else25537
	fneg	f2, f2
	b	ble_cont25538
ble_else25537:
ble_cont25538:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25539
	li	r6, 0
	b	ble_cont25540
ble_else25539:
	lwz	r6, 16(r2)
	lfd	f0, 8(r6)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f4, f2
	bgt	cr7, ble_else25541
	fneg	f2, f4
	b	ble_cont25542
ble_else25541:
	fmr	f2, f4
ble_cont25542:
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else25543
	li	r6, 0
	b	ble_cont25544
ble_else25543:
	li	r6, 1
ble_cont25544:
ble_cont25540:
ble_cont25536:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25545
	lwz	r2, 24(r2)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25547
	li	r2, 1
	b	beq_cont25548
beq_else25547:
	li	r2, 0
beq_cont25548:
	b	beq_cont25546
beq_else25545:
	lwz	r2, 24(r2)
beq_cont25546:
	b	beq_cont25532
beq_else25531:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else25549
	lwz	r6, 16(r2)
	lfd	f6, 0(r6)
	fmul	f0, f6, f0
	lfd	f6, 4(r6)
	fmul	f2, f6, f2
	fadd	f0, f0, f2
	lfd	f2, 8(r6)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25551
	li	r6, 0
	b	ble_cont25552
ble_else25551:
	li	r6, 1
ble_cont25552:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25553
	mr	r2, r6
	b	beq_cont25554
beq_else25553:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25555
	li	r2, 1
	b	beq_cont25556
beq_else25555:
	li	r2, 0
beq_cont25556:
beq_cont25554:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25557
	li	r2, 1
	b	beq_cont25558
beq_else25557:
	li	r2, 0
beq_cont25558:
	b	beq_cont25550
beq_else25549:
	fmul	f6, f0, f0
	lwz	r6, 16(r2)
	lfd	f7, 0(r6)
	fmul	f6, f6, f7
	fmul	f7, f2, f2
	lwz	r6, 16(r2)
	lfd	f8, 4(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f7, f4, f4
	lwz	r6, 16(r2)
	lfd	f8, 8(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	lwz	r6, 12(r2)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25559
	fmr	f0, f6
	b	beq_cont25560
beq_else25559:
	fmul	f7, f2, f4
	lwz	r6, 36(r2)
	lfd	f8, 0(r6)
	fmul	f7, f7, f8
	fadd	f6, f6, f7
	fmul	f4, f4, f0
	lwz	r6, 36(r2)
	lfd	f7, 4(r6)
	fmul	f4, f4, f7
	fadd	f4, f6, f4
	fmul	f0, f0, f2
	lwz	r6, 36(r2)
	lfd	f2, 8(r6)
	fmul	f0, f0, f2
	fadd	f0, f4, f0
beq_cont25560:
	lwz	r6, 4(r2)
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else25561
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
	fsub	f0, f0, f2
	b	beq_cont25562
beq_else25561:
beq_cont25562:
	lwz	r2, 24(r2)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25563
	li	r6, 0
	b	ble_cont25564
ble_else25563:
	li	r6, 1
ble_cont25564:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25565
	mr	r2, r6
	b	beq_cont25566
beq_else25565:
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25567
	li	r2, 1
	b	beq_cont25568
beq_else25567:
	li	r2, 0
beq_cont25568:
beq_cont25566:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25569
	li	r2, 1
	b	beq_cont25570
beq_else25569:
	li	r2, 0
beq_cont25570:
beq_cont25550:
beq_cont25532:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25571
	lwz	r2, 8(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else25573
	li	r2, 1
	b	beq_cont25574
beq_else25573:
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r2, r2, 2
	add	r31, r6, r2
	lwz	r2, 0(r31)
	mflr	r31
	fmr	f2, f5
	fmr	f0, f1
	fmr	f1, f3
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	is_outside2912
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25575
	li	r2, 3
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
	b	beq_cont25576
beq_else25575:
	li	r2, 0
beq_cont25576:
beq_cont25574:
	b	beq_cont25572
beq_else25571:
	li	r2, 0
beq_cont25572:
beq_cont25530:
	b	beq_cont25528
beq_else25527:
	li	r2, 0
beq_cont25528:
beq_cont25526:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25577
	b	beq_cont25578
beq_else25577:
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
beq_cont25578:
ble_cont25524:
ble_cont25522:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	b	solve_each_element_fast2946
solve_one_or_network_fast2950:
	slwi	r7, r2, 2
	add	r31, r5, r7
	lwz	r7, 0(r31)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25579
	blr
beq_else25579:
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
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25581
	blr
beq_else25581:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25583
	blr
beq_else25583:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25585
	blr
beq_else25585:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
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
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25587
	blr
beq_else25587:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 24(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_each_element_fast2946
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25589
	blr
beq_else25589:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 28(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25591
	blr
beq_else25591:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 32(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25593
	blr
beq_else25593:
	lis	r7, lo16(min_caml_and_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_and_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_and_net)
	lwz	r7, 0(r7)
	slwi	r5, r5, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	li	r7, 0
	lwz	r8, 0(r3)
	stw	r2, 36(r3)
	mflr	r31
	mr	r6, r8
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	solve_each_element_fast2946
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
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
	bne	cr7, beq_else25595
	blr
beq_else25595:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else25597
	lwz	r8, 4(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else25599
	b	beq_cont25600
beq_else25599:
	lis	r9, lo16(min_caml_and_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_and_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_and_net)
	lwz	r9, 0(r9)
	slwi	r8, r8, 2
	add	r31, r9, r8
	lwz	r8, 0(r31)
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
	bne	cr7, beq_else25601
	b	beq_cont25602
beq_else25601:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25603
	b	beq_cont25604
beq_else25603:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25605
	b	beq_cont25606
beq_else25605:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25607
	b	beq_cont25608
beq_else25607:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25609
	b	beq_cont25610
beq_else25609:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25611
	b	beq_cont25612
beq_else25611:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 8
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25612:
beq_cont25610:
beq_cont25608:
beq_cont25606:
beq_cont25604:
beq_cont25602:
beq_cont25600:
	b	beq_cont25598
beq_else25597:
	lis	r9, lo16(min_caml_objects)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_objects)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_objects)
	lwz	r9, 0(r9)
	slwi	r10, r8, 2
	add	r31, r9, r10
	lwz	r9, 0(r31)
	lwz	r10, 40(r9)
	lfd	f0, 0(r10)
	lfd	f1, 4(r10)
	lfd	f2, 8(r10)
	lwz	r11, 4(r6)
	slwi	r8, r8, 2
	add	r31, r11, r8
	lwz	r8, 0(r31)
	lwz	r11, 4(r9)
	stw	r7, 12(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else25613
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
	b	beq_cont25614
beq_else25613:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else25615
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lfd	f1, 0(r8)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25617
	li	r2, 0
	b	ble_cont25618
ble_else25617:
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
ble_cont25618:
	b	beq_cont25616
beq_else25615:
	lfd	f3, 0(r8)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else25619
	li	r2, 0
	b	beq_cont25620
beq_else25619:
	lfd	f4, 4(r8)
	fmul	f0, f4, f0
	lfd	f4, 8(r8)
	fmul	f1, f4, f1
	fadd	f0, f0, f1
	lfd	f1, 12(r8)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 12(r10)
	fmul	f2, f0, f0
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else25621
	li	r2, 0
	b	ble_cont25622
ble_else25621:
	lwz	r9, 24(r9)
	cmpwi	cr7, r9, 0
	bne	cr7, beq_else25623
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	fsqrt	f1, f1
	fsub	f0, f0, f1
	lfd	f1, 16(r8)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
	b	beq_cont25624
beq_else25623:
	lis	r9, lo16(min_caml_solver_dist)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_solver_dist)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_solver_dist)
	lwz	r9, 0(r9)
	fsqrt	f1, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r8)
	fmul	f0, f0, f1
	stfd	f0, 0(r9)
beq_cont25624:
	li	r2, 1
ble_cont25622:
beq_cont25620:
beq_cont25616:
beq_cont25614:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25625
	b	beq_cont25626
beq_else25625:
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
	bgt	cr7, ble_else25627
	b	ble_cont25628
ble_else25627:
	lwz	r2, 12(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25629
	b	beq_cont25630
beq_else25629:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25631
	b	beq_cont25632
beq_else25631:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25633
	b	beq_cont25634
beq_else25633:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25635
	b	beq_cont25636
beq_else25635:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25637
	b	beq_cont25638
beq_else25637:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25639
	b	beq_cont25640
beq_else25639:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 28(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25641
	b	beq_cont25642
beq_else25641:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 8
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25642:
beq_cont25640:
beq_cont25638:
beq_cont25636:
beq_cont25634:
beq_cont25632:
beq_cont25630:
ble_cont25628:
beq_cont25626:
beq_cont25598:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r7, 0(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25643
	blr
beq_else25643:
	stw	r2, 16(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25645
	lwz	r7, 4(r5)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25647
	b	beq_cont25648
beq_else25647:
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
	bne	cr7, beq_else25649
	b	beq_cont25650
beq_else25649:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25651
	b	beq_cont25652
beq_else25651:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25653
	b	beq_cont25654
beq_else25653:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25655
	b	beq_cont25656
beq_else25655:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25657
	b	beq_cont25658
beq_else25657:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 7
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont25658:
beq_cont25656:
beq_cont25654:
beq_cont25652:
beq_cont25650:
beq_cont25648:
	b	beq_cont25646
beq_else25645:
	lwz	r8, 0(r3)
	stw	r5, 20(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver_fast22875
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25659
	b	beq_cont25660
beq_else25659:
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
	bgt	cr7, ble_else25661
	b	ble_cont25662
ble_else25661:
	lwz	r2, 20(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25663
	b	beq_cont25664
beq_else25663:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	bne	cr7, beq_else25665
	b	beq_cont25666
beq_else25665:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25667
	b	beq_cont25668
beq_else25667:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25669
	b	beq_cont25670
beq_else25669:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25671
	b	beq_cont25672
beq_else25671:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25673
	b	beq_cont25674
beq_else25673:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	li	r2, 7
	lwz	r5, 20(r3)
	lwz	r6, 0(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont25674:
beq_cont25672:
beq_cont25670:
beq_cont25668:
beq_cont25666:
beq_cont25664:
ble_cont25662:
beq_cont25660:
beq_cont25646:
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
	bne	cr7, beq_else25675
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
	b	beq_cont25676
beq_else25675:
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	fadd	f0, f5, f0
	stfd	f0, 8(r5)
beq_cont25676:
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r2, 24(r2)
	lfd	f0, 0(r5)
	lfd	f1, 0(r5)
	fmul	f0, f0, f1
	lfd	f1, 4(r5)
	lfd	f2, 4(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 8(r5)
	lfd	f2, 8(r5)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else25677
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	b	beq_cont25678
beq_else25677:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25679
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont25680
beq_else25679:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont25680:
beq_cont25678:
	lfd	f1, 0(r5)
	fmul	f1, f1, f0
	stfd	f1, 0(r5)
	lfd	f1, 4(r5)
	fmul	f1, f1, f0
	stfd	f1, 4(r5)
	lfd	f1, 8(r5)
	fmul	f0, f1, f0
	stfd	f0, 8(r5)
	blr
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
	bne	cr7, beq_else25682
	lfd	f0, 0(r5)
	lwz	r6, 20(r2)
	lfd	f1, 0(r6)
	fsub	f0, f0, f1
	lis	r31, lo16(l20013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20013)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l20014)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20014)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20014)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l20003)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20003)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20003)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25683
	li	r6, 0
	b	ble_cont25684
ble_else25683:
	li	r6, 1
ble_cont25684:
	lfd	f0, 8(r5)
	lwz	r2, 20(r2)
	lfd	f1, 8(r2)
	fsub	f0, f0, f1
	lis	r31, lo16(l20013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20013)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	floor	f1, f1
	lis	r31, lo16(l20014)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20014)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20014)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l20003)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20003)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20003)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25685
	li	r2, 0
	b	ble_cont25686
ble_else25685:
	li	r2, 1
ble_cont25686:
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else25687
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25689
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f0, 0(r31)
	b	beq_cont25690
beq_else25689:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
beq_cont25690:
	b	beq_cont25688
beq_else25687:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25691
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont25692
beq_else25691:
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f0, 0(r31)
beq_cont25692:
beq_cont25688:
	stfd	f0, 4(r5)
	blr
beq_else25682:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else25694
	lfd	f0, 4(r5)
	lis	r31, lo16(l20007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20007)
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
	lis	r31, lo16(l20007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20007)
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
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f1, 0(r31)
	fmul	f1, f1, f0
	stfd	f1, 0(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f1, 0(r31)
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 4(r2)
	blr
beq_else25694:
	cmpwi	cr7, r6, 3
	bne	cr7, beq_else25697
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
	fsqrt	f0, f0
	lis	r31, lo16(l20003)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20003)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20003)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l19991)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19991)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19991)
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
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f1, 0(r31)
	fmul	f1, f0, f1
	stfd	f1, 4(r2)
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else25697:
	cmpwi	cr7, r6, 4
	bne	cr7, beq_else25699
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
	lis	r31, lo16(l19988)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19988)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19988)
	lfd	f3, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f0, f4
	bgt	cr7, ble_else25700
	fneg	f4, f0
	b	ble_cont25701
ble_else25700:
	fmr	f4, f0
ble_cont25701:
	stfd	f2, 32(r3)
	stw	r2, 40(r3)
	stw	r5, 0(r3)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25702
	fdiv	f3, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else25704
	fdiv	f0, f1, f0
	fneg	f0, f0
	b	ble_cont25705
ble_else25704:
	fdiv	f0, f1, f0
ble_cont25705:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_atan
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lis	r31, lo16(l19990)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19990)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19990)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l19991)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19991)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19991)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont25703
ble_else25702:
	lis	r31, lo16(l19989)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19989)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19989)
	lfd	f0, 0(r31)
ble_cont25703:
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
	lis	r31, lo16(l19988)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19988)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19988)
	lfd	f2, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	lfd	f4, 32(r3)
	fcmpu	cr7, f4, f3
	bgt	cr7, ble_else25706
	fneg	f3, f4
	b	ble_cont25707
ble_else25706:
	fmr	f3, f4
ble_cont25707:
	stfd	f0, 48(r3)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else25709
	fdiv	f2, f1, f4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else25711
	fdiv	f1, f1, f4
	fneg	f1, f1
	b	ble_cont25712
ble_else25711:
	fdiv	f1, f1, f4
ble_cont25712:
	mflr	r31
	fmr	f0, f1
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_atan
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r31, lo16(l19990)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19990)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19990)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l19991)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19991)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19991)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	b	ble_cont25710
ble_else25709:
	lis	r31, lo16(l19989)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19989)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19989)
	lfd	f0, 0(r31)
ble_cont25710:
	floor	f1, f0
	fsub	f0, f0, f1
	lis	r31, lo16(l19995)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19995)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19995)
	lfd	f1, 0(r31)
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f2, 0(r31)
	lfd	f3, 48(r3)
	fsub	f2, f2, f3
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f4, 0(r31)
	fsub	f3, f4, f3
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f2, 0(r31)
	fsub	f2, f2, f0
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f3, 0(r31)
	fsub	f0, f3, f0
	fmul	f0, f2, f0
	fsub	f0, f1, f0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25713
	b	ble_cont25714
ble_else25713:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
ble_cont25714:
	lis	r2, lo16(min_caml_texture_color)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_texture_color)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_texture_color)
	lwz	r2, 0(r2)
	lis	r31, lo16(l19996)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19996)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19996)
	lfd	f1, 0(r31)
	fmul	f0, f1, f0
	lis	r31, lo16(l19997)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19997)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19997)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 8(r2)
	blr
beq_else25699:
	blr
add_light2972:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else25717
	b	ble_cont25718
ble_else25717:
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
ble_cont25718:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25719
	blr
ble_else25719:
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
	blt	cr7, bge_else25722
	lis	r6, lo16(min_caml_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_reflections)
	lwz	r6, 0(r6)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	lwz	r7, 4(r6)
	lis	r8, lo16(min_caml_tmin)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_tmin)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_tmin)
	lwz	r8, 0(r8)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
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
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25725
	li	r2, 0
	b	ble_cont25726
ble_else25725:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25727
	li	r2, 0
	b	ble_cont25728
ble_else25727:
	li	r2, 1
ble_cont25728:
ble_cont25726:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25729
	b	beq_cont25730
beq_else25729:
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
	bne	cr7, beq_else25731
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	lwz	r6, 0(r2)
	lwz	r7, 0(r6)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else25733
	li	r2, 0
	b	beq_cont25734
beq_else25733:
	stw	r6, 40(r3)
	stw	r2, 44(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else25735
	li	r2, 1
	b	beq_cont25736
beq_else25735:
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
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	solver_fast2857
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25737
	li	r2, 0
	b	beq_cont25738
beq_else25737:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25739
	li	r2, 0
	b	ble_cont25740
ble_else25739:
	lwz	r2, 40(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25741
	li	r2, 0
	b	beq_cont25742
beq_else25741:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25743
	lwz	r2, 40(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25745
	li	r2, 0
	b	beq_cont25746
beq_else25745:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25747
	lwz	r2, 40(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25749
	li	r2, 0
	b	beq_cont25750
beq_else25749:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25751
	lwz	r2, 40(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25753
	li	r2, 0
	b	beq_cont25754
beq_else25753:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25755
	lwz	r2, 40(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25757
	li	r2, 0
	b	beq_cont25758
beq_else25757:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25759
	lwz	r2, 40(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25761
	li	r2, 0
	b	beq_cont25762
beq_else25761:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25763
	li	r2, 7
	lwz	r5, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont25764
beq_else25763:
	li	r2, 1
beq_cont25764:
beq_cont25762:
	b	beq_cont25760
beq_else25759:
	li	r2, 1
beq_cont25760:
beq_cont25758:
	b	beq_cont25756
beq_else25755:
	li	r2, 1
beq_cont25756:
beq_cont25754:
	b	beq_cont25752
beq_else25751:
	li	r2, 1
beq_cont25752:
beq_cont25750:
	b	beq_cont25748
beq_else25747:
	li	r2, 1
beq_cont25748:
beq_cont25746:
	b	beq_cont25744
beq_else25743:
	li	r2, 1
beq_cont25744:
beq_cont25742:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25765
	li	r2, 0
	b	beq_cont25766
beq_else25765:
	li	r2, 1
beq_cont25766:
ble_cont25740:
beq_cont25738:
beq_cont25736:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25767
	li	r2, 1
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont25768
beq_else25767:
	lwz	r2, 40(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25769
	li	r2, 0
	b	beq_cont25770
beq_else25769:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25771
	lwz	r2, 40(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25773
	li	r2, 0
	b	beq_cont25774
beq_else25773:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25775
	lwz	r2, 40(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25777
	li	r2, 0
	b	beq_cont25778
beq_else25777:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25779
	lwz	r2, 40(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25781
	li	r2, 0
	b	beq_cont25782
beq_else25781:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25783
	lwz	r2, 40(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25785
	li	r2, 0
	b	beq_cont25786
beq_else25785:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25787
	lwz	r2, 40(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25789
	li	r2, 0
	b	beq_cont25790
beq_else25789:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_and_group2923
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25791
	li	r2, 7
	lwz	r5, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont25792
beq_else25791:
	li	r2, 1
beq_cont25792:
beq_cont25790:
	b	beq_cont25788
beq_else25787:
	li	r2, 1
beq_cont25788:
beq_cont25786:
	b	beq_cont25784
beq_else25783:
	li	r2, 1
beq_cont25784:
beq_cont25782:
	b	beq_cont25780
beq_else25779:
	li	r2, 1
beq_cont25780:
beq_cont25778:
	b	beq_cont25776
beq_else25775:
	li	r2, 1
beq_cont25776:
beq_cont25774:
	b	beq_cont25772
beq_else25771:
	li	r2, 1
beq_cont25772:
beq_cont25770:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25793
	li	r2, 1
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont25794
beq_else25793:
	li	r2, 1
beq_cont25794:
beq_cont25768:
beq_cont25734:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25795
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else25797
	b	ble_cont25798
ble_else25797:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_texture_color)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_texture_color)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_texture_color)
	lwz	r6, 0(r6)
	lfd	f3, 0(r2)
	lfd	f4, 0(r6)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 0(r2)
	lfd	f3, 4(r2)
	lfd	f4, 4(r6)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 4(r2)
	lfd	f3, 8(r2)
	lfd	f4, 8(r6)
	fmul	f0, f0, f4
	fadd	f0, f3, f0
	stfd	f0, 8(r2)
ble_cont25798:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25799
	b	ble_cont25800
ble_else25799:
	fmul	f0, f1, f1
	fmul	f1, f1, f1
	fmul	f0, f0, f1
	lfd	f1, 8(r3)
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 0(r6)
	fadd	f3, f3, f0
	stfd	f3, 0(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 4(r6)
	fadd	f3, f3, f0
	stfd	f3, 4(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 8(r6)
	fadd	f0, f3, f0
	stfd	f0, 8(r2)
ble_cont25800:
	b	beq_cont25796
beq_else25795:
beq_cont25796:
	b	beq_cont25732
beq_else25731:
beq_cont25732:
beq_cont25730:
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else25801
	lis	r5, lo16(min_caml_reflections)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_reflections)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_reflections)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 4(r5)
	lis	r7, lo16(min_caml_tmin)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_tmin)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_tmin)
	lwz	r7, 0(r7)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
	lfd	f0, 0(r31)
	stfd	f0, 0(r7)
	lis	r7, lo16(min_caml_or_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_or_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_or_net)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	lwz	r8, 0(r7)
	lwz	r9, 0(r8)
	stw	r2, 48(r3)
	stw	r6, 52(r3)
	stw	r5, 56(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else25802
	b	beq_cont25803
beq_else25802:
	stw	r7, 60(r3)
	cmpwi	cr7, r9, 99
	bne	cr7, beq_else25804
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else25806
	b	beq_cont25807
beq_else25806:
	lis	r10, lo16(min_caml_and_net)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_and_net)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_and_net)
	lwz	r10, 0(r10)
	slwi	r9, r9, 2
	add	r31, r10, r9
	lwz	r9, 0(r31)
	li	r10, 0
	stw	r8, 64(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r10
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25808
	b	beq_cont25809
beq_else25808:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25810
	b	beq_cont25811
beq_else25810:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25812
	b	beq_cont25813
beq_else25812:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 64(r3)
	lwz	r6, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
beq_cont25813:
beq_cont25811:
beq_cont25809:
beq_cont25807:
	b	beq_cont25805
beq_else25804:
	stw	r8, 64(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solver_fast22875
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25814
	b	beq_cont25815
beq_else25814:
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
	bgt	cr7, ble_else25816
	b	ble_cont25817
ble_else25816:
	lwz	r2, 64(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25818
	b	beq_cont25819
beq_else25818:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25820
	b	beq_cont25821
beq_else25820:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25822
	b	beq_cont25823
beq_else25822:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 64(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25824
	b	beq_cont25825
beq_else25824:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 52(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_each_element_fast2946
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 64(r3)
	lwz	r6, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
beq_cont25825:
beq_cont25823:
beq_cont25821:
beq_cont25819:
ble_cont25817:
beq_cont25815:
beq_cont25805:
	li	r2, 1
	lwz	r5, 60(r3)
	lwz	r6, 52(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
beq_cont25803:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25826
	li	r2, 0
	b	ble_cont25827
ble_else25826:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25828
	li	r2, 0
	b	ble_cont25829
ble_else25828:
	li	r2, 1
ble_cont25829:
ble_cont25827:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25830
	b	beq_cont25831
beq_else25830:
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
	lwz	r5, 56(r3)
	lwz	r6, 0(r5)
	cmpw	cr7, r2, r6
	bne	cr7, beq_else25832
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
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25834
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 52(r3)
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
	lwz	r2, 56(r3)
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
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	add_light2972
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	beq_cont25835
beq_else25834:
beq_cont25835:
	b	beq_cont25833
beq_else25832:
beq_cont25833:
beq_cont25831:
	lwz	r2, 48(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 16(r3)
	b	trace_reflections2976
bge_else25801:
	blr
bge_else25722:
	blr
trace_ray2981:
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else25838
	lwz	r7, 8(r6)
	lis	r8, lo16(min_caml_tmin)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_tmin)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_tmin)
	lwz	r8, 0(r8)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
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
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25840
	li	r2, 0
	b	ble_cont25841
ble_else25840:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25842
	li	r2, 0
	b	ble_cont25843
ble_else25842:
	li	r2, 1
ble_cont25843:
ble_cont25841:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25844
	li	r2, -1
	lwz	r5, 32(r3)
	slwi	r6, r5, 2
	lwz	r7, 28(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else25845
	blr
beq_else25845:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25847
	blr
ble_else25847:
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
beq_else25844:
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
	bne	cr7, beq_else25850
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r10, r7
	lfd	f2, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bne	cr7, beq_else25852
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	b	beq_cont25853
beq_else25852:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f2, f3
	bgt	cr7, ble_else25854
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f2, 0(r31)
	b	ble_cont25855
ble_else25854:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f2, 0(r31)
ble_cont25855:
beq_cont25853:
	fneg	f2, f2
	slwi	r7, r9, 2
	add	r31, r8, r7
	stfd	f2, 0(r31)
	b	beq_cont25851
beq_else25850:
	cmpwi	cr7, r7, 2
	bne	cr7, beq_else25856
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
	b	beq_cont25857
beq_else25856:
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	get_nvector_second2964
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont25857:
beq_cont25851:
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	lwz	r2, 8(r3)
	lwz	r6, 4(r2)
	slwi	r8, r5, 2
	add	r31, r6, r8
	lwz	r6, 0(r31)
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
	lis	r31, lo16(l19111)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19111)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19111)
	lfd	f0, 0(r31)
	lwz	r8, 52(r3)
	lwz	r9, 28(r8)
	lfd	f1, 0(r9)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25858
	li	r9, 1
	slwi	r10, r5, 2
	add	r31, r6, r10
	stw	r9, 0(r31)
	lwz	r6, 16(r2)
	slwi	r9, r5, 2
	add	r31, r6, r9
	lwz	r9, 0(r31)
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
	add	r31, r6, r9
	lwz	r6, 0(r31)
	lis	r31, lo16(l20179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20179)
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
	add	r31, r6, r9
	lwz	r6, 0(r31)
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
	b	ble_cont25859
ble_else25858:
	li	r9, 0
	slwi	r10, r5, 2
	add	r31, r6, r10
	stw	r9, 0(r31)
ble_cont25859:
	lis	r31, lo16(l20193)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20193)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20193)
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
	lis	r6, lo16(min_caml_or_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_or_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_or_net)
	lwz	r6, 0(r6)
	lwz	r6, 0(r6)
	lwz	r10, 0(r6)
	lwz	r11, 0(r10)
	stfd	f0, 56(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else25860
	li	r2, 0
	b	beq_cont25861
beq_else25860:
	stw	r10, 64(r3)
	stw	r6, 68(r3)
	cmpwi	cr7, r11, 99
	bne	cr7, beq_else25862
	li	r2, 1
	b	beq_cont25863
beq_else25862:
	lis	r12, lo16(min_caml_light_dirvec)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_light_dirvec)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_light_dirvec)
	lwz	r12, 0(r12)
	lis	r13, lo16(min_caml_intersection_point)
	srwi	r13, r13, 31
	addi	r13, r13, ha16(min_caml_intersection_point)
	slwi	r13, r13, 16
	addi	r13, r13, lo16(min_caml_intersection_point)
	lwz	r13, 0(r13)
	mflr	r31
	mr	r6, r13
	mr	r5, r12
	mr	r2, r11
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	solver_fast2857
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25864
	li	r2, 0
	b	beq_cont25865
beq_else25864:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25866
	li	r2, 0
	b	ble_cont25867
ble_else25866:
	lwz	r2, 64(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25868
	li	r2, 0
	b	beq_cont25869
beq_else25868:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25870
	lwz	r2, 64(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25872
	li	r2, 0
	b	beq_cont25873
beq_else25872:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25874
	lwz	r2, 64(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25876
	li	r2, 0
	b	beq_cont25877
beq_else25876:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25878
	lwz	r2, 64(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25880
	li	r2, 0
	b	beq_cont25881
beq_else25880:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25882
	lwz	r2, 64(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25884
	li	r2, 0
	b	beq_cont25885
beq_else25884:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25886
	lwz	r2, 64(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25888
	li	r2, 0
	b	beq_cont25889
beq_else25888:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25890
	li	r2, 7
	lwz	r5, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont25891
beq_else25890:
	li	r2, 1
beq_cont25891:
beq_cont25889:
	b	beq_cont25887
beq_else25886:
	li	r2, 1
beq_cont25887:
beq_cont25885:
	b	beq_cont25883
beq_else25882:
	li	r2, 1
beq_cont25883:
beq_cont25881:
	b	beq_cont25879
beq_else25878:
	li	r2, 1
beq_cont25879:
beq_cont25877:
	b	beq_cont25875
beq_else25874:
	li	r2, 1
beq_cont25875:
beq_cont25873:
	b	beq_cont25871
beq_else25870:
	li	r2, 1
beq_cont25871:
beq_cont25869:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25892
	li	r2, 0
	b	beq_cont25893
beq_else25892:
	li	r2, 1
beq_cont25893:
ble_cont25867:
beq_cont25865:
beq_cont25863:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25894
	li	r2, 1
	lwz	r5, 68(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont25895
beq_else25894:
	lwz	r2, 64(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25896
	li	r2, 0
	b	beq_cont25897
beq_else25896:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25898
	lwz	r2, 64(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25900
	li	r2, 0
	b	beq_cont25901
beq_else25900:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25902
	lwz	r2, 64(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25904
	li	r2, 0
	b	beq_cont25905
beq_else25904:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25906
	lwz	r2, 64(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25908
	li	r2, 0
	b	beq_cont25909
beq_else25908:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25910
	lwz	r2, 64(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25912
	li	r2, 0
	b	beq_cont25913
beq_else25912:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25914
	lwz	r2, 64(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25916
	li	r2, 0
	b	beq_cont25917
beq_else25916:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_and_group2923
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25918
	li	r2, 7
	lwz	r5, 64(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont25919
beq_else25918:
	li	r2, 1
beq_cont25919:
beq_cont25917:
	b	beq_cont25915
beq_else25914:
	li	r2, 1
beq_cont25915:
beq_cont25913:
	b	beq_cont25911
beq_else25910:
	li	r2, 1
beq_cont25911:
beq_cont25909:
	b	beq_cont25907
beq_else25906:
	li	r2, 1
beq_cont25907:
beq_cont25905:
	b	beq_cont25903
beq_else25902:
	li	r2, 1
beq_cont25903:
beq_cont25901:
	b	beq_cont25899
beq_else25898:
	li	r2, 1
beq_cont25899:
beq_cont25897:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25920
	li	r2, 1
	lwz	r5, 68(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont25921
beq_else25920:
	li	r2, 1
beq_cont25921:
beq_cont25895:
beq_cont25861:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25922
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	fcmpu	cr7, f0, f3
	bgt	cr7, ble_else25924
	b	ble_cont25925
ble_else25924:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_texture_color)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_texture_color)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_texture_color)
	lwz	r6, 0(r6)
	lfd	f3, 0(r2)
	lfd	f4, 0(r6)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 0(r2)
	lfd	f3, 4(r2)
	lfd	f4, 4(r6)
	fmul	f4, f0, f4
	fadd	f3, f3, f4
	stfd	f3, 4(r2)
	lfd	f3, 8(r2)
	lfd	f4, 8(r6)
	fmul	f0, f0, f4
	fadd	f0, f3, f0
	stfd	f0, 8(r2)
ble_cont25925:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else25926
	b	ble_cont25927
ble_else25926:
	fmul	f0, f2, f2
	fmul	f2, f2, f2
	fmul	f0, f0, f2
	lfd	f2, 56(r3)
	fmul	f0, f0, f2
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 0(r6)
	fadd	f3, f3, f0
	stfd	f3, 0(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 4(r6)
	fadd	f3, f3, f0
	stfd	f3, 4(r2)
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lis	r6, lo16(min_caml_rgb)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_rgb)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_rgb)
	lwz	r6, 0(r6)
	lfd	f3, 8(r6)
	fadd	f0, f3, f0
	stfd	f0, 8(r2)
ble_cont25927:
	b	beq_cont25923
beq_else25922:
beq_cont25923:
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
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	setup_startp_constants2892
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_n_reflections)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_reflections)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_reflections)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else25928
	lis	r5, lo16(min_caml_reflections)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_reflections)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_reflections)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 4(r5)
	lis	r7, lo16(min_caml_tmin)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_tmin)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_tmin)
	lwz	r7, 0(r7)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
	lfd	f0, 0(r31)
	stfd	f0, 0(r7)
	lis	r7, lo16(min_caml_or_net)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_or_net)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_or_net)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	lwz	r8, 0(r7)
	lwz	r9, 0(r8)
	stw	r2, 72(r3)
	stw	r6, 76(r3)
	stw	r5, 80(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else25930
	b	beq_cont25931
beq_else25930:
	stw	r7, 84(r3)
	cmpwi	cr7, r9, 99
	bne	cr7, beq_else25932
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else25934
	b	beq_cont25935
beq_else25934:
	lis	r10, lo16(min_caml_and_net)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_and_net)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_and_net)
	lwz	r10, 0(r10)
	slwi	r9, r9, 2
	add	r31, r10, r9
	lwz	r9, 0(r31)
	li	r10, 0
	stw	r8, 88(r3)
	mflr	r31
	mr	r5, r9
	mr	r2, r10
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25936
	b	beq_cont25937
beq_else25936:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25938
	b	beq_cont25939
beq_else25938:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25940
	b	beq_cont25941
beq_else25940:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 88(r3)
	lwz	r6, 76(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
beq_cont25941:
beq_cont25939:
beq_cont25937:
beq_cont25935:
	b	beq_cont25933
beq_else25932:
	stw	r8, 88(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r9
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solver_fast22875
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25942
	b	beq_cont25943
beq_else25942:
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
	bgt	cr7, ble_else25944
	b	ble_cont25945
ble_else25944:
	lwz	r2, 88(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25946
	b	beq_cont25947
beq_else25946:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25948
	b	beq_cont25949
beq_else25948:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25950
	b	beq_cont25951
beq_else25950:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 88(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25952
	b	beq_cont25953
beq_else25952:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 76(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_each_element_fast2946
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 88(r3)
	lwz	r6, 76(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
beq_cont25953:
beq_cont25951:
beq_cont25949:
beq_cont25947:
ble_cont25945:
beq_cont25943:
beq_cont25933:
	li	r2, 1
	lwz	r5, 84(r3)
	lwz	r6, 76(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
beq_cont25931:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25954
	li	r2, 0
	b	ble_cont25955
ble_else25954:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25956
	li	r2, 0
	b	ble_cont25957
ble_else25956:
	li	r2, 1
ble_cont25957:
ble_cont25955:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25958
	b	beq_cont25959
beq_else25958:
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
	lwz	r5, 80(r3)
	lwz	r6, 0(r5)
	cmpw	cr7, r2, r6
	bne	cr7, beq_else25960
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
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25962
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lwz	r5, 76(r3)
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
	lwz	r2, 80(r3)
	lfd	f1, 8(r2)
	lfd	f2, 40(r3)
	fmul	f3, f1, f2
	fmul	f0, f3, f0
	lwz	r2, 0(r5)
	lwz	r5, 24(r3)
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
	lfd	f3, 56(r3)
	mflr	r31
	fmr	f2, f3
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	add_light2972
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	beq_cont25963
beq_else25962:
beq_cont25963:
	b	beq_cont25961
beq_else25960:
beq_cont25961:
beq_cont25959:
	lwz	r2, 72(r3)
	subi	r2, r2, 1
	lfd	f0, 40(r3)
	lfd	f1, 56(r3)
	lwz	r5, 24(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	trace_reflections2976
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	b	bge_cont25929
bge_else25928:
bge_cont25929:
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25964
	blr
ble_else25964:
	lwz	r2, 32(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else25966
	b	bge_cont25967
bge_else25966:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 28(r3)
	add	r31, r7, r5
	stw	r6, 0(r31)
bge_cont25967:
	lwz	r5, 36(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else25968
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
beq_else25968:
	blr
ble_else25838:
	blr
trace_diffuse_ray2987:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
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
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25971
	li	r2, 0
	b	ble_cont25972
ble_else25971:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else25973
	li	r2, 0
	b	ble_cont25974
ble_else25973:
	li	r2, 1
ble_cont25974:
ble_cont25972:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25975
	blr
beq_else25975:
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
	lwz	r5, 0(r5)
	lwz	r6, 4(r2)
	stw	r2, 12(r3)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else25977
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r5, r6
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else25979
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont25980
beq_else25979:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25981
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f0, 0(r31)
	b	ble_cont25982
ble_else25981:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
ble_cont25982:
beq_cont25980:
	fneg	f0, f0
	slwi	r5, r8, 2
	add	r31, r7, r5
	stfd	f0, 0(r31)
	b	beq_cont25978
beq_else25977:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else25983
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
	b	beq_cont25984
beq_else25983:
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	get_nvector_second2964
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont25984:
beq_cont25978:
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
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	lwz	r5, 0(r2)
	lwz	r2, 0(r5)
	lwz	r6, 0(r2)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else25985
	li	r2, 0
	b	beq_cont25986
beq_else25985:
	stw	r2, 16(r3)
	stw	r5, 20(r3)
	cmpwi	cr7, r6, 99
	bne	cr7, beq_else25987
	li	r2, 1
	b	beq_cont25988
beq_else25987:
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
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	solver_fast2857
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25989
	li	r2, 0
	b	beq_cont25990
beq_else25989:
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else25991
	li	r2, 0
	b	ble_cont25992
ble_else25991:
	lwz	r2, 16(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25993
	li	r2, 0
	b	beq_cont25994
beq_else25993:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25995
	lwz	r2, 16(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else25997
	li	r2, 0
	b	beq_cont25998
beq_else25997:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else25999
	lwz	r2, 16(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26001
	li	r2, 0
	b	beq_cont26002
beq_else26001:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26003
	lwz	r2, 16(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26005
	li	r2, 0
	b	beq_cont26006
beq_else26005:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26007
	lwz	r2, 16(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26009
	li	r2, 0
	b	beq_cont26010
beq_else26009:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26011
	lwz	r2, 16(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26013
	li	r2, 0
	b	beq_cont26014
beq_else26013:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26015
	li	r2, 7
	lwz	r5, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont26016
beq_else26015:
	li	r2, 1
beq_cont26016:
beq_cont26014:
	b	beq_cont26012
beq_else26011:
	li	r2, 1
beq_cont26012:
beq_cont26010:
	b	beq_cont26008
beq_else26007:
	li	r2, 1
beq_cont26008:
beq_cont26006:
	b	beq_cont26004
beq_else26003:
	li	r2, 1
beq_cont26004:
beq_cont26002:
	b	beq_cont26000
beq_else25999:
	li	r2, 1
beq_cont26000:
beq_cont25998:
	b	beq_cont25996
beq_else25995:
	li	r2, 1
beq_cont25996:
beq_cont25994:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26017
	li	r2, 0
	b	beq_cont26018
beq_else26017:
	li	r2, 1
beq_cont26018:
ble_cont25992:
beq_cont25990:
beq_cont25988:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26019
	li	r2, 1
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont26020
beq_else26019:
	lwz	r2, 16(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26021
	li	r2, 0
	b	beq_cont26022
beq_else26021:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26023
	lwz	r2, 16(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26025
	li	r2, 0
	b	beq_cont26026
beq_else26025:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26027
	lwz	r2, 16(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26029
	li	r2, 0
	b	beq_cont26030
beq_else26029:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26031
	lwz	r2, 16(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26033
	li	r2, 0
	b	beq_cont26034
beq_else26033:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26035
	lwz	r2, 16(r3)
	lwz	r5, 20(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26037
	li	r2, 0
	b	beq_cont26038
beq_else26037:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26039
	lwz	r2, 16(r3)
	lwz	r5, 24(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26041
	li	r2, 0
	b	beq_cont26042
beq_else26041:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	mflr	r31
	mr	r2, r6
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_and_group2923
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26043
	li	r2, 7
	lwz	r5, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_group2926
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont26044
beq_else26043:
	li	r2, 1
beq_cont26044:
beq_cont26042:
	b	beq_cont26040
beq_else26039:
	li	r2, 1
beq_cont26040:
beq_cont26038:
	b	beq_cont26036
beq_else26035:
	li	r2, 1
beq_cont26036:
beq_cont26034:
	b	beq_cont26032
beq_else26031:
	li	r2, 1
beq_cont26032:
beq_cont26030:
	b	beq_cont26028
beq_else26027:
	li	r2, 1
beq_cont26028:
beq_cont26026:
	b	beq_cont26024
beq_else26023:
	li	r2, 1
beq_cont26024:
beq_cont26022:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26045
	li	r2, 1
	lwz	r5, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	beq_cont26046
beq_else26045:
	li	r2, 1
beq_cont26046:
beq_cont26020:
beq_cont25986:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26047
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26048
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	ble_cont26049
ble_else26048:
ble_cont26049:
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
beq_else26047:
	blr
iter_trace_diffuse_rays2990:
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else26052
	slwi	r8, r7, 2
	add	r31, r2, r8
	lwz	r8, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	stw	r7, 12(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26053
	slwi	r8, r7, 2
	add	r31, r2, r8
	lwz	r8, 0(r31)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lis	r9, lo16(min_caml_tmin)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_tmin)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_tmin)
	lwz	r9, 0(r9)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
	lfd	f1, 0(r31)
	stfd	f1, 0(r9)
	lis	r9, lo16(min_caml_or_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_or_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_or_net)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	lwz	r10, 0(r9)
	lwz	r11, 0(r10)
	stfd	f0, 16(r3)
	stw	r8, 24(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else26055
	b	beq_cont26056
beq_else26055:
	stw	r9, 28(r3)
	cmpwi	cr7, r11, 99
	bne	cr7, beq_else26057
	lwz	r11, 4(r10)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else26059
	b	beq_cont26060
beq_else26059:
	lis	r12, lo16(min_caml_and_net)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_and_net)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_and_net)
	lwz	r12, 0(r12)
	slwi	r11, r11, 2
	add	r31, r12, r11
	lwz	r11, 0(r31)
	li	r12, 0
	stw	r10, 32(r3)
	mflr	r31
	mr	r6, r8
	mr	r5, r11
	mr	r2, r12
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26061
	b	beq_cont26062
beq_else26061:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26063
	b	beq_cont26064
beq_else26063:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26065
	b	beq_cont26066
beq_else26065:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 32(r3)
	lwz	r6, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26066:
beq_cont26064:
beq_cont26062:
beq_cont26060:
	b	beq_cont26058
beq_else26057:
	stw	r10, 32(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r11
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solver_fast22875
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26067
	b	beq_cont26068
beq_else26067:
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
	bgt	cr7, ble_else26069
	b	ble_cont26070
ble_else26069:
	lwz	r2, 32(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26071
	b	beq_cont26072
beq_else26071:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26073
	b	beq_cont26074
beq_else26073:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26075
	b	beq_cont26076
beq_else26075:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26077
	b	beq_cont26078
beq_else26077:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 24(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_each_element_fast2946
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 32(r3)
	lwz	r6, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26078:
beq_cont26076:
beq_cont26074:
beq_cont26072:
ble_cont26070:
beq_cont26068:
beq_cont26058:
	li	r2, 1
	lwz	r5, 28(r3)
	lwz	r6, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26056:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26079
	li	r2, 0
	b	ble_cont26080
ble_else26079:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26081
	li	r2, 0
	b	ble_cont26082
ble_else26081:
	li	r2, 1
ble_cont26082:
ble_cont26080:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26083
	b	beq_cont26084
beq_else26083:
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
	lwz	r5, 24(r3)
	lwz	r5, 0(r5)
	lwz	r6, 4(r2)
	stw	r2, 36(r3)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else26085
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r5, r6
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else26087
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont26088
beq_else26087:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26089
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f0, 0(r31)
	b	ble_cont26090
ble_else26089:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
ble_cont26090:
beq_cont26088:
	fneg	f0, f0
	slwi	r5, r8, 2
	add	r31, r7, r5
	stfd	f0, 0(r31)
	b	beq_cont26086
beq_else26085:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else26091
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
	b	beq_cont26092
beq_else26091:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	get_nvector_second2964
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont26092:
beq_cont26086:
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	utexture2969
	subi	r3, r3, 48
	lwz	r31, 44(r3)
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
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26093
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26095
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	ble_cont26096
ble_else26095:
ble_cont26096:
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lfd	f1, 16(r3)
	fmul	f0, f1, f0
	lwz	r5, 36(r3)
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
	b	beq_cont26094
beq_else26093:
beq_cont26094:
beq_cont26084:
	b	ble_cont26054
ble_else26053:
	addi	r8, r7, 1
	slwi	r8, r8, 2
	add	r31, r2, r8
	lwz	r8, 0(r31)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lis	r9, lo16(min_caml_tmin)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_tmin)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_tmin)
	lwz	r9, 0(r9)
	lis	r31, lo16(l20034)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20034)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20034)
	lfd	f1, 0(r31)
	stfd	f1, 0(r9)
	lis	r9, lo16(min_caml_or_net)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_or_net)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_or_net)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	lwz	r10, 0(r9)
	lwz	r11, 0(r10)
	stfd	f0, 40(r3)
	stw	r8, 48(r3)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else26097
	b	beq_cont26098
beq_else26097:
	stw	r9, 52(r3)
	cmpwi	cr7, r11, 99
	bne	cr7, beq_else26099
	lwz	r11, 4(r10)
	cmpwi	cr7, r11, -1
	bne	cr7, beq_else26101
	b	beq_cont26102
beq_else26101:
	lis	r12, lo16(min_caml_and_net)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_and_net)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_and_net)
	lwz	r12, 0(r12)
	slwi	r11, r11, 2
	add	r31, r12, r11
	lwz	r11, 0(r31)
	li	r12, 0
	stw	r10, 56(r3)
	mflr	r31
	mr	r6, r8
	mr	r5, r11
	mr	r2, r12
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26103
	b	beq_cont26104
beq_else26103:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26105
	b	beq_cont26106
beq_else26105:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26107
	b	beq_cont26108
beq_else26107:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 56(r3)
	lwz	r6, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont26108:
beq_cont26106:
beq_cont26104:
beq_cont26102:
	b	beq_cont26100
beq_else26099:
	stw	r10, 56(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r11
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solver_fast22875
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26109
	b	beq_cont26110
beq_else26109:
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
	bgt	cr7, ble_else26111
	b	ble_cont26112
ble_else26111:
	lwz	r2, 56(r3)
	lwz	r5, 4(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26113
	b	beq_cont26114
beq_else26113:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 8(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26115
	b	beq_cont26116
beq_else26115:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 12(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26117
	b	beq_cont26118
beq_else26117:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r2, 56(r3)
	lwz	r5, 16(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26119
	b	beq_cont26120
beq_else26119:
	lis	r6, lo16(min_caml_and_net)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_and_net)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_and_net)
	lwz	r6, 0(r6)
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	li	r6, 0
	lwz	r7, 48(r3)
	mflr	r31
	mr	r2, r6
	mr	r6, r7
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_each_element_fast2946
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r2, 5
	lwz	r5, 56(r3)
	lwz	r6, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	solve_one_or_network_fast2950
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont26120:
beq_cont26118:
beq_cont26116:
beq_cont26114:
ble_cont26112:
beq_cont26110:
beq_cont26100:
	li	r2, 1
	lwz	r5, 52(r3)
	lwz	r6, 48(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	trace_or_matrix_fast2954
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont26098:
	lis	r2, lo16(min_caml_tmin)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_tmin)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_tmin)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l19563)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l19563)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l19563)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26121
	li	r2, 0
	b	ble_cont26122
ble_else26121:
	lis	r31, lo16(l20038)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20038)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20038)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26123
	li	r2, 0
	b	ble_cont26124
ble_else26123:
	li	r2, 1
ble_cont26124:
ble_cont26122:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26125
	b	beq_cont26126
beq_else26125:
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
	lwz	r5, 48(r3)
	lwz	r5, 0(r5)
	lwz	r6, 4(r2)
	stw	r2, 60(r3)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else26127
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r5, r6
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else26129
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	beq_cont26130
beq_else26129:
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26131
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
	lfd	f0, 0(r31)
	b	ble_cont26132
ble_else26131:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
ble_cont26132:
beq_cont26130:
	fneg	f0, f0
	slwi	r5, r8, 2
	add	r31, r7, r5
	stfd	f0, 0(r31)
	b	beq_cont26128
beq_else26127:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else26133
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
	b	beq_cont26134
beq_else26133:
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	get_nvector_second2964
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
beq_cont26134:
beq_cont26128:
	lis	r5, lo16(min_caml_intersection_point)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_intersection_point)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_intersection_point)
	lwz	r5, 0(r5)
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	utexture2969
	subi	r3, r3, 72
	lwz	r31, 68(r3)
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
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26135
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26137
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	b	ble_cont26138
ble_else26137:
ble_cont26138:
	lis	r2, lo16(min_caml_diffuse_ray)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_diffuse_ray)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_diffuse_ray)
	lwz	r2, 0(r2)
	lfd	f1, 40(r3)
	fmul	f0, f1, f0
	lwz	r5, 60(r3)
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
	b	beq_cont26136
beq_else26135:
beq_cont26136:
beq_cont26126:
ble_cont26054:
	lwz	r2, 12(r3)
	subi	r2, r2, 2
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26139
	slwi	r5, r2, 2
	lwz	r6, 8(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	stw	r2, 64(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26140
	slwi	r5, r2, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	trace_diffuse_ray2987
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	b	ble_cont26141
ble_else26140:
	addi	r5, r2, 1
	slwi	r5, r5, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	trace_diffuse_ray2987
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
ble_cont26141:
	lwz	r2, 64(r3)
	subi	r7, r2, 2
	lwz	r2, 8(r3)
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	iter_trace_diffuse_rays2990
bge_else26139:
	blr
bge_else26052:
	blr
trace_diffuse_ray_80percent2999:
	stw	r5, 0(r3)
	stw	r6, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26144
	b	beq_cont26145
beq_else26144:
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
beq_cont26145:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else26146
	b	beq_cont26147
beq_else26146:
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
beq_cont26147:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else26148
	b	beq_cont26149
beq_else26148:
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
beq_cont26149:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else26150
	b	beq_cont26151
beq_else26150:
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
beq_cont26151:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else26152
	blr
beq_else26152:
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
	add	r31, r6, r11
	lwz	r6, 0(r31)
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r2, 24(r2)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	add	r31, r7, r6
	lwz	r6, 0(r31)
	slwi	r7, r5, 2
	add	r31, r8, r7
	lwz	r7, 0(r31)
	stw	r9, 0(r3)
	stw	r5, 4(r3)
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26154
	b	beq_cont26155
beq_else26154:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26156
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26157
ble_else26156:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26157:
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
beq_cont26155:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else26158
	b	beq_cont26159
beq_else26158:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26160
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26161
ble_else26160:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26161:
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
beq_cont26159:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else26162
	b	beq_cont26163
beq_else26162:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26164
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26165
ble_else26164:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26165:
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
beq_cont26163:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else26166
	b	beq_cont26167
beq_else26166:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26168
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26169
ble_else26168:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26169:
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
beq_cont26167:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else26170
	b	beq_cont26171
beq_else26170:
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26172
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26173
ble_else26172:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26173:
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
beq_cont26171:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	slwi	r5, r5, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	add	r31, r5, r9
	lwz	r5, 0(r31)
	lwz	r5, 20(r5)
	subi	r9, r2, 1
	slwi	r9, r9, 2
	add	r31, r6, r9
	lwz	r9, 0(r31)
	lwz	r9, 20(r9)
	slwi	r10, r2, 2
	add	r31, r6, r10
	lwz	r10, 0(r31)
	lwz	r10, 20(r10)
	addi	r11, r2, 1
	slwi	r11, r11, 2
	add	r31, r6, r11
	lwz	r11, 0(r31)
	lwz	r11, 20(r11)
	slwi	r12, r2, 2
	add	r31, r7, r12
	lwz	r7, 0(r31)
	lwz	r7, 20(r7)
	lis	r12, lo16(min_caml_diffuse_ray)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_diffuse_ray)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_diffuse_ray)
	lwz	r12, 0(r12)
	slwi	r13, r8, 2
	add	r31, r5, r13
	lwz	r5, 0(r31)
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
	add	r31, r9, r12
	lwz	r9, 0(r31)
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
	add	r31, r10, r9
	lwz	r9, 0(r31)
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
	add	r31, r11, r9
	lwz	r9, 0(r31)
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
	add	r31, r7, r9
	lwz	r7, 0(r31)
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
	add	r31, r6, r2
	lwz	r2, 0(r31)
	lwz	r2, 16(r2)
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	slwi	r6, r8, 2
	add	r31, r2, r6
	lwz	r2, 0(r31)
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
	bgt	cr7, ble_else26176
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26177
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r2, 0(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26178
	b	beq_cont26179
beq_else26178:
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
	add	r31, r6, r11
	lwz	r6, 0(r31)
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	slwi	r10, r5, 2
	add	r31, r7, r10
	lwz	r7, 0(r31)
	slwi	r10, r5, 2
	add	r31, r8, r10
	lwz	r8, 0(r31)
	stw	r9, 4(r3)
	stw	r5, 8(r3)
	stw	r7, 12(r3)
	stw	r8, 16(r3)
	stw	r6, 20(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26180
	b	beq_cont26181
beq_else26180:
	lis	r10, lo16(min_caml_dirvecs)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_dirvecs)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_dirvecs)
	lwz	r10, 0(r10)
	lwz	r10, 0(r10)
	lis	r11, lo16(min_caml_startp_fast)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_startp_fast)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_startp_fast)
	lwz	r11, 0(r11)
	lfd	f0, 0(r8)
	stfd	f0, 0(r11)
	lfd	f0, 4(r8)
	stfd	f0, 4(r11)
	lfd	f0, 8(r8)
	stfd	f0, 8(r11)
	lis	r11, lo16(min_caml_n_objects)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_n_objects)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_n_objects)
	lwz	r11, 0(r11)
	lwz	r11, 0(r11)
	subi	r11, r11, 1
	stw	r10, 24(r3)
	mflr	r31
	mr	r5, r11
	mr	r2, r8
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_startp_constants2892
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 24(r3)
	lwz	r5, 12(r3)
	lwz	r6, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont26181:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else26182
	b	beq_cont26183
beq_else26182:
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
	lwz	r7, 16(r3)
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
	li	r7, 118
	lwz	r2, 28(r3)
	lwz	r5, 12(r3)
	lwz	r6, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26183:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else26184
	b	beq_cont26185
beq_else26184:
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
	lwz	r7, 16(r3)
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
	li	r7, 118
	lwz	r2, 32(r3)
	lwz	r5, 12(r3)
	lwz	r6, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26185:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else26186
	b	beq_cont26187
beq_else26186:
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
	lwz	r7, 16(r3)
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
	stw	r5, 36(r3)
	mflr	r31
	mr	r5, r6
	mr	r2, r7
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_startp_constants2892
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 36(r3)
	lwz	r5, 12(r3)
	lwz	r6, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont26187:
	lwz	r2, 20(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else26188
	b	beq_cont26189
beq_else26188:
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
	lwz	r6, 16(r3)
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
	stw	r2, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_startp_constants2892
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r7, 118
	lwz	r2, 40(r3)
	lwz	r5, 12(r3)
	lwz	r6, 16(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	iter_trace_diffuse_rays2990
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
beq_cont26189:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
beq_cont26179:
	addi	r5, r5, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26190
	lwz	r2, 0(r3)
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26191
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 44(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26192
	b	beq_cont26193
beq_else26192:
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont26193:
	lwz	r2, 44(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else26194
	lwz	r5, 0(r3)
	lwz	r6, 8(r5)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26195
	lwz	r6, 12(r5)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r2, 48(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26196
	b	beq_cont26197
beq_else26196:
	lwz	r6, 20(r5)
	lwz	r7, 28(r5)
	lwz	r8, 4(r5)
	lwz	r9, 16(r5)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r2, 2
	add	r31, r6, r11
	lwz	r6, 0(r31)
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r6, 24(r5)
	lwz	r6, 0(r6)
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r7, 0(r31)
	slwi	r10, r2, 2
	add	r31, r8, r10
	lwz	r8, 0(r31)
	stw	r9, 52(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 48(r3)
	slwi	r6, r5, 2
	lwz	r7, 52(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
beq_cont26197:
	lwz	r2, 48(r3)
	addi	r5, r2, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26198
	lwz	r2, 0(r3)
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26199
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 56(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26200
	b	beq_cont26201
beq_else26200:
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont26201:
	lwz	r2, 56(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else26199:
	blr
ble_else26198:
	blr
bge_else26195:
	blr
ble_else26194:
	blr
bge_else26191:
	blr
ble_else26190:
	blr
bge_else26177:
	blr
ble_else26176:
	blr
try_exploit_neighbors3028:
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else26210
	lwz	r11, 8(r10)
	slwi	r12, r9, 2
	add	r31, r11, r12
	lwz	r11, 0(r31)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else26211
	slwi	r11, r2, 2
	add	r31, r7, r11
	lwz	r11, 0(r31)
	lwz	r11, 8(r11)
	slwi	r12, r9, 2
	add	r31, r11, r12
	lwz	r11, 0(r31)
	slwi	r12, r2, 2
	add	r31, r6, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26212
	slwi	r12, r2, 2
	add	r31, r8, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26214
	subi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26216
	addi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26218
	li	r11, 1
	b	beq_cont26219
beq_else26218:
	li	r11, 0
beq_cont26219:
	b	beq_cont26217
beq_else26216:
	li	r11, 0
beq_cont26217:
	b	beq_cont26215
beq_else26214:
	li	r11, 0
beq_cont26215:
	b	beq_cont26213
beq_else26212:
	li	r11, 0
beq_cont26213:
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else26220
	slwi	r2, r2, 2
	add	r31, r7, r2
	lwz	r2, 0(r31)
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else26221
	lwz	r5, 8(r2)
	slwi	r6, r9, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26222
	lwz	r5, 12(r2)
	slwi	r6, r9, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	stw	r2, 0(r3)
	stw	r9, 4(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26223
	b	beq_cont26224
beq_else26223:
	mflr	r31
	mr	r5, r9
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont26224:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else26225
	lwz	r5, 0(r3)
	lwz	r6, 8(r5)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26226
	lwz	r6, 12(r5)
	slwi	r7, r2, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r2, 8(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26227
	b	beq_cont26228
beq_else26227:
	lwz	r6, 20(r5)
	lwz	r7, 28(r5)
	lwz	r8, 4(r5)
	lwz	r9, 16(r5)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r2, 2
	add	r31, r6, r11
	lwz	r6, 0(r31)
	lfd	f0, 0(r6)
	stfd	f0, 0(r10)
	lfd	f0, 4(r6)
	stfd	f0, 4(r10)
	lfd	f0, 8(r6)
	stfd	f0, 8(r10)
	lwz	r6, 24(r5)
	lwz	r6, 0(r6)
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r7, 0(r31)
	slwi	r10, r2, 2
	add	r31, r8, r10
	lwz	r8, 0(r31)
	stw	r9, 12(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	mr	r6, r8
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
beq_cont26228:
	lwz	r2, 8(r3)
	addi	r5, r2, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26229
	lwz	r2, 0(r3)
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26230
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 16(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26231
	b	beq_cont26232
beq_else26231:
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
beq_cont26232:
	lwz	r2, 16(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else26230:
	blr
ble_else26229:
	blr
bge_else26226:
	blr
ble_else26225:
	blr
bge_else26222:
	blr
ble_else26221:
	blr
beq_else26220:
	lwz	r10, 12(r10)
	slwi	r11, r9, 2
	add	r31, r10, r11
	lwz	r10, 0(r31)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else26239
	b	beq_cont26240
beq_else26239:
	slwi	r10, r2, 2
	add	r31, r6, r10
	lwz	r10, 0(r31)
	lwz	r10, 20(r10)
	subi	r11, r2, 1
	slwi	r11, r11, 2
	add	r31, r7, r11
	lwz	r11, 0(r31)
	lwz	r11, 20(r11)
	slwi	r12, r2, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 20(r12)
	addi	r13, r2, 1
	slwi	r13, r13, 2
	add	r31, r7, r13
	lwz	r13, 0(r31)
	lwz	r13, 20(r13)
	slwi	r14, r2, 2
	add	r31, r8, r14
	lwz	r14, 0(r31)
	lwz	r14, 20(r14)
	lis	r15, lo16(min_caml_diffuse_ray)
	srwi	r15, r15, 31
	addi	r15, r15, ha16(min_caml_diffuse_ray)
	slwi	r15, r15, 16
	addi	r15, r15, lo16(min_caml_diffuse_ray)
	lwz	r15, 0(r15)
	slwi	r16, r9, 2
	add	r31, r10, r16
	lwz	r10, 0(r31)
	lfd	f0, 0(r10)
	stfd	f0, 0(r15)
	lfd	f0, 4(r10)
	stfd	f0, 4(r15)
	lfd	f0, 8(r10)
	stfd	f0, 8(r15)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r15, r9, 2
	add	r31, r11, r15
	lwz	r11, 0(r31)
	lfd	f0, 0(r10)
	lfd	f1, 0(r11)
	fadd	f0, f0, f1
	stfd	f0, 0(r10)
	lfd	f0, 4(r10)
	lfd	f1, 4(r11)
	fadd	f0, f0, f1
	stfd	f0, 4(r10)
	lfd	f0, 8(r10)
	lfd	f1, 8(r11)
	fadd	f0, f0, f1
	stfd	f0, 8(r10)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r9, 2
	add	r31, r12, r11
	lwz	r11, 0(r31)
	lfd	f0, 0(r10)
	lfd	f1, 0(r11)
	fadd	f0, f0, f1
	stfd	f0, 0(r10)
	lfd	f0, 4(r10)
	lfd	f1, 4(r11)
	fadd	f0, f0, f1
	stfd	f0, 4(r10)
	lfd	f0, 8(r10)
	lfd	f1, 8(r11)
	fadd	f0, f0, f1
	stfd	f0, 8(r10)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r9, 2
	add	r31, r13, r11
	lwz	r11, 0(r31)
	lfd	f0, 0(r10)
	lfd	f1, 0(r11)
	fadd	f0, f0, f1
	stfd	f0, 0(r10)
	lfd	f0, 4(r10)
	lfd	f1, 4(r11)
	fadd	f0, f0, f1
	stfd	f0, 4(r10)
	lfd	f0, 8(r10)
	lfd	f1, 8(r11)
	fadd	f0, f0, f1
	stfd	f0, 8(r10)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r9, 2
	add	r31, r14, r11
	lwz	r11, 0(r31)
	lfd	f0, 0(r10)
	lfd	f1, 0(r11)
	fadd	f0, f0, f1
	stfd	f0, 0(r10)
	lfd	f0, 4(r10)
	lfd	f1, 4(r11)
	fadd	f0, f0, f1
	stfd	f0, 4(r10)
	lfd	f0, 8(r10)
	lfd	f1, 8(r11)
	fadd	f0, f0, f1
	stfd	f0, 8(r10)
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	lwz	r10, 16(r10)
	lis	r11, lo16(min_caml_rgb)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_rgb)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_rgb)
	lwz	r11, 0(r11)
	slwi	r12, r9, 2
	add	r31, r10, r12
	lwz	r10, 0(r31)
	lis	r12, lo16(min_caml_diffuse_ray)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_diffuse_ray)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_diffuse_ray)
	lwz	r12, 0(r12)
	lfd	f0, 0(r11)
	lfd	f1, 0(r10)
	lfd	f2, 0(r12)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r11)
	lfd	f0, 4(r11)
	lfd	f1, 4(r10)
	lfd	f2, 4(r12)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 4(r11)
	lfd	f0, 8(r11)
	lfd	f1, 8(r10)
	lfd	f2, 8(r12)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r11)
beq_cont26240:
	addi	r9, r9, 1
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else26241
	lwz	r11, 8(r10)
	slwi	r12, r9, 2
	add	r31, r11, r12
	lwz	r11, 0(r31)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else26242
	slwi	r11, r2, 2
	add	r31, r7, r11
	lwz	r11, 0(r31)
	lwz	r11, 8(r11)
	slwi	r12, r9, 2
	add	r31, r11, r12
	lwz	r11, 0(r31)
	slwi	r12, r2, 2
	add	r31, r6, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26243
	slwi	r12, r2, 2
	add	r31, r8, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26245
	subi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26247
	addi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	slwi	r13, r9, 2
	add	r31, r12, r13
	lwz	r12, 0(r31)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26249
	li	r11, 1
	b	beq_cont26250
beq_else26249:
	li	r11, 0
beq_cont26250:
	b	beq_cont26248
beq_else26247:
	li	r11, 0
beq_cont26248:
	b	beq_cont26246
beq_else26245:
	li	r11, 0
beq_cont26246:
	b	beq_cont26244
beq_else26243:
	li	r11, 0
beq_cont26244:
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else26251
	slwi	r2, r2, 2
	add	r31, r7, r2
	lwz	r2, 0(r31)
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else26252
	lwz	r5, 8(r2)
	slwi	r6, r9, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26253
	lwz	r5, 12(r2)
	slwi	r6, r9, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	stw	r2, 20(r3)
	stw	r9, 24(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26254
	b	beq_cont26255
beq_else26254:
	lwz	r5, 20(r2)
	lwz	r6, 28(r2)
	lwz	r7, 4(r2)
	lwz	r8, 16(r2)
	lis	r10, lo16(min_caml_diffuse_ray)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_diffuse_ray)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_diffuse_ray)
	lwz	r10, 0(r10)
	slwi	r11, r9, 2
	add	r31, r5, r11
	lwz	r5, 0(r31)
	lfd	f0, 0(r5)
	stfd	f0, 0(r10)
	lfd	f0, 4(r5)
	stfd	f0, 4(r10)
	lfd	f0, 8(r5)
	stfd	f0, 8(r10)
	lwz	r5, 24(r2)
	lwz	r5, 0(r5)
	slwi	r10, r9, 2
	add	r31, r6, r10
	lwz	r6, 0(r31)
	slwi	r10, r9, 2
	add	r31, r7, r10
	lwz	r7, 0(r31)
	stw	r8, 28(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	mr	r6, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 28(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
beq_cont26255:
	lwz	r2, 24(r3)
	addi	r5, r2, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26256
	lwz	r2, 20(r3)
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26257
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 32(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26258
	b	beq_cont26259
beq_else26258:
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26259:
	lwz	r2, 32(r3)
	addi	r5, r2, 1
	lwz	r2, 20(r3)
	b	do_without_neighbors3012
bge_else26257:
	blr
ble_else26256:
	blr
bge_else26253:
	blr
ble_else26252:
	blr
beq_else26251:
	lwz	r10, 12(r10)
	slwi	r11, r9, 2
	add	r31, r10, r11
	lwz	r10, 0(r31)
	stw	r8, 36(r3)
	stw	r7, 40(r3)
	stw	r6, 44(r3)
	stw	r5, 48(r3)
	stw	r2, 52(r3)
	stw	r9, 24(r3)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else26264
	b	beq_cont26265
beq_else26264:
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	mr	r7, r8
	mr	r8, r9
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
beq_cont26265:
	lwz	r2, 24(r3)
	addi	r9, r2, 1
	lwz	r2, 52(r3)
	lwz	r5, 48(r3)
	lwz	r6, 44(r3)
	lwz	r7, 40(r3)
	lwz	r8, 36(r3)
	b	try_exploit_neighbors3028
bge_else26242:
	blr
ble_else26241:
	blr
bge_else26211:
	blr
ble_else26210:
	blr
pretrace_diffuse_rays3041:
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26270
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26271
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 0(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26272
	b	beq_cont26273
beq_else26272:
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r9, r6
	lwz	r6, 0(r31)
	slwi	r9, r5, 2
	add	r31, r7, r9
	lwz	r7, 0(r31)
	slwi	r9, r5, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
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
	add	r31, r5, r7
	lwz	r5, 0(r31)
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
beq_cont26273:
	lwz	r5, 0(r3)
	addi	r5, r5, 1
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else26274
	lwz	r6, 8(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26275
	lwz	r6, 12(r2)
	slwi	r7, r5, 2
	add	r31, r6, r7
	lwz	r6, 0(r31)
	stw	r5, 20(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26276
	b	beq_cont26277
beq_else26276:
	lwz	r6, 24(r2)
	lwz	r6, 0(r6)
	lis	r7, lo16(min_caml_diffuse_ray)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_diffuse_ray)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_diffuse_ray)
	lwz	r7, 0(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r9, r6
	lwz	r6, 0(r31)
	slwi	r9, r5, 2
	add	r31, r7, r9
	lwz	r7, 0(r31)
	slwi	r9, r5, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26278
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26279
ble_else26278:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26279:
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
	add	r31, r5, r7
	lwz	r5, 0(r31)
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
beq_cont26277:
	lwz	r5, 20(r3)
	addi	r5, r5, 1
	b	pretrace_diffuse_rays3041
bge_else26275:
	blr
ble_else26274:
	blr
bge_else26271:
	blr
ble_else26270:
	blr
pretrace_pixels3044:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26284
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
	lfd	f3, 0(r7)
	lfd	f4, 0(r7)
	fmul	f3, f3, f4
	lfd	f4, 4(r7)
	lfd	f5, 4(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	lfd	f4, 8(r7)
	lfd	f5, 8(r7)
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	fsqrt	f3, f3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else26285
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f3, 0(r31)
	b	beq_cont26286
beq_else26285:
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f4, 0(r31)
	fdiv	f3, f4, f3
beq_cont26286:
	lfd	f4, 0(r7)
	fmul	f4, f4, f3
	stfd	f4, 0(r7)
	lfd	f4, 4(r7)
	fmul	f4, f4, f3
	stfd	f4, 4(r7)
	lfd	f4, 8(r7)
	fmul	f3, f4, f3
	stfd	f3, 8(r7)
	lis	r7, lo16(min_caml_rgb)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_rgb)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_rgb)
	lwz	r7, 0(r7)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f3, 0(r31)
	stfd	f3, 0(r7)
	stfd	f3, 4(r7)
	stfd	f3, 8(r7)
	lis	r7, lo16(min_caml_startp)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_startp)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_startp)
	lwz	r7, 0(r7)
	lis	r8, lo16(min_caml_viewpoint)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_viewpoint)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_viewpoint)
	lwz	r8, 0(r8)
	lfd	f3, 0(r8)
	stfd	f3, 0(r7)
	lfd	f3, 4(r8)
	stfd	f3, 4(r7)
	lfd	f3, 8(r8)
	stfd	f3, 8(r7)
	li	r7, 0
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f3, 0(r31)
	lis	r8, lo16(min_caml_ptrace_dirvec)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_ptrace_dirvec)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_ptrace_dirvec)
	lwz	r8, 0(r8)
	slwi	r9, r5, 2
	add	r31, r2, r9
	lwz	r9, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f4, 0(r31)
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stfd	f0, 16(r3)
	stw	r6, 24(r3)
	stw	r2, 28(r3)
	stw	r5, 32(r3)
	mflr	r31
	mr	r6, r9
	mr	r5, r8
	mr	r2, r7
	fmr	f1, f4
	fmr	f0, f3
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
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r5, 24(r5)
	lwz	r7, 24(r3)
	stw	r7, 0(r5)
	slwi	r5, r2, 2
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lwz	r8, 8(r5)
	lwz	r8, 0(r8)
	cmpwi	cr7, r8, 0
	blt	cr7, bge_else26287
	lwz	r8, 12(r5)
	lwz	r8, 0(r8)
	stw	r5, 36(r3)
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else26289
	b	beq_cont26290
beq_else26289:
	lwz	r8, 24(r5)
	lwz	r8, 0(r8)
	lis	r9, lo16(min_caml_diffuse_ray)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_diffuse_ray)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_diffuse_ray)
	lwz	r9, 0(r9)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r11, r8
	lwz	r8, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else26291
	lwz	r5, 472(r2)
	lis	r31, lo16(l20455)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20455)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20455)
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
	b	ble_cont26292
ble_else26291:
	lwz	r5, 476(r2)
	lis	r31, lo16(l20399)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20399)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20399)
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
ble_cont26292:
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
beq_cont26290:
	li	r5, 1
	lwz	r2, 36(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	pretrace_diffuse_rays3041
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont26288
bge_else26287:
bge_cont26288:
	lwz	r2, 32(r3)
	subi	r5, r2, 1
	lwz	r2, 24(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else26293
	subi	r6, r2, 5
	b	bge_cont26294
bge_else26293:
	mr	r6, r2
bge_cont26294:
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r2, 28(r3)
	b	pretrace_pixels3044
bge_else26284:
	blr
scan_pixel3055:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	cmpw	cr7, r9, r2
	bgt	cr7, ble_else26296
	blr
ble_else26296:
	lis	r9, lo16(min_caml_rgb)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_rgb)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_rgb)
	lwz	r9, 0(r9)
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
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
	bgt	cr7, ble_else26298
	li	r9, 0
	b	ble_cont26299
ble_else26298:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else26300
	li	r9, 0
	b	ble_cont26301
ble_else26300:
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	addi	r10, r2, 1
	cmpw	cr7, r9, r10
	bgt	cr7, ble_else26302
	li	r9, 0
	b	ble_cont26303
ble_else26302:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else26304
	li	r9, 0
	b	ble_cont26305
ble_else26304:
	li	r9, 1
ble_cont26305:
ble_cont26303:
ble_cont26301:
ble_cont26299:
	stw	r8, 0(r3)
	stw	r6, 4(r3)
	stw	r5, 8(r3)
	stw	r7, 12(r3)
	stw	r2, 16(r3)
	cmpwi	cr7, r9, 0
	bne	cr7, beq_else26306
	slwi	r9, r2, 2
	add	r31, r7, r9
	lwz	r9, 0(r31)
	li	r10, 0
	lwz	r11, 8(r9)
	lwz	r11, 0(r11)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else26308
	lwz	r11, 12(r9)
	lwz	r11, 0(r11)
	stw	r9, 20(r3)
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else26310
	b	beq_cont26311
beq_else26310:
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont26311:
	lwz	r2, 20(r3)
	lwz	r5, 8(r2)
	lwz	r5, 4(r5)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26312
	lwz	r5, 12(r2)
	lwz	r5, 4(r5)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26314
	b	beq_cont26315
beq_else26314:
	lwz	r5, 20(r2)
	lwz	r6, 28(r2)
	lwz	r7, 4(r2)
	lwz	r8, 16(r2)
	lis	r9, lo16(min_caml_diffuse_ray)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_diffuse_ray)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_diffuse_ray)
	lwz	r9, 0(r9)
	lwz	r5, 4(r5)
	lfd	f0, 0(r5)
	stfd	f0, 0(r9)
	lfd	f0, 4(r5)
	stfd	f0, 4(r9)
	lfd	f0, 8(r5)
	stfd	f0, 8(r9)
	lwz	r5, 24(r2)
	lwz	r5, 0(r5)
	lwz	r6, 4(r6)
	lwz	r7, 4(r7)
	stw	r8, 24(r3)
	mflr	r31
	mr	r2, r5
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
	lwz	r5, 24(r3)
	lwz	r5, 4(r5)
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
beq_cont26315:
	li	r5, 2
	lwz	r2, 20(r3)
	lwz	r6, 8(r2)
	lwz	r6, 8(r6)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26316
	lwz	r6, 12(r2)
	lwz	r6, 8(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26318
	b	beq_cont26319
beq_else26318:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont26319:
	li	r5, 3
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	bge_cont26317
bge_else26316:
bge_cont26317:
	b	bge_cont26313
bge_else26312:
bge_cont26313:
	b	bge_cont26309
bge_else26308:
bge_cont26309:
	b	beq_cont26307
beq_else26306:
	li	r9, 0
	slwi	r10, r2, 2
	add	r31, r7, r10
	lwz	r10, 0(r31)
	lwz	r11, 8(r10)
	lwz	r11, 0(r11)
	cmpwi	cr7, r11, 0
	blt	cr7, bge_else26320
	slwi	r11, r2, 2
	add	r31, r7, r11
	lwz	r11, 0(r31)
	lwz	r11, 8(r11)
	lwz	r11, 0(r11)
	slwi	r12, r2, 2
	add	r31, r6, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26322
	slwi	r12, r2, 2
	add	r31, r8, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26324
	subi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26326
	addi	r12, r2, 1
	slwi	r12, r12, 2
	add	r31, r7, r12
	lwz	r12, 0(r31)
	lwz	r12, 8(r12)
	lwz	r12, 0(r12)
	cmpw	cr7, r12, r11
	bne	cr7, beq_else26328
	li	r11, 1
	b	beq_cont26329
beq_else26328:
	li	r11, 0
beq_cont26329:
	b	beq_cont26327
beq_else26326:
	li	r11, 0
beq_cont26327:
	b	beq_cont26325
beq_else26324:
	li	r11, 0
beq_cont26325:
	b	beq_cont26323
beq_else26322:
	li	r11, 0
beq_cont26323:
	cmpwi	cr7, r11, 0
	bne	cr7, beq_else26330
	slwi	r9, r2, 2
	add	r31, r7, r9
	lwz	r9, 0(r31)
	lwz	r10, 8(r9)
	lwz	r10, 0(r10)
	cmpwi	cr7, r10, 0
	blt	cr7, bge_else26332
	lwz	r10, 12(r9)
	lwz	r10, 0(r10)
	stw	r9, 28(r3)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else26334
	b	beq_cont26335
beq_else26334:
	lwz	r10, 20(r9)
	lwz	r11, 28(r9)
	lwz	r12, 4(r9)
	lwz	r13, 16(r9)
	lis	r14, lo16(min_caml_diffuse_ray)
	srwi	r14, r14, 31
	addi	r14, r14, ha16(min_caml_diffuse_ray)
	slwi	r14, r14, 16
	addi	r14, r14, lo16(min_caml_diffuse_ray)
	lwz	r14, 0(r14)
	lwz	r10, 0(r10)
	lfd	f0, 0(r10)
	stfd	f0, 0(r14)
	lfd	f0, 4(r10)
	stfd	f0, 4(r14)
	lfd	f0, 8(r10)
	stfd	f0, 8(r14)
	lwz	r10, 24(r9)
	lwz	r10, 0(r10)
	lwz	r11, 0(r11)
	lwz	r12, 0(r12)
	stw	r13, 32(r3)
	mflr	r31
	mr	r6, r12
	mr	r5, r11
	mr	r2, r10
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 32(r3)
	lwz	r5, 0(r5)
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
beq_cont26335:
	li	r5, 1
	lwz	r2, 28(r3)
	lwz	r6, 8(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26336
	lwz	r6, 12(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26338
	b	beq_cont26339
beq_else26338:
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26339:
	li	r5, 2
	lwz	r2, 28(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	do_without_neighbors3012
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	bge_cont26337
bge_else26336:
bge_cont26337:
	b	bge_cont26333
bge_else26332:
bge_cont26333:
	b	beq_cont26331
beq_else26330:
	lwz	r10, 12(r10)
	lwz	r10, 0(r10)
	cmpwi	cr7, r10, 0
	bne	cr7, beq_else26340
	b	beq_cont26341
beq_else26340:
	mflr	r31
	mr	r5, r6
	mr	r6, r7
	mr	r7, r8
	mr	r8, r9
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	calc_diffuse_using_5points3006
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26341:
	li	r9, 1
	lwz	r2, 16(r3)
	lwz	r5, 8(r3)
	lwz	r6, 4(r3)
	lwz	r7, 12(r3)
	lwz	r8, 0(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	try_exploit_neighbors3028
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
beq_cont26331:
	b	bge_cont26321
bge_else26320:
bge_cont26321:
beq_cont26307:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else26342
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26344
	b	bge_cont26345
bge_else26344:
	li	r2, 0
bge_cont26345:
	b	ble_cont26343
ble_else26342:
	li	r2, 255
ble_cont26343:
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
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
	bgt	cr7, ble_else26346
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26348
	b	bge_cont26349
bge_else26348:
	li	r2, 0
bge_cont26349:
	b	ble_cont26347
ble_else26346:
	li	r2, 255
ble_cont26347:
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
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
	bgt	cr7, ble_else26350
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26352
	b	bge_cont26353
bge_else26352:
	li	r2, 0
bge_cont26353:
	b	ble_cont26351
ble_else26350:
	li	r2, 255
ble_cont26351:
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
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
	bgt	cr7, ble_else26354
	blr
ble_else26354:
	lis	r5, lo16(min_caml_rgb)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_rgb)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_rgb)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	lwz	r6, 0(r31)
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
	bgt	cr7, ble_else26356
	li	r5, 0
	b	ble_cont26357
ble_else26356:
	cmpwi	cr7, r6, 0
	bgt	cr7, ble_else26358
	li	r5, 0
	b	ble_cont26359
ble_else26358:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	addi	r8, r2, 1
	cmpw	cr7, r5, r8
	bgt	cr7, ble_else26360
	li	r5, 0
	b	ble_cont26361
ble_else26360:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else26362
	li	r5, 0
	b	ble_cont26363
ble_else26362:
	li	r5, 1
ble_cont26363:
ble_cont26361:
ble_cont26359:
ble_cont26357:
	stw	r2, 36(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26364
	slwi	r5, r2, 2
	add	r31, r7, r5
	lwz	r5, 0(r31)
	lwz	r8, 8(r5)
	lwz	r8, 0(r8)
	cmpwi	cr7, r8, 0
	blt	cr7, bge_else26366
	lwz	r8, 12(r5)
	lwz	r8, 0(r8)
	stw	r5, 40(r3)
	cmpwi	cr7, r8, 0
	bne	cr7, beq_else26368
	b	beq_cont26369
beq_else26368:
	lwz	r8, 20(r5)
	lwz	r9, 28(r5)
	lwz	r10, 4(r5)
	lwz	r11, 16(r5)
	lis	r12, lo16(min_caml_diffuse_ray)
	srwi	r12, r12, 31
	addi	r12, r12, ha16(min_caml_diffuse_ray)
	slwi	r12, r12, 16
	addi	r12, r12, lo16(min_caml_diffuse_ray)
	lwz	r12, 0(r12)
	lwz	r8, 0(r8)
	lfd	f0, 0(r8)
	stfd	f0, 0(r12)
	lfd	f0, 4(r8)
	stfd	f0, 4(r12)
	lfd	f0, 8(r8)
	stfd	f0, 8(r12)
	lwz	r8, 24(r5)
	lwz	r8, 0(r8)
	lwz	r9, 0(r9)
	lwz	r10, 0(r10)
	stw	r11, 44(r3)
	mflr	r31
	mr	r6, r10
	mr	r5, r9
	mr	r2, r8
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	trace_diffuse_ray_80percent2999
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lwz	r5, 44(r3)
	lwz	r5, 0(r5)
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
beq_cont26369:
	li	r5, 1
	lwz	r2, 40(r3)
	lwz	r6, 8(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26370
	lwz	r6, 12(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26372
	b	beq_cont26373
beq_else26372:
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont26373:
	li	r5, 2
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	do_without_neighbors3012
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont26371
bge_else26370:
bge_cont26371:
	b	bge_cont26367
bge_else26366:
bge_cont26367:
	b	beq_cont26365
beq_else26364:
	li	r9, 0
	lwz	r5, 4(r3)
	lwz	r8, 0(r3)
	mflr	r31
	mr	r29, r6
	mr	r6, r5
	mr	r5, r29
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	try_exploit_neighbors3028
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont26365:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else26374
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26376
	b	bge_cont26377
bge_else26376:
	li	r2, 0
bge_cont26377:
	b	ble_cont26375
ble_else26374:
	li	r2, 255
ble_cont26375:
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_print_int
	subi	r3, r3, 56
	lwz	r31, 52(r3)
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
	bgt	cr7, ble_else26378
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26380
	b	bge_cont26381
bge_else26380:
	li	r2, 0
bge_cont26381:
	b	ble_cont26379
ble_else26378:
	li	r2, 255
ble_cont26379:
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_print_int
	subi	r3, r3, 56
	lwz	r31, 52(r3)
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
	bgt	cr7, ble_else26382
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26384
	b	bge_cont26385
bge_else26384:
	li	r2, 0
bge_cont26385:
	b	ble_cont26383
ble_else26382:
	li	r2, 255
ble_cont26383:
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_print_int
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	lwz	r2, 36(r3)
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
	bgt	cr7, ble_else26386
	blr
ble_else26386:
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
	bgt	cr7, ble_else26388
	b	ble_cont26389
ble_else26388:
	addi	r9, r2, 1
	lis	r10, lo16(min_caml_scan_pitch)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_scan_pitch)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_scan_pitch)
	lwz	r10, 0(r10)
	lfd	f0, 0(r10)
	lis	r10, lo16(min_caml_image_center)
	srwi	r10, r10, 31
	addi	r10, r10, ha16(min_caml_image_center)
	slwi	r10, r10, 16
	addi	r10, r10, lo16(min_caml_image_center)
	lwz	r10, 0(r10)
	lwz	r10, 4(r10)
	sub	r9, r9, r10
	itof	f1, r9
	fmul	f0, f0, f1
	lis	r9, lo16(min_caml_screeny_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screeny_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screeny_dir)
	lwz	r9, 0(r9)
	lfd	f1, 0(r9)
	fmul	f1, f0, f1
	lis	r9, lo16(min_caml_screenz_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screenz_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screenz_dir)
	lwz	r9, 0(r9)
	lfd	f2, 0(r9)
	fadd	f1, f1, f2
	lis	r9, lo16(min_caml_screeny_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screeny_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screeny_dir)
	lwz	r9, 0(r9)
	lfd	f2, 4(r9)
	fmul	f2, f0, f2
	lis	r9, lo16(min_caml_screenz_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screenz_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screenz_dir)
	lwz	r9, 0(r9)
	lfd	f3, 4(r9)
	fadd	f2, f2, f3
	lis	r9, lo16(min_caml_screeny_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screeny_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screeny_dir)
	lwz	r9, 0(r9)
	lfd	f3, 8(r9)
	fmul	f0, f0, f3
	lis	r9, lo16(min_caml_screenz_dir)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_screenz_dir)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_screenz_dir)
	lwz	r9, 0(r9)
	lfd	f3, 8(r9)
	fadd	f0, f0, f3
	lis	r9, lo16(min_caml_image_size)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_image_size)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_image_size)
	lwz	r9, 0(r9)
	lwz	r9, 0(r9)
	subi	r9, r9, 1
	mflr	r31
	mr	r6, r8
	mr	r5, r9
	mr	r2, r7
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	pretrace_pixels3044
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
ble_cont26389:
	li	r2, 0
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else26390
	b	ble_cont26391
ble_else26390:
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
	bgt	cr7, ble_else26392
	li	r5, 0
	b	ble_cont26393
ble_else26392:
	cmpwi	cr7, r6, 0
	bgt	cr7, ble_else26394
	li	r5, 0
	b	ble_cont26395
ble_else26394:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	cmpwi	cr7, r5, 1
	bgt	cr7, ble_else26396
	li	r5, 0
	b	ble_cont26397
ble_else26396:
	li	r5, 0
ble_cont26397:
ble_cont26395:
ble_cont26393:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26398
	lwz	r2, 0(r7)
	lwz	r5, 8(r2)
	lwz	r5, 0(r5)
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26400
	lwz	r5, 12(r2)
	lwz	r5, 0(r5)
	stw	r2, 20(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else26402
	b	beq_cont26403
beq_else26402:
	lwz	r5, 20(r2)
	lwz	r8, 28(r2)
	lwz	r9, 4(r2)
	lwz	r10, 16(r2)
	lis	r11, lo16(min_caml_diffuse_ray)
	srwi	r11, r11, 31
	addi	r11, r11, ha16(min_caml_diffuse_ray)
	slwi	r11, r11, 16
	addi	r11, r11, lo16(min_caml_diffuse_ray)
	lwz	r11, 0(r11)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	stfd	f0, 0(r11)
	lfd	f0, 4(r5)
	stfd	f0, 4(r11)
	lfd	f0, 8(r5)
	stfd	f0, 8(r11)
	lwz	r5, 24(r2)
	lwz	r5, 0(r5)
	lwz	r8, 0(r8)
	lwz	r9, 0(r9)
	stw	r10, 24(r3)
	mflr	r31
	mr	r6, r9
	mr	r2, r5
	mr	r5, r8
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
	lwz	r5, 24(r3)
	lwz	r5, 0(r5)
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
beq_cont26403:
	li	r5, 1
	lwz	r2, 20(r3)
	lwz	r6, 8(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	blt	cr7, bge_else26404
	lwz	r6, 12(r2)
	lwz	r6, 4(r6)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else26406
	b	beq_cont26407
beq_else26406:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
beq_cont26407:
	li	r5, 2
	lwz	r2, 20(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	do_without_neighbors3012
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	bge_cont26405
bge_else26404:
bge_cont26405:
	b	bge_cont26401
bge_else26400:
bge_cont26401:
	b	beq_cont26399
beq_else26398:
	li	r9, 0
	lwz	r5, 8(r3)
	lwz	r8, 4(r3)
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
beq_cont26399:
	lis	r2, lo16(min_caml_rgb)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_rgb)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_rgb)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	cmpwi	cr7, r2, 255
	bgt	cr7, ble_else26408
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26410
	b	bge_cont26411
bge_else26410:
	li	r2, 0
bge_cont26411:
	b	ble_cont26409
ble_else26408:
	li	r2, 255
ble_cont26409:
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
	bgt	cr7, ble_else26412
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26414
	b	bge_cont26415
bge_else26414:
	li	r2, 0
bge_cont26415:
	b	ble_cont26413
ble_else26412:
	li	r2, 255
ble_cont26413:
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
	bgt	cr7, ble_else26416
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26418
	b	bge_cont26419
bge_else26418:
	li	r2, 0
bge_cont26419:
	b	ble_cont26417
ble_else26416:
	li	r2, 255
ble_cont26417:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	li	r2, 1
	lwz	r5, 12(r3)
	lwz	r6, 8(r3)
	lwz	r7, 16(r3)
	lwz	r8, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	scan_pixel3055
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont26391:
	lwz	r2, 12(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	addi	r2, r2, 2
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else26420
	subi	r6, r2, 5
	b	bge_cont26421
bge_else26420:
	mr	r6, r2
bge_cont26421:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	cmpw	cr7, r2, r5
	bgt	cr7, ble_else26422
	blr
ble_else26422:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	subi	r2, r2, 1
	stw	r6, 28(r3)
	stw	r5, 32(r3)
	cmpw	cr7, r2, r5
	bgt	cr7, ble_else26424
	b	ble_cont26425
ble_else26424:
	addi	r2, r5, 1
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
	sub	r2, r2, r7
	itof	f1, r2
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fmul	f1, f0, f1
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f2, 0(r2)
	fadd	f1, f1, f2
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fmul	f2, f0, f2
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 4(r2)
	fadd	f2, f2, f3
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fmul	f0, f0, f3
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fadd	f0, f0, f3
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lwz	r7, 8(r3)
	mflr	r31
	mr	r5, r2
	mr	r2, r7
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	pretrace_pixels3044
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont26425:
	li	r2, 0
	lwz	r5, 32(r3)
	lwz	r6, 16(r3)
	lwz	r7, 4(r3)
	lwz	r8, 8(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	scan_pixel3055
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	addi	r2, r2, 1
	lwz	r5, 28(r3)
	addi	r5, r5, 2
	cmpwi	cr7, r5, 5
	blt	cr7, bge_else26426
	subi	r8, r5, 5
	b	bge_cont26427
bge_else26426:
	mr	r8, r5
bge_cont26427:
	lwz	r5, 4(r3)
	lwz	r6, 8(r3)
	lwz	r7, 16(r3)
	b	scan_line3061
create_pixel3069:
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26428
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26429
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26430
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 48(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_float_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	min_caml_create_array
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 52(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	stw	r2, 16(r5)
	li	r2, 5
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	li	r5, 5
	li	r6, 0
	stw	r2, 56(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 64(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r5, 64(r3)
	stw	r2, 16(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 68(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 16(r5)
	li	r2, 1
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 72(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 76(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 76(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 76(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 76(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 76(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 72(r3)
	stw	r5, 24(r2)
	lwz	r5, 68(r3)
	stw	r5, 20(r2)
	lwz	r5, 64(r3)
	stw	r5, 16(r2)
	lwz	r5, 60(r3)
	stw	r5, 12(r2)
	lwz	r5, 56(r3)
	stw	r5, 8(r2)
	lwz	r5, 52(r3)
	stw	r5, 4(r2)
	lwz	r5, 48(r3)
	stw	r5, 0(r2)
	lwz	r5, 44(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26431
	stw	r2, 80(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	create_pixel3069
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 80(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3071
bge_else26431:
	mr	r2, r7
	blr
bge_else26430:
	mr	r2, r7
	blr
bge_else26429:
	mr	r2, r7
	blr
bge_else26428:
	blr
calc_dirvec3081:
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else26432
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f2, f2, f3
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f3, 0(r31)
	fadd	f2, f2, f3
	fsqrt	f2, f2
	fdiv	f0, f0, f2
	fdiv	f1, f1, f2
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
	lwz	r5, 0(r5)
	stfd	f0, 0(r5)
	stfd	f1, 4(r5)
	stfd	f2, 8(r5)
	addi	r5, r6, 40
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r5, 0(r31)
	lwz	r5, 0(r5)
	fneg	f3, f1
	stfd	f0, 0(r5)
	stfd	f2, 4(r5)
	stfd	f3, 8(r5)
	addi	r5, r6, 80
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r5, 0(r31)
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f1
	stfd	f2, 0(r5)
	stfd	f3, 4(r5)
	stfd	f4, 8(r5)
	addi	r5, r6, 1
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r5, 0(r31)
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f1
	fneg	f5, f2
	stfd	f3, 0(r5)
	stfd	f4, 4(r5)
	stfd	f5, 8(r5)
	addi	r5, r6, 41
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r5, 0(r31)
	lwz	r5, 0(r5)
	fneg	f3, f0
	fneg	f4, f2
	stfd	f3, 0(r5)
	stfd	f4, 4(r5)
	stfd	f1, 8(r5)
	addi	r5, r6, 81
	slwi	r5, r5, 2
	add	r31, r2, r5
	lwz	r2, 0(r31)
	lwz	r2, 0(r2)
	fneg	f2, f2
	stfd	f2, 0(r2)
	stfd	f0, 4(r2)
	stfd	f1, 8(r2)
	blr
bge_else26432:
	fmul	f0, f1, f1
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f1, 0(r31)
	fadd	f0, f0, f1
	fsqrt	f0, f0
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f2, 0(r31)
	fadd	f1, f1, f2
	fsqrt	f1, f1
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
	blt	cr7, bge_else26436
	itof	f1, r2
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l21397)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21397)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21397)
	lfd	f2, 0(r31)
	fsub	f2, f1, f2
	li	r7, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26437
	subi	r5, r5, 5
	b	bge_cont26438
bge_else26437:
bge_cont26438:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26439
	itof	f0, r2
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l21397)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21397)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21397)
	lfd	f1, 0(r31)
	fsub	f2, f0, f1
	li	r6, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r5, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26440
	subi	r5, r5, 5
	b	bge_cont26441
bge_else26440:
bge_cont26441:
	lfd	f0, 0(r3)
	lwz	r6, 12(r3)
	b	calc_dirvecs3089
bge_else26439:
	blr
bge_else26436:
	blr
calc_dirvec_rows3094:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26444
	itof	f0, r2
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l21397)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21397)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21397)
	lfd	f1, 0(r31)
	fsub	f3, f0, f1
	li	r7, 4
	itof	f0, r7
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l21397)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21397)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21397)
	lfd	f1, 0(r31)
	fsub	f2, f0, f1
	li	r8, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l20312)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l20312)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l20312)
	lfd	f1, 0(r31)
	fadd	f2, f0, f1
	li	r2, 0
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26446
	subi	r6, r6, 5
	b	bge_cont26447
bge_else26446:
bge_cont26447:
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
	blt	cr7, bge_else26448
	subi	r5, r5, 5
	b	bge_cont26449
bge_else26448:
bge_cont26449:
	lwz	r6, 20(r3)
	addi	r6, r6, 4
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26450
	itof	f0, r2
	lis	r31, lo16(l21396)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21396)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21396)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l21397)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21397)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21397)
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
	blt	cr7, bge_else26451
	subi	r5, r5, 5
	b	bge_cont26452
bge_else26451:
bge_cont26452:
	lwz	r6, 28(r3)
	addi	r6, r6, 4
	b	calc_dirvec_rows3094
bge_else26450:
	blr
bge_else26444:
	blr
create_dirvec_elements3100:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26455
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26456
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26457
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26458
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26459
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
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
	mr	r2, r5
	lwz	r5, 36(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26460
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r5
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
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26461
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 52(r3)
	mflr	r31
	mr	r2, r5
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
	lwz	r2, 56(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26462
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 64(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 64(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	create_dirvec_elements3100
bge_else26462:
	blr
bge_else26461:
	blr
bge_else26460:
	blr
bge_else26459:
	blr
bge_else26458:
	blr
bge_else26457:
	blr
bge_else26456:
	blr
bge_else26455:
	blr
create_dirvecs3103:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26471
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	lwz	r5, 16(r3)
	stw	r2, 460(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	stw	r5, 36(r3)
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
	lwz	r2, 36(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 456(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 452(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	stw	r5, 44(r3)
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
	lwz	r2, 44(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 16(r3)
	stw	r2, 448(r5)
	li	r2, 111
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	create_dirvec_elements3100
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26472
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r5, 48(r3)
	stw	r2, 52(r3)
	mflr	r31
	mr	r2, r7
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
	lwz	r2, 56(r3)
	stw	r2, 0(r5)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 48(r3)
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
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 60(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 64(r3)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 64(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 68(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 68(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 72(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 72(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 464(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 76(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 76(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 460(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 80(r3)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 80(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 456(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 84(r3)
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
	lwz	r2, 84(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 60(r3)
	stw	r2, 452(r5)
	li	r2, 112
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	create_dirvec_elements3100
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 52(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26473
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r5, 88(r3)
	stw	r2, 92(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 96(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 96(r3)
	stw	r2, 0(r5)
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r5, 92(r3)
	slwi	r6, r5, 2
	lwz	r7, 88(r3)
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
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 100(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_float_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 104(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 104(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 100(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_float_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 108(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 108(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 100(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_float_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 112(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 112(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 100(r3)
	stw	r2, 464(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_float_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 116(r3)
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
	lwz	r2, 116(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 100(r3)
	stw	r2, 460(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	lwz	r2, 120(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 100(r3)
	stw	r2, 456(r5)
	li	r2, 113
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	create_dirvec_elements3100
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r2, 92(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26474
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	li	r6, 120
	li	r7, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r5, 124(r3)
	stw	r2, 128(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_create_float_array
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
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
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 128(r3)
	slwi	r6, r5, 2
	lwz	r7, 124(r3)
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
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 136(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 140(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 140(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 136(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 144(r3)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 144(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 136(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 148(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_create_array
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 148(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 136(r3)
	stw	r2, 464(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_create_float_array
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 152(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_create_array
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 152(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 136(r3)
	stw	r2, 460(r5)
	li	r2, 114
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	create_dirvec_elements3100
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lwz	r2, 128(r3)
	subi	r2, r2, 1
	b	create_dirvecs3103
bge_else26474:
	blr
bge_else26473:
	blr
bge_else26472:
	blr
bge_else26471:
	blr
init_dirvec_constants3105:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26479
	slwi	r6, r5, 2
	add	r31, r2, r6
	lwz	r6, 0(r31)
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
	blt	cr7, bge_else26480
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
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
	blt	cr7, bge_else26481
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r5)
	lwz	r10, 0(r5)
	lwz	r11, 4(r8)
	stw	r5, 12(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else26483
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26484
beq_else26483:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else26485
	li	r11, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r9, 16(r3)
	stw	r7, 20(r3)
	stw	r8, 24(r3)
	stw	r10, 28(r3)
	mflr	r31
	mr	r2, r11
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 28(r3)
	lfd	f0, 0(r5)
	lwz	r6, 24(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26487
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26488
ble_else26487:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26488:
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26486
beq_else26485:
	stw	r9, 16(r3)
	stw	r7, 20(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_second_table2884
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	slwi	r6, r5, 2
	lwz	r7, 16(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26486:
beq_cont26484:
	subi	r5, r5, 1
	lwz	r2, 12(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	bge_cont26482
bge_else26481:
bge_cont26482:
	lwz	r2, 8(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26489
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r7
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26490
	slwi	r5, r2, 2
	lwz	r6, 0(r3)
	add	r31, r6, r5
	lwz	r5, 0(r31)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_dirvec_constants2890
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	subi	r5, r2, 1
	lwz	r2, 0(r3)
	b	init_dirvec_constants3105
bge_else26490:
	blr
bge_else26489:
	blr
bge_else26480:
	blr
bge_else26479:
	blr
init_vecset_constants3108:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26495
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
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
	blt	cr7, bge_else26496
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r6)
	lwz	r10, 0(r6)
	lwz	r11, 4(r8)
	stw	r6, 8(r3)
	cmpwi	cr7, r11, 1
	bne	cr7, beq_else26498
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26499
beq_else26498:
	cmpwi	cr7, r11, 2
	bne	cr7, beq_else26500
	li	r11, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r9, 12(r3)
	stw	r7, 16(r3)
	stw	r8, 20(r3)
	stw	r10, 24(r3)
	mflr	r31
	mr	r2, r11
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_create_float_array
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	lfd	f0, 0(r5)
	lwz	r6, 20(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26502
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26503
ble_else26502:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26503:
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26501
beq_else26500:
	stw	r9, 12(r3)
	stw	r7, 16(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r10
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_second_table2884
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	slwi	r6, r5, 2
	lwz	r7, 12(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26501:
beq_cont26499:
	subi	r5, r5, 1
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	bge_cont26497
bge_else26496:
bge_cont26497:
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
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 4(r3)
	lwz	r5, 468(r2)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	setup_dirvec_constants2890
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r5, 116
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	init_dirvec_constants3105
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26504
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 476(r5)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r2, 28(r3)
	stw	r5, 32(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 32(r3)
	lwz	r5, 472(r2)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	setup_dirvec_constants2890
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 117
	lwz	r2, 32(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	init_dirvec_constants3105
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r2, 28(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26505
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 476(r5)
	stw	r2, 36(r3)
	stw	r5, 40(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	setup_dirvec_constants2890
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r5, 118
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	init_dirvec_constants3105
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r2, 36(r3)
	subi	r2, r2, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26506
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
	stw	r2, 44(r3)
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_dirvec_constants3105
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 44(r3)
	subi	r2, r2, 1
	b	init_vecset_constants3108
bge_else26506:
	blr
bge_else26505:
	blr
bge_else26504:
	blr
bge_else26495:
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
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26512
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else26514
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26515
beq_else26514:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else26516
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	stw	r2, 64(r3)
	stw	r7, 68(r3)
	stw	r8, 72(r3)
	mflr	r31
	mr	r2, r9
	fmr	f0, f2
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 56(r3)
	lfd	f0, 0(r5)
	lwz	r6, 72(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26518
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26519
ble_else26518:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26519:
	lwz	r5, 68(r3)
	slwi	r6, r5, 2
	lwz	r7, 64(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26517
beq_else26516:
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
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26517:
beq_cont26515:
	subi	r5, r5, 1
	lwz	r2, 60(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	bge_cont26513
bge_else26512:
bge_cont26513:
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
	add	r31, r2, r7
	stw	r5, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	stw	r2, 76(r3)
	stw	r7, 80(r3)
	stfd	f1, 88(r3)
	mflr	r31
	mr	r2, r8
	fmr	f0, f2
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 96(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r6, 96(r3)
	stw	r6, 0(r5)
	lfd	f0, 0(r3)
	stfd	f0, 0(r6)
	lfd	f1, 88(r3)
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
	stw	r5, 100(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else26521
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else26523
	stw	r2, 104(r3)
	stw	r7, 108(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	setup_rect_table2878
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 104(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26524
beq_else26523:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else26525
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	stw	r2, 104(r3)
	stw	r7, 108(r3)
	stw	r8, 112(r3)
	mflr	r31
	mr	r2, r9
	fmr	f0, f1
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_float_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r5, 96(r3)
	lfd	f0, 0(r5)
	lwz	r6, 112(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26527
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26528
ble_else26527:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26528:
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 104(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26526
beq_else26525:
	stw	r2, 104(r3)
	stw	r7, 108(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	setup_second_table2884
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lwz	r5, 108(r3)
	slwi	r6, r5, 2
	lwz	r7, 104(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26526:
beq_cont26524:
	subi	r5, r5, 1
	lwz	r2, 100(r3)
	mflr	r31
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	b	bge_cont26522
bge_else26521:
bge_cont26522:
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
	lwz	r6, 100(r3)
	stw	r6, 4(r5)
	lwz	r6, 80(r3)
	stw	r6, 0(r5)
	lwz	r6, 76(r3)
	slwi	r6, r6, 2
	add	r31, r2, r6
	stw	r5, 0(r31)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f2, 0(r31)
	stw	r5, 116(r3)
	stw	r6, 120(r3)
	stfd	f1, 128(r3)
	mflr	r31
	mr	r2, r7
	fmr	f0, f2
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 136(r3)
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
	lwz	r6, 136(r3)
	stw	r6, 0(r5)
	lfd	f0, 0(r3)
	stfd	f0, 0(r6)
	lfd	f0, 40(r3)
	stfd	f0, 4(r6)
	lfd	f0, 128(r3)
	stfd	f0, 8(r6)
	lis	r7, lo16(min_caml_n_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_n_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_n_objects)
	lwz	r7, 0(r7)
	lwz	r7, 0(r7)
	subi	r7, r7, 1
	stw	r5, 140(r3)
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else26530
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else26532
	stw	r2, 144(r3)
	stw	r7, 148(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	setup_rect_table2878
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lwz	r5, 148(r3)
	slwi	r6, r5, 2
	lwz	r7, 144(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26533
beq_else26532:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else26534
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 144(r3)
	stw	r7, 148(r3)
	stw	r8, 152(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	min_caml_create_float_array
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lwz	r5, 136(r3)
	lfd	f0, 0(r5)
	lwz	r6, 152(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26536
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26537
ble_else26536:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26537:
	lwz	r5, 148(r3)
	slwi	r6, r5, 2
	lwz	r7, 144(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26535
beq_else26534:
	stw	r2, 144(r3)
	stw	r7, 148(r3)
	mflr	r31
	mr	r5, r8
	mr	r2, r6
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	setup_second_table2884
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lwz	r5, 148(r3)
	slwi	r6, r5, 2
	lwz	r7, 144(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26535:
beq_cont26533:
	subi	r5, r5, 1
	lwz	r2, 140(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	b	bge_cont26531
bge_else26530:
bge_cont26531:
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
	lwz	r6, 140(r3)
	stw	r6, 4(r5)
	lwz	r6, 120(r3)
	stw	r6, 0(r5)
	lwz	r6, 116(r3)
	slwi	r6, r6, 2
	add	r31, r2, r6
	stw	r5, 0(r31)
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
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	lis	r31, lo16(l18927)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18927)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18927)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	blt	cr7, bge_else26539
	lis	r8, lo16(min_caml_objects)
	srwi	r8, r8, 31
	addi	r8, r8, ha16(min_caml_objects)
	slwi	r8, r8, 16
	addi	r8, r8, lo16(min_caml_objects)
	lwz	r8, 0(r8)
	slwi	r9, r7, 2
	add	r31, r8, r9
	lwz	r8, 0(r31)
	lwz	r9, 4(r8)
	cmpwi	cr7, r9, 1
	bne	cr7, beq_else26541
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
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26542
beq_else26541:
	cmpwi	cr7, r9, 2
	bne	cr7, beq_else26543
	li	r9, 4
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 48(r3)
	stw	r7, 52(r3)
	stw	r8, 56(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_float_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	lfd	f0, 0(r5)
	lwz	r6, 56(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26545
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stfd	f0, 0(r2)
	b	ble_cont26546
ble_else26545:
	lis	r31, lo16(l18964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18964)
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
ble_cont26546:
	lwz	r5, 52(r3)
	slwi	r6, r5, 2
	lwz	r7, 48(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	b	beq_cont26544
beq_else26543:
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
	add	r31, r7, r6
	stw	r2, 0(r31)
beq_cont26544:
beq_cont26542:
	subi	r5, r5, 1
	lwz	r2, 44(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	b	bge_cont26540
bge_else26539:
bge_cont26540:
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
	add	r31, r2, r7
	stw	r5, 0(r31)
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
	lis	r31, lo16(l21780)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l21780)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l21780)
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
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26548
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 4(r3)
	stw	r5, 8(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 32(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_float_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lwz	r5, 32(r3)
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
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 40(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 36(r3)
	stw	r5, 24(r2)
	lwz	r5, 32(r3)
	stw	r5, 20(r2)
	lwz	r5, 28(r3)
	stw	r5, 16(r2)
	lwz	r5, 24(r3)
	stw	r5, 12(r2)
	lwz	r5, 20(r3)
	stw	r5, 8(r2)
	lwz	r5, 16(r3)
	stw	r5, 4(r2)
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
	lwz	r5, 8(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26550
	stw	r2, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	create_pixel3069
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r5, 44(r3)
	slwi	r6, r5, 2
	lwz	r7, 4(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mflr	r31
	mr	r2, r7
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	init_line_elements3071
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	bge_cont26551
bge_else26550:
	mr	r2, r7
bge_cont26551:
	b	bge_cont26549
bge_else26548:
bge_cont26549:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	stw	r2, 48(r3)
	stw	r5, 52(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	create_pixel3069
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 52(r3)
	mflr	r31
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	min_caml_create_array
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26552
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 56(r3)
	stw	r5, 60(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_float_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	min_caml_create_array
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 68(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_float_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 68(r3)
	stw	r2, 16(r5)
	li	r2, 5
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	min_caml_create_array
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	li	r5, 5
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
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 76(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 80(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 80(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 80(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	lwz	r5, 80(r3)
	stw	r2, 16(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_float_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 84(r3)
	addi	r3, r3, 88
	bl	min_caml_create_array
	subi	r3, r3, 88
	lwz	r31, 84(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 84(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r5, 84(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r5, 84(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r5, 84(r3)
	stw	r2, 16(r5)
	li	r2, 1
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 88(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_float_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	min_caml_create_array
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 92(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r5, 92(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r5, 92(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	min_caml_create_float_array
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r5, 92(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 88(r3)
	stw	r5, 24(r2)
	lwz	r5, 84(r3)
	stw	r5, 20(r2)
	lwz	r5, 80(r3)
	stw	r5, 16(r2)
	lwz	r5, 76(r3)
	stw	r5, 12(r2)
	lwz	r5, 72(r3)
	stw	r5, 8(r2)
	lwz	r5, 68(r3)
	stw	r5, 4(r2)
	lwz	r5, 64(r3)
	stw	r5, 0(r2)
	lwz	r5, 60(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26554
	stw	r2, 96(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	create_pixel3069
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	lwz	r5, 96(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mflr	r31
	mr	r2, r7
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	init_line_elements3071
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	b	bge_cont26555
bge_else26554:
	mr	r2, r7
bge_cont26555:
	b	bge_cont26553
bge_else26552:
bge_cont26553:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	stw	r2, 100(r3)
	stw	r5, 104(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	create_pixel3069
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 104(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	min_caml_create_array
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	subi	r5, r5, 2
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else26556
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 108(r3)
	stw	r5, 112(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	min_caml_create_float_array
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 116(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	lwz	r5, 120(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r5, 120(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r5, 120(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_float_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	lwz	r5, 120(r3)
	stw	r2, 16(r5)
	li	r2, 5
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 124(r3)
	addi	r3, r3, 128
	bl	min_caml_create_array
	subi	r3, r3, 128
	lwz	r31, 124(r3)
	mtlr	r31
	li	r5, 5
	li	r6, 0
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
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
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
	li	r2, 5
	mflr	r31
	stw	r31, 132(r3)
	addi	r3, r3, 136
	bl	min_caml_create_array
	subi	r3, r3, 136
	lwz	r31, 132(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 132(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 132(r3)
	stw	r2, 16(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 136(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 136(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 136(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 136(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_float_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	lwz	r5, 136(r3)
	stw	r2, 16(r5)
	li	r2, 1
	li	r6, 0
	mflr	r31
	mr	r5, r6
	stw	r31, 140(r3)
	addi	r3, r3, 144
	bl	min_caml_create_array
	subi	r3, r3, 144
	lwz	r31, 140(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 140(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mr	r5, r2
	mtlr	r31
	li	r2, 5
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 144(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 144(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 144(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 144(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 148(r3)
	addi	r3, r3, 152
	bl	min_caml_create_float_array
	subi	r3, r3, 152
	lwz	r31, 148(r3)
	mtlr	r31
	lwz	r5, 144(r3)
	stw	r2, 16(r5)
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 140(r3)
	stw	r5, 24(r2)
	lwz	r5, 136(r3)
	stw	r5, 20(r2)
	lwz	r5, 132(r3)
	stw	r5, 16(r2)
	lwz	r5, 128(r3)
	stw	r5, 12(r2)
	lwz	r5, 124(r3)
	stw	r5, 8(r2)
	lwz	r5, 120(r3)
	stw	r5, 4(r2)
	lwz	r5, 116(r3)
	stw	r5, 0(r2)
	lwz	r5, 112(r3)
	slwi	r6, r5, 2
	lwz	r7, 108(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r2, r5, 1
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else26558
	stw	r2, 148(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	create_pixel3069
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	lwz	r5, 148(r3)
	slwi	r6, r5, 2
	lwz	r7, 108(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mflr	r31
	mr	r2, r7
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	init_line_elements3071
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
	b	bge_cont26559
bge_else26558:
	mr	r2, r7
bge_cont26559:
	b	bge_cont26557
bge_else26556:
bge_cont26557:
	stw	r2, 152(r3)
	mflr	r31
	stw	r31, 156(r3)
	addi	r3, r3, 160
	bl	read_screen_settings2773
	subi	r3, r3, 160
	lwz	r31, 156(r3)
	mtlr	r31
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 160(r3)
	mflr	r31
	stw	r31, 172(r3)
	addi	r3, r3, 176
	bl	min_caml_sin
	subi	r3, r3, 176
	lwz	r31, 172(r3)
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
	lis	r31, lo16(l18893)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18893)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18893)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lfd	f1, 160(r3)
	stfd	f0, 168(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 180(r3)
	addi	r3, r3, 184
	bl	min_caml_cos
	subi	r3, r3, 184
	lwz	r31, 180(r3)
	mtlr	r31
	lfd	f1, 168(r3)
	stfd	f0, 176(r3)
	mflr	r31
	fmr	f0, f1
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_sin
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 176(r3)
	fmul	f0, f1, f0
	stfd	f0, 0(r2)
	lfd	f0, 168(r3)
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	min_caml_cos
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f1, 176(r3)
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
	li	r2, 0
	stw	r2, 184(r3)
	mflr	r31
	stw	r31, 188(r3)
	addi	r3, r3, 192
	bl	read_nth_object2780
	subi	r3, r3, 192
	lwz	r31, 188(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26561
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 184(r3)
	stw	r5, 0(r2)
	b	beq_cont26562
beq_else26561:
	li	r2, 1
	stw	r2, 188(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	read_nth_object2780
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26563
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 188(r3)
	stw	r5, 0(r2)
	b	beq_cont26564
beq_else26563:
	li	r2, 2
	stw	r2, 192(r3)
	mflr	r31
	stw	r31, 196(r3)
	addi	r3, r3, 200
	bl	read_nth_object2780
	subi	r3, r3, 200
	lwz	r31, 196(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26565
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 192(r3)
	stw	r5, 0(r2)
	b	beq_cont26566
beq_else26565:
	li	r2, 3
	stw	r2, 196(r3)
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	read_nth_object2780
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26567
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 196(r3)
	stw	r5, 0(r2)
	b	beq_cont26568
beq_else26567:
	li	r2, 4
	stw	r2, 200(r3)
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	read_nth_object2780
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else26569
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 200(r3)
	stw	r5, 0(r2)
	b	beq_cont26570
beq_else26569:
	li	r2, 5
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	read_object2782
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
beq_cont26570:
beq_cont26568:
beq_cont26566:
beq_cont26564:
beq_cont26562:
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else26571
	li	r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 204(r3)
	addi	r3, r3, 208
	bl	min_caml_create_array
	subi	r3, r3, 208
	lwz	r31, 204(r3)
	mtlr	r31
	b	beq_cont26572
beq_else26571:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 204(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26573
	li	r5, 2
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 212(r3)
	addi	r3, r3, 216
	bl	min_caml_create_array
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	b	beq_cont26574
beq_else26573:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 208(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else26575
	li	r6, 3
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 212(r3)
	addi	r3, r3, 216
	bl	min_caml_create_array
	subi	r3, r3, 216
	lwz	r31, 212(r3)
	mtlr	r31
	b	beq_cont26576
beq_else26575:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 212(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else26577
	li	r7, 4
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 220(r3)
	addi	r3, r3, 224
	bl	min_caml_create_array
	subi	r3, r3, 224
	lwz	r31, 220(r3)
	mtlr	r31
	b	beq_cont26578
beq_else26577:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 216(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else26579
	li	r8, 5
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 220(r3)
	addi	r3, r3, 224
	bl	min_caml_create_array
	subi	r3, r3, 224
	lwz	r31, 220(r3)
	mtlr	r31
	b	beq_cont26580
beq_else26579:
	li	r9, 5
	stw	r8, 220(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 228(r3)
	addi	r3, r3, 232
	bl	read_net_item2786
	subi	r3, r3, 232
	lwz	r31, 228(r3)
	mtlr	r31
	lwz	r5, 220(r3)
	stw	r5, 16(r2)
beq_cont26580:
	lwz	r5, 216(r3)
	stw	r5, 12(r2)
beq_cont26578:
	lwz	r5, 212(r3)
	stw	r5, 8(r2)
beq_cont26576:
	lwz	r5, 208(r3)
	stw	r5, 4(r2)
beq_cont26574:
	lwz	r5, 204(r3)
	stw	r5, 0(r2)
beq_cont26572:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26581
	b	beq_cont26582
beq_else26581:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	stw	r2, 0(r5)
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else26583
	li	r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 228(r3)
	addi	r3, r3, 232
	bl	min_caml_create_array
	subi	r3, r3, 232
	lwz	r31, 228(r3)
	mtlr	r31
	b	beq_cont26584
beq_else26583:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 224(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26585
	li	r5, 2
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 228(r3)
	addi	r3, r3, 232
	bl	min_caml_create_array
	subi	r3, r3, 232
	lwz	r31, 228(r3)
	mtlr	r31
	b	beq_cont26586
beq_else26585:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 228(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else26587
	li	r6, 3
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 236(r3)
	addi	r3, r3, 240
	bl	min_caml_create_array
	subi	r3, r3, 240
	lwz	r31, 236(r3)
	mtlr	r31
	b	beq_cont26588
beq_else26587:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 232(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else26589
	li	r7, 4
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 236(r3)
	addi	r3, r3, 240
	bl	min_caml_create_array
	subi	r3, r3, 240
	lwz	r31, 236(r3)
	mtlr	r31
	b	beq_cont26590
beq_else26589:
	li	r8, 4
	stw	r7, 236(r3)
	mflr	r31
	mr	r2, r8
	stw	r31, 244(r3)
	addi	r3, r3, 248
	bl	read_net_item2786
	subi	r3, r3, 248
	lwz	r31, 244(r3)
	mtlr	r31
	lwz	r5, 236(r3)
	stw	r5, 12(r2)
beq_cont26590:
	lwz	r5, 232(r3)
	stw	r5, 8(r2)
beq_cont26588:
	lwz	r5, 228(r3)
	stw	r5, 4(r2)
beq_cont26586:
	lwz	r5, 224(r3)
	stw	r5, 0(r2)
beq_cont26584:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26591
	b	beq_cont26592
beq_else26591:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	stw	r2, 4(r5)
	li	r2, 2
	mflr	r31
	stw	r31, 244(r3)
	addi	r3, r3, 248
	bl	read_and_network2790
	subi	r3, r3, 248
	lwz	r31, 244(r3)
	mtlr	r31
beq_cont26592:
beq_cont26582:
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 240(r3)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else26593
	li	r5, 1
	li	r6, -1
	mflr	r31
	mr	r2, r5
	mr	r5, r6
	stw	r31, 244(r3)
	addi	r3, r3, 248
	bl	min_caml_create_array
	subi	r3, r3, 248
	lwz	r31, 244(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont26594
beq_else26593:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r5, 244(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else26595
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 252(r3)
	addi	r3, r3, 256
	bl	min_caml_create_array
	subi	r3, r3, 256
	lwz	r31, 252(r3)
	mtlr	r31
	b	beq_cont26596
beq_else26595:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 248(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else26597
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 252(r3)
	addi	r3, r3, 256
	bl	min_caml_create_array
	subi	r3, r3, 256
	lwz	r31, 252(r3)
	mtlr	r31
	b	beq_cont26598
beq_else26597:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 252(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else26599
	li	r8, 4
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 260(r3)
	addi	r3, r3, 264
	bl	min_caml_create_array
	subi	r3, r3, 264
	lwz	r31, 260(r3)
	mtlr	r31
	b	beq_cont26600
beq_else26599:
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	slwi	r9, r9, 8
	in	r9
	stw	r8, 256(r3)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else26601
	li	r9, 5
	li	r10, -1
	mflr	r31
	mr	r5, r10
	mr	r2, r9
	stw	r31, 260(r3)
	addi	r3, r3, 264
	bl	min_caml_create_array
	subi	r3, r3, 264
	lwz	r31, 260(r3)
	mtlr	r31
	b	beq_cont26602
beq_else26601:
	li	r10, 5
	stw	r9, 260(r3)
	mflr	r31
	mr	r2, r10
	stw	r31, 268(r3)
	addi	r3, r3, 272
	bl	read_net_item2786
	subi	r3, r3, 272
	lwz	r31, 268(r3)
	mtlr	r31
	lwz	r5, 260(r3)
	stw	r5, 16(r2)
beq_cont26602:
	lwz	r5, 256(r3)
	stw	r5, 12(r2)
beq_cont26600:
	lwz	r5, 252(r3)
	stw	r5, 8(r2)
beq_cont26598:
	lwz	r5, 248(r3)
	stw	r5, 4(r2)
beq_cont26596:
	lwz	r5, 244(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont26594:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else26603
	li	r2, 1
	mflr	r31
	stw	r31, 268(r3)
	addi	r3, r3, 272
	bl	min_caml_create_array
	subi	r3, r3, 272
	lwz	r31, 268(r3)
	mtlr	r31
	b	beq_cont26604
beq_else26603:
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	stw	r5, 264(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else26605
	li	r2, 1
	li	r6, -1
	mflr	r31
	mr	r5, r6
	stw	r31, 268(r3)
	addi	r3, r3, 272
	bl	min_caml_create_array
	subi	r3, r3, 272
	lwz	r31, 268(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont26606
beq_else26605:
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	slwi	r6, r6, 8
	in	r6
	stw	r2, 268(r3)
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else26607
	li	r6, 2
	li	r7, -1
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 276(r3)
	addi	r3, r3, 280
	bl	min_caml_create_array
	subi	r3, r3, 280
	lwz	r31, 276(r3)
	mtlr	r31
	b	beq_cont26608
beq_else26607:
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 272(r3)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else26609
	li	r7, 3
	li	r8, -1
	mflr	r31
	mr	r5, r8
	mr	r2, r7
	stw	r31, 276(r3)
	addi	r3, r3, 280
	bl	min_caml_create_array
	subi	r3, r3, 280
	lwz	r31, 276(r3)
	mtlr	r31
	b	beq_cont26610
beq_else26609:
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	slwi	r8, r8, 8
	in	r8
	stw	r7, 276(r3)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else26611
	li	r8, 4
	li	r9, -1
	mflr	r31
	mr	r5, r9
	mr	r2, r8
	stw	r31, 284(r3)
	addi	r3, r3, 288
	bl	min_caml_create_array
	subi	r3, r3, 288
	lwz	r31, 284(r3)
	mtlr	r31
	b	beq_cont26612
beq_else26611:
	li	r9, 4
	stw	r8, 280(r3)
	mflr	r31
	mr	r2, r9
	stw	r31, 284(r3)
	addi	r3, r3, 288
	bl	read_net_item2786
	subi	r3, r3, 288
	lwz	r31, 284(r3)
	mtlr	r31
	lwz	r5, 280(r3)
	stw	r5, 12(r2)
beq_cont26612:
	lwz	r5, 276(r3)
	stw	r5, 8(r2)
beq_cont26610:
	lwz	r5, 272(r3)
	stw	r5, 4(r2)
beq_cont26608:
	lwz	r5, 268(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont26606:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else26613
	li	r2, 2
	mflr	r31
	stw	r31, 284(r3)
	addi	r3, r3, 288
	bl	min_caml_create_array
	subi	r3, r3, 288
	lwz	r31, 284(r3)
	mtlr	r31
	b	beq_cont26614
beq_else26613:
	li	r2, 2
	stw	r5, 284(r3)
	mflr	r31
	stw	r31, 292(r3)
	addi	r3, r3, 296
	bl	read_or_network2788
	subi	r3, r3, 296
	lwz	r31, 292(r3)
	mtlr	r31
	lwz	r5, 284(r3)
	stw	r5, 4(r2)
beq_cont26614:
	lwz	r5, 264(r3)
	stw	r5, 0(r2)
beq_cont26604:
	lwz	r5, 240(r3)
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
	stw	r31, 292(r3)
	addi	r3, r3, 296
	bl	min_caml_print_int
	subi	r3, r3, 296
	lwz	r31, 292(r3)
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
	stw	r31, 292(r3)
	addi	r3, r3, 296
	bl	min_caml_print_int
	subi	r3, r3, 296
	lwz	r31, 292(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	li	r2, 255
	mflr	r31
	stw	r31, 292(r3)
	addi	r3, r3, 296
	bl	min_caml_print_int
	subi	r3, r3, 296
	lwz	r31, 292(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	li	r5, 120
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 288(r3)
	stw	r5, 292(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 300(r3)
	addi	r3, r3, 304
	bl	min_caml_create_float_array
	subi	r3, r3, 304
	lwz	r31, 300(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 296(r3)
	mflr	r31
	stw	r31, 300(r3)
	addi	r3, r3, 304
	bl	min_caml_create_array
	subi	r3, r3, 304
	lwz	r31, 300(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 296(r3)
	stw	r2, 0(r5)
	lwz	r2, 292(r3)
	mflr	r31
	stw	r31, 300(r3)
	addi	r3, r3, 304
	bl	min_caml_create_array
	subi	r3, r3, 304
	lwz	r31, 300(r3)
	mtlr	r31
	lwz	r5, 288(r3)
	stw	r2, 16(r5)
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 300(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 308(r3)
	addi	r3, r3, 312
	bl	min_caml_create_float_array
	subi	r3, r3, 312
	lwz	r31, 308(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 304(r3)
	mflr	r31
	stw	r31, 308(r3)
	addi	r3, r3, 312
	bl	min_caml_create_array
	subi	r3, r3, 312
	lwz	r31, 308(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 304(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 300(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 308(r3)
	addi	r3, r3, 312
	bl	min_caml_create_float_array
	subi	r3, r3, 312
	lwz	r31, 308(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 308(r3)
	mflr	r31
	stw	r31, 316(r3)
	addi	r3, r3, 320
	bl	min_caml_create_array
	subi	r3, r3, 320
	lwz	r31, 316(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 308(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 300(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 316(r3)
	addi	r3, r3, 320
	bl	min_caml_create_float_array
	subi	r3, r3, 320
	lwz	r31, 316(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 312(r3)
	mflr	r31
	stw	r31, 316(r3)
	addi	r3, r3, 320
	bl	min_caml_create_array
	subi	r3, r3, 320
	lwz	r31, 316(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 312(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 300(r3)
	stw	r2, 464(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 316(r3)
	addi	r3, r3, 320
	bl	min_caml_create_float_array
	subi	r3, r3, 320
	lwz	r31, 316(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 316(r3)
	mflr	r31
	stw	r31, 324(r3)
	addi	r3, r3, 328
	bl	min_caml_create_array
	subi	r3, r3, 328
	lwz	r31, 324(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 316(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 300(r3)
	stw	r2, 460(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 324(r3)
	addi	r3, r3, 328
	bl	min_caml_create_float_array
	subi	r3, r3, 328
	lwz	r31, 324(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 320(r3)
	mflr	r31
	stw	r31, 324(r3)
	addi	r3, r3, 328
	bl	min_caml_create_array
	subi	r3, r3, 328
	lwz	r31, 324(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 320(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 300(r3)
	stw	r2, 456(r5)
	li	r2, 113
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 324(r3)
	addi	r3, r3, 328
	bl	create_dirvec_elements3100
	subi	r3, r3, 328
	lwz	r31, 324(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	li	r5, 120
	li	r6, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 324(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 332(r3)
	addi	r3, r3, 336
	bl	min_caml_create_float_array
	subi	r3, r3, 336
	lwz	r31, 332(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 328(r3)
	mflr	r31
	stw	r31, 332(r3)
	addi	r3, r3, 336
	bl	min_caml_create_array
	subi	r3, r3, 336
	lwz	r31, 332(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 328(r3)
	stw	r2, 0(r5)
	lwz	r2, 292(r3)
	mflr	r31
	stw	r31, 332(r3)
	addi	r3, r3, 336
	bl	min_caml_create_array
	subi	r3, r3, 336
	lwz	r31, 332(r3)
	mtlr	r31
	lwz	r5, 324(r3)
	stw	r2, 12(r5)
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 12(r2)
	li	r5, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	stw	r2, 332(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 340(r3)
	addi	r3, r3, 344
	bl	min_caml_create_float_array
	subi	r3, r3, 344
	lwz	r31, 340(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 336(r3)
	mflr	r31
	stw	r31, 340(r3)
	addi	r3, r3, 344
	bl	min_caml_create_array
	subi	r3, r3, 344
	lwz	r31, 340(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 336(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 332(r3)
	stw	r2, 472(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 340(r3)
	addi	r3, r3, 344
	bl	min_caml_create_float_array
	subi	r3, r3, 344
	lwz	r31, 340(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 340(r3)
	mflr	r31
	stw	r31, 348(r3)
	addi	r3, r3, 352
	bl	min_caml_create_array
	subi	r3, r3, 352
	lwz	r31, 348(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 340(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 332(r3)
	stw	r2, 468(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 348(r3)
	addi	r3, r3, 352
	bl	min_caml_create_float_array
	subi	r3, r3, 352
	lwz	r31, 348(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 344(r3)
	mflr	r31
	stw	r31, 348(r3)
	addi	r3, r3, 352
	bl	min_caml_create_array
	subi	r3, r3, 352
	lwz	r31, 348(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 344(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 332(r3)
	stw	r2, 464(r5)
	li	r2, 3
	lis	r31, lo16(l18900)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18900)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18900)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 348(r3)
	addi	r3, r3, 352
	bl	min_caml_create_float_array
	subi	r3, r3, 352
	lwz	r31, 348(r3)
	mr	r5, r2
	mtlr	r31
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	stw	r5, 348(r3)
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	min_caml_create_array
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	stw	r2, 4(r5)
	lwz	r2, 348(r3)
	stw	r2, 0(r5)
	mr	r2, r5
	lwz	r5, 332(r3)
	stw	r2, 460(r5)
	li	r2, 114
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	create_dirvec_elements3100
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	create_dirvecs3103
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	li	r2, 9
	li	r5, 0
	li	r6, 0
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	calc_dirvec_rows3094
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	lwz	r2, 16(r2)
	lwz	r5, 476(r2)
	stw	r2, 352(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	setup_dirvec_constants2890
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	li	r5, 118
	lwz	r2, 352(r3)
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	init_dirvec_constants3105
	subi	r3, r3, 360
	lwz	r31, 356(r3)
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
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	init_dirvec_constants3105
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	init_vecset_constants3108
	subi	r3, r3, 360
	lwz	r31, 356(r3)
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
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	iter_setup_dirvec_constants2887
	subi	r3, r3, 360
	lwz	r31, 356(r3)
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
	blt	cr7, bge_else26615
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	add	r31, r5, r6
	lwz	r5, 0(r31)
	lwz	r6, 8(r5)
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else26617
	lis	r31, lo16(l18965)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l18965)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l18965)
	lfd	f0, 0(r31)
	lwz	r6, 28(r5)
	lfd	f1, 0(r6)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else26619
	b	ble_cont26620
ble_else26619:
	lwz	r6, 4(r5)
	cmpwi	cr7, r6, 1
	bne	cr7, beq_else26621
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	setup_rect_reflection3119
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	b	beq_cont26622
beq_else26621:
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else26623
	mflr	r31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	setup_surface_reflection3122
	subi	r3, r3, 360
	lwz	r31, 356(r3)
	mtlr	r31
	b	beq_cont26624
beq_else26623:
beq_cont26624:
beq_cont26622:
ble_cont26620:
	b	beq_cont26618
beq_else26617:
beq_cont26618:
	b	bge_cont26616
bge_else26615:
bge_cont26616:
	li	r2, 0
	li	r6, 0
	lis	r5, lo16(min_caml_scan_pitch)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_scan_pitch)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_scan_pitch)
	lwz	r5, 0(r5)
	lfd	f0, 0(r5)
	lis	r5, lo16(min_caml_image_center)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_center)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_center)
	lwz	r5, 0(r5)
	lwz	r5, 4(r5)
	sub	r2, r2, r5
	itof	f1, r2
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fmul	f1, f0, f1
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f2, 0(r2)
	fadd	f1, f1, f2
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fmul	f2, f0, f2
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 4(r2)
	fadd	f2, f2, f3
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fmul	f0, f0, f3
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fadd	f0, f0, f3
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r5, r2, 1
	lwz	r2, 100(r3)
	mflr	r31
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 356(r3)
	addi	r3, r3, 360
	bl	pretrace_pixels3044
	subi	r3, r3, 360
	lwz	r31, 356(r3)
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
	bgt	cr7, ble_else26625
	blr
ble_else26625:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 4(r2)
	subi	r2, r2, 1
	stw	r5, 356(r3)
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else26627
	b	ble_cont26628
ble_else26627:
	li	r2, 1
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
	sub	r2, r2, r7
	itof	f1, r2
	fmul	f0, f0, f1
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fmul	f1, f0, f1
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f2, 0(r2)
	fadd	f1, f1, f2
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f2, 4(r2)
	fmul	f2, f0, f2
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 4(r2)
	fadd	f2, f2, f3
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fmul	f0, f0, f3
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fadd	f0, f0, f3
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	subi	r2, r2, 1
	lwz	r7, 152(r3)
	mflr	r31
	mr	r5, r2
	mr	r2, r7
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r31, 364(r3)
	addi	r3, r3, 368
	bl	pretrace_pixels3044
	subi	r3, r3, 368
	lwz	r31, 364(r3)
	mtlr	r31
ble_cont26628:
	li	r2, 0
	lwz	r5, 356(r3)
	lwz	r6, 48(r3)
	lwz	r7, 100(r3)
	lwz	r8, 152(r3)
	mflr	r31
	stw	r31, 364(r3)
	addi	r3, r3, 368
	bl	scan_pixel3055
	subi	r3, r3, 368
	lwz	r31, 364(r3)
	mtlr	r31
	li	r2, 1
	li	r8, 4
	lwz	r5, 100(r3)
	lwz	r6, 152(r3)
	lwz	r7, 48(r3)
	b	scan_line3061
min_caml_fin: