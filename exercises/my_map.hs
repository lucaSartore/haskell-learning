mymap :: ( a -> b) -> [a] -> [b]
mymap _ [] = []
mymap f (x:xs) = f x : mymap f xs


main = print (mymap (\x -> 2*x) [1,2,3,4])
