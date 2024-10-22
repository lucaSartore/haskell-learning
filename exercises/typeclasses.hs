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

n1 :: Int
n1 = 10
main = sumAndPrint n1 n1
