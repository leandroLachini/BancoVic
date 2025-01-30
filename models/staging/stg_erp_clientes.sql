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
            , cast(PRIMEIRO_NOME as varchar) as PRIMEIRO_NOME
            , cast(ULTIMO_NOME as varchar) as ULTIMO_NOME
            , PRIMEIRO_NOME || ' ' || ULTIMO_NOME as NOME_COMPLETO_CLIENTE
            , cast(EMAIL as varchar) as EMAIL_CLIENTE
            , cast(TIPO_CLIENTE as varchar) as TIPO_CLIENTE
            , cast(DATA_INCLUSAO as varchar) as DATA_INCLUSAO_CLIENTE
            , cast(CPFCNPJ as varchar) as CPFCNPJ_CLIENTE
            , cast(DATA_NASCIMENTO as date) as DATA_NASCIMENTO_CLIENTE
            , cast(ENDERECO as varchar) as ENDERECO_CLIENTE
            , cast(CEP as varchar) as CEP_CLIENTE
        from source
    )

select * from remane_table
