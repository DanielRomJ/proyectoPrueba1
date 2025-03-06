prompt
prompt FK AD_TDPDI
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Constraints de tabla AD_TDPDI
-- =========== ===================== ============ ================== ================================================================================================================
--

ALTER TABLE AD_TDPDI
  ADD CONSTRAINT FK_AD_TDPDI_AD_TPDID
  FOREIGN KEY (DPDI_PDID)
  REFERENCES AD_TPDID (PDID_PDID);
