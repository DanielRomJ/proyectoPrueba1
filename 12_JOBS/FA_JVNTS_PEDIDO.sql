BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'FA_JVNTS_PEDIDO',  -- Nombre del job
        job_type        => 'PLSQL_BLOCK',        -- Tipo de job (bloque PL/SQL)
        job_action      => 'BEGIN FA_QVNTS_PEDIDO.crear_pedido; END;',  -- Llamar al procedimiento del paquete
        start_date      => SYSTIMESTAMP,        -- Fecha de inicio (ahora)
        repeat_interval => 'FREQ=MINUTELY; BYSECOND=0; INTERVAL=2',  -- Cada 2 minutos
        enabled         => TRUE                 -- Habilitar el job
    );
END;
/