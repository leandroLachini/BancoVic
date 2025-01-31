/* tabela fato propostas */

with
    int_propostas as (
        select
            *
        from {{ ref('int_propostas') }}
    )

select * from int_propostas