/* Dimensao clientes */

with
    clientes as (
        select
            COD_CLIENTE
            , NOME_COMPLETO_CLIENTE
            , TIPO_CLIENTE
            , DATA_INCLUSAO_CLIENTE
            , IDADE_CLIENTE
            , FAIXA_ETARIA
        from {{ref("int_clientes")}}
    )

select * from clientes