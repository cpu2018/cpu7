(* customized version of Set *)
module S =
  Set.Make
    (struct
      type t = Id.t
      let compare = compare
    end)
include S

(* listをset に変換する*)
let of_list l = List.fold_left (fun s e -> add e s) empty l
