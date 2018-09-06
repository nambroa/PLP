module Ej8 where
import Base
import Ej1 (foldArbol)
import Ej5 (comer, Animal)
import Ej6 (alimentar)

--------------------------------------------------------- FUNCIONES AUXILIARES -----------------------------------------------------------

-- Es un fold pero que mantiene la altura de un árbol. También usa la altura en sus funciones
-- PRE: La altura siempre se pasa en 0.
foldConAltura :: (Componente->Int->b->b->b) -> (Componente->Int->b) -> Int -> Arbol  -> b
foldConAltura fRama fBrote alt t = case t of 
	Brote n -> fBrote n alt
	Rama n t1 t2 -> fRama n alt (rec t1) (rec t2) where rec = foldConAltura fRama fBrote (alt+1)

-- Funcion que descompone un árbol en una lista de sus componentes con la notación [(componente, altura del mismo)].
descomponerArbol :: Arbol -> [(Componente, Int)]
descomponerArbol t = foldConAltura (\c alt t1 t2 -> [(c,alt)] ++ t1 ++ t2) (\c alt-> [(c,alt)]) 0 t

-- Funcion que devuelve el nivel más alto
nivelMasAlto :: Arbol -> Int
nivelMasAlto t = foldr (\(comp,int) acc ->if int > acc then int else acc) 0 (descomponerArbol t)
--------------------------------------------------------- EJERCICIO ---------------------------------------------------------------------

-- I) Implementar componentesPorNivel :: Arbol -> Int -> Int, que dadas un árbol y un nivel indica
-- cuántos componentes contiene el árbol en el nivel indicado, teniendo en cuenta que la raız es
-- el nivel 0. Por ejemplo, todo árbol tendrá un componente en el nivel 0, 0 o 2 componentes
-- en el nivel 1, a lo sumo 4 en el nivel 2, etc. Ayuda: pensar cuál es el verdadero tipo de esta función.

componentesPorNivel :: Arbol -> Int -> Int
componentesPorNivel t nivel = length (filter ((==nivel).snd) (descomponerArbol t))

-- II) dimensiones :: Arbol -> (Int, Int),
-- que dado un árbol retorna su alto y se ancho (pensando el alto como la cantidad de com-
-- ponentes de la rama más larga desde la raız, y ancho como la cantidad de componentes del
-- nivel más ancho).

dimensiones :: Arbol -> (Int, Int)
dimensiones t = (nivel, componentesPorNivel t nivel)
					where nivel = nivelMasAlto t 


main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("(Brote Madera) tiene 1 componente en la raiz:")
	print(componentesPorNivel (Brote Madera) 0)
	print("(Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)) tiene 2 componentes de nivel 1:")
	print(componentesPorNivel (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)) 1)
	print("(Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)) tiene 2 componentes de nivel 2:")
	print(componentesPorNivel (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)) 2)
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("(Brote Madera) tiene 0 de largo y 1 de ancho:")
	print(dimensiones (Brote Madera))
	print("(Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)) tiene 2 de largo y 2 de ancho:")
	print(dimensiones (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))
	


