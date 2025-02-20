
DECLARE
    v_respuesta FA_TY_TO_VNTS_DPRPSTA;
	v_QDPEDIDO_QDPEDIDO FA_QVNTS_DPEDIDO.QDPEDIDO_QDPEDIDO%TYPE;
BEGIN
    FA_QVNTS_DPEDIDO.insertar_DPEDIDO(
        QDPEDIDO_QDPEDIDO => v_QDPEDIDO_QDPEDIDO,
        p_DPEDIDO_PRDTO => 101,
        p_DPEDIDO_CNTD => 2,
        p_DPEDIDO_PRCIO => 50.00,
        p_respuesta => v_respuesta
    );
    DBMS_OUTPUT.PUT_LINE('ID del detalle de pedido: ' || v_respuesta.DPEDIDO_DPEDIDO);
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_respuesta.PEDIDO_CODIGO);
    DBMS_OUTPUT.PUT_LINE('Mensaje: ' || v_respuesta.PEDIDO_MENSAJE);
END;
/