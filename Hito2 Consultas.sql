
# e) Obtener el nombre de los jugadores cuyos personajes no hayan comprado en 
#    tiendas de ciudades con mas de dos forjas.
	USE hito2;
    SELECT NombreJ from Jugador WHERE IdJ IN (
		SELECT IdJ FROM Personaje WHERE TipoD IN ( 
			SELECT TipoD FROM Tienda_Vende_Daga WHERE NombreT IN (
				SELECT NombreT FROM Tienda_Se_Ubica_Ciudad WHERE NombreC IN(
					SELECT NombreC FROM Forja
					GROUP BY NombreC 
					HAVING COUNT(DISTINCT NombreF) <= 2))));

# f ) Obtener los tanques que unicamente portan hachas de doble punta
	USE hito2;
    SELECT NombreP, NombreA, Carga FROM Personaje_Compra_Arma 
		WHERE NombreA = 'Hacha de doble punta'
        AND Carga = true;
    
# g) Obtener nombres, vida y fuerza de guerreros que hayan recibido una pocion de,todos los druidas existentes.
	USE hito2;
	SELECT NombreP, Vida,Fuerza FROM Personaje WHERE Clase = 'Guerrero' AND NombreP IN(
		SELECT NombreP FROM Personaje_Recibe_Pocion 
		GROUP BY NombreP
		HAVING COUNT(DISTINCT Druida) = 4);

# h) Obtener el nivel de los magos que han derrotado a todos los espectros y han comprado todas las dagas disponibles.
	USE hito2;
	SELECT Nivel FROM Personaje WHERE Clase='Mago' AND NombreP IN (
		SELECT NombreP FROM Personaje_Derrota_Monstruo 
		GROUP BY NombreP
		HAVING COUNT(DISTINCT NombreM) = 4);

