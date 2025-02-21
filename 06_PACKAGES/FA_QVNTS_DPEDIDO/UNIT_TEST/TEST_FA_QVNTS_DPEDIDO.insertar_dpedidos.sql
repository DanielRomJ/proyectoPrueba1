
DECLARE
    v_dpedidos FA_TY_TT_VNTS_DPEDIDO := FA_TY_TT_VNTS_DPEDIDO();
    v_respuestas FA_TY_TT_VNTS_DPRPSTA;
BEGIN
    -- Extender la colección para 3 detalles de pedidos
    v_dpedidos.EXTEND(3);

    -- Ejemplos de detalles de pedidos
    v_dpedidos(1) := FA_TY_TO_VNTS_DPEDIDO(
        '2EACCF2AD5A4320CE063FE0EA8C0794C', -- DPEDIDO_PEDIDO (ID del pedido)
        '2EAA41A02B711FDAE0630E0EA8C0E4D4', -- DPEDIDO_PRDTO (ID del producto)
        5,                                  -- DPEDIDO_CNTD (Cantidad de producto)
        50000                               -- DPEDIDO_PRCIO (Precio unitario)
    ); -- Detalle 1

    v_dpedidos(2) := FA_TY_TO_VNTS_DPEDIDO(
        '2EACCF2AD5A5320CE063FE0EA8C0794C', -- DPEDIDO_PEDIDO (ID del pedido)
        '2EAA41A02B711FDAE0630E0EA8C0E4D4', -- DPEDIDO_PRDTO (ID del producto)
        10,                                 -- DPEDIDO_CNTD (Cantidad de producto)
        45000                               -- DPEDIDO_PRCIO (Precio unitario)
    ); -- Detalle 2

    v_dpedidos(3) := FA_TY_TO_VNTS_DPEDIDO(
        '2EACCF2AD5A6320CE063FE0EA8C0794C', -- DPEDIDO_PEDIDO (ID del pedido)
        '2EAA41A02B711FDAE0630E0EA8C0E4D4', -- DPEDIDO_PRDTO (ID del producto)
        2,                                  -- DPEDIDO_CNTD (Cantidad de producto)
        55000                               -- DPEDIDO_PRCIO (Precio unitario)
    ); -- Detalle 3

    -- Llamar al procedimiento insertar_dpedidos
    FA_QVNTS_DPEDIDO.insertar_dpedidos(
        p_dpedidos => v_dpedidos,
        p_respuestas => v_respuestas
    );

    -- Mostrar las respuestas
    FOR i IN 1 .. v_respuestas.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Respuesta para el detalle de pedido ' || i || ':');
        DBMS_OUTPUT.PUT_LINE('  ID del detalle de pedido: ' || v_respuestas(i).DPEDIDO_DPEDIDO);
        DBMS_OUTPUT.PUT_LINE('  Código: ' || v_respuestas(i).PEDIDO_CODIGO);
        DBMS_OUTPUT.PUT_LINE('  Mensaje: ' || v_respuestas(i).PEDIDO_MENSAJE);
    END LOOP;
END;
/

