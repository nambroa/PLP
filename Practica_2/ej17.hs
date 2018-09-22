τ ∅ ➤ λ Γ

-- Γ asigna a variables un tipo. La lista [] no es una variable y por eso no podría estar en Γ.
-- Para que pueda tipar un término, en Γ deben estar todas las variables libres en ese término.

TRADUCCION

0 :: succ(0) :: [ ]Nat = [0, succ(0), []]

foldr M base → N; rec(h, r) → O = el caso base da N, h es head de la lista, r es el paso recursivo, esos dan el término O.

[]_∅ = [] sub ∅

-- II) Agregar reglas de tipado para las nuevas expresiones.

A)

		     (T-NIL)
_______________
Γ ➤ []_∅ : [∅] 		---> Es la "lista vacía de los ∅", por eso el _∅

B)

Γ ➤ M : ∅       Γ ➤ N : ∅                       (T-ADD)
_____________________________________________________
Γ ➤ M :: N : [∅] 							---> M :: N es una lista de sigmas

C)

Γ ➤ M : [τ]     Γ ➤ N : ∅        {h : τ, t : [τ]} U Γ ➤ O : ∅  (T-CASE)		---> h es la cabeza
___________________________________________________________________
Γ ➤ case M of {[] → N | h :: t → O} : ∅     ---> h y t son variables que pueden aparecer libres adentro del termino O, no pueden ser cualquier cosa.

D)

Γ ➤ M : [τ]		Γ ➤ N : ∅       {h : τ, r : ∅} U Γ ➤ O : ∅   (T-FOLD)  ---> r es ∅ y no τ al ser el resultado de una recursión
______________________________________________________________________
Γ ➤ foldr M base → N; rec(h, r) → O : ∅

-- IV) Mostrar cómo se extiende el conjunto de valores. Estos deben reflejar la forma de las listas que un programa
-- podría devolver.

-- Valor es lo que nos interesa que un programa sepa devolver.

V ::= | []_∅ | V1 :: V2  ---> Los constructores de lista

-- V) Agregar los axiomas y reglas de reducción asociados a las nuevas expresiones.

Por qué no hay regla de reducción para lista vacía? Porque ya es un valor irreducible.


M →M'						(E-ADD1)
__________________________________-
M :: N → M' :: N --> M reduce a M' siempre y cuando lo de arriba reduzca.



N → N'						(E-ADD1)
__________________________________
V :: N → V :: N'



M → M'	-- (M es un valor, por lo cual va a ser alguno de los V, por eso las ultimas dos filas son como casos base)	
_________________________________________________________________________
case M of {[] -> N | h :: t -> O} → case M' of {[] -> N | h :: t -> O} (E-CASE)
_________________________________________________________________________
case []_∅ of {[] -> N | h :: t -> O} → N (E-CASE-NIL)
_________________________________________________________________________
case V1 :: V2 of {[] -> N | h :: t -> O} → O {h<-V1, t<-V2}	(E-CASE-ADD)	-- h y t se ligan con V1 y v2

-- La razón por la cual no se reduce N es porque depende de M y con que se reduzca M alcanza..creo.

(foldr arranca similar a las últimas 3 filas de case menos la -ADD, osea E-FOLD y E-FOLD-NIL son iguales a E-CASE y E-CASE-NIL)


-- Ya que la variable r es el resultado de la recursión, la reduzco a foldr aplicado a la cola de la lista, osea V2. 
(E-FOLD-ADD) foldr V1 :: V2 base -> N; rec(h,r) -> O → O{h<-V1, r<-foldr(V2 base -> N; rec(h,r) -> O} 



