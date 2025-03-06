prompt
prompt Indice PK AD_TPRDT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Indice de la PK AD_TPRDT
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE INDEX AD_IPRDT ON AD_TPRDT
(PRDT_PRDT)
TABLESPACE TS_ISFI
INITRANS   20
STORAGE 
(
  INITIAL          128K
  NEXT             128K
);
