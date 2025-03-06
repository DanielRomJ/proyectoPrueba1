prompt
prompt AD_TDPDI
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Creando tabla AD_TDPDI
-- =========== ===================== ============ ================== ================================================================================================================
--

prompt
prompt CREANDO TABLA AD_TDPDI
prompt

CREATE TABLE AD_TDPDI (
  DPDI_DPDI VARCHAR2 (50) GENERATED ALWAYS AS IDENTITY,
  DPDI_PDID VARCHAR2 (50),
  DPDI_PRDT VARCHAR2  (50),
  DPDI_CNTD NUMBER (100),
  DPDI_PRCIO NUMBER (500),
  version_java  number(20)
)
tablespace TS_DSFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage ( initial 128k   next 128k   minextents 1   maxextents unlimited);

prompt
prompt COMENTARIOS TABLA AD_TDPDI
prompt

COMMENT ON TABLE AD_TDPDI IS 'Tabla que almacena los PEDIDOS';
COMMENT ON COLUMN AD_TDPDI.DPDI_DPDI IS 'Identificador único de detalles de pedido';
COMMENT ON COLUMN AD_TDPDI.DPDI_PDID IS 'Identificador único del pedido';
COMMENT ON COLUMN AD_TDPDI.DPDI_PRDT IS 'Identificador único del producto';
COMMENT ON COLUMN AD_TDPDI.DPDI_CNTD IS 'Cantidad de producto';
COMMENT ON COLUMN AD_TDPDI.DPDI_PRCIO IS 'Precio del producto';
COMMENT ON COLUMN AD_TDPDI.version_java IS 'VERSION JAVA';
prompt
prompt OTORGANDO PERMISOS SOBRE AD_TDPDI
prompt

begin
 for i in ( select null
       from dba_Objects
      where Owner        =  'PUBLIC'
        and Object_Type  =  'SYNONYM'
        and Object_Name  =  upper('AD_TDPDI')
     ) loop
  execute immediate 'drop public synonym AD_TDPDI';
 end loop;
end;
/


CREATE PUBLIC SYNONYM AD_TDPDI FOR VU_SFI.AD_TDPDI;
GRANT SELECT, INSERT, UPDATE, DELETE ON VU_SFI.AD_TDPDI TO SFI_ACTUALIZA;
GRANT SELECT  ON VU_SFI.AD_TDPDI TO SFI_CONSULTA;
GRANT SELECT  ON VU_SFI.AD_TDPDI TO SFI_SOPORTE;
