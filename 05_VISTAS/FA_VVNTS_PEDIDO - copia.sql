CREATE OR REPLACE VIEW CL_VCLNT_CLNTPDIDOS AS
SELECT 
    CL.CLNT_CLNT,         -- ID del Cliente
    CL.CLNT_NOMB,         -- Nombre del Cliente
    CL.CLNT_NIT,          -- NIT del Cliente
    (SELECT COUNT(*) 
     FROM TABLE(ObtenerPedidosPorCliente(CL.CLNT_CLNT))) AS TOTAL_PEDIDOS  -- Cantidad de pedidos
FROM CL_TCLNT_CLNT CL;
