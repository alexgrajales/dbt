select
       cast("ID de caso" as varchar(10)) as id,
       case
        WHEN "Fecha de recuperación" != null or "Fecha de recuperación" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de recuperación"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de recuperación"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de recuperación"), '/', 2)) else split_part(trim("Fecha de recuperación"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de recuperación"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de recuperación"), '/', 1)) else split_part(trim("Fecha de recuperación"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_recuperacion,
       case
        WHEN "Fecha de notificación" != null or "Fecha de notificación" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de notificación"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de notificación"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de notificación"), '/', 2)) else split_part(trim("Fecha de notificación"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de notificación"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de notificación"), '/', 1)) else split_part(trim("Fecha de notificación"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_notificacion,
       case
        WHEN "Fecha de diagnóstico" != null or "Fecha de diagnóstico" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de diagnóstico"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de diagnóstico"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de diagnóstico"), '/', 2)) else split_part(trim("Fecha de diagnóstico"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de diagnóstico"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de diagnóstico"), '/', 1)) else split_part(trim("Fecha de diagnóstico"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_diagnóstico,
       case
        WHEN "Fecha de inicio de síntomas" != null or "Fecha de inicio de síntomas" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de inicio de síntomas"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de inicio de síntomas"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de inicio de síntomas"), '/', 2)) else split_part(trim("Fecha de inicio de síntomas"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de inicio de síntomas"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de inicio de síntomas"), '/', 1)) else split_part(trim("Fecha de inicio de síntomas"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_síntomas,
       case
        WHEN "Fecha de recuperación" != null or "Fecha de recuperación" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de recuperación"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de recuperación"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de recuperación"), '/', 2)) else split_part(trim("Fecha de recuperación"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de recuperación"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de recuperación"), '/', 1)) else split_part(trim("Fecha de recuperación"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_recuperación,
       case
        WHEN "Fecha de muerte" != null or "Fecha de muerte" != '' then
           TO_DATE(CONCAT(split_part(split_part(trim("Fecha de muerte"), '/', 3), ' ', 1),
           case
            WHEN cast(split_part(trim("Fecha de muerte"), '/', 2) as integer) <= 9 then concat('0', split_part(trim("Fecha de muerte"), '/', 2)) else split_part(trim("Fecha de muerte"), '/', 2)
            end,
           case
            WHEN cast(split_part(trim("Fecha de muerte"), '/', 1) as integer) <= 9 then concat('0', split_part(trim("Fecha de muerte"), '/', 1)) else split_part(trim("Fecha de muerte"), '/', 1)
            end), 'YYYYMMDD')
        else null
        end as fecha_muerte,
       cast("Tipo de recuperación" as varchar(10)) as tipo_de_recuperación,
       cast("Código DIVIPOLA departamento" as int) as codigo_departamento,
       cast("Código DIVIPOLA municipio" as int) as codigo_municipio,
       cast("Código ISO del país" as int) as codigo_pais,
       "Nombre departamento" as departamento,
       "Nombre municipio" as municipio,
       "Nombre del país" as pais,
       cast("Edad" as int) as edad,
       cast("Sexo" as varchar(1)) as sexo,
       "Tipo de contagio" as tipo_contagio,
       "Tipo de recuperación" as tipo_recuperacion,
       "Estado" as estado_gravedad,
       "Ubicación del caso" as ubicacion,
       case when "Recuperado" = "fallecido" then 'fallecido no covid' else "Recuperado" end as estado_actual,
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