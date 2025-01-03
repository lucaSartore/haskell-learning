import Data.Either

type Number = Either Float String
type Operation = Number -> Number -> Number

division :: Operation
division (Left a) (Left 0) = Right "division by zero"
division (Left a) (Left b) = Left $ a/b
division (Right a) b = Right $ "impossible to execute division because left value is error: " ++ a
division a (Right b) = Right $ "impossible to execute division because right value is error: " ++ b


createOperation :: String -> (Float -> Float -> Float) -> Operation
createOperation name operation = op
    where
        op :: Operation
        op (Left a) (Left b) = Left $ operation a b
        op (Right a) b = Right $ "impossible to execute " ++ name ++ " because left value is error: " ++ a
        op a (Right b) = Right $ "impossible to execute " ++ name ++ " because right value is error: " ++ b

multiplication = createOperation "multiplication" (*)
addition = createOperation "addition" (+)
subtraction = createOperation "subtraction" (-)

main = do
    let result = addition (Left 10.0) (division (Left 100) (Left 0))
    print result
