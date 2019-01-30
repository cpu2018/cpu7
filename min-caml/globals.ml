open MiniMLRuntime;;

(**************** グローバル変数の宣言 ****************)

(* オブジェクトの個数 *)
(* 4 *)
let n_objects = create_array 1 0

(* オブジェクトのデータを入れるベクトル（最大60個）*)
(* 2640 *)
let objects = 
  let dummy = create_array 0 0.0 in
  create_array 60 (0, 0, 0, 0, dummy, dummy, false, dummy, dummy, dummy, dummy)

(* Screen の中心座標 *)
(* 12 *)
let screen = create_array 3 0.0
(* 視点の座標 *)
(* 12 *)
let viewpoint = create_array 3 0.0
(* 光源方向ベクトル (単位ベクトル) *)
(* 12 *)
let light = create_array 3 0.0
(* 鏡面ハイライト強度 (標準=255) *)
(* 4 *)
let beam = create_array 1 255.0
(* AND ネットワークを保持 *)
(* 200 *)
let and_net = create_array 50 (create_array 1 (-1))
(* OR ネットワークを保持 *)
(* 4 *)
let or_net = create_array 1 (create_array 1 (and_net.(0)))

(* 以下、交差判定ルーチンの返り値格納用 *)
(* solver の交点 の t の値 *)
(* 4 *)
let solver_dist = create_array 1 0.0
(* 交点の直方体表面での方向 *)
(* 4 *)
let intsec_rectside = create_array 1 0
(* 発見した交点の最小の t *)
(* 4 *)
let tmin = create_array 1 (1000000000.0)
(* 交点の座標 *)
(* 12 *)
let intersection_point = create_array 3 0.0
(* 衝突したオブジェクト番号 *)
(* 4 *)
let intersected_object_id = create_array 1 0
(* 法線ベクトル *)
(* 12 *)
let nvector = create_array 3 0.0
(* 交点の色 *)
(* 12 *)
let texture_color = create_array 3 0.0

(* 計算中の間接受光強度を保持 *)
(* 12 *)
let diffuse_ray = create_array 3 0.0
(* スクリーン上の点の明るさ *)
(* 12 *)
let rgb = create_array 3 0.0

(* 画像サイズ *)
(* 8 *)
let image_size = create_array 2 0
(* 画像の中心 = 画像サイズの半分 *)
(* 8 *)
let image_center = create_array 2 0
(* 3次元上のピクセル間隔 *)
(* 4 *)
let scan_pitch = create_array 1 0.0

(* judge_intersectionに与える光線始点 *)
(* 12 *)
let startp = create_array 3 0.0
(* judge_intersection_fastに与える光線始点 *)
(* 12 *)
let startp_fast = create_array 3 0.0

(* 画面上のx,y,z軸の3次元空間上の方向 *)
(* 12 *)
let screenx_dir = create_array 3 0.0
(* 12 *)
let screeny_dir = create_array 3 0.0
(* 12 *)
let screenz_dir = create_array 3 0.0

(* 直接光追跡で使う光方向ベクトル *)
(* 12 *)
let ptrace_dirvec  = create_array 3 0.0

(* 間接光サンプリングに使う方向ベクトル *)
(* 40 *)
let dirvecs = 
  let dummyf = create_array 0 0.0 in
  let dummyff = create_array 0 dummyf in
  let dummy_vs = create_array 0 (dummyf, dummyff) in
  create_array 5 dummy_vs

(* 光源光の前処理済み方向ベクトル *)
(* 504 *)
let light_dirvec =
  let dummyf2 = create_array 0 0.0 in
  let v3 = create_array 3 0.0 in
  let consts = create_array 60 dummyf2 in
  (v3, consts)

(* 鏡平面の反射情報 *)
(* 2880 *)
let reflections =
  let dummyf3 = create_array 0 0.0 in
  let dummyff3 = create_array 0 dummyf3 in
  let dummydv = (dummyf3, dummyff3) in
  create_array 180 (0, dummydv, 0.0)

(* reflectionsの有効な要素数 *) 
(* 4 *)
let n_reflections = create_array 1 0
