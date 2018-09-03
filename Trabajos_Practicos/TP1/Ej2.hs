module Ej2 where
import Base
import Ej1 (foldArbol)


----------------------------------------------------- FUNCIONES AUXILIARES -------------------------------------------------------------------

pesoDeComponente :: Componente -> Int
pesoDeComponente Madera = 1
pesoDeComponente _ = 0

sumarFlor :: Componente -> Int
sumarFlor Flor = 1
sumarFlor _ = 0

esHoja :: Componente -> Bool
esHoja Hoja = True
esHoja _ = False

-- Descompone un arbol como la lista de sus componentes.
componentes :: Arbol -> [Componente]
componentes t = foldArbol (\c t1 t2 -> [c] ++ t1 ++ t2) (\c -> [c]) t

----------------------------------------------------- EJERCICIOS -----------------------------------------------------------------------------

--	Implementar las siguientes funciones (puede ser necesario crear una o más abstracciones adicionales):

-- I) peso :: Arbol -> Int, que retorna el peso del árbol, donde únicamente la madera aporta
-- una unidad al peso.

peso :: Arbol -> Int
peso t = foldArbol (\c t1 t2 -> pesoDeComponente c + t1 + t2) (\c -> pesoDeComponente c) t

-- II) perfume :: Arbol -> Int, que retorna la cantidad de flores que tiene la árbol.

perfume :: Arbol -> Int
perfume t = foldArbol fRama fBrote t
			where 
				fRama = (\c t1 t2 -> sumarFlor c + t1 + t2)
				fBrote =  (\c -> sumarFlor c)

-- III) puedeVivir :: Arbol -> Bool, que indica si el árbol tiene por lo menos una hoja para
-- hacer fotosıntesis.

puedeVivir :: Arbol -> Bool
puedeVivir t = foldArbol (\c t1 t2 -> esHoja c && t1 && t2) (\c -> esHoja c) t

--IV) mismosComponentes :: Arbol -> Arbol -> Bool, indica si los dos árboles tienen los mis-
--mos componentes en iguales cantidades.

mismosComponentes :: Arbol -> Arbol -> Bool
mismosComponentes t1 t2 = if componentes(t1) == componentes(t2) then True else False

--main = do
--	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
--	print("El peso de un Brote Madera deberia ser 1:")
--	print(peso (Brote Madera))
--	print("El peso de un arbol con 3 Maderas, 1 Hoja y 1 Flor deberia ser 3:")
--	print(peso (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))
--	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
--	print("El perfume de un Brote Madera deberia ser 0:")
--	print(perfume (Brote Madera))
--	print("El perfume de un arbol con 3 Maderas, 1 Hoja y 1 Flor deberia ser 1:")
--	print(perfume (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))
--	print("--------------------------- TESTEANDO PUNTO III ---------------------------")
--	print("El perfume de un Brote Madera deberia ser 0:")
--	print(perfume (Brote Madera))
--	print("El perfume de un arbol con 3 Maderas, 1 Hoja y 1 Flor deberia ser 1:")
--	print(perfume (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))
--	print("--------------------------- TESTEANDO PUNTO IV ---------------------------")
--	print("Dos Brotes de Madera tienen los mismos componentes:")
--	print(mismosComponentes (Brote Madera) (Brote Madera))
--	print("Un Brote de Madera y otro de Flor no tienen los mismos componentes:")
--	print(mismosComponentes (Brote Madera) (Brote Flor))
--	print("Un Brote de Madera y una Rama no tienen los mismos componentes:")
--	print(mismosComponentes (Brote Madera) (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))

