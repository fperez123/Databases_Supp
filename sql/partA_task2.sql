-- ============================================================================
-- partA_task2.sql
-- Author: Fausto Perez Perez
-- Module: CMPU3010 Databases 2
-- Purpose: Completing the tasks described in Part A, Task 2 of assigment description
-- ============================================================================

--function that returns total number of rentals for a customer 
create or replace function get_total_rentals(p_customer_id INT)
returns int as $$
declare 
v_total int;
begin
	select count(*) into v_total
	from rentals
	where customer_id = p_customer_id;

	return v_total;
end;
$$ language plpgsql;

--procedure that updates customer information 
create or replace procedure update_customer_info(
p_customer_id int, 
p_first_name varchar, 
p_last_name varchar, 
p_email varchar, 
p_phone_number varchar)
language plpgsql as $$
begin

	IF NOT EXISTS (SELECT 1 FROM customers WHERE customer_id = p_customer_id) THEN
    	RAISE EXCEPTION 'Customer % does not exist', p_customer_id;
  	END IF;

	IF p_email IS NOT NULL AND p_email NOT LIKE '%@%' THEN
    	RAISE EXCEPTION 'Invalid email format: %', p_email;
  	END IF;

	update customers
	set first_name = p_first_name,
		last_name = p_last_name,
		email = p_email,
		phone_number = p_phone_number
	WHERE customer_id = p_customer_id;

	raise notice 'Customer % updated successfully', p_customer_id;
end;
$$;

--______________________
-- test cases
--______________________

-- funcion tests
-- customer 1 exists so should return rows in rentals belonging to them 
SELECT get_total_rentals(1);    

-- customer 999 doesn't exist so should return 0 
SELECT get_total_rentals(999); 


-- procedure tests
-- should update customer with id 1
CALL update_customer_info(1, 'Alice', 'Smith', 'alice.updated@example.com', '0851111111');
SELECT * FROM customers WHERE customer_id = 1;  

-- should raise exceptino custmer does not exist
CALL update_customer_info(999, 'Ghost', 'User', 'ghost@example.com', '0850000000');  

--should raise exception invalid email format
CALL update_customer_info(1, 'Alice', 'Smith', 'not-an-email', '0851111111');  