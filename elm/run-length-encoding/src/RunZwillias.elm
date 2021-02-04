module RunZwillias exposing (version, encode, decode)

import List.Extra
import Maybe.Extra
import Regex exposing (regex)
import Debug

encodeGroup : List Char -> String
encodeGroup chars =
    case chars of
        [] -> ""
        head::tail ->
            if List.length chars > 1 then
                toString (List.length chars) ++ String.fromChar head
            else
                String.fromChar head

encode : String -> String
encode input =
    input
        |> String.toList
        |> List.Extra.group
        |> List.map encodeGroup
        |> List.foldr (++) ""

decode : String -> String
decode input =
    input
        |> Regex.find Regex.All (regex "(\\d*)(\\D)")
        |> List.map decodeMatch
        |> List.map countCharToString
        |> List.foldr (++) ""

countCharToString : (Int, String) -> String
countCharToString (count, char) =
    String.repeat count char

decodeMatch : Regex.Match -> (Int, String)
decodeMatch {submatches} =
    case submatches of
        [Just count, Just char] ->
            ( Result.withDefault 1 <| String.toInt count
            , char
            )
        _ -> Debug.crash "wat"

version : Int
version =
  2