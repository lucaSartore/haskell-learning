import System.Random

data  Tree a = Tree {left :: Tree a, right :: Tree a, value :: a} | None 
    deriving Show

insert :: (Ord a) => Tree a -> a -> Tree a
insert None v = Tree None None v
insert Tree{left, right, value} to_insert
    | to_insert > value = Tree left (insert right to_insert) value
    | otherwise = Tree (insert left to_insert) right value

inorder :: Tree a -> [a]
inorder None = []
inorder Tree{left,right,value} = inorder left ++ [value] ++ inorder right 


-- try avoiding concatenation for performance reasons
inorder2 :: Tree a -> [a]
inorder2 t = aux t []
    where
        aux :: Tree a -> [a] -> [a]
        aux None v = v
        aux Tree{left,right,value} v = aux left $ value:aux right v



rand :: [Int]
rand = do
    x <- randomIO :: IO Int
    x:rand
-- rand = 1:rand
main = print $ take 10 rand

mains = do
    let tree = None
    -- random <- randomIO :: IO Int

    tree <- pure $ insert tree 1
    -- tree <- pure $ insert tree 4
    -- tree <- pure $ insert tree 1
    -- tree <- pure $ insert tree 8
    -- tree <- pure $ insert tree 3
    -- tree <- pure $ insert tree 2
    -- print $ inorder tree
    print $ inorder tree
