/* Dimension Date created with based on the article 
https://medium.com/indiciumtech/date-dimension-how-to-create-a-practical-and-useful-date-dimension-in-dbt-5ee70a18f3bb
*/

with 
     gerandor_de_datas as ( 
        {{ dbt_date.get_date_dimension('2010-01-01', '2023-12-31') }} 
    )

    /* selecionando e renomeando algumas colunas para o portugues */
    , renomeando as ( 
        select 
            DATE_DAY as DATA
            , DAY_OF_MONTH as DIA_DO_MES
            , QUARTER_OF_YEAR as TRIMESTRE_DO_ANO
            , MONTH_OF_YEAR as MES_DO_ANO
            , DAY_OF_WEEK as DIA_DA_SEMANA
            , cast(YEAR_NUMBER as int) as ANO
            , cast(YEAR_NUMBER || MONTH_OF_YEAR as int) as ANO_MES
        from gerandor_de_datas 
    )

    /* incluindo algumas colunas */
    , add_colunas as (
        select
            DATA
            , DIA_DO_MES
            , ANO
            , ANO_MES
            , case
                when DIA_DA_SEMANA = 1 then 'domingo'
                when DIA_DA_SEMANA = 2 then 'segunda-feira'
                when DIA_DA_SEMANA = 3 then 'terça-feira'
                when DIA_DA_SEMANA = 4 then 'quarta-feira'
                when DIA_DA_SEMANA = 5 then 'quinta-feira'
                when DIA_DA_SEMANA = 6 then 'sexta-feira'
                else 'sábado' 
            end as NOME_DO_DIA
            , case
                when MES_DO_ANO = 1 then 'janeiro'
                when MES_DO_ANO = 2 then 'fevereiro'
                when MES_DO_ANO = 3 then 'março'
                when MES_DO_ANO = 4 then 'abril'
                when MES_DO_ANO = 5 then 'maio'
                when MES_DO_ANO = 6 then 'junho'
                when MES_DO_ANO = 7 then 'julho'
                when MES_DO_ANO = 8 then 'agosto'
                when MES_DO_ANO = 9 then 'setembro'
                when MES_DO_ANO = 10 then 'outubro'
                when MES_DO_ANO = 11 then 'novembro'
                else 'dezembro' 
            end as NOME_DO_MES
            , case
                when MES_DO_ANO = 1 then 'jan'
                when MES_DO_ANO = 2 then 'fev'
                when MES_DO_ANO = 3 then 'mar'
                when MES_DO_ANO = 4 then 'abr'
                when MES_DO_ANO = 5 then 'mai'
                when MES_DO_ANO = 6 then 'jun'
                when MES_DO_ANO = 7 then 'jul'
                when MES_DO_ANO = 8 then 'ago'
                when MES_DO_ANO = 9 then 'set'
                when MES_DO_ANO = 10 then 'out'
                when MES_DO_ANO = 11 then 'nov'
                else 'dez' 
            end as ABREV_DO_MES
            , case
                when TRIMESTRE_DO_ANO = 1 then '1º trimestre'
                when TRIMESTRE_DO_ANO = 2 then '2º trimestre'
                when TRIMESTRE_DO_ANO = 3 then '3º trimestre'
                else '4º trimestre' 
            end as NOME_TRIMESTRE
            , case
                when TRIMESTRE_DO_ANO in(1,2) then 1
                else 2
            end as SEMESTRE
            , case
                when TRIMESTRE_DO_ANO in(1,2) then '1º semestre'
                else '2º semestre'
            end as NOME_SEMESTRE
            , ABREV_DO_MES || '-' || ANO as MES_ANO
        from renomeando
    ) 

select * from add_colunas
