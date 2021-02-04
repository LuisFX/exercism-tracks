module Transpose exposing (transpose)
import String as S exposing (padRight, cons, toList)
import List as L exposing (map2, foldr, repeat)
transpose : List String -> List String
transpose =
    foldr (\ str acc ->
        padRight (L.length acc) ' ' str
        |> toList
        |> map2 (\ row char -> cons char row )
            (acc ++ repeat (S.length str) "")
    ) []
