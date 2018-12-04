        .globl start

start:
        li      r8, 8
        stw     r8, -8(r1)
        lwz     r7, -8(r1)
        addi    r7, r7, 48
        out     r7
