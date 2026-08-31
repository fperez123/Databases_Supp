-- ============================================================================
-- relational_database_tasks.sql
-- Author: Fausto Perez Perez
-- Module: CMPU3010 Databases 2
-- Purpose: Completing the tasks described in Part A of assigment description
-- ============================================================================

-- Customer spending analysis
-- correlated subquery identifying customers who exceed my personalised threshold (100 + 083 = 183)
select c.customer_id, c.first_name, c.last_name, coalesce(c.email, 'No email registered') as email
from customers c
where (
select sum(p.payment_amount)
from payments p
where p.customer_id = c.customer_id
) > 183;

-- JOIN-based approach
-- identifying customers who exceed my personalised threshold by using a JOIN-based approach
explain analyze
select c.customer_id, c.first_name, c.last_name, coalesce(c.email, 'No email registered') as email, sum(p.payment_amount) as total 
from customers c
join payments p on c.customer_id = p.customer_id 
group by c.customer_id, c.first_name, c.last_name, c.email 
having sum(p.payment_amount) > 183;

-- creating index of customer.id of payments table
create index idx_payments_customer_id on payments(customer_id);

analyze payments;

--running the JOIN-based approach again, but this time after having created the index
explain analyze
select c.customer_id, c.first_name, c.last_name, coalesce(c.email, 'No email registered') as email, sum(p.payment_amount) as total 
from customers c
join payments p on c.customer_id = p.customer_id 
group by c.customer_id, c.first_name, c.last_name, c.email 
having sum(p.payment_amount) > 183;