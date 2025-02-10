CREATE OR REPLACE PACKAGE CL_QCLNT_CLNT AS
    -- Insertar un nuevo cliente
    PROCEDURE insertar_cliente(
        Q_CLNT_CLNT         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        Q_CLNT_NOMB         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        Q_CLNT_TPID         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        Q_CLNT_NIT          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        Q_CLNT_DIRE         IN       CL_TCLNT_CLNT.CLNT_DIRE %TYPE
    );
    -- Actualizar cliente
    PROCEDURE insertar_cliente(
        Q_CLNT_CLNT         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        Q_CLNT_NOMB         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        Q_CLNT_TPID         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        Q_CLNT_NIT          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        Q_CLNT_DIRE         IN       CL_TCLNT_CLNT.CLNT_DIRE %TYPE
    );

    END CL_QCLNT_CLNT;

CREATE OR REPLACE PACKAGE BODY CL_QCLNT_CLNT AS
    -- Insertar un nuevo cliente
    PROCEDURE actualizar_cliente(
        Q_CLNT_CLNT         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        Q_CLNT_NOMB         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        Q_CLNT_TPID         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        Q_CLNT_NIT          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        Q_CLNT_DIRE         IN       CL_TCLNT_CLNT.CLNT_DIRE %TYPE
    )IS
    BEGIN 
        INSERT INTO CL_TCLNT_CLNT (CLNT_CLNT,CLNT_NOMB,CLNT_TPID,CLNT_NIT,CLNT_DIRE)
        VALUES (CLIENTE_SEQ.nextval,Q_CLNT_NOMB,Q_CLNT_TPID,Q_CLNT_NIT,Q_CLNT_DIRE);
        DBMS_OUTPUT.PUT_LINE('Cliente insertado correctamente.');
      EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_cliente;
 -- Actualizar un cliente existente
    PROCEDURE actualizar_cliente(
        Q_CLNT_CLNT         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        Q_CLNT_NOMB         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        Q_CLNT_TPID         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        Q_CLNT_NIT          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        Q_CLNT_DIRE         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
    ) IS
    BEGIN
        UPDATE CL_TCLNT_CLNT
        SET CLNT_NOMB = Q_CLNT_NOMB,
            CLNT_TPID = Q_CLNT_TPID,
            CLNT_NIT  = Q_CLNT_NIT,
            CLNT_DIRE = Q_CLNT_DIRE
        WHERE CLNT_CLNT = Q_CLNT_CLNT;

        DBMS_OUTPUT.PUT_LINE('Cliente actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_cliente;


END CL_QCLNT_CLNT;