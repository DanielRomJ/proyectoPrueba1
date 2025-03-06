prompt
prompt TYPE TABLE: TE_TY_TT_CLNT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         TYPE PARA CLIENTES TE_TY_TT_CLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

CREATE OR REPLACE TYPE TE_TY_TT_CLNT IS TABLE OF TE_TY_CLNT;
/

prompt
prompt Otorgando Permisos sobre TE_TY_TT_CLNT
prompt

--

begin
  --
  for i in ( select null
               from dba_Objects
              where Owner        =  'PUBLIC'
                and Object_Type  =  'SYNONYM'
                and Object_Name  =  upper('TE_TY_TT_CLNT')
             ) loop
    --
    execute immediate 'drop public synonym TE_TY_TT_CLNT';
    --
  end loop;
  --
end;
/


create public synonym TE_TY_TT_CLNT for VU_SFI.TE_TY_TT_CLNT;
grant execute on VU_SFI.TE_TY_TT_CLNT to SFI_ACTUALIZA;
grant execute on VU_SFI.TE_TY_TT_CLNT to SFI_CONSULTA;
