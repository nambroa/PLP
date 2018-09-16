-- Para los siguientes términos se pide:
-- A) Insertar todos los paréntesis de acuerdo a la convención usual.
-- B) Dibujar el árbol sintáctico de cada una de las expresiones.
-- C) Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres.
-- D) ¿En cuál de los términos anteriores ocurre la siguiente expresión como subtérmino?
-- (λx : Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u

-- I). u x (y z) (λv : Bool. v y)

 A) ((u x) (y z)) (λv : Bool. v y)]

 B) ((u x) (y z)) (λv : Bool. v y) - N1
	      |				  |
	  (u x) (y z)  λv : Bool. v y  - N2       
	  /  \  /  \             /  \   
	  u  x  y  z            v    y - N3
	 					

C) Las variables "u" y "x" de la expresion (u x) aparecen libres. Lo mismo para la expresión siguiente (y z), en todos sus niveles.
   Para la expresión (λv : Bool. v y), la variable "y" aparece libre pero la variable "v" aparece ligada en el nivel 2. En el nivel
   3, ambas variables aparecen libres.

D) No ocurre esa expresión como subtérmino.

-- II) (λx : Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v w

Ain't nobody got time fo dat

-- III) w (λx : Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v
