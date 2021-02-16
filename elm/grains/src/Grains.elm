module Grains exposing (square)

square : Int -> Maybe Int
square n = 
    if n < 1 
    then Nothing 
    else 2 ^ (n - 1) |> Just
