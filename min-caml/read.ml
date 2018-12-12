(* customized version of Map *)
module Read =
  Map.Make
    (struct
      type t = Id.t
      let compare = compare
    end)
include Read
(*  *)
let add_list xys env = List.fold_left (fun env (x, y) -> add x y env) env xys
(* List.fold_left2 : ('a -> 'b -> 'c -> 'a) -> 'a -> 'b list -> 'c list -> 'a *)
let add_list2 xs ys env = List.fold_left2 (fun env x y -> add x y env) env xs ys
