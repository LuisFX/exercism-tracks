module Pangram exposing (isPangram)

import String exposing (contains, toLower)

alphabeth =
    List.range 97 122
    |> List.map Char.fromCode
    |> String.fromList

isPangram : String -> Bool
isPangram sentence =
    alphabeth 
    |> String.all (\ a ->
        sentence 
        |> toLower 
        |> String.any ((\ b -> a == b))
    )