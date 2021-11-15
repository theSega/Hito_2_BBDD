DROP DATABASE IF EXISTS Hito2;
CREATE DATABASE Hito2 
	DEFAULT CHARACTER SET utf8
    COLLATE utf8_spanish2_ci;
USE Hito2;
    
# BASE
    
# ENTIDADES INDEPENDIENTES
CREATE TABLE Rol ( 
	Clase ENUM('Guerrero','Tanque','Mago'),
	PRIMARY KEY (Clase)
);

# CIUDADES Y DERIVADOS
CREATE TABLE Ciudad (
	NombreC VARCHAR(25) UNIQUE NOT NULL,
	PRIMARY KEY (NombreC)
);

CREATE TABLE Forja (
	NombreF VARCHAR(25) UNIQUE NOT NULL,
	NombreC VARCHAR(25) NOT NULL,
	PRIMARY KEY (NombreF),
	CONSTRAINT forja_se_ubica_Ciudad
		FOREIGN KEY (NombreC) REFERENCES Hito2.Ciudad (NombreC)
		ON DELETE CASCADE
);

CREATE TABLE Arma (
	NombreA VARCHAR(20) UNIQUE NOT NULL,
	Daño INTEGER NOT NULL,
		CHECK(Daño>=20),
	Peso INTEGER NOT NULL,
		CHECK(Peso>=10 AND Peso<=80),
	Clase ENUM('Guerrero','Tanque','Mago'),
	PRIMARY KEY (NombreA),
	CONSTRAINT arma_valida
        FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Forja_Crea_arma (
NombreA VARCHAR(20) NOT NULL,
NombreF VARCHAR(25) NOT NULL,
CONSTRAINT forja_crea_arma
        FOREIGN KEY (NombreA) REFERENCES Hito2.Arma (NombreA)
        ON DELETE CASCADE,
        FOREIGN KEY (NombreF) REFERENCES Hito2.Forja (NombreF)
        ON DELETE CASCADE
);

CREATE TABLE Tienda (
	NombreT VARCHAR(25) UNIQUE NOT NULL,
	PRIMARY KEY (NombreT)
);

CREATE TABLE Tienda_Se_Ubica_Ciudad (
	NombreC VARCHAR(25) NOT NULL,
	NombreT VARCHAR(25) NOT NULL,
	CONSTRAINT tienda_se_ubica_ciudad
			FOREIGN KEY (NombreC) REFERENCES Hito2.Ciudad (NombreC)
            ON DELETE CASCADE, 
			FOREIGN KEY (NombreT) REFERENCES	Hito2.Tienda (NombreT)
            ON DELETE CASCADE
);

CREATE TABLE Daga (
	TipoD VARCHAR(25) UNIQUE NOT NULL DEFAULT 'Daga de Madera',
	PRIMARY KEY (TipoD)
);

CREATE TABLE Tienda_Vende_Daga (
	TipoD VARCHAR(25)  NOT NULL,
	NombreT VARCHAR(25) NOT NULL,
	CONSTRAINT vende
				FOREIGN KEY (TipoD) REFERENCES Hito2.Daga (TipoD)
                ON DELETE CASCADE, 
				FOREIGN KEY (NombreT) REFERENCES	Hito2.Tienda (NombreT)
                ON DELETE CASCADE
);

# USUARIO Y RELACIONADOS
CREATE TABLE Jugador ( 
	NombreJ VARCHAR(20) NOT NULL,
    IdJ INTEGER(10) UNIQUE NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (IdJ)
);

CREATE TABLE Personaje (
	NombreP VARCHAR(15) UNIQUE NOT NULL,
	Oro INTEGER NOT NULL DEFAULT 0,
		CHECK( Oro>=0),
	Nivel INTEGER NOT NULL DEFAULT 1,
		CHECK ( Nivel >=1 AND Nivel <=100),
	Fuerza INTEGER NOT NULL DEFAULT 10,
		CHECK( Fuerza>=10 AND Fuerza<=100),
	Mana INTEGER NOT NULL DEFAULT 0,
		CHECK ( Mana>=0 ),
	Vida INTEGER NOT NULL DEFAULT 0,
		CHECK ( Vida>=0 ),
	TipoD VARCHAR(20) NOT NULL,
    IdJ INTEGER(10) NOT NULL,
    Clase ENUM('Guerrero','Tanque','Mago'),
    UltimaConexion DATE, #Ejercicio 4 Apartado b)
	PRIMARY KEY (NombreP),
    CONSTRAINT tener_daga
		FOREIGN KEY (TipoD) REFERENCES Hito2.Daga (TipoD)
        ON UPDATE CASCADE,
        FOREIGN KEY (IdJ) REFERENCES Hito2.Jugador (IdJ)
        ON DELETE CASCADE,
        FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Personaje_Compra_Arma( # nope
	NombreP VARCHAR(15) NOT NULL,
	NombreA VARCHAR(20) NOT NULL,
	Fecha DATE,
	Carga BOOLEAN NOT NULL DEFAULT false,
	CONSTRAINT personaje_compra_arma
            FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
            ON DELETE CASCADE,
			FOREIGN KEY (NombreA) REFERENCES Hito2.Arma (NombreA)
            ON DELETE CASCADE
);

CREATE TABLE Habilidades (
	NombreH VARCHAR(20) UNIQUE NOT NULL,
	Descripcion TEXT,
	Clase ENUM('Guerrero','Tanque','Mago'),
	CONSTRAINT habilidad_de_rol
		FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

# MONSTRUOS
CREATE TABLE Monstruo (
	CodM ENUM('Goblin','Troll','Espectro') NOT NULL,
	NombreM VARCHAR(15) UNIQUE,
	Oro INTEGER NOT NULL DEFAULT 50,
		CHECK(Oro>=50),
    Vida INTEGER NOT NULL,
		CHECK(Vida>=0),
	Clase ENUM('Guerrero','Tanque','Mago'),
    PRIMARY KEY (CodM, NombreM),
	CONSTRAINT rol_derrota_monstruo
			FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Personaje_Derrota_Monstruo (
	CodM ENUM('Goblin','Troll','Espectro') NOT NULL,
    NombreM VARCHAR(15),
	NombreP VARCHAR(15) NOT NULL,
	CONSTRAINT personaje_derrota_monstruo
			FOREIGN KEY (CodM) REFERENCES Hito2.Monstruo (CodM),
			FOREIGN KEY (NombreM) REFERENCES Hito2.Monstruo (NombreM),
			FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
            ON DELETE CASCADE
);

# ESCUADRON Y DERIVADOS
CREATE TABLE Escuadron (
	IdE INTEGER(5) UNIQUE NOT NULL,
	PRIMARY KEY(IdE)
);

CREATE TABLE Personaje_Entra_Escuadron (
	NombreP VARCHAR(15) NOT NULL,
    IdE INTEGER(5) NOT NULL,
	CONSTRAINT personaje_entra_escuadron
		FOREIGN KEY (IdE) REFERENCES Hito2.Escuadron (IdE)
        ON DELETE CASCADE,
		FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
        ON DELETE CASCADE
);

CREATE TABLE Dragon (
	NombreD VARCHAR(25) UNIQUE NOT NULL,
	Apariencia VARCHAR(10) NOT NULL,
	Vida INTEGER NOT NULL,
		CHECK( Vida>=0),
	PRIMARY KEY (NombreD)
);

CREATE TABLE Escuadron_Derrota_Dragon (
	NombreD VARCHAR(25) NOT NULL,
	IdE INTEGER(8) NOT NULL,
	CONSTRAINT escuadron_derrota_dragon
		FOREIGN KEY (NombreD) REFERENCES Hito2.Dragon (NombreD),
		FOREIGN KEY (IdE) REFERENCES Hito2.Escuadron (IdE)
        ON DELETE CASCADE
);

CREATE TABLE Dragon_Desbloquea_Dragon (
	NombreD1 VARCHAR(25) NOT NULL,
	NombreD2 VARCHAR(25) NOT NULL,
	CONSTRAINT dragon_desbloquea_dragon
		FOREIGN KEY (NombreD1) REFERENCES Hito2.Dragon (NombreD),
		FOREIGN KEY (NombreD2) REFERENCES Hito2.Dragon (NombreD)
);

# POCION Y DERIVADOS
CREATE TABLE Pocion (
	CodP INTEGER(1) NOT NULL AUTO_INCREMENT,
	RecVida INTEGER NOT NULL DEFAULT 0,
		CHECK( RecVIda>=0),
	RecMana INTEGER NOT NULL DEFAULT 0,
		CHECK( RecMana>=0),
	PRIMARY KEY(CodP)
);

CREATE TABLE Personaje_Recibe_Pocion (
	CodP INTEGER(1) NOT NULL,
	NombreP VARCHAR(15) NOT NULL,
	Druida VARCHAR(20) NOT NULL,
	FechaP DATE NOT NULL,
	CONSTRAINT personaje_recibe_pocion
		FOREIGN KEY (CodP) REFERENCES Hito2.Pocion (CodP)
		ON DELETE CASCADE,
		FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
		ON DELETE CASCADE
);

# SEMANTICA NO CONTEMPLADA

	DELIMITER //
	DROP TRIGGER IF EXISTS `Arma_Valida+Equipa_Arma`//
		CREATE TRIGGER `Arma_Valida+Equipa_Arma` BEFORE INSERT ON Personaje_Compra_Arma FOR EACH ROW
		BEGIN
			IF (SELECT Clase FROM Arma WHERE NombreA = New.NombreA) <> (SELECT Clase FROM Personaje WHERE NombreP = New.NombreP)
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personaje no puede comprar un arma de un rol diferente';
			ELSEIF New.Carga = true AND (SELECT Fuerza FROM Personaje WHERE NombreP = New.NombreP) >= ((
				SELECT Peso FROM Arma WHERE NombreA = New.NombreA) + (SELECT SUM(Peso) FROM Arma 
					INNER JOIN 
					Personaje_Compra_Arma ON Arma.NombreA = Personaje_Compra_Arma.NombreA
					WHERE Carga = true AND Personaje_Compra_Arma.NombreP = New.NombreP))
			THEN SET New.Carga = false; #No impide la obtencion del arma pero si evita que se equipe si no hay suficiente fuerza
			END IF;
		END //
	DELIMITER ;

	DELIMITER //
	DROP TRIGGER IF EXISTS Misiones_Monstruos//
		CREATE TRIGGER Misiones_Monstruos BEFORE INSERT ON Personaje_Derrota_Monstruo FOR EACH ROW
		BEGIN
			IF (SELECT Clase FROM Monstruo WHERE NombreM = New.NombreM AND CodM = New.CodM) <> (SELECT Clase FROM Personaje WHERE NombreP = New.NombreP)
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Personaje no puede derrotar este tipo de monstruo';
			ELSE UPDATE Personaje SET Oro = Oro + (SELECT Oro FROM Monstruo WHERE NombreM = New.NombreM AND CodM = New.CodM) WHERE NombreP = New.NombreP;
			END IF;
		END //
	DELIMITER ;

	DELIMITER //
	DROP TRIGGER IF EXISTS Necesario_1_de_Cada_Rol//
		CREATE TRIGGER Necesario_1_de_Cada_Rol BEFORE INSERT ON Escuadron_Derrota_Dragon FOR EACH ROW
		BEGIN
			IF (SELECT COUNT(DISTINCT Clase) FROM Rol) <> (SELECT COUNT(DISTINCT Clase) FROM Personaje 
				INNER JOIN Personaje_Entra_Escuadron ON Personaje.NombreP = Personaje_Entra_Escuadron.NombreP 
					WHERE IdE = New.IdE)
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Escuadron necesita al menos un personaje de cada rol';
			END IF;
		END //
	DELIMITER ;

