/* Dimensao agencias */

with
    agencias as (
        select
            COD_AGENCIA
            , NOME_AGENCIA
            , ENDERECO_AGENCIA
            , CIDADE_AGENCIA
            , UF_AGENCIA
            , DATA_ABERTURA_AGENCIA
            , TIPO_AGENCIA
        from {{ref("stg_erp_agencias")}}
    )

select * from agencias
