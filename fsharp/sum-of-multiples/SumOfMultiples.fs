module SumOfMultiples

let rec sumToUpper a upper =
    if a < upper then 0
    elif a % upper = 0 then a + (sumToUpper (a+1) upper)

sumToUpper 3 7
    
let sum (numbers: int list) (upperBound: int): int =
    let numbersToAdd = 
        numbers
        |> List.map(fun n ->
            match isMultipleOfNumber 
        )


let rec sumN x =
    if x = 0 
    then
        printfn "x = 0: x=%A" x 
        0 
    else
        printfn "x <> 0: x=%A" x
        x + sumN(x-1)
printfn "The sum of first 5 itegers is- %A" (sumN 5)