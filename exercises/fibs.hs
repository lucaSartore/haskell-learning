
fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)




main = print $ take 10 fibs
-- node: zip dose not necessary require args of the same length
-- main = print $ zipWith (+) [1,1,2,3,4,5] [1,2,3,4,5]
