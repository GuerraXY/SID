DELIMITER $$
DROP PROCEDURE IF EXISTS `add_User`$$
CREATE PROCEDURE `add_User`(IN `NomeUtilizador` VARCHAR(200), IN `EmailUtilizador` VARCHAR(100), 
IN `Morada`VARCHAR(400), IN `TipoUtilizador`VARCHAR(30), IN `Ativo`BOOLEAN)
BEGIN
insert into Museu.utilizador (NomeUtilizador, EmailUtilizador, Morada, TipoUtilizador,Ativo)
Values(
   NomeUtilizador,
   EmailUtilizador,
   Morada,
   TipoUtilizador,
   Ativo
  );
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_RondaPlaneadaGetAll`$$
CREATE PROCEDURE `sp_RondaPlaneadaGetAll`()
BEGIN
Select * From Museu.rondaplaneada;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_RondaPlaneadaDiaSemana`$$
CREATE PROCEDURE `sp_RondaPlaneadaDiaSemana`(IN `DiaSemana` VARCHAR(20))
BEGIN
Select EmailUtilizador, HoraRonda From Museu.rondaplaneada
where DiaSemana = `DiaSemana`;
END$$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_RondaExtraGetAll`$$
CREATE PROCEDURE `sp_RondaExtraGetAll`()
BEGIN
Select * From Museu.RondaExtra;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_adicionarturnoplaneado`$$
CREATE PROCEDURE `sp_adicionarturnoplaneado`(
IN `EmailUtilizador` varchar(100), IN `HoraRonda` time, IN `DiaSemana` Varchar(20))
BEGIN
insert into Museu.rondaplaneada(EmailUtilizador, HoraRonda, DiaSemana) values(
	EmailUtilizador,
    HoraRonda,
    DiaSemana);
END$$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_removerrondaplaneada`$$
CREATE PROCEDURE `sp_removerrondaplaneada`(
IN `EmailUtilizador` varchar(100), IN `HoraRonda` time, IN `DiaSemana` Varchar(20))
BEGIN
delete from Museu.rondaplaneada where
	rondaplaneada.EmailUtilizador = EmailUtilizador and
    rondaplaneada.HoraRonda = HoraRonda and
    rondaplaneada.DiaSemana = DiaSemana;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_alterarrondaplaneada`$$
CREATE PROCEDURE `sp_alterarrondaplaneada`(
IN `EmailUtilizador` varchar(100), IN `HoraRonda` time, IN `DiaSemana` Varchar(20))
BEGIN
delete from Museu.rondaplaneada where
	rondaplaneada.EmailUtilizador = EmailUtilizador or
    rondaplaneada.HoraRonda = HoraRonda or
    rondaplaneada.DiaSemana = DiaSemana;
insert into Museu.rondaplaneada(EmailUtilizador, HoraRonda, DiaSemana) values(
	EmailUtilizador,
    HoraRonda,
    DiaSemana);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_registarrondaextra`$$
CREATE PROCEDURE `sp_registarrondaextra`(
IN `EmailUtilizador` varchar(100), IN `DataHora` time, IN `IdRonda` int)
BEGIN
insert into Museu.RondaExtra(EmailUtilizador, DataHora, IdRonda) values(
	EmailUtilizador,
    DataHora,
    IdRonda);
END$$
DELIMITER ;








 




