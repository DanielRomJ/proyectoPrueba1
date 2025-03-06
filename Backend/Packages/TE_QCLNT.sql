prompt
prompt PACKAGE: TE_QCLNT
prompt

CREATE OR REPLACE PACKAGE TE_QCLNT AS
    --
    --#VERSION:0000012000
--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Se crea paquete TE_QCLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

    -- Procedimientos y funciones

	---------------------------------------------------------------------
	-- Paquete para modificar la tabla clientes 
	PROCEDURE INSERTAR_CLIENTES (
			p_NOMB	 in    VARCHAR2 ,
			p_TPID	 in    VARCHAR2 ,
			p_NIT	 in    NUMBER ,
			p_DIRE	 in    VARCHAR2 ,
			p_CLNT	 OUT    VARCHAR2 ,
			p_Reg_Error  out    varchar2,
			p_Det_Error  out    varchar2
	);
END TE_QCLNT;
/

CREATE OR REPLACE PACKAGE BODY TE_QCLNT AS
    --
    --#VERSION:0000012000
    --
    -- Procedimientos y funciones


	---------------------------------------------------------------------
	-- Paquete para modificar la tabla clientes 
	Procedure INSERTAR_CLIENTES(
			P_NOMB	 in    VARCHAR2 ,
			P_TPID	 in    VARCHAR2 ,
			P_NIT	 in    NUMBER ,
			P_DIRE	 in    VARCHAR2 ,
			P_CLNT	 OUT    VARCHAR2 ,
			p_Reg_Error  out    varchar2,
			p_Det_Error  out    varchar2) is
	-- 
	v_Reg_Error 	VARCHAR2(10) := 'OK';
	v_Msg_Rpta VARCHAR2(500) := 'EXITOSO';
	-- 
	Begin
		-- 
		p_Reg_Error := v_Reg_Error;
		p_Det_Error := v_Msg_Rpta;
		-- 



	EXCEPTION
		-- 
		WHEN OTHERS THEN
			--
			p_Reg_Error :=  'Error en TE_QCLNT.INSERTAR_CLIENTES.';
			p_Det_Error := sqlerrm;
			--
	End INSERTAR_CLIENTES;

END TE_QCLNT;
/

prompt
prompt Otorgando Permisos sobre TE_QCLNT
prompt

BEGIN
  --
  FOR i IN (SELECT NULL
               FROM dba_objects
              WHERE owner        = 'PUBLIC'
                AND object_type  = 'SYNONYM'
                AND object_name  = 'TE_QCLNT') LOOP
    --
    EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM TE_QCLNT';
    --
  END LOOP;
  --
END;
/

CREATE PUBLIC SYNONYM TE_QCLNT FOR VU_SFI.TE_QCLNT;
GRANT EXECUTE ON VU_SFI.TE_QCLNT TO SFI_ACTUALIZA;
GRANT EXECUTE ON VU_SFI.TE_QCLNT TO SFI_CONSULTA;
