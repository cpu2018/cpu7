# 2018年度CPU実験7班のコンパイラコード
clone元は[こちら](https://github.com/esumii/min-caml)

## 概要

## ふぁー、文字化けがやばいな...
- 途中からutf-8に変えたので、文字化けがやばいです

## メモ

- let f x y = f y x in let g x = f 0 1 in () のようなプログラムは、インライン展開でとまらない。

- f x (fun r -> t)は、let r = f x in tとして読めば理解しやすい
- コンパイラ向け課題のフォーマットはcompiler-学籍番号.zip
