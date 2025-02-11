
BEGIN  
    -- Insertar un nuevo cliente
    CL_QCLNT_CLNT.actualizar_cliente( 
        P_CLNT_CLNT => 3,                        --IN      CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        P_CLNT_NOMB => 'Katy Houston',           --IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        P_CLNT_TPID => 'CC',                     --IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        P_CLNT_NIT => 201455432,                 --IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        P_CLNT_DIRE => 'Direccion '              --IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
    );                
END;