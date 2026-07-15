create database taxation_db;
use  taxation_db;
create table taxpayer (
			taxpayer_id   int          primary key,
            pan_number    varchar(10)  Not null unique,
            full_name	  varchar(100) Not null,
            date_of_birth date 			Not null,
            occupation 	  varchar(50)   not null,
            annual_income decimal(12,2) not null,
            email  		  varchar(100)  unique,
            is_active 		boolean
            );
create table income_category (
			category_id		int		primary key,
            category_name 	varchar(50)		not null unique,
            description 	varchar(200)	not null,
            taxable			boolean 		not null 
            );
create table financial_year(
			year_id		int		primary key,
            year_label	varchar(9)		not null unique,
            start_date	date		not null,
            end_date	date		not null,
            filing_deadline		date ,
            is_current	boolean
            );
create table income_record(
			income_id    int    primary key,
            taxpayer_id  int 	not null,
            income_source varchar(100) not null,
            category_name varchar(50)  not null,
            amount decimal(12,2) not null,
            received_date  date  not null,
            financial_year varchar(9)  not null
            );
insert into taxpayer (taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
			values
            (101,'ABCDE1234F','Ravi kumar','1995-06-15','SoftwareEngineer',850000.00,'ravikumar@example.com',TRUE),
            (102,'BCDEF2345G','Priya Sharma','1992-11-22','Doctor',120000.00,'priyadharma@example.com',TRUE),
            (10,'CDEFG3456H','Arjun Reddy','1988-03-10','Bussiness Owner',180000.00,'arjunreddy@example.com',TRUE),
            (104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',620000.00,'snehapatel@example.com',TRUE),
            (105,'EFGHJ5678K','kiran rao','1990-01-18','Freelancer',750000.00,'kiranrao@example.com',TRUE),
            (106,'FGHJK6789L','Meera singh','1985-12-30','Consultant',150000.00,'meerasingh@example.com',FALSE);
insert into income_category(category_id,category_name,description,taxable)
	values
          (1,'Salary','Income recieved from employment',TRUE),
          (2,'Business','Income earned from business activities',TRUE),
          (3,'House property','Income received from property or rent',TRUE),
          (4,'Capital Gains','Income from transfer of eligible assets',TRUE),
          (5,'Other Sources','Income such as bank interest',TRUE),
          (6,'Agricultural Income','Income from eligible agricultural activities',FALSE);
insert into financial_year(year_id,year_label,start_date,end_date,filing_deadline,is_current)
	values
		(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE),
        (2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',FALSE),
        (3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',FALSE),
        (4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',FALSE),
        (5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',FALSE),
        (6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',TRUE);
insert into income_record(income_id,taxpayer_id,income_source,category_name,amount,received_date,financial_year)
		values
			(1001,101,'Tech nova Solutions','Salary',850000.00,'2026-03-31','2025-2026'),
            (1002,102,'City Care Hospital','Salary',120000.00,'2026-03-31','2025-2026'),
            (1003,103,'Reddy Enter Prises','Business',180000.00,'2026-03-31','2025-2026'),
            (1004,104,'Sunrise School','Salary',620000.00,'2026-03-31','2025-2026'),
            (1005,105,'Web Design Projects','Business',750000.00,'2026-03-31','2025-2026'),
            (1006,106,'Professional Consulting','Business',150000.00,'2026-03-31','2025-2026');

# DML Tasks :
insert into taxpayer (taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
	values
		(107,'WXY4789Z','Venkata Raju','2009-02-20','Lawyer','999000.00','venkatraju@example.com',TRUE);
update taxpayer 
	set annual_income = 950000.00
		where taxpayer_id =101;
update income_record
	set amount = 950000.0
		where income_id =1001;
update taxpayer
	set occupation = 'Software Consultant'
		where taxpayer_id =105;
        
update taxpayer
	set is_active = FALSE
		where taxpayer_id =106;
delete from taxpayer
where taxpayer_id=107;
insert into income_category(category_id,category_name,description,taxable)
	values
		(7,'Rental Income','The income is received from rents',TRUE);
        
#DDl tasks

alter table taxpayer
	add column phone_number varchar(10) not null;

alter table income_record
	add column remarks varchar(50) not null;
    
alter table taxpayer
	modify column occupation varchar(100) not null;
    
create table tax_office(
						office_id  int Primary key,
                        office_name varchar(50) not null,
                        city 		varchar(25) not null
                        );
insert into tax_office(office_id,office_name,city)
	values
		(1,'Google office','Bangalore'),
        (2,'Microsoft','Mumbai');

truncate  tax_office;
drop table tax_office;

#Experiment 1
insert into taxpayer(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
		values(101,'GFUI6785T','Ganpat Sharma','2005-04-16','Health Assisstant','350000.00','ganpatsingh@example.com',True);
		# shows error because there is already data exist eith the same tax_payer id 

#Experiment 2
insert into taxpayer(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
	values(107,'ABCDE1234F','Ganpat Sharma','2005-04-16','Health Assisstant','350000.00','ganpatsingh@example.com',True);
    #shows error because there already exist eith same pan number. we can't duplicate the unique constraints
    
#Experiment 3
insert into taxpayer(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
	values(107,'ABCDE1234F','2005-04-16','Health Assisstant','350000.00','ganpatsingh@example.com',True);
	# shows error because we should not leave in the not null constraint .


select * from taxpayer;

                        


            

        

 
            
            