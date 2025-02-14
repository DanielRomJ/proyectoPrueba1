CREATE OR REPLACE PACKAGE FA_QVNTS_GESTION_PEDIDOS AS
    -- Procedimiento para insertar pedidos con detalles
    PROCEDURE insertar_pedido_con_detalles(
        p_pedidos          IN  FA_TY_TT_VNTS_PEDIDO,          -- Lista de pedidos
        p_detalles         IN  FA_TY_TT_VNTS_DPEDIDO,         -- Lista de detalles
        p_respuestas       OUT FA_TY_TT_VNTS_RPSTA,           -- Respuestas de los pedidos
        p_respuestas_det   OUT FA_TY_TT_VNTS_DPRPSTA          -- Respuestas de los detalles
    );
END FA_QVNTS_GESTION_PEDIDOS;
/

CREATE OR REPLACE PACKAGE BODY FA_QVNTS_GESTION_PEDIDOS AS
    PROCEDURE insertar_pedido_con_detalles(
        p_pedidos          IN  FA_TY_TT_VNTS_PEDIDO,
        p_detalles         IN  FA_TY_TT_VNTS_DPEDIDO,
        p_respuestas       OUT FA_TY_TT_VNTS_RPSTA,
        p_respuestas_det   OUT FA_TY_TT_VNTS_DPRPSTA
    ) IS
        v_pedido_id NUMBER;  -- Almacenará el ID del pedido recién insertado
        v_detalles_local FA_TY_TT_VNTS_DPEDIDO;  -- Copia local de los detalles
    BEGIN
        -- Inicializar las listas de respuestas
        p_respuestas := FA_TY_TT_VNTS_RPSTA();
        p_respuestas_det := FA_TY_TT_VNTS_DPRPSTA();

        -- Copiar los detalles a una variable local
        v_detalles_local := p_detalles;

        -- Recorrer la lista de pedidos
        FOR i IN 1 .. p_pedidos.COUNT LOOP
            DECLARE
                v_respuesta_pedido FA_TY_TO_VNTS_RPSTA;
                v_respuesta_detalle FA_TY_TO_VNTS_DPRPSTA;
            BEGIN
                -- Insertar el pedido
                FA_QVNTS_PEDIDO.insertar_pedido(
                    q_pedido_clnt  => p_pedidos(i).PEDIDO_CLNT,
                    q_pedido_fcrea => p_pedidos(i).PEDIDO_FCREA,
                    p_respuesta   => v_respuesta_pedido
                );

                -- Obtener el ID del pedido recién insertado
                v_pedido_id := v_respuesta_pedido.PEDIDO_PEDIDO;

                -- Recorrer los detalles y asociarlos al pedido actual
                FOR j IN 1 .. v_detalles_local.COUNT LOOP
                    -- Verificar si el detalle corresponde al pedido actual
                    IF v_detalles_local(j).DPEDIDO_PEDIDO IS NULL THEN
                        -- Asignar el ID del pedido al detalle (en la copia local)
                        v_detalles_local(j).DPEDIDO_PEDIDO := v_pedido_id;

                        -- Insertar el detalle
                        FA_QVNTS_DPEDIDO.insertar_DPEDIDO(
                            p_DPEDIDO_PEDIDO => v_detalles_local(j).DPEDIDO_PEDIDO,
                            p_DPEDIDO_PRDTO  => v_detalles_local(j).DPEDIDO_PRDTO,
                            p_DPEDIDO_CNTD   => v_detalles_local(j).DPEDIDO_CNTD,
                            p_DPEDIDO_PRCIO  => v_detalles_local(j).DPEDIDO_PRCIO,
                            p_respuesta      => v_respuesta_detalle
                        );

                        -- Agregar la respuesta del detalle a la lista de respuestas
                        p_respuestas_det.EXTEND;
                        p_respuestas_det(p_respuestas_det.COUNT) := v_respuesta_detalle;
                    END IF;
                END LOOP;

                -- Agregar la respuesta del pedido a la lista de respuestas
                p_respuestas.EXTEND;
                p_respuestas(p_respuestas.COUNT) := v_respuesta_pedido;
            END;
        END LOOP;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END insertar_pedido_con_detalles;
END FA_QVNTS_GESTION_PEDIDOS;
/
