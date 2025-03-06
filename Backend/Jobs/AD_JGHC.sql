prompt
prompt Creacion de JOB AD_JGHC
prompt

--
--
-- Historial de cambios
--
--  Versión          Solicitud          Fecha          Realizó             Comentario
-- =========== ===================== ============ ================== ===============================================================================================================
--  12000       proyectoPrueba1                28-02-2025    hg         gh AD_JGHC
-- =========== ===================== ============ ================== ================================================================================================================
--

BEGIN
    --
    BEGIN
        DBMS_SCHEDULER.drop_job('AD_JGHC');
    EXCEPTION WHEN OTHERS THEN
        -- Si el job no existe, continuar
        NULL;
    END;
    --
    Dbms_Scheduler.Create_Job (
       job_name             => 'AD_JGHC',
       job_type             => 'PLSQL_BLOCK',
       job_action           => 'BEGIN; END;',
       number_of_arguments  => 0,
       start_date           => SysTimestamp,
       repeat_interval      => 'freq=minutely; interval=1;',
       end_date             => NULL,
       job_class            => 'DEFAULT_JOB_CLASS',
       enabled              => TRUE,
       auto_drop            => TRUE,
       comments             => 'gh'
    );
END;
/
