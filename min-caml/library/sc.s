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
l197:
	1061752795
l190:
	1070141403
l183:
	0
l182:
	1078530011
l181:
	1144258560
l180:
	1103101952
l179:
	1065353216
l178:
	1167949824
l177:
	1123024896
l176:
	1077936128
l172:
	1073741824
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 100000
	lis	r31, lo16(l179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l179)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_sin79
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	lis	r31, lo16(l179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l179)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_cos81
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	min_caml_fin
reverse_flag60:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else234
	blr
beq_else234:
	li	r2, 0
	blr
add_flag62:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else235
	fneg	f0, f0
	blr
beq_else235:
	blr
while165:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else236
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
	lfd	f0, 0(r31)
	fmul	f0, f1, f0
	blr
ble_else236:
	fmr	f0, f1
	blr
while268:
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else237
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else238
	fsub	f0, f0, f1
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
ble_else238:
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while268
ble_else237:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi72:
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
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
	lis	r31, lo16(l176)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l176)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l176)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(l177)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l177)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l177)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, lo16(l178)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l178)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l178)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos77:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, lo16(l179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l179)
	lfd	f3, 0(r31)
	lis	r31, lo16(l172)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l172)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l172)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, lo16(l180)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l180)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l180)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, lo16(l181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l181)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin79:
	lis	r31, lo16(l182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l182)
	lfd	f1, 0(r31)
	lis	r31, lo16(l183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else239
	li	r2, 0
	b	ble_cont240
ble_else239:
	li	r2, 1
ble_cont240:
	lis	r31, lo16(l183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else241
	fneg	f0, f0
	b	ble_cont242
ble_else241:
ble_cont242:
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
	bgt	cr7, ble_else244
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
	b	ble_cont245
ble_else244:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont245:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else246
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	ble_cont247
ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l197)
	lfd	f1, 0(r31)
	stw	r5, 24(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else248
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos77
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont249
ble_else248:
	lis	r31, lo16(l190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin75
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont249:
	lwz	r2, 24(r3)
	b	add_flag62
min_caml_cos81:
	lis	r31, lo16(l182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l182)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, lo16(l183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l183)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else250
	fneg	f0, f0
	b	ble_cont251
ble_else250:
ble_cont251:
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
	bgt	cr7, ble_else253
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
	b	ble_cont254
ble_else253:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont254:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l190)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else255
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
	b	ble_cont256
ble_else255:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont256:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l197)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l197)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l197)
	lfd	f1, 0(r31)
	stw	r5, 32(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else257
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos77
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont258
ble_else257:
	lis	r31, lo16(l190)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l190)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l190)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin75
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont258:
	lwz	r2, 32(r3)
	b	add_flag62
min_caml_fin: