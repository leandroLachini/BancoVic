
with
/* conexao com a staging clientes */
    clientes as (
        select
            *
        from {{ref("stg_erp_clientes")}}
    )

    /* conexao com a staging clientes */
    , contas as (
        select
            *
        from {{ref("stg_erp_contas")}}
    )

/* criando os joins e popularizando a tabela com dados revelantes. */
    , joined as (
        select
            contas.NUM_CONTA
            , contas.COD_CLIENTE
            , contas.COD_AGENCIA
            , contas.COD_COLABORADOR
            , contas.DATA_ABERTURA_CONTA
            , contas.TIPO_CONTA
            , contas.SALDO_TOTAL_CONTA
            , contas.SALDO_DISPONIVEL_CONTA
            , contas.DATA_ULTIMO_LANCAMENTO
            , clientes.DADOS_CLIENTE
            , clientes.TIPO_CLIENTE
            , clientes.DATA_INCLUSAO_CLIENTE
            , clientes.DATA_NASCIMENTO_CLIENTE
        from contas
        left join clientes 
            on clientes.COD_CLIENTE = contas.COD_CLIENTE
    )

    , metricas as (
        select
            joined. *
            , getdate() as DATA_HOJE
            , DATEDIFF ( year , DATA_INCLUSAO_CLIENTE , DATA_HOJE ) as TEMPO_CLEINTE
            , DATEDIFF ( year , DATA_NASCIMENTO_CLIENTE , DATA_HOJE ) as IDADE_CLIENTE
            , case
                when IDADE_CLIENTE <= 29 then '18-29'
                when IDADE_CLIENTE between 20 and 39 then '30-39'
                when IDADE_CLIENTE between 40 and 49 then '40-49'
                when IDADE_CLIENTE between 50 and 59 then '50-59'
                else '60-mais' 
            end as FAIXA_ETARIA
            from joined
    )

select * from metricas
