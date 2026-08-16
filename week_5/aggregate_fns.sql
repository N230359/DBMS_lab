use  taxation_db;
show tables;
select * from financial_year;
select * from income_category;
select * from income_record;
select * from taxpayer;
insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id)
		values
        (1007,101,'Agricultural land',100000.00,'2024-03-31',6,4),
		(1008,104,'Agricultural land',120000.00,'2025-03-31',6,5),
        (1009,102,'House rent',250000.00,'2025-03-31',3,5),
		(1010,103,'House rent',150000.00,'2024-03-31',3,4);

#Display the total number of income records. 
select count(*) from income_record;

#: Display the total income amount recorded in the database. 
select sum(amount) from income_record;

# Display the average income amount. 
select avg(amount) from income_record;

# Display the highest income amount recorded. 
select max(amount) from income_record;

#Display the lowest income amount recorded. 
select min(amount) from income_record;

# Display the number of income records for each income category. 
select category_id,count(category_id) 
	from income_record
    group by category_id;

# Display the total income for each income category. 
select category_id,sum(amount)
	from income_record
    group by category_id;

# Display the average income for each income category. 
select category_id,avg(amount)
	from income_record
    group by category_id;


# Display the highest income recorded in each income category. 
select category_id,max(amount)
	from income_record
    group by(category_id);

select category_id,min(amount)
	from income_record
    group by(category_id);
    
select year_id,count(*)
	from income_record
    group by(year_id);
    
# Display the total income for each income category in each financial year. Hint: Use GROUP BY with category_id and year_id. 
select year_id,category_id,sum(amount)
	from income_record
    group by year_id,category_id;
    
#Display only those income categories whose total income is greater than ₹10,00,000.
select category_name, sum(amount)
	from income_record as i
    inner join
    income_category as ic
    on i.category_id = ic.category_id
    group by category_name
    having sum(amount) > 1000000;
    
select category_id,sum(amount)
	from income_record
    group by category_id
    having sum(amount)>1000000;
    
#Display income categories whose average income is greater than ₹5,00,000
select category_name,avg(amount)
	from income_record as i
    inner join
    income_category  as ic
    on i.category_id=ic.category_id
    group by category_name
    having avg(amount)>500000;
    
select category_id,avg(amount)
	from income_record
    group by category_id
    having avg(amount)>500000;
select year_label,count(*) as no_of_records
	from income_record as i
    inner join 
    financial_year as f
    on i.year_id=f.year_id
    group by year_label
    having count(*)>3;
    
select category_id,sum(amount) as total_income
	from income_record
    group by category_id
    order by total_income desc;
    
select category_name,sum(amount) as total_income
	from income_record as i
    inner join 
    income_category as ic
    on i.category_id=ic.category_id
    group by category_name
    having total_income >1000000
    order by total_income desc;
    
select category_id,sum(amount),avg(amount)
	from income_record
    group by category_id;
    
select category_name,sum(amount) as total_amount,avg(amount) as avg_amount
	from income_record as i
    inner join
     income_category as ic
     on i.category_id = ic.category_id
     group by category_name;
     
select category_name,year_label,sum(amount) as total_amount
	from income_record as i
    inner join 
    income_category as ic
    on i.category_id = ic.category_id
    inner join 
    financial_year as f
    on i.year_id = f.year_id
    group by i.category_id,year_label
    order by total_amount desc
    limit 1;
    

#Display the number of taxpayers who have income records in each financial year. Hint: Use JOIN, COUNT(), and GROUP BY. 
select full_name,year_label,count(*)
	from income_record as i
    inner join
    taxpayer as t
    on i.taxpayer_id=t.taxpayer_id
    inner join 
    financial_year as f
    on i.year_id = f.year_id
   group by year_label,full_name; 
   
select category_name,sum(amount) as total_income
	from income_record as i
    inner join income_category as ic
    on i.category_id = ic.category_id
    group by  category_name
    order by total_income
    limit 1;
    
select year_label,sum(amount) as total_income
	from income_record as i
    inner join
    financial_year as f
    on i.year_id = f.year_id
    group by year_label
    order by  total_income desc
    limit 1;
    
select category_name,avg(amount) as average_income
	from income_record as i
    inner join
    income_category as ic
    on i.category_id = ic.category_id
    group by category_name
    order by average_income desc
    limit 1;
    
select category_name,count(*) as count
	from income_record as i
    inner join
    income_category as ic
    on i.category_id = ic.category_id
    group by category_name
    having count>2;
    
select year_label,sum(amount) as total_income
	from income_record as i
    inner join
    financial_year as f
    on i.year_id = f.year_id
    group by year_label 
    having total_income>1000000;
    
select category_name,count(*) as total_count,sum(amount) as total_amount,avg(amount) as average_income,max(amount)
as max_income,min(amount) as min_income
	from income_record as i
    inner join
    income_category as ic
    on i.category_id = ic.category_id
    group by category_name;
    


    
    
    

