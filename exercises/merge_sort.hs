split xs = (a,b)
    where
        half = length xs `div` 2
        a = take half xs
        b = drop half xs

merge :: [Int] -> [Int] -> [Int] -> [Int]
merge [] [] result = result
merge [] b result = result ++ b
merge a [] result = result ++ a
merge (xa:xsa) (xb:xsb) result = minv :merge a2 b2 result
    where
        a2 = if xa < xb then xsa else xa:xsa 
        b2 = if xa >= xb then xsb else xb:xsb
        minv = min xa xb

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [a] = [a]
-- mergeSort [a,b] = if a <= b then [a, b] else [b, a]
mergeSort xs = merge a2 b2 []
    where
        (a,b) = split xs
        a2 = mergeSort a
        b2 = mergeSort b

unsorted = [5,4,3,2,1,33,23,34,1234,12,22,232]
sorted = mergeSort unsorted
main = print sorted

