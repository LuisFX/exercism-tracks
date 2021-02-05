module Acronym exposing (abbreviate)

import Regex exposing (HowMany(All), regex, split)

abbreviate : String -> String
abbreviate phrase =
    split All (regex "[^a-zA-Z0-9]") phrase
        |> List.map (String.left 1)
        |> String.concat
        |> String.toUpper