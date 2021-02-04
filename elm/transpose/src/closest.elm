--Passed 8
--Failed 3
-- > triangle

--     ["TEASER","EASER","ASER","SER","ER","R"]
--     ╷
--     │ Expect.equal
--     ╵
--     ["TEASER"," EASER","  ASER","   SER","    ER","     R"]

module closest exposing (transpose)
import String exposing (padRight)

makeTemp len char = (List.range 0 (len - 1)) |> List.map (\ a -> char) 
equalize l1 l2 =
    let
        len1 = l1 |> List.length
        len2 = l2 |> List.length
    in
        if len1 == len2 then
            (l1, l2)
        else if len1 > len2 then
            (l1, List.append l2 (makeTemp (len1 - len2) ""))
        else
            ((List.append l1 (makeTemp (len2 - len1) "")), l2 )

comp : List String -> List String -> List String
comp head acc =
    let
        (h, accum) = equalize head acc
        aaa = Debug.toString (h,accum)        
    in
        -- Debug.log aaa
        h
        |> List.map2 Tuple.pair accum
        |> List.map (\ (a,b) -> a ++ b )


transp : List String -> List String -> List String
transp lines acc =
    case lines of
    [] -> acc
    head::tail ->
        transp
            tail (comp (head |> String.toList |> List.map String.fromChar) acc )    

transpose : List String -> List String
transpose lines =
    let
        getMaxLength : List String -> Int
        getMaxLength =
            List.sortBy String.length >> List.reverse >> List.head >> Maybe.withDefault "" >> String.length
        len = lines |> getMaxLength
        
        -- l = lines |> List.map (a -> if () apadRight len ' ')
    in
    
    transp lines []
    -- |> List.filter (\ a -> (String.contains  a))