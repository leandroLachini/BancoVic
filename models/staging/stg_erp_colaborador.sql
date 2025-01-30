/* conexao com a fonte de dados dos colaboradores */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_COLABORADORES') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_COLABORADOR as int) as COD_COLABORADOR
            , cast(PRIMEIRO_NOME as varchar) as PRIMEIRO_NOME
            , cast(ULTIMO_NOME as varchar) as ULTIMO_NOME
            , PRIMEIRO_NOME || ' ' || ULTIMO_NOME as NOME_COMPLETO_COLABORADOR
            , cast(EMAIL as varchar) as EMAIL_COLABORADOR
            , cast(CPF as varchar) as CPF_COLABORADOR
            , cast(DATA_NASCIMENTO as date) as DATA_NASCIMENTO_COLABORADOR
            , cast(ENDERECO as varchar) as ENDERECO_COLABORADOR
            , cast(CEP as varchar) as CEP_COLABORADOR
        from source
    )

select * from remane_table