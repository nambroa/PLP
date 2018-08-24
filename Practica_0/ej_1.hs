-- null
-- Tipo: [a] -> Bool
-- Comportamiento: Devuelve True si una lista está vacía, caso contrario False.
-- Ejemplos: null[] = True, null[1,2,3] = False

-- head
-- Tipo : [a] -> a
-- Comportamiento: Devuelve el primer ítem de una lista.
-- Ejemplos: head[1,2,3] = 1, head "Hello" = 'H'

-- tail
-- Tipo : [a] -> a
-- Comportamiento: Devuelve la misma lista pero sin el primer ítem.
-- Ejemplos: tail[1,2,3] = [2,3], head "Hello" = "ello"

-- init
-- Tipo : [a] -> [a]
-- Comportamiento: Devuelve la misma lista pero sin el último ítem.
-- Ejemplos: init[1,2,3] = [1,2], head "Hello" = "Hell"

-- last
-- Tipo : [a] -> [a]
-- Comportamiento: Devuelve el último ítem de una lista.
-- Ejemplos: last[1,2,3] = 3, last "Hello" = 'o'

-- take
-- Tipo : Int -> [a] -> [a]
-- Comportamiento: Crea una nueva lista de #elementos = primer parámetro desde el primer ítem de la lista (segundo parámetro) en adelante.
-- Ejemplos: take 5 [1,2,3,4,5,6,7] = [1,2,3,4,5], take 5 "Hellomon" = "Hello", take 6 (cycle [1,2,3]) = [1,2,3,1,2,3], take 4 (repeat 3) = [3,3,3,3], take 5 (iterate (2*) 1) = [1,2,4,8,16]

-- drop
-- Tipo: Int -> [a] - > [a]
-- Comportamiento: Te devuelve todos los elementos de la lista (segundo parámetro) excepto los primeros #(primer parámetro)elementos.
-- Ejemplos: drop 6 "milk - legendary stuff" = " legendary stuff"

-- ++
-- Tipo [a] -> [a] -> [a]
-- Comportamiento: El concatenador de listas. Añade una lista (segundo parámetro) al final de otra lista (primer parámetro).
-- Ejemplos: "Hola" ++ " Que Tal" = "Hola Que Tal"

-- concat
-- Tipo [[a]] -> [a]
-- Comportamiento: Acepta una lista de listas y las concatena.
-- Ejemplos: concat[[1,2,3], [1,2,3]] = [1,2,3,1,2,3]

-- map
-- Tipo (a -> b) -> [a] -> [b]
-- Comportamiento: Toma una función que pasa elementos de "a" a elemnentos de "b" y una lista de elementos de "a". Devuelve una lista de elementos de "b",
-- correspondiente a la lista anterior de "a" con la función aplicada a todos sus elementos.


-- concatMap
-- Tipo (a -> [b]) -> [a] -> [b]
-- Comportamiento: como concat y map compuestos. Mapea una funcion sobre una lista y concatena los resultados. La diferencia con map es que no te devuelve una lista!
-- Ejemplos: concatMap (++"! ") ["one", "two", "three"] = "one! two! three! " es lo mismo que concat $ map (++"! ") ["one", "two", "three"] = "one! two! three! "

-- !!
-- Tipo [a] -> a -> a
-- Comportamiento: Devuelve el elemento de la lista en el índice (segundo parámetro). Los índices arrancan desde 0
-- Ejemplos: [1,2,3]!!1 = 1

-- elem
-- Tipo Eq a => a -> [a] -> Bool
-- Comportamiento: Devuelve True si la lista contiene un ítem igual al primer parámetro. Esto sólo sirve para los tipos que tienen Deriving Eq, osea que se sabe cuando son iguales.
-- Ejemplos: elem 1 [1,2,3,4,5] = True, elem 14 [1..10] = False, elem 

-- :
-- Ejemplo = x:xs
-- Comportamiento: Returns a list which has x as first element, followed by all elements in xs.


