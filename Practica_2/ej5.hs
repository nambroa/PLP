-- Demostrar o explicar por qué no puede demostrarse cada uno de los siguientes juicios de tipado.

-- I) ∅ -> if true then 0 else succ(0) : Nat
-- (contexto ∅ en vez de Γ)						 
												  ____________________
											      (T-ZERO)∅ -> 0: Nat
_____________________       ___________________   _________________________
(T-TRUE)∅ -> true:Bool     (T-ZERO)∅ -> 0: Nat    (T-SUCC)∅ -> succ(0): Nat
____________________________________________________________________________
∅ -> if true then 0 else succ(0) : Nat


-- II) {x : Nat, y : Bool} . if true then false else (λz : Bool. z) true : Bool
-- Con Γ = {x : Nat, y : Bool}
											 (T-VAR) z: Bool ∈ Γ -> z: Bool
													______________________
											 (T-ABS) Γ,z: Bool -> z: Bool			  (T-TRUE)
													_________________________________________________
(T-TRUE)                  (T-FALSE)          (T-APP) Γ -> (λz : Bool.z):Bool->Bool    Γ -> true: Bool
_____________________________________________________________________________________________________
(T-IF) Γ -> true: Bool   Γ -> false: Bool  Γ -> (λz : Bool.z) true: Bool
________________________________________________________________________
Γ -> if true then false else (λz : Bool.z) true: Bool

-- III) ∅ -> if λx : Bool. x then 0 else succ(0) : Nat. 
-- Esta es imposible porque no se puede aplicar T-ABS al final. Falta la parte = : σ → τ

___________________________________________________________________________
(ACA NO SE PUEDE APLICAR T-ABS) ∅,x: Bool -> x: Bool		   (T-ZERO)		   (T-SUCC)
________________________________________________________________________________
(T-IF) ∅ -> (λx : Bool. x): Bool      ∅ -> 0: Nat     ∅ -> succ(0): Nat
_______________________________________________________________________
∅ -> if (λx : Bool. x) then 0 else succ(0) : Nat

