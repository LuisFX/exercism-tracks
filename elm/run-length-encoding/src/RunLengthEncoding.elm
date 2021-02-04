module RunLengthEncoding exposing (decode, encode)

import String as S exposing (fromChar, fromInt, padRight)
import List as L exposing (take)
import Char exposing (isAlpha)

-------ENCODER
encodeCata : Char -> (List String, (Int, Char)) -> (List String, (Int, Char)) 
encodeCata curr (acc, (cnt, last)) =
    if curr == last then
        ([fromInt (cnt + 1) ++ fromChar curr] |> L.append (acc |> take ((acc |> L.length) - 1))
        , ((cnt + 1), curr))
    else
        (L.append acc [(fromChar curr) ], (1, curr))

encode : String -> String
encode string =
    string 
    |> S.foldl encodeCata ([], (0, ' '))
    |> Tuple.first -- unboxes the list with all the encoded buckets
    |> L.foldl (\ a b -> b ++ a) ""

--------DECODER
decodeCata : Char -> (String, String) -> (String, String)
decodeCata curr (acc, digits) =
    if ((isAlpha curr) || curr == ' ') && digits /= "" then
        ( acc |> padRight ((digits |> S.toInt |> Maybe.withDefault 0) + (acc |> S.length)) curr, "" )
    else if (isAlpha curr) || curr == ' ' then
        (acc ++ (fromChar curr) , "")
    else
        (acc, (digits ++ (fromChar curr)))

decode : String -> String
decode string =
    string
    |> S.foldl decodeCata ("", "")
    |> Tuple.first