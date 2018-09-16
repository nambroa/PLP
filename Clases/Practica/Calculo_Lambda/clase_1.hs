-------------------------------------------------------- SINTAXIS --------------------------------------------------------------------------

+ La aplicación asocia hacia la izquierda
- f x y z = ((f x) y)

+ \x: s.M
- La lambda llega hasta el final si no hay paréntesis o hasta el paréntesis visible.

+ (\x: s.M) N
- La lambda no llega hasta el N.
+ \x: s.M N
- La lambda llega hasta el N.

-------------------------------------------------------- TERMINOS --------------------------------------------------------------------------------

- True | False | "el if" = if M then P else Q | funciones
Cajas con las que tenes que completar algo concreto

---------------------------------------------------- EJERCICIOS DE SINTAXIS ----------------------------------------------------------------------

A) \x: Bool -> Bool.x true
sigma = (Bool -> Bool)
M (cuerpo) = x true (osea x <- true)

+ Es una abstracción porque tengo una lambda x adelante. Sigma en este caso es la función (Bool->Bool)
- La lambda recibe una función que el cuerpo es hacer x <- True

- Es una expresión sintácticamente válida.

+ Los subtérminos de la expresión son:
\x: Bool -> Bool.x true
				|
				|
			x true
			/	\
		   /	 \
		  x		  true
Osea, la expresión entera, x true, x y true.

+ Cuáles son sus ocurrencias libres?
- x en la expresión se encuentra ligada
- Si tuvieras (\x: Bool -> Bool.x true) x , la segunda x estaría libre y la primera x estaría ligada.
C) \x: Nat

No es sintácticamente válida.
Toda lambda debe tener \x: sigma. M
sigma es el tipo, en A) era la función de Bool en Bool.
M es el cuerpo que se tiene que instanciar con algo concreto (variable, booleano, nat)

B) (\x: Bool -> Nat.x true) (\y: Bool.x)

+ Es sintácticamente válido, aunque no tenga sentido. Tenés dos aplicaciones, x true y x.
+ Los subtérminos de la expresión son:
- \x: Bool -> Nat.x true (y sus subterminos tipo en A))
- \y: Bool.x
- x

+ Cuáles son sus ocurrencias libres? Sólamente x en la segunda aplicación

D) \x.x

+ No es sintácticamente válida, falta el sigma.

E) true false

+ Es una aplicación de dos términos, true=M false=N, por lo que es tipo (M N) ó (M M) y es sintácticamente válida.

F) succ(M)

+ succ(M) es un término. No es algo concreto igual pq M no puede aparecer así suelta nomás, así que no es sintácticamente válida.

(Cálculo lambda para Naturales y Booleanos) M ::= todos los de la teórica | 0 | succ(M) | pred(M) | iszero(M) (revisar este, creo que no se escribe así)

G) succ true

+ No es sintácticamente válido, succ es tipo succ con algo entre paréntesis.


-------------------------------------------------------- JUICIOS DE TIPADO --------------------------------------------------------------------------

NOTA: G = Gamma, S = Sigma, T = tau

+ Texto M bajo el contexto G tiene tipo S
- Osea G <> M : S (Juicio de tipado)
- Gamma es el contexto de tipado {x1:s1, x2:s2, .., xp:sp}
-- Gamma es como un diccionario. Para la variable xi, tiene el tipo si.

+ Va a haber que demostrar si es verdadero o no


G |- M : S ----> M es de tipo S en contexto G --> luego ---> para todo G' dentro de G, vale también.

-------------------------------------------------------- EJERCICIO DE CHEQUEO DE TIPOS --------------------------------------------------------------------------

1) ∅ |- (λx : Bool. λy : Bool. if x then true else y ) false : Bool → Bool
Esto es una aplicación. Entonces, usamos la regla de tipado para las aplicaciones (T-APP)

(Y cada uno de estas vale ya que es una regla irreducible) 
(T-VAR)			 (T-TRUE)			  (T-VAR)
G |- x:Bool      G |- true:Bool       G |- y:Bool (T-IF)
_____________________________________________________________________________________________________
G = {x:Bool, y:Bool} |- if x then true else y:Bool (T-ABS)
______________________________________________________________________________________________________
{x:Bool} |- \y:Bool.if x then true else y : Bool -> Bool (T-ABS al ser una abstracción) (Sabés que acá va T-ABS pq la parte de abajo es como la reglita)
______________________________________________________________________________________________________
∅ |- λx : Bool. λy : Bool. if x then true else y:Bool -> (Bool->Bool) ∅ |-false : Bool (SACADO DE T-APP + T-FALSE)
__________________________________________________________________________________________________
	∅ |- (λx : Bool. λy : Bool. if x then true else y ) false : Bool → Bool

S = Bool
T = Bool->Bool

Lo clave de entender es que simplemente con fijarte en la regla lo sacás. Siempre vas de abajo para arriba haciendo pattern matching.

2) {x : Bool} |- succ(0) : Nat

(T-ZERO)
__________________________________________
{x : Bool} |- 0 : Nat (T-SUCC)
_______________________________
{x : Bool} |- succ(0) : Nat

3) ¿Existen Γ y Sigma tal que Γ |- x x : S?
Esa Gamma es una aplicación. Creo que no existen.

-------------------------------------------------------- PROGRAMAS --------------------------------------------------------------------------

+ Terminos cerrados (osea sin variables libres) bien tipados. Es lo que queremos ejecutar en nuestra maquina.
+ Las formas normales son los términos irreducibles. Por ejemplo los valores.

V ::= valores = true | false | 0 | succ(v) con v valor distinto de true o false, osea un nat | \x:S.M

+ Los valores son los resultados de los programas. (no tiene que poder seguir siendo computable!)

+ (\x:Bool.x) es la funcion identidad

-------------------------------------------------------- EJERCICIO DE VALORES --------------------------------------------------------------------------

1) if true then (λx : Bool. x) else (λx : Bool. false) No es un valor. Es un if y se puede reducir.
2) λx : Bool. false es un valor, es la función constante false
3) (λx : Bool. x) false es una aplicación, no un valor
4) succ(0) Si
5) succ(succ(0)) Si
6) succ(x) no tipa siquiera. Tiene una variable libre.
7) λx : Bool. (λy : Bool.x) false es un valor. Es una lambda x bool, que el cuerpo M es una aplicación. No se puede reducir más al ser una función.
--- Cuando le pases un Booleano, pasan cosas. El cuerpo es (λy : Bool.x) false. Acordate que todas las funciones son NO reducibles. Creo que las abstracciones
tampoco.
8) Idem 7)

-------------------------------------------------------- SEMÁNTICA OPERACIONAL --------------------------------------------------------------------------

(usar machete de semántica operacional)

1) (λx : Bool. λy : Bool. if x then true else y ) false

Tenes una aplicación.

Hay 3 reglas para la aplicación
APP-1 Es para cuando lo de la izquierda es reducible.
APP-1 dice, MN se reduce a M'N si y solo si M se reduce a M' en ese proceso.

APP-2 es similar pero con la izquierda siendo un valor. Osea no es mas reducible/no cambia.

+ REDUCE A = (por regla beta) 
- λy : Bool. if false then true else y

El if primero reduce todo lo que hay en las guardas, después recién va por las ramás then o else.

-------------------------------------------------------- MACROS --------------------------------------------------------------------------

Id_bool = \x:Bool.x
and = λx : Bool.λy : Bool.if x then y else false 
