
# a) Define un trigger para que cuando un jugador haya matado al menos 3 dragones,
#    su vida aumente en 5.
	
    DELIMETER //
    USE Hito2;
    CREATE TRIGGER `Vida+5` AFTER INSERT ON Personaje_Derrota_Dragon FOR 
    BEGIN
		UPDATE Personaje SET New.Vida = Old.Vida + 5 WHERE NombreP IN (
				SELECT NombreP FROM Personaje_Entra_Escuadron WHERE IdE IN (
					SELECT IdE FROM Escuadron_Derrota_Dragon 
					GROUP BY IdE
					HAVING COUNT(DISTINCT NombreD) >= 3))
    END //
	DELIMETER ;


# b) Define un trigger para impedir que un escuadron mate un dragon que no haya
#    sido desbloqueado por alguno de sus integrantes.