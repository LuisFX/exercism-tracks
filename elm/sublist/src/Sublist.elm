module Sublist exposing (ListComparison(..), sublist)
import List exposing (..)

type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal

listInList : List a -> List a -> Bool
listInList alist blist =
    if (List.take (List.length blist) alist) == blist then
        True
    else
        if List.length alist >= List.length blist then
            listInList (List.drop 1 alist) blist
        else
            False

-- MY ORIGINAL SOLUTION, I FORGOT ABOUT "DROP", THEREFORE I WAS USING HEAD::TAIL

-- listInList acc alist blist =
--     if (List.take (List.length blist) alist) == blist then
--         True
--     else
--         case alist of
--             [] -> acc
--             _::tail ->
--                 if List.length tail >= List.length blist then
--                     listInList False tail blist
--                 else
--                     False
            

sublist : List a -> List a -> ListComparison
sublist alist blist =
    if alist == blist then
        Equal
    else if List.length alist >= List.length blist && listInList (alist) blist then
        Superlist
    else if listInList (blist) alist then
        Sublist
    else Unequal
    
        