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

FA_TY_TT_VNTS_DPRPSTA