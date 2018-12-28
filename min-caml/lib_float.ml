let print_external_methods oc = Printf.fprintf oc
"min_caml_fabs:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fabs
	blr
ble_else_fabs:
	fneg	f0, f0
	blr
min_caml_fsqr:
	fmul	f0, f0, f0
	blr
min_caml_fneg:
	fneg	f0, f0
	blr
min_Caml_sqrt:
	fsqrt	f0, f0
	blr
min_caml_floor:
	floor	f0, f0
	blr
min_caml_fhalf:
	lis	r31, ha16(lhalf)
	addi	r31, r31, lo16(lhalf)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
min_caml_fisneg:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
min_caml_fispos:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
min_caml_fiszero:
	lis	r31, ha16(lzero)
	addi	r31, r31, lo16(lzero)
	lfd	f1, 0(r31)
	fcmpu	cr7, f0, f1
	bne	cr7, beq_else_fis_fless
	li	r2, 1
	blr
min_caml_fless:
	fcmpu	cr7, f1, f0
	bgt	cr7, ble_else_fis_fless
	li	r2, 0
	blr
ble_else_fis_fless:
	li	r2, 1
	blr
"
