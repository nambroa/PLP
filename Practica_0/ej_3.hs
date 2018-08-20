
-- Dado un número devuelve su inverso multiplicativo (si está definido), o Nothing en caso contrario
inverso :: Float -> Maybe Float
inverso x
	| x == 0 = Nothing
	| otherwise = Just (1 / x)
--data Either a b = Left a | Right b
-- Dado una expresión booleana o entera, convierte esa expresión a entero. Para los booleanos, 0 para False y 1 para True.
aEntero :: Either Int Bool -> Int
aEntero (Left a) = a
aEntero (Right b) =
	if b == True
		then 1
		else 0

main = do
	putStrLn("---------------- Probando Inverso Multiplicativo ----------------")
	putStrLn ("El valor absoluto de 0 es Nothing: ")
	print(inverso 0)
	putStrLn ("El valor absoluto de 3 es 1/3: ")
	print (inverso 3)
	putStrLn("---------------- Probando aEntero ----------------")
	putStrLn ("El aEntero de Left 3 es 3 : ")
	print(aEntero (Left 3))
	putStrLn ("El aEntero de Right True es 1 : ")
	print (aEntero (Right True))
	putStrLn ("El aEntero de Right False es 0 : ")
	print (aEntero (Right False))
