-- credit: http://blog.sigfpe.com/2006/08/you-could-have-invented-monads-and.html

f x = (x * 2, "multiplying by two -> ")

g x = (x + 1, "summing one -> ")

bind :: (Int -> (Int, String)) -> ((Int, String) -> (Int, String))
bind f (x, dbg) =
  let (y, dbg2) = f x
   in (y, dbg ++ dbg2)

composed = bind f . g
-- composed_equivalent = \x -> bind f (g x)


unit :: Int -> (Int, String)
unit a = (a, "")

-- make a non debug-able function into one
lift f = unit . f


f2 x = x*2
g2 x = x+1

option_1 = bind (lift f2) . lift g2
option_2 = lift (f2 . g2)

main = do
    putStrLn "composed 3"
    print $ composed 3
    putStrLn "bind unit . f"
    print $ (bind unit . f) 3
    putStrLn "bind f . unit"
    print $ (bind f . unit) 3

