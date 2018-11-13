show(X, S):- vari(X), variNumber(X, N), swritef(S, 'x%d', [N]).
show(mvar(X), S) :- show(X, S).
show(app(M, N), S) :- N = app(_, _), show(M, SM), show(N, SN), swritef(S, '%w (%w)', [SM, SN]).
show(app(M, N), S) :- N \= app(_, _), show(M, SM), show(N, SN), swritef(S, '%w %w', [SM, SN]).
show(lambda(X, M), S) :- show(X, SX), show(M, SM), swritef(S, '(λ%w. %w)', [SX, SM]).
show(X) :- show(X, S), write(S).

variNumber(x, 0).
variNumber(^(X), N) :- variNumber(X, M), N is M+1.

%Ejemplos:
%M1 = (λx0. x0)
term(1, lambda(x, mvar(x))).
%M2 = (λx0. x0) x1
term(2, app(Id, mvar(^(x)) ) ) :- term(1, Id).
%M3 = (λx1. x0)
term(3, lambda(^(x), mvar(x))).
%M4 = (λx1. x0) x2
term(4, app(ConstX, mvar(^(^(x))))) :- term(3, ConstX).
%M5 = (λx0. (λx1. x0))
term(5, lambda(x, lambda(^(x), mvar(x)))).
%M6 = (λx0. (λx1. x1))
term(6, lambda(x, lambda(^(x), mvar(^(x))))).
%M7 = (λx0. x0 x0)
term(7, lambda(x, app(mvar(x), mvar(x)))).
%M8 = (λx0. x0 x0) (λx0. x0 x0) -- este término reduce a sí mismo.
term(8, app(Omega, Omega)) :- term(7, Omega).
%M9 = (λx1. x0) ((λx0. x0 x0) (λx0. x0 x0)) -- este término admite una reducción infinta y una f.n.
term(9, app(ConstX, OMEGA)) :- term(3, ConstX), term(8, OMEGA).

%Ej 1A: vari(?X)
%Ej 1B: term(+M)

%Ej 2: fv(+M, -Xs)

%Ej 3: sustFV(+M, +X, +Y, ?MSust)

%Ej 4: alphaEq(+M, +N) 

%Ej 5: sust(+M, +X, +N, ?MSust)

%Ej 6A: betaRedex(+R, ?N) 
%Ej 6B: reduce(+M, ?N) 

%Ej 7: formaNormal(+M)

%Ej 8: leftmost(+M, -N)

%Ej 9: formaNormal(+M, -N)

%Ej 10A: long(+M, ?K)
%Ej 10B: long(-M, +K)

%Ej 11A: Extender la definición de fv\2 para que soporte un término parcialmente instanciado 
%fv(-M, +Xs)
:- discontiguous fv/2.

%Ej 11B: cerrado(?M)

