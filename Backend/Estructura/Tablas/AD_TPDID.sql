prompt
prompt AD_TPDID
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Creando tabla AD_TPDID
-- =========== ===================== ============ ================== ================================================================================================================
--

prompt
prompt CREANDO TABLA AD_TPDID
prompt

CREATE TABLE AD_TPDID (
  PDID_PDID VARCHAR2 (50) GENERATED ALWAYS AS IDENTITY,
  PDID_CLNT VARCHAR2  (50),
  PDID_FCREA DATE,
  version_java  number(20)
)
tablespace TS_DSFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage ( initial 128k   next 128k   minextents 1   maxextents unlimited);

prompt
prompt COMENTARIOS TABLA AD_TPDID
prompt

COMMENT ON TABLE AD_TPDID IS 'Tabla que almacena los PEDIDOS';
COMMENT ON COLUMN AD_TPDID.PDID_PDID IS 'Identificador único del pedido';
COMMENT ON COLUMN AD_TPDID.PDID_CLNT IS 'Identificador único del cliente';
COMMENT ON COLUMN AD_TPDID.PDID_FCREA IS 'Fecha de creación del pedido';
COMMENT ON COLUMN AD_TPDID.version_java IS 'VERSION JAVA';
prompt
prompt OTORGANDO PERMISOS SOBRE AD_TPDID
prompt

begin
 for i in ( select null
       from dba_Objects
      where Owner        =  'PUBLIC'
        and Object_Type  =  'SYNONYM'
        and Object_Name  =  upper('AD_TPDID')
     ) loop
  execute immediate 'drop public synonym AD_TPDID';
 end loop;
end;
/


CREATE PUBLIC SYNONYM AD_TPDID FOR VU_SFI.AD_TPDID;
GRANT SELECT, INSERT, UPDATE, DELETE ON VU_SFI.AD_TPDID TO SFI_ACTUALIZA;
GRANT SELECT  ON VU_SFI.AD_TPDID TO SFI_CONSULTA;
GRANT SELECT  ON VU_SFI.AD_TPDID TO SFI_SOPORTE;
