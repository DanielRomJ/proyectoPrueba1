CREATE SEQUENCE cliente_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE OR REPLACE PACKAGE CL_QCLNT_CLNT AS
    -- Insertar un nuevo cliente
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
    PROCEDURE insertar_cliente(
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
END CL_QCLNT_CLNT;

BEGIN
    -- Insertar un nuevo cliente
    CL_QCLNT_CLNT.insertar_cliente( 
        Q_CLNT_CLNT => 2,
        Q_CLNT_NOMB => 'Katy Perry',
        Q_CLNT_TPID => 'CC',
        Q_CLNT_NIT => 123455432, 
        Q_CLNT_DIRE => 'Direccion prueba 1'
        );
END;