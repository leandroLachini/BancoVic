/* Fato IPCA */

with
    ipca as (
        select
            PERIODO
            , INDICE
        from {{ref("stg_ipca")}}
    )

select * from ipca