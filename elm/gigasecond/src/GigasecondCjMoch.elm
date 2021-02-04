module GigasecondCjMoch exposing (add)

import Date exposing (..)
import Time

add : Date -> Date
add date =
  toTime date + 1000000000000
  |> fromTime