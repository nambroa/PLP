-- Determinar qué tipos representan σ y τ en cada uno de los siguientes juicios de tipado. Si hay más de una
-- solución, o si no hay ninguna, indicarlo.

-- I) {x : σ} ➤ isZero(succ(x)) : τ

{x : Nat} ➤ isZero(succ(x)) : Bool

-- II) ∅ ➤ (λx : σ. x)(λy : Bool. 0) : σ

(T-ABS) ∅,(x: σ) ➤ x: σ                  ∅,(y: σ) ➤ 0: σ
_____________________________________________________________
(T-APP) ∅ ➤ (λx : σ. x) :σ->σ          ∅ ➤ (λy : Bool. 0): σ
_____________________________________________________________
∅ ➤ (λx : σ. x)(λy : Bool. 0) : σ

Por los T-ABS y λy, concluímos que debe ser de tipo Bool->Nat.

-- III) {y : τ } ➤ if (λx : σ. x) then y else succ(0) : σ
-- Con ∅ = {y : τ}

(T-ABS)∅,(x:σ) -> x: σ
______________________________
(T-IF) ∅ ➤ (λx : σ. x): Bool	  ∅ ➤ y: σ		∅ ➤ succ(0): σ		
________________________________________________________________
 if (λx : σ. x) then y else succ(0) : σ

 Por lo que vemos en T-IF, σ tiene que ser de tipo Nat. Por lo tanto, τ también es Nat.
 Sin embargo, nos da que x también es de tipo σ, cuando debe ser de tipo Bool. Por ende, no tiene solución.

 -- IV) {x : σ} ➤ x y : τ
-- Con ∅ = {x : σ}	

(T-VAR) x: (σ1 → τ) ∈ ∅			(T-VAR) y: σ1 ∈ ∅
______________________     			    ____________________
(T-APP) ∅ ➤ x: σ1 → τ			(T-APP) ∅ ➤ y: σ1
__________________________________________________________________
∅ ➤ x y : τ

Por x en T-VAR + la información de ∅ , σ = σ1 → τ.
Sin embargo, no tenemos información sobre si y es realmente de tipo σ1, por lo que no podemos hacer un juicio de tipado.
El sistema de tipado no nos permite asegurar nada sobre el tipo de y.
