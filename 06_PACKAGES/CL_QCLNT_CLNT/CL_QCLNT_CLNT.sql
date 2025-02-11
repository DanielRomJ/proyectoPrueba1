prompt
prompt PACKAGE: CL_QCLNT_CLNT
prompt


CREATE OR REPLACE PACKAGE CL_QCLNT_CLNT AS
    --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- CL_QCLNT_CLNT:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	----------	-------------	----------------------------------------------------------------------------------------
    -- 12000    					
    -- =================================================================================================================================================================
      

    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ============================================================
    
    
    -- ============================================================
    -- Declaracion de TYPES 
    -- ============================================================


    -- -----------------------------------------------------------------
    -- insertar_cliente
    -- -----------------------------------------------------------------
    -- Insertar un nuevo cliente
    -- -----------------------------------------------------------------
    PROCEDURE insertar_cliente(
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
        p_clnt_clnt         OUT      CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
    );
	-- -----------------------------------------------------------------
    -- actualizar_cliente
    -- -----------------------------------------------------------------
    -- Actualizar cliente
    -- -----------------------------------------------------------------
	PROCEDURE actualizar_cliente(
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
        p_clnt_clnt         OUT      CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
    );	
END CL_QCLNT_CLNT;
/
prompt
prompt PACKAGE BODY: CL_QCLNT_CLNT
prompt
CREATE OR REPLACE PACKAGE BODY CL_QCLNT_CLNT AS
    --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PRIVADAS 
    -- ===========================================================
    -- Actualizar un cliente existente
    PROCEDURE actualizar_cliente(
        p_clnt_clnt         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
    ) IS
    BEGIN
        UPDATE CL_TCLNT_CLNT
        SET CLNT_NOMB = P_CLNT_NOMB,
            CLNT_TPID = P_CLNT_TPID,
            CLNT_NIT  = P_CLNT_NIT,
            CLNT_DIRE = P_CLNT_DIRE
        WHERE CLNT_CLNT = P_CLNT_CLNT;

        DBMS_OUTPUT.PUT_LINE('Cliente actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_cliente;
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PUBLICOS
    -- ===========================================================
    -- Insertar un nuevo cliente
    PROCEDURE insertar_cliente(
        
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE %TYPE
        p_clnt_clnt         OUT      CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        
    )IS       
    cursor c_tpid IS
    select tpid_tpid from TP_TTPO_TPID
    where TPID_TPID = p_clnt_tpid;

    v_tpid CL_TCLNT_CLNT.CLNT_TPID%TYPE,
BEGIN
	OPEN c_tpid;
	FETCH c_tpid into v_tpid
		
    for i in c_tpid LOOP
        -- Mostrar los valores
        DBMS_OUTPUT.PUT_LINE('ID: ' || i.tpid_tpid);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || i.tpid_nomb);
        DBMS_OUTPUT.PUT_LINE('Descripción: ' || i.tpid_desc);

        -- Validar si el tipo de identificación es válido
        IF i.tpid_tpid IN ('DNI', 'Pasaporte', 'Cédula') THEN
            v_tpid_valid := TRUE;
            DBMS_OUTPUT.PUT_LINE('Tipo de identificación válido.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Tipo de identificación no válido.');
        END IF;
    end loop;

    -- Verificar si se encontró un tipo de identificación válido
    IF v_tpid_valid THEN
        DBMS_OUTPUT.PUT_LINE('Validación exitosa: Tipo de identificación válido encontrado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Validación fallida: No se encontró un tipo de identificación válido.');
    END IF;
END;
		
		
		
    BEGIN 
        p_clnt_clnt := CLIENTE_SEQ.nextval;
        INSERT INTO CL_TCLNT_CLNT (CLNT_CLNT,CLNT_NOMB,CLNT_TPID,CLNT_NIT,CLNT_DIRE)
        VALUES (p_clnt_clnt,P_CLNT_NOMB,P_CLNT_TPID,P_CLNT_NIT,P_CLNT_DIRE);
        DBMS_OUTPUT.PUT_LINE('Cliente insertado correctamente.');
      EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_cliente;
END CL_QCLNT_CLNT;
/
prompt
prompt Otorgando Permisos sobre CL_QCLNT_CLNT
prompt


