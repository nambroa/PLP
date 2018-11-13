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
vari(x).
vari(X) :- X = ^(Y), vari(Y).

%Ej 1B: term(+M)
term(mvar(V)) :- vari(V).
term(app(M, N)) :- term(M), term(N).
term(lambda(mvar(V), N)) :- vari(V), term(N).

% No es posible definir term(-X), ya que unifica infinitamente
% con los valores devueltos por la primer regla, que es la que
% usa vari(V).

% Es diferente a vari(-X), ya que unifica con los valores
% mvar(x), mvar(^(x)), etc. en vez de x, ^(x), ^(^(x)), etc.

%Ej 2: fv(+M, -Xs)
fv(M, _) :- not(term(M)), !, fail.
fv(mvar(V), [V]).
fv(app(M, N), Lista) :- fv(M, L1), fv(N, L2), union(L1, L2, Lista).
fv(lambda(V, N), Lista) :- fv(V, L1), fv(N, L2), subtract(L2, L1, Lista).

%Ej 3: sustFV(+M, +X, +Y, ?MSust)
sustFV(mvar(V), V, Var2, mvar(Var2)).
sustFV(mvar(V), Var1, _, MSust) :- V \= Var1, MSust = mvar(V).
sustFV(app(O, N), Var1, Var2, MSust) :-
	sustFV(O, Var1, Var2, OSust), sustFV(N, Var1, Var2, NSust),
	MSust = app(OSust, NSust).
sustFV(lambda(mvar(V), N), V, _, lambda(mvar(V), N)).
sustFV(lambda(mvar(V), N), Var1, Var2, MSust) :-
	V \= Var1, sustFV(N, Var1, Var2, NSust), MSust = lambda(mvar(V), NSust).


%Ej 4: alphaEq(+M, +N)
alphaEq(M, _) :- not(term(M)), !, fail.
alphaEq(_, N) :- not(term(N)), !, fail.
alphaEq(mvar(V), mvar(W)) :- V = W.
alphaEq(app(M, N), app(O, P)) :- alphaEq(M, O), alphaEq(N, P).
alphaEq(lambda(mvar(V), M), lambda(mvar(V), N)) :- alphaEq(M, N).
alphaEq(lambda(mvar(V), M), lambda(mvar(W), N)) :-
	V \== W, fv(M, L), not(member(W, L)), sustFV(M, V, W, MSust),
	alphaEq(MSust, N).

%nonFV(+M, -Var)
nonFV(M, N, Var) :- vari(Var), fv(M, L1), fv(N, L2),
	not(member(Var, L1)), not(member(Var, L2)), !.

%Ej 5: sust(+M, +X, +N, ?MSust)
sust(mvar(V), V, N, N).
sust(mvar(V), W, _, mvar(V)) :- V \== W.
sust(app(M, N), V, O, app(MSust, NSust)) :-
	sust(M, V, O, MSust), sust(N, V, O, NSust).
sust(lambda(mvar(V), N), V, _, lambda(mvar(V), N)).
sust(lambda(mvar(V), N), W, O, Res) :- W \== V,
	nonFV(N, O, Fresca),
	sust(N, Fresca, mvar(V), NSust),
	MSust = lambda(mvar(Fresca), NSust),
	sust(MSust, W, O, Res).

%Ej 6A: betaRedex(+R, ?N)
betaRedex(app(lambda(mvar(V), M), N), Reduccion) :-
	sust(M, V, N, Reduccion).

%Ej 6B: reduce(+M, ?N)
reduce(app(M, N), app(MRedu, N)) :- reduce(M, MRedu).
reduce(app(M, N), app(M, NRedu)) :- reduce(N, NRedu).
reduce(app(lambda(mvar(X), M), N), MSust) :- sust(M, X, N, MSust).
reduce(lambda(mvar(V), M), lambda(mvar(V), MRedu)) :- reduce(M, MRedu).

%Ej 7: formaNormal(+M)
formaNormal(M) :- not(reduce(M, _)).

%Ej 8: leftmost(+M, -N)
leftmost(M, N) :- reduce(M, N), !.

%Ej 9A: formaNormal(+M, -N)
formaNormal(M, M) :- formaNormal(M).
formaNormal(M, N) :-
	not(formaNormal(M)), leftmost(M, X), formaNormal(X, N).

%Ej 9B
% ¿Podrá definirse formaNormal(+M, +N)?
% Si, podrías aplicar leftmost/2 a M hasta llegar a su forma normal O,
% y luego comparar a O con N con alphaEq/2.

%¿O una versión de formaNormal(+M, -N) que sea total? ¿Por qué?
% No se puede hacer total porque los candidatos de N son todos los
% términos alfa equivalentes a la forma normal de M. Además de
% estos términos ser infinitos, nunca se llega a generar el término
% alfa equivalente en el que se sustituye la segunda variable ligada
% en aparecer, ya que sustituyendo la primera ya se tienen infinitos
% términos.

%Ej 10A: long(+M, ?K)
%Ej 10B: long(-M, +K)

%Ej 11A: Extender la definición de fv\2 para que soporte un término parcialmente instanciado
%fv(-M, +Xs)
:- discontiguous fv/2.

%Ej 11B: cerrado(?M)
