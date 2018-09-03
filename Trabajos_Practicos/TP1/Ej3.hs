module Ej3 where
import Base
import Ej2 (peso)


-- Implementar masPesado :: [Arbol] -> Arbol, que dada una lista no vacıa de árboles retorna el que tiene mayor peso.

masPesado :: [Arbol] -> Arbol
masPesado ts = foldr (\t acc -> if peso(t) > peso(acc) then t else acc) (Brote Flor) ts

main = do
	print("Un Brote de Madera es mas pesado que otro de Flor o de Hoja:")
	print(masPesado [(Brote Madera), (Brote Flor), (Brote Hoja)])
	print("Un Arbol de 3 Maderas es mas pesado que otro de 2:")
	print(masPesado [(Brote Madera), (Rama Madera (Brote Madera) (Brote Flor)), (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera))])