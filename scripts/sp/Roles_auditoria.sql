
DROP role if exists Auditor;
create role Auditor;

grant select on auditoria.log_utilizador to Auditor;
grant select on auditoria.log_rondaplaneada to Auditor;
grant select on auditoria.log_diasemana to Auditor;
grant select on auditoria.log_rondaextra to Auditor;
grant select on auditoria.log_sistema to Auditor;