USE carcompany;

create database carcompany;

create table invoices
(invoice_id varchar(20),
invoice_date date,
car_vin varchar(20),
customer_id varchar(20),
salesperson_id varchar(20));

create table cars
(car_vin varchar(20),
manufacturer varchar(20),
model varchar(20),
manuf_year int,
color varchar(20));

create table customers
(customer_id varchar(20),
name varchar(40),
phone varchar(40),
mail varchar(40),
address varchar(255),
city varchar(20),
state varchar(20),
country varchar(20),
zip varchar(20));

create table salespersons
(salesperson_id varchar(20),
name varchar(20),
store varchar(20));

-- Modify datatype according to dummy data
alter table cars
modify column car_vin int;
alter table invoices
modify column invoice_id int;
alter table customers
modify column customer_id int;
alter table salespersons
modify column salesperson_id int;
alter table invoices
modify column invoice_date varchar(20);

alter table cars
add id int;
alter table cars
modify column car_vin varchar(20) after id;
alter table customers
add id int;
alter table invoices
add id int;
alter table salespersons
add id int;
alter table cars
ADD PRIMARY KEY (id);

-- assigning foreign keys in main table
ALTER TABLE invoices
RENAME COLUMN car_vin TO car,
RENAME COLUMN customer_id TO customer,
RENAME COLUMN salesperson_id TO salesperson;

ALTER TABLE invoices
MODIFY COLUMN car int,
MODIFY COLUMN customer int,
MODIFY COLUMN salesperson int;

ALTER TABLE invoices
ADD FOREIGN KEY (car) REFERENCES cars(id),
ADD FOREIGN KEY (customer) REFERENCES customers(id),
ADD FOREIGN KEY (salesperson) REFERENCES salespersons(id);