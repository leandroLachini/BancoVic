
with
/* conexao com a staging clientes */
    clientes as (
        select
            COD_CLIENTE
            , NOME_COMPLETO_CLIENTE
            , TIPO_CLIENTE
            , DATA_INCLUSAO_CLIENTE
            , DATA_NASCIMENTO_CLIENTE
        from {{ref("stg_erp_clientes")}}
    )

    , metricas as (
        select
            clientes. *
            , getdate() as DATA_HOJE
            , DATEDIFF ( year , DATA_NASCIMENTO_CLIENTE , DATA_HOJE ) as IDADE_CLIENTE
            , case
                when IDADE_CLIENTE <= 29 then '18-29'
                when IDADE_CLIENTE between 20 and 39 then '30-39'
                when IDADE_CLIENTE between 40 and 49 then '40-49'
                when IDADE_CLIENTE between 50 and 59 then '50-59'
                else '60-mais' 
            end as FAIXA_ETARIA
            from clientes
    )

select * from metricas