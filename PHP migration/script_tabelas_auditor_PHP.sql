CREATE DATABASE IF NOT EXISTS AuditoriaPHP;

USE AuditoriaPHP;

CREATE TABLE if not exists log_Utilizador (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao varchar(20),
	EmailAntigo varchar(100),
	EmailNovo varchar(100),
	NomeAntigo varchar(200),
	NomeNovo varchar(200),
	MoradaAntiga varchar(400),
	MoradaNova varchar(400)
	);

CREATE TABLE if not exists log_InsertRondaExtra (
	Id int PRIMARY KEY AUTO_INCREMENT,
	QuemInseriu varchar(100),
	DataInsercao varchar(8),
	EmailNovo varchar(100), 
	DataHoraInicioNova varchar(20),
	DataHoraFimNova varchar(20)
	);
	
CREATE TABLE if not exists log_RondaPlaneada (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DataAlteracao varchar(8),
	EmailAntigo varchar(100),
	EmailNovo varchar(100),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaInicioAntiga varchar(8),
	HoraRondaInicioNova varchar(8),
    HoraRondaFimAntiga varchar(8),
	HoraRondaFimNova varchar(8)
	);

CREATE TABLE if not exists log_DiaSemana (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	TipoOperacao varchar(6),
	DiaSemanaAntigo varchar(20),
	DiaSemanaNovo varchar(20),
	HoraRondaInicioAntiga varchar(8),
	HoraRondaInicioNova varchar(8),
    HoraRondaFimAntiga varchar(8),
	HoraRondaFimNova varchar(8)
	);

CREATE TABLE if not exists log_UpdateSistema (
	id int PRIMARY KEY AUTO_INCREMENT,
	QuemAlterou varchar(100),
	DataAlteracao varchar(8),
	LimiteTemperaturaAntigo varchar(6),
	LimiteTemperaturaNovo varchar(6),
	LimiteHumidadeAntigo varchar(6),
	LimiteHumidadeNovo varchar(6),
	LimiteLuminosidadeAntigo varchar(6),
	LimiteLuminosidadeNovo varchar(6)
	);
    
CREATE TABLE if not exists log_Select (
		id int PRIMARY KEY AUTO_INCREMENT,
		QuemViu varchar(100),
        DataVisualizacao varchar(20),
        TabelaVista varchar(20),
        atributosVistos text
		);
	
