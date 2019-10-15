CREATE DATABASE Car Dealership Project

CREATE TABLE car(
	car_id serial primary key,
	Serial_Number integer not null,
	Make varchar(150) not null,
	Model varchar(150) not null,
	Color varchar(150) not null,
	Year integer not null,
	Sale varchar(100)
);

CREATE TABLE sales_invoice(
	Invoice_ID serial primary key,
	Invoice_Number integer not null,
	Date date not null,
	car_ID integer not null,
	customer_id integer not null,
	Salesperson_id integer not null,
	foreign key(car_id) references car(car_id),
	foreign key(Customer_id) references Customer(Customer_id),
	foreign key (Salesperson_id) references Salesperson(Salesperson_id)
);

create table Salesperson(
	Salesperson_id serial primary key, 
	First_name varchar(150) not null,
	Last_name varchar(150) not null
);

create table Customer(
	Customer_id serial primary key, 
	First_name varchar(150) not null,
	Last_name varchar(150) not null,
	Phone_number varchar(15) not null,
	Address varchar(200) not null,
	City varchar(150) not null,
	State_Province varchar(150) not null,
	Country varchar(150) not null,
	Postal_Code varchar(15) not null
);

create table Service_ticket(
	Service_ticket_id serial primary key, 
	Date_received date not null,
	Notes varchar(1000) not null,
	Date_completed date not null,
	car_id integer not null,
	Customer_id integer not null,
	foreign key(car_id) references car(car_id),
	foreign key(Customer_id) references Customer(Customer_id)
);

create table car_parts(
	Parts_id serial primary key, 
	Part_number varchar(150) not null,
	Parts_used varchar(150) not null,
	Number_used varchar(150) not null,
	Description varchar(1000) not null,
	Sold_price numeric(8,2) not null,
	Retail_price numeric(8,2) not null,
	Service_ticket_id integer not null,
	foreign key(Service_ticket_id) references Serviceticket(Service_ticket_id)
);

create table Mechanic(
	Mechanic_id serial primary key, 
	First_name varchar(150) not null,
	Last_name varchar(150) not null
);

create table Service_Mechanics(
	Service_Mechanics_id serial primary key, 
	Hours numeric(8,2) not null,
	Notes varchar(1000),
	Rate numeric(8,2) not null,
	Service_ticket_id integer not null,
	Service_id integer not null,
	Mechanic_id integer not null,
	foreign key(Service_ticket_id) references Serviceticket(Service_ticket_id),
	foreign key(Service_id) references Service(Service_id),
	foreign key (Mechanic_id) references Mechanic(Mechanic_id)
);

create table service_history(
	Service_id serial primary key, 
	Service_name varchar(150) not null,
	Hourly_rate numeric(8,2) not null
);


--insert for car table 
insert into car(car_id, Serial_number,Make,Model,Color,Year,Sale)
values(1,3262462,'Jeep','Grand Cherokee','Midnight Blue',2019,'Yes');

--insert for Sales_invoice
insert into sales_invoice(Invoice_id,Invoice_number,Date,car_id,Customer_id,Salesperson_id)
values(23,23232,'01-28-2019',1,5,123);

--insert for Salesperson table
insert into Salesperson(Salesperson_id,First_name,Last_name)
values(123,'John','Smith');

--insert for customer table
insert into Customer(Customer_id,First_name,Last_name,Phone_number,Address,City,State_Province,Country,Postal_Code)
values(5,'Michael','Jordan',123-456-7890,'123 Taylor Street','Chicago','Illinois','USA','60607');

--insert for Service_ticket
insert into Service_ticket(Service_ticket_id,Date_received,Notes,Date_returned_to_cusotmer,car_id,customer_id)
values(7890,'01-29-2019','needs oil change','01-29-2019',1,5);

--insert for Car Parts
insert into car_parts(Parts_id,Part_number,Parts_used,Number_used,Description,Purchase_price,Retail_price,Service_ticket_id)
values(456,33,'muffler',9,'replaced the muffler with new one',1200.00,2500.00,7890);

--insert for Mechanic table
insert into Mechanic(Mechanic_id,First_name,Last_name)
values(3,'George','Thompson');

--insert for Service mechanic 
insert into Service_Mechanics(Service_Mechanics_id,Hours,Notes,Rate,Service_ticket_id,Service_id,Mechanic_id)
values(50,5.5,'Put brand new muffler in and recycled the old also gave a free oil change',1000.00,7890,25,3);

--insert for service_history table
insert into service_history(Service_id,Service_name,Hourly_rate)
values(25,'Tire Rotation',30.00);
