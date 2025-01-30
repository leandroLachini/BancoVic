/* Dimensao clientes */

with
    clientes as (
        select
            COD_CLIENTE
            , PRIMEIRO_NOME
            , ULTIMO_NOME
            , NOME_COMPLETO
            , EMAIL
            , TIPO_CLIENTE
            , DATA_INCLUSAO
            , CPFCNPJ
            , DATA_NASCIMENTO
            , ENDERECO
            , CEP
        from {{ref("stg_erp_clientes")}}
    )

select * from clientes