module Ej5 where
import Base
import Ej1 (foldArbol)
import Ej2 (mismosComponentes)

------------------------------------------------------- ENUNCIADO RESUMEN --------------------------------------------------------------------

-- Consideraremos que los animales pueden acceder al árbol desde la izquierda o la derecha , pero
-- nunca del frente o de atrás, por lo que los modelaremos de la siguiente forma:

data Dirección = Izquierda | Derecha
data TipoHambre = Gula | Hambre | Inanición
	deriving (Eq, Ord, Show)
type Animal = (Int, Dirección, TipoHambre)

-- El entero asociado a un animal indica en qué nivel con respecto a la raiz alcanzará al árbol (los animales
-- pueden saltar desde abajo del árbol o venir volando y posarse en alguna rama).

-- Si el animal está hambriento, pero el componente alcanzado está protegido por una flor, entonces el animal
-- se distrae y se convierte en goloso. Se considera que un componente está protegido por una flor
-- cuando el (sub)árbol que parte de ese componente contiene una flor. (osea tiene que ser una Rama y tener un subárbol c/una flor).

-- Todos los animales producen daño a menos que se trate de un animal goloso (osea con Gula en TipoHambre) en un fruto, o un
-- animal hambriento que alcanza un fruto protegido por una flor.

-- Si el asalto produce daño, todos los componentes dependientes del nodo impactado se desprenden y el nodo impactado se convierte en madera.

-- Los animales solo pueden alcanzar el nodo más externo del nivel correspondiente (es decir, el de más a la izquierda si
-- viene por dirección izquierda, o el de más a la derecha si viene por dirección derecha).

--------------------------------------------------------- EJERCICIO -------------------------------------------------------------------------

-- Definir la función comer :: Animal -> Arbol -> Arbol , que devuelve el árbol resultante luego
-- de ser asaltado por el animal correspondiente (según se detalló en la sección “Asaltos” del enunciado).
-- Para este ejercicio puede utilizarse recursión explıcita. Se debe explicar en un comentario por
-- qué el esquema foldArbol no es adecuado para esta función.

--------------------------------------------------------- IDEAS -------------------------------------------------------------------------

-- Comer el Fruto implica borrar todos los subarboles asociados y transformar el Fruto en Madera.

-- En cada altura, se puede entrar desde la izquierda o desde la derecha (acordate que es un Arbol Binario este).

-- Asumo que el animal NO puede moverse una vez que llega al árbol. Tampoco puede intentar comer la raíz (pues esta no tiene dirección).

-- Revisar esta lógica:
-- A) Hay un Fruto en la altura + dirección donde entré al árbol.
-- B) Si mi estado es hambriento --> Tengo Flor en subarbol  SI--> No pasa nada, animal pasa a Goloso
--														     NO--> Como el Fruto
-- C) Si mi estado es goloso --> No pasa nada
-- D) Si mi estado es Inanicion --> Como el fruto
-- E) Cualquier otra cosa --> No pasa nada

-- +++++++++++++++ PUNTO A) +++++++++++++++ 

-- Función que te devuelve el subárbol ts ubicado en la altura pasada como parámetro
subArbolEnAltura :: Arbol -> Int -> Arbol
subArbolEnAltura t alt = t

revisarProfundamente :: Animal -> Arbol -> Arbol -> Arbol
revisarProfundamente (alt, dir, ham) ts t = t

hayFrutoEnLaCopa :: Arbol -> Bool
hayFrutoEnLaCopa t = True

comer :: Animal -> Arbol -> Arbol
comer (alt, dir, hamb) t = if hayFrutoEnLaCopa(subarbol) then revisarProfundamente (alt,dir,hamb) subarbol t else t
						       where subarbol = subArbolEnAltura t alt


main = do
	print("Hello there.")


-- Te dice la altura del subarbol ts dentro del arbol t1
altura :: Arbol -> Arbol -> Int
altura (Rama c1 t1 t2) (Rama cs1 ts1 ts2) = if ((c1 == cs1) && (mismosComponentes ts1 t1) && (mismosComponentes ts2 t2)) then 2 else 3
altura (Brote c1) (Brote cs1) = if c1 == cs1 then 2 else 3