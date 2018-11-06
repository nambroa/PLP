-- I) Definir el tipo de datos RoseTree de árboles no vacíos, donde cada nodo tiene una cantidad indeterminada de hijos.
data RoseTree tInterno = Rose [RoseTree]
data tInterno = Rosa Rosarbol

-- II) Escribir el esquema de recursión estructural para RoseTree. Importante escribir primero su tipo.

foldRT :: (a->[b]->b) -> RoseTree a-> [a]
foldRT f (Rose x xs) = f x (map (foldRT f) xs)

main = do
	print("Oh hai!")