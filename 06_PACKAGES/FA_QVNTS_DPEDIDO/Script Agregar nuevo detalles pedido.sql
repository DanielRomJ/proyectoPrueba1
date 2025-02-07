BEGIN
    -- Insertar un nuevo detalle de pedido
    FA_QVNTS_DPEDIDO.INSERTAR_DPEDIDO( 
        QDPEDIDO_QDPEDIDO => 1,
        QDPEDIDO_QPEDIDO => 1,
        QDPEDIDO_PRDTO => 2,
        QDPEDIDO_CNTD => 1, 
        QDPEDIDO_PRCIO => 1250000
         );
END;