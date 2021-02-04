--Not working, but clean

module Transpose exposing (transpose)
import String exposing (padRight, length, reverse)


getMaxLength : List String -> Int
getMaxLength =
    List.sortBy String.length >> List.reverse >> List.head >> Maybe.withDefault "" >> String.length

comp : List String -> List String -> List String
comp acc =
    List.map2 Tuple.pair acc
    >> List.map (\ (a,b) -> a ++ b )
transp : List String -> List String -> List String
transp acc lines =
    case lines of
    [] -> acc
    head::tail ->
        transp
            tail (comp (head |> String.toList |> List.map String.fromChar) acc )

transpose : List String -> List String
transpose lines =
    let
        len = lines |> getMaxLength
    in
        lines
        |> List.map (padRight len ' ')
        |> transp []