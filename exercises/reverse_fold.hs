-- write a function rev that reverse a list (using only a fold)

rev :: [a] -> [a]
rev = foldl (\xs x -> x:xs) []

rev2 :: [a] -> [a]
rev2 = foldr (\x xs -> xs ++ [x]) []

main = print $ rev2 [1,2,3,4,5]
