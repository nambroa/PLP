-- tupleAdd receives two integers AS A TUPLE(Integer, Integer) and returns one integer (-> Integer)

tupleAdd:: (Integer,Integer) -> Integer
tupleAdd (x,y) = x + y

main = do
	putStrLn "The addition of two numbers is:"
	print(tupleAdd (2,5)) 