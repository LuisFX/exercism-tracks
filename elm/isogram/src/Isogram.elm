module Isogram exposing (isIsogram)
import String exposing (length)
import Set

isIsogram : String -> Bool
isIsogram sentence =
    sentence
    |> String.toLower
    |> String.filter Char.isAlpha
    |> String.toList
    |> (\ l -> (l |> Set.fromList |> Set.size) == (l |> List.length))
