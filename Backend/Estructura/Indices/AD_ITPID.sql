prompt
prompt Indice PK AD_TTPID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Indice de la PK AD_TTPID
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE INDEX AD_ITPID ON AD_TTPID
(TPID_TPID)
TABLESPACE TS_ISFI
INITRANS   20
STORAGE 
(
  INITIAL          128K
  NEXT             128K
);
