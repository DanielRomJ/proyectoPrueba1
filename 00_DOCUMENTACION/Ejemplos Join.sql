
--### 1. **LEFT JOIN**
--El **LEFT JOIN** devuelve todos los registros de la tabla izquierda (primera tabla) y los registros coincidentes de la tabla derecha (segunda tabla). Si no hay coincidencias, se devuelven `NULL` para las columnas de la tabla derecha.

--#### Ejemplo 1: **LEFT JOIN entre FA_TVNTS_PEDIDO y CL_TCLNT_CLNT**
--Obtener todos los pedidos y la información del cliente asociado (si existe).

SELECT 
    P.PEDIDO_PEDIDO,
    P.PEDIDO_FCREA,
    C.CLNT_NOMB,
    C.CLNT_NIT
FROM 
    FA_TVNTS_PEDIDO P
LEFT JOIN 
    CL_TCLNT_CLNT C ON P.PEDIDO_CLNT = C.CLNT_CLNT;

--
--**Resultado esperado**:
--- Todos los pedidos se mostrarán, incluso si no hay un cliente asociado (en ese caso, `CLNT_NOMB` y `CLNT_NIT` serán `NULL`).
--

-- PEDIDO_PEDIDO                      PEDIDO_FCREA           CLNT_NOMB         CLNT_NIT  
-- ---------------------------------- ---------------------- ----------------- --------- 
-- 2EA9DA38876FA222E0630E0EA8C0071C   2025-02-21T16:25:55Z   Juan Pérez        123456789 
-- 2EACCF2AD5A4320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   Juan Pérez        123456789 
-- 2EACCF2AD5A6320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   Empresa ABC       998877665 
-- 2EACCF2AD5A5320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   María Rodríguez   554433221 

--#### Ejemplo 2: **LEFT JOIN entre FA_TVNTS_DPEDIDO e IN_TPPLR_PRDTO**
--Obtener todos los detalles de pedidos y la información del producto asociado (si existe).
--
SELECT 
    D.DPEDIDO_DPEDIDO,
    D.DPEDIDO_CNTD,
    D.DPEDIDO_PRCIO,
    PR.PRDTO_NOMB,
    PR.PRDTO_DESC
FROM 
    FA_TVNTS_DPEDIDO D
LEFT JOIN 
    IN_TPPLR_PRDTO PR ON D.DPEDIDO_PRDTO = PR.PRDTO_PRDTO;

--
--**Resultado esperado**:
--- Todos los detalles de pedidos se mostrarán, incluso si no hay un producto asociado (en ese caso, `PRDTO_NOMB` y `PRDTO_DESC` serán `NULL`).
--

-- 	DPEDIDO_DPEDIDO                    DPEDIDO_CNTD DPEDIDO_PRCIO PRDTO_NOMB           PRDTO_DESC                           
-- 	---------------------------------- ------------ ------------- -------------------- ------------------------------------ 
-- 	2EAD0013C7A095FAE063FE0EA8C010F6   5            50000         Producto de prueba   Descripción del producto de prueba   
-- 	20                                 2            50            Producto de prueba   Descripción del producto de prueba   
-- 	21                                 3            50            Producto de prueba   Descripción del producto de prueba   
-- 	2EACF9EA09C7CA5FE0630E0EA8C089CE   5            50000         Producto de prueba   Descripción del producto de prueba   
-- 	2EAD406612BC00E4E0630E0EA8C06F4D   5            50000         Producto de prueba   Descripción del producto de prueba   
-- 	2EAD406612BE00E4E0630E0EA8C06F4D   5            50000         Producto de prueba   Descripción del producto de prueba   
-- 	2EAD406612BF00E4E0630E0EA8C06F4D   10           45000         Producto de prueba   Descripción del producto de prueba   
-- 	2EAD406612C000E4E0630E0EA8C06F4D   2            55000         Producto de prueba   Descripción del producto de prueba  
----


--### 2. **RIGHT JOIN**
--El **RIGHT JOIN** devuelve todos los registros de la tabla derecha (segunda tabla) y los registros coincidentes de la tabla izquierda (primera tabla). Si no hay coincidencias, se devuelven `NULL` para las columnas de la tabla izquierda.
--
--#### Ejemplo 1: **RIGHT JOIN entre CL_TCLNT_CLNT y FA_TVNTS_PEDIDO**
--Obtener todos los clientes y los pedidos asociados (si existen).
--

SELECT 
    C.CLNT_NOMB,
    C.CLNT_NIT,
    P.PEDIDO_PEDIDO,
    P.PEDIDO_FCREA
FROM 
    FA_TVNTS_PEDIDO P
RIGHT JOIN 
    CL_TCLNT_CLNT C ON P.PEDIDO_CLNT = C.CLNT_CLNT;


--**Resultado esperado**:
--- Todos los clientes se mostrarán, incluso si no tienen pedidos asociados (en ese caso, `PEDIDO_PEDIDO` y `PEDIDO_FCREA` serán `NULL`).
--
-- 	CLNT_NOMB         CLNT_NIT  PEDIDO_PEDIDO                      PEDIDO_FCREA           
-- 	----------------- --------- ---------------------------------- ---------------------- 
-- 	Juan Pérez        123456789 2EA9DA38876FA222E0630E0EA8C0071C   2025-02-21T16:25:55Z   
-- 	Juan Pérez        123456789 2EACCF2AD5A4320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   
-- 	Empresa XYZ       987654321                                                           
-- 	Ana Gómez         456789123                                                           
-- 	Carlos López      112233445                                                           
-- 	Empresa ABC       998877665 2EACCF2AD5A6320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   
-- 	María Rodríguez   554433221 2EACCF2AD5A5320CE063FE0EA8C0794C   2025-02-21T19:48:20Z 

  
--#### Ejemplo 2: **RIGHT JOIN entre IN_TPPLR_PRDTO y FA_TVNTS_DPEDIDO**
--Obtener todos los productos y los detalles de pedidos asociados (si existen).
--
SELECT 
    PR.PRDTO_NOMB,
    PR.PRDTO_DESC,
    D.DPEDIDO_DPEDIDO,
    D.DPEDIDO_CNTD
FROM 
    FA_TVNTS_DPEDIDO D
RIGHT JOIN 
    IN_TPPLR_PRDTO PR ON D.DPEDIDO_PRDTO = PR.PRDTO_PRDTO;
--
--**Resultado esperado**:
--- Todos los productos se mostrarán, incluso si no tienen detalles de pedidos asociados (en ese caso, `DPEDIDO_DPEDIDO` y `DPEDIDO_CNTD` serán `NULL`).
--
---
--  PRDTO_NOMB           PRDTO_DESC                           DPEDIDO_DPEDIDO                    DPEDIDO_CNTD 
--  -------------------- ------------------------------------ ---------------------------------- ------------ 
--  Producto de prueba   Descripción del producto de prueba   2EAD0013C7A095FAE063FE0EA8C010F6   5            
--  Producto de prueba   Descripción del producto de prueba   20                                 2            
--  Producto de prueba   Descripción del producto de prueba   21                                 3            
--  Producto de prueba   Descripción del producto de prueba   2EAD406612C000E4E0630E0EA8C06F4D   2            
--  Producto de prueba   Descripción del producto de prueba   2EAD406612BC00E4E0630E0EA8C06F4D   5            
--  Producto de prueba   Descripción del producto de prueba   2EAD406612BE00E4E0630E0EA8C06F4D   5            
--  Producto de prueba   Descripción del producto de prueba   2EAD406612BF00E4E0630E0EA8C06F4D   10           
--  Producto de prueba   Descripción del producto de prueba   2EACF9EA09C7CA5FE0630E0EA8C089CE   5    
--  --
--### 3. **INNER JOIN**
--El **INNER JOIN** devuelve solo los registros que tienen coincidencias en ambas tablas.
--
--#### Ejemplo 1: **INNER JOIN entre FA_TVNTS_PEDIDO y CL_TCLNT_CLNT**
--Obtener los pedidos que tienen un cliente asociado.
--

SELECT 
    P.PEDIDO_PEDIDO,
    P.PEDIDO_FCREA,
    C.CLNT_NOMB,
    C.CLNT_NIT
FROM 
    FA_TVNTS_PEDIDO P
INNER JOIN 
    CL_TCLNT_CLNT C ON P.PEDIDO_CLNT = C.CLNT_CLNT;


--**Resultado esperado**:
--- Solo se mostrarán los pedidos que tienen un cliente asociado.
--
PEDIDO_PEDIDO                      PEDIDO_FCREA           CLNT_NOMB         CLNT_NIT  
---------------------------------- ---------------------- ----------------- --------- 
--	2EA9DA38876FA222E0630E0EA8C0071C   2025-02-21T16:25:55Z   Juan Pérez        123456789 
--	2EACCF2AD5A4320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   Juan Pérez        123456789 
--	2EACCF2AD5A6320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   Empresa ABC       998877665 
--	2EACCF2AD5A5320CE063FE0EA8C0794C   2025-02-21T19:48:20Z   María Rodríguez   554433221 


--#### Ejemplo 2: **INNER JOIN entre FA_TVNTS_DPEDIDO e IN_TPPLR_PRDTO**
--Obtener los detalles de pedidos que tienen un producto asociado.
--

SELECT 
    D.DPEDIDO_DPEDIDO,
    D.DPEDIDO_CNTD,
    D.DPEDIDO_PRCIO,
    PR.PRDTO_NOMB,
    PR.PRDTO_DESC
FROM 
    FA_TVNTS_DPEDIDO D
INNER JOIN 
    IN_TPPLR_PRDTO PR ON D.DPEDIDO_PRDTO = PR.PRDTO_PRDTO;
--
--
--**Resultado esperado**:
--- Solo se mostrarán los detalles de pedidos que tienen un producto asociado.
--
--	DPEDIDO_DPEDIDO                    DPEDIDO_CNTD DPEDIDO_PRCIO PRDTO_NOMB           PRDTO_DESC                           
--	---------------------------------- ------------ ------------- -------------------- ------------------------------------ 
--	2EAD0013C7A095FAE063FE0EA8C010F6   5            50000         Producto de prueba   Descripción del producto de prueba   
--	20                                 2            50            Producto de prueba   Descripción del producto de prueba   
--	21                                 3            50            Producto de prueba   Descripción del producto de prueba   
--	2EACF9EA09C7CA5FE0630E0EA8C089CE   5            50000         Producto de prueba   Descripción del producto de prueba   
--	2EAD406612BC00E4E0630E0EA8C06F4D   5            50000         Producto de prueba   Descripción del producto de prueba   
--	2EAD406612BE00E4E0630E0EA8C06F4D   5            50000         Producto de prueba   Descripción del producto de prueba   
--	2EAD406612BF00E4E0630E0EA8C06F4D   10           45000         Producto de prueba   Descripción del producto de prueba   
--	2EAD406612C000E4E0630E0EA8C06F4D   2            55000         Producto de prueba   Descripción del producto de prueba   
---
--
--### Resumen de los Joins:
--
--| Tipo de Join       | Descripción                                                                 |
--|--------------------|-----------------------------------------------------------------------------|
--| **LEFT JOIN**      | Devuelve todos los registros de la tabla izquierda y los coincidentes de la derecha. |
--| **RIGHT JOIN**     | Devuelve todos los registros de la tabla derecha y los coincidentes de la izquierda. |
--| **INNER JOIN**     | Devuelve solo los registros que tienen coincidencias en ambas tablas.                |
--
-----
--
