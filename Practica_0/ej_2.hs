import Debug.Trace
-- Dado una terna, te da el primer número.
primero :: (a, b, c) -> a
primero (x, _, _) = x

-- Dado un número, devuelve su valor absoluto.
valorAbsoluto :: Float -> Float 
valorAbsoluto x | x >= 0 = x
				| x < 0 = -x

diezAbs = valorAbsoluto(10)
menosDiezAbs = valorAbsoluto(-10)

-- Dado un número que representa un año, indica si el mismo es bisiesto. Se repite cada cuatro años, excepto cuando el año acaba en dos ceros.
bisiesto :: Integer -> Bool
bisiesto x
	| x `mod` 100 == 00 = False
	| x `mod` 4 == 0 = True
	| otherwise = False

noBisiesto = bisiesto 1800
siBisiesto = bisiesto 4
siBisiestoDos = bisiesto 2004

-- Dado un entero positivo, computa el factorial.

factorial :: Integer -> Integer
factorial 2 = 2
factorial n | n > 0 = n * factorial(n-1)

factorialDeTres = factorial 3
factorialDeCinco = factorial 5

-- Dado un entero positivo E, devuelve la cantidad de divisores primos. Los números primos poseen la propiedad de sólo ser módulo 0 para ellos mismos.
-- El caso base es 1 ya que ese es primo y divide a todos.
-- Después reviso, si estoy dividiendo mi E por tres, me basta saber si E mod 3 == 0
-- Si estoy dividiendo mi E por otra cosa C, necesito saber si E mod C == 0. Además, saber si es primo, que se puede revisar si C no es "par (mod 2 /= 0) ni impar (mod 3/= 0)".

cantDivisoresPrimos :: Integer -> Integer
cantDivisoresPrimos x = cantDivisoresPrimosAux x x

cantDivisoresPrimosAux :: Integer -> Integer -> Integer
cantDivisoresPrimosAux _ 1 = 1
cantDivisoresPrimosAux x y = 
	if y == 3 && x `mod` y == 0
		then 1 + cantDivisoresPrimosAux x (y-1)
		else if x `mod` y == 0 && y `mod` 2 /= 0 && y `mod` 3 /= 0
			then 1 + cantDivisoresPrimosAux x (y-1)
			else cantDivisoresPrimosAux x (y-1)

main = do
	putStrLn("---------------- Probando Valor Absoluto ----------------")
	putStrLn ("El valor absoluto de 10 es: ")
	print(diezAbs)
	putStrLn ("El valor absoluto de -10 es: ")
	print (menosDiezAbs)
	putStrLn("---------------- Probando Bisiesto ----------------")
	putStrLn ("1800 no es bisiesto porque acaba en dos ceros: ")
	print(noBisiesto)
	putStrLn ("4 y 2004 si son bisiestos porque son módulo 4: ")
	print (siBisiesto)
	print(siBisiestoDos)
	putStrLn("---------------- Probando Factorial ----------------")
	putStrLn ("El factorial de 3 debería ser 6 y es: ")
	print(factorialDeTres)
	putStrLn ("El factorial de 5 debería ser 120 y es:")
	print (factorialDeCinco)
	putStrLn("---------------- Probando Cantidad de Divisores Primos ----------------")
	putStrLn ("La cantidad de divisores primos de 3 debería ser 2 y es: ")
	print( cantDivisoresPrimos 3)
	putStrLn ("La cantidad de divisores primos de 5 debería ser 2 y es: ")
	print( cantDivisoresPrimos 5)
	putStrLn ("La cantidad de divisores primos de 7 debería ser 2 y es: ")
	print( cantDivisoresPrimos 7)
	putStrLn ("La cantidad de divisores primos de 15 debería ser 3 y es: ")
	print( cantDivisoresPrimos 15)


