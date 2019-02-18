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
l9599:
	1124073472
l9444:
	1073741824
l9409:
	-1018691584
l9407:
	1128792064
l9406:
	1016003125
l9393:
	1065353216
l9392:
	-1082130432
l9391:
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
	lis	r5, lo16(min_caml_image_center)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_center)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_center)
	lwz	r5, 0(r5)
	li	r6, 256
	stw	r6, 0(r5)
	lis	r5, lo16(min_caml_image_center)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_center)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_center)
	lwz	r5, 0(r5)
	li	r6, 256
	stw	r6, 4(r5)
	lis	r5, lo16(min_caml_scan_pitch)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_scan_pitch)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_scan_pitch)
	lwz	r5, 0(r5)
	lis	r31, lo16(l9599)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9599)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9599)
	lfd	f0, 0(r31)
	itof	f1, r2
	fdiv	f0, f0, f1
	stfd	f0, 0(r5)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixelline3393
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixelline3393
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	create_pixelline3393
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_parameter3111
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
vecunit_sgn2989:
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9804
	lis	r31, lo16(l9393)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9393)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9393)
	lfd	f0, 0(r31)
	b	beq_cont9805
beq_else9804:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else9806
	lis	r31, lo16(l9393)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9393)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9393)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont9807
beq_else9806:
	lis	r31, lo16(l9392)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9392)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9392)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont9807:
beq_cont9805:
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
read_screen_settings3092:
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
	lfd	f0, 0(r2)
	ftoi	r2, f0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
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
	lfd	f0, 4(r2)
	ftoi	r2, f0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
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
	lis	r2, lo16(min_caml_screen)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screen)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screen)
	lwz	r2, 0(r2)
	lfd	f0, 8(r2)
	ftoi	r2, f0
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fdiv	f1, f0, f1
	ftoi	r2, f1
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lfd	f0, 0(r3)
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
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f2, 0(r31)
	fdiv	f2, f1, f2
	ftoi	r2, f2
	stfd	f0, 16(r3)
	stfd	f1, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	lfd	f0, 24(r3)
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
	lis	r31, lo16(l9407)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9407)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9407)
	lfd	f3, 0(r31)
	fmul	f2, f2, f3
	stfd	f2, 0(r2)
	lis	r2, lo16(min_caml_screenz_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenz_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenz_dir)
	lwz	r2, 0(r2)
	lis	r31, lo16(l9409)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9409)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9409)
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
	lis	r31, lo16(l9407)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9407)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9407)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
read_light3094:
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fdiv	f1, f0, f1
	ftoi	r2, f1
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 32
	out	r2
	lfd	f0, 0(r3)
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
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fdiv	f1, f0, f1
	ftoi	r2, f1
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_print_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	lfd	f0, 0(r3)
	mflr	r31
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
	lis	r2, lo16(min_caml_beam)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_beam)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_beam)
	lwz	r2, 0(r2)
	lfd	f0, 0(r2)
	ftoi	r2, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	blr
rotate_quadratic_matrix3096:
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
	lis	r31, lo16(l9444)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9444)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9444)
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
	lis	r31, lo16(l9444)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9444)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9444)
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
	lis	r31, lo16(l9444)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9444)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9444)
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
read_nth_object3099:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lwz	r2, 4(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9812
	li	r2, 10
	out	r2
	li	r2, 0
	blr
beq_else9812:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r5, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_print_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	slwi	r2, r2, 8
	in	r2
	stw	r2, 16(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_print_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
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
	lfd	f0, 0(r2)
	ftoi	r5, f0
	stw	r2, 20(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 20(r3)
	stfd	f0, 4(r2)
	lfd	f0, 4(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 20(r3)
	stfd	f0, 8(r2)
	lfd	f0, 8(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
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
	lfd	f0, 0(r2)
	ftoi	r5, f0
	stw	r2, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 24(r3)
	stfd	f0, 4(r2)
	lfd	f0, 4(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 24(r3)
	stfd	f0, 8(r2)
	lfd	f0, 8(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	min_caml_print_int
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fslwi	f1, f1, 8
	fin	f1
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else9813
	li	r2, 0
	b	ble_cont9814
ble_else9813:
	li	r2, 1
ble_cont9814:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9815
	li	r5, 0
	b	beq_cont9816
beq_else9815:
	li	r5, 1
beq_cont9816:
	stw	r2, 28(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	li	r2, 2
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
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
	lfd	f0, 0(r2)
	ftoi	r5, f0
	stw	r2, 32(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 32(r3)
	stfd	f0, 4(r2)
	lfd	f0, 4(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_print_int
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
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
	lfd	f0, 0(r2)
	ftoi	r5, f0
	stw	r2, 36(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_print_int
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 36(r3)
	stfd	f0, 4(r2)
	lfd	f0, 4(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_print_int
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lwz	r2, 36(r3)
	stfd	f0, 8(r2)
	lfd	f0, 8(r2)
	ftoi	r5, f0
	mflr	r31
	mr	r2, r5
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_print_int
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	li	r2, 10
	out	r2
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	min_caml_create_float_array
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else9817
	b	beq_cont9818
beq_else9817:
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
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
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
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
	lis	r31, lo16(l9406)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9406)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9406)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	stfd	f0, 8(r2)
beq_cont9818:
	lwz	r6, 8(r3)
	cmpwi	cr7, r6, 2
	bne	cr7, beq_else9819
	li	r7, 1
	b	beq_cont9820
beq_else9819:
	lwz	r7, 28(r3)
beq_cont9820:
	li	r8, 4
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lwz	r8, 12(r3)
	stw	r8, 8(r5)
	lwz	r8, 8(r3)
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
	bne	cr7, beq_else9821
	lfd	f0, 0(r6)
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9823
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	b	beq_cont9824
beq_else9823:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9825
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	b	beq_cont9826
beq_else9825:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else9827
	lis	r31, lo16(l9392)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9392)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9392)
	lfd	f1, 0(r31)
	b	ble_cont9828
ble_else9827:
	lis	r31, lo16(l9393)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9393)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9393)
	lfd	f1, 0(r31)
ble_cont9828:
beq_cont9826:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont9824:
	stfd	f0, 0(r6)
	lfd	f0, 4(r6)
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9829
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	b	beq_cont9830
beq_else9829:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9831
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	b	beq_cont9832
beq_else9831:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else9833
	lis	r31, lo16(l9392)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9392)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9392)
	lfd	f1, 0(r31)
	b	ble_cont9834
ble_else9833:
	lis	r31, lo16(l9393)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9393)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9393)
	lfd	f1, 0(r31)
ble_cont9834:
beq_cont9832:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont9830:
	stfd	f0, 4(r6)
	lfd	f0, 8(r6)
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9835
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	b	beq_cont9836
beq_else9835:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else9837
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	b	beq_cont9838
beq_else9837:
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else9839
	lis	r31, lo16(l9392)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9392)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9392)
	lfd	f1, 0(r31)
	b	ble_cont9840
ble_else9839:
	lis	r31, lo16(l9393)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9393)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9393)
	lfd	f1, 0(r31)
ble_cont9840:
beq_cont9838:
	fmul	f0, f0, f0
	fdiv	f0, f1, f0
beq_cont9836:
	stfd	f0, 8(r6)
	b	beq_cont9822
beq_else9821:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else9841
	lwz	r5, 28(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else9843
	li	r5, 1
	b	beq_cont9844
beq_else9843:
	li	r5, 0
beq_cont9844:
	mflr	r31
	mr	r2, r6
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	vecunit_sgn2989
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	b	beq_cont9842
beq_else9841:
beq_cont9842:
beq_cont9822:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9845
	b	beq_cont9846
beq_else9845:
	lwz	r2, 20(r3)
	lwz	r5, 44(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	rotate_quadratic_matrix3096
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
beq_cont9846:
	li	r2, 1
	blr
read_object3101:
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else9847
	blr
bge_else9847:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object3099
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9849
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
beq_else9849:
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else9851
	blr
bge_else9851:
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object3099
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9853
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	blr
beq_else9853:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else9855
	blr
bge_else9855:
	stw	r2, 8(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object3099
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9857
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	stw	r5, 0(r2)
	blr
beq_else9857:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else9859
	blr
bge_else9859:
	stw	r2, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_nth_object3099
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9861
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
	blr
beq_else9861:
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	b	read_object3101
read_net_item3105:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lwz	r2, 4(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9863
	li	r2, 10
	out	r2
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else9863:
	lwz	r5, 0(r3)
	addi	r6, r5, 1
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	slwi	r7, r7, 8
	in	r7
	stw	r6, 8(r3)
	stw	r7, 12(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_print_int
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lwz	r2, 12(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9864
	li	r2, 10
	out	r2
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont9865
beq_else9864:
	lwz	r5, 8(r3)
	addi	r6, r5, 1
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_net_item3105
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwz	r6, 12(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont9865:
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
	blr
read_or_network3107:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lwz	r2, 4(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9866
	li	r2, 10
	out	r2
	li	r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	b	beq_cont9867
beq_else9866:
	li	r5, 1
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item3105
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	mr	r5, r2
beq_cont9867:
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9868
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else9868:
	lwz	r2, 0(r3)
	addi	r6, r2, 1
	li	r7, 0
	stw	r5, 8(r3)
	stw	r6, 12(r3)
	mflr	r31
	mr	r2, r7
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_net_item3105
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9869
	lwz	r2, 12(r3)
	addi	r2, r2, 1
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	min_caml_create_array
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	b	beq_cont9870
beq_else9869:
	lwz	r2, 12(r3)
	addi	r6, r2, 1
	stw	r5, 16(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_or_network3107
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwz	r6, 16(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
beq_cont9870:
	lwz	r5, 0(r3)
	slwi	r5, r5, 2
	lwz	r6, 8(r3)
	add	r31, r2, r5
	stw	r6, 0(r31)
	blr
read_and_network3109:
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	slwi	r5, r5, 8
	in	r5
	stw	r2, 0(r3)
	stw	r5, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 9
	out	r2
	lwz	r2, 4(r3)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9871
	li	r2, 10
	out	r2
	li	r2, 1
	li	r5, -1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont9872
beq_else9871:
	li	r5, 1
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item3105
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
beq_cont9872:
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else9873
	blr
beq_else9873:
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
	li	r5, 0
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item3105
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else9875
	blr
beq_else9875:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	lwz	r6, 8(r3)
	slwi	r7, r6, 2
	add	r31, r5, r7
	stw	r2, 0(r31)
	addi	r2, r6, 1
	b	read_and_network3109
read_parameter3111:
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_screen_settings3092
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_light3094
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r2, 0
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object3099
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9877
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	b	beq_cont9878
beq_else9877:
	li	r2, 1
	stw	r2, 4(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_nth_object3099
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else9879
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	b	beq_cont9880
beq_else9879:
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_object3101
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont9880:
beq_cont9878:
	li	r2, 0
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item3105
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 0(r2)
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else9881
	b	beq_cont9882
beq_else9881:
	lis	r5, lo16(min_caml_and_net)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_and_net)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_and_net)
	lwz	r5, 0(r5)
	stw	r2, 0(r5)
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_and_network3109
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont9882:
	lis	r2, lo16(min_caml_or_net)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_or_net)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_or_net)
	lwz	r2, 0(r2)
	li	r5, 0
	stw	r2, 8(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	read_net_item3105
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r5, r2
	mtlr	r31
	lwz	r2, 0(r5)
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else9883
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	beq_cont9884
beq_else9883:
	li	r2, 1
	stw	r5, 12(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	read_or_network3107
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lwz	r5, 12(r3)
	stw	r5, 0(r2)
beq_cont9884:
	lwz	r5, 8(r3)
	stw	r2, 0(r5)
	blr
create_pixel3388:
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_create_float_array
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
init_line_elements3390:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else9886
	li	r6, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	blt	cr7, bge_else9887
	stw	r2, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	create_pixel3388
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 0(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3390
bge_else9887:
	mr	r2, r7
	blr
bge_else9886:
	blr
create_pixelline3393:
	lis	r2, lo16(min_caml_image_size)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_image_size)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_image_size)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	li	r5, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	li	r5, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	stw	r2, 4(r3)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lwz	r5, 8(r3)
	stw	r2, 4(r5)
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 8(r5)
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
	stw	r2, 12(r5)
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	lwz	r5, 8(r3)
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
	stw	r2, 12(r3)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
	lfd	f0, 0(r31)
	stw	r2, 16(r3)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	li	r2, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	li	r2, 5
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	li	r5, 3
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	lis	r31, lo16(l9391)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l9391)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l9391)
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
	mr	r2, r4
	addi	r4, r4, 32
	stw	r5, 28(r2)
	lwz	r5, 28(r3)
	stw	r5, 24(r2)
	lwz	r5, 24(r3)
	stw	r5, 20(r2)
	lwz	r5, 20(r3)
	stw	r5, 16(r2)
	lwz	r5, 16(r3)
	stw	r5, 12(r2)
	lwz	r5, 12(r3)
	stw	r5, 8(r2)
	lwz	r5, 8(r3)
	stw	r5, 4(r2)
	lwz	r5, 4(r3)
	stw	r5, 0(r2)
	mr	r5, r2
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	min_caml_create_array
	subi	r3, r3, 40
	lwz	r31, 36(r3)
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
	blt	cr7, bge_else9888
	stw	r2, 36(r3)
	stw	r5, 40(r3)
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	create_pixel3388
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	lwz	r5, 40(r3)
	slwi	r6, r5, 2
	lwz	r7, 36(r3)
	add	r31, r7, r6
	stw	r2, 0(r31)
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3390
bge_else9888:
	blr
min_caml_fin: