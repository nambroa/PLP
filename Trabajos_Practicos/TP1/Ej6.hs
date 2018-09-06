module Ej6 where
import Base
import Ej1 (foldArbol)
import Ej5 (comer, Animal)
-- Implementar la función alimentar :: Arbol -> [Animal] -> Arbol,
-- que devuelve el resultado de hacer que arbol alimente a una serie de animales, en el orden en que
-- aparecen en la lista.

-- PRE: Los animales pueden alimentarse del arbol. Si se pueden alimentar pero en otro orden, se puede cambiar para obtener en cada paso
-- el animal de mayor altura, cosa de que un animal previo no le corte el fruto a un animal siguiente.
alimentar :: Arbol -> [Animal] -> Arbol
alimentar t as = foldr (\animal acc -> comer animal acc) t as
