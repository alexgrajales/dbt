{{ config(
    unique_key = 'codigo_municipio'
) }}
select DISTINCT codigo_departamento, codigo_municipio, municipio from {{ref('covid_colombia')}}