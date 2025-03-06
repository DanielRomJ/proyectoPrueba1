--
-- #VERSION1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 2           RQ2              05/02/2025  ownk-dromero   . PK_TP_TTPO_TPID 
-- ========== ================ =========== ============== ===========================================================================
--
--
alter table TP_TTPO_TPID 
	add constraint PK_TP_TTPO_TPID 
	    primary key (TPID_TPID);