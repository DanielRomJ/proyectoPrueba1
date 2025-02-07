CREATE OR REPLACE PACKAGE BODY IN_QPPLR_PRDTO AS
    -- Insertar un nuevo producto
    PROCEDURE insertar_producto(
        QPRDTO_PRDTO IN IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        QPRDTO_NOMB IN IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        QPRDTO_DESC IN IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        QPRDTO_STCK IN IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        QPRDTO_PRCIO IN IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
    )IS
    BEGIN 
        INSERT INTO IN_TPPLR_PRDTO (PRDTO_PRDTO, PRDTO_NOMB,PRDTO_DESC, PRDTO_STCK, PRDTO_PRCIO)
        VALUES (PRODUCTO_SEQ.nextval, QPRDTO_NOMB,QPRDTO_DESC, QPRDTO_STCK, QPRDTO_PRCIO);
        DBMS_OUTPUT.PUT_LINE('Producto insertado correctamente.');
        -- Confirmar la transacción
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_producto;
END IN_QPPLR_PRDTO;