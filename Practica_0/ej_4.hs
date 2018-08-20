-- Elimina todas las apariciones de cualquier carácter de la primera cadena en la segunda.
-- EJ: Limpiar 'susto' 'puerta' = 'pera'
--limpiar :: String -> String -> String

limpiar :: String -> String -> String
limpiar xs ys = [ y | y <- ys, not (y `elem` xs) ]

promedio :: [Float] -> Float
promedio xs = (sum xs / fromIntegral longitud_de_la_lista :: Float)
	where longitud_de_la_lista = length(xs)

-- Dada una lista de números devuelve la diferencia de cada uno con el promedio general.
-- EJ: difPromedio [2,3,4] = [-1, 0, 1] = [(2-3), (3-3), (4-3)]  		

difPromedio :: [Float] -> [Float]
difPromedio xs = [x-promedio(xs) | x <- xs]

-- Indica si una lista de enteros tiene todos sus números iguales.
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [xs] = True
todosIguales xs = (xs !! 0 == xs !! 1) && todosIguales(tail(xs))

main = do
	putStrLn("---------------- Probando Limpiar ----------------")
	putStrLn("Limpiar 'susto' de 'puerta' debería resultar en 'pera': ")
	print(limpiar "susto" "puerta")
	putStrLn("---------------- Probando difPromedio ----------------")
	putStrLn("difPromedio de [2,3,4] debería ser [-1.0, 0.0, 1.0]: ")
	print(difPromedio[2,3,4])
	putStrLn("---------------- Probando todosIguales ----------------")
	putStrLn("todosIguales de [1,2] debería ser False: ")
	print(todosIguales[1,2])
	putStrLn("todosIguales de [5,6,7] debería ser False: ")
	print(todosIguales[5,6,7])
	putStrLn("todosIguales de [1,1,1] debería ser True: ")
	print(todosIguales[1,1,1])

