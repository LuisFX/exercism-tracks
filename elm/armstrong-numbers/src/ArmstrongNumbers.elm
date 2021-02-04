module ArmstrongNumbers exposing (isArmstrongNumber)
import String exposing (fromInt, toList, fromChar, toInt, length)
import Maybe exposing (withDefault)

getDigits0 : Int -> List Int
getDigits0 n = 
    n
    |> fromInt
    |> toList
    |> List.map (fromChar >> toInt >> withDefault 0)

getDigits1 : Int -> List Int
getDigits1 n = 
    ((fromInt >> toList)) n
    |> List.map (fromChar >> toInt >> withDefault 0 )

getDigits2 : Int -> List Int
getDigits2 n =
    if n < 10 
    then [ n ]
    else modBy 10 n :: (getDigits2 <| (n // 10))

isArmstrongNumberA : Int -> Bool
isArmstrongNumberA nb =
    (
        nb 
        |> getDigits2 --can be any of the "getDigits_" functions
        |> List.map (\ a -> a ^ (nb |> fromInt |> length )) --raise to the power of the number of digits
        |> List.sum
    ) == nb --compare computation expression to the initial value




intToNumberOfDigits : Int -> Int
intToNumberOfDigits =  (fromInt >> length )

isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        numberToCharList : List Char
        numberToCharList = (fromInt >> toList) nb
    in
        numberToCharList 
        |> List.map 
            (fromChar >> toInt >> withDefault 0 >> (\ a -> a ^ (List.length numberToCharList)))
        |> List.sum
        |> (==) nb