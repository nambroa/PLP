-- Determinar que expresiones son sintácticamente válidas, y determinar a qué categoría pertenecen
-- (expresiones de término o expresiones de tipos)

-- Como no hay símbolos griegos en el teclado, voy a usar las siguientes traducciones:
-- \ -> lambda 
-- s -> sigma
-- (puede ser que no use esto y haga copy paste de los simbolos..)

-- Toda expresión sintácticamente válida consiste de la lambda, el sigma (tipo) y el cuerpo (cosas concretas, como x <- true). Ejemplo \x: sigma.M
1) x

Es una expresión de términos sintácticamente válida.

2) x x

Es una expresión de términos sintácticamente válida.

3) M

Si bien M es un término válido, no forma una expresión válida ya que le falta algo concreto (como x).

4) M M

Si bien M es un término válido, no forma una expresión válida ya que le falta algo concreto (como x).

5) true false

Es una aplicación de dos términos -expresión de términos-, true=M false=N, por lo que es tipo (M N) ó (M M) y es sintácticamente válida.

6) true succ(false true)

Succ toma un sólo término como parámetro, no dos. Por ende, no es sintácticamente válida.

7) λx.isZero(x)

Le falta el sigma, por lo que no es sintácticamente válida.

8) λx:s.succ(x)

Le falta el sigma (tiene el símbolo pero no representa ningún tipo), por lo que no es sintácticamente válida.

9) λx:Bool.succ(x)

Tiene todas las partes válidas, por lo que es una expresión de términos sintácticamente válida.

10) λx: if true then Bool else Nat.x

Si bien tiene todas las partes, el sigma es inválido ya que representa un término en vez de un tipo.

11) s

No es una expresión de tipos válida pues sigma por si sólo no es un tipo.

12) Bool

Es una expresión de tipos sintácticamente válida.

13) Bool -> Bool

Es una expresión de tipos sintácticamente válida.

14) Bool -> Bool -> Nat

Es una expresión de tipos sintácticamente válida.

15) (Bool -> Bool) -> Nat

Es una expresión de tipos sintácticamente válida.

16) succ true

Es una expresión sintácticamente inválida pues el parámetro de succ debe ir entre paréntesis.

17) λx:Bool.if 0 then true else 0 succ(true)

Es una expresión de términos sintácticamente válida.
