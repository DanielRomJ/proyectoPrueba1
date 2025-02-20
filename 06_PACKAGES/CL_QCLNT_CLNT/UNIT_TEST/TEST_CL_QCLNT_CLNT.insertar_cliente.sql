DECLARE
    v_respuesta CL_TY_TO_CLNT_RPSTA;
BEGIN
    CL_QCLNT_CLNT.insertar_cliente(
        p_clnt_nomb => 'Juan Pérez',
        p_clnt_tpid => 'CC',
        p_clnt_nit  => '123456789',
        p_clnt_dire => 'Calle Falsa 123',
        p_respuesta => v_respuesta
    );
    DBMS_OUTPUT.PUT_LINE('ID del cliente: ' || v_respuesta.clnt_clnt);
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_respuesta.CLNT_CODIGO);
    DBMS_OUTPUT.PUT_LINE('Mensaje: ' || v_respuesta.CLNT_MENSAJE);
END;
/