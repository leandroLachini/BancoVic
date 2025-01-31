/* Dimension Date created with based on the article 
https://medium.com/indiciumtech/date-dimension-how-to-create-a-practical-and-useful-date-dimension-in-dbt-5ee70a18f3bb
*/

with 
     raw_generated_data as ( 
        {{ dbt_date.get_date_dimension('2010-01-01', '2023-12-31') }} 
    ) 

    , id_year_month as ( 
        select 
             raw_generated_data. *
            , MONTH_NAME_SHORT || '-' || YEAR_NUMBER as MONTH_YEAR
            , cast(YEAR_NUMBER || MONTH_OF_YEAR as numeric(20,0)) as YEAR_MONTH
        from raw_generated_data 
    )

    /* renomeando algumas colunas para o portugues */
    
    , days_named as (
        select
            *
            , case
                when DAY_OF_WEEK = 1 then 'domingo'
                when DAY_OF_WEEK = 2 then 'segunda-feira'
                when DAY_OF_WEEK = 3 then 'terça-feira'
                when DAY_OF_WEEK = 4 then 'quarta-feira'
                when DAY_OF_WEEK = 5 then 'quinta-feira'
                when DAY_OF_WEEK = 6 then 'sexta-feira'
                else 'sábado' 
            end as nome_do_dia
            , case
                when MONTH_OF_YEAR = 1 then 'janeiro'
                when MONTH_OF_YEAR = 2 then 'fevereiro'
                when MONTH_OF_YEAR = 3 then 'março'
                when MONTH_OF_YEAR = 4 then 'abril'
                when MONTH_OF_YEAR = 5 then 'maio'
                when MONTH_OF_YEAR = 6 then 'junho'
                when MONTH_OF_YEAR = 7 then 'julho'
                when MONTH_OF_YEAR = 8 then 'agosto'
                when MONTH_OF_YEAR = 9 then 'setembro'
                when MONTH_OF_YEAR = 10 then 'outubro'
                when MONTH_OF_YEAR = 11 then 'novembro'
                else 'dezembro' 
            end as nome_do_mes
            , case
                when MONTH_OF_YEAR = 1 then 'jan'
                when MONTH_OF_YEAR = 2 then 'fev'
                when MONTH_OF_YEAR = 3 then 'mar'
                when MONTH_OF_YEAR = 4 then 'abr'
                when MONTH_OF_YEAR = 5 then 'mai'
                when MONTH_OF_YEAR = 6 then 'jun'
                when MONTH_OF_YEAR = 7 then 'jul'
                when MONTH_OF_YEAR = 8 then 'ago'
                when MONTH_OF_YEAR = 9 then 'set'
                when MONTH_OF_YEAR = 10 then 'out'
                when MONTH_OF_YEAR = 11 then 'nov'
                else 'dez' 
            end as abrev_do_mes
            , case
                when QUARTER_OF_YEAR = 1 then '1º trimestre'
                when QUARTER_OF_YEAR = 2 then '2º trimestre'
                when QUARTER_OF_YEAR = 3 then '3º trimestre'
                else '4º trimestre' 
            end as nome_trimestre
            , case
                when QUARTER_OF_YEAR in(1,2) then 1
                else 2
            end as semestre
            , case
                when QUARTER_OF_YEAR in(1,2) then '1º semestre'
                else '2º semestre'
            end as nome_semestre
        from id_year_month
    ) 

select * from days_named
