CREATE DATABASE IF NOT EXISTS MuseuPHP;

USE MuseuPHP;

CREATE TABLE if not exists Utilizador (
	email varchar(100) PRIMARY KEY,
	nome varchar(100) NOT NULL,
	morada varchar(400)
);

CREATE TABLE if not exists RondaExtra (
	email varchar(100),
	dataHoraInicio timestamp NOT NULL,
	dataHoraFim timestamp null default null,
	CONSTRAINT PK_RondaExtra PRIMARY KEY (email, dataHoraInicio),
	FOREIGN KEY (email)
		REFERENCES Utilizador (email)
		ON UPDATE CASCADE
);

CREATE TABLE if not exists DiaSemana (
	DiaSemana varchar(20),
	HoraRondaInicio time,
    HoraRondaFim time,
	CONSTRAINT PK_DiaSemana PRIMARY KEY (DiaSemana,HoraRondaInicio,HoraRondaFim)
);

CREATE TABLE if not exists RondaPlaneada (
	email varchar(100),
	DiaSemana varchar(20),
	HoraRondaInicio time,
    HoraRondaFim time,
	CONSTRAINT PK_RondaPlaneada PRIMARY KEY (email,DiaSemana,HoraRondaInicio),
	FOREIGN KEY (email)
		REFERENCES Utilizador (email)
		ON UPDATE CASCADE,
	FOREIGN KEY (DiaSemana,HoraRondaInicio,HoraRondaFim)
		REFERENCES DiaSemana (DiaSemana,HoraRondaInicio,HoraRondaFim)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
		
);

CREATE TABLE if not exists Sistema (
	LimiteTemperatura decimal(6,2),
	LimiteHumidade decimal(6,2),
	LimiteLuminosidade decimal(6,2)
);

CREATE TABLE if not exists MedicoesSensores (
	IDMedicao int PRIMARY KEY AUTO_INCREMENT,
	ValorMedicao decimal(6,2),
	TipoSensor varchar(3),
	DataHoraMedicao timestamp
);

CREATE TABLE if not exists log_Utilizador (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao timestamp,
	EmailAntigo varchar(100),
	EmailNovo varchar(100),
	NomeAntigo varchar(200),
	NomeNovo varchar(200),
	MoradaAntiga varchar(400),
	MoradaNova varchar(400),
	Migrado BIT
	);

CREATE TABLE if not exists log_InsertRondaExtra (
	Id int PRIMARY KEY AUTO_INCREMENT,
	QuemInseriu varchar(100),
	DataInsercao timestamp,
	EmailNovo varchar(100), 
	DataHoraInicioNova timestamp null default null,
	DataHoraFimNova timestamp null default null,
	Migrado BIT
	);
	
CREATE TABLE if not exists log_RondaPlaneada (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao TIMESTAMP,
	EmailAntigo varchar(100),
	EmailNovo varchar(100),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaInicioAntiga time,
	HoraRondaInicioNova time,
    HoraRondaFimAntiga time,
	HoraRondaFimNova time,
	Migrado BIT
	);

CREATE TABLE if not exists log_DiaSemana (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaInicioAntiga time,
	HoraRondaInicioNova time,
    HoraRondaFimAntiga time,
	HoraRondaFimNova time,
	Migrado BIT
	);

CREATE TABLE if not exists log_UpdateSistema (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	DataAlteracao timestamp,
	LimiteTemperaturaAntigo decimal(6,2),
	LimiteTemperaturaNovo decimal(6,2),
	LimiteHumidadeAntigo decimal(6,2),
	LimiteHumidadeNovo decimal(6,2),
	LimiteLuminosidadeAntigo decimal(6,2),
	LimiteLuminosidadeNovo decimal(6,2),
	Migrado BIT
	);
    
CREATE TABLE if not exists log_Select (
		id int PRIMARY KEY AUTO_INCREMENT,
		QuemViu varchar(100),
        DataVisualizacao timestamp,
        TabelaVista varchar(20),
        atributosVistos text,
	Migrado BIT
		);
	
CREATE TABLE if not exists Migracoes (
	dataHora DATETIME PRIMARY KEY,
	tabelaEmMigracao varchar(30),
	migrado BIT
	);
