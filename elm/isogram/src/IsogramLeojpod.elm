module IsogramLeojpod exposing (isIsogram)

import Set

isIsogram : String -> Bool
isIsogram =
    String.toLower
        >> String.toList
        >> List.filter Char.isAlpha
        >> (\letters ->
                (Set.size <| Set.fromList letters) == List.length letters
           )