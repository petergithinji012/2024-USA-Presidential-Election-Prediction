select * from president_polls_historica222l ;
select STR_TO_DATE(start_date, '%m/%d/%Y') from president_polls_historica222l; 
alter table president_polls_historica222l 
add column startdaterev date;
alter table president_polls_historica222l
drop column start_date;

update president_polls_historica222l
set startdaterev = STR_TO_DATE(start_date, '%m/%d/%Y');
select convert(trim(start_date),date) from president_polls_historica222l;
describe president_polls_historica222l;
select start_date from president_polls_historica222l;

select candidate_name,sum(totalvotes) as totalcandidatevotes from president_polls_historica222l
where year(startdaterev) = 2020
#where candidate_name like 'Donald%%'
group by candidate_name
order by sum(totalvotes) desc;
select * from president_polls_historica222l; #where year(startdaterev) = 2020;
select (case when state = '' then 'Undefined'
else state end) as state from president_polls_historica222l;
update president_polls_historica222l
set state = case when state = '' then 'Undefined'
else state end; 

with cte1 as (
select state, candidate_name,sum(totalvotes) as casted from president_polls_historica222l
#where candidate_name in ('Donald Trump','Joe Biden')
group by state,candidate_name)
select candidate_name,sum(casted) from cte1
group by candidate_name order by sum(casted) desc;
