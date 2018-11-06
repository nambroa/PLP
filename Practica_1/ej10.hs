-- I) Redefinir usando foldr las funciones sum, elem, (++), filter y map. 
-- Le cambio los nombres para que no me los confunda con las funciones de Haskell y me deje correr en el main.

sum2 xs = foldr (+) 0 xs

elem2 y xs = foldr (\x acc -> if x==y then True else acc) False xs

concatenarListas :: [a] -> [a] -> [a]
concatenarListas xs ys = foldr (\x acc -> x:acc) ys xs

filtrar :: (a->Bool) -> [a] -> [a]
filtrar f xs = foldr (\x acc -> if f(x) then x:acc else acc) [] xs

mapear :: (a->b) -> [a] -> [b]
mapear f xs = foldr (\x acc -> f(x):acc) [] xs

-- II) Definir la función mejorSegún :: (a -> a -> Bool) -> [a] -> a, que devuelve el máximo elemento
-- de la lista según una función de comparación, utilizando foldr1. Por ejemplo, maximum = mejorSegún (>).

mejorSegun :: (a->a->Bool) -> [a] -> a
mejorSegun f xs = foldr1 (\x acc -> if f x acc then x else acc) xs

-- III) Definir la función sumaAlt, que realiza la suma alternada de los elementos de una lista. Es decir, da como
-- resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar foldr.

-- Implementacion sin foldr
sumaAlternada :: Num n => [n] -> n
sumaAlternada [] = 0
sumaAlternada [x] = x
sumaAlternada (x1:x2:t) = x1 - x2 + sumaAlternada t

-- 
-- Implementacion con foldr
sumaAlt :: Num n => [n] -> n
sumaAlt xs = foldr (\x acc -> x-acc) 0 xs

-- IV) Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo,
-- etc.). Pensar qué esquema de recursión conviene usar en este caso.

sumaAltAlReves :: Num n => [n] -> n
sumaAltAlReves xs = foldr (\x acc -> x-acc) 0 (reverse xs)

-- V). Definir la función permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus permutacio-
-- nes. Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y también take y drop.

-- dada una lista xs, devuelve todas las maneras posibles de partirla en dos sublistas xs 1 y xs 2 tales que xs 1 ++ xs 2 == xs.
-- partir [1, 2, 3] → [([], [1, 2, 3]),([1], [2, 3]), ([1, 2], [3]), ([1, 2, 3], [])]
partir :: [a] -> [([a], [a])]
partir xs = [(take i xs, drop i xs) | i<-[0..(length xs)]]

permutaciones :: [a] -> [[a]]
permutaciones = foldr
	(\x acc -> concatMap(agregarEnTodasLasPosiciones x) acc) [[]]
	where agregarEnTodasLasPosiciones j js = 
		[(fst h)++[j]++(snd h) | h <- (partir js)]

 
main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("La sumatoria de [1,2,3] deberia ser 6 y es:")
	print(sum2([1,2,3]))
	print ("El elemento 1 esta presente en [1,2,3], asi que elem es True:")
	print(elem2 1 [1,2,3])
	print ("[1,2] ++ [3,4] deberia ser [1,2,3,4]:")
	print(concatenarListas [1,2] [3,4])
	print("Filtrar [1,2,3,4,5] por pares me deberia dar [2,4]")
	print(filtrar (\x -> x `mod` 2 == 0) [1,2,3,4,5])
	print("Sumar 1 a cada elemento de [1,2,3,4,5] deberia dar [2,3,4,5,6]")
	print(mapear ((+) 1) [1,2,3,4,5])
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("El maximo de [1,2,3,4] deberia ser 4:")
	print(mejorSegun (>) [1,2,3,4])
	print("--------------------------- TESTEANDO PUNTO III ---------------------------")
	print("La suma alternada de [4,3,100,2] deberia dar 99:")
	print(sumaAlt [4,3,100,2])
	print("--------------------------- TESTEANDO PUNTO IV ---------------------------")
	print("La suma alternada al reves de [4,3,100,2] deberia dar -99:")
	print(sumaAltAlReves [4,3,100,2])


