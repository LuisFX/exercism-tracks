module ScrabbleScore exposing (scoreWord)
import String

scoreWord : String -> number
scoreWord = 
    String.toUpper >> String.foldl (\ l acc -> (getLetterValue l) + acc) 0

getLetterValue : Char -> number
getLetterValue char = 
    if "AEIOULNRST" |> String.contains (char |> String.fromChar) then 1
    else if "DG" |> String.contains (char |> String.fromChar) then 2
    else if "BCMP" |> String.contains (char |> String.fromChar) then 3
    else if "FHVWY" |> String.contains (char |> String.fromChar) then 4
    else if "K" |> String.contains (char |> String.fromChar) then 5
    else if "JX" |> String.contains (char |> String.fromChar) then 8
    else if "QZ" |> String.contains (char |> String.fromChar) then 10
    else 0


-- scrabbleDict : Dict.Dict Int (List Char)
-- scrabbleDict =
--     [
--         (1, ['A','E','I','O','U','L','N','R','S','T'])
--         ,(2, ['D','G'])
--         ,(3, ['B','C','M','P'])
--         ,(4, ['F','H','V','W','Y'])
--         ,(5, ['K'])
--         ,(8, ['J','X'])
--         ,(10, ['Q','Z'])
--     ]
--     |> Dict.fromList

-- getCharValueB : Char -> Maybe Int
-- getCharValueB c =
--     if ['A','E','I','O','U','L','N','R','S','T'] |> caseInsensitiveAny c then Just 1
--     else if ['D','G'] |> caseInsensitiveAny c then Just 2
--     else if ['B','C','M','P'] |> caseInsensitiveAny c then Just 3
--     else if ['F','H','V','W','Y'] |> caseInsensitiveAny c then Just 4
--     else if ['K'] |> caseInsensitiveAny c then Just 5
--     else if ['J','X'] |> caseInsensitiveAny c then Just 8
--     else if ['Q','Z'] |> caseInsensitiveAny c then Just 10
--     else Nothing

-- scoreWordB x =
--     x
--     |> String.toList
--     |> List.map getCharValueB
--     |> List.map (Maybe.withDefault 0)
--     |> List.sum

-- mapScrabbleLetter : Char -> ScrabbleLetter
-- mapScrabbleLetter c =
--     if ['A','E','I','O','U','L','N','R','S','T'] |> caseInsensitiveAny c then AEIOULNRST 1
--     else if ['D','G'] |> caseInsensitiveAny c then DG 2
--     else if ['B','C','M','P'] |> caseInsensitiveAny c then BCMP 3
--     else if ['F','H','V','W','Y'] |> caseInsensitiveAny c then FHVWY 4
--     else if ['K'] |> caseInsensitiveAny c then K 5
--     else if ['J','X'] |> caseInsensitiveAny c then JX 8
--     else if ['Q','Z'] |> caseInsensitiveAny c then QZ 10
--     else InvalidLetter 

-- type ScrabbleLetter
--     = AEIOULNRST Int
--     | DG Int
--     | BCMP Int
--     | FHVWY Int
--     | K Int
--     | JX Int
--     | QZ Int
--     | InvalidLetter 


-- getLetterValue : Char -> Int
-- getLetterValue c =
--     if ['A','E','I','O','U','L','N','R','S','T'] |> caseInsensitiveAny c then 1
--     else if ['D','G'] |> caseInsensitiveAny c then 2
--     else if ['B','C','M','P'] |> caseInsensitiveAny c then 3
--     else if ['F','H','V','W','Y'] |> caseInsensitiveAny c then 4
--     else if ['K'] |> caseInsensitiveAny c then 5
--     else if ['J','X'] |> caseInsensitiveAny c then 8
--     else if ['Q','Z'] |> caseInsensitiveAny c then 10
    -- else 0


-- caseInsensitiveAny :  Char -> List Char -> Bool
-- caseInsensitiveAny char list = List.any (\ aa -> Char.toUpper aa ==  Char.toUpper char) list