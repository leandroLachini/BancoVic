/* conexao com a fonte de dados dos clientes */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_CLIENTES') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_CLIENTE as int) as COD_CLIENTE
            , cast(SUBSTRING(DATA_INCLUSAO, 1, 10) as date) as DATA_INCLUSAO_CLIENTE
            , cast(DATA_NASCIMENTO as date) as DATA_NASCIMENTO_CLIENTE
            , cast(PRIMEIRO_NOME as varchar) as PRIMEIRO_NOME
            , cast(ULTIMO_NOME as varchar) as ULTIMO_NOME
            , COD_CLIENTE || '|' ||PRIMEIRO_NOME || ' ' || ULTIMO_NOME as DADOS_CLIENTE
            , cast(EMAIL as varchar) as EMAIL_CLIENTE
            , cast(TIPO_CLIENTE as varchar) as TIPO_CLIENTE
            , cast(CPFCNPJ as varchar) as CPFCNPJ_CLIENTE
            , cast(ENDERECO as varchar) as ENDERECO_CLIENTE
            , cast(CEP as varchar) as CEP_CLIENTE
        from source
    )

select * from remane_table
