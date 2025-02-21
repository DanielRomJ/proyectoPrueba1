prompt
prompt PACKAGE: FA_QVNTS_PEDIDO
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_PEDIDO AS
 --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_PEDIDO:
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
    PROCEDURE insertar_pedidos(
        p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas        OUT      FA_TY_TT_VNTS_RPSTA
    );
   
    -- -----------------------------------------------------------------
    -- insertar_pedido
    -- -----------------------------------------------------------------
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    );
	    -- -----------------------------------------------------------------
    -- actualizar_pedido
    -- -----------------------------------------------------------------
    -- Actualizar un pedido existente
    PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    );
    END FA_QVNTS_PEDIDO;
create or replace PACKAGE BODY FA_QVNTS_PEDIDO AS
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
    -- Insertar un nuevo pedido
     PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    )IS
    BEGIN
		p_respuesta := FA_TY_TO_VNTS_RPSTA(NULL,NULL,NULL);
		-- Generar un UUID usando SYS_GUID()
		SELECT RAWTOHEX(SYS_GUID()) INTO p_respuesta.PEDIDO_PEDIDO FROM DUAL;
        INSERT INTO FA_TVNTS_PEDIDO (PEDIDO_PEDIDO, PEDIDO_CLNT, PEDIDO_FCREA)
        VALUES (p_respuesta.PEDIDO_PEDIDO, q_pedido_clnt, q_pedido_fcrea);
        p_respuesta.PEDIDO_CODIGO := 'OK';
		p_respuesta.PEDIDO_MENSAJE := 'Pedido insertado correctamente.';
		COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
            p_respuesta.PEDIDO_CODIGO := 'ERROR';
			p_respuesta.PEDIDO_MENSAJE := 'Error al insertar el pedido';
            ROLLBACK;
            RAISE;
    END insertar_pedido;
    -- ===========================================================
    -- Insertar un nuevos pedidos	
	PROCEDURE insertar_pedidos(
		p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas       OUT      FA_TY_TT_VNTS_RPSTA
	) IS
	BEGIN
        p_respuestas := FA_TY_TT_VNTS_RPSTA();
		FOR i IN 1 .. p_pedidos.COUNT LOOP
			DECLARE
				v_respuesta FA_TY_TO_VNTS_RPSTA;
			BEGIN
				insertar_pedido(
					q_pedido_clnt => p_pedidos(i).PEDIDO_CLNT,
					q_pedido_fcrea => p_pedidos(i).PEDIDO_FCREA,
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
	END insertar_pedidos;
	 -- ===========================================================
   

	-- ===========================================================
	-- Actualizar pedido
 PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    ) IS

    BEGIN
        UPDATE FA_TVNTS_PEDIDO
        SET
            PEDIDO_CLNT = q_pedido_clnt,
            PEDIDO_FCREA = q_pedido_fcrea
        WHERE
            PEDIDO_PEDIDO = Q_PEDIDO_PEDIDO;

        DBMS_OUTPUT.PUT_LINE('Pedido actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_pedido;
END FA_QVNTS_PEDIDO;
prompt
prompt PACKAGE: FA_QVNTS_PEDIDO
prompt
CREATE OR REPLACE PACKAGE FA_QVNTS_PEDIDO AS
 --
    --
    --#VERSION:0000012000
    --
    --
    -- ===========================================================
    -- FA_QVNTS_PEDIDO:
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
    PROCEDURE insertar_pedidos(
        p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas        OUT      FA_TY_TT_VNTS_RPSTA
    );
   
    -- -----------------------------------------------------------------
    -- insertar_pedido
    -- -----------------------------------------------------------------
    -- Insertar un nuevo pedido
    PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    );
	    -- -----------------------------------------------------------------
    -- actualizar_pedido
    -- -----------------------------------------------------------------
    -- Actualizar un pedido existente
    PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    );
    END FA_QVNTS_PEDIDO;
create or replace PACKAGE BODY FA_QVNTS_PEDIDO AS
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
    -- Insertar un nuevo pedido
     PROCEDURE insertar_pedido(
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE,
		p_respuesta       		OUT      FA_TY_TO_VNTS_RPSTA
    )IS
    BEGIN
		p_respuesta := FA_TY_TO_VNTS_RPSTA(NULL,NULL,NULL);
		-- Generar un UUID usando SYS_GUID()
		SELECT RAWTOHEX(SYS_GUID()) INTO p_respuesta.PEDIDO_PEDIDO FROM DUAL;
        INSERT INTO FA_TVNTS_PEDIDO (PEDIDO_PEDIDO, PEDIDO_CLNT, PEDIDO_FCREA)
        VALUES (p_respuesta.PEDIDO_PEDIDO, q_pedido_clnt, q_pedido_fcrea);
        p_respuesta.PEDIDO_CODIGO := 'OK';
		p_respuesta.PEDIDO_MENSAJE := 'Pedido insertado correctamente.';
		COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
            p_respuesta.PEDIDO_CODIGO := 'ERROR';
			p_respuesta.PEDIDO_MENSAJE := 'Error al insertar el pedido';
            ROLLBACK;
            RAISE;
    END insertar_pedido;
    -- ===========================================================
    -- Insertar un nuevos pedidos	
	PROCEDURE insertar_pedidos(
		p_pedidos          IN       FA_TY_TT_VNTS_PEDIDO,
        p_respuestas       OUT      FA_TY_TT_VNTS_RPSTA
	) IS
	BEGIN
        p_respuestas := FA_TY_TT_VNTS_RPSTA();
		FOR i IN 1 .. p_pedidos.COUNT LOOP
			DECLARE
				v_respuesta FA_TY_TO_VNTS_RPSTA;
			BEGIN
				insertar_pedido(
					q_pedido_clnt => p_pedidos(i).PEDIDO_CLNT,
					q_pedido_fcrea => p_pedidos(i).PEDIDO_FCREA,
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
	END insertar_pedidos;
	 -- ===========================================================
   

	-- ===========================================================
	-- Actualizar pedido
 PROCEDURE actualizar_pedido(
        q_pedido_pedido         IN       FA_TVNTS_PEDIDO.PEDIDO_PEDIDO%TYPE,
        q_pedido_clnt           IN       FA_TVNTS_PEDIDO.PEDIDO_CLNT%TYPE,
        q_pedido_fcrea          IN       FA_TVNTS_PEDIDO.PEDIDO_FCREA%TYPE
    ) IS

    BEGIN
        UPDATE FA_TVNTS_PEDIDO
        SET
            PEDIDO_CLNT = q_pedido_clnt,
            PEDIDO_FCREA = q_pedido_fcrea
        WHERE
            PEDIDO_PEDIDO = Q_PEDIDO_PEDIDO;

        DBMS_OUTPUT.PUT_LINE('Pedido actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, hacer rollback y lanzar la excepción
            ROLLBACK;
            RAISE;
    END actualizar_pedido;
END FA_QVNTS_PEDIDO;