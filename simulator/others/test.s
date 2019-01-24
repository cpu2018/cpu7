        .data
pi:
        2000
        .globl x
k:
        sub     r4, r5, r6
x:
        cmpwi   r3, r4, lo16(pi)
        sub     r4, r5, r6
y:
        slw     r3, r5, r11
z:
        cmpw    cr2, r9, r12
        bne     cr7, x
q:
        blt     cr8, z
        beq     cr8, x
        bgt     cr8, x
        li      r4, -1
        subi    r4, r5, 1
        stw     r3, -8(r4)
        mr      r4, 5
        addi    r4, r5, 6
        add     r4, r5, r6
        sub     r4, r5, r5
        bl      x
        lwz     r3, -9(r4)
        mtlr    r4
        stwu    r3, -9(r4)
        bcl     r4, cr6, y
        lmw     r4, -9(r5)
        out     r3
        b       x
        srwi    r5, r4, 8
