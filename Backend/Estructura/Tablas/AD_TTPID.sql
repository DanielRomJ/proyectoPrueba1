prompt
prompt AD_TTPID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Creando tabla AD_TTPID
-- =========== ===================== ============ ================== ================================================================================================================
--

prompt
prompt CREANDO TABLA AD_TTPID
prompt

CREATE TABLE AD_TTPID (
  TPID_TPID VARCHAR2 (50) GENERATED ALWAYS AS IDENTITY,
  TPID_NOMB VARCHAR2 (20),
  TPID_DESC VARCHAR2 (500),
  version_java  number(20)
)
tablespace TS_DSFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage ( initial 128k   next 128k   minextents 1   maxextents unlimited);

prompt
prompt COMENTARIOS TABLA AD_TTPID
prompt

COMMENT ON TABLE AD_TTPID IS 'Tabla que almacena los tipos de identificacion';
COMMENT ON COLUMN AD_TTPID.TPID_TPID IS 'Nombre del tipod de identificacion';
COMMENT ON COLUMN AD_TTPID.TPID_NOMB IS 'Descripcion del tipo de identificador';
COMMENT ON COLUMN AD_TTPID.TPID_DESC IS 'Identificador unico de Tipo de IDENTIFICACIÓN';
COMMENT ON COLUMN AD_TTPID.version_java IS 'VERSION JAVA';
prompt
prompt OTORGANDO PERMISOS SOBRE AD_TTPID
prompt

begin
 for i in ( select null
       from dba_Objects
      where Owner        =  'PUBLIC'
        and Object_Type  =  'SYNONYM'
        and Object_Name  =  upper('AD_TTPID')
     ) loop
  execute immediate 'drop public synonym AD_TTPID';
 end loop;
end;
/


CREATE PUBLIC SYNONYM AD_TTPID FOR VU_SFI.AD_TTPID;
GRANT SELECT, INSERT, UPDATE, DELETE ON VU_SFI.AD_TTPID TO SFI_ACTUALIZA;
GRANT SELECT  ON VU_SFI.AD_TTPID TO SFI_CONSULTA;
GRANT SELECT  ON VU_SFI.AD_TTPID TO SFI_SOPORTE;
