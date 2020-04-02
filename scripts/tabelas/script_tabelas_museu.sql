CREATE DATABASE IF NOT EXISTS Museu;

USE Museu;

CREATE TABLE if not exists Utilizador (
	EmailUtilizador varchar(100) NOT NULL PRIMARY KEY,
	NomeUtilizador varchar(200) NOT NULL, UNIQUE,
	Morada varchar(400),
	TipoUtilizador varchar(3) NOT NULL,
	Ativo bool 
);

CREATE TABLE if not exists RondaExtra (
	EmailUtilizador varchar(100),
	DataHora timestamp,
	idRonda INT AUTO_INCREMENT, /*para ser automático*/
	CONSTRAINT PK_RondaExtra PRIMARY KEY (EmailUtilizador,DataHora),
	FOREIGN KEY (EmailUtilizador)
		REFERENCES Utilizador (EmailUtilizador)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	KEY(idRonda)
);

CREATE TABLE if not exists DiaSemana (
	DiaSemana varchar(20),
	HoraRonda time,
	CONSTRAINT PK_DiaSemana PRIMARY KEY (DiaSemana,HoraRonda)
);

CREATE TABLE if not exists RondaPlaneada (
	EmailUtilizador varchar(100),
	DiaSemana varchar(20),
	HoraRonda time,
	CONSTRAINT PK_RondaPlaneada PRIMARY KEY (EmailUtilizador,DiaSemana,HoraRonda),
	FOREIGN KEY (EmailUtilizador)
		REFERENCES Utilizador (EmailUtilizador)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (DiaSemana,HoraRonda)
		REFERENCES DiaSemana (DiaSemana,HoraRonda)
		ON UPDATE CASCADE
		ON DELETE CASCADE
		
);

CREATE TABLE if not exists Sistema (
	Descricao varchar(20) PRIMARY KEY,
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
	idAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao timestamp,
	EmailUtilizadorAntigo varchar(100),
	EmailUtilizadorNovo varchar(100),
	NomeUtilizadorAntigo varchar(200),
	NomeUtilizadorNovo varchar(200),
	MoradaAntiga varchar(400),
	MoradaNova varchar(400),
	TipoUtilizadorAntigo varchar(3),
	TipoUtilizadorNovo varchar(3),
	AtivoAntigo bool,
	AtivoNovo bool,
	EstadoMigracao varchar(20) NOT NULL
	);

CREATE TABLE if not exists log_RondaExtra (
	IdAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao timestamp,
	EmailUtilizadorAntigo varchar(100),
	EmailUtilizadorNovo varchar(100),
	DataHoraAntiga DATETIME, /*timestamp dá erro devido ao NO_ZERO_DATE mode do sql*/
	DataHoraNova DATETIME,
	idRondaAntigo int,
	idRondaNovo int,
	EstadoMigracao varchar(20) NOT NULL
	);
	
CREATE TABLE if not exists log_RondaPlaneada (
	idAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao TIMESTAMP,
	EmailUtilizadorAntigo varchar(100),
	EmailUtilizadorNovo varchar(100),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaAntiga int,
	HoraRondaNova int,
	EstadoMigracao varchar(20) NOT NULL
	);

CREATE TABLE if not exists log_DiaSemana (
	idAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaAntiga int,
	HoraRondaNova int,
	EstadoMigracao varchar(20) NOT NULL
	);

CREATE TABLE if not exists log_Sistema (
	idAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao timestamp,
	LimiteTemperaturaAntigo decimal(6,2),
	LimiteTemperaturaNovo decimal(6,2),
	LimiteHumidadeAntigo decimal(6,2),
	LimiteHumidadeNovo decimal(6,2),
	LimiteLuminosidadeAntigo decimal(6,2),
	LimiteLuminosidadeNovo decimal(6,2),
	EstadoMigracao varchar(20) NOT NULL
	);
	
