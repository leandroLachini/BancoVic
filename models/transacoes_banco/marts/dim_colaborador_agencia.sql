/* Dimensao colaboador_agencia */

with
    colaboador_agencia as (
        select
            COD_COLABORADOR
            , COD_AGENCIA
            , NOME_COMPLETO_COLABORADOR
            , NOME_AGENCIA
            , CIDADE_AGENCIA
            , UF_AGENCIA
            , TIPO_AGENCIA
        from {{ref("int_colaborador_agencia")}}
    )

select * from colaboador_agencia