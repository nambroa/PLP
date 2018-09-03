module Ej1 where
import Base
-- Implementar el esquema de recursión estructural sobre los árboles (foldArbol) y dar su tipo.
-- Por ser este un esquema de recursión, se permite utilizar recursión explıcita para definirlo.

-- Como la idea de la recursión estructural es recibir un argumento por cada constructor (para saber qué devolver en cada caso)
-- y además la estructura que va a recorrer, se que foldArbol va a recibir 3 argumentos.
-- 2 argumentos asociados a los 2 constructores, y el Arbol en sí.

foldArbol :: (Componente->b->b->b) -> (Componente->b) -> Arbol -> b
foldArbol fRama fBrote t = case t of 
	Brote n -> fBrote n
	Rama n t1 t2 -> fRama n (rec t1) (rec t2) where rec = foldArbol fRama fBrote

