# ここからライブラリ
	.text
	.align 	2
	.global min_caml_print_int
min_caml_print_int:
	mflr	r31 # リンクレジスタの値をr31に一時格納
	stw	r31, 4(r3) # 格納されたリンクレジスタの値をスタックに積む
	addi	r3, r3, 8 # スタックポインタを更新する
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
	li	r10, 10 # r10に10をセット
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
	mr	r5, r2 # 転送する数の全体をr5に入れる:次の割られる数をセット
	addi	r6, r0, 27 # r6に28を代入
#	サブルーチンq2r7を呼び出す
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	サブルーチンq2r7から戻る
	addi	r7, r7, 48 # asciiに変換
	out	r7 # 1桁転送 r7 に入ってるのは余り
	cmpw	cr7, r0, r2
	bgt	cr7, print_int # r2(商)が0より大きければループ続行
	blr # 商が0になれば、終わり。
q2r7: # 割り算。商はr2、余りはr7へ
	slw	r8, r10, r6
	sub	r9, r5, r8
	cmpwi	cr7, r9, 0
	blt	through # 負の数ならば、何もしないルートへ,
	mv	r5, r9 # 引く場合:次に割られる値を更新
	add	r2, r2, r6 # 商を更新(r6は商に足すべきその桁での数でもある)
	cmpw	cr7, r0, r6
	subi	r6, r6, 1 # 注目する桁を一つ後ろに下げる(r6をデクリメント)
	bgt	cr7, q2r7
	blr
through: #引かない場合:次に割られる値はそのまま、商にも何もたさない
	cmpw	cr7, r0, r6
	subi	r6, r6, 1
	bgt	cr7, q2r7
	blr

# ここまでライブラリ
