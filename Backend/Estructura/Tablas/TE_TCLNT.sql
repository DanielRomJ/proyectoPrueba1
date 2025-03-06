prompt
prompt TE_TCLNT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Creando tabla TE_TCLNT
-- =========== ===================== ============ ================== ================================================================================================================
--

prompt
prompt CREANDO TABLA TE_TCLNT
prompt

CREATE TABLE TE_TCLNT (
  CLNT_CLNT VARCHAR2 (50) GENERATED ALWAYS AS IDENTITY,
  CLNT_NOMB VARCHAR2 (100),
  CLNT_TPID VARCHAR2 (20),
  CLNT_NIT NUMBER (10),
  CLNT_DIRE VARCHAR2 (200),
  version_java  number(20)
)
tablespace TS_DSFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage ( initial 128k   next 128k   minextents 1   maxextents unlimited);

prompt
prompt COMENTARIOS TABLA TE_TCLNT
prompt

COMMENT ON TABLE TE_TCLNT IS 'Tabla que almacena Clientes';
COMMENT ON COLUMN TE_TCLNT.CLNT_CLNT IS 'Identificador único del cliente';
COMMENT ON COLUMN TE_TCLNT.CLNT_NOMB IS 'Nombre del cliente';
COMMENT ON COLUMN TE_TCLNT.CLNT_TPID IS 'Tipo de identificación del cliente';
COMMENT ON COLUMN TE_TCLNT.CLNT_NIT IS 'Número de identificación del cliente';
COMMENT ON COLUMN TE_TCLNT.CLNT_DIRE IS 'Dirección del cliente';
COMMENT ON COLUMN TE_TCLNT.version_java IS 'VERSION JAVA';
prompt
prompt OTORGANDO PERMISOS SOBRE TE_TCLNT
prompt

begin
 for i in ( select null
       from dba_Objects
      where Owner        =  'PUBLIC'
        and Object_Type  =  'SYNONYM'
        and Object_Name  =  upper('TE_TCLNT')
     ) loop
  execute immediate 'drop public synonym TE_TCLNT';
 end loop;
end;
/


CREATE PUBLIC SYNONYM TE_TCLNT FOR VU_SFI.TE_TCLNT;
GRANT SELECT, INSERT, UPDATE, DELETE ON VU_SFI.TE_TCLNT TO SFI_ACTUALIZA;
GRANT SELECT  ON VU_SFI.TE_TCLNT TO SFI_CONSULTA;
GRANT SELECT  ON VU_SFI.TE_TCLNT TO SFI_SOPORTE;
