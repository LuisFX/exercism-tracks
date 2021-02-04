module Temp exposing (..)

module RunLengthEncoding exposing (decode, encode)

import String exposing (foldl, cons)
import List exposing (head)
import List
import Html.Attributes exposing (accept)
import Maybe
import Maybe

--type Acc = (Char -> Int -> Char) -> (Char -> Int -> Char)

dFoldl : Char -> (String, Int, Char) -> (String, Int, Char)
dFoldl current (acc, count, last) = 
    if current == last then
        (acc, count, current)
    else
        (acc, count, current)
    
    
-- encode : String -> List String
dropLast = List.reverse >> List.drop 1 >> List.reverse 

encode : String -> String
encode string =
    string |>
    String.foldl (\ current (acc, count, last) ->
        if current == last then
            (
                ([((String.fromInt (count + 1)) ++ (String.fromChar current))]
                |> List.append (dropLast acc))
                , (count + 1)
                , current
            )
        else
            (List.append acc [(String.fromChar current) ], 1, current)
    ) ([], 0, ' ')
    |> 
    (\ (a,_,_) -> a ) -- unboxes the list with all the encoded buckets
    |> List.foldl (\ a b -> b ++ a) ""

decode : String -> String
decode string =
    string
    |> String.foldl (\ current (acc, lastDigit, lastChar ) ->
        if Char.isAlpha current then
            (
                if (lastDigit |> String.toInt |> Maybe.withDefault 0) == 0 then 
                    acc
                    -- |> String.pad 
                    --         ((Maybe.withDefault 0 (String.toInt lastDigit)) + (acc |> String.length))
                    --         lastChar
                    |> String.append (String.fromChar current)
                else
                    acc |> String.pad
                , ""
                , current
            )
        else
            (
                acc |> String.pad ()
                , (String.fromChar current) ++ lastDigit, lastChar
            )
    
    ) ("","",' ')
    |> (\ (a,_,_) -> a ) 
-- 'C' ("", "", ' ') -> ("" + pad 0 ' ' + append "C") -> ("C", "", ' ')
-- '4' ("C", 'C') -> () -> ("C", "4", 'C')
-- 'B' ("C", "4", 'C') -> ("C" + pad 4 'C' + append "B") -> ("CCCCB", "", 'B' )
-- '3' ("CCCC")