module TwelveDaysMocoso exposing (recite)

import Array exposing (fromList, get)
import List exposing (foldl, isEmpty, map,range, reverse, take)
import String exposing (join)

recite : Int -> Int -> List String
recite start stop =
  map reciteDay (range start stop)

reciteDay day =
  "On the "
    ++ ordinal day
    ++ " day of Christmas my true love gave to me, "
    ++ giftList day
    ++ "."


ordinal number = 
  Maybe.withDefault "" (get number ordinals)

giftList day =
  take day gifts
    |> reverse
    |> makeSentence

makeSentence items =
  case (reverse items) of
    [] ->
      ""
    [ head ]
      -> head
    head::tail ->
      join ", " (reverse tail)
        ++ ", and "
        ++ head

gifts =
    [ "a Partridge in a Pear Tree"
    , "two Turtle Doves"
    , "three French Hens"
    , "four Calling Birds"
    , "five Gold Rings"
    , "six Geese-a-Laying"
    , "seven Swans-a-Swimming"
    , "eight Maids-a-Milking"
    , "nine Ladies Dancing"
    , "ten Lords-a-Leaping"
    , "eleven Pipers Piping"
    , "twelve Drummers Drumming"
    ]

ordinals =
  Array.fromList
    [ "zeroth"
    , "first"
    , "second"
    , "third"
    , "fourth"
    , "fifth"
    , "sixth"
    , "seventh"
    , "eighth"
    , "ninth"
    , "tenth"
    , "eleventh"
    , "twelfth"
    ]