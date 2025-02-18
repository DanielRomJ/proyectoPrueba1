prompt
prompt PACKAGE: FA_QVNTS_GSTPDIDOS
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_GSTPDIDOS AS
--
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_GSTPDIDOS:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	----------	-------------	----------------------------------------------------------------------------------------
    -- 12000    									14/02/2025
    -- =================================================================================================================================================================
      
    
    -- ============================================================
    -- Declaracion de TYPES 
    -- ============================================================
    TYPE FA_TY_INFOPEDIDO IS RECORD (
        p_dpedido_pedido     FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_dpedido_prdto      FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_dpedido_cntd 	     FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_dpedido_prcio      FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE,
        p_dpedido_dpedido    FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_pedido_clnt        FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        p_pedido_fcrea       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE 
    ); 
    
    TYPE FA_RC_INFOPEDIDO IS REF CURSOR RETURN FA_TY_INFOPEDIDO;
    
    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ===========================================================
    -- Procedimiento para insertar pedidos con detalles
    PROCEDURE insertar_pedido_con_detalles(
        p_pedidos          IN  FA_TY_TT_VNTS_PEDIDO,          -- Lista de pedidos
        p_detalles         IN  FA_TY_TT_VNTS_DPEDIDO,         -- Lista de detalles
        p_respuestas       OUT FA_TY_TT_VNTS_RPSTA,           -- Respuestas de los pedidos
        p_respuestas_det   OUT FA_TY_TT_VNTS_DPRPSTA          -- Respuestas de los detalles
    );
    
    -- Procedimiento para consultar información de un pedido
    PROCEDURE consultar_info(
        p_ID                    IN      FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,     -- ID DE REFERENCIA
        p_info_pedido           OUT     FA_RC_INFOPEDIDO                        -- Cursor de salida con la información del pedido
    );
    
END FA_QVNTS_GSTPDIDOS;
/
prompt
prompt PACKAGE BODY: FA_QVNTS_GSTPDIDOS
prompt
CREATE OR REPLACE PACKAGE BODY FA_QVNTS_GSTPDIDOS AS
  --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PRIVADAS 
    -- ===========================================================
	--
	--
	-- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PUBLICOS
    -- ===========================================================
    -- Ver info de detalles y de pedido
    PROCEDURE consultar_info(
        p_ID                    IN      FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,     -- ID DE REFERENCIA
        p_info_pedido           OUT     FA_RC_INFOPEDIDO                        -- Cursor de salida con la información del pedido
    ) IS
    BEGIN
        -- Se abre el cursor con la consulta
        OPEN p_info_pedido FOR
        SELECT 
            DPEDIDO.DPEDIDO_PEDIDO, 
            DPEDIDO.DPEDIDO_PRDTO,  
            DPEDIDO.DPEDIDO_CNTD,	  
            DPEDIDO.DPEDIDO_PRCIO,  
            DPEDIDO.DPEDIDO_DPEDIDO,
            PEDIDO.PEDIDO_CLNT,    
            PEDIDO.PEDIDO_FCREA   
        FROM 
            FA_TVNTS_PEDIDO PEDIDO
        JOIN 
            FA_TVNTS_DPEDIDO DPEDIDO ON DPEDIDO.DPEDIDO_PEDIDO = PEDIDO.PEDIDO_PEDIDO
        WHERE 
            PEDIDO.PEDIDO_PEDIDO = p_ID;
    END consultar_info;
    -- Insertar un nuevo pedido con detalles
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
END FA_QVNTS_GSTPDIDOS;
/
prompt
prompt Otorgando Permisos sobre FA_QVNTS_GSTPDIDOS
prompt