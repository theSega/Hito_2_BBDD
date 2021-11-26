# TRIGGERS

# a) Define un trigger para que cuando un jugador haya matado al menos 3 dragones,
#    su vida aumente en 5.
    DELIMITER //
    DROP TRIGGER IF EXISTS `Vida+5`//
    CREATE TRIGGER `Vida+5` AFTER INSERT ON Escuadron_Derrota_Dragon FOR EACH ROW
    BEGIN
        UPDATE Personaje SET Vida = Vida + 5 WHERE NombreP IN (
				SELECT NombreP FROM Personaje_Entra_Escuadron WHERE IdE IN (
					SELECT IdE FROM Escuadron_Derrota_Dragon 
					GROUP BY IdE
					HAVING COUNT(DISTINCT NombreD) = 3));
    END //
	DELIMITER ;
    
# CONSULTA para probar el trigger a)
# NOTA -> Todas las vidas introducidas en el script de datos acaban en 0  
/*
	use hito2;
	SELECT NombreP, Vida FROM Personaje
*/

# b) Define un trigger para impedir que un escuadron mate un dragon que no haya
#    sido desbloqueado por alguno de sus integrantes.
    DELIMITER $$
	DROP TRIGGER IF EXISTS Todos_Dragon_Desbloqueado $$
    CREATE TRIGGER Todos_Dragon_Desbloqueado BEFORE INSERT ON Escuadron_Derrota_Dragon FOR EACH ROW
    BEGIN
		# Dehiss es el dragon inicial
		IF  New.NombreD <> 'Dehiss' AND (SELECT COUNT(NombreP) FROM Personaje_Entra_Escuadron WHERE IdE = New.IdE) <> (
			SELECT COUNT(NombreP) FROM Personaje_Entra_Escuadron INNER JOIN ( 
				SELECT DISTINCT IdE, NombreD2 FROM Escuadron_Derrota_Dragon 
                INNER JOIN Dragon_Desbloquea_Dragon ON NombreD = NombreD1 ) AS AUX1 
			ON Personaje_Entra_Escuadron.IdE = AUX1.IdE WHERE NombreD2 = New.NombreD AND AUX1.IdE = New.IdE)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No todos los miembros del escuadron tienen el dragon desbloqueado';
		END IF;
    END $$
	DELIMITER ;

# INSERT para probar el trigger b)    
/*
	use hito2;
	INSERT INTO Escuadron_Derrota_Dragon (NombreD, IdE)
	VALUES ('Griffin',14632);
*/