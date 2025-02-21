CREATE OR REPLACE TRIGGER tr_actualizar_fecha_pedido
	--
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_DPEDIDO:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	----------	-------------	----------------------------------------------------------------------------------------
    -- 12000    									10/02/2025
    -- =================================================================================================================================================================
      
AFTER INSERT ON FA_TVNTS_DPEDIDO
FOR EACH ROW
BEGIN
    -- Actualizar la fecha de creación del pedido en FA_TVNTS_PEDIDO
    UPDATE FA_TVNTS_PEDIDO
    SET PEDIDO_FCREA = SYSDATE
    WHERE PEDIDO_PEDIDO = :NEW.DPEDIDO_PEDIDO;
END;
/