import Debug.Trace (trace)

main :: IO()
main = do
    print [2..100]
    print(map is_prime [2..100])

is_prime :: Integer -> Bool
is_prime num = -- trace (show is_not_divided)  -- printデバッグ
               and_ is_not_divided
    where
        div_nums = [2..num-1]
        is_not_divided = map (\n -> mod num n /= 0) div_nums

-- and_ :: [Bool] -> Bool
-- and_ [] = True
-- and_ (x:xs) = x && and_ xs  -- 再帰関数でreduceを実現

and_ :: [Bool] -> Bool
and_ list = foldr (&&) True list  -- reduceに相当
