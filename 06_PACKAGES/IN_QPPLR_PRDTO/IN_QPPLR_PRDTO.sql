prompt
prompt PACKAGE: IN_QPPLR_PRDTO
prompt
CREATE OR REPLACE PACKAGE IN_QPPLR_PRDTO AS
  --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- IN_QPPLR_PRDTO:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	10/02/2025	-------------	----------------------------------------------------------------------------------------
    -- 12000    					
    -- =================================================================================================================================================================
      

    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ============================================================
    
    
    -- ============================================================
    -- Declaracion de TYPES 
    -- ============================================================


    -- -----------------------------------------------------------------.....................
    -- insertar_producto
	-- -----------------------------------------------------------------
    -- Insertar un nuevo producto
    PROCEDURE insertar_producto(
        p_PRDTO_PRDTO OUT IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        p_PRDTO_NOMB  IN IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        p_PRDTO_DESC  IN IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        p_PRDTO_STCK  IN IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        p_PRDTO_PRCIO IN IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
    );
	    PROCEDURE actualizar_producto(
        p_PRDTO_PRDTO    IN     IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        p_PRDTO_NOMB     IN      IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        p_PRDTO_DESC     IN      IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        p_PRDTO_STCK     IN      IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        p_PRDTO_PRCIO    IN      IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
    );
    END IN_QPPLR_PRDTO;
/
CREATE OR REPLACE PACKAGE BODY IN_QPPLR_PRDTO AS
    --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PRIVADAS 
    -- ===========================================================
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PUBLICOS
    -- ===========================================================
    -- Insertar un nuevo producto
    PROCEDURE insertar_producto(
        p_PRDTO_PRDTO    OUT     IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        p_PRDTO_NOMB     IN      IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        p_PRDTO_DESC     IN      IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        p_PRDTO_STCK     IN      IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        p_PRDTO_PRCIO    IN      IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
    )IS
    BEGIN
        -- Generar un UUID usando SYS_GUID()
        SELECT RAWTOHEX(SYS_GUID()) INTO p_PRDTO_PRDTO FROM DUAL;
        INSERT INTO IN_TPPLR_PRDTO (PRDTO_PRDTO, PRDTO_NOMB, PRDTO_DESC, PRDTO_STCK, PRDTO_PRCIO)
        VALUES (p_PRDTO_PRDTO, p_PRDTO_NOMB, p_PRDTO_DESC, p_PRDTO_STCK, p_PRDTO_PRCIO);
        DBMS_OUTPUT.PUT_LINE('Producto insertado correctamente.');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_producto;
	PROCEDURE actualizar_producto(
        p_PRDTO_PRDTO     IN IN_TPPLR_PRDTO.PRDTO_PRDTO%TYPE,
        p_PRDTO_NOMB      IN IN_TPPLR_PRDTO.PRDTO_NOMB%TYPE,
        p_PRDTO_DESC      IN IN_TPPLR_PRDTO.PRDTO_DESC%TYPE,
        p_PRDTO_STCK      IN IN_TPPLR_PRDTO.PRDTO_STCK%TYPE,
        p_PRDTO_PRCIO     IN IN_TPPLR_PRDTO.PRDTO_PRCIO%TYPE
    ) IS
    BEGIN
        UPDATE IN_TPPLR_PRDTO
        SET PRDTO_NOMB  = p_PRDTO_NOMB,
            PRDTO_DESC  = p_PRDTO_DESC,
            PRDTO_STCK  = p_PRDTO_STCK,
            PRDTO_PRCIO = p_PRDTO_PRCIO
        WHERE PRDTO_PRDTO = p_PRDTO_PRDTO;

        DBMS_OUTPUT.PUT_LINE('Producto actualizado correctamente.');
        -- Confirmar la transacción
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_producto;
END IN_QPPLR_PRDTO;