-- Se borra la llave primaria de la tabla
ALTER TABLE IN_TPPLR_PRDTO 
Drop CONSTRAINT PK_IN_TPPLR_PRDTO;
-- Se borra la tabla
Drop TABLE FA_TVNTS_PEDIDO;