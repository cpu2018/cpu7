	.text
	.globl _min_caml_start
	.align 2
# ------------------------------ ã“ã“ã‹ã‚‰ãƒ©ã‚¤ãƒ–ãƒ©ãƒª ------------------------------
min_caml_print_int:
	mflr	r31 # ãƒªãƒ³ã‚¯ãƒ¬ã‚¸ã‚¹ã‚¿ã®å€¤ã‚’r31ã«ä¸€æ™‚æ ¼ç´
	stw	r31, 4(r3) # æ ¼ç´ã•ã‚ŒãŸãƒªãƒ³ã‚¯ãƒ¬ã‚¸ã‚¹ã‚¿ã®å€¤ã‚’ã‚¹ã‚¿ãƒƒã‚¯ã«ç©ã‚€
	addi	r3, r3, 8 # ã‚¹ã‚¿ãƒƒã‚¯ãƒã‚¤ãƒ³ã‚¿ã‚’æ›´æ–°ã™ã‚‹
	stw	r2, 4(r3)
	addi	r3, r3, 8
	stw	r5, 4(r3)
	addi	r3, r3, 8
	stw	r6, 4(r3)
	addi	r3, r3, 8
	stw	r7, 4(r3)
	addi	r3, r3, 8
	stw	r8, 4(r3)
	addi	r3, r3, 8
	stw	r9, 4(r3)
	addi	r3, r3, 8
	stw	r10, 4(r3)
	addi	r3, r3, 8
	stw	r11, 4(r3)
	addi	r3, r3, 8
	stw	r12, 4(r3)
	addi	r3, r3, 8
	li	r10, 10 # r10ã«10ã‚’ã‚»ãƒƒãƒˆ
	li	r6, 4
	bl	print_int
	subi	r3, r3, 8
	lwz	r12, 4(r3)
	subi	r3, r3, 8
	lwz	r11, 4(r3)
	subi	r3, r3, 8
	lwz	r10, 4(r3)
	subi	r3, r3, 8
	lwz	r9, 4(r3)
	subi	r3, r3, 8
	lwz	r8, 4(r3)
	subi	r3, r3, 8
	lwz	r7, 4(r3)
	subi	r3, r3, 8
	lwz	r6, 4(r3)
	subi	r3, r3, 8
	lwz	r5, 4(r3)
	subi	r3, r3, 8
	lwz	r2, 4(r3)
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
print_int:
	mr	r5, r2 # è»¢é€ã™ã‚‹æ•°ã®å…¨ä½“ã‚’r5ã«å…¥ã‚Œã‚‹:æ¬¡ã®å‰²ã‚‰ã‚Œã‚‹æ•°ã‚’ã‚»ãƒƒãƒˆ
	li	r2, 0 # å•†ã‚’ãƒªã‚»ãƒƒãƒˆ
	add	r9, r9, r6 # æ³¨ç›®ã™ã‚‹æœ€å¤§æ¡ã‚’ã‚»ãƒƒãƒˆ
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³q2r7ã‚’å‘¼ã³å‡ºã™
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³q2r7ã‹ã‚‰æˆ»ã‚‹
	addi	r11, r7, 48 # asciiã«å¤‰æ› r11ã¯2ç•ªç›®ã«è¡¨ç¤ºã™ã‚‹
	cmpwi	cr7, r6, 4 # ã‚‚ã—r6 = 4ãªã‚‰ã°ã€r6 - 3ã‚’ã—ã¦ç¶™ç¶š
	bne	r61or0
	addi	r12, r7, 48 # asciiã«å¤‰æ› r12ã¯3ç•ªç›®ã«è¡¨ç¤ºã™ã‚‹å€¤
	subi	r6, r6, 3
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³çš„ã«print_intã‚’å‘¼ã³å‡ºã™ ã“ã“ã§å‘¼ã³å‡ºã™print_intã¯r6eq1or0ã«å…¥ã‚‹
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³çš„ã«print_intã‹ã‚‰æˆ»ã‚‹
	out	r12
	blr
r61or0:
	cmpwi	cr7, r6, 1
	bne	r6eq0
	subi	r6, r6, 1
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³çš„ã«print_intã‚’å‘¼ã³å‡ºã™ ã“ã“å‘¼ã³å‡ºã™print_intã¯r6eq0ã¾ã§ã„ã
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³çš„ã«print_intã‹ã‚‰æˆ»ã‚‹
	addi	r12, r7, 48 # 
	out	r11
	blr
r6eq0:
	addi	r7, r7, 48
	out	r7
	blr
q2r7: # å‰²ã‚Šç®—ã€‚å•†ã¯r2ã€ä½™ã‚Šã¯r7ã¸
	slw	r8, r10, r9 # å¼•ã„ã¦ã¿ã‚‹å€¤ã‚’ã‚»ãƒƒãƒˆ
	sub	r8, r5, r8 # ã¨ã‚Šã‚ãˆãšå¼•ã„ã¦ã¿ã‚‹
	cmpwi	cr7, r8, 0 # å¼•ã‹ã‚ŒãŸå€¤ãŒ0æœªæº€ã‹ã©ã†ã‹ã‚’åˆ¤å®šã™ã‚‹
	blt	idle # è² ã®æ•°ãªã‚‰ã°ã€ä½•ã‚‚ã—ãªã„(idle)ã¸,
	mr	r5, r8 # å¼•ãå ´åˆæ¬¡ã«å‰²ã‚‰ã‚Œã‚‹å€¤ã‚’æ›´æ–°
	li	r8, 1 # è¶³ã™å€¤ã‚’ä½œæˆ
	slw	r8, r8, r9 # 1ã‚’æ³¨ç›®ã™ã‚‹æ¡ã¾ã§ã‚·ãƒ•ãƒˆ
	add	r2, r2, r8 # å•†ã‚’æ›´æ–°
	cmpwi	cr7, r9, 0 # æ³¨ç›®ã™ã‚‹æ¡ãŒ0ã¾ã§è¡Œã£ãŸã‹ã©ã†ã‹
	bgt	cr7, r9eq0 # ã¾ã 0ã«ãªã£ã¦ã„ãªã‹ã£ãŸã‚‰ã¾ã å‰²ã‚Œã‚‹ã®ã§ã€q2r7ã«ã‚‚ã©ã‚‹
	subi	r9, r9, 1 # 0ã¾ã§è¡Œã£ã¦ãªã„ãªã‚‰ã°ã€ãƒ‡ã‚¯ãƒªãƒ¡ãƒ³ãƒˆ
	b	q2r7
idle: #å¼•ã‹ãªã„å ´åˆ:æ¬¡ã«å‰²ã‚‰ã‚Œã‚‹å€¤ã¯ãã®ã¾ã¾ã€å•†ã«ã‚‚ä½•ã‚‚ãŸã•ãªã„
	cmpwi	cr7, r9, 0
	bgt	cr7, r9eq0 # 
	subi	r9, r9, 1
	b	q2r7
r9eq0:
	blr

# ------------------------------ ã“ã“ã¾ã§ãƒ©ã‚¤ãƒ–ãƒ©ãƒª ------------------------------
Fun.22.158:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.21.156:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.22.158)
	addi	r7, r7, lo16(Fun.22.158)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.20.154:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.21.156)
	addi	r6, r6, lo16(Fun.21.156)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.19.151:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.18.148:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.19.151)
	addi	r7, r7, lo16(Fun.19.151)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.17.146:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.18.148)
	addi	r6, r6, lo16(Fun.18.148)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
k.86:
	li	r5, 2
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_j
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	lwz	r2, 0(r3)
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 4(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 8 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
l.10.11.140:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
l.10.138:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(l.10.11.140)
	addi	r7, r7, lo16(l.10.11.140)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
l.88:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(l.10.138)
	addi	r6, r6, lo16(l.10.138)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
gg.91:
	li	r5, 3
	mr	r30, r2
	mr	r2, r5
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
ff.93:
	li	r5, 2
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	mr	r30, r2
	mr	r2, r5
	stw	r31, 4(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 8 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	b	gg.91
Fun.16.135:
	lwz	r5, 4(r30)
	add	r2, r5, r2
	blr
Fun.15.133:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.16.135)
	addi	r6, r6, lo16(Fun.16.135)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.14.129:
	addi	r2, r2, 1
	blr
Fun.13.125:
	lwz	r5, 4(r30)
	add	r2, r5, r2
	blr
Fun.12.123:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.13.125)
	addi	r6, r6, lo16(Fun.13.125)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
#	main program starts
	li	r2, 1
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	Fun.20.154
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 4(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 8 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 1
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	l.88
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.15.133)
	addi	r6, r6, lo16(Fun.15.133)
	stw	r6, 0(r5)
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	ff.93
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.14.129
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.12.123
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.20.154
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.17.146
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 3
	lwz	r30, 0(r3)
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_j
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 1
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	k.86
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.20.154
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 1
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	lwz	r30, 4(r3)
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤òr31¤Ë°ì»ş³ÊÇ¼
	stw	r31, 12(r3) # ³ÊÇ¼¤µ¤ì¤¿¥ê¥ó¥¯¥ì¥¸¥¹¥¿¤ÎÃÍ¤ò¥¹¥¿¥Ã¥¯¤ËÀÑ¤à
	addi	r3, r3, 16 # ¥¹¥¿¥Ã¥¯¥İ¥¤¥ó¥¿¤ò¹¹¿·
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
#	main program ends
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
