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
   
    -- -----------------------------------------------------------------
    -- insertar_pedido
    -- -----------------------------------------------------------------
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        Q_PEDIDO_PEDIDO         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        Q_PEDIDO_CLNT           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        Q_PEDIDO_FCREA          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    );
	    -- -----------------------------------------------------------------
    -- actualizar_pedido
    -- -----------------------------------------------------------------
    -- Actualizar un pedido existente
    PROCEDURE actualizar_pedido(
        Q_PEDIDO_PEDIDO         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        Q_PEDIDO_CLNT           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        Q_PEDIDO_FCREA          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    );
    END FA_QVNTS_PEDIDO;

CREATE OR REPLACE PACKAGE BODY FA_QVNTS_PEDIDO AS
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
        Q_PEDIDO_PEDIDO         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        Q_PEDIDO_CLNT           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        Q_PEDIDO_FCREA          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE

    )IS
    BEGIN 
        INSERT INTO FA_TVNTS_PEDIDO (PEDIDO_PEDIDO,PEDIDO_CLNT,PEDIDO_FCREA)
        VALUES (pedido_SEQ.nextval,Q_PEDIDO_CLNT,Q_PEDIDO_FCREA);
        DBMS_OUTPUT.PUT_LINE('Pedido insertado correctamente.');
      EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_pedido;
	    -- ===========================================================
		-- Actualizar pedido
 PROCEDURE actualizar_pedido(
        Q_PEDIDO_PEDIDO         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        Q_PEDIDO_CLNT           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        Q_PEDIDO_FCREA          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    ) IS
    BEGIN
        UPDATE FA_TVNTS_PEDIDO
        SET
            PEDIDO_CLNT = Q_PEDIDO_CLNT,
            PEDIDO_FCREA = Q_PEDIDO_FCREA
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
