module Ej6 where
import Base
import Ej1 (foldArbol)
import Ej5 (comer, Animal)
-- Implementar la función alimentar :: Arbol -> [Animal] -> Arbol,
-- que devuelve el resultado de hacer que arbol alimente a una serie de animales, en el orden en que
-- aparecen en la lista.

-- PRE: Los animales pueden alimentarse del arbol.
alimentar :: Arbol -> [Animal] -> Arbol
alimentar t as = foldr (\animal acc -> comer animal acc) t as
