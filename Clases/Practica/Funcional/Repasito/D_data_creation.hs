-- Defining algebraic types

-- Constructors w/ parameters
-- Tengo has two possible constructors, but they have parameters, so some Tengos will be Sueños (only Float) and others will be Pajas (two Integers)
data Tengo = Sueño Float | Paja Float Float  deriving (Show)

-- Constructors without parameters
-- Pijazo only has two elements: Fuerte and Leve
-- deriving Show allows us to print Pijazo data types with the string values "Leve" and "Fuerte"
data Pijazo = Leve | Fuerte deriving (Show)

leve = Leve
fuerte = Fuerte
tengoSueño = Sueño 1
tengoPaja = Paja 2 4


-- The Tengo datatype allows us to do pattern matching, basically we can establish different behaviors depending on the input type.
-- The pattern Sueño will match with "Tengo Sueño" and the pattern Paja will match with "Tengo Paj"
queTengo :: Tengo -> String
queTengo (Sueño sueño) = show sueño 
queTengo (Paja paja1 paja2) = do
	let paja3 = paja1+paja2
	show paja3


main = do
	print(leve)
	print(fuerte)
	print(tengoSueño)
	print(tengoPaja)
	print(queTengo tengoSueño)
	print(queTengo tengoPaja)
