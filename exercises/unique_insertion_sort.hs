isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = ins x (isort xs)

ins :: Int -> [Int] -> [Int]
ins a [] = [a]
ins a (x:xs)
 | a == x = a:xs
 | a < x = a:x:xs
 | otherwise = x:ins a xs

unsorted = [5,4,3,2,1,33,23,34,1234,1,5,3,4,12,22,232]
sorted = isort unsorted
main = print sorted
