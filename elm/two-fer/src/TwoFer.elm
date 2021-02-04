module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    --Debug.todo "Please implement this function"
    "One for " ++ Maybe.withDefault "you" name ++ ", one for me."
