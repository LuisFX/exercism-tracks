module Bob exposing (hey)
import String
import String
import String exposing (toUpper, trim, isEmpty)
import Char exposing (isAlpha)

type Remark
    = Numeric
    | QuestionSymbols
    | Question
    | Yell
    | YellQuestion
    | Empty
    | Gibberish

removeAlpha str = 
    String.map (\ a -> if Char.isAlpha a then a else '*') str
    |> (String.replace "*" "")

isNumeric num = 
    case String.toInt num of
        Just _ -> True
        Nothing -> False

mapRemark remark =
    let
        clearAlpha str = 
            str 
            |> String.map(\ a -> if a |> isAlpha then 'A' else a )
            |> String.replace "A" ""
        isQuestion str = 
            (str |> String.endsWith "?") && (String.length str > 1)
        onlyNumbers str =
            str 
            |> String.map(\ a -> if (a |> Char.isDigit) || (a == ',' || (a == '?')) then a else '*') 
            |> String.replace "*" ""
        symbolsOnly str =
            str
            |> String.map(\ a -> if (a |> Char.isAlphaNum) then 'A' else a)
            |> String.replace "A" ""
    in
    
        if isNumeric remark then
            Numeric
        else if remark |> trim |> isEmpty then
            Empty
        else if (remark |> trim |> symbolsOnly |> isQuestion) && (remark |> trim |> symbolsOnly )== (remark |> trim) then
            QuestionSymbols
        else if (remark |> onlyNumbers |> isQuestion) && (String.length (remark |> onlyNumbers) > 1) then
            Question
        else if (remark |> trim |> toUpper |> isQuestion) && (remark |> trim |> toUpper ) == remark then
            YellQuestion        
        else if (remark |> trim |> isQuestion) || (remark |> clearAlpha |> trim |> isQuestion) then
            Question
        else if (remark |> clearAlpha) == remark then
            Gibberish
        else if (remark |> trim |> toUpper) == remark && (not (remark |> toUpper |> trim |> isQuestion))then
            Yell
        else
            Gibberish

hey : String -> String
hey remark =
    case mapRemark remark of
        Question -> "Sure."
        QuestionSymbols -> "Sure."
        Yell -> "Whoa, chill out!"
        YellQuestion -> "Calm down, I know what I'm doing!"
        Empty -> "Fine. Be that way!"
        Numeric -> "Whatever."
        Gibberish -> "Whatever."