/* tabela fato transacoes */

with
    int_transacoes as (
        select
            *
        from {{ ref('int_transacoes') }}
    )

select * from int_transacoes