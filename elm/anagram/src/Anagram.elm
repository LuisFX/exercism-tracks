module Anagram exposing (detect)
import String exposing (trim, toList, fromList, toLower)
import List exposing (sort, filter)

prep = trim >> toLower  
normalize = toList >> sort >> fromList >> toLower
detect : String -> List String -> List String
detect word =
    filter (\ a -> (a |> prep |> normalize) == (word |> prep |> normalize) &&  (prep a /= prep word))
    
