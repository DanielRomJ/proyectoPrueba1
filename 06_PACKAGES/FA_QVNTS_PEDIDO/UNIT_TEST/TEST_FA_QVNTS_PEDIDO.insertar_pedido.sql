BEGIN
    -- Insertar un nuevo cliente
    FA_QVNTS_PEDIDO.insertar_pedido( 
        Q_PEDIDO_PEDIDO => 1,
        Q_PEDIDO_CLNT => 1,
        Q_PEDIDO_FCREA => CURRENT_timestamp
        );
END;