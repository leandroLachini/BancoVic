/* conexao com a fonte de dados da agencias */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_AGENCIAS') }}
    )

/* categorização dos dados e renomes */

    , remane_table as (
        select
            cast(COD_AGENCIA as int) as COD_AGENCIA
            , cast(DATA_ABERTURA as date) as DATA_ABERTURA_AGENCIA
            , cast(NOME as varchar) as NOME_AGENCIA
            , cast(ENDERECO as varchar) as ENDERECO_AGENCIA
            , cast(CIDADE as varchar) as CIDADE_AGENCIA
            , cast(UF as varchar) as UF_AGENCIA
            , cast(TIPO_AGENCIA as varchar) as TIPO_AGENCIA
        from source
    )

select * from remane_table