CREATE OR REPLACE FUNCTION ObtenerPedidosPorCliente(
    p_cliente_id IN FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE
) RETURN PedidoInfoTable PIPELINED
AS
BEGIN
    FOR pedido IN (
        SELECT 
            PEDIDO.PEDIDO_PEDIDO, 
            PEDIDO.PEDIDO_CLNT,    
            PEDIDO.PEDIDO_FCREA,
            DPEDIDO.DPEDIDO_PRDTO,  
            DPEDIDO.DPEDIDO_CNTD,	  
            DPEDIDO.DPEDIDO_PRCIO,  
            DPEDIDO.DPEDIDO_DPEDIDO
        FROM 
            FA_TVNTS_PEDIDO PEDIDO
        JOIN 
            FA_TVNTS_DPEDIDO DPEDIDO ON DPEDIDO.DPEDIDO_PEDIDO = PEDIDO.PEDIDO_PEDIDO
        WHERE 
            PEDIDO.PEDIDO_CLNT = p_cliente_id
    ) LOOP
        PIPE ROW (PedidoInfo(
            pedido.PEDIDO_PEDIDO,
            pedido.PEDIDO_CLNT,
            pedido.PEDIDO_FCREA,
            pedido.DPEDIDO_PRDTO,
            pedido.DPEDIDO_CNTD,
            pedido.DPEDIDO_PRCIO,
            pedido.DPEDIDO_DPEDIDO
        ));
    END LOOP;
    
    RETURN;
END;
/

