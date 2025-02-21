prompt
prompt PACKAGE: FA_QVNTS_DPEDIDO
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_DPEDIDO AS
  --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_DPEDIDO:
    -- ===========================================================
    --
    -- HISTORIAL DE CAMBIOS
    -- =================================================================================================================================================================
    -- Versión		GAP				Solicitud		Fecha		Realizó			Descripción
    -- -----------	-------------	-------------	----------	-------------	----------------------------------------------------------------------------------------
    -- 12000    									10/02/2025
    -- =================================================================================================================================================================
      

    -- ============================================================
    -- Declaracion de CONSTANTES GLOBALES
    -- ============================================================
	-- Procedimiento para insertar múltiples pedidos y detalles de pedido
    PROCEDURE insertar_dpedidos(
        p_dpedidos          IN       FA_TY_TT_VNTS_DPEDIDO,
        p_respuestas        OUT      FA_TY_TT_VNTS_DPRPSTA
    );
   
   
    -- -----------------------------------------------------------------
    -- insertar_DPEDIDO
    -- -----------------------------------------------------------------
	-- Insertar un nuevo detalle de pedido
    PROCEDURE insertar_DPEDIDO(
        p_DPEDIDO_PEDIDO	    IN 	    FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO 		IN	    FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD 		    IN 	    FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO 		IN 	    FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE,
		p_respuesta             OUT      FA_TY_TO_VNTS_DPRPSTA
    );
	-- ==============================================================
	-- Actualizar un detalle de pedido existente
	-- ==============================================================
    PROCEDURE actualizar_DPEDIDO(
        p_DPEDIDO_DPEDIDO 	IN		FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_PEDIDO 	IN		FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    );
    -- ============================================================
    -- Declaracion de TYPES 
    -- ============================================================


END FA_QVNTS_DPEDIDO;
/
prompt
prompt PACKAGE BODY: FA_QVNTS_DPEDIDO
prompt
CREATE OR REPLACE PACKAGE BODY FA_QVNTS_DPEDIDO AS
    --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PRIVADAS 
    -- ===========================================================
	--
	--
	-- ===========================================================
    -- PROCEDIMIENTOS Y FUNCIONES PUBLICOS
    -- ===========================================================
    -- Insertar un nuevo Detalle de pedido
    PROCEDURE insertar_DPEDIDO(
        p_DPEDIDO_PEDIDO 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD 			IN		FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO 		IN		FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE,
		p_respuesta        		OUT     FA_TY_TO_VNTS_DPRPSTA
    )IS
    BEGIN 
		p_respuesta := FA_TY_TO_VNTS_DPRPSTA(NULL,NULL,NULL);
		-- Generar un UUID usando SYS_GUID()
		SELECT RAWTOHEX(SYS_GUID()) INTO p_respuesta.DPEDIDO_DPEDIDO FROM DUAL;
        INSERT INTO FA_TVNTS_DPEDIDO (DPEDIDO_DPEDIDO, DPEDIDO_PEDIDO, DPEDIDO_PRDTO, DPEDIDO_CNTD, DPEDIDO_PRCIO)
        VALUES (p_respuesta.DPEDIDO_DPEDIDO, p_DPEDIDO_PEDIDO, p_DPEDIDO_PRDTO, p_DPEDIDO_CNTD, p_DPEDIDO_PRCIO);
		p_respuesta.PEDIDO_CODIGO := 'OK';
		p_respuesta.PEDIDO_MENSAJE := 'Detalle de pedido insertado correctamente.';
      EXCEPTION
        WHEN OTHERS THEN
		p_respuesta.PEDIDO_CODIGO := 'ERROR';
		p_respuesta.PEDIDO_MENSAJE := 'Error al insertar el detalle de pedido';
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END insertar_DPEDIDO;
	-- ===========================================================
    -- insertar varios detalles de pedido
		PROCEDURE insertar_dpedidos(
		p_dpedidos          IN       FA_TY_TT_VNTS_DPEDIDO,
        p_respuestas        OUT      FA_TY_TT_VNTS_DPRPSTA
	) IS
	BEGIN
        p_respuestas := FA_TY_TT_VNTS_DPRPSTA();
		FOR i IN 1 .. p_dpedidos.COUNT LOOP
			DECLARE
				v_respuesta FA_TY_TO_VNTS_DPRPSTA;
			BEGIN
				insertar_dpedido(
					p_DPEDIDO_PEDIDO => p_dpedidos(i).DPEDIDO_PEDIDO,
					p_DPEDIDO_PRDTO => p_dpedidos(i).DPEDIDO_PRDTO,
					p_DPEDIDO_CNTD => p_dpedidos(i).DPEDIDO_CNTD,
					p_DPEDIDO_PRCIO => p_dpedidos(i).DPEDIDO_PRCIO,					
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
	END insertar_dpedidos;
	-- ===========================================================
    -- Actualizar un detalle de pedido existente
    PROCEDURE actualizar_DPEDIDO(
        p_DPEDIDO_DPEDIDO 	IN		 FA_TVNTS_DPEDIDO.DPEDIDO_DPEDIDO%TYPE,
        p_DPEDIDO_PEDIDO 	IN		 FA_TVNTS_DPEDIDO.DPEDIDO_PEDIDO%TYPE,
        p_DPEDIDO_PRDTO 	IN		 FA_TVNTS_DPEDIDO.DPEDIDO_PRDTO%TYPE,
        p_DPEDIDO_CNTD 		IN		 FA_TVNTS_DPEDIDO.DPEDIDO_CNTD%TYPE,
        p_DPEDIDO_PRCIO 	IN		 FA_TVNTS_DPEDIDO.DPEDIDO_PRCIO%TYPE
    ) IS
    BEGIN
        UPDATE FA_TVNTS_DPEDIDO
        SET
            DPEDIDO_PEDIDO 	=	p_DPEDIDO_PEDIDO,
            DPEDIDO_PRDTO 	=	p_DPEDIDO_PRDTO,
            DPEDIDO_CNTD 	=	p_DPEDIDO_CNTD,
            DPEDIDO_PRCIO 	=	p_DPEDIDO_PRCIO
        WHERE
            DPEDIDO_DPEDIDO = p_DPEDIDO_DPEDIDO;

        DBMS_OUTPUT.PUT_LINE('Detalle de pedido actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_DPEDIDO;
END FA_QVNTS_DPEDIDO;
prompt
prompt Otorgando Permisos sobre FA_QVNTS_DPEDIDO
prompt