USE Hito2;


CREATE PROCEDURE ultima_conexion ()
BEGIN
	SET @A = SYSDATETIME(),
	DELETE FROM jugador
	where DATEDIFF(jugador.UltimaConexion,CONVERT(date,@A)>=60;
END


CREATE PROCEDURE masVidaGuerrero ()
BEGIN

END