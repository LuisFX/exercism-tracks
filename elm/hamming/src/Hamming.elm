module Hamming exposing (distance)
import Set exposing (Set)
import Html.Attributes exposing (src)
import String exposing (right)
import Set exposing (toList)

diffCount left right = 
    List.map2 (Tuple.pair) (String.toList left) (String.toList right)
    |> List.filter (\ (a, b) -> a /= b)

distance left right =
    if String.length left == String.length right then
        Ok (List.length (diffCount left right))
    else
        Err "left and right strands must be of equal length"
 