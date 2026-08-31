use taxation_db;
--  task1
create view highest_income as
select * from income_record where amount in (select max(amount) from income_record);

create view lowest_income as
select * from income_record where amount in(select min(amount) from income_record);

create view avg_income as
select * from income_record
	where amount>(select avg(amount) from income_record);
    
create view highest_recorded_income as
select * from income_record where amount = ( select max(amount) from income_record);

create view Business_Owner as
select * from taxpayer where occupation='Bussiness Owner';

create view has_one_income_record as
select * from taxpayer where taxpayer_id in ( select taxpayer_id from income_record); 


-- task_2
create view Business_category as
select * from taxpayer where taxpayer_id in (select taxpayer_id from income_record where category_id in (select category_id  from income_category
where category_name  = 'Business income'));

create view f_year_2025_26 as
select * from income_record where year_id in (select year_id from financial_year where year_label = '2025-2026');

create view f_yr_2025_26 as 
select * from income_record where year_id in ( 
	select i.year_id 
    from income_record as i
    join financial_year as f
    on i.year_id= f.year_id
    where year_label ='2025-2026');

create view amount_greaterthan_min_business as
select * from income_record where amount > (select min(amount) from income_record where category_id in (select category_id from income_category where
category_name='Business income'));

create view amount_lessthan_max_salary as
select * from income_record where amount < (select max(amount) from income_record );

create view amount_greaterthan_avgamount as
select * from income_record where amount > (select avg(amount) from income_record );

create view have_one_income_record as
select * from income_category where category_id in (select category_id from income_record);

create view no_income_records as
select * from taxpayer where taxpayer_id not in (select taxpayer_id from income_record where category_id in (select category_id from income_category where category_name='Investment income'));


-- task _3 
create view highest_income_record as
select * from taxpayer where annual_income in (select max(annual_income) from taxpayer);

create view amount_greaterthan_b_income as
select * from income_record where amount in(select max(amount) from income_record where category_id in (select category_id from income_category
 where category_name='Business income'));
 
create view total_income_greaterthan_avg_total as
select * from taxpayer where annual_income>(select avg(annual_income) from taxpayer);

create view ir_amt_greater_any_ivest_ir as
select * from income_record where amount > any(select amount from income_record where category_id in (select category_id from income_category where 
 category_name ='Investment income'));
 
create view ir_greater_all_invest_ir as
select * from income_record where amount > all(select amount from income_record where category_id in (select category_id from income_category where category_name
 = 'Investment income'));
 
 create  view ic_highest_ir as
 select * from income_category where category_id in (select category_id from income_record where amount in (select max(amount) from income_record)); 

 create  view fin_year_highest_income as
 select * from financial_year where year_id in (select year_id from  income_record group by year_id having sum(amount)=  (select sum(amount) from income_record group by year_id 
 order by sum(amount) desc limit 1) );
 
create  view payer_ir_greater_avg_t_income as
 select taxpayer_id,full_name
 from taxpayer
 where taxpayer_id in ( select taxpayer_id from income_record 
						group by taxpayer_id 
                        having sum(amount)>(
							select avg(total_income)
                            from ( select taxpayer_id,sum(amount) as total_income
									from income_record 
                                    group by taxpayer_id 
                                    ) as taxpayer_total
							)
					);
				
                
-- task_4
create view  payer_highest_income  as
 select * from taxpayer 
 where annual_income=(select max(annual_income) from taxpayer);
 
 create view  payer_inc_above_avg_inc  as
 select * from taxpayer 
 where annual_income > (select avg(annual_income) from taxpayer);
 
 create view ic_high_ir as
 select category_name from income_category
 where category_id in (select category_id from income_record where amount in (select max(amount) from income_record));
 
 create view payer_with_bInc_not_invest_inc as
 select * from taxpayer where taxpayer_id in 
 (select taxpayer_id from income_record where category_id 
 in(select category_id from income_category where category_name ='Business income')  and  category_id
 not in (select category_id from income_category where category_name = 'Investment income'));
 
 create view ir_amt_greaterthan_all_invest_ir as 
 select * from income_record
 where amount > all (
	select amount 
    from income_record
    where category_id in (
		select category_id 
        from income_category
        where category_name ='Investment'
	)
);

create view ir_amt_greater_any_investement_ir as
select * from income_record
where amount > any ( 
	select amount from income_record 
    where category_id in (
    select category_id from income_category
    where category_name ='Investment'));
    
create view payer_highest_inc as
select taxpayer_id,full_name
from taxpayer
where taxpayer_id in(
	select taxpayer_id 
    from income_record
    group by taxpayer_id 
    having sum(amount)=(
		select max(total_income)
        from( select taxpayer_id,sum(amount) as total_income
				from income_record
                group by taxpayer_id
		) as totals
	)
);

create view ir_greater_avg_inc_corres_cat as
select * from income_record ir
where amount> ( 
				select avg( ir2.amount) 
                from income_record ir2
                where ir2.category_id = ir.category_id );

        

                            