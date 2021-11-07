

# f ) Obtener los tanques que unicamente portan hachas de doble punta
	USE hito2;
    SELECT NombreP, NombreA, Carga FROM Personaje_Compra_Arma 
		WHERE NombreA = 'Hacha de doble punta'
        AND Carga = true;
    
# g) Obtener nombres, vida y fuerza de guerreros que hayan recibido una pocion de,todos los druidas existentes.
	USE hito2;
    SELECT NombreP, Vida, Fuerza FROM  Personaje LEFT JOIN Personaje_Recibe_Pocion ON

# h) Obtener el nivel de los magos que han derrotado a todos los espectros y han comprado todas las dagas disponibles.
	USE hito2;


