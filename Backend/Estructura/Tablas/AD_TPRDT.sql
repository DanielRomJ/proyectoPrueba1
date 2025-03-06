prompt
prompt AD_TPRDT
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                27-02-2025    Daniel         Creando tabla AD_TPRDT
-- =========== ===================== ============ ================== ================================================================================================================
--

prompt
prompt CREANDO TABLA AD_TPRDT
prompt

CREATE TABLE AD_TPRDT (
  PRDT_PRDT VARCHAR2 (50) GENERATED ALWAYS AS IDENTITY,
  PRDT_NOMB VARCHAR2 (20),
  PRDT_DESC VARCHAR2 (500),
  PRDT_PRCIO NUMBER (500),
  PRDT_STCK NUMBER (200),
  version_java  number(20)
)
tablespace TS_DSFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage ( initial 128k   next 128k   minextents 1   maxextents unlimited);

prompt
prompt COMENTARIOS TABLA AD_TPRDT
prompt

COMMENT ON TABLE AD_TPRDT IS 'Tabla que almacena los productos';
COMMENT ON COLUMN AD_TPRDT.PRDT_PRDT IS 'Identificador único de producto';
COMMENT ON COLUMN AD_TPRDT.PRDT_NOMB IS 'Nombre del producto';
COMMENT ON COLUMN AD_TPRDT.PRDT_DESC IS 'Descripción del producto';
COMMENT ON COLUMN AD_TPRDT.PRDT_PRCIO IS 'Cantidad de producto en stock';
COMMENT ON COLUMN AD_TPRDT.PRDT_STCK IS 'Cantidad de producto en stock';
COMMENT ON COLUMN AD_TPRDT.version_java IS 'VERSION JAVA';
prompt
prompt OTORGANDO PERMISOS SOBRE AD_TPRDT
prompt

begin
 for i in ( select null
       from dba_Objects
      where Owner        =  'PUBLIC'
        and Object_Type  =  'SYNONYM'
        and Object_Name  =  upper('AD_TPRDT')
     ) loop
  execute immediate 'drop public synonym AD_TPRDT';
 end loop;
end;
/


CREATE PUBLIC SYNONYM AD_TPRDT FOR VU_SFI.AD_TPRDT;
GRANT SELECT, INSERT, UPDATE, DELETE ON VU_SFI.AD_TPRDT TO SFI_ACTUALIZA;
GRANT SELECT  ON VU_SFI.AD_TPRDT TO SFI_CONSULTA;
GRANT SELECT  ON VU_SFI.AD_TPRDT TO SFI_SOPORTE;
