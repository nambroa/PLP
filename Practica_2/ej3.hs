-- I) Marcar las ocurrencias del término x como subtérmino en λx: Nat.succ((λx: Nat.x)x)

Para marcar las ocurrencias del término x como subtérmino, marco todos los subtérminos.
Para saber los subtérminos de la expresión, arranco por los subtérminos de la subexpresión (λx: Nat.x)
λx: Nat.x			
	  |
	  x

Es decir, tiene 2 subtérminos (s1 y s2), la expresión completa y x.

Luego, los subtérminos de la expresión λx: Nat.succ((λx: Nat.x)x) son

λx: Nat.succ((λx: Nat.x)x)
				|       |
			s1 y s2     x

-- II) Ocurre x1 como subtérmino en λx1: Nat.succ(x2)?

No, sólo sucede x2.

-- III) Ocurre x (y z) como subtérmino en u x (y z)?

No, veamos porque usando el árbol de subtérminos.

			u x (y z)
			 /	   \
			/       \
		   u x       y z
		  /  \       /  \
		 u    x     y    z