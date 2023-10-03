-- Insert into Movie Theater database

---- customer table 2 inserts 
insert into c_customer (
	customer_id ,
	fname ,
	lname 
) 
values( 
	10,
	'Daniel',
	'Allen'
);

insert into c_customer (
	customer_id ,
	fname ,
	lname 
) 
values( 
	20,
	'Barry',
	'Peanut'
);

-- staff table 2 inserts 
insert into staff(
	staff_id,
	staff_name,
	staff_type
) 
values (
	1,
	'Adam',
	'salesman'
);

insert into staff(
	staff_id,
	staff_name,
	staff_type
) 
values (
	2,
	'Sandy',
	'mechanic'
);
-- cars table  2 inserts
insert into cars(
	car_vin ,
	car_use,
	car_model,
	car_make,
	customer_id,
	staff_id
) 
values (
	1738,
	'new',
	'C class',
	'Mercedes Benz',
	20,
	1
);

insert into cars(
	car_vin ,
	car_use,
	car_model,
	car_make,
	customer_id,
	staff_id
) 
values (
	1059,
	'used',
	'SRX',
	'Cadillac',
	10,
	2
);

-- service table 2 inserts
insert into service (
	service_id,
	service_parts_req,
	service_type,
	car_vin,
	staff_id
) 
values (
	5,
	'no',
	'oilchange',
	1059,
	2
);

insert into service (
	service_id,
	service_parts_req,
	service_type,
	car_vin,
	staff_id
) 
values (
	7,
	'no',
	'wash',
	1738,
	2
);
-- sales table 2 inserts
insert into sales (
	sales_id,
	sales_price,
	car_vin,
	staff_id 
) 
values (
	8,
	1000000,
	1738,
	1
);
insert into sales (
	sales_id,
	sales_price,
	car_vin,
	staff_id 
) 
values (
	3,
	100000,
	1059,
	1
);

-- invoice table 3 inserts
insert into invoice (
	invoice_id,
	invoice_amount,
	staff_id,
	sales_id,
	service_id,
	customer_id
) 
values (
	4,
	1000025,
	1,
	8,
	7,
	10
);

insert into invoice (
	invoice_id,
	invoice_amount,
	staff_id,
	sales_id,
	service_id,
	customer_id
) 
values (
	5,
	100000,
	1,
	3,
	5,
	20
);
-- stored function to insert new employees
create or replace function add_staff(staff_id INTEGER,staff_name VARCHAR,staff_type VARCHAR)
returns void
as $MAIN$
begin 
	insert into staff(staff_id, staff_name, staff_type)
	values (staff_id, staff_name, staff_type);
end;
$MAIN$
language plpgsql;

select add_staff(9, 'Dexter', 'salesman');
select add_staff(11, 'Betsy', 'salesman');
