module Tests exposing (anyCharacter, character, gibberish, gibberishQuestion, listOfCharacters, tests, uppercaseCharacter, uppercaseGibberish)

import Bob exposing (hey)
import Char
import Expect
import Random
import String
import Test exposing (..)


tests : Test
tests =
    describe "Bob"
        [ test "stating something" <|
            \() ->
                Expect.equal "Whatever."
                    (hey "Tom-ay-to, tom-aaaah-to.")
        , --skip <|
            test "shouting" <|
                \() ->
                    Expect.equal
                        "Whoa, chill out!"
                        (hey "WATCH OUT!")
        , --skip <|
            test "shouting gibberish" <|
                \() ->
                    let
                        ttt = uppercaseGibberish 10
                    in
                        Debug.log ("Shouting gibberish: \n")

                    Expect.equal
                        "Whoa, chill out!"
                        (hey ttt) --(uppercaseGibberish 10))
        , --skip <|
            test "asking a question" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "Does this cryogenic chamber make me look fat?")
        , --skip <|
            test "asking a numeric question" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "You are, what, like 15?")
        , --skip <|
            test "asking gibberish" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey (gibberishQuestion 20))
        , --skip <|
            test "talking forcefully" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "Hi there!")
        , --skip <|
            test "using acronyms in regular speech" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "It's OK if you don't want to go work for NASA.")
        , --skip <|
            test "forceful questions" <|
                \() ->
                    Expect.equal
                        "Calm down, I know what I'm doing!"
                        (hey "WHAT'S GOING ON?")
        , --skip <|
            test "shouting numbers" <|
                \() ->
                    Expect.equal
                        "Whoa, chill out!"
                        (hey "1, 2, 3 GO!")
        , --skip <|
            test "only numbers" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "1, 2, 3")
        , --skip <|
            test "question with only numbers" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "4?")
        , --skip <|
            test "shouting with special characters" <|
                \() ->
                    Expect.equal
                        "Whoa, chill out!"
                        (hey "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")
        , --skip <|
            test "shouting with no exclamation mark" <|
                \() ->
                    Expect.equal
                        "Whoa, chill out!"
                        (hey "I HATE THE DENTIST")
        , --skip <|
            test "statement containing a question mark" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "Ending with ? means a question.")
        , --skip <|
            test "prattling on" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "Wait! Hang on. Are you going to be OK?")
        , --skip <|
            test "silence" <|
                \() ->
                    Expect.equal
                        "Fine. Be that way!"
                        (hey "")
        , --skip <|
            test "prolonged silence" <|
                \() ->
                    Expect.equal
                        "Fine. Be that way!"
                        (hey "       ")
        , --skip <|
            test "alternate silences" <|
                \() ->
                    Expect.equal
                        "Fine. Be that way!"
                        (hey "\t  \n  \t   ")
        , --skip <|
            test "on multiple line questions" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "\nDoes this cryogenic chamber make me look fat?\nno")
        , --skip <|
            test "ending with whitespace" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "Okay if like my  spacebar  quite a bit?   ")
        , --skip <|
            test "no letters" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "1, 2, 3")
        , --skip <|
            test "question with no letters" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey "4?")
        , --skip <|
            test "statement containing question mark" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "Ending with ? means a question.")
        , --skip <|
            test "non-letters with question" <|
                \() ->
                    Expect.equal
                        "Sure."
                        (hey ":) ?")
        , --skip <|
            test "starting with whitespace" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "         hmmmmmmm...")
        , --skip <|
            test "other whitespace" <|
                \() ->
                    Expect.equal
                        "Fine. Be that way!"
                        (hey "\n\u{000D} \t")
        , --skip <|
            test "non-question ending with whitespace" <|
                \() ->
                    Expect.equal
                        "Whatever."
                        (hey "This is a statement ending with whitespace      ")
        ]


character : Int -> Int -> Random.Generator Char
character start end = Random.map Char.fromCode (Random.int start end)


anyCharacter : Random.Generator Char
anyCharacter = character 32 126


uppercaseCharacter : Random.Generator Char
uppercaseCharacter = character 65 90


listOfCharacters : Int -> Random.Generator Char -> Random.Generator (List Char)
listOfCharacters length characterList =
    Random.list length characterList


gibberish : Int -> Random.Generator Char -> String
gibberish length characterList = 
    --Tuple.first (Random.step (Random.map String.fromList (listOfCharacters length characterList)) (Random.initialSeed 424242))

    -- let
    --     charList = listOfCharacters length characterList
    --     str = Random.map String.fromList charList
    --     seed = (Random.initialSeed 424242)
    --     step = Random.step str seed
    -- in
    --   Tuple.first step
    
    Random.step --
        (listOfCharacters length characterList |> Random.map String.fromList) --generator
        (Random.initialSeed 424242) --seed
    |> Tuple.first


uppercaseGibberish : Int -> String
uppercaseGibberish length =
    gibberish length uppercaseCharacter


gibberishQuestion : Int -> String
gibberishQuestion length =
    gibberish length anyCharacter ++ "?"
