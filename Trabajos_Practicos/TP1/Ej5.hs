module Ej5 where
import Base
import Ej1 (foldArbol)

------------------------------------------------------- ENUNCIADO RESUMEN --------------------------------------------------------------------

-- Consideraremos que los animales pueden acceder al árbol desde la izquierda o la derecha , pero
-- nunca del frente o de atrás, por lo que los modelaremos de la siguiente forma:

data Dirección = Izquierda | Derecha
data TipoHambre = Gula | Hambre | Inanición
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

comer :: Animal -> Arbol -> Arbol