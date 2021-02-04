module RunDbalmain exposing (..)
module RunLengthEncoding exposing (encode, decode, version)

import String
import Result
import Regex exposing (replace, regex)


version : Int
version =
    2


encode : String -> String
encode =
    replace Regex.All
        (regex "(.)(\\1*)")
        (\{ submatches } ->
            case submatches of
                [ Just ch, Just extra ] ->
                    case String.length extra of
                        0 ->
                            ch

                        n ->
                            toString (n + 1) ++ ch

                _ ->
                    ""
        )


decode : String -> String
decode =
    replace Regex.All
        (regex "(\\d*)(.)")
        (\{ submatches } ->
            case submatches of
                [ Just n, Just ch ] ->
                    String.repeat (String.toInt n |> Result.withDefault 1) ch

                _ ->
                    ""
        )