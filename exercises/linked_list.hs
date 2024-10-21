data List e =
    Nil | Node e (List e)

pushFront :: List e -> e -> List e
pushFront list new = Node new list

popFront :: List e -> List e
popFront Nil = Nil
popFront (Node _ list) = list

pushBack :: List e -> e -> List e
pushBack Nil e = Node e Nil
pushBack (Node x next) e = Node x $ pushBack next e

popBack :: List e -> List e 
popBack Nil = Nil
popBack (Node _ Nil) = Nil
popBack (Node x next) = Node x $ popBack next

toArray :: List e -> [e]
toArray Nil = []
toArray (Node e list) = e:toArray list

x1 :: List Int
x1 = Nil
x2 = pushBack x1 1
x3 = pushBack x2 2
x4 = pushBack x3 3
x5 = pushFront x4 100
x6 = pushFront x5 999
x7 = pushBack x6 999
x8 = popBack x7
x9 = popFront x8

main = print $ toArray x9
