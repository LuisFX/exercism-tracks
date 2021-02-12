module SpaceAge exposing (Planet(..), ageOn)

type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


secondsToAge : Float -> Float -> Float
secondsToAge planetFraction seconds =
    let
        secondsInEarthYear : Float
        secondsInEarthYear = 31536000.00 

    in
         abs (seconds / (secondsInEarthYear * planetFraction))

ageOn : Planet -> Float -> Float
ageOn planet seconds =
    case planet of
        Mercury -> secondsToAge 0.2408467 seconds
        Venus -> secondsToAge 0.61519726 seconds
        Earth -> secondsToAge 1.0 seconds
        Mars -> secondsToAge 1.8808158 seconds
        Jupiter -> secondsToAge 11.862615 seconds
        Saturn -> secondsToAge 29.447498 seconds
        Uranus -> secondsToAge 84.016846 seconds
        Neptune -> secondsToAge 164.79132 seconds


-- Given an age in seconds, calculate how old someone would be on:

-- Mercury: orbital period 0.2408467 Earth years
-- Venus: orbital period 0.61519726 Earth years
-- Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
-- Mars: orbital period 1.8808158 Earth years
-- Jupiter: orbital period 11.862615 Earth years
-- Saturn: orbital period 29.447498 Earth years
-- Uranus: orbital period 84.016846 Earth years
-- Neptune: orbital period 164.79132 Earth years
-- So if you were told someone were 1,000,000,000 seconds old, you should be able to say that they're 31.69 Earth-years old.