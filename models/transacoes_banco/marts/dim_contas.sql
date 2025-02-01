/* Dimensao contas */

with
    contas as (
        select
            NUM_CONTA
            , COD_CLIENTE
            , COD_AGENCIA
            , COD_COLABORADOR
            , DATA_ABERTURA_CONTA
            , TIPO_CONTA
            , SALDO_TOTAL_CONTA
            , SALDO_DISPONIVEL_CONTA
            , DATA_ULTIMO_LANCAMENTO
        from {{ref("stg_erp_contas")}}
    )

select * from contas