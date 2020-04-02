CREATE DATABASE IF NOT EXISTS AuditoriaPHP;

USE AuditoriaPHP;

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
	MoradaNova varchar(400)
	);

CREATE TABLE if not exists log_InsertRondaExtra (
	Id int PRIMARY KEY AUTO_INCREMENT,
	QuemInseriu varchar(100),
	DataInsercao timestamp,
	EmailNovo varchar(100), 
	DataHoraInicioNova timestamp,
	DataHoraFimNova timestamp
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
	HoraRondaFimNova time
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
	HoraRondaFimNova time
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
	LimiteLuminosidadeNovo decimal(6,2)
	);
    
CREATE TABLE if not exists log_Select (
		id int PRIMARY KEY AUTO_INCREMENT,
		QuemViu varchar(100),
        DataVisualizacao timestamp,
        TabelaVista varchar(20),
        atributosVistos text
		);
	
