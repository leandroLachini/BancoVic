/*  
    Este teste garante que a quantidade de colaboradores está correta conforme informado pelo bancovic.
    100 colaboradores
*/

with
    colaboradores as (
        select
            count(*) as TOTAL_COLABORADORES
        from {{ ref('stg_erp_colaboradores') }}
    ) -- 100

select 
    TOTAL_COLABORADORES
from colaboradores
where TOTAL_COLABORADORES not between 99 and 101