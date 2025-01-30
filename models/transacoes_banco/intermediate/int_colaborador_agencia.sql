with
/* conexao com a staging colaborador */
    colaborador_agencia as (
        select *
        from {{ ref('stg_erp_colaborador_agencia') }}
    )

/* conexao com a staging colaborador */
    , colaboradores as (
        select *
        from {{ ref('stg_erp_colaboradores' }}
    )

/* conexao com a staging agencia */
    , agencia as (
        select *
        from {{ ref('stg_erp_agencias') }}
    )


/* criando os joins e popularizando a tabela com dados revelantes. */
    , joined as (
        select
            colaborador_agencia.COD_COLABORADOR
            , colaborador_agencia.COD_AGENCIA
            , colaborador.NOME_COMPLETO_COLABORADOR
            , colaborador.EMAIL_COLABORADOR
            , colaborador.CPF_COLABORADOR
            , colaborador.DATA_NASCIMENTO_COLABORADOR
            , colaborador.ENDERECO_COLABORADOR
            , colaborador.CEP_COLABORADOR
            , agencia.NOME_AGENCIA
            , agencia.ENDERECO_AGENCIA
            , agencia.CIDADE_AGENCIA
            , agencia.UF_AGENCIA
            , agencia.DATA_ABERTURA_AGENCIA
            , agencia.TIPO_AGENCIA
        from colaborador_agencia
        left join colaborador 
            on colaborador.COD_COLABORADOR = colaborador_agencia.COD_COLABORADOR
        left join agencia 
            on agencia.COD_AGENCIA = colaborador_agencia.COD_AGENCIA
    )


/* formato da tabela final. */
    , final_table as (
        select
            *
        from joined
    )

select * from final_table
