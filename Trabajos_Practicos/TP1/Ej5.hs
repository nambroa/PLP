module Ej5 where
import Base
import Ej1 (foldArbol)
import Ej2 (mismosComponentes)

------------------------------------------------------- ENUNCIADO RESUMEN --------------------------------------------------------------------

-- Consideraremos que los animales pueden acceder al árbol desde la izquierda o la derecha , pero
-- nunca del frente o de atrás, por lo que los modelaremos de la siguiente forma:

data Direccion = Izquierda | Derecha
	deriving (Eq, Ord, Show)
data TipoHambre = Gula | Hambre | Inanicion
	deriving (Eq, Ord, Show)
type Animal = (Int, Direccion, TipoHambre)

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

-- En cada altura, se puede entrar desde la izquierda o desde la derecha.
-- Creo que este dato es salteable (porque el árbol es binario, toda opción es izquierda o derecha).

-- Asumo que el animal NO puede moverse una vez que llega al árbol. Tampoco puede intentar comer la raíz (pues esta no tiene dirección).

-- Revisar esta lógica:
-- A) Hay un Fruto en la altura + dirección donde entré al árbol.
-- SI EL FRUTO EXISTE:
-- B) Si mi estado es Gula --> No pasa nada
-- C) Si mi estado es Inanicion --> Como el Fruto
-- D) Si mi estado es hambriento --> Tengo Flor en subarbol  SI--> No pasa nada, animal pasa a Goloso
--														     NO--> Como el Fruto
-- E) Cualquier otra cosa --> Como el Fruto

-- Función que te devuelve el subárbol ts ubicado en la altura pasada como parámetro.
-- PRE: La altura y direcciones son válidas para el árbol pasado como parámetro. 
subArbolEnAltura :: Arbol -> Int -> Direccion -> Arbol
subArbolEnAltura t alt dir = case t of
	Brote c -> if alt == 0 then Brote c else error "Altura invalida."
	Rama c t1 t2 -> if alt == 0 then (Rama c t1 t2) else (subArbolEnAltura tj (alt-1) dir)
						where tj = if dir == Izquierda then t1 else t2

-- Función que come a partir de una altura. Transforma el fruto de esa altura en madera y remueve lo demás.
-- PRE: Hay un fruto comestible en esa altura
comerEnAltura :: Arbol -> Int -> Arbol
comerEnAltura t alt = t -- TERMINAR

-- Función que valida el punto A).
hayFrutoEnLaCopa :: Arbol -> Bool
hayFrutoEnLaCopa t = case t of
	Brote c -> if c == Fruto then True else False
	Rama c t1 t2 -> if c == Fruto then True else False

-- Función que valida el punto B).
revisarGula :: Animal -> Arbol -> Arbol -> Arbol
revisarGula (alt, dir, ham) ts t = if ham == Gula then t else revisarInanicion (alt,dir,ham) ts t

-- Función que valida el punto C)
revisarInanicion :: Animal -> Arbol -> Arbol -> Arbol
revisarInanicion (alt, dir, ham) ts t = if ham == Inanicion then comerEnAltura t alt else revisarHambriento (alt,dir,ham) ts t

-- Función que valida el punto D)
revisarHambriento :: Animal -> Arbol -> Arbol -> Arbol
revisarHambriento (alt, dir, ham) ts t = if ham == Hambriento then t else comerEnAltura t alt -- TERMINAR

comer :: Animal -> Arbol -> Arbol
comer (alt, dir, hamb) t = if hayFrutoEnLaCopa subarbol then revisarGula (alt,dir,hamb) subarbol t else t
						       where subarbol = subArbolEnAltura t alt dir

main = do
	print("Hello there!")
	print("General Kenobi..")