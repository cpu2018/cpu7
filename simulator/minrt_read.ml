let rec read_screen_settings _ =

  (* スクリーン中心の座標 *)
  screen.(0) <- read_float ();
  screen.(1) <- read_float ();
  screen.(2) <- read_float ();
  (* 回転角 *)
  let v1 = rad (read_float ()) in
  let cos_v1 = cos v1 in
  let sin_v1 = sin v1 in
  let v2 = rad (read_float ()) in
  let cos_v2 = cos v2 in
  let sin_v2 = sin v2 in
  (* スクリーン面の奥行き方向のベクトル 注視点からの距離200をかける *)
  screenz_dir.(0) <- cos_v1 *. sin_v2 *. 200.0;
  screenz_dir.(1) <- sin_v1 *. -200.0;
  screenz_dir.(2) <- cos_v1 *. cos_v2 *. 200.0;
  (* スクリーン面X方向のベクトル *)
  screenx_dir.(0) <- cos_v2;
  screenx_dir.(1) <- 0.0;
  screenx_dir.(2) <- fneg sin_v2;
  (* スクリーン面Y方向のベクトル *)
  screeny_dir.(0) <- fneg sin_v1 *. sin_v2;
  screeny_dir.(1) <- fneg cos_v1;
  screeny_dir.(2) <- fneg sin_v1 *. cos_v2;
  (* 視点位置ベクトル(絶対座標) *)
  viewpoint.(0) <- screen.(0) -. screenz_dir.(0);
  viewpoint.(1) <- screen.(1) -. screenz_dir.(1);
  viewpoint.(2) <- screen.(2) -. screenz_dir.(2)

in

(* 光源情報の読み込み *)
let rec read_light _ =

  let nl = read_int () in

  (* 光線関係 *)
  let l1 = rad (read_float ()) in
  let sl1 = sin l1 in
  light.(1) <- fneg sl1;
  let l2 = rad (read_float ()) in
  let cl1 = cos l1 in
  let sl2 = sin l2 in
  light.(0) <- cl1 *. sl2;
  let cl2 = cos l2 in
  light.(2) <- cl1 *. cl2;
  beam.(0) <- read_float ()

in

let rec rotate_quadratic_matrix abc rot =
  (* 回転行列の積 R(z)R(y)R(x) を計算する *)
  let cos_x = cos rot.(0) in
  let sin_x = sin rot.(0) in
  let cos_y = cos rot.(1) in
  let sin_y = sin rot.(1) in
  let cos_z = cos rot.(2) in
  let sin_z = sin rot.(2) in

  let m00 = cos_y *. cos_z in
  let m01 = sin_x *. sin_y *. cos_z -. cos_x *. sin_z in
  let m02 = cos_x *. sin_y *. cos_z +. sin_x *. sin_z in

  let m10 = cos_y *. sin_z in
  let m11 = sin_x *. sin_y *. sin_z +. cos_x *. cos_z in
  let m12 = cos_x *. sin_y *. sin_z -. sin_x *. cos_z in

  let m20 = fneg sin_y in
  let m21 = sin_x *. cos_y in
  let m22 = cos_x *. cos_y in

  (* a, b, cの元の値をバックアップ *)
  let ao = abc.(0) in
  let bo = abc.(1) in
  let co = abc.(2) in

  (* R^t * A * R を計算 *)

  (* X^2, Y^2, Z^2成分 *)
  abc.(0) <- ao *. fsqr m00 +. bo *. fsqr m10 +. co *. fsqr m20;
  abc.(1) <- ao *. fsqr m01 +. bo *. fsqr m11 +. co *. fsqr m21;
  abc.(2) <- ao *. fsqr m02 +. bo *. fsqr m12 +. co *. fsqr m22;

  (* 回転によって生じた XY, YZ, ZX成分 *)
  rot.(0) <- 2.0 *. (ao *. m01 *. m02 +. bo *. m11 *. m12 +. co *. m21 *. m22);
  rot.(1) <- 2.0 *. (ao *. m00 *. m02 +. bo *. m10 *. m12 +. co *. m20 *. m22);
  rot.(2) <- 2.0 *. (ao *. m00 *. m01 +. bo *. m10 *. m11 +. co *. m20 *. m21)

in

let rec read_nth_object n =

  let texture = read_int () in
  if texture <> -1 then
    (
      let form = read_int () in
      let refltype = read_int () in
      let isrot_p = read_int () in

      let abc = create_array 3 0.0 in
      abc.(0) <- read_float ();
      abc.(1) <- read_float (); (* 5 *)
      abc.(2) <- read_float ();

      let xyz = create_array 3 0.0 in
      xyz.(0) <- read_float ();
      xyz.(1) <- read_float ();
      xyz.(2) <- read_float ();

      let m_invert = fisneg (read_float ()) in (* 10 *)

      let reflparam = create_array 2 0.0 in
      reflparam.(0) <- read_float (); (* diffuse *)
      reflparam.(1) <- read_float (); (* hilight *)

      let color = create_array 3 0.0 in
      color.(0) <- read_float ();
      color.(1) <- read_float ();
      color.(2) <- read_float (); (* 15 *)

      let rotation = create_array 3 0.0 in
      if isrot_p <> 0 then
	(
	 rotation.(0) <- rad (read_float ());
	 rotation.(1) <- rad (read_float ());
	 rotation.(2) <- rad (read_float ())
	)
      else ();

      (* パラメータの正規化 *)

      (* 注: 下記正規化 (form = 2) 参照 *)
      let m_invert2 = if form = 2 then true else m_invert in
      let ctbl = create_array 4 0.0 in
      (* ここからあとは abc と rotation しか操作しない。*)
      let obj =
	(texture, form, refltype, isrot_p,
	 abc, xyz, (* x-z *)
	 m_invert2,
	 reflparam, (* reflection paramater *)
	 color, (* color *)
	 rotation, (* rotation *)
         ctbl (* constant table *)
	) in
      objects.(n) <- obj;

      if form = 3 then
	(
	  (* 2次曲面: X,Y,Z サイズから2次形式行列の対角成分へ *)
	 let a = abc.(0) in
	 abc.(0) <- if fiszero a then 0.0 else sgn a /. fsqr a; (* X^2 成分 *)
	 let b = abc.(1) in
	 abc.(1) <- if fiszero b then 0.0 else sgn b /. fsqr b; (* Y^2 成分 *)
	 let c = abc.(2) in
	 abc.(2) <- if fiszero c then 0.0 else sgn c /. fsqr c  (* Z^2 成分 *)
	)
      else if form = 2 then
	(* 平面: 法線ベクトルを正規化, 極性を負に統一 *)
	vecunit_sgn abc (not m_invert)
      else ();

      (* 2次形式行列に回転変換を施す *)
      if isrot_p <> 0 then
	rotate_quadratic_matrix abc rotation
      else ();

      true
     )
  else
    false (* データの終了 *)
in

(**** 物体データ全体の読み込み ****)
let rec read_object n =
  if n < 60 then
    if read_nth_object n then
      read_object (n + 1)
    else
      n_objects.(0) <- n
  else () (* failwith "too many objects" *)
in

let rec read_all_object _ =
  read_object 0
in

(**** AND, OR ネットワークの読み込み ****)

(* ネットワーク1つを読み込みベクトルにして返す *)
let rec read_net_item length =
  let item = read_int () in
  if item = -1 then create_array (length + 1) (-1)
  else
    let v = read_net_item (length + 1) in
    (v.(length) <- item; v)
in

let rec read_or_network length =
  let net = read_net_item 0 in
  if net.(0) = -1 then
    create_array (length + 1) net
  else
    let v = read_or_network (length + 1) in
    (v.(length) <- net; v)
in

let rec read_and_network n =
  let net = read_net_item 0 in
  if net.(0) = -1 then ()
  else (
    and_net.(n) <- net;
    read_and_network (n + 1)
  )
in

let rec read_parameter _ =
  (
   read_screen_settings();
   read_light();
   read_all_object ();
   read_and_network 0;
   or_net.(0) <- read_or_network 0
  )
in
read_parameter ()
