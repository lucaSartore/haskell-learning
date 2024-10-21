import Distribution.License (License(BSD4))
-- prefixes [1,2,3] => [[1],[1,2],[1,2,3]


addOne ::  a -> [[a]] -> [a]
addOne x [] = [x]
addOne x xs = last xs ++ [x]

prefixes :: [a] -> [[a]]
prefixes = foldl (\b a -> b ++ [addOne a b])  []

main = print $ prefixes [1,2,3,4]
