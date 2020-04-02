use museu;

DELIMITER $$
DROP TRIGGER IF EXISTS DDiaSemana;
CREATE DEFINER=`root`@`localhost` TRIGGER DDiaSemana 
AFTER DELETE ON diasemana 
FOR EACH ROW
BEGIN

INSERT INTO log_diasemana(QuemAlterou,TipoOperacao,DiaSemanaAntigo,DiaSemanaNovo,HoraRondaAntiga,HoraRondaNova, EstadoMigracao) 
VALUES(current_user, "Delete", OLD.DiaSemana, NULL, OLD.HoraRonda, NULL, "Nao migrado");
END$$

DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS DRondaExtra;
CREATE DEFINER=`root`@`localhost` TRIGGER DRondaExtra AFTER DELETE ON `rondaextra` FOR EACH ROW
BEGIN
INSERT INTO log_rondaextra(QuemAlterou, TipoOperacao,DataAlteracao,EmailUtilizadorAntigo, EmailUtilizadorNovo, DataHoraAntiga, DataHoraNova, IdRondaAntigo, IdRondaNovo, EstadoMigracao) 
VALUES(current_user, "Delete", current_time, OLD.EmailUtilizador, NULL, OLD.DataHora, NULL, OLD.IdRonda, NULL, "Nao Migrado");
END$$

delimiter ;



DElIMITER $$
DROP TRIGGER IF EXISTS DRondaPlaneada;
CREATE DEFINER=`root`@`localhost` TRIGGER DRondaPlaneada AFTER DELETE ON `rondaplaneada` FOR EACH ROW
BEGIN
INSERT INTO log_rondaplaneada(QuemAlterou,TipoOperacao,DataAlteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,DiaSemanaAntigo,DiaSemanaNovo,HoraRondaAntiga,HoraRondaNova, EstadoMigracao) 
VALUES(current_user, "Delete", current_time, OLD.EmailUtilizador, NULL, OLD.DiaSemana, NULL, OLD.HoraRonda, NULL, "Nao Migrado");
END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS DSistema;
CREATE DEFINER=`root`@`localhost` TRIGGER DSistema AFTER DELETE ON `sistema` FOR EACH ROW
BEGIN
INSERT INTO log_sistema(QuemAlterou,TipoOperacao,DataAlteracao,LimiteTemperaturaAntigo,LimiteTemperaturaNovo,LimiteHumidadeAntigo,LimiteHumidadeNovo,LimiteLuminosidadeAntigo,LimiteLuminosidadeNovo, EstadoMigracao) 
VALUES(current_user, "Delete", current_time, OLD.LimiteTemperatura, NULL, OLD.LimiteHumidade, NULL, OLD.LimiteLuminosidade, NULL, "Nao Migrado");
END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS DUser;
CREATE DEFINER=`root`@`localhost` TRIGGER DUser AFTER DELETE ON `utilizador` FOR EACH ROW
BEGIN
INSERT INTO log_utilizador(QuemAlterou, TipoOperacao, DataALteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,NomeUtilizadorAntigo,NomeUtilizadorNovo, MoradaAntiga, MoradaNova, TipoUtilizadorAntigo,TipoUtilizadorNovo,AtivoAntigo, AtivoNovo, EstadoMigracao) 
VALUES(current_user, "Delete", current_time, OLD.EmailUtilizador, NULL, OLD.NomeUtilizador, NULL, OLD.Morada, NULL, OLD.TipoUtilizador, NULL, OLD.Ativo, NULL, "Nao Migrado");
END$$
delimiter ;

DElIMITER $$
DROP TRIGGER IF EXISTS IDiaSemana;
CREATE DEFINER=`root`@`localhost` TRIGGER IDiaSemana
AFTER INSERT ON `diasemana` 
FOR EACH ROW
BEGIN
INSERT INTO log_diasemana(QuemAlterou,TipoOperacao,DiaSemanaAntigo,DiaSemanaNovo,HoraRondaAntiga,HoraRondaNova, EstadoMigracao)
VALUES(current_user,"Insert", NULL, NEW.DiaSemana, NULL ,NEW.HoraRonda, "Nao Migrado");
END$$
delimiter ;

DElIMITER $$
DROP TRIGGER IF EXISTS IRondaExtra;
CREATE DEFINER=`root`@`localhost` TRIGGER IRondaExtra AFTER INSERT ON `rondaextra` FOR EACH ROW
BEGIN
INSERT INTO log_rondaextra(QuemAlterou, TipoOperacao,DataAlteracao,EmailUtilizadorAntigo, EmailUtilizadorNovo, DataHoraAntiga, DataHoraNova, IdRondaAntigo, IdRondaNovo, EstadoMigracao)  
VALUES(current_user, "Insert", current_time, NULL, NEW.EmailUtilizador, NULL, NEW.DataHora, NULL, NEW.IdRonda, "Nao Migrado");
END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS IRondaPlaneada;
CREATE DEFINER=`root`@`localhost` TRIGGER IRondaPlaneada AFTER INSERT ON `rondaplaneada` FOR EACH ROW
BEGIN

/*IF (select Ativo from utilizador where EmailUtilizador=current_user() != 0)  THEN*/
INSERT INTO log_rondaplaneada(QuemAlterou, TipoOperacao, DataALteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,DiaSemanaAntigo, DiaSemanaNovo, HoraRondaAntiga, HoraRondaNova, EstadoMigracao)
VALUES(current_user, "Insert", current_time,NULL, NEW.EmailUtilizador, NULL, NEW.DiaSemana, NULL, NEW.HoraRonda, "Nao Migrado");

/*END IF;*/
END$$
delimiter ;

DElIMITER $$
DROP TRIGGER IF EXISTS ISistema;
CREATE DEFINER=`root`@`localhost` TRIGGER ISistema AFTER INSERT ON `sistema` FOR EACH ROW
BEGIN
INSERT INTO log_sistema(QuemAlterou,TipoOperacao,DataAlteracao,LimiteTemperaturaAntigo,LimiteTemperaturaNovo,LimiteHumidadeAntigo,LimiteHumidadeNovo,LimiteLuminosidadeAntigo,LimiteLuminosidadeNovo, EstadoMigracao) 
VALUES(current_user, "Insert", current_time, NULL,NEW.LimiteTemperatura, NULL, NEW.LimiteHumidade, NULL, NEW.LimiteLuminosidade, "Nao Migrado");
END$$
delimiter ;

DElIMITER $$
DROP TRIGGER IF EXISTS IUser;
CREATE DEFINER=`root`@`localhost` TRIGGER IUser AFTER INSERT ON `utilizador` FOR EACH ROW
BEGIN
INSERT INTO log_utilizador(QuemAlterou, TipoOperacao, DataALteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,NomeUtilizadorAntigo,NomeUtilizadorNovo, MoradaAntiga, MoradaNova, TipoUtilizadorAntigo,TipoUtilizadorNovo,AtivoAntigo, AtivoNovo, EstadoMigracao) 
VALUES(current_user, "Insert", current_time,NULL, NEW.EmailUtilizador, NULL, NEW.NomeUtilizador, NULL, NEW.Morada, NULL, NEW.TipoUtilizador, NULL, NEW.Ativo, "Nao Migrado");
END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS UDiaSemana;
CREATE DEFINER=`root`@`localhost` TRIGGER UDiaSemana 
BEFORE UPDATE ON diasemana 
FOR EACH ROW
BEGIN

DECLARE DiaSemanaAInserir VARCHAR(45);
DECLARE HoraRondaAInserir TIME;

IF (NEW.DiaSemana != OLD.DiaSemana) THEN
SET DiaSemanaAInserir = NEW.DiaSemana;
ELSE 
SET DiaSemanaAInserir = OLD.DiaSemana;
END IF;

IF (NEW.HoraRonda != OLD.HoraRonda) THEN
SET HoraRondaAInserir = NEW.HoraRonda;
ELSE 
SET HoraRondaAInserir = OLD.HoraRonda;
END IF;

INSERT INTO log_diasemana(QuemAlterou,TipoOperacao,DiaSemanaAntigo,DiaSemanaNovo,HoraRondaAntiga,HoraRondaNova, EstadoMigracao) 
VALUES (current_user(), 'Update', OLD.DiaSemana, DiaSemanaAInserir, OLD.HoraRonda, HoraRondaAInserir, "Nao Migrado");

END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS URondaExtra;
CREATE DEFINER=`root`@`localhost` TRIGGER URondaExtra BEFORE UPDATE ON `rondaextra` FOR EACH ROW
BEGIN

DECLARE EmailAInserir VARCHAR(100);
DECLARE DataHoraAInserir TIMESTAMP;
DECLARE IdRondaAInserir INT;

IF (NEW.EmailUtilizador != OLD.EmailUtilizador) THEN
SET EmailAInserir = NEW.EmailUtilizador;
ELSE 
SET EmailAInserir = OLD.EmailUtilizador;
END IF;

IF (NEW.DataHora != OLD.DataHora) THEN
SET DataHoraAInserir = NEW.DataHora;
ELSE 
SET DataHoraAInserir = OLD.DataHora;
END IF;

IF (NEW.IdRonda != OLD.IdRonda) THEN
SET IdRondaAInserir = NEW.IdRonda;
ELSE 
SET IdRondaAInserir = OLD.IdRonda;
END IF;

INSERT INTO log_rondaextra(QuemAlterou, TipoOperacao,DataAlteracao,EmailUtilizadorAntigo, EmailUtilizadorNovo, DataHoraAntiga, DataHoraNova, IdRondaAntigo, IdRondaNovo, EstadoMigracao)
VALUES (current_user(), 'Update', current_time() ,OLD.EmailUtilizador, EmailAInserir, OLD.DataHora, DataHoraAInserir, OLD.IdRonda, IdRondaAInserir, "Nao Migrado");


END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS URondaPlaneada;
CREATE DEFINER=`root`@`localhost` TRIGGER URondaPlaneada BEFORE UPDATE ON `rondaplaneada` FOR EACH ROW
BEGIN
DECLARE EmailAInserir VARCHAR(100);
DECLARE DiaSemanaAInserir VARCHAR(20);
DECLARE HoraRondaAInserir TIME;

IF (NEW.EmailUtilizador != OLD.EmailUtilizador) THEN
SET EmailAInserir = NEW.EmailUtilizador;
ELSE 
SET EmailAInserir = OLD.EmailUtilizador;
END IF;

IF (NEW.DiaSemana != OLD.DiaSemana) THEN
SET DiaSemanaAInserir = NEW.DiaSemana;
ELSE 
SET DiaSemanaAInserir = OLD.DiaSemana;
END IF;

IF (NEW.HoraRonda != OLD.HoraRonda) THEN
SET HoraRondaAInserir = NEW.HoraRonda;
ELSE 
SET HoraRondaAInserir = OLD.HoraRonda;
END IF;

INSERT INTO log_rondaplaneada(QuemAlterou,TipoOperacao,DataAlteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,DiaSemanaAntigo,DiaSemanaNovo,HoraRondaAntiga,HoraRondaNova, EstadoMigracao)
VALUES (current_user(), 'Update', current_time() ,OLD.EmailUtilizador, EmailAInserir, OLD.DiaSemana, DiaSemanaAInserir, OLD.HoraRonda, HoraRondaAInserir, "Nao Migrado");


END$$
delimiter ;

DElIMITER $$
DROP TRIGGER IF EXISTS USistema;
CREATE DEFINER=`root`@`localhost` TRIGGER USistema BEFORE UPDATE ON `sistema` FOR EACH ROW
BEGIN
DECLARE LimiteTemperaturaAInserir DECIMAL(6,2);
DECLARE LimiteHumidadeAInserir DECIMAL(6,2);
DECLARE LimiteLuminosidadeAInserir DECIMAL(6,2);

IF (NEW.LimiteTemperatura != OLD.LimiteTemperatura) THEN
SET LimiteTemperaturaAInserir = NEW.LimiteTemperatura;
ELSE 
SET LimiteTemperaturaAInserir = OLD.LimiteTemperatura;
END IF;

IF (NEW.LimiteHumidade != OLD.LimiteHumidade) THEN
SET LimiteHumidadeAInserir = NEW.LimiteHumidade;
ELSE 
SET LimiteHumidadeAInserir = OLD.LimiteHumidade;
END IF;

IF (NEW.LimiteLuminosidade != OLD.LimiteLuminosidade) THEN
SET LimiteLuminosidadeAInserir = NEW.LimiteLuminosidade;
ELSE 
SET LimiteLuminosidadeAInserir = OLD.LimiteLuminosidade;
END IF;

INSERT INTO log_sistema(QuemAlterou,TipoOperacao,DataAlteracao,LimiteTemperaturaAntigo,LimiteTemperaturaNovo,LimiteHumidadeAntigo,LimiteHumidadeNovo,LimiteLuminosidadeAntigo,LimiteLuminosidadeNovo, EstadoMigracao)
VALUES (current_user, "Update", current_time, OLD.LimiteTemperatura,LimiteTemperaturaAInserir, OLD.LimiteHumidade, LimiteHumidadeAInserir, OLD.LimiteLuminosidade,LimiteLuminosidadeAInserir, "Nao Migrado");

END$$
DElIMITER ;

DElIMITER $$
DROP TRIGGER IF EXISTS UUser;
CREATE DEFINER=`root`@`localhost` TRIGGER UUser BEFORE UPDATE ON `utilizador` FOR EACH ROW
BEGIN
DECLARE EmailUtilizadorAInserir VARCHAR(100);
DECLARE NomeUtilizadorAInserir VARCHAR(100);
DECLARE MoradaAInserir VARCHAR(100);
DECLARE TipoUtilizadorAInserir VARCHAR(100);
DECLARE AtivoAInserir BOOLEAN;

IF (NEW.EmailUtilizador != OLD.EmailUtilizador) THEN
SET EmailUtilizadorAInserir = NEW.EmailUtilizador;
ELSE 
SET EmailUtilizadorAInserir = OLD.EmailUtilizador;
END IF;

IF (NEW.NomeUtilizador != OLD.NomeUtilizador) THEN
SET NomeUtilizadorAInserir = NEW.NomeUtilizador;
ELSE 
SET NomeUtilizadorAInserir = OLD.NomeUtilizador;
END IF;

IF (NEW.Morada != OLD.Morada) THEN
SET MoradaAInserir = NEW.Morada;
ELSE 
SET MoradaAInserir = OLD.Morada;
END IF;

IF (NEW.TipoUtilizador != OLD.TipoUtilizador) THEN
SET TipoUtilizadorAInserir = NEW.TipoUtilizador;
ELSE 
SET TipoUtilizadorAInserir = OLD.TipoUtilizador;
END IF;

IF (NEW.Ativo != OLD.Ativo) THEN
SET AtivoAInserir = NEW.Ativo;
ELSE 
SET AtivoAInserir = OLD.Ativo;
END IF;

INSERT INTO log_utilizador(QuemAlterou, TipoOperacao, DataALteracao,EmailUtilizadorAntigo,EmailUtilizadorNovo,NomeUtilizadorAntigo,NomeUtilizadorNovo, MoradaAntiga, MoradaNova, TipoUtilizadorAntigo,TipoUtilizadorNovo,AtivoAntigo, AtivoNovo, EstadoMigracao) 
VALUES(current_user, "Update", current_time, OLD.EmailUtilizador, EmailUtilizadorAInserir, OLD.NomeUtilizador, NomeUtilizadorAInserir, OLD.Morada, MoradaAInserir, OLD.TipoUtilizador, TipoUtilizadorAInserir, OLD.Ativo, AtivoAInserir, "Nao Migrado");

END$$
DElIMITER ;
