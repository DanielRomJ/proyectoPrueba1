--
-- #VERSION:1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 1           RQ1              05/02/2025  ownk-dromero   . Nueva tabla de Clientes para el registro de los clientes
-- ========== ================ =========== ============== ===========================================================================
--
--
CREATE TABLE CL_TCLNT_CLNT 
(
    CLNT_CLNT                VARCHAR2(50) ,
    CLNT_NOMB                VARCHAR(100)    constraint NN_CL_TCLNT_CLNT_CLNT_NOMB         NOT NULL,
    CLNT_TPID                VARCHAR(20)     constraint NN_CL_TCLNT_CLNT_CLNT_TPID         NOT NULL,
    CLNT_NIT                 INT             constraint NN_CL_TCLNT_CLNT_CLNT_NIT          NOT NULL,
    CLNT_DIRE                VARCHAR(200)    constraint NN_CL_TCLNT_CLNT_CLNT_DIRE         NOT NULL
    
);

COMMENT ON COLUMN CL_TCLNT_CLNT.CLNT_CLNT IS 'Identificador único del cliente.'; 
COMMENT ON COLUMN CL_TCLNT_CLNT.CLNT_NOMB IS 'Nombre del cliente';               
COMMENT ON COLUMN CL_TCLNT_CLNT.CLNT_TPID IS 'Tipo de identificación del cliente';
COMMENT ON COLUMN CL_TCLNT_CLNT.CLNT_NIT IS 'Número de identificación del cliente';
COMMENT ON COLUMN CL_TCLNT_CLNT.CLNT_DIRE IS 'Dirección del cliente';