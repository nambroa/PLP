-- Definimos la función generate, que genera listas en base a un predicado y una función, de la siguiente manera:

generate :: ([a] -> Bool) -> ([a] -> a) -> [a]
generate stop next = generateFrom stop next []

generateFrom :: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom stop next xs | stop xs = init xs -- te da la lista pero sin el último ítem.
						  | otherwise = generateFrom stop next (xs ++ [next xs]) -- recursión agregando la lista actual al resultado (como un acumulador)

-- I) Usando generate, definir generateBase::([a] ->Bool) ->a ->(a ->a) ->[a], similar a generate,
-- pero con un caso base para el elemento inicial, y una función que, en lugar de calcular el siguien-
-- te elemento en base a la lista completa, lo calcula solo a partir del último elemento.
-- Por ejemplo:
-- generateBase (\l->not (null l) && (last l > 256)) 1 (*2) es la lista las potencias de 2 menores o iguales que 256.

generateBase :: ([a]->Bool) -> a -> (a->a) -> [a]
generateBase stop x next = generate stop (\xs -> if ((length xs) == 0) then x else (next (last xs)))

-- II) Usando generate, definir factoriales::Int ->[Int], que dado un entero n genera la lista de los primeros n factoriales.

factoriales :: Int ->[Int]
factoriales x = generate (\xs -> if (length xs) > x then True else False) (\xs -> product[1..length(xs)+1])

-- III) Usando generateBase, definir iterateN :: Int -> (a -> a) -> a -> [a] que, toma un entero n, una
-- función f y un elemento inicial x, y devuelve la lista [x, f x, f (f x), ..., f ( ...(f x) ...)] de
-- longitud n. Nota: iterateN n f x = take n (iterate f x).

iterateN :: Int -> (a->a) -> a -> [a]
iterateN n f x = generateBase (\xs -> if (length xs) > n then True else False) x (\y -> f y)

-- IV) Redefinir generateFrom usando iterate y takeWhile.
-- TBD, un pijazo.

main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("Testeando la funcion de ejemplo, deberia dar las potencias de 2 menores o iguales que 256:")
	print(generateBase (\xs->not (null xs) && (last xs > 256)) 1 (*2))
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("Factoriales 4 deberia dar [1,2,6,24]:")
	print(factoriales 4)
	print("--------------------------- TESTEANDO PUNTO III ---------------------------")
	print("IterateN 5 (+ 1) 2 deberia ser [2,3,4,5,6]")
	print(iterateN 5 (+ 1) 2)
	print("--------------------------- TESTEANDO PUNTO IV ---------------------------")
	print("IterateN 5 (+ 1) 2 deberia ser [2,3,4,5,6]")
	print(iterateN 5 (+ 1) 2)

