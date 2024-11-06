-- generic tree definition
data Tree a = Tree {left :: Tree a, right :: Tree a, value :: a} | None 
    deriving Show


-- infinite tuple tree

treeBuilder :: Int -> Int -> Tree (Int, Int)
treeBuilder a b = Tree (treeBuilder (a+1) b) (treeBuilder a (b+1)) (a,b)

infiniteTree :: Tree (Int,Int)
infiniteTree = treeBuilder 0 0


cut :: Int -> Tree (Int, Int) -> Tree (Int, Int)
cut 0 t = None
cut n t = Tree (cut (n-1) $ left t) (cut (n-1) $ right t) (value t)


main = print $ cut 2 infiniteTree
