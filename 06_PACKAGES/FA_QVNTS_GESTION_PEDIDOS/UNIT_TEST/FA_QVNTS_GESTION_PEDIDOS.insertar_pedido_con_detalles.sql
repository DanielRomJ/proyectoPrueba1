DECLARE
    v_pedidos          FA_TY_TT_VNTS_PEDIDO;
    v_detalles         FA_TY_TT_VNTS_DPEDIDO;
    v_respuestas       FA_TY_TT_VNTS_RPSTA;
    v_respuestas_det   FA_TY_TT_VNTS_DPRPSTA;
BEGIN
    -- Crear una lista de pedidos
    v_pedidos := FA_TY_TT_VNTS_PEDIDO(
        FA_TY_TO_VNTS_PEDIDO(5, SYSDATE),  -- Pedido 1
        FA_TY_TO_VNTS_PEDIDO(5, SYSDATE)   -- Pedido 2
    );

    -- Crear una lista de detalles
    v_detalles := FA_TY_TT_VNTS_DPEDIDO(
        FA_TY_TO_VNTS_DPEDIDO(NULL, 1, 1, 30999),  -- Detalle para Pedido 1
        FA_TY_TO_VNTS_DPEDIDO(NULL, 1, 1, 30999)  -- Detalle para Pedido 1

    );

    -- Llamar al procedimiento para insertar pedidos y detalles
    FA_QVNTS_GESTION_PEDIDOS.insertar_pedido_con_detalles(
        p_pedidos    => v_pedidos,
        p_detalles   => v_detalles,
        p_respuestas => v_respuestas,
        p_respuestas_det => v_respuestas_det
    );

    -- Mostrar las respuestas
    FOR i IN 1 .. v_respuestas.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_respuestas(i).PEDIDO_PEDIDO || ', Código: ' || v_respuestas(i).PEDIDO_CODIGO || ', Mensaje: ' || v_respuestas(i).PEDIDO_MENSAJE);
    END LOOP;

    FOR i IN 1 .. v_respuestas_det.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Detalle ID: ' || v_respuestas_det(i).DPEDIDO_DPEDIDO || ', Código: ' || v_respuestas_det(i).PEDIDO_CODIGO || ', Mensaje: ' || v_respuestas_det(i).PEDIDO_MENSAJE);
    END LOOP;
END;
/