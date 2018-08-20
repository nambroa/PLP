-- Una tripla pitagórica es una tripla (a,b,c) de enteros positivos tal que a^2+b^2 = c^2
-- La siguiente expresión intenta ser una definición de una lista (infinita) de triplas pitagoricas.

pitagoricas :: [(Integer, Integer, Integer)]
pitagoricas = [(a,b,c) | a<-[1..], b<-[1..], c<-[1..], a^2+b^2 == c^2]

-- Explicar por qué esta definición no es útil. Dar una definición mejor.

-- No es útil porque se cuelga en (1,1,inf). Por como se ejecutan los parametros, a y b van a ser 1 y nunca van a cambiar de 1.

-- Una mejor definición sería la siguiente. Soluciona el problema de todos los parámetros infinitos.
pitagoricas = [(a,b,c) | a<-[1..], b<-[1..(a^2)], c<-[1..a^2+b^2], a^2+b^2 == c^2]