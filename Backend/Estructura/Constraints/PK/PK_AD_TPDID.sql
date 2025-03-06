prompt
prompt PK AD_TPDID
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

ALTER TABLE AD_TPDID ADD (
  CONSTRAINT PK_AD_TPDID
  PRIMARY KEY
  (PDID_PDID)
  ENABLE VALIDATE
);
