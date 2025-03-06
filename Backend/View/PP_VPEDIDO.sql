prompt
prompt view: PP_VPEDIDO
prompt

CREATE OR REPLACE FORCE VIEW PP_VPEDIDO
(
	CLNT,
	FCREA,
VERSION_JAVA 
) AS 
SELECT /* #VERSION:0000012000 */--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                04-03-2025    Daniel         Vista para ver Detalles de pedido y pedidos PP_VPEDIDO
-- =========== ===================== ============ ================== ================================================================================================================
--
            DPEDIDO.DPEDIDO_PEDIDO, 
            DPEDIDO.DPEDIDO_PRDTO,  
            DPEDIDO.DPEDIDO_CNTD,	  
            DPEDIDO.DPEDIDO_PRCIO,  
            DPEDIDO.DPEDIDO_DPEDIDO,
            PEDIDO.PEDIDO_CLNT,    
            PEDIDO.PEDIDO_FCREA   
        FROM 
            FA_TVNTS_PEDIDO PEDIDO
        JOIN 
            FA_TVNTS_DPEDIDO DPEDIDO ON DPEDIDO.DPEDIDO_PEDIDO = PEDIDO.PEDIDO_PEDIDO
        WHERE 
            PEDIDO.PEDIDO_PEDIDO = DPEDIDO.DPEDIDO_PEDIDO;

FROM AD_TPDID

prompt
prompt Otorgando Permisos sobre PP_VPEDIDO
prompt

-- Eliminación y recreación de sinónimo público para la vista
BEGIN
  FOR i IN (SELECT NULL
            FROM dba_Objects
            WHERE Owner = 'PUBLIC'
              AND Object_Type = 'SYNONYM'
              AND Object_Name = UPPER('PP_VPEDIDO')
           ) LOOP
    EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM PP_VPEDIDO';
  END LOOP;
END;
/

-- Creación de sinónimo público para la vista PP_VPEDIDO
CREATE PUBLIC SYNONYM PP_VPEDIDO FOR PP_VPEDIDO;

-- Otorgar permisos de selección a roles o usuarios específicos
GRANT SELECT ON VU_SFI.PP_VPEDIDO TO SFI_CONSULTA;
GRANT SELECT ON VU_SFI.PP_VPEDIDO TO SFI_ACTUALIZA;
