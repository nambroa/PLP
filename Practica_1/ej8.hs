-- Definir en Haskell una lista que contenga todas las listas finitas de enteros positivos
-- (es decir, con elementos mayores o iguales que 1)

listasQueSuman :: Int -> [ [Int] ]
listasQueSuman 0 = [[]]
listasQueSuman n = [(x:xs) | x<-[1..n], xs<-listasQueSuman (n-x)]

todasLasListasFinitas :: [[Int]]
todasLasListasFinitas = concat [listasQueSuman(n) | n<-[1..]] 

main = print(todasLasListasFinitas)