DECLARE
    v_clientes CL_TY_TT_TCLNT_CLNT := CL_TY_TT_TCLNT_CLNT();
BEGIN
    -- Extender la colección y agregar clientes
    v_clientes.EXTEND(3);
    v_clientes(1) := CL_TY_TO_TCLNT_CLNT('Juan Perez', 'CC', 123456789, 'Calle 123');
    v_clientes(2) := CL_TY_TO_TCLNT_CLNT('Maria Gomez', 'TI', 987654321, 'Avenida 456');
    v_clientes(3) := CL_TY_TO_TCLNT_CLNT('Carlos Ruiz', 'CAT', 456789123, 'Carrera 789');

    -- Insertar los clientes
    CL_QCLNT_CLNT.insertar_clientes(v_clientes);
END;
/
