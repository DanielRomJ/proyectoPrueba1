
DECLARE
    v_respuesta FA_TY_TO_VNTS_RPSTA;
BEGIN
    FA_QVNTS_PEDIDO.insertar_pedido(
        q_pedido_clnt => 1,
        q_pedido_fcrea => SYSDATE,
        p_respuesta => v_respuesta
    );
    DBMS_OUTPUT.PUT_LINE('ID del pedido: ' || v_respuesta.PEDIDO_PEDIDO);
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_respuesta.PEDIDO_CODIGO);
    DBMS_OUTPUT.PUT_LINE('Mensaje: ' || v_respuesta.PEDIDO_MENSAJE);
END;
/