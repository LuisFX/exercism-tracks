module HammingTimoras exposing (..)

import Maybe exposing (..)
import String exposing ( length, toList)


distance s1 s2 =    
    if length s1 == length s2 then
        List.map2 (/=) (toList s1) (toList s2) 
        |> List.filter identity 
        |> List.length 
        |> Just
    else 
        Nothing