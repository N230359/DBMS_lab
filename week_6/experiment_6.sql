use taxation_db;
-- task_1
select * from income_record where amount in (select max(amount) from income_record);
select * from income_record where amount in (select min(amount) from income_record);
select * from income_record where amount > (select avg(amount) from income_record);
select * from income_record where amount = (select max(amount) from income_record);
select * from taxpayer where occupation = (select occupation from taxpayer where occupation = 'Bussiness Owner');

-- task_2
select * from taxpayer where taxpayer_id in  (select taxpayer_id from income_record );
select * from taxpayer where taxpayer_id in (select taxpayer_id from income_record where category_id in (select category_id  from income_category
where category_name  = 'Business income'));
select * from income_record where year_id in (select year_id from financial_year where year_label = '2025-2026');
select * from income_record where amount > (select min(amount) from income_record where category_id in (select category_id from income_category where
category_name='Business income'));
select * from income_record where amount < (select max(amount) from income_record );
select * from income_record where amount > (select avg(amount) from income_record );
select * from income_category where category_id in (select category_id from income_record);
select * from taxpayer where taxpayer_id not in (select taxpayer_id from income_record where category_id in (select category_id from income_category where category_name='Investment income'));

-- task-3
select * from taxpayer where annual_income in (select max(annual_income) from taxpayer);
select * from income_record where amount in(select max(amount) from income_record where category_id in (select category_id from income_category
 where category_name='Business income'));
select * from taxpayer where annual_income>(select avg(annual_income) from taxpayer);
select * from income_record where amount > any(select amount from income_record where category_id in (select category_id from income_category where 
 category_name ='Investment income'));
select * from income_record where amount > all(select amount from income_record where category_id in (select category_id from income_category where category_name
 = 'Investment income'));
 select * from income_category where category_id in (select category_id from income_record where amount in (select max(amount) from income_record)); 
 select * from financial_year where year_id in (select year_id from  income_record group by year_id having sum(amount)=  (select sum(amount) from income_record group by year_id 
 order by sum(amount) desc limit 1) );
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
 select * from taxpayer 
 where annual_income=(select max(annual_income) from taxpayer);
 
 select * from taxpayer 
 where annual_income > (select avg(annual_income) from taxpayer);
 
 select category_name from income_category
 where category_id in (select category_id from income_record where amount in (select max(amount) from income_record));
 
 select * from taxpayer where taxpayer_id in 
 (select taxpayer_id from income_record where category_id 
 in(select category_id from income_category where category_name ='Business income')  and  category_id
 not in (select category_id from income_category where category_name = 'Investment income'));
 
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

select * from income_record
where amount > any ( 
	select amount from income_record 
    where category_id in (
    select category_id from income_category
    where category_name ='Investment'));
    
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
select * from income_record ir
where amount> ( 
				select avg( ir2.amount) 
                from income_record ir2
                where ir2.category_id = ir.category_id );
