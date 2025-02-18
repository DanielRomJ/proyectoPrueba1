DECLARE
    v_cursor FA_QVNTS_GESTION_PEDIDOS.FA_RC_INFOPEDIDO; -- Cursor para almacenar los resultados
    v_row FA_QVNTS_GESTION_PEDIDOS.FA_TY_INFOPEDIDO;    -- Variable para almacenar cada fila
BEGIN
    -- Llamar al procedimiento para consultar la información del pedido con ID = 1
    FA_QVNTS_GESTION_PEDIDOS.consultar_info(p_ID => 12, p_info_pedido => v_cursor);

    -- Recorrer el cursor y mostrar los resultados
    LOOP
        FETCH v_cursor INTO v_row;
        EXIT WHEN v_cursor%NOTFOUND;

        -- Mostrar los valores de cada fila
        DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_row.p_dpedido_pedido);
        DBMS_OUTPUT.PUT_LINE('Producto ID: ' || v_row.p_dpedido_prdto);
        DBMS_OUTPUT.PUT_LINE('Cantidad: ' || v_row.p_dpedido_cntd);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_row.p_dpedido_prcio);
        DBMS_OUTPUT.PUT_LINE('Detalle Pedido ID: ' || v_row.p_dpedido_dpedido);
        DBMS_OUTPUT.PUT_LINE('Cliente ID: ' || v_row.p_pedido_clnt);
        DBMS_OUTPUT.PUT_LINE('Fecha Creación: ' || TO_CHAR(v_row.p_pedido_fcrea, 'DD/MM/YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
    END LOOP;

    -- Cerrar el cursor
    CLOSE v_cursor;
END;
/
