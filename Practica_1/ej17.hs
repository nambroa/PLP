-- I) Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de
-- Haskell (la función va a estar definida sólo para los enteros mayores o iguales que 0).

foldNat :: (Integer -> a -> a) -> a -> Integer -> a
foldNat f m 0 = m
foldNat f m n = f n (foldNat f m (n-1))

-- II) Utilizando foldNat, definir la función potencia.

potencia :: Integer -> Integer -> Integer
potencia n m = foldNat (\x->(*n)) n (m-1)

main = print (potencia 2 3)