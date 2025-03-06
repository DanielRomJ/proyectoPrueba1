prompt
prompt view: AD_VGHC
prompt

CREATE OR REPLACE FORCE VIEW AD_VGHC
(
	CLNT,
	NOMB,
	TPID,
	NIT,
	DIRE,
VERSION_JAVA 
) AS 
SELECT /* #VERSION:0000012000 */--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                28-02-2025    hg         gh AD_VGHC
-- =========== ===================== ============ ================== ================================================================================================================
--


	CLNT,
	NOMB,
	TPID,
	NIT,
	DIRE,
VERSION_JAVA 

FROM TE_TCLNT

prompt
prompt Otorgando Permisos sobre AD_VGHC
prompt

-- Eliminación y recreación de sinónimo público para la vista
BEGIN
  FOR i IN (SELECT NULL
            FROM dba_Objects
            WHERE Owner = 'PUBLIC'
              AND Object_Type = 'SYNONYM'
              AND Object_Name = UPPER('AD_VGHC')
           ) LOOP
    EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM AD_VGHC';
  END LOOP;
END;
/

-- Creación de sinónimo público para la vista AD_VGHC
CREATE PUBLIC SYNONYM AD_VGHC FOR AD_VGHC;

-- Otorgar permisos de selección a roles o usuarios específicos
GRANT SELECT ON VU_SFI.AD_VGHC TO SFI_CONSULTA;
GRANT SELECT ON VU_SFI.AD_VGHC TO SFI_ACTUALIZA;
