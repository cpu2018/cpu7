        .globl x
x:
        li      r2, 100
        li      r5, 100
        li      r6, 5
        lwzx    r6, r2, r5
        stw     r7, 100(r2)
        b       fin
fin:    
