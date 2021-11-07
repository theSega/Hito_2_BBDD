USE Hito2;

INSERT INTO Rol #(Clase, Mana, Vida)
	VALUES('Tanque',100,700),
	('Guerrero',200,500),
	('Mago',300,300);
    
INSERT INTO Ciudad
	VALUES ('Glider'),
	('Forgesand'),
	('Hiltore'),
	('Gazegreenelven'),
	('Greenbat'),
	('Huntdwarf');
    
INSERT INTO Forja #( Forja, Ciudad en la que esta la forja)
	VALUES ('Forja de Harmek','Glider'), 
    ('Forja del Enano Risueño','Forgesand'),
    ('Forja de Tebez','Hiltore');
    
INSERT INTO Arma
	VALUES('Hacha de mano',100,40,'Tanque'), # Hachas
    ('Hacha arrojadiza',50,15,'Tanque'),
    ('Hacha de doble punta',200,70,'Tanque'),
    ('Baculo de Madera', 50,10,'Mago'), # Baculos
    ('Mensajero de Mana',150,50,'Mago'),
    ('Raiz de Oscuridad',300,80,'Mago'),
    ('Alfanje',70,20,'Guerrero'), # Espadas
    ('Espada flamigera',150,70,'Guerrero'),
    ('Bracamarte', 100,50,'Guerrero');
    
INSERT INTO Forja_Crea_Arma
	VALUES ('Hacha de mano','Forja de Harmek'), # Forja de Harmek
    ('Alfanje','Forja de Harmek'),
    ('Baculo de Madera','Forja de Harmek'), 
    ('Mensajero de Mana','Forja del Enano Risueño'), # Forja del Enano Risueño
    ('Espada flamigera','Forja del Enano Risueño'),
	('Hacha arrojadiza','Forja del Enano Risueño'),
	('Hacha de doble punta','Forja del Enano Risueño'),
    ('Hacha de doble punta','Forja de Tebez'), # Forja de Tebez
    ('Bracamarte','Forja de Tebez'),
    ('Baculo de Madera','Forja de Tebez'), 
    ('Raiz de Oscuridad','Forja de Tebez'),
	('Baculo de Madera','Forja de Tebez');
    
INSERT INTO Tienda
	VALUES ('Tienda de Rolla'),
    ('Tienda de Swithron'),
    ('Tienda de Aldlas');
    
INSERT INTO Tienda_Se_Ubica_Ciudad
	VALUES ('Glider','Tienda de Rolla'), # Tienda de Rolla
	('Forgesand','Tienda de Rolla'),
	('Hiltore','Tienda de Rolla'),
	('Gazegreenelven','Tienda de Rolla'),
	('Greenbat','Tienda de Rolla'),
	('Huntdwarf','Tienda de Rolla'),
    ('Glider','Tienda de Swithron'), # Tienda de Swithron
	('Forgesand','Tienda de Swithron'),
	('Hiltore','Tienda de Swithron'),
	('Gazegreenelven','Tienda de Swithron'),
	('Greenbat','Tienda de Swithron'),
	('Huntdwarf','Tienda de Swithron'),
    ('Glider','Tienda de Aldlas'), # Tienda de Aldlas
	('Forgesand','Tienda de Aldlas'),
	('Hiltore','Tienda de Aldlas'),
	('Gazegreenelven','Tienda de Aldlas'),
	('Greenbat','Tienda de Aldlas'),
	('Huntdwarf','Tienda de Aldlas');

INSERT INTO Daga
	VALUES ('Daga de madera'),
    ('Daga de bronce'),
    ('Daga de marfil'),
    ('Daga de diamante');
    
INSERT INTO Tienda_Vende_Daga 
	VALUES ('Daga de madera','Tienda de Rolla'),
    ('Daga de bronce','Tienda de Rolla'),
    ('Daga de madera','Tienda de Swithron'),
    ('Daga de bronce','Tienda de Swithron'),
    ('Daga de marfil','Tienda de Swithron'),
    ('Daga de marfil','Tienda de Aldlas'),
    ('Daga de diamante','Tienda de Aldlas');

INSERT INTO Jugador (NombreJ, UltimaConexion)
	VALUES ('Breakfury','2021-09-30'), #IdJ 1 -> Stanto, Gim
    ('Hammerpowerthunder','2021-11-15'), #IdJ 2 -> Ahkarg, Mashgor, Dryto
    ('Battlerboar','2021-11-22'), #IdJ 3 -> Enso, Carorhall, Bucksel
    ('Cloakbane','2021-08-31'), #IdJ 4 -> Manddin, Xadel
    ('Greyblade','2021-10-19'); #IdJ 5 -> Raendan, Mawki
    
INSERT INTO Personaje #(NombreP, Oro, Nivel, Fuerza, TipoD, IdJ, Clase)
	VALUES ('Raendan',15470,47, 57,'Daga de marfil',5,'Mago'), # Magos
    ('Manddin', 1287, 15, 25,'Daga de madera',4,'Mago'),
    ('Xadel', 70765,83,91,'Daga de diamante',4,'Mago'),
    ('Enso',300,50,60,'Daga de marfil',3,'Mago'),
    ('Stanto',8923,31,41,'Daga de bronce',1,'Guerrero'), # Guerreros
    ('Makwi',9170,65,75,'Daga de marfil',5,'Guerrero'),
    ('Carorhall', 58,27,37,'Daga de madera',3,'Guerrero'),
    ('Dryto', 28340,63,73,'Daga de diamante',2,'Guerrero'),
    ('Ahkarg',103872,94,97,'Daga de diamante',2,'Tanque'), # Tanques
    ('Bucksel',893,43,53,'Daga de bronce',3,'Tanque'),
    ('Mashgor',1357,77,87,'Daga de madera',2,'Tanque'),
    ('Gim',638,7,17,'Daga de madera',1,'Tanque');
    
INSERT INTO Personaje_Compra_Arma #(NombreP, NombreA, Fecha, Carga)
	VALUES ('Raendan','Baculo de Madera','2021-03-01',false), # Magos
    ('Raendan','Mensajero de Mana','2021-07-30',true),
    ('Manddin','Baculo de Madera','2021-06-09',true),
    ('Xadel','Baculo de Madera','2021-02-15',true),
    ('Xadel','Mensajero de Mana','2021-05-17',false),
    ('Xadel','Raiz de Oscuridad','2021-08-26',true),
	('Enso','Baculo de Madera','2021-08-01',true),
    ('Enso','Mensajero de Mana','2021-11-07',true),
    ('Stanto','Alfanje','2021-06-26',true), # Guerreros
    ('Stanto','Bracamarte','2021-08-12',false),
    ('Makwi','Alfanje','2021-06-24',false),
    ('Makwi','Bracamarte','2021-08-26',false),
    ('Makwi','Espada flamigera','2021-10-18',true),
    ('Carorhall','Alfanje','2021-09-14',true),
    ('Carorhall','Bracamarte','2021-11-03',false),
    ('Dryto','Alfanje','2021-09-10',true),
    ('Dryto','Bracamarte','2021-11-08',true),
    ('Ahkarg','Hacha de mano','2021-03-02',false), # Tanques
    ('Ahkarg','Hacha arrojadiza','2021-09-02',false), 
    ('Ahkarg','Hacha de doble punta','2021-10-17',true), 
    ('Bucksel','Hacha arrojadiza','2021-03-25',false),
    ('Bucksel','Hacha de mano','2021-09-01',true),
    ('Mashgor','Hacha de mano','2021-07-30',true),
    ('Mashgor','Hacha arrojadiza','2021-04-26',false), 
    ('Mashgor','Hacha de doble punta','2021-10-17',false),
    ('Gim','Hacha arrojadiza','2021-09-21',true);
	
INSERT INTO Habilidades
	VALUES('Intelecto Arcano','Buff de mana a todo el equipo','Mago'), # Mago
	('Traslacion','Magia de teletransportacion','Mago'),
	('Nova de Escarcha','Magia de hielo en un area cerrada','Mago'),
	('Tajo de mandoble','Tajo unico capaz de destrozar armaduras','Guerrero'), # Guerrero
	('Impacto abrumador','Golpe con el triple de fuerza pero te daña en el proceso ','Guerrero'),
	('Ataque en torbellino','Ataque giratorio con la espada','Guerrero'),
	('Impacto feroz','Impacto unico pero con el doble de fuerza','Tanque'), # Tanque
	('Rompespaldas','Ataque de agarre que hace daño crítico','Tanque'),
	('Seismo','Ataque de 3 ondas de medio alcance','Tanque');
    
INSERT INTO Monstruo #(CodM, NombreM,Vida,Oro,clase)
	VALUES('Espectro','Ligos',300,250,'Mago'),
    ('Espectro','Bachpai',500,1000,'Mago'),
    ('Espectro','Lira',700,1750,'Mago'),
    ('Espectro','Hana',900,2500,'Mago'),
    ('Goblin','Kruulha',200,200,'Guerrero'),
    ('Goblin','Ragbal',400,750,'Guerrero'),
    ('Goblin','Aalor',600,1500,'Guerrero'),
    ('Goblin','Goleth',800,2250,'Guerrero'),
    ('Troll','Ibe',250,500,'Tanque'),
    ('Troll','Ry',500,1500,'Tanque'),
    ('Troll','Ulne',750,2500,'Tanque'),
    ('Troll','Fargan',1000,4000,'Tanque');
    
INSERT INTO Personaje_Derrota_Monstruo #(CodM, NombreM, NombreP)
	VALUES ('Espectro','Ligos','Raendan'),
    ('Espectro','Bachpai','Raendan'),
    ('Espectro','Lira','Raendan'),
    ('Espectro','Ligos','Manddin'),
    ('Espectro','Ligos','Xadel'),
    ('Espectro','Bachpai','Xadel'),
    ('Espectro','Lira','Xadel'),
    ('Espectro','Hana','Xadel'),
    ('Espectro','Ligos','Enso'),
    ('Espectro','Bachpai','Enso'),
    ('Goblin','Kruulha','Stanto'),
    ('Goblin','Ragbal','Stanto'),
	('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
	('Goblin','Kruulha','Carorhall'),
    ('Goblin','Ragbal','Carorhall'),
	('Goblin','Kruulha','Dryto'),
    ('Goblin','Ragbal','Dryto'),
    ('Goblin','Aalor','Dryto'),
    ('Troll','Ibe','Ahkarg'),
    ('Troll','Ry','Ahkarg'),
    ('Troll','Ulne','Ahkarg'),
    ('Troll','Fargan','Ahkarg'),
	('Troll','Ibe','Bucksel'),
    ('Troll','Ry','Bucksel'),
    ('Troll','Ulne','Bucksel'),
	('Troll','Ibe','Mashgor'),
    ('Troll','Ry','Mashgor'),
    ('Troll','Ulne','Mashgor');
    # El Tanque Gim no ha derrotado a ningun Monstruo de CodM = Troll
    
INSERT INTO Escuadron
	VALUES(14632),
    (87393),
    (76391),
    (13256);

INSERT INTO Personaje_Entra_Escuadron
	VALUES  ('Raendan',14632),
    ('Manddin',87393),
    ('Xadel',76391),
    ('Enso',13256),
    ('Stanto',14632),
    ('Makwi',76391),
    ('Carorhall',87393),
    ('Dryto',13256),
    ('Ahkarg',76391),
    ('Bucksel',14632),
    ('Bucksel',13256),
    ('Mashgor',13256),
    ('Gim',87393);

INSERT INTO Dragon
	VALUES('Dehiss','Rojo',1250),
    ('Rannyexbea','Blanco',2500),
    ('Pastan','Verde',3125),
    ('Griffin','Dorado',5000),
	('Kystorm','Azul',7500),
	('Ocho Cabezas','Purpura',10000);

INSERT INTO Escuadron_Derrota_Dragon
	VALUES('Dehiss',14632),
    ('Rannyexbea',14632),
    ('Dehiss',87393),
    ('Dehiss',76391),
    ('Pastan',76391),
    ('Rannyexbea',76391),
    ('Griffin',76391),
    ('Kystorm',76391),
    ('Ocho Cabezas',76391),
    ('Dehiss',13256),
	('Rannyexbea',13256),
	('Pastan',13256);
    
INSERT INTO Dragon_Desbloquea_Dragon
	VALUES('Dehiss','Rannyexbea'), # Dehiss -> 	Rannyexbea	-> Kystorm	|
	('Dehiss','Pastan'), #				|	 							-> Ocho Cabezas
    ('Rannyexbea','Kystorm'), #			|	->	Pastan 		-> Griffin 	|
    ('Pastan','Griffin'),
    ('Kystorm','Ocho Cabezas'),
    ('Griffin','Ocho Cabezas');

INSERT INTO Pocion (RecVida, RecMana)
	VALUES(0,500), # CodP 1 -> Zucsur
    (500,0), # CodP 2 -> Losla
    (300,300), # CodP 3 -> tar
    (750,750); # CodP 4 -> Pikduk

INSERT INTO Personaje_Tiene_Pocion #(CodP, NombreP, Druida, Fecha)
	VALUES (1,'Raendan','Zucsur','2021-03-12'),
    (2,'Raendan','Losla','2021-04-08'),
    (3,'Raendan','Tar','2021-08-08'),
    (1,'Manddin','Zucsur','2021-05-17'),
    (1,'Xadel','Zucsur','2021-05-18'),
    (2,'Xadel','Losla','2021-07-30'),
    (3,'Xadel','Tar','2021-08-14'),
    (4,'Xadel','Pikduk','2021-09-12'),
    (1,'Enso','Zucsur','2021-05-08'),
    (2,'Enso','Losla','2021-06-24'),
    (1,'Stanto','Zucsur','2021-03-18'),
    (2,'Stanto','Losla','2021-04-03'),
    (3,'Stanto','Tar','2021-08-17'),
    (1,'Makwi','Zucsur','2021-07-22'),
    (3,'Makwi','Tar','2021-07-24'),
    (2,'Carorhall','Losla','2021-10-16'),
    (1,'Dryto','Zucsur','2021-03-27'),
    (2,'Dryto','Losla','2021-07-11'),
    (4,'Dryto','Pikduk','2021-07-22'),
    (1,'Ahkarg','Zucsur','2021-02-26'),
    (2,'Ahkarg','Losla','2021-04-06'),
    (3,'Ahkarg','Tar','2021-08-15'),
    (4,'Ahkarg','Pikduk','2021-10-19'),
    (2,'Bucksel','Losla','2021-02-28'),
    (3,'Bucksel','Tar','2021-08-12'),
    (3,'Mashgor','Tar','2021-04-28'),
    (4,'Mashgor','Pikduk','2021-06-06'),
    (1,'Gim','Zucsur','2021-06-15');