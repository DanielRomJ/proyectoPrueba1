--
-- #VERSION1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 2           RQ89              05/02/2025  ownk-dromero   . FK_CL_TCLNT_CLNT_TP_TTPO_TPID
-- ========== ================ =========== ============== ===========================================================================
--
--
alter table CL_TCLNT_CLNT
	add constraint FK_CL_TCLNT_CLNT_TP_TTPO_TPID
		foreign key (CLNT_TPID)   
		references TP_TTPO_TPID (TPID_TPID);