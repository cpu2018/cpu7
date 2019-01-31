	.text
	.globl _min_caml_start
	.align 2
# ------------------------------ ここからライブラリ ------------------------------
min_caml_print_int:
	mflr	r31 # リンクレジスタの値をr31に一時格納
	stw	r31, 4(r3) # 格納されたリンクレジスタの値をスタックに積む
	addi	r3, r3, 8 # スタックポインタを更新する
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
	li	r10, 10 # r10に10をセット
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
	mr	r5, r2 # 転送する数の全体をr5に入れる:次の割られる数をセット
	li	r2, 0 # 商をリセット
	add	r9, r9, r6 # 注目する最大桁をセット
#	サブルーチンq2r7を呼び出す
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	サブルーチンq2r7から戻る
	addi	r11, r7, 48 # asciiに変換 r11は2番目に表示する
	cmpwi	cr7, r6, 4 # もしr6 = 4ならば、r6 - 3をして継続
	bne	r61or0
	addi	r12, r7, 48 # asciiに変換 r12は3番目に表示する値
	subi	r6, r6, 3
#	サブルーチン的にprint_intを呼び出す ここで呼び出すprint_intはr6eq1or0に入る
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	サブルーチン的にprint_intから戻る
	out	r12
	blr
r61or0:
	cmpwi	cr7, r6, 1
	bne	r6eq0
	subi	r6, r6, 1
#	サブルーチン的にprint_intを呼び出す ここ呼び出すprint_intはr6eq0までいく
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	サブルーチン的にprint_intから戻る
	addi	r12, r7, 48 # 
	out	r11
	blr
r6eq0:
	addi	r7, r7, 48
	out	r7
	blr
q2r7: # 割り算。商はr2、余りはr7へ
	slw	r8, r10, r9 # 引いてみる値をセット
	sub	r8, r5, r8 # とりあえず引いてみる
	cmpwi	cr7, r8, 0 # 引かれた値が0未満かどうかを判定する
	blt	idle # 負の数ならば、何もしない(idle)へ,
	mr	r5, r8 # 引く場合次に割られる値を更新
	li	r8, 1 # 足す値を作成
	slw	r8, r8, r9 # 1を注目する桁までシフト
	add	r2, r2, r8 # 商を更新
	cmpwi	cr7, r9, 0 # 注目する桁が0まで行ったかどうか
	bgt	cr7, r9eq0 # まだ0になっていなかったらまだ割れるので、q2r7にもどる
	subi	r9, r9, 1 # 0まで行ってないならば、デクリメント
	b	q2r7
idle: #引かない場合:次に割られる値はそのまま、商にも何もたさない
	cmpwi	cr7, r9, 0
	bgt	cr7, r9eq0 # 
	subi	r9, r9, 1
	b	q2r7
r9eq0:
	blr

# ------------------------------ ここまでライブラリ ------------------------------
gcd.13:
	cmpwi	cr7, r2, 0
	bne	cr7, beq_else.23
	addi	r2, r5, 0
	b	beq_cont.24
beq_else.23:
	cmpw	cr7, r2, r5
	bgt	cr7, ble_else.25
	sub	r5, r5, r2
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	gcd.13
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	addi	r2, r2, 0
	b	ble_cont.26
ble_else.25:
	sub	r2, r2, r5
	mflr	r31
	mr	r29, r5
	mr	r5, r2
	mr	r2, r29
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	gcd.13
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	addi	r2, r2, 0
ble_cont.26:
beq_cont.24:
	addi	r2, r2, 0
	blr
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
#	main program starts
	li	r2, 21600
	lis	r5, 5
	ori	r5, r5, 9820
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	gcd.13
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	min_caml_print_int
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	main program ends
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
