# DATOS

INSERT INTO Rol 
	VALUES('Tanque'),
	('Guerrero'),
	('Mago');
    
INSERT INTO Ciudad
	VALUES ('Glider'),
	('Forgesand'),
	('Hiltore'),
	('Gazegreenelven'),
	('Greenbat'),
	('Huntdwarf');
    
INSERT INTO Forja #( NombreF, NombreC ->Ciudad en la que esta la forja)
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
	VALUES ('Hacha arrojadiza','Forja de Harmek'), # Forja de Harmek
    ('Alfanje','Forja de Harmek'),
    ('Baculo de Madera','Forja de Harmek'), 
    ('Mensajero de Mana','Forja del Enano Risueño'), # Forja del Enano Risueño
    ('Bracamarte','Forja del Enano Risueño'),
	('Hacha de mano','Forja del Enano Risueño'),
    ('Hacha de doble punta','Forja de Tebez'), # Forja de Tebez
    ('Espada Flamigera','Forja de Tebez'),
    ('Raiz de Oscuridad','Forja de Tebez');
	
    
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
    ('Daga de bronce','Tienda de Swithron'),
    ('Daga de marfil','Tienda de Swithron'),
    ('Daga de diamante','Tienda de Aldlas');

INSERT INTO Jugador (NombreJ)
	VALUES ('Breakfury'), #IdJ 1 -> Stanto, Gim
    ('Hammerpowerthunder'), #IdJ 2 -> Ahkarg, Mashgor, Dryto
    ('Battlerboar'), #IdJ 3 -> Enso, Carorhall, Bucksel
    ('Cloakbane'), #IdJ 4 -> Manddin, Xadel
    ('Greyblade'); #IdJ 5 -> Raendan, Mawki
    
INSERT INTO Personaje (NombreP, Oro, Nivel, TipoD, IdJ, Clase, UltimaConexion)
	VALUES ('Raendan',15470,47,'Daga de marfil',5,'Mago','2021-10-19'), # Magos
    ('Manddin', 1287, 15,'Daga de madera',4,'Mago','2021-08-31'),
    ('Xadel', 70765,83,'Daga de diamante',4,'Mago','2021-08-31'),
    ('Enso',300,50,'Daga de marfil',3,'Mago','2021-11-22'),
    ('Stanto',8923,31,'Daga de bronce',1,'Guerrero','2021-09-30'), # Guerrero
    ('Makwi',9170,65,'Daga de marfil',5,'Guerrero','2021-10-19'),
    ('Carorhall',58,27,'Daga de madera',3,'Guerrero','2021-11-22'),
    ('Dryto', 28340,63,'Daga de diamante',2,'Guerrero','2021-11-15'),
    ('Ahkarg',103872,94,'Daga de diamante',2,'Tanque','2021-11-15'), # Tanque
    ('Bucksel',893,43,'Daga de bronce',3,'Tanque','2021-11-22'),
    ('Mashgor',1357,77,'Daga de madera',2,'Tanque','2021-11-15'),
    ('Gim',638,7,'Daga de madera',1,'Tanque','2021-09-30');
    
INSERT INTO Personaje_Compra_Arma (NombreP, NombreA, Fecha, Carga)
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
    ('Mashgor','Hacha de mano','2021-07-30',false),
    ('Mashgor','Hacha arrojadiza','2021-04-26',true), 
    ('Mashgor','Hacha de doble punta','2021-10-17',true),
    ('Gim','Hacha arrojadiza','2021-09-21',true);
	
INSERT INTO Habilidades
	VALUES('Intelecto Arcano','Buff de recuperacion de mana a todo el equipo','Mago'), # Mago
	('Traslacion','Magia de teletransportacion','Mago'),
	('Nova de Escarcha','Magia de hielo en un area cerrada','Mago'),
	('Tajo de mandoble','Tajo unico capaz de destrozar armaduras','Guerrero'), # Guerrero
	('Impacto abrumador','Golpe con el triple de fuerza pero te daña en el proceso ','Guerrero'),
	('Ataque en torbellino','Ataque giratorio con la espada','Guerrero'),
	('Impacto feroz','Impacto unico pero con el doble de fuerza','Tanque'), # Tanque
	('Rompespaldas','Ataque de agarre que hace daño crítico','Tanque'),
	('Seismo','Ataque de 3 ondas de medio alcance','Tanque');
    
INSERT INTO Monstruo #(CodM, NombreM,Oro,Vida,clase)
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
    ('Espectro','Lira','Enso'),
    ('Espectro','Hana','Enso'),
    ('Goblin','Kruulha','Stanto'),
    ('Goblin','Ragbal','Stanto'),
	('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    # DATOS para probar procedimiento a)
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    ('Goblin','Aalor','Makwi'),
    ('Goblin','Goleth','Makwi'),
    ('Goblin','Kruulha','Makwi'),
    ('Goblin','Ragbal','Makwi'),
    # -- -- -- -- -- -- -- --
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
	VALUES('Dehiss','Rojo',12500),
    ('Rannyexbea','Blanco',25000),
    ('Pastan','Verde',31250),
    ('Griffin','Dorado',50000),
	('Kystorm','Azul',75000),
	('Ocho Cabezas','Purpura',100000);
    
INSERT INTO Dragon_Desbloquea_Dragon
	VALUES('Dehiss','Rannyexbea'), # Dehiss -> 	Rannyexbea	-> Kystorm	|
	('Dehiss','Pastan'), #				|	 							-> Ocho Cabezas
    ('Rannyexbea','Kystorm'), #			|	->	Pastan 		-> Griffin 	|
    ('Pastan','Griffin'),
    ('Kystorm','Ocho Cabezas'),
    ('Griffin','Ocho Cabezas');

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
    
INSERT INTO Pocion (RecVida, RecMana)
	VALUES(0,500),
    (500,0), 
    (300,300), 
    (750,750); 

INSERT INTO hito2.Personaje_Recibe_Pocion #(CodP, NombreP, Druida, Fecha)
	VALUES (1,'Raendan','Zucsur','2021-03-12'), # Magos
    (2,'Raendan','Losla','2021-04-08'),
    (3,'Raendan','Tar','2021-08-08'),
    (1,'Manddin','Zucsur','2021-05-17'),
    (1,'Xadel','Zucsur','2021-05-18'),
    (2,'Xadel','Losla','2021-07-30'),
    (3,'Xadel','Tar','2021-08-14'),
    (4,'Xadel','Pikduk','2021-09-12'),
    (1,'Enso','Zucsur','2021-05-08'),
    (2,'Enso','Losla','2021-06-24'),
    (1,'Stanto','Zucsur','2021-03-18'), # Guerrero
    (2,'Stanto','Losla','2021-04-03'),
    (3,'Stanto','Tar','2021-08-17'),
    (1,'Makwi','Zucsur','2021-07-22'),
    (3,'Makwi','Tar','2021-07-24'),
    (2,'Carorhall','Losla','2021-10-16'),
    (1,'Dryto','Zucsur','2021-03-27'),
    (2,'Dryto','Losla','2021-07-11'),
	(3,'Dryto','Tar','2021-07-17'),
    (4,'Dryto','Pikduk','2021-07-22'),
    (1,'Ahkarg','Zucsur','2021-02-26'), # Tanque
    (2,'Ahkarg','Losla','2021-04-06'),
    (3,'Ahkarg','Tar','2021-08-15'),
    (4,'Ahkarg','Pikduk','2021-10-19'),
    (2,'Bucksel','Losla','2021-02-28'),
    (3,'Bucksel','Tar','2021-08-12'),
    (3,'Mashgor','Tar','2021-04-28'),
    (4,'Mashgor','Pikduk','2021-06-06'),
    (1,'Gim','Zucsur','2021-06-15');
