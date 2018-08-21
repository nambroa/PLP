-- add receives two integers (Integer -> Integer) and returns one integer (-> Integer)
aadd:: Integer -> Integer -> Integer
add x y = x + y

main = do
	putStrLn "The addition of two numbers is:"
	print(add 2 5) --calling a function