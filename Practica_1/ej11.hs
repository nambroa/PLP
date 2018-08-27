-- I) Definir la función partes, que recibe una lista L y devuelve la lista de todas las listas formadas por los
-- mismos elementos de L, en su mismo orden de aparición.
--Ejemplo: partes [5, 1, 2] → [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]] (en algún orden).

-- Por ejemplo, en [1,2], acc arranca [[]]. x sería 2 en el primer paso.
-- Entonces se hace map (2:) [[]], que resulta [[2]]. Luego, se hace [[]] ++ [[2]],
-- resultando en [[], [2]]. Se sigue con x = 1. Acá se tiene map (1:) [[], [2]]
-- lo que resulta en [[1], [1,2]]. A esto se le agrega acc=[[], [2]], terminando en
-- [[], [1], [2], [1,2]]

partes :: [a] -> [[a]]
partes = foldr(\x acc-> acc ++ (map (x:) acc)) [[]]

-- II) Definir la función prefijos, que dada una lista, devuelve todos sus prefijos.
-- Ejemplo: prefijos [5, 1, 2] → [[], [5], [5, 1], [5, 1, 2]]

-- No hace falta usar foldr, simplemente vas tomando los primeros i elementos (cada uno es si o si prefjo).
-- Hasta que no queden más prefijos.

prefijos :: [a] -> [[a]]
prefijos xs = [take i xs | i<-[0..(length xs)]]

-- Definir la función sublistas que, dada una lista, devuelve todas sus sublistas (listas de elementos que
-- aparecen consecutivos en la lista original).
-- Ejemplo: sublistas [5, 1, 2] → [[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]] (en algún orden).

sublistas :: [a] -> [[a]]
sublistas xs = [[]] ++ [take j (drop i xs) | i<-[0..(length xs)], j<-[1..(length xs)-i]]

main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("partes [5, 1, 2] deberia ser [[],[2],[1],[1,2],[5],[5,2],[5,1],[5,1,2]] (en algún orden): ")
	print(partes [5,1,2])
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("prefijos [5, 1, 2] deberia ser [[], [5], [5, 1], [5, 1, 2]]:")
	print(prefijos [5,1,2])
	print("--------------------------- TESTEANDO PUNTO III ---------------------------")
	print("sublistas [5, 1, 2] deberia ser [[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]] (en algún orden):")
	print(sublistas [5,1,2])