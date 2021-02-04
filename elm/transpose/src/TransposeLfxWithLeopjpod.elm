module TransposeLfxWithLeopjpod exposing (transpose)

import String as S exposing (padRight, cons, toList)
import List as L exposing (map2)

transpose : List String -> List String
transpose =
    L.foldr (\ s p ->
        s 
            |> padRight (L.length p) ' '
            |> toList
            |> map2 (\ pr rc ->
                cons rc pr
            )
            (L.repeat ( S.length s - L.length p) "" |> (++) p )
    ) []