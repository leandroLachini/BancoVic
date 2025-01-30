/* conexao com a fonte de dados das transacoes do bancovic */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_TRANSACOES') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_TRANSACAO as int) as COD_TRANSACAO
            , cast(NUM_CONTA as int) as NUM_CONTA
            , cast(DATA_TRANSACAO as varchar) as DATA_TRANSACAO
            , cast(NOME_TRANSACAO as varchar) as NOME_TRANSACAO
            , cast(VALOR_TRANSACAO as numeric(18,2)) as VALOR_TRANSACAO
        from source
    )

select * from remane_table
