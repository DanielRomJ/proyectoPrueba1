DECLARE
    
    v_clnt_clnt CL_TCLNT_CLNT.CLNT_CLNT%TYPE;
    
BEGIN
    
    
    v_clnt_clnt := 1:
    
    -- Insertar un nuevo cliente
    CL_QCLNT_CLNT.actualizar_cliente( 
        P_CLNT_CLNT => v_clnt_clnt,              --OUT      CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        P_CLNT_NOMB => 'Katy Perry',             --IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        P_CLNT_TPID => 'CC',                     --IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        P_CLNT_NIT => 123455432,                 --IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        P_CLNT_DIRE => 'Direccion prueba 1'      --IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
    );
    
    DBMS_OUTPUT.PUT_LINE('v_clnt_clnt-------------------:'||v_clnt_clnt);     
               
    
    
END;