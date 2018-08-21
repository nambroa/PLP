-- Definir pares :: [(Int, Int)], una lista (infinita) que contenga todos los pares de números naturales (sin repetir).
-- NOTA: Cambiar [1..50] por [1..] para que sea infinita, tomar en cuenta que no va a terminar y se va a colgar.
pares = [(x,x+1) | x<-[1..50], (x `mod` 2 /= 0)] 

-- triplas :: [(Int, Int, Int)], una lista (infinita) que contenga todas las triplas de números naturales (sin repetir).
-- NOTA: Cambiar los [1..50] por [1..] para que sea infinita, tomar en cuenta que no va a terminar y se va a colgar.
numeroCadaTres :: Int->Int
numeroCadaTres x = x+3

numerosCadaTres = 1 : sucesioncadaTresMasUno
				  where sucesioncadaTresMasUno = (map (+1) [x | x<-[1..50], (x `mod` 3) == 0])

triplas = [(x,x+1,x+2) | x<-numerosCadaTres]

-- Definir listasQueSuman :: Int -> [[Int]] que, dado un número natural n, devuelve todas las listas de enteros mayores o 
-- iguales que 1 cuya suma sea n.
-- NOTA: Cambiar los [1..50] por [1..] para que sea infinita, tomar en cuenta que no va a terminar y se va a colgar.
listasQueSuman :: Int -> [[Int]]
listasQueSuman 1 = [[1]]
listasQueSuman n = [x:xs | x<-[1..n], xs<-listasQueSuman(n-x)]

-- Definir listasPositivas :: [[Int]], que contenga todas las listas finitas de enteros mayores o iguales que 1.
-- NOTA: Cambiar los [1..9] por [1..] para que sea infinita, tomar en cuenta que no va a terminar y se va a colgar.

listasPositivas :: [[Int]]
listasPositivas = concat [listasQueSuman(i) | i <-[1..9]]

-- Definir negar :: [[Char]] -> [[Char]] que, daa una lista de palabras, le agrega "in" adelante a todas.
-- No usar recursión explícita. Ejemplo: negar["util", "creible"] = ["inutil", "increible"]

negar :: [[Char]] -> [[Char]]
negar xs = map ("in" ++) xs

-- Definir sinVacias :: [[a]] -> [[a]] que, dada una lista de listas, devuelve las que no son vacías (en el mismo órden!)
-- No usar recursión explícita

sinVacias :: [[a]] -> [[a]]
sinVacias xs = filter (not . null) xs
-- Otra implementación, mas linda en mi opinión (odio la composición).
-- sinVacias xs = [ x | x <- xs , not (null x) ]

main = print(sinVacias[[1], []])