τ ∅ ➤ λ Γ

<=> ---> Signo igual con un puntito arriba. Significa "UNIFICA"
-- OPERACIÓN DE UNIFICACIÓN
-- EJ: MGU: {c <=> Bool->d}
-- Existe una unificación que hacen que el tipo c sea sintácticamente equivalente a Bool->d?

ERASE(λx:Nat.x:Nat) = λx.x (osea borra todas las anotaciones de tipos)

Inferencia no es chequeo de tipos.
Inferencia intenta buscarle un tipo a la expresión
Chequeo de tipos recibe la expresión y sus tipos y valida que ellos estén bien.

Esta función:
λx:Nat. isZero(x)
tiene tipo (Nat->Bool), ya que toma un Nat y devuelve un Bool.

La idea del algoritmo de inferencia es automatizar y no necesitar escribir el Nat.

Si tuvieras λx. isZero(x), podrías "inferir" el tipo de x como Nat.

Para esta función:
λx. λy. (x y) (λz. x)

Qué tipos tienen estas funciones?

A)VACIO ➤ λx. succ(x) : Nat -> Nat -- contexto VACIO osea vale siempre
B){y:Nat} ➤ λx.<>.succ(y) : <> -> Nat
C)(λx.isZero(x)) true no tiene tipo
D)VACIO ➤ λx:t. x : t -> t
E) λf:t->t.λx:t.f (f x) : (t->t) -> t -> t


-- APLICAR ALGORITMO DE INFERENCIA
-- Esto es aplicar las reglas intentendibles del machete ese.
Dada la expresión y (λx.x) true

1) Hacer arbol sintactico e ir de abajo para arriba
(Los reemplazos de MGU se hacen de ABAJO para ARRIBA)
									y (λx.x) true: d
									   /		\  MGU = {c <=> Bool->d (porque tenés el c anterior y le aplicas true que es un Bool, y devuelve d)}
									  /			 \ c<- (Bool->d)
									y (λx.x):c   true:Bool
									/	\  MGU = Unificador de Max Generalidad. = {b<=>a->a->c (porque y toma como parametro funcion a->a y devuelve c)}
								   /	 \   b<-((a->a)->c) -- Osea b pasa a ser a->a->c	
								  y:b   (λx.x):a -> a
						 					 \ 			
								   			 x:a

Entonces resulta = 
Γ ➤ {y: ((a->a)->Bool->d)}

Dada la expresión if x then (λx.x) y else succ(y)

{x:Bool, y:Nat}if x then (λx.x) y else succ(y): Nat (la primer linea de abajo que dice {x:e} es de la parte if x..)
		  /			|			  |
		  |			|			  |MGU: {e <=> Bool, c <=> Nat}. Luego e<- Bool, c<- Nat
  {x:e}➤x:e		{y:c}(λx.x)y:c   {y:Nat}succ(y):Nat _______________  -- Esta flecha la saco para la derecha porque no entra.
		 		   /	  \MGU: {a<=>b, b<=>c}       			|MGU = {d <=> Nat}. Luego d <- Nat
		 		  /		   \  a<-b                   		    |
		 		 / 			\ b<-c 							{y:d}➤y:d
	VACIO ➤ λx:a.x:a->a	  	 Γ:{y:b}y:b -- Contexto donde y es tipo b.
				|
				Γ:{x:a}x:a

Dada la expresión λx. λy. (x y) (λz. x)

{sarasasarasarasa}λx. λy. (x y) (λz. x)
					  |
					  |
					  |
		{sarasasarasa}λy. (x y) (λz. x)
					  |
					  | Como el MGU no tiene solución, esto no tipa, finite.
					  |
			{sarasasara}(x y) λz. x
MGU: {s4<=>s5->s3->s6}		 /        \
s4 <- (s5->s4->s6)    		/		   \
MGU:{s2->s5->s3->s6 <=>s3} /			\ -- EL MGU DE ESTA LINEA NO TIENE SOLUCIÓN!
	{x:s2}➤s4, y:s2}(x y):s4	{x:s3}➤(λz. x):s5->s3 -- Aca (x y) es tau, (λz. x) es ro
			         /  \  MGU: {s1<=>s2->s4}   |
			        /    \    s1 <- s2->s4      |
			       /      \               		|
	  	{x:s1}➤x:s1     {y:s2}➤y:s2      	{x:s3}➤x:s3
			       	--x es s1 y después s3 porque en este momento "no se conocen"