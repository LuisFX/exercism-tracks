module a exposing (..)

module Transpose exposing (transpose)
equalize l1 l2 =
    let
        makeTemp len = (List.range 0 (len - 1)) |> List.map (\ a -> "") 
        len1 = l1 |> List.length
        len2 = l2 |> List.length
    in
        if len1 == len2 then
            (l1, l2)
        else if len1 > len2 then
            (l1, List.append l2 (makeTemp (len1 - len2)))
        else
            ((List.append l1 (makeTemp (len2 - len1))), l2 )

comp : List String -> List String -> List String
comp head acc =
    let
        (h, accum) = equalize head acc            
    in
        h
        |> List.map2 Tuple.pair accum
        |> List.map (\ (a,b) -> a  ++ b )


transp : List String -> List String -> List String
transp lines acc =
    case lines of
    [] -> acc
    head::tail ->
        transp tail (comp (head |> String.map(\a -> a |> String.fromChar)) acc )
    

transpose : List String -> List String
transpose lines =
    transp lines []
    --|> List.filter (\ a -> a /= "")