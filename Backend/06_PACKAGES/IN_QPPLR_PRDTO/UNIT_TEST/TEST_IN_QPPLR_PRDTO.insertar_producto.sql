DECLARE
    
    v_PRDTO_PRDTO IN_QPPLR_PRDTO.PRDTO_PRDTO%TYPE;
    
BEGIN
	v_PRDTO_PRDTO:= 1:
    -- Insertar un nuevo producto
    IN_QPPLR_PRDTO.insertar_producto( 
		QPRDTO_PRDTO => v_PRDTO_PRDTO,				--OUT IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        QPRDTO_NOMB => 'Laptop',                    --IN IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        QPRDTO_DESC => 'Lapto Hp Ryzen 3',          --IN IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        QPRDTO_STCK => 20,                          --IN IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        QPRDTO_PRCIO => 1250000	                    --IN IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
         );
		 DBMS_OUTPUT.PUT_LINE('v_PRDTO_PRDTO-------------------:'||v_PRDTO_PRDTO); 
END;