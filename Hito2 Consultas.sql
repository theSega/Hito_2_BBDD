# a) Obtener los dragones que tengan nombre “Griffin” u “Ocho Cabezas”.
	USE hito2;
    SELECT*FROM Dragon WHERE NombreD IN ('Griffin', 'Ocho Cabezas');
    
    
# b) Obtener los guerreros que haya comprado dagas en la “Tienda de Rolla” y forjado
#    espadas en la “Forja del enano risueño”.
	USE hito2;
    SELECT * FROM Personaje WHERE Clase = 'Guerrero' 
		AND TipoD IN (SELECT TipoD FROM Tienda_Vende_Daga WHERE NombreT LIKE 'Tienda de Rolla')
        AND NombreP IN (SELECT NombreP FROM Personaje_Compra_Arma WHERE NombreA IN(
			SELECT NombreA FROM Forja_Crea_Arma WHERE NombreF LIKE 'Forja del enano risueño'));
    
# c) Obtener el oro total ganado por los personajes ordenado de mayor a menor.
	USE hito2;
    SELECT * FROM personaje ORDER BY Oro DESC;
    
# d) Obtener el numero total de dragones que ha matado cada jugador con cualquier
#    personaje
	USE hito2;	


# e) Obtener el nombre de los jugadores cuyos personajes no hayan comprado en 
#    tiendas de ciudades con mas de dos forjas.
	USE hito2;
    SELECT NombreJ from Jugador WHERE IdJ IN (
		SELECT IdJ FROM Personaje WHERE TipoD IN ( 
			SELECT TipoD FROM Tienda_Vende_Daga WHERE NombreT IN (
				SELECT NombreT FROM Tienda_Se_Ubica_Ciudad WHERE NombreC IN (
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
		HAVING COUNT(DISTINCT Druida) = 4); # = 4 por que hay 4 diferentes druidas

# h) Obtener el nivel de los magos que han derrotado a todos los espectros y han comprado todas las dagas disponibles.
	USE hito2;
	SELECT Nivel FROM Personaje WHERE Clase='Mago' AND NombreP IN (
		SELECT NombreP FROM Personaje_Derrota_Monstruo 
		GROUP BY NombreP
		HAVING COUNT(DISTINCT NombreM) = 4);
        
# i) Obtener el tanque que ha participado en el maximo numero de escuadrones.
	USE hito2;


# j) Obtener el hacha con menor peso y el dueño de la forja donde se hizo
	USE hito2;
