module Series exposing (slices)
import List exposing (append, map)
import String exposing (slice, length, fromChar, toList, toInt)
import Maybe exposing (withDefault)

slices : Int -> String -> Result String (List (List Int))
slices size input =
    let
        inputLen = length input
        chToInt char = char |> fromChar >> toInt >> withDefault 0
        nextSlice sz st = slice 0 sz st |>  toList >> map chToInt
        sliceBySize sz acc st =
            if sz > length st
            then acc
            else sliceBySize sz ( append acc [nextSlice sz st] ) ( slice 1 (length st) st )       
    in
        if inputLen == 0 
        then Err "series cannot be empty"
        else 
            if size > inputLen 
            then Err "slice length cannot be greater than series length"
            else 
                if size == 0 
                then Err "slice length cannot be zero"
                else
                    if size < 0 
                    then Err "slice length cannot be negative"
                    else Ok (input |> sliceBySize size [])