

main =
    do
        putStrLn "Insert a value"
        value <- getLine
        let toPrint = "Here is your value: " ++ value
        putStrLn toPrint
