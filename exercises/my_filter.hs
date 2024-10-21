myfilter :: ( a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter f (x:xs)
    | f x = x:myfilter f xs
    | otherwise = myfilter f xs


main = print (myfilter even [1,2,3,4])
