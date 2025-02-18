create or replace TYPE CL_TY_TO_TCLNT_CLNT AS OBJECT (
    CLNT_NOMB   VARCHAR2(100),  -- Especifica el tipo de dato directamente
    CLNT_TPID   VARCHAR2(10),   -- Especifica el tipo de dato directamente
    CLNT_NIT    int,   -- Especifica el tipo de dato directamente
    CLNT_DIRE   VARCHAR2(200)   -- Especifica el tipo de dato directamente
);
CREATE OR REPLACE TYPE CL_TY_TT_TCLNT_CLNT AS TABLE OF CL_TY_TO_TCLNT_CLNT;