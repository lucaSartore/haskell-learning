-- file that ask for user input
-- user can insert as many words as he wants, after each one he press enter
-- when the user is done inserting worlds he can pres enter twice in a row, and he will be prompted to insert a file name
-- the program will then open the selected file, and search for the specified words
-- the program then print which words he has found and which he didn't (starting from the found one first)
-- the search must be not case-sensitive


-- to run the program in the terminal: runhaskell word_search.hs


-- readFile :: FilePath -> IO String
-- putStr :: String -> Io ()
-- putStrLn :: String -> Io ()
-- getLine :: IO String
import System.IO
import Data.Fixed (E0)
import Language.Haskell.TH (floatPrimL)
import Text.Read (Lexeme(Char))
import Data.Char (ord)
import Data.List (find)
import Data.Maybe (isNothing, isJust)


getSearchWords :: IO [String]
getSearchWords = do
    putStrLn "insert the workds you want to search for: "
    aux
    where
        aux :: IO [String]
        aux = do
            putStr "> "
            hFlush stdout
            word <- getLine
            if word == "" then
                return []
            else do
                v <- aux
                return $ word:v


myFind :: String -> String -> Int
myFind _ "" = -1
myFind "" _ = -1
myFind searchIn searchFor
    | length searchIn < length searchFor = -1
    | searchInBegin == searchFor = 0
    | resultNextSearch == -1 = -1
    | otherwise = resultNextSearch + 1
    where
        (searchInBegin, _) = splitAt (length searchFor) searchIn
        _:searchInMinusOne = searchIn
        resultNextSearch = myFind searchInMinusOne searchFor

splitHelper :: String -> String -> [String]
splitHelper toSplit splitChar
    | start == -1 = [toSplit]
    | end == "" && first == "" = []
    | first == "" = splitHelper end splitChar
    | end == "" = [first]
    | otherwise = first:splitHelper end splitChar
    where
        start = myFind toSplit splitChar
        (first, tmp) = splitAt start toSplit
        (middle, end) = splitAt (length splitChar) tmp



split :: [String] -> [String] -> [String]
split toSplit [] = toSplit
split toSplit (x:xs) = split valuesFlat xs
    where
        helper = flip splitHelper x
        values = map helper toSplit
        valuesFlat = concat values

toLowerCase :: String -> String
toLowerCase = map aux
    where
        aux :: Char -> Char
        aux x
         | x <= 'Z' && x >= 'A' = toEnum (ord x + 32) :: Char
         | otherwise = x


-- findExisting  searchFor -> searchInto -> foundSoFar -> (found, searchForRemaining)
findExisting :: [String] -> [String] -> [String] -> ([String], [String])
findExisting searchFor [] foundSoFar = (foundSoFar, searchFor)
findExisting searchFor (x:xs) foundSoFar
    | not isFound || isAlreadyBeenFound = findExisting searchFor xs foundSoFar
    | otherwise = findExisting searchFor xs (x:foundSoFar)
    where
        isFound = isJust $ find (== x) searchFor
        isAlreadyBeenFound = isJust $ find (==x) foundSoFar


main :: IO ()
main = do
    words <- getSearchWords
    print words
    putStr "Insert the name of the file to search for: "
    hFlush stdout
    fileName <- getLine
    file <- readFile fileName
    let splitted = split [file] [" ","\t","\r\n","\n"]
    splitted <- pure $ map toLowerCase splitted
    words <- pure $ map toLowerCase words
    print splitted
    let (_, found) = findExisting words splitted []
    print found
