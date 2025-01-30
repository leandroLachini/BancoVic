/* Dimensao agencias */

with
    agencias as (
        select
            COD_AGENCIA
            , NOME
            , ENDERECO
            , CIDADE
            , UF
            , DATA_ABERTURA
            , TIPO_AGENCIA
        from {{ref("stg_erp_agencias")}}
    )

select * from agencias