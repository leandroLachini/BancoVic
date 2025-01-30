/* Dimensao clientes */

with
    clientes as (
        select
            COD_CLIENTE
            , PRIMEIRO_NOME
            , ULTIMO_NOME
            , NOME_COMPLETO_CLIENTE
            , EMAIL_CLIENTE
            , TIPO_CLIENTE
            , DATA_INCLUSAO_CLIENTE
            , CPFCNPJ_CLIENTE
            , DATA_NASCIMENTO_CLIENTE
            , ENDERECO_CLIENTE
            , CEP_CLIENTE
        from {{ref("stg_erp_clientes")}}
    )

select * from clientes