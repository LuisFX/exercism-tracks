module Acronym exposing (abbreviate)
import String exposing (fromChar, uncons, toUpper, replace, words)

abbreviate : String -> String
abbreviate phrase =
    phrase
    |> toUpper
    |> replace "-" " "
    |> words
    |> List.foldl (\ w acc -> 
        uncons w 
        |> Maybe.withDefault (' ',"") 
        |> Tuple.first 
        |> fromChar
        |> (++) acc
    ) ""

-- abbreviate =
--     String.replace "-" " "
--         >> String.split " "
--         >> List.map (String.slice 0 1)
--         >> String.join ""
--         >> String.toUpper