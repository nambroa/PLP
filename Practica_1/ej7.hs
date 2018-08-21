-- Escribir la función listasQueSuman :: Int -> [[Int]] que, dado un número natural n, devuelve todas las listas
-- de enteros positivos (>=1) cuya suma sea n. Se permite usar recursión explícita.

listasQueSuman :: Int -> [ [Int] ]
listasQueSuman 0 = [[]]
listasQueSuman n = [(x:xs) | x<-[1..n], xs<-listasQueSuman (n-x)]

main = print(listasQueSuman(5))