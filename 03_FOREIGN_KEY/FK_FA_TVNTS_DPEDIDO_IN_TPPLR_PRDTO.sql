--
-- #VERSION1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 2           RQ321              05/02/2025  ownk-dromero   . FK_FA_TVNTS_DPEDIDO_IN_TPPLR_PRDTO
-- ========== ================ =========== ============== ===========================================================================
--
--
alter table FA_TVNTS_DPEDIDO 
	add constraint FK_FA_TVNTS_DPEDIDO_IN_TPPLR_PRDTO
		foreign key (DPEDIDO_PRDTO)   
		references IN_TPPLR_PRDTO (PRDTO_PRDTO);