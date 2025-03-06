prompt
prompt FK AD_TPDID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Constraints de tabla AD_TPDID
-- =========== ===================== ============ ================== ================================================================================================================
--

ALTER TABLE AD_TPDID
  ADD CONSTRAINT FK_AD_TPDID_TE_TCLNT
  FOREIGN KEY (PDID_CLNT)
  REFERENCES TE_TCLNT (CLNT_CLNT);
