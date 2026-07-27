use taxation_db;
show tables;
describe taxpayer;
show columns from taxpayer;
select * from taxpayer;
show create table taxpayer;
select upper(full_name) from taxpayer;
select lower(occupation) from taxpayer;
select full_name, length(full_name) from taxpayer;
select substring(pan_number,1,4) from taxpayer;
select concat( full_name,' - ',occupation) from taxpayer;
show columns from income_category;
select replace(category_name,'income','inc.') from income_category;
select trim(full_name) from taxpayer;
select left(full_name,locate(' ',full_name)-1) from taxpayer;
select concat('Taxpayer :',full_name) as line1,concat(' occupation: ',occupation) as line2  from taxpayer;
select full_name from taxpayer
where left(pan_number,2) ='AB';
select round(annual_income,0)  from taxpayer;
select abs(annual_income) from taxpayer
where annual_income = 500000;
select power(annual_income,2) from taxpayer;
select mod(annual_income,1000) from taxpayer;
select round(annual_income,2) from taxpayer;
select ceil(annual_income) from taxpayer;
select floor(annual_income) from taxpayer;
select floor(rand()*100)+1;
select sqrt(annual_income) from taxpayer;
select full_name,annual_income,round(annual_income*1.10 ,2) as increased_income from taxpayer;
select curdate();
select now();
select year(start_date) from financial_year;
select month(start_date) from financial_year;
select day(start_date) from financial_year;
select date_add(start_date,interval 1 year) from financial_year;
select date_add(start_date, interval 30 day),end_date from financial_year;
select date_sub(start_date,interval 7 day) from financial_year;
select datediff( curdate(),start_date) from financial_year;
select start_date from financial_year
where year(start_date)=year(curdate());
select annual_income,cast(annual_income as signed) from taxpayer;
select taxpayer_id,cast(taxpayer_id as char) from taxpayer;
select start_date,cast(start_date as datetime) from financial_year;
select annual_income,cast(annual_income as decimal(12,4)) from taxpayer;
select annual_income, convert(annual_income,char) as income_text from taxpayer;
select annual_income,convert(annual_income,signed) * 0.10 as tax_amount from taxpayer;







