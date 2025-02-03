with
/* conexao com a staging clientes */
    clientes as (
        select *
        from {{ ref('stg_erp_clientes') }}
    )

/* conexao com a staging colaboradores */
    , colaboradores as (
        select *
        from {{ ref('stg_erp_colaboradores') }}
    )

/* conexao com a staging propostas */
    , propostas as (
        select *
        from {{ ref('stg_erp_propostas') }}
    )


/* criando os joins e popularizando a tabela com dados revelantes. */
    , joined as (
        select
            propostas.COD_PROPOSTA
            , propostas.COD_CLIENTE
            , propostas.COD_COLABORADOR
            , propostas.DATA_ENTRADA_PROPOSTA
            , propostas.TAXA_JUROS_MENSAL
            , propostas.VALOR_PROPOSTA
            , propostas.VALOR_FINANCIAMENTO
            , propostas.VALOR_ENTRADA
            , propostas.VALOR_PRESTACAO
            , propostas.QUANTIDADE_PARCELAS
            , propostas.CARENCIA
            , propostas.STATUS_PROPOSTA
            , colaboradores.DADOS_COLABORADOR
            , clientes.DADOS_CLIENTE
            , clientes.DATA_INCLUSAO_CLIENTE
            , clientes.CPFCNPJ_CLIENTE
        from propostas
        left join colaboradores 
            on colaboradores.COD_COLABORADOR = propostas.COD_COLABORADOR
        left join clientes 
            on clientes.COD_CLIENTE = propostas.COD_CLIENTE
    )


/* formato da tabela final. */
    , final_table as (
        select
            joined. *
            , VALOR_PRESTACAO * QUANTIDADE_PARCELAS as VALOR_TOTAL_PRESTACAO
        from joined
    )

select * from final_table
