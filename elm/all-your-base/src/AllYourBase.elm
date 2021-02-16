module AllYourBase exposing (rebase)
import Basics exposing (..)
import List exposing (reverse, indexedMap, sum, any)

toDecimal : Int -> List Int -> Int
toDecimal inBase digits =
    (reverse 
    >> indexedMap (\ i d -> d * inBase ^ i) 
    >> sum) digits

decToBase : Int -> List Int -> Int -> List Int
decToBase outBase acc num =
    let
        ( quotient, remainder ) = ( num // outBase, remainderBy outBase num )
    in
        if quotient == 0 
        then remainder :: acc
        else decToBase outBase (remainder :: acc) quotient

rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =  
    if sum digits == 0
        || any (\ a -> a < 0) digits
        || any (\ a -> a >= inBase) digits
        || outBase < 2
    then Nothing
    else (toDecimal inBase >> decToBase outBase [] >> Just) digits