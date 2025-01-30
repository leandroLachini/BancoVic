/* conexao com a fonte de dados dos colaborador_agencia */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_COLABORADOR_AGENCIA') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_COLABORADOR as int) as COD_COLABORADOR
            , cast(COD_AGENCIA as int) as COD_AGENCIA
        from source
    )

select * from remane_table