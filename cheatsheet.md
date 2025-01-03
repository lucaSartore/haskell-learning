
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
-- unamed type
data List e = 
    Null | Node e (List e) 

-- named type (record)
data Person = Person {name :: String, age:: Int} 

-- functions to get parameters are automatically defined
person = Person "jonny" 25
jonny = name person
```


## typeclasses
```haskell
-- basic type class definition
class MyShowBasic a where
    myPrintBasic :: a -> IO()
-- definition with inheritance
class Show a => MyShow a where
    myPrint :: a -> IO()

-- implementation of a type class
instance MyShow Int where  
    myPrint a =  print a

-- deriving a type class
data Color = HSV Int Int Int | RGB Int Int Int
 deriving (Show, Eq)

-- method that take as input a type class
sumAndPrint :: (Num a, MyShow a) => a -> a -> IO()
sumAndPrint a b = print $ a + b
```

## IO operations
```haskell
main =
    do
        putStrLn "Insert a value"
        value <- getLine
        let toPrint = "Here is your value: " ++ value
        putStrLn toPrint
```

## type, newtime and data

you already know how `data` works

the `type` can create a type alias:

```haskell
type UserId = Int
```
Note that this is not "strictly" typed checked (an Int can be automatically casted to UserId).

instead the `newtype` keyword has strict type checking
```haskell
newtype UserId = Int
```
at run time type and new-time are the same, the difference is only at compile time.


## Either
``` haskell
-- how to import
import Data.Either

-- how is defined
data Either a b = Left a | Rigth b

-- some functions
lefts :: [Either a b] -> [a]
rights :: [Either a b] -> [b]

isLeft :: Either a b -> Bool
isRight :: Either a b -> Bool


fromLeft :: a -> Either a b -> a
fromRight:: b -> Either a b -> b
--         ^^^ default parameter (aka unwrap or)

either :: (a -> c) -> (b -> c) -> Either a b -> c
--          ^^^ function to apply in the case of a
--                      ^^^ function to apply in the case of b

```
