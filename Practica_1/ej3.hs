-- ¿Cuál es el valor de esta expresión?
-- [ x | x <- [1..3], y <- [x..3], (x + y) ‘mod’ 3 == 0 ]

El valor sigue la lógica x=1,y=1 | x=1,y=2 | x=1,y=3 | x=2,y=2 | x=2,y=3 | x=3,y=3
Entonces resulta [1,1,1,2,2,3]

