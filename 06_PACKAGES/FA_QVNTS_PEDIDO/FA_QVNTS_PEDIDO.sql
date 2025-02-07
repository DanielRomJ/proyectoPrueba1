CREATE SEQUENCE pedido_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE OR REPLACE PACKAGE FA_QVNTS_PEDIDO AS
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        Q_PEDIDO_PEDIDO         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        Q_PEDIDO_CLNT           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        Q_PEDIDO_FCREA          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE

    );
    END FA_QVNTS_PEDIDO;

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

BEGIN
    -- Insertar un nuevo cliente
    FA_QVNTS_PEDIDO.insertar_pedido( 
        Q_PEDIDO_PEDIDO => 1,
        Q_PEDIDO_CLNT => 1,
        Q_PEDIDO_FCREA => CURRENT_timestamp
        );
END;