module BobLfx2 exposing (hey)
import String exposing (toUpper, trim, isEmpty, any, endsWith)
import Char exposing (isAlpha)

isShouting s = (s |> any isAlpha) && (s == (s |> toUpper))
isQuery = endsWith "?"
hey =
    trim
    >> (\ a ->
        if a |> isEmpty then "Fine. Be that way!"
        else if (a |> isShouting) && (a |> isQuery) then "Calm down, I know what I'm doing!"
        else if a |> isShouting then "Whoa, chill out!"
        else if a |> isQuery then "Sure."
        else "Whatever."
    )
