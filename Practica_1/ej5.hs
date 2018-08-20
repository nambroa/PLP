factorial n = product [1..n]

-- Generar la lista de los primeros mil números primos. Observar como la evaluación lazy facilita la implementación de la lista.

milPrimos :: [Integer]
milPrimos = take 1000 todosLosPrimos

todosLosPrimos :: [Integer]
todosLosPrimos = [x | x<-[1..], length (divisores x) == 2]
				 where divisores x = [d | d<-[1..x], mod x d == 0]

main = print (milPrimos)
