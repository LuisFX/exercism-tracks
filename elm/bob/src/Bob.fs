module Bob
open System.Text.RegularExpressions

let isQuestion (s: string) = s.Trim().EndsWith('?')
let isYelling (s:string) = Regex.Match(s, "[A-Z]").Success && not(Regex.Match(s, "[a-z]").Success)
let isQuiet (s:string) = s.Trim() = ""
let response (input: string) =
    match (isQuestion input, isYelling input, isQuiet input) with
    | _, _, true -> "Fine. Be that way!"
    | true, false, false -> "Sure."
    | false, true, false -> "Whoa, chill out!"
    | true, true, false -> "Calm down, I know what I'm doing!"
    | _ -> "Whatever."