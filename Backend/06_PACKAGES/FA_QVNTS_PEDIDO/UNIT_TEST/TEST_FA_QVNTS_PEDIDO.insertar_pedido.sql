DECLARE
    
    v_PEDIDO_PEDIDO FA_QVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE;
  
BEGIN
	v_PEDIDO_PEDIDO:= 1:
    -- Insertar un nuevo pedido
    FA_QVNTS_PEDIDO.insertar_pedido( 
        Q_PEDIDO_PEDIDO => v_PEDIDO_PEDIDO;
        Q_PEDIDO_CLNT => 1,
        Q_PEDIDO_FCREA => CURRENT_timestamp
        );
		DBMS_OUTPUT.PUT_LINE('v_PEDIDO_PEDIDO-------------------:'||v_PEDIDO_PEDIDO); 
END;