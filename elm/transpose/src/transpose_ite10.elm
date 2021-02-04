module Transpose exposing (transpose)
import String exposing (padRight)

comp : List String -> List String -> List String
comp acc =
    List.map2 Tuple.pair acc
    >> List.map (\ (a,b) -> a ++ b )


transp : List String -> List String -> List String
transp lines acc =
    case lines of
    [] -> acc
    head::tail ->
        transp
            tail ( (comp acc (head |> String.toList |> List.map String.fromChar) )    )

transpose : List String -> List String
transpose lines =
    let
        getMaxLength : List String -> Int
        getMaxLength =
            List.sortBy String.length >> List.reverse >> List.head >> Maybe.withDefault "" >> String.length
        len = lines |> getMaxLength
        
        l = lines |> List.map (padRight len ' ') |> List.map (\ a -> a |> String.replace " " "#")
    in
        -- l
        transp l (List.range 0 20 |> List.map (\ _ -> "")) 
        |> List.filter (\ a -> a /= "")