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
l199:
	1061752795
l192:
	1070141403
l185:
	0
l184:
	1078530011
l183:
	1144258560
l182:
	1103101952
l181:
	1065353216
l180:
	1167949824
l179:
	1123024896
l178:
	1077936128
l174:
	1073741824
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 100000
	lis	r31, lo16(l181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l181)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_sin80
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
	lis	r31, lo16(l181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l181)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_cos82
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
reverse_flag61:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else236
	blr
beq_else236:
	li	r2, 0
	blr
add_flag63:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else237
	fneg	f0, f0
	blr
beq_else237:
	blr
while166:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else238
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
	lfd	f2, 0(r31)
	fmul	f1, f1, f2
	b	while166
ble_else238:
	fmr	f0, f1
	blr
while269:
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
	lfd	f3, 0(r31)
	fmul	f3, f3, f2
	fcmpu	cr7, f3, f0
	bgt	cr7, ble_else239
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else240
	fsub	f0, f0, f1
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while269
ble_else240:
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	b	while269
ble_else239:
	mr	r2, r4
	addi	r4, r4, 16
	stfd	f1, 8(r2)
	stfd	f0, 0(r2)
	blr
reduction_2pi73:
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
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
	lis	r31, lo16(l178)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l178)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l178)
	lfd	f4, 0(r31)
	fdiv	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(l179)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l179)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l179)
	lfd	f2, 0(r31)
	fdiv	f2, f3, f2
	fadd	f0, f0, f2
	lis	r31, lo16(l180)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l180)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l180)
	lfd	f2, 0(r31)
	fdiv	f1, f1, f2
	fsub	f0, f0, f1
	blr
kernel_cos78:
	fmul	f0, f0, f0
	fmul	f1, f0, f0
	fmul	f2, f1, f0
	lis	r31, lo16(l181)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l181)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l181)
	lfd	f3, 0(r31)
	lis	r31, lo16(l174)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l174)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l174)
	lfd	f4, 0(r31)
	fdiv	f0, f0, f4
	fsub	f0, f3, f0
	lis	r31, lo16(l182)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l182)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l182)
	lfd	f3, 0(r31)
	fdiv	f1, f1, f3
	fadd	f0, f0, f1
	lis	r31, lo16(l183)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l183)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l183)
	lfd	f1, 0(r31)
	fdiv	f1, f2, f1
	fsub	f0, f0, f1
	blr
min_caml_sin80:
	lis	r31, lo16(l184)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l184)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l184)
	lfd	f1, 0(r31)
	lis	r31, lo16(l185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else241
	li	r2, 0
	b	ble_cont242
ble_else241:
	li	r2, 1
ble_cont242:
	lis	r31, lo16(l185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else243
	fneg	f0, f0
	b	ble_cont244
ble_else243:
ble_cont244:
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
	bgt	cr7, ble_else246
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
	b	ble_cont247
ble_else246:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont247:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l192)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else248
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
	b	ble_cont249
ble_else248:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont249:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l199)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l199)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l199)
	lfd	f1, 0(r31)
	stw	r5, 24(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else250
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_sin76
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	b	ble_cont251
ble_else250:
	lis	r31, lo16(l192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l192)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	kernel_cos78
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
ble_cont251:
	lwz	r2, 24(r3)
	b	add_flag63
min_caml_cos82:
	lis	r31, lo16(l184)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l184)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l184)
	lfd	f1, 0(r31)
	li	r2, 1
	lis	r31, lo16(l185)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l185)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l185)
	lfd	f2, 0(r31)
	fcmpu	cr7, f0, f2
	bgt	cr7, ble_else252
	fneg	f0, f0
	b	ble_cont253
ble_else252:
ble_cont253:
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
	bgt	cr7, ble_else255
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
	b	ble_cont256
ble_else255:
	mr	r2, r4
	addi	r4, r4, 16
	lwz	r5, 0(r3)
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont256:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l192)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else257
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
	b	ble_cont258
ble_else257:
	mr	r2, r4
	addi	r4, r4, 16
	stw	r5, 8(r2)
	stfd	f0, 0(r2)
ble_cont258:
	lwz	r5, 8(r2)
	lfd	f0, 0(r2)
	lis	r31, lo16(l199)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l199)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l199)
	lfd	f1, 0(r31)
	stw	r5, 32(r3)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else259
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_cos78
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	b	ble_cont260
ble_else259:
	lis	r31, lo16(l192)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l192)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l192)
	lfd	f1, 0(r31)
	fsub	f0, f1, f0
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	kernel_sin76
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
ble_cont260:
	lwz	r2, 32(r3)
	b	add_flag63
min_caml_fin: