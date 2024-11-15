-- file that ask for user input
-- user can insert as many words as he wants, after each one he press enter
-- when the user is done inserting worlds he can pres enter twice in a row, and he will be prompted to insert a file name
-- the program will then open the selected file, and search for the specified words
-- the program then print which words he has found and which he didn't (starting from the found one first)
-- the search must be not case-sensitive


-- readFile :: FilePath -> IO String
-- putStr :: String -> Io ()
-- putStrLn :: String -> Io ()
-- getLine :: IO String
import System.IO

-- note use at the beginning hSetBiffer

main :: IO ()
main = do
    -- no buffering of stdout (so that i don't need to flush the buffer)
    hSetBuffering stdout NoBuffering

    print "hello word"
