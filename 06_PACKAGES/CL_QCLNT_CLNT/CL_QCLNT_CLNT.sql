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
    -- -----------------------------------------------------------------
    -- insertar_cliente
    -- -----------------------------------------------------------------
     -- Procedimiento para insertar múltiples clientes
    PROCEDURE insertar_clientes(
        p_clientes          IN       CL_TY_TT_TCLNT_CLNT,
        p_respuestas        OUT      CL_TY_TT_CLNT_RPSTA
    );
    -- Insertar un nuevo cliente
    -- -----------------------------------------------------------------
    PROCEDURE insertar_cliente(
        p_clnt_nomb         IN       CL_TCLNT_CLNT.CLNT_NOMB%TYPE,
        p_clnt_tpid         IN       CL_TCLNT_CLNT.CLNT_TPID%TYPE,
        p_clnt_nit          IN       CL_TCLNT_CLNT.CLNT_NIT%TYPE,
        p_clnt_dire         IN       CL_TCLNT_CLNT.CLNT_DIRE%TYPE,
        p_respuesta        OUT       CL_TY_TO_CLNT_RPSTA
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
        p_respuestas        OUT      CL_TY_TT_CLNT_RPSTA
	) IS
	BEGIN
        p_respuestas := CL_TY_TT_CLNT_RPSTA();
		FOR i IN 1 .. p_clientes.COUNT LOOP
			DECLARE
				v_respuesta CL_TY_TO_CLNT_RPSTA;
			BEGIN
				insertar_cliente(
					p_clnt_nomb => p_clientes(i).CLNT_NOMB,
					p_clnt_tpid => p_clientes(i).CLNT_TPID,
					p_clnt_nit  => p_clientes(i).CLNT_NIT,
					p_clnt_dire => p_clientes(i).CLNT_DIRE,
					p_respuesta => v_respuesta
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
    p_respuesta         OUT      CL_TY_TO_CLNT_RPSTA
) IS

    cursor c_tpid IS
        SELECT tpid_tpid FROM TP_TTPO_TPID
        WHERE TPID_TPID = p_clnt_tpid;
    v_tpid CL_TCLNT_CLNT.CLNT_TPID%TYPE;
	v_tpid_exist BOOLEAN;
	BEGIN
		v_tpid_exist := FALSE;
		p_respuesta := CL_TY_TO_CLNT_RPSTA(NULL,NULL,NULL);
		FOR i IN c_tpid LOOP
			BEGIN
				v_tpid_exist := TRUE;
				-- Generar un UUID usando SYS_GUID()
				SELECT RAWTOHEX(SYS_GUID()) INTO p_respuesta.clnt_clnt FROM DUAL;
				INSERT INTO CL_TCLNT_CLNT (CLNT_CLNT, CLNT_NOMB, CLNT_TPID, CLNT_NIT, CLNT_DIRE)
				VALUES (p_respuesta.clnt_clnt, p_clnt_nomb, p_clnt_tpid, p_clnt_nit, p_clnt_dire);
				p_respuesta.CLNT_CODIGO := 'OK';
				p_respuesta.CLNT_MENSAJE := 'Cliente insertado correctamente.';
				COMMIT;
			EXCEPTION
				WHEN OTHERS THEN
					ROLLBACK;
					RAISE;
			END;
		END LOOP;
		IF v_tpid_exist = FALSE THEN
			p_respuesta.CLNT_CODIGO := 'ERROR';
			p_respuesta.CLNT_MENSAJE := 'Error al insertar el cliente: tipo de identificación no válido.';
		END IF;
	END insertar_cliente;

END CL_QCLNT_CLNT;
/

prompt
prompt Otorgando Permisos sobre CL_QCLNT_CLNT
prompt


