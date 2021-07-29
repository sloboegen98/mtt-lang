open Ast.Expr

let rec translate Location.{ data = expr; _ } =
  match expr with
  | Unit -> "unit"
  | VarR { idr } -> Id.R.to_string idr
  | Fun { idr; ty_id = _; body } -> "fun (" ^ Id.R.to_string idr ^ "\\" ^ (translate body) ^ ")"
  | App { fe; arge } -> "(" ^ translate fe ^ ") " ^ translate arge
  | Pair { e1; e2 } -> "pair " ^ translate e1 ^ " " ^ translate e2
  | _ -> failwith "not supported yet"