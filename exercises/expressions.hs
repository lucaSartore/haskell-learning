class Expression e where
    eval :: e -> Constant

data Constant = Real Float | NaN deriving Show
instance Expression Constant where
    eval e = e

data Operator = Mul | Div | Sum | Sub
data OperatorExpression l r = Exp{op :: Operator, left :: l, right :: r}

instance (Expression l, Expression r) => Expression (OperatorExpression l r) where
    eval e = let
           l = eval $ left e 
           r = eval $ right e 
           o = op e
           helper :: Operator -> Constant -> Constant -> Constant
           helper _ NaN _ = NaN
           helper _ _ NaN = NaN
           helper Div _ (Real 0.0) = NaN
           helper Mul (Real l) (Real r) = Real $ l * r
           helper Div (Real l) (Real r) = Real $ l / r
           helper Sum (Real l) (Real r) = Real $ l + r
           helper Sub (Real l) (Real r) = Real $ l - r
        in
            helper o l r

main = print $ eval $ Exp Mul (Real 4) (Exp Div (Real 3) (Real 0))
