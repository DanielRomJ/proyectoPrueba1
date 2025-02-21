DECLARE
    v_prdto_id IN_QPPLR_PRDTO.PRDTO_PRDTO%TYPE;
BEGIN
    IN_QPPLR_PRDTO.insertar_producto(
        p_PRDTO_PRDTO => v_prdto_id,
        p_PRDTO_NOMB  => 'Producto de prueba',
        p_PRDTO_DESC  => 'Descripción del producto de prueba',
        p_PRDTO_STCK  => 100,
        p_PRDTO_PRCIO => 50.00
    );
    DBMS_OUTPUT.PUT_LINE('ID del producto: ' || v_prdto_id);
END;
/