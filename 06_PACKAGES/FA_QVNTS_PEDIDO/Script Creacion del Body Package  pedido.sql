CREATE OR REPLACE PACKAGE BODY FA_QVNTS_PEDIDO AS
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
END FA_QVNTS_PEDIDO;