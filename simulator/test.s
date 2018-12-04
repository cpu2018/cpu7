<<<<<<< HEAD
	.text
	.align 2
	.globl _min_caml_start
int:
	li	r10, 10
	blr
_min_caml_start:
	bl	int
	li	r6, 10
	li	r10, 9
=======
        .globl start

start:
        li      r8, 8
        stw     r8, -8(r1)
        lwz     r7, -8(r1)
        addi    r7, r7, 48
        out     r7
>>>>>>> 54a14d494ddf142336d122384980c507263ac833
