/* conexao com a fonte de dados IPCA */

with
    source as (
        select
        *
        from {{ source('gov_ibge', 'SEED_IPCA') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(PERIODO as date) as PERIODO
            , cast(INDICE as float) as INDICE
        from source
    )

select * from remane_table