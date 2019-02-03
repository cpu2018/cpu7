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
l101:
	1061752795
l100:
	1065353216
l99:
	1070141403
l98:
	1075576832
l97:
	1054867456
l96:
	0
l95:
	1031137221
l94:
	1035458158
l93:
	1038323256
l92:
	-1106097883
l91:
	1045220557
l90:
	1051372202
	.globl _min_caml_start
_min_caml_start:
	addi	r4, r4, 100000
	lis	r31, lo16(l100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l100)
	lfd	f0, 0(r31)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_atan40
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
kernel_atan38:
	fmul	f1, f0, f0
	fmul	f2, f0, f1
	fmul	f3, f2, f1
	fmul	f4, f3, f1
	fmul	f5, f4, f1
	fmul	f6, f5, f1
	fmul	f1, f6, f1
	lis	r31, lo16(l90)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l90)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l90)
	lfd	f7, 0(r31)
	fmul	f2, f7, f2
	fsub	f0, f0, f2
	lis	r31, lo16(l91)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l91)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l91)
	lfd	f2, 0(r31)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lis	r31, lo16(l92)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l92)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l92)
	lfd	f2, 0(r31)
	fmul	f2, f2, f4
	fsub	f0, f0, f2
	lis	r31, lo16(l93)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l93)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l93)
	lfd	f2, 0(r31)
	fmul	f2, f2, f5
	fadd	f0, f0, f2
	lis	r31, lo16(l94)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l94)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l94)
	lfd	f2, 0(r31)
	fmul	f2, f2, f6
	fsub	f0, f0, f2
	lis	r31, lo16(l95)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l95)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l95)
	lfd	f2, 0(r31)
	fmul	f1, f2, f1
	fadd	f0, f0, f1
	blr
min_caml_atan40:
	lis	r31, lo16(l96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l96)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else107
	fneg	f1, f0
	b	ble_cont108
ble_else107:
	fmr	f1, f0
ble_cont108:
	lis	r31, lo16(l97)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l97)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l97)
	lfd	f2, 0(r31)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else109
	lis	r31, lo16(l98)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l98)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l98)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else110
	lis	r31, lo16(l101)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l101)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l101)
	lfd	f2, 0(r31)
	lis	r31, lo16(l100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l100)
	lfd	f3, 0(r31)
	fsub	f3, f1, f3
	lis	r31, lo16(l100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l100)
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
	lis	r31, lo16(l96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l96)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else111
	blr
ble_else111:
	fneg	f0, f0
	blr
ble_else110:
	lis	r31, lo16(l99)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l99)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l99)
	lfd	f2, 0(r31)
	lis	r31, lo16(l100)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l100)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l100)
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
	lis	r31, lo16(l96)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l96)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l96)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else112
	blr
ble_else112:
	fneg	f0, f0
	blr
ble_else109:
	b	kernel_atan38
min_caml_fin: