class Serializable a where
    serialize :: a -> String

instance Serializable Int where
    serialize = show

data Color = Black | Gray | White

instance Serializable Color where
    serialize Black = "Black"
    serialize Gray = "Gray"
    serialize White = "White"


instance (Serializable a) => Serializable [a] where
    serialize [] = "[]"
    serialize x = "[" ++ init (foldl (\a b -> a ++ serialize b ++ ",") "" x ) ++ "]"

-- main = print $ serialize ( [1,2,3,4] :: [Int] )
main = print $ serialize [Black, Gray, White]

