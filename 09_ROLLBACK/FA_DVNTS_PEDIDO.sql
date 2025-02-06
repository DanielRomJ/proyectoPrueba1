-- Se borra la llave Foranea de la tabla
ALTER TABLE FA_TVNTS_DPEDIDO
Drop CONSTRAINT FK_FA_TVNTS_DPEDIDO_IN_TPPLR_PRDTO
-- Se borra la llave primaria de la tabla
ALTER TABLE FA_TVNTS_PEDIDO
Drop CONSTRAINT PK_FA_TVNTS_PEDIDO;
-- Se borra la tabla
Drop TABLE FA_TVNTS_PEDIDO;