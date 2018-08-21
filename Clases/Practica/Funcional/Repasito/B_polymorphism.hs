-- identity is a function that returns the same element, so it makes sense to make it agnostic to the data type passed as input.
identity :: a -> a
identity x = x

main = do
	putStrLn("This is a polymorphic function")
	print(identity 8)
	print(identity "a")