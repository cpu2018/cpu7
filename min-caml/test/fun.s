	.text
	.globl _min_caml_start
	.align 2
# ã“ã“ã‹ã‚‰ãƒ©ã‚¤ãƒ–ãƒ©ãƒª
	.global min_caml_print_int
min_caml_print_int:
	mflr	r31 # ãƒªãƒ³ã‚¯ãƒ¬ã‚¸ã‚¹ã‚¿ã®å€¤ã‚’r31ã«ä¸€æ™‚æ ¼ç´
	stw	r31, 4(r3) # æ ¼ç´ã•ã‚ŒãŸãƒªãƒ³ã‚¯ãƒ¬ã‚¸ã‚¹ã‚¿ã®å€¤ã‚’ã‚¹ã‚¿ãƒƒã‚¯ã«ç©ã‚€
	addi	r3, r3, 8 # ã‚¹ã‚¿ãƒƒã‚¯ãƒã‚¤ãƒ³ã‚¿ã‚’æ›´æ–°ã™ã‚‹
	stw	r2, 4(r3)
	addi	r3, e3, 8
	stw	r5, 4(r3)
	addi	r3, e3, 8
	stw	r6, 4(r3)
	addi	r3, e3, 8
	stw	r7, 4(r3)
	addi	r3, e3, 8
	stw	r8, 4(r3)
	addi	r3, e3, 8
	stw	r9, 4(r3)
	addi	r3, e3, 8
	stw	r10, 4(r3)
	addi	r3, e3, 8
	li	r10, 10 # r10ã«10ã‚’ã‚»ãƒƒãƒˆ
	bl	print_int
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
	addi	r6, r0, 27 # r6ã«28ã‚’ä»£å…¥
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³q2r7ã‚’å‘¼ã³å‡ºã™
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	ã‚µãƒ–ãƒ«ãƒ¼ãƒãƒ³q2r7ã‹ã‚‰æˆ»ã‚‹
	addi	r7, r7, 48 # asciiã«å¤‰æ›
	out	r7 # 1æ¡è»¢é€ r7 ã«å…¥ã£ã¦ã‚‹ã®ã¯ä½™ã‚Š
	cmpw	cr7, r0, r2
	bgt	cr7, print_int # r2(å•†)ãŒ0ã‚ˆã‚Šå¤§ãã‘ã‚Œã°ãƒ«ãƒ¼ãƒ—ç¶šè¡Œ
	blr # å•†ãŒ0ã«ãªã‚Œã°ã€çµ‚ã‚ã‚Šã€‚
q2r7: # å‰²ã‚Šç®—ã€‚å•†ã¯r2ã€ä½™ã‚Šã¯r7ã¸
	slw	r8, r10, r6
	sub	r9, r5, r8
	cmpwi	cr7, r9, 0
	blt	through # è² ã®æ•°ãªã‚‰ã°ã€ä½•ã‚‚ã—ãªã„ãƒ«ãƒ¼ãƒˆã¸,
	mv	r5, r9 # å¼•ãå ´åˆ:æ¬¡ã«å‰²ã‚‰ã‚Œã‚‹å€¤ã‚’æ›´æ–°
	add	r2, r2, r6 # å•†ã‚’æ›´æ–°(r6ã¯å•†ã«è¶³ã™ã¹ããã®æ¡ã§ã®æ•°ã§ã‚‚ã‚ã‚‹)
	cmpw	cr7, r0, r6
	subi	r6, r6, 1 # æ³¨ç›®ã™ã‚‹æ¡ã‚’ä¸€ã¤å¾Œã‚ã«ä¸‹ã’ã‚‹(r6ã‚’ãƒ‡ã‚¯ãƒªãƒ¡ãƒ³ãƒˆ)
	bgt	cr7, q2r7
	blr
through: #å¼•ã‹ãªã„å ´åˆ:æ¬¡ã«å‰²ã‚‰ã‚Œã‚‹å€¤ã¯ãã®ã¾ã¾ã€å•†ã«ã‚‚ä½•ã‚‚ãŸã•ãªã„
	cmpw	cr7, r0, r6
	subi	r6, r6, 1
	bgt	cr7, q2r7
	blr
# ã“ã“ã¾ã§ãƒ©ã‚¤ãƒ–ãƒ©ãƒª
Fun.22.124:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.21.122:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.22.124)
	addi	r7, r7, lo16(Fun.22.124)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.20.120:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.21.122)
	addi	r6, r6, lo16(Fun.21.122)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.19.117:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.18.114:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.19.117)
	addi	r7, r7, lo16(Fun.19.117)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.17.112:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.18.114)
	addi	r6, r6, lo16(Fun.18.114)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.16.108:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.15.106:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.16.108)
	addi	r7, r7, lo16(Fun.16.108)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.14.104:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.15.106)
	addi	r6, r6, lo16(Fun.15.106)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
k.57:
	li	r5, 2
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	Fun.14.104
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
l.9.10.99:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
l.9.97:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(l.9.10.99)
	addi	r7, r7, lo16(l.9.10.99)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
l.59:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(l.9.97)
	addi	r6, r6, lo16(l.9.97)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.13.95:
	addi	r2, r2, 1
	blr
Fun.12.91:
	lwz	r5, 4(r30)
	add	r2, r5, r2
	blr
Fun.11.89:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.12.91)
	addi	r6, r6, lo16(Fun.12.91)
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
	bl	Fun.20.120
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
	bl	l.59
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 2
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.13.95
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
	bl	Fun.11.89
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
	bl	Fun.20.120
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
	bl	Fun.17.112
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
	bl	Fun.14.104
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
	bl	k.57
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
	bl	Fun.20.120
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
