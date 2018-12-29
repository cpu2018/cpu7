	.data
	.literal8
l.5:	 # 0.500000
	1056964608
	.text
	.globl _min_caml_start
	.align 2
min_caml_fhalf.2:
	lis	r31, ha16(l.5)
	addi	r31, r31, lo16(l.5)
	lfd	f1, 0(r31)
	fmul	f0, f0, f1
	blr
_min_caml_start:
	blr
