prompt
prompt PACKAGE: FA_QVNTS_PEDIDO
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_PEDIDO AS
 --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_PEDIDO:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	----------	-------------	----------------------------------------------------------------------------------------
    -- 12000    									10/02/2025
    -- =================================================================================================================================================================
      

    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ============================================================
    PROCEDURE insertar_pedidos_dpedidos(
        p_pedidos          IN       FA_TY_TT_PEDIDO_DPEDIDO,
		p_pedidos_dpedidos  IN       FA_TY_TT_VNTS_PEDIDO, 
        p_respuestas        OUT      FA_TY_TT_VNTS_RPSTA,
        p_dpedidos          IN       FA_TY_TT_VNTS_DPEDIDO
	);
	     -- Procedimiento para insertar múltiples pedidos y detalles de pedido
    PROCEDURE insertar_pedidos(
        p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas        OUT      FA_TY_TT_VNTS_RPSTA
    );
   
    -- -----------------------------------------------------------------
    -- insertar_pedido
    -- -----------------------------------------------------------------
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    );
	    -- -----------------------------------------------------------------
    -- actualizar_pedido
    -- -----------------------------------------------------------------
    -- Actualizar un pedido existente
    PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    );
    END FA_QVNTS_PEDIDO;
create or replace PACKAGE BODY SQL_RQGWP41J1ERSEAWNRG8T23HMBS.FA_QVNTS_PEDIDO AS
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
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    )IS
    BEGIN
		p_respuesta := FA_TY_TO_VNTS_RPSTA(NULL,NULL,NULL);
		p_respuesta.PEDIDO_PEDIDO := pedido_SEQ.nextval;
        INSERT INTO FA_TVNTS_PEDIDO (PEDIDO_PEDIDO,PEDIDO_CLNT,PEDIDO_FCREA)
        VALUES (p_respuesta.PEDIDO_PEDIDO,q_pedido_clnt,q_pedido_fcrea);
        p_respuesta.PEDIDO_CODIGO := 'OK';
		p_respuesta.PEDIDO_MENSAJE := 'Pedido insertado correctamente.';
		COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
            p_respuesta.PEDIDO_CODIGO := 'ERROR';
			p_respuesta.PEDIDO_MENSAJE := 'Error al inserta el el pedido';
            ROLLBACK;
            RAISE;
    END insertar_pedido;
    -- ===========================================================
    -- Insertar un nuevos pedidos	
	PROCEDURE insertar_pedidos(
		p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas       OUT      FA_TY_TT_VNTS_RPSTA
	) IS
	BEGIN
        p_respuestas := FA_TY_TT_VNTS_RPSTA();
		FOR i IN 1 .. p_pedidos.COUNT LOOP
			DECLARE
				v_respuesta FA_TY_TO_VNTS_RPSTA;
			BEGIN
				insertar_pedido(
					q_pedido_clnt => p_pedidos(i).PEDIDO_CLNT,
					q_pedido_fcrea => p_pedidos(i).PEDIDO_FCREA,
					p_respuesta => v_respuesta
				);
				-- Agregar la respuesta a la lista de respuestas
				p_respuestas.EXTEND;
				p_respuestas(p_respuestas.COUNT) := v_respuesta;
			END;
		END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			RAISE;
	END insertar_pedidos;
	 -- ===========================================================
    -- Insertar un nuevos pedidos y detalles de pedido
	PROCEDURE insertar_pedidos_dpedidos(
        p_pedidos          IN        FA_TY_TT_PEDIDO_DPEDIDO,
		p_pedidos_dpedidos  IN       FA_TY_TT_PEDIDO_DPEDIDO, 
        p_respuestas        OUT      FA_TY_TT_VNTS_RPSTA,
        p_drespuestas       OUT      FA_TY_TT_VNTS_DPRPSTA,
        p_dpedidos          IN       FA_TY_TT_VNTS_DPEDIDO
	) IS
BEGIN
    -- Inicializar la colección de respuestas
    p_respuestas := FA_TY_TT_VNTS_RPSTA();
    p_drespuestas := FA_TY_TT_VNTS_DPRPSTA();
    -- Recorrer todos los pedidos
    FOR i IN 1 .. p_pedidos.COUNT LOOP 
        DECLARE
            v_drespuesta FA_TY_TO_VNTS_DPRPSTA;
            v_respuesta FA_TY_TO_VNTS_RPSTA;
            v_pedido_id NUMBER;  -- Variable para guardar el ID del pedido insertado
        BEGIN
            -- Insertar Pedido
            insertar_pedido (
                q_pedido_clnt  => p_pedidos(i).PEDIDO_CLNT,
                q_pedido_fcrea => p_pedidos(i).PEDIDO_FCREA,
                p_respuesta    => v_respuesta
            );

            -- Agregar respuesta del pedido a la lista
            p_respuestas.EXTEND;
            p_respuestas(p_respuestas.COUNT) := v_respuesta;

            -- Obtener el ID del pedido insertado (Si lo devuelve el procedimiento, ajustarlo aquí)
            v_pedido_id := v_respuesta.PEDIDO_PEDIDO; 
            -- Insertar los detalles del pedido
            FOR j IN 1 .. p_dpedidos.COUNT LOOP
                FA_QVNTS_DPEDIDO.INSERTAR_DPEDIDO(
                    p_DPEDIDO_PEDIDO => v_pedido_id,  -- Asociar al pedido insertado
                    p_DPEDIDO_PRDTO  => p_dpedidos(j).DPEDIDO_PRDTO,
                    p_DPEDIDO_CNTD   => p_dpedidos(j).DPEDIDO_CNTD,
                    p_DPEDIDO_PRCIO  => p_dpedidos(j).DPEDIDO_PRCIO,
                    p_respuesta      => v_drespuesta
                );

                -- Agregar respuesta del detalle del pedido a la lista
                p_drespuestas.EXTEND;
                p_drespuestas(p_drespuestas.COUNT) := v_drespuesta;
            END LOOP;
        END;
    END LOOP;   
    COMMIT;  -- Confirmar los cambios
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;  -- Deshacer los cambios en caso de error
        RAISE;
END insertar_pedidos_dpedidos;

	-- ===========================================================
	-- Actualizar pedido
 PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    ) IS

    BEGIN
        UPDATE FA_TVNTS_PEDIDO
        SET
            PEDIDO_CLNT = q_pedido_clnt,
            PEDIDO_FCREA = q_pedido_fcrea
        WHERE
            PEDIDO_PEDIDO = Q_PEDIDO_PEDIDO;

        DBMS_OUTPUT.PUT_LINE('Pedido actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_pedido;
END FA_QVNTS_PEDIDO;