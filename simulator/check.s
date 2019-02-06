        .data
l1:
        1016003125
l2:
        -1082130432
        .globl x
x:
        lis     r31, lo16(l1)
        srwi    r31, r31, 31
        addi    r31, r31, ha16(l1)
        slwi    r31, r31, 16
        addi    r31, r31, lo16(l1)
        lfd     f0, 0(r31)
        fneg    f1, f0
        fabs    f2, f1
        fmr     f6, f2
        fslwi   f0, 8
        li      r8, 99
        itof    f4, r8
