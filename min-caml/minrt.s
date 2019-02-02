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
l5939:
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
	addi	r4, r4, 100000
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
min_caml_sin:
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
min_caml_cos:
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
min_caml_atan:
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
xor2643:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7329
	mr	r2, r5
	blr
beq_else7329:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7330
	li	r2, 1
	blr
beq_else7330:
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
	bne	cr7, beq_else7331
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	blr
beq_else7331:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7332
	lis	r31, lo16(l5592)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5592)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5592)
	lfd	f0, 0(r31)
	blr
ble_else7332:
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	blr
fneg_cond2648:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7333
	fneg	f0, f0
	blr
beq_else7333:
	blr
add_mod52651:
	add	r2, r2, r5
	cmpwi	cr7, r2, 5
	blt	cr7, bge_else7334
	subi	r2, r2, 5
	blr
bge_else7334:
	blr
vecset2654:
	stfd	f0, 0(r2)
	stfd	f1, 8(r2)
	stfd	f2, 16(r2)
	blr
vecfill2659:
	stfd	f0, 0(r2)
	stfd	f0, 8(r2)
	stfd	f0, 16(r2)
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
	lfd	f0, 8(r5)
	stfd	f0, 8(r2)
	lfd	f0, 16(r5)
	stfd	f0, 16(r2)
	blr
vecunit_sgn2672:
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7338
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	b	beq_cont7339
beq_else7338:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7340
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
	b	beq_cont7341
beq_else7340:
	lis	r31, lo16(l5592)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5592)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5592)
	lfd	f1, 0(r31)
	fdiv	f0, f1, f0
beq_cont7341:
beq_cont7339:
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
veciprod2675:
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
veciprod22678:
	lfd	f3, 0(r2)
	fmul	f0, f3, f0
	lfd	f3, 8(r2)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum2683:
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
vecadd2687:
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
vecscale2693:
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
vecaccumv2696:
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
	lfd	f0, 8(r2)
	blr
o_param_c2714:
	lwz	r2, 16(r2)
	lfd	f0, 16(r2)
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
	lfd	f0, 8(r2)
	blr
o_param_z2722:
	lwz	r2, 20(r2)
	lfd	f0, 16(r2)
	blr
o_diffuse2724:
	lwz	r2, 28(r2)
	lfd	f0, 0(r2)
	blr
o_hilight2726:
	lwz	r2, 28(r2)
	lfd	f0, 8(r2)
	blr
o_color_red2728:
	lwz	r2, 32(r2)
	lfd	f0, 0(r2)
	blr
o_color_green2730:
	lwz	r2, 32(r2)
	lfd	f0, 8(r2)
	blr
o_color_blue2732:
	lwz	r2, 32(r2)
	lfd	f0, 16(r2)
	blr
o_param_r12734:
	lwz	r2, 36(r2)
	lfd	f0, 0(r2)
	blr
o_param_r22736:
	lwz	r2, 36(r2)
	lfd	f0, 8(r2)
	blr
o_param_r32738:
	lwz	r2, 36(r2)
	lfd	f0, 16(r2)
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
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
	stfd	f2, 8(r2)
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
	stfd	f4, 16(r2)
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
	stfd	f4, 8(r2)
	lis	r2, lo16(min_caml_screenx_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screenx_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screenx_dir)
	lwz	r2, 0(r2)
	fneg	f4, f0
	stfd	f4, 16(r2)
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
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_screeny_dir)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_screeny_dir)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_screeny_dir)
	lwz	r2, 0(r2)
	fneg	f0, f3
	fmul	f0, f0, f2
	stfd	f0, 16(r2)
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
	lfd	f0, 16(r5)
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f1, 16(r5)
	fsub	f0, f0, f1
	stfd	f0, 16(r2)
	blr
read_light2775:
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
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
	bne	cr7, beq_else7351
	li	r2, 0
	blr
beq_else7351:
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
	stfd	f0, 8(r2)
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	fslwi	f0, f0, 8
	fin	f0
	stfd	f0, 16(r2)
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
	bgt	cr7, ble_else7352
	li	r5, 0
	b	ble_cont7353
ble_else7352:
	li	r5, 1
ble_cont7353:
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
	stfd	f0, 8(r2)
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
	bne	cr7, beq_else7354
	b	beq_cont7355
beq_else7354:
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
beq_cont7355:
	lwz	r5, 12(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7356
	li	r6, 1
	b	beq_cont7357
beq_else7356:
	lwz	r6, 28(r3)
beq_cont7357:
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
	stwx	r5, r9, r10
	cmpwi	cr7, r8, 3
	bne	cr7, beq_else7358
	lfd	f0, 0(r6)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7360
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7361
beq_else7360:
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
beq_cont7361:
	lwz	r2, 20(r3)
	stfd	f0, 0(r2)
	lfd	f0, 8(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7362
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7363
beq_else7362:
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
beq_cont7363:
	lwz	r2, 20(r3)
	stfd	f0, 8(r2)
	lfd	f0, 16(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7364
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7365
beq_else7364:
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
beq_cont7365:
	lwz	r2, 20(r3)
	stfd	f0, 16(r2)
	b	beq_cont7359
beq_else7358:
	cmpwi	cr7, r8, 2
	bne	cr7, beq_else7366
	lwz	r5, 28(r3)
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7368
	li	r5, 1
	b	beq_cont7369
beq_else7368:
	li	r5, 0
beq_cont7369:
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecunit_sgn2672
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	beq_cont7367
beq_else7366:
beq_cont7367:
beq_cont7359:
	lwz	r2, 16(r3)
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7370
	b	beq_cont7371
beq_else7370:
	lwz	r2, 20(r3)
	lwz	r5, 40(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	rotate_quadratic_matrix2777
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
beq_cont7371:
	li	r2, 1
	blr
read_object2782:
	cmpwi	cr7, r2, 60
	blt	cr7, bge_else7372
	blr
bge_else7372:
	stw	r2, 0(r3)
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	read_nth_object2780
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7374
	lis	r2, lo16(min_caml_n_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_n_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_n_objects)
	lwz	r2, 0(r2)
	lwz	r5, 0(r3)
	stw	r5, 0(r2)
	blr
beq_else7374:
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
	bne	cr7, beq_else7376
	addi	r2, r2, 1
	li	r5, -1
	b	min_caml_create_array
beq_else7376:
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
	stwx	r6, r2, r5
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
	bne	cr7, beq_else7377
	lwz	r2, 0(r3)
	addi	r2, r2, 1
	b	min_caml_create_array
beq_else7377:
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
	stwx	r6, r2, r5
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
	bne	cr7, beq_else7378
	blr
beq_else7378:
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
	slwi	r9, r6, 3
	lfdx	f3, r5, r9
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7381
	li	r2, 0
	blr
beq_else7381:
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
	slwi	r6, r5, 3
	lwz	r7, 40(r3)
	lfdx	f1, r7, r6
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7384
	li	r6, 0
	b	ble_cont7385
ble_else7384:
	li	r6, 1
ble_cont7385:
	mflr	r31
	mr	r5, r6
	stw	r31, 60(r3)
	addi	r3, r3, 64
	bl	xor2643
	subi	r3, r3, 64
	lwz	r31, 60(r3)
	mtlr	r31
	lwz	r5, 44(r3)
	slwi	r6, r5, 3
	lwz	r7, 52(r3)
	lfdx	f0, r7, r6
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
	slwi	r2, r2, 3
	lwz	r5, 40(r3)
	lfdx	f1, r5, r2
	fdiv	f0, f0, f1
	lwz	r2, 24(r3)
	slwi	r6, r2, 3
	lwz	r7, 52(r3)
	lfdx	f1, r7, r6
	slwi	r6, r2, 3
	lfdx	f2, r5, r6
	fmul	f2, f0, f2
	lfd	f3, 16(r3)
	fadd	f2, f2, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f2, f4
	bgt	cr7, ble_else7386
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont7387
ble_else7386:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont7387:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7388
	li	r2, 0
	blr
ble_else7388:
	lwz	r2, 8(r3)
	slwi	r6, r2, 3
	lfdx	f1, r7, r6
	slwi	r6, r2, 3
	lfdx	f2, r5, r6
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
	bgt	cr7, ble_else7389
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
	fneg	f2, f2
	b	ble_cont7390
ble_else7389:
	slwi	r2, r2, 3
	lfdx	f2, r5, r2
	fmul	f2, f0, f2
	fadd	f2, f2, f3
ble_cont7390:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7391
	li	r2, 0
	blr
ble_else7391:
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
	bne	cr7, beq_else7392
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
	bne	cr7, beq_else7393
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
	bne	cr7, beq_else7394
	li	r2, 0
	blr
beq_else7394:
	li	r2, 3
	blr
beq_else7393:
	li	r2, 2
	blr
beq_else7392:
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
	bgt	cr7, ble_else7395
	li	r2, 0
	blr
ble_else7395:
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
	bne	cr7, beq_else7398
	lfd	f0, 72(r3)
	blr
beq_else7398:
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
	bne	cr7, beq_else7400
	lfd	f0, 96(r3)
	blr
beq_else7400:
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
	lfd	f4, 8(r5)
	lfd	f5, 16(r5)
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
	bne	cr7, beq_else7401
	li	r2, 0
	blr
beq_else7401:
	lwz	r2, 28(r3)
	lfd	f1, 0(r2)
	lfd	f2, 8(r2)
	lfd	f3, 16(r2)
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
	bne	cr7, beq_else7402
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 48(r3)
	fsub	f0, f1, f0
	b	beq_cont7403
beq_else7402:
	lfd	f0, 48(r3)
beq_cont7403:
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
	bgt	cr7, ble_else7404
	li	r2, 0
	blr
ble_else7404:
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
	bne	cr7, beq_else7405
	lfd	f0, 56(r3)
	fneg	f0, f0
	b	beq_cont7406
beq_else7405:
	lfd	f0, 56(r3)
beq_cont7406:
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
	lwzx	r2, r7, r2
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
	lfd	f1, 8(r2)
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
	lfd	f1, 16(r2)
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
	bne	cr7, beq_else7408
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_rect2803
beq_else7408:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7409
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_surface2809
beq_else7409:
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 4(r3)
	lwz	r5, 0(r3)
	b	solver_second2828
solver_rect_fast2838:
	lfd	f3, 0(r6)
	fsub	f3, f3, f0
	lfd	f4, 8(r6)
	fmul	f3, f3, f4
	stfd	f0, 0(r3)
	stw	r6, 8(r3)
	stfd	f2, 16(r3)
	stw	r2, 24(r3)
	stfd	f1, 32(r3)
	stfd	f3, 40(r3)
	stw	r5, 48(r3)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_b2712
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 8(r2)
	lfd	f2, 40(r3)
	fmul	f1, f2, f1
	lfd	f3, 32(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7412
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7413
ble_else7412:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7413:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7414
	li	r5, 0
	b	ble_cont7415
ble_else7414:
	lwz	r5, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	o_param_c2714
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 16(r2)
	lfd	f2, 40(r3)
	fmul	f1, f2, f1
	lfd	f3, 16(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7416
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7417
ble_else7416:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7417:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7418
	li	r5, 0
	b	ble_cont7419
ble_else7418:
	lwz	r5, 8(r3)
	lfd	f0, 8(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7420
	li	r5, 0
	b	beq_cont7421
beq_else7420:
	li	r5, 1
beq_cont7421:
ble_cont7419:
ble_cont7415:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7422
	lwz	r5, 8(r3)
	lfd	f0, 16(r5)
	lfd	f1, 32(r3)
	fsub	f0, f0, f1
	lfd	f2, 24(r5)
	fmul	f0, f0, f2
	lwz	r6, 24(r3)
	stfd	f0, 56(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_a2710
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 0(r2)
	lfd	f2, 56(r3)
	fmul	f1, f2, f1
	lfd	f3, 0(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7424
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7425
ble_else7424:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7425:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7426
	li	r5, 0
	b	ble_cont7427
ble_else7426:
	lwz	r5, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 68(r3)
	addi	r3, r3, 72
	bl	o_param_c2714
	subi	r3, r3, 72
	lwz	r31, 68(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 16(r2)
	lfd	f2, 56(r3)
	fmul	f1, f2, f1
	lfd	f3, 16(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7428
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7429
ble_else7428:
	lfd	f1, 16(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7429:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7430
	li	r5, 0
	b	ble_cont7431
ble_else7430:
	lwz	r5, 8(r3)
	lfd	f0, 24(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7432
	li	r5, 0
	b	beq_cont7433
beq_else7432:
	li	r5, 1
beq_cont7433:
ble_cont7431:
ble_cont7427:
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7434
	lwz	r5, 8(r3)
	lfd	f0, 32(r5)
	lfd	f1, 16(r3)
	fsub	f0, f0, f1
	lfd	f1, 40(r5)
	fmul	f0, f0, f1
	lwz	r6, 24(r3)
	stfd	f0, 64(r3)
	mflr	r31
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_a2710
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 0(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 0(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7435
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7436
ble_else7435:
	lfd	f1, 0(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7436:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7437
	li	r2, 0
	b	ble_cont7438
ble_else7437:
	lwz	r5, 24(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_param_b2712
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 48(r3)
	lfd	f1, 8(r2)
	lfd	f2, 64(r3)
	fmul	f1, f2, f1
	lfd	f3, 32(r3)
	fadd	f1, f1, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7439
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
	fneg	f1, f1
	b	ble_cont7440
ble_else7439:
	lfd	f1, 8(r2)
	fmul	f1, f2, f1
	fadd	f1, f1, f3
ble_cont7440:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7441
	li	r2, 0
	b	ble_cont7442
ble_else7441:
	lwz	r2, 8(r3)
	lfd	f0, 40(r2)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7443
	li	r2, 0
	b	beq_cont7444
beq_else7443:
	li	r2, 1
beq_cont7444:
ble_cont7442:
ble_cont7438:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7445
	li	r2, 0
	blr
beq_else7445:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 3
	blr
beq_else7434:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
	li	r2, 2
	blr
beq_else7422:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	stfd	f2, 0(r2)
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
	bgt	cr7, ble_else7446
	li	r2, 0
	blr
ble_else7446:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
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
solver_second_fast2851:
	lfd	f3, 0(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bne	cr7, beq_else7447
	li	r2, 0
	blr
beq_else7447:
	lfd	f4, 8(r5)
	fmul	f4, f4, f0
	lfd	f5, 16(r5)
	fmul	f5, f5, f1
	fadd	f4, f4, f5
	lfd	f5, 24(r5)
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
	bne	cr7, beq_else7450
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 32(r3)
	fsub	f0, f1, f0
	b	beq_cont7451
beq_else7450:
	lfd	f0, 32(r3)
beq_cont7451:
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
	bgt	cr7, ble_else7452
	li	r2, 0
	blr
ble_else7452:
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
	bne	cr7, beq_else7453
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
	lfd	f1, 32(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont7454
beq_else7453:
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
	lfd	f1, 32(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont7454:
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
	lwzx	r7, r7, r8
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
	lfd	f1, 8(r2)
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
	lfd	f1, 16(r2)
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
	lwzx	r2, r2, r5
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
	bne	cr7, beq_else7455
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
beq_else7455:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7456
	lfd	f0, 24(r3)
	lfd	f1, 40(r3)
	lfd	f2, 56(r3)
	lwz	r2, 8(r3)
	lwz	r5, 64(r3)
	b	solver_surface_fast2845
beq_else7456:
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
	bgt	cr7, ble_else7457
	li	r2, 0
	blr
ble_else7457:
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f0, 0(r5)
	lfd	f1, 24(r6)
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
	bne	cr7, beq_else7458
	li	r2, 0
	blr
beq_else7458:
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
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7459
	li	r2, 0
	blr
ble_else7459:
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
	bne	cr7, beq_else7461
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
	lfd	f1, 32(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
	b	beq_cont7462
beq_else7461:
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
	lfd	f1, 32(r5)
	fmul	f0, f0, f1
	stfd	f0, 0(r2)
beq_cont7462:
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
	lwzx	r6, r6, r7
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
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
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
	lwzx	r2, r2, r5
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
	bne	cr7, beq_else7463
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
beq_else7463:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7464
	lfd	f0, 32(r3)
	lfd	f1, 24(r3)
	lfd	f2, 16(r3)
	lwz	r2, 0(r3)
	lwz	r5, 40(r3)
	lwz	r6, 12(r3)
	b	solver_surface_fast22861
beq_else7464:
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
	bne	cr7, beq_else7465
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 8(r2)
	b	beq_cont7466
beq_else7465:
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
	bgt	cr7, ble_else7467
	li	r6, 0
	b	ble_cont7468
ble_else7467:
	li	r6, 1
ble_cont7468:
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
	stfd	f0, 8(r2)
beq_cont7466:
	lfd	f0, 8(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7469
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 24(r2)
	b	beq_cont7470
beq_else7469:
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
	bgt	cr7, ble_else7471
	li	r6, 0
	b	ble_cont7472
ble_else7471:
	li	r6, 1
ble_cont7472:
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
	stfd	f0, 24(r2)
beq_cont7470:
	lfd	f0, 16(r5)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else7473
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	stfd	f0, 40(r2)
	b	beq_cont7474
beq_else7473:
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
	lfd	f1, 16(r5)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7475
	li	r6, 0
	b	ble_cont7476
ble_else7475:
	li	r6, 1
ble_cont7476:
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
	stfd	f0, 32(r2)
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 4(r3)
	lfd	f1, 16(r5)
	fdiv	f0, f0, f1
	stfd	f0, 40(r2)
beq_cont7474:
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
	lfd	f1, 8(r2)
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
	lfd	f1, 16(r2)
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
	bgt	cr7, ble_else7478
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lwz	r2, 8(r3)
	stfd	f0, 0(r2)
	b	ble_cont7479
ble_else7478:
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
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
	stfd	f0, 24(r2)
ble_cont7479:
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
	lfd	f1, 8(r5)
	lfd	f2, 16(r5)
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
	lfd	f1, 8(r2)
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
	lfd	f1, 16(r2)
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
	bne	cr7, beq_else7481
	lwz	r2, 8(r3)
	lfd	f0, 32(r3)
	stfd	f0, 8(r2)
	lfd	f0, 48(r3)
	stfd	f0, 16(r2)
	lfd	f0, 64(r3)
	stfd	f0, 24(r2)
	b	beq_cont7482
beq_else7481:
	lwz	r2, 4(r3)
	lfd	f0, 16(r2)
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
	lfd	f1, 8(r2)
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
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	lfd	f0, 16(r5)
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
	stfd	f0, 16(r2)
	lwz	r5, 4(r3)
	lfd	f0, 8(r5)
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
	stfd	f0, 24(r2)
beq_cont7482:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bne	cr7, beq_else7483
	b	beq_cont7484
beq_else7483:
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	fdiv	f0, f0, f1
	stfd	f0, 32(r2)
beq_cont7484:
	blr
iter_setup_dirvec_constants2887:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7485
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
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
	bne	cr7, beq_else7486
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
	stwx	r2, r7, r6
	b	beq_cont7487
beq_else7486:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7488
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
	stwx	r2, r7, r6
	b	beq_cont7489
beq_else7488:
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
	stwx	r2, r7, r6
beq_cont7489:
beq_cont7487:
	subi	r5, r5, 1
	lwz	r2, 8(r3)
	b	iter_setup_dirvec_constants2887
bge_else7485:
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
	blt	cr7, bge_else7491
	lis	r6, lo16(min_caml_objects)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_objects)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_objects)
	lwz	r6, 0(r6)
	slwi	r7, r5, 2
	lwzx	r6, r6, r7
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
	lfd	f0, 8(r5)
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
	stfd	f0, 8(r2)
	lwz	r5, 4(r3)
	lfd	f0, 16(r5)
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
	stfd	f0, 16(r2)
	lwz	r5, 16(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7493
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
	lfd	f1, 8(r5)
	lfd	f2, 16(r5)
	mflr	r31
	stw	r31, 52(r3)
	addi	r3, r3, 56
	bl	veciprod22678
	subi	r3, r3, 56
	lwz	r31, 52(r3)
	mtlr	r31
	lwz	r2, 12(r3)
	stfd	f0, 24(r2)
	b	beq_cont7494
beq_else7493:
	cmpwi	cr7, r5, 2
	bgt	cr7, ble_else7495
	b	ble_cont7496
ble_else7495:
	lfd	f0, 0(r2)
	lfd	f1, 8(r2)
	lfd	f2, 16(r2)
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
	bne	cr7, beq_else7497
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	b	beq_cont7498
beq_else7497:
beq_cont7498:
	lwz	r2, 12(r3)
	stfd	f0, 24(r2)
ble_cont7496:
beq_cont7494:
	lwz	r2, 0(r3)
	subi	r5, r2, 1
	lwz	r2, 4(r3)
	b	setup_startp_constants2892
bge_else7491:
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
	stfd	f2, 0(r3)
	stfd	f1, 8(r3)
	stw	r2, 16(r3)
	stfd	f0, 24(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_a2710
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	lfd	f2, 24(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7501
	fneg	f1, f2
	b	ble_cont7502
ble_else7501:
	fmr	f1, f2
ble_cont7502:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7503
	li	r2, 0
	b	ble_cont7504
ble_else7503:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_b2712
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	lfd	f2, 8(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7505
	fneg	f1, f2
	b	ble_cont7506
ble_else7505:
	fmr	f1, f2
ble_cont7506:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7507
	li	r2, 0
	b	ble_cont7508
ble_else7507:
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_param_c2714
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f1, 0(r31)
	lfd	f2, 0(r3)
	fcmpu	cr7, f2, f1
	bgt	cr7, ble_else7509
	fneg	f1, f2
	b	ble_cont7510
ble_else7509:
	fmr	f1, f2
ble_cont7510:
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7511
	li	r2, 0
	b	ble_cont7512
ble_else7511:
	li	r2, 1
ble_cont7512:
ble_cont7508:
ble_cont7504:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7513
	lwz	r2, 16(r3)
	mflr	r31
	stw	r31, 36(r3)
	addi	r3, r3, 40
	bl	o_isinvert2706
	subi	r3, r3, 40
	lwz	r31, 36(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7514
	li	r2, 1
	blr
beq_else7514:
	li	r2, 0
	blr
beq_else7513:
	lwz	r2, 16(r3)
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
	bgt	cr7, ble_else7516
	li	r5, 0
	b	ble_cont7517
ble_else7516:
	li	r5, 1
ble_cont7517:
	mflr	r31
	stw	r31, 44(r3)
	addi	r3, r3, 48
	bl	xor2643
	subi	r3, r3, 48
	lwz	r31, 44(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7518
	li	r2, 1
	blr
beq_else7518:
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
	bne	cr7, beq_else7520
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fsub	f0, f1, f0
	b	beq_cont7521
beq_else7520:
	lfd	f0, 8(r3)
beq_cont7521:
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
	bgt	cr7, ble_else7522
	li	r5, 0
	b	ble_cont7523
ble_else7522:
	li	r5, 1
ble_cont7523:
	mflr	r31
	stw	r31, 28(r3)
	addi	r3, r3, 32
	bl	xor2643
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7524
	li	r2, 1
	blr
beq_else7524:
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
	bne	cr7, beq_else7526
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_rect_outside2897
beq_else7526:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7527
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_plane_outside2902
beq_else7527:
	lfd	f0, 32(r3)
	lfd	f1, 40(r3)
	lfd	f2, 48(r3)
	lwz	r2, 16(r3)
	b	is_second_outside2907
check_all_inside2917:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7528
	li	r2, 1
	blr
beq_else7528:
	lis	r7, lo16(min_caml_objects)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_objects)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_objects)
	lwz	r7, 0(r7)
	slwi	r6, r6, 2
	lwzx	r6, r7, r6
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
	bne	cr7, beq_else7529
	lwz	r2, 28(r3)
	addi	r2, r2, 1
	lfd	f0, 16(r3)
	lfd	f1, 8(r3)
	lfd	f2, 0(r3)
	lwz	r5, 24(r3)
	b	check_all_inside2917
beq_else7529:
	li	r2, 0
	blr
shadow_check_and_group2923:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7530
	li	r2, 0
	blr
beq_else7530:
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
	bne	cr7, beq_else7531
	li	r2, 0
	b	beq_cont7532
beq_else7531:
	lis	r31, lo16(l5926)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5926)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5926)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7533
	li	r2, 0
	b	ble_cont7534
ble_else7533:
	li	r2, 1
ble_cont7534:
beq_cont7532:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7535
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 8(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	o_isinvert2706
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7536
	li	r2, 0
	blr
beq_else7536:
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else7535:
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
	lfd	f2, 8(r2)
	fmul	f2, f2, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f3, 8(r2)
	fadd	f2, f2, f3
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f3, 16(r2)
	fmul	f0, f3, f0
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	lfd	f3, 16(r2)
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
	bne	cr7, beq_else7537
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_and_group2923
beq_else7537:
	li	r2, 1
	blr
shadow_check_one_or_group2926:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7538
	li	r2, 0
	blr
beq_else7538:
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
	bne	cr7, beq_else7539
	lwz	r2, 4(r3)
	addi	r2, r2, 1
	lwz	r5, 0(r3)
	b	shadow_check_one_or_group2926
beq_else7539:
	li	r2, 1
	blr
shadow_check_one_or_matrix2929:
	slwi	r6, r2, 2
	lwzx	r6, r5, r6
	lwz	r7, 0(r6)
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7540
	li	r2, 0
	blr
beq_else7540:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r7, 99
	bne	cr7, beq_else7541
	li	r2, 1
	b	beq_cont7542
beq_else7541:
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
	bne	cr7, beq_else7543
	li	r2, 0
	b	beq_cont7544
beq_else7543:
	lis	r31, lo16(l5939)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5939)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5939)
	lfd	f0, 0(r31)
	lis	r2, lo16(min_caml_solver_dist)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_solver_dist)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_solver_dist)
	lwz	r2, 0(r2)
	lfd	f1, 0(r2)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7545
	li	r2, 0
	b	ble_cont7546
ble_else7545:
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
	bne	cr7, beq_else7547
	li	r2, 0
	b	beq_cont7548
beq_else7547:
	li	r2, 1
beq_cont7548:
ble_cont7546:
beq_cont7544:
beq_cont7542:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7549
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else7549:
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
	bne	cr7, beq_else7550
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	b	shadow_check_one_or_matrix2929
beq_else7550:
	li	r2, 1
	blr
solve_each_element2932:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7551
	blr
beq_else7551:
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
	bne	cr7, beq_else7553
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 12(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7554
	blr
beq_else7554:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
beq_else7553:
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
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7556
	b	ble_cont7557
ble_else7556:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7558
	b	ble_cont7559
ble_else7558:
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
	lfd	f2, 8(r5)
	fmul	f2, f2, f0
	lis	r6, lo16(min_caml_startp)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp)
	lwz	r6, 0(r6)
	lfd	f3, 8(r6)
	fadd	f2, f2, f3
	lfd	f3, 16(r5)
	fmul	f3, f3, f0
	lis	r6, lo16(min_caml_startp)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp)
	lwz	r6, 0(r6)
	lfd	f4, 16(r6)
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
	bne	cr7, beq_else7561
	b	beq_cont7562
beq_else7561:
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
beq_cont7562:
ble_cont7559:
ble_cont7557:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element2932
solve_one_or_network2936:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7563
	blr
beq_else7563:
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
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network2936
trace_or_matrix2940:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else7565
	blr
beq_else7565:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else7567
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
	b	beq_cont7568
beq_else7567:
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
	bne	cr7, beq_else7569
	b	beq_cont7570
beq_else7569:
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
	bgt	cr7, ble_else7571
	b	ble_cont7572
ble_else7571:
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
ble_cont7572:
beq_cont7570:
beq_cont7568:
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
	lis	r31, lo16(l5939)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5939)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5939)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7573
	li	r2, 0
	blr
ble_else7573:
	lis	r31, lo16(l5964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5964)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7574
	li	r2, 0
	blr
ble_else7574:
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
	lwzx	r6, r7, r6
	cmpwi	cr7, r6, -1
	bne	cr7, beq_else7575
	blr
beq_else7575:
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
	bne	cr7, beq_else7577
	lis	r2, lo16(min_caml_objects)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_objects)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_objects)
	lwz	r2, 0(r2)
	lwz	r5, 16(r3)
	slwi	r5, r5, 2
	lwzx	r2, r2, r5
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_isinvert2706
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7578
	blr
beq_else7578:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element_fast2946
beq_else7577:
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
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7580
	b	ble_cont7581
ble_else7580:
	lis	r5, lo16(min_caml_tmin)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_tmin)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_tmin)
	lwz	r5, 0(r5)
	lfd	f1, 0(r5)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7582
	b	ble_cont7583
ble_else7582:
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
	lfd	f2, 8(r5)
	fmul	f2, f2, f0
	lis	r6, lo16(min_caml_startp_fast)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_startp_fast)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_startp_fast)
	lwz	r6, 0(r6)
	lfd	f3, 8(r6)
	fadd	f2, f2, f3
	lfd	f3, 16(r5)
	fmul	f3, f3, f0
	lis	r5, lo16(min_caml_startp_fast)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_startp_fast)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_startp_fast)
	lwz	r5, 0(r5)
	lfd	f4, 16(r5)
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
	bne	cr7, beq_else7584
	b	beq_cont7585
beq_else7584:
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
beq_cont7585:
ble_cont7583:
ble_cont7581:
	lwz	r2, 8(r3)
	addi	r2, r2, 1
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_each_element_fast2946
solve_one_or_network_fast2950:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	cmpwi	cr7, r7, -1
	bne	cr7, beq_else7586
	blr
beq_else7586:
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
	lwz	r5, 4(r3)
	lwz	r6, 0(r3)
	b	solve_one_or_network_fast2950
trace_or_matrix_fast2954:
	slwi	r7, r2, 2
	lwzx	r7, r5, r7
	lwz	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else7588
	blr
beq_else7588:
	stw	r6, 0(r3)
	stw	r5, 4(r3)
	stw	r2, 8(r3)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else7590
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
	b	beq_cont7591
beq_else7590:
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
	bne	cr7, beq_else7592
	b	beq_cont7593
beq_else7592:
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
	bgt	cr7, ble_else7594
	b	ble_cont7595
ble_else7594:
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
ble_cont7595:
beq_cont7593:
beq_cont7591:
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
	lis	r31, lo16(l5939)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5939)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5939)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else7596
	li	r2, 0
	blr
ble_else7596:
	lis	r31, lo16(l5964)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5964)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5964)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7597
	li	r2, 0
	blr
ble_else7597:
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
	slwi	r5, r5, 3
	lwz	r7, 0(r3)
	lfdx	f0, r7, r5
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
	slwi	r2, r2, 3
	lwz	r5, 8(r3)
	stfdx	f0, r5, r2
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
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
	lfd	f1, 8(r2)
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
	lfd	f1, 16(r2)
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
	bne	cr7, beq_else7601
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
	stfd	f0, 8(r2)
	lis	r2, lo16(min_caml_nvector)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_nvector)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_nvector)
	lwz	r2, 0(r2)
	lfd	f0, 72(r3)
	stfd	f0, 16(r2)
	b	beq_cont7602
beq_else7601:
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
beq_cont7602:
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
	bne	cr7, beq_else7606
	lwz	r2, 4(r3)
	b	get_nvector_rect2960
beq_else7606:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7607
	lwz	r2, 0(r3)
	b	get_nvector_plane2962
beq_else7607:
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
	stfd	f0, 8(r2)
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
	stfd	f0, 16(r2)
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7608
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
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else7609
	li	r2, 0
	b	ble_cont7610
ble_else7609:
	li	r2, 1
ble_cont7610:
	lwz	r5, 0(r3)
	lfd	f0, 16(r5)
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
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f2, 0(r31)
	fsub	f0, f0, f1
	fcmpu	cr7, f2, f0
	bgt	cr7, ble_else7612
	li	r2, 0
	b	ble_cont7613
ble_else7612:
	li	r2, 1
ble_cont7613:
	lis	r5, lo16(min_caml_texture_color)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_texture_color)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_texture_color)
	lwz	r5, 0(r5)
	lwz	r6, 32(r3)
	cmpwi	cr7, r6, 0
	bne	cr7, beq_else7614
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7616
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f0, 0(r31)
	b	beq_cont7617
beq_else7616:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
beq_cont7617:
	b	beq_cont7615
beq_else7614:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7618
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	beq_cont7619
beq_else7618:
	lis	r31, lo16(l6013)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6013)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6013)
	lfd	f0, 0(r31)
beq_cont7619:
beq_cont7615:
	stfd	f0, 8(r5)
	blr
beq_else7608:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7621
	lwz	r2, 0(r3)
	lfd	f0, 8(r2)
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
	lfd	f1, 8(r2)
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
	stfd	f0, 8(r2)
	blr
beq_else7621:
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7623
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
	lfd	f1, 16(r2)
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
	lis	r31, lo16(l6018)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6018)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6018)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	fsqrt	f0, f0
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
	stfd	f1, 8(r2)
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
	stfd	f0, 16(r2)
	blr
beq_else7623:
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else7625
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
	lfd	f1, 16(r2)
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
	lis	r31, lo16(l6007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6007)
	lfd	f3, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f1, f4
	bgt	cr7, ble_else7626
	fneg	f4, f1
	b	ble_cont7627
ble_else7626:
	fmr	f4, f1
ble_cont7627:
	stfd	f2, 136(r3)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7628
	fdiv	f3, f0, f1
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f4, 0(r31)
	fcmpu	cr7, f3, f4
	bgt	cr7, ble_else7630
	fdiv	f0, f0, f1
	fneg	f0, f0
	b	ble_cont7631
ble_else7630:
	fdiv	f0, f0, f1
ble_cont7631:
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
	b	ble_cont7629
ble_else7628:
	lis	r31, lo16(l6008)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6008)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6008)
	lfd	f0, 0(r31)
ble_cont7629:
	floor	f1, f0
	fsub	f0, f0, f1
	lwz	r2, 0(r3)
	lfd	f1, 8(r2)
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
	lis	r31, lo16(l6007)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6007)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6007)
	lfd	f1, 0(r31)
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	lfd	f3, 136(r3)
	fcmpu	cr7, f3, f2
	bgt	cr7, ble_else7632
	fneg	f2, f3
	b	ble_cont7633
ble_else7632:
	fmr	f2, f3
ble_cont7633:
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7634
	fdiv	f1, f0, f3
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f2, 0(r31)
	fcmpu	cr7, f1, f2
	bgt	cr7, ble_else7636
	fdiv	f0, f0, f3
	fneg	f0, f0
	b	ble_cont7637
ble_else7636:
	fdiv	f0, f0, f3
ble_cont7637:
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
	b	ble_cont7635
ble_else7634:
	lis	r31, lo16(l6008)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6008)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6008)
	lfd	f0, 0(r31)
ble_cont7635:
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
	bgt	cr7, ble_else7638
	b	ble_cont7639
ble_else7638:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
ble_cont7639:
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
	stfd	f0, 16(r2)
	blr
beq_else7625:
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
	bgt	cr7, ble_else7642
	b	ble_cont7643
ble_else7642:
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
ble_cont7643:
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7644
	blr
ble_else7644:
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
	lfd	f1, 8(r5)
	fadd	f1, f1, f0
	stfd	f1, 8(r2)
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
	lfd	f1, 16(r5)
	fadd	f0, f1, f0
	stfd	f0, 16(r2)
	blr
trace_reflections2976:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7647
	lis	r6, lo16(min_caml_reflections)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_reflections)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_reflections)
	lwz	r6, 0(r6)
	slwi	r7, r2, 2
	lwzx	r6, r6, r7
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
	bne	cr7, beq_else7650
	b	beq_cont7651
beq_else7650:
	lis	r2, lo16(min_caml_intersected_object_id)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersected_object_id)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersected_object_id)
	lwz	r2, 0(r2)
	lwz	r2, 0(r2)
	li	r5, 4
	slw	r2, r2, r5
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
	bne	cr7, beq_else7652
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
	bne	cr7, beq_else7654
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
	b	beq_cont7655
beq_else7654:
beq_cont7655:
	b	beq_cont7653
beq_else7652:
beq_cont7653:
beq_cont7651:
	lwz	r2, 0(r3)
	subi	r2, r2, 1
	lfd	f0, 24(r3)
	lfd	f1, 8(r3)
	lwz	r5, 16(r3)
	b	trace_reflections2976
bge_else7647:
	blr
trace_ray2981:
	cmpwi	cr7, r2, 4
	bgt	cr7, ble_else7657
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
	bne	cr7, beq_else7659
	li	r2, -1
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 32(r3)
	stwx	r2, r7, r6
	cmpwi	cr7, r5, 0
	bne	cr7, beq_else7660
	blr
beq_else7660:
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
	bgt	cr7, ble_else7662
	blr
ble_else7662:
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
	lfd	f1, 8(r5)
	fadd	f1, f1, f0
	stfd	f1, 8(r2)
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
	lfd	f1, 16(r5)
	fadd	f0, f1, f0
	stfd	f0, 16(r2)
	blr
beq_else7659:
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
	li	r2, 4
	lwz	r5, 36(r3)
	slw	r2, r5, r2
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
	stwx	r2, r7, r6
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
	lwzx	r2, r2, r6
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
	lis	r31, lo16(l5776)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5776)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5776)
	lfd	f0, 0(r31)
	lwz	r5, 40(r3)
	stw	r2, 56(r3)
	stfd	f0, 64(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	o_diffuse2724
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lfd	f1, 64(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7666
	li	r2, 1
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	stwx	r2, r7, r6
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	p_energy2750
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
	lis	r7, lo16(min_caml_texture_color)
	srwi	r7, r7, 31
	addi	r7, r7, ha16(min_caml_texture_color)
	slwi	r7, r7, 16
	addi	r7, r7, lo16(min_caml_texture_color)
	lwz	r7, 0(r7)
	stw	r2, 72(r3)
	mflr	r31
	mr	r5, r7
	mr	r2, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	veccpy2664
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 24(r3)
	slwi	r5, r2, 2
	lwz	r6, 72(r3)
	lwzx	r5, r6, r5
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
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	vecscale2693
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r2, 8(r3)
	mflr	r31
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	p_nvectors2759
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
	lis	r6, lo16(min_caml_nvector)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_nvector)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_nvector)
	lwz	r6, 0(r6)
	mflr	r31
	mr	r5, r6
	stw	r31, 76(r3)
	addi	r3, r3, 80
	bl	veccpy2664
	subi	r3, r3, 80
	lwz	r31, 76(r3)
	mtlr	r31
	b	ble_cont7667
ble_else7666:
	li	r2, 0
	lwz	r5, 24(r3)
	slwi	r6, r5, 2
	lwz	r7, 56(r3)
	stwx	r2, r7, r6
ble_cont7667:
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
	stfd	f0, 80(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	veciprod2675
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lfd	f1, 80(r3)
	fmul	f0, f1, f0
	lis	r5, lo16(min_caml_nvector)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_nvector)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_nvector)
	lwz	r5, 0(r5)
	lwz	r2, 28(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	vecaccum2683
	subi	r3, r3, 96
	lwz	r31, 92(r3)
	mtlr	r31
	lwz	r2, 40(r3)
	mflr	r31
	stw	r31, 92(r3)
	addi	r3, r3, 96
	bl	o_hilight2726
	subi	r3, r3, 96
	lwz	r31, 92(r3)
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
	stfd	f0, 88(r3)
	mflr	r31
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	shadow_check_one_or_matrix2929
	subi	r3, r3, 104
	lwz	r31, 100(r3)
	mtlr	r31
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7669
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
	stw	r31, 100(r3)
	addi	r3, r3, 104
	bl	veciprod2675
	subi	r3, r3, 104
	lwz	r31, 100(r3)
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
	stfd	f0, 96(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	veciprod2675
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	fneg	f1, f0
	lfd	f0, 96(r3)
	lfd	f2, 88(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	add_light2972
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	b	beq_cont7670
beq_else7669:
beq_cont7670:
	lis	r2, lo16(min_caml_intersection_point)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_intersection_point)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_intersection_point)
	lwz	r2, 0(r2)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	setup_startp2895
	subi	r3, r3, 112
	lwz	r31, 108(r3)
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
	lfd	f1, 88(r3)
	lwz	r5, 28(r3)
	mflr	r31
	stw	r31, 108(r3)
	addi	r3, r3, 112
	bl	trace_reflections2976
	subi	r3, r3, 112
	lwz	r31, 108(r3)
	mtlr	r31
	lis	r31, lo16(l6055)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l6055)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l6055)
	lfd	f0, 0(r31)
	lfd	f1, 16(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7671
	blr
ble_else7671:
	lwz	r2, 24(r3)
	cmpwi	cr7, r2, 4
	blt	cr7, bge_else7673
	b	bge_cont7674
bge_else7673:
	addi	r5, r2, 1
	li	r6, -1
	slwi	r5, r5, 2
	lwz	r7, 32(r3)
	stwx	r6, r7, r5
bge_cont7674:
	lwz	r5, 44(r3)
	cmpwi	cr7, r5, 2
	bne	cr7, beq_else7675
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r5, 40(r3)
	stfd	f0, 104(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 116(r3)
	addi	r3, r3, 120
	bl	o_diffuse2724
	subi	r3, r3, 120
	lwz	r31, 116(r3)
	mtlr	r31
	lfd	f1, 104(r3)
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
beq_else7675:
	blr
ble_else7657:
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
	bne	cr7, beq_else7678
	blr
beq_else7678:
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
	bgt	cr7, ble_else7681
	lis	r31, lo16(l5590)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5590)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5590)
	lfd	f0, 0(r31)
	b	ble_cont7682
ble_else7681:
ble_cont7682:
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
beq_else7680:
	blr
iter_trace_diffuse_rays2990:
	cmpwi	cr7, r7, 0
	blt	cr7, bge_else7685
	slwi	r8, r7, 2
	lwzx	r8, r2, r8
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
	bgt	cr7, ble_else7686
	lwz	r2, 8(r3)
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
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
	b	ble_cont7687
ble_else7686:
	lwz	r2, 8(r3)
	addi	r5, r2, 1
	slwi	r5, r5, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
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
ble_cont7687:
	lwz	r2, 8(r3)
	subi	r7, r2, 2
	lwz	r2, 4(r3)
	lwz	r5, 12(r3)
	lwz	r6, 0(r3)
	b	iter_trace_diffuse_rays2990
bge_else7685:
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
	bne	cr7, beq_else7689
	b	beq_cont7690
beq_else7689:
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
beq_cont7690:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7691
	b	beq_cont7692
beq_else7691:
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
beq_cont7692:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7693
	b	beq_cont7694
beq_else7693:
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
beq_cont7694:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 3
	bne	cr7, beq_else7695
	b	beq_cont7696
beq_else7695:
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
beq_cont7696:
	lwz	r2, 8(r3)
	cmpwi	cr7, r2, 4
	bne	cr7, beq_else7697
	blr
beq_else7697:
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
	lwzx	r7, r8, r7
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
	lwzx	r6, r7, r6
	slwi	r7, r5, 2
	lwz	r8, 16(r3)
	lwzx	r7, r8, r7
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
	lwzx	r5, r6, r5
	lis	r6, lo16(min_caml_diffuse_ray)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_diffuse_ray)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_diffuse_ray)
	lwz	r6, 0(r6)
	b	vecaccumv2696
calc_diffuse_using_5points3006:
	slwi	r9, r2, 2
	lwzx	r5, r5, r9
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r7, r8, r7
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r6, r7, r6
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
	lwzx	r2, r5, r2
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
	lwzx	r2, r2, r6
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
	bgt	cr7, ble_else7699
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
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7700
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
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7701
	b	beq_cont7702
beq_else7701:
	lwz	r2, 0(r3)
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	calc_diffuse_using_1point3003
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
beq_cont7702:
	lwz	r2, 4(r3)
	addi	r5, r2, 1
	lwz	r2, 0(r3)
	b	do_without_neighbors3012
bge_else7700:
	blr
ble_else7699:
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
	bgt	cr7, ble_else7705
	li	r2, 0
	blr
ble_else7705:
	cmpwi	cr7, r5, 0
	bgt	cr7, ble_else7706
	li	r2, 0
	blr
ble_else7706:
	lis	r5, lo16(min_caml_image_size)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_image_size)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_image_size)
	lwz	r5, 0(r5)
	lwz	r5, 0(r5)
	addi	r6, r2, 1
	cmpw	cr7, r5, r6
	bgt	cr7, ble_else7707
	li	r2, 0
	blr
ble_else7707:
	cmpwi	cr7, r2, 0
	bgt	cr7, ble_else7708
	li	r2, 0
	blr
ble_else7708:
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
	lwzx	r2, r2, r5
	blr
neighbors_are_available3022:
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
	bl	get_surface_id3019
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
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7709
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
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7710
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
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7711
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
	bl	get_surface_id3019
	subi	r3, r3, 32
	lwz	r31, 28(r3)
	mtlr	r31
	lwz	r5, 20(r3)
	cmpw	cr7, r2, r5
	bne	cr7, beq_else7712
	li	r2, 1
	blr
beq_else7712:
	li	r2, 0
	blr
beq_else7711:
	li	r2, 0
	blr
beq_else7710:
	li	r2, 0
	blr
beq_else7709:
	li	r2, 0
	blr
try_exploit_neighbors3028:
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
	cmpwi	cr7, r9, 4
	bgt	cr7, ble_else7713
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
	blt	cr7, bge_else7714
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
	bne	cr7, beq_else7715
	lwz	r2, 24(r3)
	slwi	r2, r2, 2
	lwz	r5, 16(r3)
	lwzx	r2, r5, r2
	lwz	r5, 8(r3)
	b	do_without_neighbors3012
beq_else7715:
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
	lwzx	r2, r2, r5
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7716
	b	beq_cont7717
beq_else7716:
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
beq_cont7717:
	lwz	r2, 8(r3)
	addi	r9, r2, 1
	lwz	r2, 24(r3)
	lwz	r5, 0(r3)
	lwz	r6, 20(r3)
	lwz	r7, 16(r3)
	lwz	r8, 12(r3)
	b	try_exploit_neighbors3028
bge_else7714:
	blr
ble_else7713:
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
	bgt	cr7, ble_else7721
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7723
	b	bge_cont7724
bge_else7723:
	li	r2, 0
bge_cont7724:
	b	ble_cont7722
ble_else7721:
	li	r2, 255
ble_cont7722:
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
	lfd	f0, 8(r2)
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
	lfd	f0, 16(r2)
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
	bgt	cr7, ble_else7726
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
	blt	cr7, bge_else7727
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
	lwzx	r2, r2, r6
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else7728
	b	beq_cont7729
beq_else7728:
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
	lwzx	r5, r5, r6
	lwz	r6, 0(r3)
	slwi	r7, r6, 2
	lwz	r8, 12(r3)
	lwzx	r7, r8, r7
	slwi	r8, r6, 2
	lwzx	r2, r2, r8
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
	lwzx	r2, r2, r6
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
beq_cont7729:
	lwz	r2, 0(r3)
	addi	r5, r2, 1
	lwz	r2, 4(r3)
	b	pretrace_diffuse_rays3041
bge_else7727:
	blr
ble_else7726:
	blr
pretrace_pixels3044:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7732
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
	lfd	f4, 8(r8)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	stfd	f4, 8(r7)
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
	lfd	f4, 16(r8)
	fmul	f3, f3, f4
	fadd	f3, f3, f2
	stfd	f3, 16(r7)
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
	lwzx	r7, r8, r7
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
	lwzx	r5, r6, r5
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
	lwzx	r5, r6, r5
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
	lwzx	r5, r6, r5
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
bge_else7732:
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
	lfd	f2, 8(r5)
	fmul	f2, f0, f2
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f3, 8(r5)
	fadd	f2, f2, f3
	lis	r5, lo16(min_caml_screeny_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screeny_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screeny_dir)
	lwz	r5, 0(r5)
	lfd	f3, 16(r5)
	fmul	f0, f0, f3
	lis	r5, lo16(min_caml_screenz_dir)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_screenz_dir)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_screenz_dir)
	lwz	r5, 0(r5)
	lfd	f3, 16(r5)
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
	bgt	cr7, ble_else7734
	blr
ble_else7734:
	lis	r9, lo16(min_caml_rgb)
	srwi	r9, r9, 31
	addi	r9, r9, ha16(min_caml_rgb)
	slwi	r9, r9, 16
	addi	r9, r9, lo16(min_caml_rgb)
	lwz	r9, 0(r9)
	slwi	r10, r2, 2
	lwzx	r10, r7, r10
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
	bne	cr7, beq_else7736
	lwz	r2, 16(r3)
	slwi	r5, r2, 2
	lwz	r6, 4(r3)
	lwzx	r5, r6, r5
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
	b	beq_cont7737
beq_else7736:
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
beq_cont7737:
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
	bgt	cr7, ble_else7738
	blr
ble_else7738:
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
	bgt	cr7, ble_else7740
	b	ble_cont7741
ble_else7740:
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
ble_cont7741:
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
	blt	cr7, bge_else7742
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
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	init_line_elements3071
bge_else7742:
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
	blt	cr7, bge_else7743
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
	lwzx	r2, r2, r5
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
	lwzx	r5, r6, r5
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
	lwzx	r5, r6, r5
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
	lwzx	r5, r6, r5
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
	lwzx	r5, r6, r5
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
	lwzx	r2, r5, r2
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
bge_else7743:
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
	blt	cr7, bge_else7746
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
bge_else7746:
	blr
calc_dirvec_rows3094:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7748
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
bge_else7748:
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
	blt	cr7, bge_else7750
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
	stwx	r2, r7, r6
	subi	r5, r5, 1
	mr	r2, r7
	b	create_dirvec_elements3100
bge_else7750:
	blr
create_dirvecs3103:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7752
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
	stwx	r2, r7, r6
	lis	r2, lo16(min_caml_dirvecs)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_dirvecs)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_dirvecs)
	lwz	r2, 0(r2)
	slwi	r6, r5, 2
	lwzx	r2, r2, r6
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
bge_else7752:
	blr
init_dirvec_constants3105:
	cmpwi	cr7, r5, 0
	blt	cr7, bge_else7754
	slwi	r6, r5, 2
	lwzx	r6, r2, r6
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
bge_else7754:
	blr
init_vecset_constants3108:
	cmpwi	cr7, r2, 0
	blt	cr7, bge_else7756
	lis	r5, lo16(min_caml_dirvecs)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_dirvecs)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_dirvecs)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
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
bge_else7756:
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
	stwx	r5, r2, r6
	blr
setup_rect_reflection3119:
	li	r6, 4
	slw	r2, r2, r6
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
	lfd	f2, 8(r2)
	fneg	f2, f2
	lis	r2, lo16(min_caml_light)
	srwi	r2, r2, 31
	addi	r2, r2, ha16(min_caml_light)
	slwi	r2, r2, 16
	addi	r2, r2, lo16(min_caml_light)
	lwz	r2, 0(r2)
	lfd	f3, 16(r2)
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
	lfd	f2, 8(r8)
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
	lfd	f3, 16(r7)
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
	li	r6, 4
	slw	r2, r2, r6
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
	lfd	f2, 8(r2)
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
	lfd	f1, 16(r2)
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
	blt	cr7, bge_else7763
	lis	r5, lo16(min_caml_objects)
	srwi	r5, r5, 31
	addi	r5, r5, ha16(min_caml_objects)
	slwi	r5, r5, 16
	addi	r5, r5, lo16(min_caml_objects)
	lwz	r5, 0(r5)
	slwi	r6, r2, 2
	lwzx	r5, r5, r6
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
	bne	cr7, beq_else7764
	lis	r31, lo16(l5591)
	srwi	r31, r31, 31
	addi	r31, r31, ha16(l5591)
	slwi	r31, r31, 16
	addi	r31, r31, lo16(l5591)
	lfd	f0, 0(r31)
	lwz	r2, 4(r3)
	stfd	f0, 8(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_diffuse2724
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	lfd	f1, 8(r3)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else7765
	blr
ble_else7765:
	lwz	r2, 4(r3)
	mflr	r31
	stw	r31, 20(r3)
	addi	r3, r3, 24
	bl	o_form2702
	subi	r3, r3, 24
	lwz	r31, 20(r3)
	mtlr	r31
	cmpwi	cr7, r2, 1
	bne	cr7, beq_else7767
	lwz	r2, 0(r3)
	lwz	r5, 4(r3)
	b	setup_rect_reflection3119
beq_else7767:
	cmpwi	cr7, r2, 2
	bne	cr7, beq_else7768
	lwz	r2, 0(r3)
	lwz	r5, 4(r3)
	b	setup_surface_reflection3122
beq_else7768:
	blr
beq_else7764:
	blr
bge_else7763:
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
	li	r7, 2
	srw	r7, r2, r7
	stw	r7, 0(r6)
	lis	r6, lo16(min_caml_image_center)
	srwi	r6, r6, 31
	addi	r6, r6, ha16(min_caml_image_center)
	slwi	r6, r6, 16
	addi	r6, r6, lo16(min_caml_image_center)
	lwz	r6, 0(r6)
	li	r7, 2
	srw	r5, r5, r7
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