use inflation;
drop table if exists president_polls2024final55555;
select * from president_polls2024final55555 where startdaterev >= '2024-09-01' ;
select STR_TO_DATE(start_date, '%m/%d/%Y') from president_polls2024final55555; 
alter table president_polls2024final55555 
add column startdaterev date;

update president_polls2024final55555
set startdaterev = STR_TO_DATE(start_date, '%m/%d/%Y');
set startdaterev = STR_TO_DATE(start_date, '%m/%d/%Y');
alter table president_polls2024final55555
drop column start_date;

select round((sample_size*pct*0.01),0) as castedvotes from president_polls2024final55555;
alter table president_polls2024final55555
add column totalvotes int;
update president_polls2024final55555
set totalvotes = round((sample_size*pct*0.01),0);

select * from president_polls2024final55555;
select candidate_name, sum(totalvotes) as candidate_votes from president_polls2024final55555
where startdaterev >= '2024-09-01'
group by candidate_name
order by candidate_votes desc;

select (case when state = '' then 'undefined'
else state end) as state from president_polls2024final55555;
update president_polls2024final55555
set state = case when state = '' then 'undefined'
else state end;

with cte as (
select state,candidate_name,sum(totalvotes) as casted
from president_polls2024final55555 
where startdaterev >= '2024-09-01' #and candidate_name in ('Donald Trump','Joe Biden','Kamala Harris')
group by state,candidate_name)
select sum(casted) from cte;
select candidate_name, sum(casted) as candidate_votes from cte
group by candidate_name;

#order by totalvotes desc;
with cte1 as (
select state, candidate_name,sum(totalvotes) as casted from president_polls2024final55555
where startdaterev >= '2024-09-01'
#where candidate_name in ('Donald Trump','Joe Biden')
group by state,candidate_name)
select sum(casted) from cte1;
select candidate_name,sum(casted) from cte1
group by candidate_name order by sum(casted) desc;

select * from president_polls2024final55555 where startdaterev >= ' 2024-09-01';




