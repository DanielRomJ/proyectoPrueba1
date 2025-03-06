prompt
prompt Indice FK AD_TPDID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Indice de la FK AD_TPDID
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE INDEX AD_IPDID_TE_TCLNT ON AD_TPDID
  (PDID_CLNT)
TABLESPACE TS_ISFI
INITRANS   20
STORAGE    (
            INITIAL          128K
            NEXT             128K
           );
