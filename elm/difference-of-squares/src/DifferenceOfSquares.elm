module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


pow2 n = n ^ 2 
squareOfSum : Int -> Int
squareOfSum n =
    List.range 1 n
    |> List.sum
    |> pow2


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
    |> List.map pow2
    |> List.sum


difference : Int -> Int
difference n =
    (squareOfSum n) - (sumOfSquares n)
