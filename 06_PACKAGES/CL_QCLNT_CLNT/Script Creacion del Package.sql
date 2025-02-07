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