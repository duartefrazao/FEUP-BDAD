--
-- File generated with SQLiteStudio v3.1.1 on Sun Apr 15 19:50:35 2018
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = on;
.mode columns
.headers on
.nullvalue NULL

-- Table: Marca
CREATE TABLE Marca (
id INTEGER PRIMARY KEY, 
nome STRING UNIQUE NOT NULL);

-- Table: Modelo
CREATE TABLE Modelo (
id INTEGER PRIMARY KEY,
lugares INTEGER, 
nome STRING NOT NULL, 
marca INTEGER REFERENCES Marca (id) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL);

-- Table: Carro
CREATE TABLE Carro (
id INTEGER PRIMARY KEY, 
matricula STRING UNIQUE NOT NULL, 
modelo INTEGER REFERENCES Modelo (id) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL);

-- Table: Utilizador
CREATE TABLE Utilizador (
numero_up INTEGER PRIMARY KEY,
pontuação_passageiro INTEGER NOT NULL DEFAULT (0),
nome STRING NOT NULL, 
data_nascimento DATE NOT NULL, 
numero_telemovel INTEGER NOT NULL UNIQUE);

-- Table: Condutor
CREATE TABLE Condutor (
numero_up INTEGER REFERENCES Utilizador (numero_up) ON DELETE CASCADE ON UPDATE CASCADE PRIMARY KEY, 
data_validade_carta DATE NOT NULL, 
pontuaçao_condutor INTEGER NOT NULL DEFAULT (0),
carro Integer REFERENCES Carro (id) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL);

-- Table: Avaliaçao
CREATE TABLE Avaliaçao (
utilizador INTEGER REFERENCES Utilizador (numero_up) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, 
viagem INTEGER REFERENCES Viagem (id) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, 
avaliaçao_condutor INTEGER NOT NULL, 
avaliaçao_passageiro INTEGER NOT NULL, 
PRIMARY KEY (utilizador, viagem), 
CONSTRAINT "limite-minimo-de-avaliaçao" CHECK (avaliaçao_condutor >= 0 and avaliaçao_passageiro >= 0), 
CONSTRAINT "limite-maximo-avaliaçao" CHECK (avaliaçao_condutor <= 5 and avaliaçao_passageiro <= 5));

-- Table: LocalidadesPossiveis
CREATE TABLE LocalidadesPossiveis (
zona INTEGER REFERENCES Zona (id) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, 
viagem INTEGER REFERENCES Viagem (id) ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, 
PRIMARY KEY (zona, viagem));

-- Table: LocalParagem
CREATE TABLE LocalParagem (
utilizador INTEGER REFERENCES Utilizador (numero_up) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
viagem INTEGER REFERENCES Viagem (id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
morada STRING NOT NULL, 
coordenadas_GPS TEXT NOT NULL, 
zona INTEGER REFERENCES Zona (id) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL, 
PRIMARY KEY (utilizador, viagem));


-- Table: Mensagem
CREATE TABLE Mensagem (
texto STRING NOT NULL, 
up_emissor INTEGER REFERENCES Utilizador (numero_up) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
up_recetor INTEGER REFERENCES Utilizador (numero_up) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
id INTEGER PRIMARY KEY, 
CONSTRAINT "impedir_mensagens-para-si-mesmo" CHECK (NOT (up_emissor == up_recetor)));


-- Table: Partilha
CREATE TABLE Partilha (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
para_feup BOOLEAN NOT NULL, 
preço_total INTEGER NOT NULL, 
lugares_disponiveis INTEGER NOT NULL, 
hora_começo TIME NOT NULL, 
data_inicio DATE NOT NULL, 
data_fim DATE NOT NULL, 
dia_da_semana INTEGER NOT NULL, 
condutor INTEGER REFERENCES Condutor (numero_up) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
CONSTRAINT "preço-valido-viagem" CHECK (preço_total > 0), CONSTRAINT "numero-passageiros-valido" CHECK (lugares_disponiveis > 0), 
CONSTRAINT "datas-validas" CHECK (data_inicio <= data_fim), 
CONSTRAINT "dias-da-semana-validos" CHECK (dia_da_semana >= 1 and dia_da_semana <= 7));


-- Table: Viagem
CREATE TABLE Viagem (
id INTEGER PRIMARY KEY, 
data DATE NOT NULL, 
partilha_associada INTEGER REFERENCES Partilha (id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL);

-- Table: Zona
CREATE TABLE Zona (
id INTEGER PRIMARY KEY AUTOINCREMENT , 
nome STRING UNIQUE NOT NULL);

PRAGMA foreign_keys = on;
