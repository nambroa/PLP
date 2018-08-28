-- I) Escribir la función sumaMat, que representa la suma de matrices, usando zipWith. Representaremos una
-- matriz como la lista de sus filas. Esto quiere decir que cada matriz será una lista finita de listas finitas,
-- todas de la misma longitud, con elementos enteros. Recordamos que la suma de matrices se define como
-- la suma celda a celda. Asumir que las dos matrices a sumar están bien formadas y tienen las mismas dimensiones.

-- Ejemplo de matriz = [[1,2,3],[4,5,6],[7,8,9]]
-- Representa una matriz de 3x3 que se ve de la siguiente forma:
-- |1 2 3|
-- |4 5 6| 
-- |7 8 9|
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat [] [] = []
sumaMat (x:xs) (y:ys) = [zipWith (+) x y] ++ sumaMat xs ys


-- II) Escribir la función trasponer, que, dada una matriz como las del item i, devuelva su traspuesta. Es decir,
-- en la posición i, j del resultado está el contenido de la posición j, i de la matriz original. Notar que si la
-- entrada es una lista de N listas, todas de longitud M, entonces el resultado debe tener M listas, todas de
-- longitud N.

agarrarElIesimoDeCadaLista :: [[Int]] -> Int -> [Int]
agarrarElIesimoDeCadaLista [] i = []
agarrarElIesimoDeCadaLista (x:xs) i = [x!!i] ++ agarrarElIesimoDeCadaLista xs i

trasponer :: [[Int]] -> [[Int]]
trasponer [[]] = [[]]
trasponer (x:xs) = [agarrarElIesimoDeCadaLista (x:xs) i | i<-[0..length(x)-1]]

main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("sumaMat [[1,2,3],[4,5,6]] [[7,8,9],[10,11,12]] deberia dar [[8,10,12],[14,16,18]]:")
	print(sumaMat [[1,2,3],[4,5,6]] [[7,8,9],[10,11,12]])
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("trasponer [[1,2,3],[4,5,6],[7,8,9]]deberia dar [[1,4,7],[2,5,8],[3,6,9]]:")
	print(trasponer[[1,2,3],[4,5,6],[7,8,9]])
