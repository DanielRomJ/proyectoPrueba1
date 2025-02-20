--
-- #VERSION:1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 1           RQ6              05/02/2025  ownk-dromero   . Nueva tabla de Facturación para almacenar los detalles de pedido
-- ========== ================ =========== ============== ===========================================================================
--
--
CREATE TABLE FA_TVNTS_DPEDIDO 
(
    DPEDIDO_DPEDIDO          VARCHAR2(50),
    DPEDIDO_PEDIDO           INT             constraint NN_FA_TVNTS_DPEDIDO_DPEDIDO_PEDIDO         NOT NULL,
    DPEDIDO_PRDTO            INT             constraint NN_FA_TVNTS_DPEDIDO_DPEDIDO_PRDTO          NOT NULL,
    DPEDIDO_CNTD             INT             constraint NN_FA_TVNTS_DPEDIDO_DPEDIDO_CNTD           NOT NULL,
    DPEDIDO_PRCIO            FLOAT           constraint NN_FA_TVNTS_DPEDIDO_DPEDIDO_PRCIO          NOT NULL
);

COMMENT ON COLUMN FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO IS 'Identificador único de detalles de pedido';
COMMENT ON COLUMN FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO IS 'Identificador único del pedido'; 
COMMENT ON COLUMN FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO  IS 'Identificador único del producto';               
COMMENT ON COLUMN FA_TVNTS_DPEDIDO.DPEDIDO_CNTD IS 'Cantidad de producto';
COMMENT ON COLUMN FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO IS 'Precio del producto';