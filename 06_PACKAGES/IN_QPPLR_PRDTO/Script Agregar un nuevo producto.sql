BEGIN
    -- Insertar un nuevo producto
    IN_QPPLR_PRDTO.insertar_producto( 
        QPRDTO_PRDTO => 2,
        QPRDTO_NOMB => 'Laptop',
        QPRDTO_DESC => 'Lapto Hp Ryzen 3',
        QPRDTO_STCK => 20, 
        QPRDTO_PRCIO => 1250000
         );
END;