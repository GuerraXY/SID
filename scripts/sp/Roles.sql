DROP role if exists AppAdmin;
DROP role if exists DiretorMuseu;
DROP role if exists ChefeSeguranca;
DROP role if exists UserMongoDB;
DROP role if exists Seguranca;

CREATE role AppAdmin ;
CREATE role DiretorMuseu;
CREATE role ChefeSeguranca;
CREATE role UserMongoDB;
create role Seguranca;

grant select on Museu.utilizador to AppAdmin;
grant insert, update, delete on Museu.utilizador to AppAdmin;

grant select on Museu.rondaplaneada to ChefeSeguranca;
grant insert, update, delete on Museu.rondaplaneada to ChefeSeguranca;

grant select on Museu.diasemana to ChefeSeguranca;
grant insert, update, delete on Museu.diasemana to ChefeSeguranca;

grant select on Museu.rondaextra to ChefeSeguranca;
grant insert, update, delete on Museu.rondaextra to ChefeSeguranca, Seguranca;

grant select on Museu.sistema to ChefeSeguranca, DiretorMuseu, AppAdmin;
grant insert, update, delete on Museu.sistema to AppAdmin, DiretorMuseu;

grant select on Museu.medicoessensores to ChefeSeguranca, DiretorMuseu;


grant execute on procedure Museu.sp_RondaPlaneadaGetAll to AppAdmin;
grant execute on procedure Museu.sp_RondaPlaneadaDiaSemana to AppAdmin;
grant execute on procedure Museu.sp_RondaExtraGetAll to AppAdmin;

grant execute on procedure Museu.sp_adicionarturnoplaneado to ChefeSeguranca;
grant execute on procedure Museu.sp_removerrondaplaneada to ChefeSeguranca;
grant execute on procedure Museu.sp_alterarrondaplaneada to ChefeSeguranca;

grant execute on procedure Museu.sp_registarrondaextra to Seguranca;