CREATE DATABASE Hito2 
	DEFAULT CHARACTER SET utf8
    COLLATE utf8_spanish2_ci;
    
# ENTIDADES INDEPENDIENTES
CREATE TABLE Hito2.Rol ( 
	Clase VARCHAR(10) UNIQUE,
		CHECK((Clase='Guerrero') OR (Clase ='Tanque') OR (Clase ='Mago')),
	Mana INTEGER NOT NULL DEFAULT 0,
		CHECK ( Mana>=0 ),
	Vida INTEGER NOT NULL DEFAULT 0,
		CHECK ( Vida>=0 ),
	PRIMARY KEY (Clase)
);

# CIUDADES Y DERIVADOS
CREATE TABLE Hito2.Ciudad (
	NombreC VARCHAR(25) UNIQUE NOT NULL,
	PRIMARY KEY (NombreC)
);

CREATE TABLE Hito2.Forja (
	NombreF VARCHAR(25) UNIQUE NOT NULL,
	NombreC VARCHAR(25) NOT NULL,
	PRIMARY KEY (NombreF),
	CONSTRAINT forja_se_ubica_Ciudad
		FOREIGN KEY (NombreC) REFERENCES Hito2.Ciudad (NombreC)
		ON DELETE CASCADE
);

CREATE TABLE Hito2.Arma (
	NombreA VARCHAR(20) UNIQUE NOT NULL,
	Daño INTEGER NOT NULL,
		CHECK(Daño>=20 AND Daño<=500),
	Peso INTEGER NOT NULL,
		CHECK(Peso>=10 AND Peso<=50),
	Clase VARCHAR(10) NOT NULL,
	PRIMARY KEY (NombreA),
	CONSTRAINT arma_valida
        FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Hito2.Forja_Crea_arma (
NombreA VARCHAR(20) NOT NULL,
NombreF VARCHAR(25) NOT NULL,
CONSTRAINT forja_crea_arma
        FOREIGN KEY (NombreA) REFERENCES Hito2.Arma (NombreA),
        FOREIGN KEY (NombreF) REFERENCES Hito2.Forja (NombreF)
);

CREATE TABLE Hito2.Tienda (
	NombreT VARCHAR(25) UNIQUE NOT NULL,
	PRIMARY KEY (NombreT)
);

CREATE TABLE Hito2.Tienda_Se_Ubica_Ciudad (
	NombreC VARCHAR(25) NOT NULL,
	NombreT VARCHAR(25) NOT NULL,
	CONSTRAINT tienda_se_ubica_ciudad
			FOREIGN KEY (NombreC) REFERENCES Hito2.Ciudad (NombreC), 
			FOREIGN KEY (NombreT) REFERENCES	Hito2.Tienda (NombreT)
);

CREATE TABLE Hito2.Daga (
	TipoD VARCHAR(25) UNIQUE NOT NULL DEFAULT 'Daga de Madera',
	PRIMARY KEY (TipoD)
);

# USUARIO Y RELACIONADOS
CREATE TABLE Hito2.Jugador ( 
	IdJ INTEGER(10) UNIQUE NOT NULL AUTO_INCREMENT,
	NombreJ VARCHAR(15) NOT NULL,
	PRIMARY KEY (IdJ)
);

CREATE TABLE Hito2.Personaje (
	NombreP VARCHAR(15) UNIQUE NOT NULL,
	Oro INTEGER NOT NULL DEFAULT 0,
		CHECK( Oro>=0),
	Nivel INTEGER NOT NULL DEFAULT 1,
		CHECK ( Nivel >=1 AND Nivel <=100),
	Fuerza INTEGER NOT NULL DEFAULT 10,
		CHECK( Fuerza>=10 AND Fuerza<=100),
	TipoD VARCHAR(20) NOT NULL,
    IdJ INTEGER(10) UNIQUE NOT NULL,
    Clase VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (NombreP),
    CONSTRAINT tener_daga
		FOREIGN KEY (TipoD) REFERENCES Hito2.Daga (TipoD)
        ON UPDATE CASCADE,
        FOREIGN KEY (IdJ) REFERENCES Hito2.Jugador (IdJ)
        ON DELETE CASCADE,
        FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Hito2.Personaje_Compra_Arma( # nope
	NombreP VARCHAR(15) NOT NULL,
	NombreA VARCHAR(20) NOT NULL,
	Fecha DATE,
	Carga BOOLEAN NOT NULL DEFAULT false,
	CONSTRAINT personaje_compra_arma
            FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP),
			FOREIGN KEY (NombreA) REFERENCES Hito2.Arma (NombreA)
);

CREATE TABLE Hito2.Habilidades (
	NombreH VARCHAR(20) UNIQUE NOT NULL,
	Descripcion TEXT NOT NULL,
	Clase VARCHAR(10) NOT NULL,
	CONSTRAINT habilidad_de_rol
		FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

# MONSTRUOS
CREATE TABLE Hito2.Monstruo (
	CodM VARCHAR(10) NOT NULL,
		CHECK((CodM='Goblin') OR (CodM ='Troll') OR (CodM ='Espectro')),
	NombreM VARCHAR(15) UNIQUE,
	Vida INTEGER NOT NULL,
		CHECK(Vida>=0 AND Vida<=500),
	Oro INTEGER NOT NULL DEFAULT 50,
		CHECK( Oro>=50 AND Oro<=120),
	Clase VARCHAR(10) NOT NULL,
    PRIMARY KEY (CodM, NombreM),
	CONSTRAINT rol_derrota_monstruo
			FOREIGN KEY (Clase) REFERENCES Hito2.Rol (Clase)
);

CREATE TABLE Hito2.Persoanje_Derrota_Monstruo (
	CodM VARCHAR(10) NOT NULL,
    NombreM VARCHAR(15),
	NombreP VARCHAR(15) NOT NULL,
	CONSTRAINT personaje_derrota_monstruo
			FOREIGN KEY (CodM) REFERENCES Hito2.Monstruo (CodM),
			FOREIGN KEY (CodM) REFERENCES Hito2.Monstruo (NombreM),
			FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
);

# ESCUADRON Y DERIVADOS
CREATE TABLE Hito2.Escuadron (
	IdE INTEGER(10) UNIQUE NOT NULL,
	PRIMARY KEY(IdE)
);

CREATE TABLE Hito2.Personaje_Entra_Escuadron (
	IdE INTEGER(8) UNIQUE NOT NULL,
	NombreP VARCHAR(15) NOT NULL,
	Druida VARCHAR(20) NOT NULL,
	FechaP DATE NOT NULL,
	CONSTRAINT personaje_entra_escuadron
		FOREIGN KEY (IdE) REFERENCES Hito2.Escuadron (IdE),
		FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
);

CREATE TABLE Hito2.Dragon (
	NombreD VARCHAR(25) UNIQUE NOT NULL,
	Apariencia VARCHAR(10) NOT NULL,
	Vida INTEGER NOT NULL,
		CHECK( Vida>=0 AND Vida<=10000),
	PRIMARY KEY (NombreD)
);

CREATE TABLE Hito2.Escuadron_Derrota_Dragon (
	NombreD VARCHAR(25) NOT NULL,
	IdE INTEGER(8) NOT NULL,
	CONSTRAINT escuadron_derrota_dragon
		FOREIGN KEY (NombreD) REFERENCES Hito2.Dragon (NombreD),
		FOREIGN KEY (IdE) REFERENCES Hito2.Escuadron (IdE)
);

CREATE TABLE Hito2.Dragon_Desbloquea_Dragon (
	NombreD1 VARCHAR(25) NOT NULL,
	NombreD2 VARCHAR(25) NOT NULL,
	CONSTRAINT dragon_desbloquea_dragon
		FOREIGN KEY (NombreD1) REFERENCES Hito2.Dragon (NombreD),
		FOREIGN KEY (NombreD2) REFERENCES Hito2.Dragon (NombreD)
);

# POCION Y DERIVADOS
CREATE TABLE Hito2.Pocion (
CodP INTEGER(2) NOT NULL,
RecVida INTEGER NOT NULL DEFAULT 0,
	CHECK( RecVIda>=0 AND RecVida<=700),
RecMana INTEGER NOT NULL DEFAULT 0,
	CHECK( RecMana>=0 AND RecMana<=300),
PRIMARY KEY(CodP)
);

CREATE TABLE Hito2.Personaje_Recibe_Pocion (
CodP INTEGER(2) NOT NULL,
NombreP VARCHAR(15) NOT NULL,
Druida VARCHAR(20) NOT NULL,
FechaP DATE NOT NULL,
CONSTRAINT personaje_recibe_pocion
	FOREIGN KEY (CodP) REFERENCES Hito2.Pocion (CodP),
    FOREIGN KEY (NombreP) REFERENCES Hito2.Personaje (NombreP)
);
