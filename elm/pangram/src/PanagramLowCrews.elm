module PanagramLowCrews exposing (..)

import Set exposing (Set)
import Char

charRange : Char -> Char -> List Char
charRange start end = (List.range (Char.toCode start) (Char.toCode end)) |> List.map Char.fromCode

alphabet : Set Char
alphabet = Set.fromList (charRange 'a' 'z')

isPangram : String -> Bool
isPangram sentence =
  let
    characters = sentence |> String.toLower |> String.toList |> Set.fromList
    remained = Set.foldl Set.remove alphabet characters
  in
    Set.isEmpty remained