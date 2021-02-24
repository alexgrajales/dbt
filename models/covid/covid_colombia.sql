select
       cast("ID de caso" as varchar(10)) as id,
       substr("Fecha de recuperación", 0, 10) as fecha_reporte,
       substr("Fecha de notificación", 0, 10) as fecha_notificacion,
       substr("Fecha de diagnóstico", 0, 10) as fecha_diagnóstico,
       substr("Fecha de inicio de síntomas", 0, 10) as fecha_síntomas,
       substr("Fecha de recuperación", 0, 10) as fecha_recuperación,
       substr("Fecha de muerte", 0, 10) as fecha_muerte,
       cast("Tipo de recuperación" as varchar(10)),
       cast("Código DIVIPOLA departamento" as int) as codigo_departamento,
       cast("Código DIVIPOLA municipio" as int) as codigo_municipio,
       cast("Código ISO del país" as int) as codigo_pais,
       "Nombre departamento" as departamento,
       "Nombre municipio" as municipio,
       "Nombre del país" as pais,
       cast("Edad" as int) as edad,
       "Tipo de contagio" as tipo_contagio,
       "Tipo de recuperación" as tipo_recuperacion,
       "Estado" as estado_gravedad,
       "Ubicación del caso" as ubicacion,
       "Recuperado" estado_actual,
       case
           WHEN "Recuperado" = 'Recuperado' then 'si'
           ELSE 'no'
       end as recuperado,
       case
           WHEN "Recuperado" = 'Fallecido' then 'si'
           ELSE 'no'
       end as fallecido,
       case
           WHEN "Recuperado" = 'Activo' then 'si'
           ELSE 'no'
       end as activo
FROM {{ var("schema") }}.data_covid