# a) Obtener los dragones que tengan nombre “Griffin” u “Ocho Cabezas”.
	USE hito2;
    SELECT * FROM Dragon WHERE NombreD IN ('Griffin', 'Ocho Cabezas');
    
# b) Obtener los guerreros que haya comprado dagas en la “Tienda de Rolla” y forjado
#    espadas en la “Forja del enano risueño”.
	USE hito2;
    SELECT * FROM Personaje WHERE Clase = 'Guerrero' 
		AND TipoD IN (SELECT TipoD FROM Tienda_Vende_Daga WHERE NombreT = 'Tienda de Rolla')
        AND NombreP IN (SELECT NombreP FROM Personaje_Compra_Arma WHERE NombreA IN (
			SELECT NombreA FROM Forja_Crea_Arma WHERE NombreF = 'Forja del enano risueño'));
    
# c) Obtener el oro total ganado por los personajes ordenado de mayor a menor.
	USE hito2;
    SELECT * FROM personaje ORDER BY Oro DESC;
    
# d) Obtener el numero total de dragones que ha matado cada jugador con cualquier
#    personaje
	USE hito2;	
	SELECT NombreJ AS Jugador, COUNT(NombreD) AS Dragones_Totales_Derrotados FROM (
		SELECT NombreJ, NombreD FROM Jugador INNER JOIN (
			SELECT IdJ, NombreD FROM Personaje INNER JOIN (
				SELECT NombreP, NombreD FROM Personaje_Entra_Escuadron INNER JOIN 
				Escuadron_Derrota_Dragon ON Personaje_Entra_Escuadron.IdE = Escuadron_Derrota_Dragon.IdE) AS AUX1
			ON Personaje.NombreP = AUX1.NombreP) AS AUX2
		ON Jugador.IdJ = AUX2.IdJ) AS AUX3
	GROUP BY NombreJ;

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
        SELECT * FROM ( SELECT NombreP, Arma.NombreA, Carga FROM Personaje_Compra_Arma INNER JOIN
		Arma ON Personaje_Compra_Arma.NombreA = Arma.NombreA WHERE Carga = true AND Arma.NombreA = 'Hacha de doble punta') AS AUX1
        WHERE NombreP NOT IN ( SELECT NombreP FROM Personaje_Compra_Arma INNER JOIN
		Arma ON Personaje_Compra_Arma.NombreA = Arma.NombreA WHERE Carga = true AND Arma.NombreA <> 'Hacha de doble punta');
        
# g) Obtener nombres, vida y fuerza de guerreros que hayan recibido una pocion de,todos los druidas existentes.
	USE hito2;
	SELECT NombreP, Vida,Fuerza FROM Personaje WHERE Clase = 'Guerrero' AND NombreP IN(
		SELECT NombreP FROM Personaje_Recibe_Pocion 
		GROUP BY NombreP
		HAVING COUNT(DISTINCT Druida) = ( SELECT COUNT(DISTINCT Druida) FROM Personaje_Recibe_Pocion));

# h) Obtener el nivel de los magos que han derrotado a todos los espectros y han comprado todas las dagas disponibles 
#   (NO SE PUEDE HACER LO ULTIMO - DAGAS)
	USE hito2;
	SELECT Nivel FROM Personaje WHERE Clase = 'Mago' AND NombreP IN (
		SELECT NombreP FROM Personaje_Derrota_Monstruo 
		GROUP BY NombreP
		HAVING COUNT(DISTINCT NombreM) = ( SELECT COUNT(DISTINCT NombreM) FROM Monstruo WHERE CodM = 'Espectro' ));
        
# i) Obtener el tanque que ha participado en el maximo numero de escuadrones.
	USE hito2;
    SELECT * FROM personaje WHERE Clase = 'Tanque' AND NombreP IN (
		SELECT NombreP FROM Personaje_Entra_Escuadron
        GROUP BY NombreP
        HAVING COUNT(NombreP) = ( SELECT MAX(Total) FROM (
			SELECT COUNT(NombreP) AS Total FROM Personaje_Entra_Escuadron GROUP BY NombreP) AS AUX));

# j) Obtener el hacha con menor peso y el dueño de la forja donde se hizo
   USE hito2;
   SELECT Arma.NombreA, NombreF FROM Arma INNER JOIN Forja_Crea_Arma 
	ON Arma.NombreA = Forja_Crea_Arma.NombreA WHERE Arma.NombreA IN(
		SELECT NombreA FROM Arma WHERE Peso = (
			SELECT MIN(Peso) FROM Arma WHERE Clase = 'Tanque'));
   