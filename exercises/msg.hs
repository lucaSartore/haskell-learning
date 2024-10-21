-- Given a sequence of positive and negative integers define a function msg which
-- returns the minimum of the sums of all the possible segments of its argument.

msg2 :: [Int] -> Int -> Int -> Int -> Int
msg2 [] _ maxSoFar _ = maxSoFar
msg2 (x:xs) cumulate maxSoFar minCumulateSoFar = msg2 xs newCumulate newMaxSoFar newCumulateMin 
    where
        newCumulate = cumulate + x
        newCumulateMin = min newCumulate minCumulateSoFar
        newMaxSoFar = max maxSoFar (newCumulate - newCumulateMin)

msg :: [Int] -> Int
msg x = msg2 x 0 0 0

main = print (msg [1,-3,4,2,-5,3,4])
