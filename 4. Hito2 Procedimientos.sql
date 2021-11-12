USE Hito2;

# a) Define un procedimiento con un cursor para sumar 10 a la vida de cada guerrero
#    que haya derrotado al menos 50 goblins.
	DELIMITER $$
    DROP PROCEDURE IF EXISTS Guerrero_Derrota_Goblin $$
    CREATE PROCEDURE Guerrero_Derrota_Goblin()
	BEGIN
	
		DECLARE var_Nombre VARCHAR(15);
        DECLARE var_Vida INTEGER;
		DECLARE var_Rol ENUM('Guerrero','Tanque','Mago');
        DECLARE final INTEGER DEFAULT 0;
        DECLARE Cur CURSOR FOR SELECT NombreP, Vida, Clase FROM Personaje;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET final = 1;
        OPEN Cur;
			bucle: LOOP
			
				FETCH cur INTO var_Nombre, var_Vida, var_Rol;
			
				IF final = 1 THEN
					LEAVE bucle;
				END IF;
				
				UPDATE Personaje SET Vida = var_Vida + 10 WHERE var_Rol = 'Guerrero' AND var_Nombre IN (
					SELECT NombreP, COUNT(CodM) FROM Personaje_Derrota_Monstruo WHERE CodM  = 'Goblin'
					GROUP BY NombreP
					HAVING COUNT(CodM) >= 50 );
        
			END LOOP bucle;
        CLOSE Cur;
	END $$
    DELIMITER ; 

 #LLAMADA para probar el trigger a)
    /*
		call hito2.Guerrero_Derrota_Goblin();
    */

# b) Añade un atributo ‘ultima conexion’ a la tabla de personajes. Luego, crea un
#    procedimiento que elimine los jugadores que no se hayan conectado en los ultimos
#    60 dias. Puedes usar la funcion DATEDIFF para este fin.
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
    
