-------------------------------------------------------- EJERCICIOS INICIALES --------------------------------------------------------------------------

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
-- Nota aparte: Uso interesante de map con lambdas: map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] = [3,8,9,8,7]  

-- Definir sinVacias :: [[a]] -> [[a]] que, dada una lista de listas, devuelve las que no son vacías (en el mismo órden!)
-- No usar recursión explícita

sinVacias :: [[a]] -> [[a]]
sinVacias xs = filter (not . null) xs
-- Otra implementación, mas linda en mi opinión (no me simpatiza demasiado la composición):
-- sinVacias xs = [ x | x <- xs , not (null x) ]

---------------------------------------------------------- SECCIÓN DE FOLD --------------------------------------------------------------------------
-- Inspirado por learnyouhaskell.com/higher-order-functions

-- ++++++++++++++++++++++++ INTRODUCCIÓN ++++++++++++++++++++++++

-- Los fold son como funciones map, sólo que reducen la lista a un valor singular (en vez de devolver otra lista).
-- Un fold toma una función binaria (osea que recibe 2 params), un valor inicial (acumulador) y una lista para "foldear".
-- La función binaria se llama con el acumulador y el primer (o último) elemento, produciendo un nuevo acumulador.
-- Luego, se la llama cono ese acumulador y el nuevo primer (o último) elemento, produciendo un nuevo acumulador. Así sucesivamente..
-- Lo que se termina devolviendo es el acumulador final.

-- ++++++++++++++++++++++++ FOLDL ++++++++++++++++++++++++

-- Foldea la lista desde el lado izquierdo. 
-- Es decir, la función binaria se aplica con el valor inicial (acumulador) y la cabeza (de aca el foldL y no foldR) de la lista.
-- Ejemplo:
sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs  
-- sum'[1,2,3,4] = 10
-- La función binaria es la lambda que recibe los parámetros "acc" y "x". Lo que hace es sumarlos (esto es el nuevo acumulador)
-- sum' Arranca con el acumulador inicial en 0 porque se quiere calcular la sumatoria de la lista xs

-- Corrida sobre [1,2,3,4]
-- La función binaria \acc x -> acc + x Arranca con acumulador inicial=0 y cabeza de la lista=1. Esto produce "1" como el nuevo acumulador.
-- Ahora, se usa acumulador=1 y siguiente elemento de la lista=2, produciendo acumulador=3. 
-- Luego, se usa acumulador=3 y siguiente elemento de la lista=3, produciendo acumulador=6.
-- Finalmente, se usa acumulador=6 y siguiente elemento de la lista=4 produciendo acumulador=10.

-- La funcion se puede escribir de otra forma, ya que \acc x -> acc+x es equivalente a (+). Tambien podemos omitir el parámetro xs, ya
-- que se va a tomar en cuenta automáticamente dado el tipo de sum'' y el tipo de foldl, vía currying.
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

-- Tambien se puede implementar elem, que checkea si un valor está presente en una lista.
elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- La idea acá es similar. Tenemos la función binaria lambda \acc x -> if x == y then True else acc y el acumulador inicial False
-- Entonces, esto va a tomar la cabeza de lista, fijarse si es el elemento que estamos buscando, si lo es devuelve True.
-- Si no lo es devuelve el acumulador, que es el que se va moviendo por la lista revisando todos los elementos.
-- Lo importante de aca es que, si querés recorrer una lista para devolver valor, los folds son cracks.

-- ++++++++++++++++++++++++ FOLDR ++++++++++++++++++++++++ 

-- Foldea la lista desde el lado derecho. Es decir, arranca por la cola y va para atrás hasta la cabeza.
-- La función binaria tiene al acumulador como el segundo parámetro. Osea, en vez de \acc x, sería \x acc, ya que el acumulador arranca desde la derecha.
-- El resto es idéntico a foldl. 

-- Es interesante considerar que el acumulador puede ser cualquier tipo (Bool, Int, lista de A, etc). Por ejemplo, se puede reimplementar la función map:
map' :: (a->b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f(x):acc) [] xs
-- El acumulador inicial es la lista vacía, ya que queremos aplicar la función f a todos los elementos de xs.
-- La función binaria en este caso, aplica f() al último elemento de xs. Recordar que f es la funcion que lleva elementos de a hacia b.
-- Luego, el resultado de esa función (el nuevo elemento de b), se concatena con el acumulador actual.
-- El acumulador final entonces resulta toda la lista con la f aplicada.

-- Usualmente se usan right folds cuando se construyen nuevas listas desde otra lista.
-- Es un uso distinto al de left folds (recorrer lista y devolver valor).


-- ++++++++++++++++++++++++ FOLDL1 y FOLDR1 ++++++++++++++++++++++++ 

-- Iguales a sus contrapartes foldl/foldr, sólo que no necesitan un valor inicial explícito.
-- Por defecto, toman el primer (o último) elemento de la lista como valor inicial (el acumulador). 
-- Por ejemplo, se puede reescribir sum como:
sum''' = foldl1 (+)

-- foldl1/foldr1 son buenos en caso de que la solución con foldl/foldr no funcione en el evento de una lista vacía.


-- ++++++++++++++++++++++++ SCANL Y SCANR ++++++++++++++++++++++++ 

-- Son como foldl/foldr, tienen como bonus que notifican los estados del acumulador en cada paso, durante toda la iteración.
-- También hay scanl1/scanr1, misma idea que con los folds.

-- Ejemplo scanl (+) 0 [3,5,2,1] = [0,3,8,10,11]
-- Ejemplo scanr (+) 0 [3,5,2,1] = [11,8,3,1,0]

main = print(1:[5,4])

partes x:xs = foldr(\x acc->acc ++ map (x:) acc) [[]]