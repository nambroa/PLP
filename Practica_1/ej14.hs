-- Definir las siguientes funciones para trabajar sobre listas, y dar su tipo. Todas ellas deben poder aplicarse a listas finitas e infinitas.

-- I) mapPares, una versión de map que toma una función currificada de dos argumentos y una lista de pares
-- de valores, y devuelve la lista de aplicaciones de la función a cada par. Pista: recordar curry y uncurry.

mapPares :: (a->b->c)->[(a,b)]->[c]
mapPares f [] = []
mapPares f xs = map (uncurry f) xs

-- II) armarPares, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento
-- correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra,
-- ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en
-- Haskell se llama zip. Pista: aprovechar la currificación y utilizar evaluación parcial.

armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] ys = []
armarPares xs [] = []
armarPares (x:xs) (y:ys) = [(x,y)] ++ armarPares xs ys

-- III) mapDoble, una variante de mapPares, que toma una función currificada de dos argumentos y dos listas
-- (de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de
-- las dos listas. Esta función en Haskell se llama zipWith.

mapDoble :: (a->b->c) -> [a] -> [b] -> [c]
mapDoble f [] [] = []
mapDoble f xs ys = mapPares f listaDePares
				   where listaDePares = armarPares xs ys 

main = do
	let sumar = \x y ->x+y
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("mapPares sumar [(2,6),(3,7),(4,8)] deberia dar [8,10,12]:")
	print(mapPares sumar [(2,6),(3,7),(4,8)])
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("armarPares [2,3,4] [6,7,8] deberia dar [(2,6),(3,7),(4,8)]:")
	print(armarPares [2,3,4] [6,7,8])
	print("--------------------------- TESTEANDO PUNTO III ---------------------------")
	print("mapDoble sumar [2,3,4] [6,7,8] deberia dar [8,10,12]:")
	print(mapDoble sumar [2,3,4] [6,7,8])
