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
  ADD CONSTRAINT FK_AD_TDPDI_AD_TPRDT
  FOREIGN KEY (DPDI_PRDT)
  REFERENCES AD_TPRDT (PRDT_PRDT);
