-- Currificación
-- Correspondencia entre funciones que reciben múltiples argumentos y devuelven un resultado, con
-- funciones que reciben un único argumento y devuelven una función intermedia que completa el trabajo.

prod :: (Int,Int)->Int
prod (x,y) = x*y

prod' :: Int->(Int->Int)
(prod' x)y = x*y

-- Curry devuelve la versión currificada de la función pasada como parámetro no currificada
--curry' :: ((a,b)->c)->a->b->c
--curry f a b = f (a,b)

---- Uncurry es lo mismo pero al revés
--uncurrry' :: (a->b->c)->(a,b)->c
--uncurrry f (a b) = f a b

-- esMayorDeEdad usa aplicación parcial (creo)
esMayorDeEdad :: Int->Bool
esMayorDeEdad = (<) 18

-- inversoMultiplicativo también (creo)
inversoMultiplicativo :: Float->Float
inversoMultiplicativo = (/) 1

-- flip te da vuelta los argumentos de la funcion. Ej flip(\x y -> x-y) 10 4 reduce a -6
flip :: (a->a->b)->(a->a->b)
flip f = \x y -> f y x

-- (.) Compone 2 funciones. AKA WTF
(.) :: (b->c)->(a->b)->a->c
(.) f g x = f (g x)

-- ROT13 es un esquema de criptografı́a muy sencillo que consiste en
-- reemplazar cada caracter con el caracter que aparece 13 lugares después
-- en el alfabeto. Básicamente, rot13(a) = char ((#a + 13) mód 26).
-- Ni me voy a molestar en entender esto
rot13 :: Char -> Char
rot13 = chr . (flip mod 26) . (+13) . (- ord ’a’) . ord

-- Recursión sobre listas usando Map.
-- map :: (a->b) -> [a] -> [b]
-- map f [] = []
-- map f (x:xs) = (f x):(map f xs)
-- Map te permite procesar los elementos de una lista mediante una transformación
-- Toma una función que sabe como convertir un tipo de a en otro b
-- Y nos devuelve una funcion que sabe como convertir listas de a en listas de b

-- Ejemplos de verdad de map:
-- map (++ "!") ["BIFF", "BANG", "POW"] = ["BIFF!","BANG!","POW!"]  
-- map (replicate 3) [3..6] = [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]  
-- Ejemplo de map:
-- losIesimos :: [Int] -> [[a] -> a]
-- Devuelve una lista con las funciones que toman los iésimos de una lista

-- !! :: [a] -> a -> a = Devuelve el elemento de la lista en el índice (segundo parámetro). Los índices arrancan desde 0
losIesimos :: [Int] -> [[a] -> a]
losIesimos xs = map (flip(!!)) xs



-- filter