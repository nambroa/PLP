-- I)  Definir la función sacarUna :: Eq a => a -> [a] -> [a], que dados un elemento y una lista devuelve el
-- resultado de eliminar de la lista la primera aparición del elemento (si está presente).

-- Básicamente es redefinir base.Data.List.delete

-- El tercer parámetro es lo que recorrí de la lista
sacarUnaAux :: Eq a => a -> [a] -> [a] -> [a]
sacarUnaAux y [] zs = zs
sacarUnaAux y (x:xs) zs = if x == y then zs++xs else sacarUnaAux y xs (zs++[x])

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna y xs = sacarUnaAux y xs []

-- El siguiente esquema captura la recursión primitiva sobre listas.
-- DATO: Esta comentado porque me tira error de parseo, la definición es la de la cátedra y no pude encontrar el motivo.
-- Por esta razón tambien sacarUnaPosta está comentado, ya que utiliza recr.
 --recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
 --recr f z [] = z
 --recr f z (x:xs) = f x xs (recr f z xs)

-- Ahora una definicion de la funcion que usa recr (asumo que es lo que se quiere)
--sacarUnaPosta :: Eq a => a -> [a] -> [a]
--sacarUnaPosta x xs = recr(\y ys rec -> if (x==y) then ys else y:rec) [] xs


-- II) Explicar por qué el esquema foldr no es adecuado para implementar la función sacarUna del punto anterior.

-- Foldr no te deja hacer recursión tomando en cuenta la cola de la lista, sólamente toma en cuenta el caso anterior.
-- Recr toma en cuenta ambo.s

main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("sacarUna(1, [3,2,1,6,1]) deberia devolver [3,2,6,1]:")
	print(sacarUna 1 [3,2,1,6,1])