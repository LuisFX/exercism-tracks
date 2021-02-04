module TransposeLeojpod exposing (transpose)

transpose : List String -> List String
transpose =
    -- this is one of the few times where it makes more sense to start by the end of the list
    List.foldr
        (\row transposed ->
            -- start by adding as many spaces as required to fill the gaps
            String.padRight (List.length transposed) ' ' row
                --  transform that into a list of Char
                |> String.toList
                -- now "zip" the new column at the begining of each of the existing ones
                |> List.map2
                    (\transposedRow rowChar ->
                        String.cons rowChar transposedRow
                    )
                    -- add some empty string to start things of else the map2 will drop all the elements that are beyond the current length of transposed rows
                    (List.repeat (String.length row - List.length transposed) "" |> (++) transposed)
        )
        []