
# a) Define un trigger para que cuando un jugador haya matado al menos 3 dragones,
#    su vida aumente en 5.
	
    DELIMITER //
    DROP TRIGGER IF EXISTS `Vida+5`;
    CREATE TRIGGER `Vida+5` AFTER INSERT ON Escuadron_Derrota_Dragon FOR EACH ROW
    BEGIN
		UPDATE Personaje SET Vida = Vida + 5 WHERE NombreP IN (
				SELECT NombreP FROM Personaje_Entra_Escuadron WHERE IdE IN (
					SELECT IdE FROM Escuadron_Derrota_Dragon 
					GROUP BY IdE
					HAVING COUNT(DISTINCT NombreD) >= 3));
    END; //
	DELIMITER ;

# b) Define un trigger para impedir que un escuadron mate un dragon que no haya
#    sido desbloqueado por alguno de sus integrantes.
    DELIMITER //
    USE Hito2;
    CREATE TRIGGER Todos_Dragon_Desbloqueado AFTER INSERT ON Escuadron_Derrota_Dragon FOR EACH ROW
    BEGIN
		
    END //
	DELIMITER ;