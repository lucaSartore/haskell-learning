-- the function fun should:
--  - take a list of integer
--  - multiply by 3 every item
--  - filter out odd numbers
--  - calculate the sum
fun :: [Int] -> Int
fun = sum . filter even . map (*3)

main = (print . fun) [1,2,3,4,5,6]
