
DECLARE
    v_clientes CL_TY_TT_TCLNT_CLNT := CL_TY_TT_TCLNT_CLNT();
    v_respuestas CL_QCLNT_CLNT.CL_TY_TT_TRESSPUTA;
BEGIN
    v_clientes.EXTEND(3);
    v_clientes(1) := CL_TY_TO_TCLNT_CLNT('Prueba type msg error13si', 'CC', 123456789, 'Calle 123');
    v_clientes(2) := CL_TY_TO_TCLNT_CLNT('Prueba type msg error4si', 'TI', 987654321, 'Avenida 456');
    v_clientes(3) := CL_TY_TO_TCLNT_CLNT('Prueba type msg error5no', 'CAT', 456789123, 'Carrera 789');
    -- Llama al procedimiento insertar_clientes
    CL_QCLNT_CLNT.insertar_clientes(v_clientes, v_respuestas);

    -- Muestra las respuestas
    FOR i IN 1 .. v_respuestas.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente ' || i || ':');
        DBMS_OUTPUT.PUT_LINE('  ID del cliente: ' || v_respuestas(i).clnt_clnt);
        DBMS_OUTPUT.PUT_LINE('  Mensaje: ' || v_respuestas(i).ERROR_MSG);
    END LOOP;
END;
/