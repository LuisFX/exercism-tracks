module BobWilken exposing (..)

checkForCap char =
    Char.isUpper (char)

checkForYell str =
    String.any checkForCap str   

checkForQuestion str =
    if  String.contains "?" str
    then True
    else False

hey : String -> String
hey remark =
    let
        yelling = checkForYell remark
        question = checkForQuestion remark
    in
    
        if yelling && question then "Calm down, I know what I'm doing"
        else if yelling then "Whoa, chill out"
        else if question then "Sure"
        else if String.isEmpty remark then "Fine, Be that way!"
        else "Whatever"

