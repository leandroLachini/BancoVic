/* Fato contas */

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
            , DADOS_CLIENTE
            , TIPO_CLIENTE
            , DATA_INCLUSAO_CLIENTE
            , DATA_NASCIMENTO_CLIENTE
            , DATA_HOJE
            , TEMPO_CLIENTE
            , FAIXA_TEMPO_CLIENTE
            , CLASSIFICACAO_TEMPO_CLIENTE
            , IDADE_CLIENTE
            , FAIXA_ETARIA
        from {{ref("int_contas")}}
    )

select * from contas