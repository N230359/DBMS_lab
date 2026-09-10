use taxation_db;
show tables;
select * from taxpayer;
select * from financial_year;
select * from income_category;
select * from income_record;
-- 1 
select full_name,income_source
from taxpayer as t 
inner join 
income_record as i 
on  t.taxpayer_id =i.taxpayer_id;
-- 2
select full_name, category_name
	from taxpayer as t 
	inner join
	income_record as i 
		on t.taxpayer_id = i.taxpayer_id
			inner join
			income_category as ic
			on  i.category_id = ic.category_id;
-- 3
	select * ,year_label
		from income_record as i
		inner join
        financial_year as f
        on i.year_id = f.year_id;
-- 4
    select full_name,annual_income,amount
		from taxpayer as t
        inner join 
        income_record as i 
        on t.taxpayer_id = i.taxpayer_id;
-- 5
	select full_name,income_source,category_name,year_label
		from taxpayer as t
        inner join 
        income_record as i 
        on t.taxpayer_id = i.taxpayer_id
        inner join 
        income_category as ic
        on i.category_id = ic.category_id
        inner join
        financial_year as f
        on i.year_id = f.year_id;
-- 1
select full_name,income_source,category_name
	from taxpayer as t
    inner join 
    income_record as i
    on t.taxpayer_id = i.taxpayer_id
    inner join 
    income_category as ic 
    on i.category_id = ic.category_id
        where category_name = 'Salary income ';
-- 2
    select full_name,income_source,occupation
		from taxpayer as t
        inner join 
        income_record as i
        on t.taxpayer_id=i.taxpayer_id
        inner join
        income_category as ic
        on i.category_id=ic.category_id
			where category_name='Business income';
-- 3
select  *,start_date,end_date  
	from taxpayer as t
    inner join
    income_record as i
    on t.taxpayer_id = i.taxpayer_id
    inner join 
    financial_year as f
    on i.year_id = f.year_id;
-- 4
select t.taxpayer_id,full_name,occupation,description
	from taxpayer as t
    inner join
    income_record as i
    on t.taxpayer_id = i.taxpayer_id
    inner join
    income_category as ic
    on i.category_id = ic.category_id;
-- 5
select full_name,pan_number,occupation,income_source,category_name,amount,year_label,start_date,end_date from 
	taxpayer as t 
    inner join 
    income_record as i
    on t.taxpayer_id = i.taxpayer_id
    inner join 
    income_category as ic
    on i.category_id = ic.category_id
	inner join 
    financial_year as f
    on f.year_id = i.year_id;
    
-- 1
select *
from taxpayer as t
left outer join 
income_record as i
on t.taxpayer_id = i.taxpayer_id;
-- 2
select *
	from income_record as i 
    right outer join 
    income_category as ic 
    on i.category_id=ic.category_id;
-- 3
select * 
	from taxpayer as t
    left outer join
    income_record as i
    on t.taxpayer_id = i.taxpayer_id
UNION
select * 
	from taxpayer as t
    right outer join
    income_record as i 
    on t.taxpayer_id = i.taxpayer_id;
    

-- 4      
select * from
 taxpayer  as t
 cross join
 financial_year as f;
 
-- 5
select 
	t1.taxpayer_id as taxpayer1_id,
    t1.full_name as taxpayer1_name,
    t2.taxpayer_id as taxpayer2_id,
    t2.full_name as taxpayer2_name,
    t1.occupation
from taxpayer t1
join taxpayer t2
	on t1.occupation = t2.occupation
    and not t1.taxpayer_id = t2.taxpayer_id;
    
-- 1
select * from taxpayer;
select * from income_record;
select * from income_category;
select full_name,pan_number,income_source,category_name,description
from income_record as ir
join taxpayer as t
on ir.taxpayer_id = t.taxpayer_id
join income_category as ic
on ir.category_id = ic.category_id;

-- 2
select  full_name,income_source,category_name
	from income_record as ir 
    join taxpayer as t
    on ir.taxpayer_id=t.taxpayer_id
    join income_category as ic
    on ir.category_id=ic.category_id;
 --    3
select income_source,year_label
from income_record as ir
join financial_year as f
on ir.year_id=f.year_id;
-- 4
select full_name,category_name,year_label
from income_record as ir
join taxpayer as t
on ir.taxpayer_id=t.taxpayer_id
join financial_year as f
on ir.year_id=f.year_id
join income_category as ic
on ir.category_id=ic.category_id
where category_name='Business income' and year_label='2025-2026';
select * from financial_year;
-- 5
select full_name,pan_number,date_of_birth,email,occupation,income_source,amount,received_date,category_name,description,year_label,start_date,end_date,filing_deadline
from income_record as ir
inner join taxpayer as t
on ir.taxpayer_id-t.taxpayer_id
inner join income_category as ic
on ir.category_id=ic.category_id
inner join financial_year as f
on ir.year_id=f.year_id;