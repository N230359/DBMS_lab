use taxation_db;
alter table income_record
		drop column category_name,
        drop column financial_year;
        
alter table income_record
		add column category_id int ,
        add  column year_id int ;

alter table income_record
	add constraint fk_taxpayer
		foreign key (taxpayer_id) references taxpayer(taxpayer_id);
alter table income_record
	add constraint fk_category
		foreign key(category_id) references income_category(category_id);
        
alter table income_record
	add constraint fk_year
    foreign key(year_id) references financial_year(year_id);
    
update  income_record
	set category_id= 1
    where income_id =1001;
update income_record
    set category_id =1
    where income_id = 1002;
update income_record 
	set category_id =2
    where income_id =1003;
update income_record
	set category_id=1
    where income_id =1004;
update income_record
	set category_id =5
    where income_id =1005;
update income_record
	set category_id=5
	where income_id=1006;
    
update income_record
	 set year_id=6
     where income_id=1001;
update income_record
	 set year_id=6
     where income_id=1002;
update income_record
	 set year_id=6
     where income_id=1003;
update income_record
	 set year_id=6
     where income_id=1004;
update income_record
	 set year_id=6
     where income_id=1005;
update income_record
	 set year_id=6
     where income_id=1006;

insert into income_record values
 (1007,999,'Aditya Inter College',850000.00,'2026-03-31','perfect',7,6);
 
 insert into income_record values
 (1007,101,'Aditya Inter College',850000.00,'2026-03-31','perfect',20,6);

insert into income_record values
 (1007,101,'Aditya Inter College',850000.00,'2026-03-31','perfect',7,15);
 
 delete from taxpayer
 where taxpayer_id=106;
 
 delete from income_category
 where category_id=1;
 
 select distinct occupation from taxpayer;
 select distinct year_label from financial_year;
 select distinct income_source from income_record;
 select full_name from taxpayer 
 where taxpayer_id in (select taxpayer_id from income_record where category_id  = (select category_id from income_category where 
 category_name = 'salary')) union 
 select full_name from taxpayer
 where taxpayer_id in (select taxpayer_id from income_record where category_id = (select category_id from income_category where category_name='business'));
 
 select income_source from income_record
 where year_id in (select year_id from financial_year where year_label ='2024-2025') union
 select income_source from income_record
 where year_id in (select year_id from financial_year where year_label = '2025-2026');
 
 select * from taxpayer 
 where occupation =' teacher' union
 select * from taxpayer
 where occupation = 'SoftwareEngineer';
 
 select full_name from taxpayer 
 where taxpayer_id in (select taxpayer_id from income_record where category_id  = (select category_id from income_category where 
 category_name = 'salary'))  
 INTERSECT
 select full_name from taxpayer
 where taxpayer_id in (select taxpayer_id from income_record where category_id = (select category_id from income_category where category_name='business'));
 
  select income_source from income_record
 where year_id in (select year_id from financial_year where year_label ='2024-2025') intersect
 select income_source from income_record
 where year_id in (select year_id from financial_year where year_label = '2025-2026');
 
 select full_name from taxpayer 
 where taxpayer_id in (select taxpayer_id from income_record where category_id  = (select category_id from income_category where 
 category_name = 'salary'))  
 except
 select full_name from taxpayer
 where taxpayer_id in (select taxpayer_id from income_record where category_id = (select category_id from income_category where category_name='business'));
 
  select income_source from income_record
 where year_id in (select year_id from financial_year where year_label ='2025-2026') except
 select income_source from income_record
 where year_id in (select year_id from financial_year where year_label = '2024-2025');
 
 select full_name from taxpayer
 where taxpayer_id in (select taxpayer_id from income_record);
 
select full_name,occupation from taxpayer
where taxpayer_id in ( select taxpayer_id from  income_record where category_id in (select category_id from income_category where category_name ='Business'));

select full_name from taxpayer
 where taxpayer_id not  in (select taxpayer_id from income_record);
 
 select full_name,occupation from taxpayer
where taxpayer_id not in ( select taxpayer_id from  income_record where category_id in (select category_id from income_category where category_name ='Business'));

select full_name from taxpayer
where exists (select taxpayer_id from income_record where income_record.taxpayer_id = taxpayer.taxpayer_id);

select year_label from financial_year 
where exists(select year_id from income_record where income_record.year_id=financial_year.year_id);

select full_name from taxpayer
where not exists(select taxpayer_id from income_record where income_record.taxpayer_id= taxpayer.taxpayer_id);

select year_label from financial_year
where not exists(select year_id from income_record where income_record.year_id=financial_year.year_id);

select full_name,occupation ,annual_income from taxpayer
where  annual_income > all ( select annual_income from taxpayer where occupation= 'Teacher' );
 
 select full_name from taxpayer
 where annual_income > all (select annual_income from taxpayer where taxpayer_id  in (select taxpayer_id from income_record where category_id  in (select category_id from income_category where category_name='Business')));
 
# Additional Query Practice
-- Display all taxpayers in asceding order
select * from taxpayer 
order by full_name asc;
 
 -- Display taxpayers whose annual income is greater than 800000.
 select * from taxpayer
 where annual_income> 800000;
 
 select * from taxpayer 
 where occupation="SoftwareEngineer";
 
 select * from income_record
 where category_id =(select category_id from income_category where category_name='Business');
 
 select * from taxpayer
 where annual_income between 500000 and 1000000;
 
 select * from taxpayer
 where full_name like 'A%';
 
 select * from taxpayer
 where is_active = 1;
 
 select count(*) as total_taxpayers from taxpayer;
 
 select * from taxpayer
 where annual_income >= all(select annual_income from taxpayer);
 
 select * from taxpayer
 order by annual_income desc
 limit  1;
 
 select max(annual_income) as highest_income from taxpayer;
 select category_name,(select count(*) from income_record where income_record.category_id=income_category.category_id) as record_count
 from income_category 
 order by record_count desc
 limit 1;
 
 select occupation,(select count(*) from taxpayer t2  where t2.occupation=t1.occupation)as taxpayer_count from taxpayer t1 ;
 select occupation, count(*) as taxpayer_count from taxpayer
 group by occupation;
 
 select count(*) as active_taxpayers   from taxpayer
 where is_active=1;
 select is_active ,count(*) as taxpayer_count from taxpayer
 group by is_active;
 
 select year_label,(select count(*) from income_record where income_record.year_id = financial_year.year_id) as no_of_records
 from financial_year
 order by no_of_records desc
 limit 1;