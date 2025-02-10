--
-- #VERSION:1
-- Historial de cambios
--
-- Version      Solicitud       Fecha      Realiza        Comentario
-- ========== ================ =========== ============== ===========================================================================
-- 1           RQ3             05/02/2025  ownk-dromero   . Nueva tabla de Facturacion para el registro de los pedidos
-- ========== ================ =========== ============== ===========================================================================
--
--
CREATE TABLE FA_TVNTS_PEDIDO 
(
    PEDIDO_PEDIDO            INT ,
    PEDIDO_CLNT              INT                                          constraint NN_FA_TVNTS_PEDIDO_PEDIDO_CLNT        NOT NULL,
    PEDIDO_FCREA             TIMESTAMP DEFAULT CURRENT_TIMESTAMP          constraint NN_FA_TVNTS_PEDIDO_PEDIDO_FCREA       NOT NULL
);
COMMENT ON COLUMN FA_TVNTS_PEDIDO.PEDIDO_PEDIDO IS 'Identificador único del pedido.'; 
COMMENT ON COLUMN FA_TVNTS_PEDIDO.PEDIDO_CLNT  IS 'Identificador único del cliente';               
COMMENT ON COLUMN FA_TVNTS_PEDIDO.PEDIDO_FCREA IS 'Fecha de creación del pedido';