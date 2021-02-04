module ScrabbleScore exposing (scoreWord)
import Dict exposing (Dict)
import String

scoreWord : String -> Int
scoreWord s = s |> String.toUpper |> String.foldl (\ a acc -> letterScore a + acc) 0

scoreDict : Dict Char number
scoreDict =
    [ ( "AEIOULNRST", 1 )
    , ( "DG", 2 )
    , ( "BCMP", 3 )
    , ( "FHVWY", 4 )
    , ( "K", 5 )
    , ( "JX", 8 )
    , ( "QZ", 10 )
    ]
        |> List.concatMap
            (\( str, num ) ->
                String.toList str
                    |> List.map (\char -> ( char, num ))
            )
        |> Dict.fromList


letterScore : Char -> Int
letterScore l = scoreDict |> Dict.get l |> Maybe.withDefault 0