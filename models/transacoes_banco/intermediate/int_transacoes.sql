with
/* conexao com a staging contas */
    contas as (
        select *
        from {{ ref('stg_erp_contas') }}
    )

/* conexao com a staging transacoes */
    , transacoes as (
        select *
        from {{ ref('stg_erp_transacoes') }}
    )

/* criando os joins e popularizando a tabela com dados revelantes. */
    , joined as (
        select
            transacoes.COD_TRANSACAO
            , transacoes.NUM_CONTA
            , transacoes.DATA_TRANSACAO
            , transacoes.NOME_TRANSACAO
            , transacoes.VALOR_TRANSACAO
            , contas.COD_CLIENTE
            , contas.COD_AGENCIA
            , contas.COD_COLABORADOR
            , contas.DATA_ABERTURA_CONTA
            , contas.TIPO_CONTA
            , contas.SALDO_TOTAL_CONTA
            , contas.SALDO_DISPONIVEL_CONTA
            , contas.DATA_ULTIMO_LANCAMENTO
        from transacoes
        left join contas 
            on contas.NUM_CONTA = transacoes.NUM_CONTA
    )


/* formato da tabela final. */
    , final_table as (
        select
            *
        from joined
    )

select * from final_table
