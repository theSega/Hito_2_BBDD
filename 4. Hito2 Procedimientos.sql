USE Hito2;

# a) Define un procedimiento con un cursor para sumar 10 a la vida de cada guerrero
#    que haya derrotado al menos 50 goblins.
	DELIMITER $$
    DROP PROCEDURE IF EXISTS Guerrero_Derrota_Goblin $$
    CREATE PROCEDURE Guerrero_Derrota_Goblin()
	BEGIN
		
	END $$
    DELIMITER ; 

 #LLAMADA para probar el trigger a)
    /*
		call hito2.Guerrero_Derrota_Goblin();
    */

# b) Añade un atributo ‘ultima conexion’ a la tabla de personajes. Luego, crea un
#    procedimiento que elimine los jugadores que no se hayan conectado en los ultimos
#    60 dias. Puedes usar la funcion DATEDIFF1 para este fin.
	DELIMITER //
    DROP PROCEDURE IF EXISTS Ultima_Conexion //
    CREATE PROCEDURE Ultima_Conexion()
	BEGIN
		DELETE FROM hito2.Jugador WHERE DATEDIFF(CURDATE(), Jugador.UltimaConexion) >= 60;
	END //
    DELIMITER ; 
    
    #LLAMADA para probar el trigger b)
    /*
		call hito2.Ultima_Conexion();
    */
    
