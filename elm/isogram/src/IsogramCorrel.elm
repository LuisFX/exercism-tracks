module IsogramCorrel exposing (..)

import Regex exposing (HowMany(All), regex, replace)
import Set


isIsogram : String -> Bool
isIsogram s =
    let
        letters =
            String.toLower s
                |> replace All (regex "[^a-z]") (\_ -> "")
                |> String.toList
    in
        List.length letters == Set.size (Set.fromList letters)