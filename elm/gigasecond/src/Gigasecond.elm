module Gigasecond exposing (add)
import Time exposing (posixToMillis, millisToPosix)

add : Time.Posix -> Time.Posix
add timestamp = 
    posixToMillis timestamp + (10^12) 
    |> millisToPosix
    