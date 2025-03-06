prompt
prompt Indice PK TE_TCLNT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Indice de la PK TE_TCLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE INDEX TE_ICLNT ON TE_TCLNT
(CLNT_CLNT)
TABLESPACE TS_ISFI
INITRANS   20
STORAGE 
(
  INITIAL          128K
  NEXT             128K
);
