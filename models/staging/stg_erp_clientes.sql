/* conexao com a fonte de dados dos clientes */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_CLIENTES') }}
    )

/* Categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_CLIENTE as int) as COD_CLIENTE
            , cast(PRIMEIRO_NOME as varchar) as PRIMEIRO_NOME
            , cast(ULTIMO_NOME as varchar) as ULTIMO_NOME
            , PRIMEIRO_NOME || ' ' || ULTIMO_NOME as NOME_COMPLETO
            , cast(EMAIL as varchar) as EMAIL
            , cast(TIPO_CLIENTE as varchar) as TIPO_CLIENTE
            , cast(DATA_INCLUSAO as varchar) as DATA_INCLUSAO
            , cast(CPFCNPJ as varchar) as CPFCNPJ
            , cast(DATA_NASCIMENTO as date) as DATA_NASCIMENTO
            , cast(ENDERECO as varchar) as ENDERECO
            , cast(CEP as varchar) as CEP
        from source
    )

select * from remane_table
