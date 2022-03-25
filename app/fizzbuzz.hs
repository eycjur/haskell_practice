main :: IO ()
main = fizzbuzz 100

fizzbuzz :: Integer -> IO()
fizzbuzz end = print (map calculateMod [1..end])

calculateMod :: Integer -> String
calculateMod num
    | mod num 15 == 0 = "fizzbuzz"
    | mod num 3 == 0 = "fizz"
    | mod num 5 == 0 = "buzz"
    | otherwise = show num
