module Sublist exposing (ListComparison(..), sublist)
import Html exposing (a)
import Maybe


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


-- sublist : List a -> List a -> ListComparison
-- sublist alist blist =
--     alist
--     |> List.foldl (\ a b ->

--     ) blist

aa : List a -> List a
aa l =
    l
    |> List.foldr (\ a i -> i) (Maybe.withDefault 0 <| List.head <| List.repeat 4 ' ')