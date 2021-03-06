(* customized version of Set *)
module Ready =
  Set.Make
    (struct
      type t = Asm.id * int
      let compare (id1, degree1) (id2, degree2) = compare id1 id2
    end)
include Ready

(* listをset に変換する*)
let of_list l = List.fold_left (fun s e -> add e s) empty l
