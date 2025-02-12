prompt
prompt PACKAGE: CL_QCLNT_CLNT
prompt


create or replace PACKAGE CL_QCLNT_CLNT AS
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

	TYPE CL_TY_RESPUESTA IS RECORD (
	clnt_clnt CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
    ERROR_MSG   VARCHAR2(4000)
	);
	TYPE CL_TY_TT_TRESSPUTA IS TABLE OF CL_TY_RESPUESTA;
    -- -----------------------------------------------------------------
    -- insertar_cliente
    -- -----------------------------------------------------------------
     -- Procedimiento para insertar múltiples clientes
    PROCEDURE insertar_clientes(
        p_clientes          IN       CL_TY_TT_TCLNT_CLNT,
        p_respuestas        OUT      CL_TY_TT_TRESSPUTA
    );
    -- Insertar un nuevo cliente
    -- -----------------------------------------------------------------
    PROCEDURE insertar_cliente(
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE,
        p_respuestas        OUT      CL_TY_RESPUESTA
    );
	-- -----------------------------------------------------------------
    -- actualizar_cliente
    -- -----------------------------------------------------------------
    -- Actualizar cliente
    -- -----------------------------------------------------------------
	PROCEDURE actualizar_cliente(
        p_clnt_clnt         IN       CL_TCLNT_CLNT.CLNT_CLNT%TYPE,
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE
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
        -- Procedimiento para insertar múltiples clientes
	PROCEDURE insertar_clientes(
		p_clientes          IN       CL_TY_TT_TCLNT_CLNT,
        p_respuestas        OUT      CL_TY_TT_TRESSPUTA
	) IS
	BEGIN
        p_respuestas := CL_TY_TT_TRESSPUTA();
		FOR i IN 1 .. p_clientes.COUNT LOOP
			DECLARE
				v_respuesta CL_TY_RESPUESTA;
			BEGIN
				insertar_cliente(
					p_clnt_nomb => p_clientes(i).CLNT_NOMB,
					p_clnt_tpid => p_clientes(i).CLNT_TPID,
					p_clnt_nit  => p_clientes(i).CLNT_NIT,
					p_clnt_dire => p_clientes(i).CLNT_DIRE,
					p_respuestas => v_respuesta
				);

				-- Agregar la respuesta a la lista de respuestas
				p_respuestas.EXTEND;
				p_respuestas(p_respuestas.COUNT) := v_respuesta;
			END;
		END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			RAISE;
	END insertar_clientes;
    -- Insertar un nuevo cliente
  PROCEDURE insertar_cliente(
    p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
    p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
    p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
    p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE,
    p_respuestas         OUT      CL_TY_RESPUESTA
) IS
    cursor c_tpid IS
        SELECT tpid_tpid FROM TP_TTPO_TPID
        WHERE TPID_TPID = p_clnt_tpid;
    v_tpid CL_TCLNT_CLNT.CLNT_TPID%TYPE;
	BEGIN
    FOR i IN c_tpid LOOP
        BEGIN
            p_respuestas.clnt_clnt := CLIENTE_SEQ.nextval;
            INSERT INTO CL_TCLNT_CLNT (CLNT_CLNT, CLNT_NOMB, CLNT_TPID, CLNT_NIT, CLNT_DIRE)
            VALUES (p_respuestas.clnt_clnt, p_clnt_nomb, p_clnt_tpid, p_clnt_nit, p_clnt_dire);
            p_respuestas.ERROR_MSG := 'Cliente insertado correctamente.';
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                p_respuestas.ERROR_MSG := 'Error al insertar el cliente: ' || SQLERRM;
                ROLLBACK;
                RAISE;
        END;
		END LOOP;
	END insertar_cliente;

END CL_QCLNT_CLNT;
/

prompt
prompt Otorgando Permisos sobre CL_QCLNT_CLNT
prompt


