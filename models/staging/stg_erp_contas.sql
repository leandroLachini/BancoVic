/* conexao com a fonte de dados das contas */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_CONTAS') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(NUM_CONTA as int) as NUM_CONTA
            , cast(COD_CLIENTE as int) as COD_CLIENTE
            , cast(COD_AGENCIA as int) as COD_AGENCIA
            , cast(COD_COLABORADOR as int) as COD_COLABORADOR
            , cast(TIPO_CONTA as varchar) as TIPO_CONTA
            , cast(SUBSTRING(DATA_ABERTURA, 1, 10) as date) as DATA_ABERTURA_CONTA
            , cast(SALDO_TOTAL as numeric(18,4)) as SALDO_TOTAL_CONTA
            , cast(SALDO_DISPONIVEL as numeric(18,4)) as SALDO_DISPONIVEL_CONTA
            , cast(SUBSTRING(DATA_ULTIMO_LANCAMENTO, 1, 10) as date) as DATA_ULTIMO_LANCAMENTO
        from source
    )

select * from remane_table
