/* conexao com a fonte de dados das propostas do bancovic */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_PROPOSTAS') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_PROPOSTA as int) as COD_PROPOSTA
            , cast(COD_CLIENTE as int) as COD_CLIENTE
            , cast(COD_COLABORADOR as int) as COD_COLABORADOR
            , cast(SUBSTRING(DATA_ENTRADA_PROPOSTA, 1, 10) as date) as DATA_ENTRADA_PROPOSTA
            , cast(TAXA_JUROS_MENSAL as numeric(18,4)) as TAXA_JUROS_MENSAL
            , cast(VALOR_PROPOSTA as numeric(18,4)) as VALOR_PROPOSTA
            , cast(VALOR_FINANCIAMENTO as numeric(18,4)) as VALOR_FINANCIAMENTO
            , cast(VALOR_ENTRADA as numeric(18,4)) as VALOR_ENTRADA
            , cast(VALOR_PRESTACAO as numeric(18,4)) as VALOR_PRESTACAO
            , cast(QUANTIDADE_PARCELAS as int) as QUANTIDADE_PARCELAS
            , cast(CARENCIA as int) as CARENCIA
            , cast(STATUS_PROPOSTA as varchar) as STATUS_PROPOSTA
        from source
    )

select * from remane_table
