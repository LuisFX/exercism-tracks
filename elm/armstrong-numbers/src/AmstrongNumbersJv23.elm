module AmstrongNumbersJv23 exposing (isArmstrongNumber)

getDigits : Int -> List Int
getDigits n =
    if n < 10 then
        [ n ]

    else
        modBy 10 n :: (getDigits <| (n // 10))


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        digits =
            getDigits nb
    in
    List.map (\d -> d ^ List.length digits) digits
        |> List.sum
        |> (==) nb
