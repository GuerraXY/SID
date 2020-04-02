CREATE DATABASE IF NOT EXISTS Auditoria;

USE Auditoria;

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
	AtivoNovo bool
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
	idRondaNovo int
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
	HoraRondaNova int
	);

CREATE TABLE if not exists log_DiaSemana (
	idAlteracao int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaAntiga int,
	HoraRondaNova int
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
	LimiteLuminosidadeNovo decimal(6,2));	
	
