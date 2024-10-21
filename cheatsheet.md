
# Basics


## function and types
```haskell
-- type declaration (for function)
inRange :: Integer -> Integer -> Integer -> Bool
-- function with let
inRange val max min =
    let higher = val >= max
        lower  = val <= min
    in
    lower && higher

-- alternative with where
inRange2 val max min = lower && higher
    where
        higher = val >= max
        lower  = val <= min


-- if else syntax
max v1 v2 = if v1>v2 then v1 else v2


-- function can be put in the middle of two args

max 3 2 -- these 3 are equivalent
3 `max` 3
```


## recursion
```haskell
-- option 1: guards
factorial n
  | n <= 1 = 1
  | otherwise = n * factorial n - 1

-- option 2: patter matching
-- the function is defined partially and all the different functions are stitched together
not False = True
not True = False

-- advanced example:
-- in this case the function is written as a tail recursive function
-- this means compiler can "unwind" the recursion and make it faster
factorial2 n = aux n 1
  where
    aux n acc
      | n < 1 = acc
      | otherwise = aux (n - 1) (n * acc)

```


## list
```haskell

-- creation
a = [1, 2, 3]

-- pre-pend operator
b = 1 : [2,3]

-- utility functions
-- (import Data.List required)
one = head [1,2,3]
three = last [1,2,3]
twoAndThree  = tail [1,2,3]
oneAndTwo = init [1,2,3]
two = length [1,2]
isEmpty = null [1,2]

-- "iter map"... Kind of
--   VVVVVV Map   VVVVVV list       VVV filter conidtion
x1 = [ x * 2 | x <- [1,2,3,4,5,6,7], even x]

-- multiple lists
-- note: this is a "cross product" of the two lists, not a "Zip"
x2 = [(x,y) | x <- [1,2,3,4], y <- ["a","b","b"]]

-- pattern matching on lists
sumlist :: [Int] -> Int
sumlist [] = 0
-- x is first element, xs is the rest of the list
sumlist (x:xs) = x + sumlist xs
```

## tuples
```haskell
-- unpack tuple
(x,y) = (1,2)

-- pattern matching on tuple (rust like)
tuplefunc :: (Bool, Bool) -> String
tuplefunc (True, _) = "first one is true"
tuplefunc (True, False) = "WARNING: this pattern will never be reached"
tuplefunc (False, False) = "they are bouth false"
tuplefunc (False, True) = "only second one is true"

```

## higher order functions
```haskell

-- lambda functions:
lambda = (\x y -> x + y)

-- std higher order functions
map (\x -> x+1) [1,2,3,4]
filter (\x -> even x) [1,2,3,4]

```




## function operators
```haskell
-- these 3 definitions are equivalent
map2d :: (a->b) -> [[a]] -> [[b]]
map2d = map . map
map2d2 = \f -> map (map f)
map2d3 = \f x -> map (map f) x


-- $ operator to clean code from parenthesis
summOne = map (1+)
p1 = print ( summOne (summOne (summOne [1,2,3,4])))
p2 = print $ summOne $ summOne $ summOne [1,2,3,4]
```

## type definition
```haskell
data List e = 
    Null | Node e (List e) 
```
