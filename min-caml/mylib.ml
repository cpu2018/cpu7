open Asm

let print_external_methods oc = Printf.fprintf oc
"# ここからライブラリ
\t.global min_caml_print_int
min_caml_print_int:
\tmflr\tr31 # リンクレジスタの値をr31に一時格納
\tstw\tr31, 4(r3) # 格納されたリンクレジスタの値をスタックに積む
\taddi\tr3, r3, 8 # スタックポインタを更新する
\tstw\tr2, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr5, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr6, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr7, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr8, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr9, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr10, 4(r3)
\taddi\tr3, r3, 8
\tli\tr10, 10 # r10に10をセット
\tbl\tprint_int
\tsubi\tr3, r3, 8
\tlwz\tr10, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr9, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr8, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr7, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr6, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr5, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr2, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr31, 4(r3)
\tmtlr\tr31
print_int:
\tmr\tr5, r2 # 転送する数の全体をr5に入れる:次の割られる数をセット
\taddi\tr6, r0, 27 # r6に28を代入
#\tサブルーチンq2r7を呼び出す
\tmflr\tr31
\tstw\tr31, 4(r3)
\taddi\tr3, r3, 8
\tbl\tq2r7
\tsubi\tr3, r3, 8
\tlwz\tr31, 4(r3)
\tmtlr\tr31
#\tサブルーチンq2r7から戻る
\taddi\tr7, r7, 48 # asciiに変換
\tout\tr7 # 1桁転送 r7 に入ってるのは余り
\tcmpw\tcr7, r0, r2
\tbgt\tcr7, print_int # r2(商)が0より大きければループ続行
\tblr # 商が0になれば、終わり。
q2r7: # 割り算。商はr2、余りはr7へ
\tslw\tr8, r10, r6
\tsub\tr9, r5, r8
\tcmpwi\tcr7, r9, 0
\tblt\tthrough # 負の数ならば、何もしないルートへ,
\tmv\tr5, r9 # 引く場合:次に割られる値を更新
\tadd\tr2, r2, r6 # 商を更新(r6は商に足すべきその桁での数でもある)
\tcmpw\tcr7, r0, r6
\tsubi\tr6, r6, 1 # 注目する桁を一つ後ろに下げる(r6をデクリメント)
\tbgt\tcr7, q2r7
\tblr
through: #引かない場合:次に割られる値はそのまま、商にも何もたさない
\tcmpw\tcr7, r0, r6
\tsubi\tr6, r6, 1
\tbgt\tcr7, q2r7
\tblr
# ここまでライブラリ
"

