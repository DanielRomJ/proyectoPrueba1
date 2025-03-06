prompt
prompt PK AD_TTPID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Constraints de tabla AD_TTPID
-- =========== ===================== ============ ================== ================================================================================================================
--

ALTER TABLE AD_TTPID ADD (
  CONSTRAINT PK_AD_TTPID
  PRIMARY KEY
  (TPID_TPID)
  ENABLE VALIDATE
);
