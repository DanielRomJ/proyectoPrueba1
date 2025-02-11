prompt
prompt PACKAGE: FA_QVNTS_DPEDIDO
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_DPEDIDO AS
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
      

    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ============================================================
   
    -- -----------------------------------------------------------------
    -- insertar_DPEDIDO
    -- -----------------------------------------------------------------
	-- Insertar un nuevo detalle de pedido
    PROCEDURE insertar_DPEDIDO(
        p_DPEDIDO_QDPEDIDO  OUT     FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_QPEDIDO   IN      FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO     IN      FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD      IN      FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO     IN      FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    );
	-- ==============================================================
	-- Actualizar un detalle de pedido existente
	-- ==============================================================
    PROCEDURE actualizar_DPEDIDO(
        p_DPEDIDO_QDPEDIDO  IN  FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_QPEDIDO   IN  FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO     IN  FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD      IN  FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO     IN  FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    );
    -- ============================================================
    -- Declaracion de TYPES 
    -- ============================================================

END FA_QVNTS_DPEDIDO;
prompt
prompt PACKAGE BODY: FA_QVNTS_DPEDIDO
prompt

CREATE OR REPLACE PACKAGE BODY FA_QVNTS_DPEDIDO AS
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
    -- Insertar un nuevo Detalle de pedido
    PROCEDURE insertar_DPEDIDO(
        p_DPEDIDO_QDPEDIDO   OUT FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_QPEDIDO    IN  FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO      IN  FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD       IN  FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO      IN  FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    )IS
        BEGIN 
            p_DPEDIDO_QDPEDIDO := det_pedido_seq.nextval;
            INSERT INTO FA_TVNTS_DPEDIDO (DPEDIDO_DPEDIDO,DPEDIDO_PEDIDO, DPEDIDO_PRDTO,DPEDIDO_CNTD,DPEDIDO_PRCIO)
            VALUES (det_pedido_seq.nextval,p_DPEDIDO_QPEDIDO, p_DPEDIDO_PRDTO,p_DPEDIDO_CNTD,p_DPEDIDO_PRCIO);
            DBMS_OUTPUT.PUT_LINE('Producto insertado correctamente.');
          EXCEPTION
            WHEN OTHERS THEN
                -- En caso de error, hacer rollback y lanzar la excepción
                ROLLBACK;
                RAISE;
    END insertar_DPEDIDO;
	-- ===========================================================
    -- Actualizar un detalle de pedido existente
    PROCEDURE actualizar_DPEDIDO(
        p_DPEDIDO_QDPEDIDO   IN FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_QPEDIDO    IN FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO      IN FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD       IN FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO      IN FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    ) IS
        BEGIN
            UPDATE FA_TVNTS_DPEDIDO
            SET
                DPEDIDO_PEDIDO   = p_DPEDIDO_QPEDIDO,
                DPEDIDO_PRDTO    = p_DPEDIDO_PRDTO,
                DPEDIDO_CNTD     = p_DPEDIDO_CNTD,
                DPEDIDO_PRCIO    = p_DPEDIDO_PRCIO
            WHERE
                DPEDIDO_DPEDIDO = p_DPEDIDO_QDPEDIDO;

            DBMS_OUTPUT.PUT_LINE('Detalle de pedido actualizado correctamente.');
        EXCEPTION
            WHEN OTHERS THEN
                -- En caso de error, hacer rollback y lanzar la excepción
                ROLLBACK;
                RAISE;
    END actualizar_DPEDIDO;
END FA_QVNTS_DPEDIDO;
