	.data
min_caml_n_objects:
	50000
min_caml_objects:
	50004
min_caml_screen:
	52644
min_caml_viewpoint:
	52656
min_caml_light:
	52668
min_caml_beam:
	52680
min_caml_and_net:
	52684
min_caml_or_net:
	52884
min_caml_solver_dist:
	52888
min_caml_intsec_rectside:
	52892
min_caml_tmin:
	52896
min_caml_intersection_point:
	52900
min_caml_intersected_object_id:
	52912
min_caml_nvector:
	52916
min_caml_texture_color:
	52928
min_caml_diffuse_ray:
	52940
min_caml_rgb:
	52952
min_caml_image_size:
	52964
min_caml_image_center:
	52972
min_caml_scan_pitch:
	52980
min_caml_startp:
	52984
min_caml_startp_fast:
	52996
min_caml_screenx_dir:
	53008
min_caml_screeny_dir:
	53020
min_caml_screenz_dir:
	53032
min_caml_ptrace_dirvec:
	53044
min_caml_dirvecs:
	53056
min_caml_light_dirvec:
	53096
min_caml_reflecrions:
	53600
min_caml_n_reflections:
	56480
lsc197:
	1061752795
lsc190:
	1070141403
lsc183:
	0
lsc182:
	1078530011
lsc181:
	1144258560
lsc180:
	1103101952
lsc179:
	1065353216
lsc178:
	1167949824
lsc177:
	1123024896
lsc176:
	1077936128
lsc172:
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
l27:
	-1072902963
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 100000
	lis	r31, lo16(l27)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l27)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l27)
	lfd	f0, 0(r31)
	li	r2, 3
	li	r5, 4
	stfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 3
	lfd	f0, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_create_float_array
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	b	min_caml_fin
reverse_flag60:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else234
	blr
sc_beq_else234:
	li	r2, 0
	blr
add_flag62:
	cmpwi	cr7, r2, 0
	bne	cr7, sc_beq_else235
	fneg	f0, f0
	blr
sc_beq_else235:
	blr
while165:
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else236
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
sc_ble_else236:
	fmr	f0, f1
	blr
while268:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, sc_ble_else237
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else238
	fsub	f0, f0, f1
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
sc_ble_else238:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
sc_ble_else237:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi72:
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f2, 0(r31)
	fmul	f2, f1, f2
	stfd	f1, 0(r3)
	stfd	f0, 8(r3)
	mflr	r31
	fmr	f1, f2
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while165
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	fmr	f1, f0
	mtlr	r31
	lfd	f0, 8(r3)
	lfd	f2, 0(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	while268
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f0, 0(r2)
	blr
kernel_sin75:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f1, f3, f1
	lis	r31, lo16(lsc176)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc176)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc176)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(lsc177)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc177)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc177)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, lo16(lsc178)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc178)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc178)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos77:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, lo16(lsc179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc179)
	lfd	f3, 0(r31)
	lis	r31, lo16(lsc172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc172)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, lo16(lsc180)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc180)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc180)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, lo16(lsc181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc181)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin:
	lis	r31, lo16(lsc182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc182)
	lfd	f1, 0(r31)
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else239
	li	r2, 0
	b	sc_ble_cont240
sc_ble_else239:
	li	r2, 1
sc_ble_cont240:
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
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
	bl	reduction_2pi72
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
	bl	reverse_flag60
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
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else246
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	sc_ble_cont247
sc_ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc197)
	lfd	f1, 0(r31)
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else248
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin75
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	sc_ble_cont249
sc_ble_else248:
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos77
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
sc_ble_cont249:
	lwz	r2, 24(r3)
	b	add_flag62
min_caml_cos:
	lis	r31, lo16(lsc182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc182)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, lo16(lsc183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, sc_ble_else250
	fneg	f0, f0
	b	sc_ble_cont251
sc_ble_else250:
sc_ble_cont251:
	stw	r2, 0(r3)
	stfd	f1, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	reduction_2pi72
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else253
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	stfd	f0, 16(r3)
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	reverse_flag60
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 16(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont254
sc_ble_else253:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont254:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else255
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	stfd	f0, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	reverse_flag60
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 16
	stw	r2, 8(r5)
	lfd	f0, 24(r3)
	stfd	f0, 0(r5)
	mr	r2, r5
	b	sc_ble_cont256
sc_ble_else255:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
sc_ble_cont256:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(lsc197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc197)
	lfd	f1, 0(r31)
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, sc_ble_else257
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos77
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	sc_ble_cont258
sc_ble_else257:
	lis	r31, lo16(lsc190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(lsc190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(lsc190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin75
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
sc_ble_cont258:
	lwz	r2, 32(r3)
	b	add_flag62
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
min_caml_fin: