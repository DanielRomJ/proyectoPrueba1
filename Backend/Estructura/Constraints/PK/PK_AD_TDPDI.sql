prompt
prompt PK AD_TDPDI
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

ALTER TABLE AD_TDPDI ADD (
  CONSTRAINT PK_AD_TDPDI
  PRIMARY KEY
  (DPDI_DPDI)
  ENABLE VALIDATE
);
