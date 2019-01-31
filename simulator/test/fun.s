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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 4(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 8 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	mr	r30, r2
	mr	r2, r5
	stw	r31, 4(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 8 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 4(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 8 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
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
