prompt
prompt TYPE OBJECT: TE_TY_CLNT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         TYPE PARA CLIENTES TE_TY_CLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE OR REPLACE TYPE TE_TY_CLNT IS
OBJECT (
    CLNT_NOMB VARCHAR2 (100),
    CLNT_TPID VARCHAR2 (10),
    CLNT_NIT NUMBER (20),
    CLNT_DIRE VARCHAR2 (200)
);
/

prompt
prompt Otorgando Permisos sobre TE_TY_CLNT
prompt

--
begin
  --
  for i in ( select null
               from dba_Objects
              where Owner        =  'PUBLIC'
                and Object_Type  =  'SYNONYM'
                and Object_Name  =  upper('TE_TY_CLNT')
             ) loop
    --
    execute immediate 'drop public synonym TE_TY_CLNT';
    --
  end loop;
  --
end;
/
create public synonym TE_TY_CLNT for VU_SFI.TE_TY_CLNT;
grant execute on VU_SFI.TE_TY_CLNT to SFI_ACTUALIZA;
grant execute on VU_SFI.TE_TY_CLNT to SFI_CONSULTA;
