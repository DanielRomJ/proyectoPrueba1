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