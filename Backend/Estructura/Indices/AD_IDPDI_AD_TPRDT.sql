prompt
prompt Indice FK AD_TDPDI
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Indice de la FK AD_TDPDI
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE INDEX AD_IDPDI_AD_TPRDT ON AD_TDPDI
  (DPDI_PRDT)
TABLESPACE TS_ISFI
INITRANS   20
STORAGE    (
            INITIAL          128K
            NEXT             128K
           );
