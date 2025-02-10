--
-- #VERSION:1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 1           RQ34             10/02/2025  ownk-dromero   . NUEVA TABLA CON LOS TIPOS DE IDENTIFICACIÓN
-- ========== ================ =========== ============== ===========================================================================
--
--
CREATE TABLE TP_TTPO_TPID
(
    TPID_TPID           VARCHAR2(50),
    TPID_NOMB           VARCHAR(20)             constraint NN_TP_TTPO_TPID_TPID_NOMB           NOT NULL,
    TPID_DESC           VARCHAR(500)            constraint NN_TP_TTPO_TPID_TPID_DESC           NOT NULL,
);
COMMENT ON COLUMN TP_TTPO_TPID.TPID_NOMB IS 'Nombre del tipod de identificacion';
COMMENT ON COLUMN TP_TTPO_TPID.TPID_DESC IS 'Descripcion del tipo de identificador';
COMMENT ON COLUMN TP_TTPO_TPID.TPID_TPID  IS 'Identificador unico de Tipo de IDENTIFICACIÓN';               
