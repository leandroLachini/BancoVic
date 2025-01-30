/* connection with buy address source (city layer) */

with
    source as (
        select
        *
        from {{ source('erp_bancovic', 'SEED_AGENCIAS') }}
    )

/* renaming table columns and categorizing data */

    , remane_table as (
        select
            cast(COD_AGENCIA as int) as COD_AGENCIA
            , cast(NOME as varchar) as NOME
            , cast(ENDERECO as varchar) as ENDERECO
            , cast(CIDADE as varchar) as CIDADE
            , cast(UF as varchar) as UF
            , cast(DATA_ABERTURA as date) as DATA_ABERTURA
            , cast(TIPO_AGENCIA as varchar) as TIPO_AGENCIA
        from source
    )

select * from remane_table