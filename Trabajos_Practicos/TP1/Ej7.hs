module Ej7 where
import Base
import Ej1 (foldArbol)
import Ej5 (comer, Animal)
import Ej6 (alimentar)
--------------------------------------------------------- FUNCIONES AUXILIARES -----------------------------------------------------------

tieneHojas :: Arbol -> Bool
tieneHojas t = foldArbol (\c t1 t2 -> if c == Hoja then True else t1 || t2) (\c -> if c == Hoja then True else False) t

--------------------------------------------------------- EJERCICIO ---------------------------------------------------------------------

-- Implementar sobrevivientes :: [Animal] -> [Arbol] -> [Arbol],
-- que dada una lista de animales y una lista de árboles retorna la lista de árboles que pueden
-- sobrevivir a la secuencia de animales (i.e. los que tendrán hojas luego de enfrentar los asaltos en
-- forma sucesiva).
sobrevivientes :: [Animal] -> [Arbol] -> [Arbol]
sobrevivientes as ts = [alimentar arbol as | arbol <- ts, tieneHojas(alimentar arbol as)]