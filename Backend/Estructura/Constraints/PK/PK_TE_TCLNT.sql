prompt
prompt PK TE_TCLNT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Constraints de tabla TE_TCLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

ALTER TABLE TE_TCLNT ADD (
  CONSTRAINT PK_TE_TCLNT
  PRIMARY KEY
  (CLNT_CLNT)
  ENABLE VALIDATE
);
