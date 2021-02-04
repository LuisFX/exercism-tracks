module v1 exposing (..)

module RunLengthEncoding exposing (decode, encode)

import String exposing (foldl, cons)
import List exposing (head)
import List
import Html.Attributes exposing (accept)

--type Acc = (Char -> Int -> Char) -> (Char -> Int -> Char)

dFoldl : Char -> (String, Int, Char) -> (String, Int, Char)
dFoldl current (acc, count, last) = 
    if current == last then
        (acc, count, current)
    else
        (acc, count, current)
    
    
-- encode : String -> List String
encode : String -> String
encode s =
    let
        dropLast = List.reverse >> List.drop 1 >> List.reverse 
        f =
            String.foldl (\ current (acc, count, last) ->
                if current == last then
                    (
                        [((String.fromInt (count + 1)) ++ (String.fromChar current))]
                        |> List.append (dropLast acc)
                        , (count + 1), current
                    )
                else
                    (
                        List.append acc [(String.fromChar current) ] 
                        , 1, current
                    )
            ) ([], 0, ' ')
            |> (\ l -> l)
        (ac,_,_) = (f s)
    in    
        ac 
        |> List.foldl (\ a b -> b ++ a) ""  
        -- |> List.foldl (\ s acc -> acc ++ s) ""

decode : String -> String
decode string =
    Debug.todo "Please implement this function"
