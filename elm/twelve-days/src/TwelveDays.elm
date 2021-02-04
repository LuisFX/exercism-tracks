module TwelveDays exposing (recite)
import Html exposing (a)

recite : Int -> Int -> List String
recite start stop =
    let 
        verseList = 
            [
            { dayNum = 1, dayStr = "first", ending = "a Partridge in a Pear Tree." }
            , { dayNum = 2, dayStr = "second", ending = "two Turtle Doves, " }
            , { dayNum = 3, dayStr = "third", ending = "three French Hens, " }
            , { dayNum = 4, dayStr = "fourth", ending = "four Calling Birds, " }
            , { dayNum = 5, dayStr = "fifth", ending = "five Gold Rings, " }
            , { dayNum = 6, dayStr = "sixth", ending = "six Geese-a-Laying, " }
            , { dayNum = 7, dayStr = "seventh", ending = "seven Swans-a-Swimming, " }
            , { dayNum = 8, dayStr = "eighth", ending = "eight Maids-a-Milking, " }
            , { dayNum = 9, dayStr = "ninth", ending = "nine Ladies Dancing, " }
            , { dayNum = 10, dayStr = "tenth", ending = "ten Lords-a-Leaping, " }
            , { dayNum = 11, dayStr = "eleventh", ending = "eleven Pipers Piping, " }
            , { dayNum = 12, dayStr = "twelfth", ending = "twelve Drummers Drumming, " }
            ]

        concatGifts : Int -> String
        concatGifts upperBound =
            List.map (\ a -> a.ending) verseList
            |> List.take upperBound
            |> List.reverse
            |> List.indexedMap Tuple.pair
            |> List.foldl (\ (i,a) (ii,b) ->
                (if upperBound == i + 1 && upperBound /= 1 then 
                    (i, b ++ "and " ++ a)
                else
                    (i, b ++ a))
            ) (0,"")
            |> Tuple.second
            
    in
        verseList
        |> List.filter (\ a -> (List.member a.dayNum (List.range start stop)))
        |> List.map (\ a -> "On the " ++ a.dayStr ++ " day of Christmas my true love gave to me: " ++ (concatGifts a.dayNum))
