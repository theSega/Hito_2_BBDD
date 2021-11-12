USE Hito2;

# a) Define un procedimiento con un cursor para sumar 10 a la vida de cada guerrero
#    que haya derrotado al menos 50 goblins.


# b) Añade un atributo ‘ultima conexion’ a la tabla de personajes. Luego, crea un
#    procedimiento que elimine los jugadores que no se hayan conectado en los ultimos
#    60 dias. Puedes usar la funcion DATEDIFF1 para este fin.
	DELIMITER //
    CREATE PROCEDURE ultima_conexion()
	BEGIN
		DELETE FROM hito2.Jugador WHERE DATEDIFF(jugador.UltimaConexion,CONVERT( DATETIME(),DATE)) >= 60;
	END; //
    DELIMITER ; 
    
    