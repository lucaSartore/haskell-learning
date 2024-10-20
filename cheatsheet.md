
# Basics

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
```
