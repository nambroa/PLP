module Base where
data Componente = Madera | Hoja | Fruto | Flor
    deriving (Eq, Ord, Show)
data Arbol = Rama Componente Arbol Arbol | Brote Componente
	deriving (Show)





