--Punto I y II

-- Curry devuelve la versión currificada de la función pasada como parámetro no currificada
curry' :: ((a,b)->c)->a->b->c
curry f a b = f (a,b)

-- Uncurry es lo mismo pero al revés
uncurrry' :: (a->b->c) -> (a,b)->c
uncurrry f (a b) = f a b