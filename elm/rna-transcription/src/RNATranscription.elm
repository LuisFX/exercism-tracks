module RNATranscription exposing (toRNA)
import String exposing (toList)
import List exposing (head)

toRNA : String -> Result String String
toRNA dna =
    dna
    |> String.foldl (\ c acc ->
        case acc of
            Ok accum ->
                case Char.toUpper c of
                    'G' -> Ok (accum ++ "C")
                    'C' -> Ok (accum ++ "G")
                    'T' -> Ok (accum ++ "A")
                    'A' -> Ok (accum ++ "U")
                    _ -> Err "Invalid DNA"
            Err e -> Err e
    ) (Ok "")

charToRTN : Char -> Result Char Char
charToRTN c = Err c

toRNA2 : String -> Result Char String
toRNA2 dna =
    case String.uncons dna of
        Nothing -> Ok ""
        Just (head, tail) -> 
            Result.map2 String.cons (charToRTN head) (toRNA2 tail)
