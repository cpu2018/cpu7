open Asm

let print_external_methods oc = Printf.fprintf oc
"# ------------------------------ ここからライブラリ ------------------------------
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
\tstw\tr11, 4(r3)
\taddi\tr3, r3, 8
\tstw\tr12, 4(r3)
\taddi\tr3, r3, 8
\tli\tr10, 10 # r10に10をセット
\tli\tr6, 4
\tbl\tprint_int
\tsubi\tr3, r3, 8
\tlwz\tr12, 4(r3)
\tsubi\tr3, r3, 8
\tlwz\tr11, 4(r3)
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
\tli\tr2, 0 # 商をリセット
\tadd\tr9, r9, r6 # 注目する最大桁をセット
#\tサブルーチンq2r7を呼び出す
\tmflr\tr31
\tstw\tr31, 4(r3)
\taddi\tr3, r3, 8
\tbl\tq2r7
\tsubi\tr3, r3, 8
\tlwz\tr31, 4(r3)
\tmtlr\tr31
#\tサブルーチンq2r7から戻る
\taddi\tr11, r7, 48 # asciiに変換 r11は2番目に表示する
\tcmpwi\tcr7, r6, 4 # もしr6 = 4ならば、r6 - 3をして継続
\tbne\tr61or0
\taddi\tr12, r7, 48 # asciiに変換 r12は3番目に表示する値
\tsubi\tr6, r6, 3
#\tサブルーチン的にprint_intを呼び出す ここで呼び出すprint_intはr6eq1or0に入る
\tmflr\tr31
\tstw\tr31, 4(r3)
\taddi\tr3, r3, 8
\tbl\tprint_int
\tsubi\tr3, r3, 8
\tlwz\tr31, 4(r3)
\tmtlr\tr31
#\tサブルーチン的にprint_intから戻る
\tout\tr12
\tblr
r61or0:
\tcmpwi\tcr7, r6, 1
\tbne\tr6eq0
\tsubi\tr6, r6, 1
#\tサブルーチン的にprint_intを呼び出す ここ呼び出すprint_intはr6eq0までいく
\tmflr\tr31
\tstw\tr31, 4(r3)
\taddi\tr3, r3, 8
\tbl\tprint_int
\tsubi\tr3, r3, 8
\tlwz\tr31, 4(r3)
\tmtlr\tr31
#\tサブルーチン的にprint_intから戻る
\taddi\tr12, r7, 48 # 
\tout\tr11
\tblr
r6eq0:
\taddi\tr7, r7, 48
\tout\tr7
\tblr
q2r7: # 割り算。商はr2、余りはr7へ
\tslw\tr8, r10, r9 # 引いてみる値をセット
\tsub\tr8, r5, r8 # とりあえず引いてみる
\tcmpwi\tcr7, r8, 0 # 引かれた値が0未満かどうかを判定する
\tblt\tidle # 負の数ならば、何もしない(idle)へ,
\tmr\tr5, r8 # 引く場合次に割られる値を更新
\tli\tr8, 1 # 足す値を作成
\tslw\tr8, r8, r9 # 1を注目する桁までシフト
\tadd\tr2, r2, r8 # 商を更新
\tcmpwi\tcr7, r9, 0 # 注目する桁が0まで行ったかどうか
\tbgt\tcr7, r9eq0 # まだ0になっていなかったらまだ割れるので、q2r7にもどる
\tsubi\tr9, r9, 1 # 0まで行ってないならば、デクリメント
\tb\tq2r7
idle: #引かない場合:次に割られる値はそのまま、商にも何もたさない
\tcmpwi\tcr7, r9, 0
\tbgt\tcr7, r9eq0 # 
\tsubi\tr9, r9, 1
\tb\tq2r7
r9eq0:
\tblr

# ------------------------------ ここまでライブラリ ------------------------------
"
