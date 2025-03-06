prompt
prompt PK AD_TPRDT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Constraints de tabla AD_TPRDT
-- =========== ===================== ============ ================== ================================================================================================================
--

ALTER TABLE AD_TPRDT ADD (
  CONSTRAINT PK_AD_TPRDT
  PRIMARY KEY
  (PRDT_PRDT)
  ENABLE VALIDATE
);
