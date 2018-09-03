module Ej4 where
import Base
import Ej1 (foldArbol)

-- I) Implementar crecer :: (Componente -> Componente) -> Arbol -> Arbol que, dada una función que reemplaza componentes,
-- devuelve el árbol transformado mediante los reemplazos correspondientes.

crecer :: (Componente -> Componente) -> Arbol -> Arbol
crecer fComp t = foldArbol (\c t1 t2 -> Rama (fComp c) t1 t2) (\c -> Brote(fComp c)) t

-- ultimaPrimavera :: Arbol -> Arbol que devuelve un arbol con flores en vez de hojas (observemos que
-- el árbol ası florecido no puede vivir).

ultimaPrimavera :: Arbol -> Arbol
ultimaPrimavera t = crecer (\c -> if c == Flor then Hoja else c) t

main = do
	print("--------------------------- TESTEANDO PUNTO I ---------------------------")
	print("Transformo un Brote de Madera en un Brote de Flor:")
	print(crecer (\c -> Flor) (Brote Madera))
	print("Reemplazo las 3 Maderas de un Arbol por 3 Frutos:")
	print(crecer (\c -> if c == Madera then Fruto else c) (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))
	print("--------------------------- TESTEANDO PUNTO II ---------------------------")
	print("Un Brote de Madera pasado por ultimaPrimavera sigue siendo un Brote de Madera:")
	print(ultimaPrimavera (Brote Madera))
	print("Un Arbol con 1 Flor pasado por ultimaPrimavera transforma la Flor en una Hoja:")
	print(ultimaPrimavera (Rama Madera (Rama Flor (Brote Madera) (Brote Hoja)) (Brote Madera)))

