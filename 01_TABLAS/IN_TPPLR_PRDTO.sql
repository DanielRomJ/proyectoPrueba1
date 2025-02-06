--
-- #VERSION:1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 1           RQ34             05/02/2025  ownk-dromero   . Nueva tabla de Facturación para almacenar los detalles de pedido
-- ========== ================ =========== ============== ===========================================================================
--
--
CREATE TABLE IN_TPPLR_PRDTO
(
    PRDTO_PRDTO          INT ,

    PRDTO_NOMB           VARCHAR(20)             constraint NN_IN_TPPLR_PRDTO_PRDTO_NOMB           NOT NULL,

    PRDTO_DESC           VARCHAR(500)            constraint NN_IN_TPPLR_PRDTO_PRDTO_DESC           NOT NULL,

    PRDTO_PRCIO          FLOAT                   constraint NN_IN_TPPLR_PRDTO_PRDTO_PRCIO          NOT NULL,

    PRDTO_STCK           FLOAT                   constraint IN_TPPLR_PRDTO_PRDTO_STCK              NOT NULL

);

COMMENT ON COLUMN IN_TPPLR_PRDTO.PRDTO_PRDTO IS 'Identificador único de producto';
COMMENT ON COLUMN IN_TPPLR_PRDTO.PRDTO_NOMB IS 'Nombre del producto.'; 
COMMENT ON COLUMN IN_TPPLR_PRDTO.PRDTO_DESC  IS 'Descripción del producto';               
COMMENT ON COLUMN IN_TPPLR_PRDTO.PRDTO_PRCIO IS 'Precio del producto';
COMMENT ON COLUMN IN_TPPLR_PRDTO.PRDTO_STCK IS 'Cantidad de producto en stock';