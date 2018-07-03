


CREATE TABLE categories (
  id        INTEGER     PRIMARY KEY ,
  name      VARCHAR(100)     UNIQUE NOT NULL,
  colorTop   VARCHAR(6) NOT NULL,
  colorBottom VARCHAR(6) NOT NULL
);

INSERT INTO categories (colorBottom, colorTop, name, id) 
VALUES
('729F3F','729F3F','Bug',1),
('F16E57','53A4CF','Dragon',2),
('FDB9E9','FDB9E9','Fairy',3),
('FD7D24','FD7D24','Fire',4),
('7B62A3','7B62A3','Ghost',5),
('AB9842','F7DE3F','Ground',6),
('A4ACAF','A4ACAF','Normal',7),
('F366B9','F366B9','Psychic',8),
('9EB7B8','9EB7B8','Steel',9),
('707070','707070','Dark',10),
('EED535','EED535','Electric',11),
('D56723','D56723','Fighting',12),
('BDB9B8','3DC7EF','Flying',13),
('9BCC50','9BCC50','Grass',14),
('51C4E7','51C4E7','Ice',15),
('B97FC9','B97FC9','Poison',16),
('A38C21','A38C21','Rock',17),
('4592C4','4592C4','Water',18);

CREATE TABLE pokemons (
  id                    INTEGER       PRIMARY KEY IDENTITY(1,1),
  name                  VARCHAR (255) NOT NULL,
  cod                   VARCHAR (4)   NOT NULL,
  category              VARCHAR (255),
  height                FLOAT,
  weight                FLOAT,
  stats_hp              INT,
  stats_attack          INT,
  stats_defense         INT,
  stats_special_atack   INT,
  stats_special_defense INT,
  stats_speed           INT,
  id_categoryI          INTEGER,
  id_categoryII         INTEGER,
  description           TEXT,

  FOREIGN KEY(id_categoryI) REFERENCES categories(id),
  FOREIGN KEY(id_categoryII) REFERENCES categories(id)
);
CREATE TABLE weaknesses (
  id                    INTEGER     PRIMARY KEY IDENTITY(1,1),
  id_pokemon            INTEGER NOT NULL,
  id_category          INTEGER NOT NULL,

  FOREIGN KEY(id_pokemon) REFERENCES pokemons(id),
  FOREIGN KEY(id_category) REFERENCES categories(id)
);

CREATE TABLE abilities (
  id        INTEGER     PRIMARY KEY IDENTITY(1,1),
  name      VARCHAR(100)     UNIQUE NOT NULL
);

CREATE TABLE abilities_pokemons (
  id                  INTEGER PRIMARY KEY IDENTITY(1,1),
  id_pokemon          INTEGER NOT NULL,
  id_ability          INTEGER NOT NULL,
  UNIQUE (id_pokemon, id_ability),
  FOREIGN KEY(id_pokemon) REFERENCES pokemons(id),
  FOREIGN KEY(id_ability) REFERENCES abilities(id)
);

CREATE TABLE pokemons_favorite (
  id                    INTEGER     PRIMARY KEY,
  id_pokemon            INTEGER NOT NULL,
  status                TINYINT NOT NULL,
  FOREIGN KEY(id_pokemon) REFERENCES pokemons(id)
)