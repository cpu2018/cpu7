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
	1041385765
l91:
	1045220557
l90:
	1051372202
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