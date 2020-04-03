USE museuphp;

DELIMITER $$
DROP PROCEDURE IF EXISTS `add_User`$$
CREATE PROCEDURE `add_User`(IN `NomeUtilizador` VARCHAR(200), IN `EmailUtilizador` VARCHAR(100), 
IN `Morada`VARCHAR(400), IN `TipoUtilizador`VARCHAR(30), IN `Ativo`BOOLEAN, IN `Pass`VARCHAR(40))
BEGIN
Drop user IF EXISTS EmailUtilizador;
if tipoUtilizador = 's' or tipoUtilizador = 'cs' or tipoUtilizador ='aud' or tipoUtilizador ='adm' or tipoUtilizador ='mdb' or tipoUtilizador ='dm' then
		FLUSH PRIVILEGES;
        SET @comando = CONCAT('CREATE USER "', EmailUtilizador,'" IDENTIFIED BY "', Pass ,'" ');
        PREPARE create_user FROM @comando;
        EXECUTE create_user;
        DEALLOCATE PREPARE create_user;
insert into dctidata_g09.utilizador (NomeUtilizador, EmailUtilizador, Morada, TipoUtilizador,Ativo)
Values(
   NomeUtilizador,
   EmailUtilizador,
   Morada,
   TipoUtilizador,
   Ativo
  );
if TipoUtilizador = 'S' then
Grant Segurança to EmailUtilizador;
elseif
TipoUtilizador = 'CS' then
Grant ChefeSegurança to EmailUtilizador;
elseif
TipoUtilizador = 'ADM' then
Grant AppAdmin to EmailUtilizador;
elseif
TipoUtilizador = 'DM' then
Grant DiretorMuseu to EmailUtilizador;
elseif
TipoUtilizador = 'AUD' then
Grant Auditor to EmailUtilizador;
elseif
TipoUtilizador = 'MDB' then
Grant UserMongoDB to EmailUtilizador;
end if;
end if;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_DiaSemana`$$
CREATE PROCEDURE `sp_DiaSemana`(IN `HoraRondaInicio` time, IN `HoraRondaFim` time, `DiaSemana` VARCHAR(20))
BEGIN
Select * From dctidata_g09.diasemana
where diasemana.DiaSemana = `DiaSemana` and
diasemana.HoraRondaInicio = `HoraRondaInicio` and
diasemana.HoraRondaFim = `HoraRondaFim`;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_RondaExtraGetAll`$$
CREATE PROCEDURE `sp_RondaExtraGetAll`(IN `DataHoraInicio` timestamp, IN `DataHoraFim` timestamp )
BEGIN
Select * From dctidata_g09.RondaExtra
where rondaextra.DataHoraInico = `DataHoraInicio` and
rondaextra.DataHoraFim = `DataHoraFim`;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_MedicoesSensores`$$
CREATE PROCEDURE `sp_MedicoesSensores`(IN `IdMedicao` int, IN `ValorMedicao` decimal(6,2),
 `TipoSensor` VARCHAR(3), IN `DataHoraMedicao` timestamp)
BEGIN
Select * From dctidata_g09.medicoessensores
where medicoessensores.IDMedicao = `IdMedicao` and
medicoessensores.ValorMedicao= `ValorMedicao` and
medicoessensores.TipoSensor = `TipoSensor` and
medicoessensores.DataHoraMedicao = `DataHoraMedicao`;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_Sistema`$$
CREATE PROCEDURE `sp_Sistema`()
BEGIN
Select * From dctidata_g09.sistema;
END$$
DELIMITER ;
