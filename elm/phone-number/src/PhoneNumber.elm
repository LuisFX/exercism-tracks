module PhoneNumber exposing (getNumber)

import Char
import Set
import String


validChars : Set.Set Char
validChars = 
    ['.','-', '+', '(', ')', ' ', '0','1','2','3','4','5','6','7','8','9'] 
    |> Set.fromList

digitsOnly : Maybe String -> Maybe String
digitsOnly phn =
    case phn of
        Just a ->
            a
            |> String.toList
            |> List.filter Char.isDigit
            |> String.fromList
            |> Just
        _ -> Nothing


correctLength : Maybe String -> Maybe String
correctLength phn =
    case phn of
        Just a ->
            if String.length a == 11 && String.startsWith "1" a then
                Just (String.dropLeft 1 a)
            else if String.length a == 10 then
                Just a
            else 
                Nothing
        _ -> Nothing

areaCodeValidation : Maybe String -> Maybe String
areaCodeValidation phn =
    case phn of
        Just a ->
            if String.startsWith "0" a || String.startsWith "1" a then
                Nothing
            else
                Just a
        _ -> Nothing

exchangeCodeValidation : Maybe String -> Maybe String
exchangeCodeValidation phn =
    case phn of
        Just a ->
            if (a |> String.dropLeft 3 |> String.startsWith "0") || (a |> String.dropLeft 3 |>String.startsWith "1") then
                Nothing
            else
                phn
        _ -> Nothing

validateCharacters : String -> Maybe String
validateCharacters phn =
    if String.all (\ b -> validChars |> Set.member b) phn then
        Just phn
    else 
        Nothing
        
getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumber
    |> validateCharacters
    |> digitsOnly
    |> correctLength
    |> areaCodeValidation
    |> exchangeCodeValidation
