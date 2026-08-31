-- ============================================================================
-- retail_database_setup.sql
-- Author: Dr. Bianca Schoen-Phelan
-- Module: CMPU3010 Databases 2
-- Purpose: Setup script for 'retail_db' PostgreSQL database used in Repeat CA
-- Usage: Run this script in pgAdmin4 to create the database and populate it
-- Warning: This script checks first for the existence of the retail_db object.
--    If it already exists, this will first be deleted and then created again.
-- ============================================================================

-- Drop the database if it already exists
DROP DATABASE IF EXISTS retail_db;

-- Create the database
CREATE DATABASE retail_db;

-- Connect to the database manually in pgAdmin4 before running the rest of the script

-- Test that you can connect but there shouldn't be any db objects yet.
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_catalog = 'retail_db'
  AND table_type = 'BASE TABLE';

-- another check
-- the result of this should show "retail_db". If it doesn't then
-- you are working on the wrong database and you need to change context.
SELECT current_database();


-- Begin schema definition
-- Table: customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Table: payments
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    amount DECIMAL(10, 2),
    payment_date DATE
);

-- Table: rentals
CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    rental_date DATE,
    return_date DATE
);

-- Insert sample data into customers
INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Smith', 'alice.smith@example.com'),
('Bob', 'Johnson', 'bob.johnson@example.com'),
('Carol', 'Williams', 'carol.williams@example.com');

-- Insert sample data into payments
INSERT INTO payments (customer_id, amount, payment_date) VALUES
(1, 45.00, '2023-01-15'),
(1, 60.00, '2023-02-10'),
(2, 30.00, '2023-01-20'),
(2, 25.00, '2023-03-05'),
(3, 120.00, '2023-02-25');

-- Insert sample data into rentals
INSERT INTO rentals (customer_id, rental_date, return_date) VALUES
(1, '2023-01-10', '2023-01-12'),
(1, '2023-02-08', '2023-02-10'),
(2, '2023-01-18', '2023-01-20'),
(3, '2023-02-22', '2023-02-24');

-- check for input
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM rentals;



-- ============================================================================
-- Dataset Requirements
-- all of the changes and additions that were required to be made to the data are present below
--these changes are numbered according to the number in the brief 
-- ============================================================================

-- 2. schema personalisation: renaming attribute amount to payment amount 
ALTER TABLE payments RENAME COLUMN amount TO payment_amount;

-- 2. schema personalisation: adding new attribute phone_number
ALTER TABLE customers ADD COLUMN phone_number VARCHAR(20);

-- 2. schema personalisation: introducing a constraint
-- the UNIQUE constraint is used for the customer email 
ALTER TABLE customers ADD CONSTRAINT unique_customer_email UNIQUE (email);

-- 1. Data scaling: adding 9 customer
--               	+
-- 4. Data quality variation: adding 2 more customers with emails as null values
INSERT INTO customers (first_name, last_name, email, phone_number) VALUES
('David', 'Brown', 'david.brown@example.com', '0851234501'),
('Emma', 'Davis', 'emma.davis@example.com', '0851234502'),
('Frank', 'Miller', 'frank.miller@example.com', '0851234503'),
('Grace', 'Wilson', 'grace.wilson@example.com', '0851234504'),
('Henry', 'Moore', 'henry.moore@example.com', '0851234505'),
('Isla', 'Taylor', 'isla.taylor@example.com', '0851234506'),
('Jack', 'Anderson', 'jack.anderson@example.com', '0851234507'),
('Karen', 'Thomas', NULL, '0851234508'),
('Liam', 'Jackson', NULL, '0851234509');

-- 1. Data scaling: adding 80 more payments
insert into payments (customer_id, payment_amount, payment_date) values (7, 43.52, '2023-05-27');
insert into payments (customer_id, payment_amount, payment_date) values (5, 172.29, '2023-11-11');
insert into payments (customer_id, payment_amount, payment_date) values (4, 186.25, '2023-03-07');
insert into payments (customer_id, payment_amount, payment_date) values (1, 188.13, '2023-07-15');
insert into payments (customer_id, payment_amount, payment_date) values (10, 126.16, '2023-05-11');
insert into payments (customer_id, payment_amount, payment_date) values (8, 150.66, '2023-01-09');
insert into payments (customer_id, payment_amount, payment_date) values (11, 169.29, '2023-09-05');
insert into payments (customer_id, payment_amount, payment_date) values (1, 81.26, '2023-01-25');
insert into payments (customer_id, payment_amount, payment_date) values (3, 83.18, '2023-05-08');
insert into payments (customer_id, payment_amount, payment_date) values (6, 72.18, '2023-07-22');
insert into payments (customer_id, payment_amount, payment_date) values (11, 166.46, '2023-07-07');
insert into payments (customer_id, payment_amount, payment_date) values (9, 139.97, '2023-07-30');
insert into payments (customer_id, payment_amount, payment_date) values (2, 48.25, '2023-08-06');
insert into payments (customer_id, payment_amount, payment_date) values (7, 145.62, '2023-12-01');
insert into payments (customer_id, payment_amount, payment_date) values (4, 85.8, '2023-12-18');
insert into payments (customer_id, payment_amount, payment_date) values (4, 134.97, '2023-10-31');
insert into payments (customer_id, payment_amount, payment_date) values (8, 168.53, '2023-11-27');
insert into payments (customer_id, payment_amount, payment_date) values (11, 32.38, '2023-12-20');
insert into payments (customer_id, payment_amount, payment_date) values (6, 54.89, '2023-03-13');
insert into payments (customer_id, payment_amount, payment_date) values (5, 62.25, '2023-10-26');
insert into payments (customer_id, payment_amount, payment_date) values (2, 174.23, '2023-08-18');
insert into payments (customer_id, payment_amount, payment_date) values (3, 45.61, '2023-08-16');
insert into payments (customer_id, payment_amount, payment_date) values (7, 36.82, '2023-07-03');
insert into payments (customer_id, payment_amount, payment_date) values (11, 56.29, '2023-05-21');
insert into payments (customer_id, payment_amount, payment_date) values (5, 95.25, '2023-01-05');
insert into payments (customer_id, payment_amount, payment_date) values (10, 152.66, '2023-05-30');
insert into payments (customer_id, payment_amount, payment_date) values (5, 110.31, '2023-05-10');
insert into payments (customer_id, payment_amount, payment_date) values (2, 69.03, '2023-11-12');
insert into payments (customer_id, payment_amount, payment_date) values (5, 151.57, '2023-07-04');
insert into payments (customer_id, payment_amount, payment_date) values (2, 94.74, '2023-11-21');
insert into payments (customer_id, payment_amount, payment_date) values (2, 137.08, '2023-02-04');
insert into payments (customer_id, payment_amount, payment_date) values (5, 55.72, '2023-05-17');
insert into payments (customer_id, payment_amount, payment_date) values (6, 73.97, '2023-08-10');
insert into payments (customer_id, payment_amount, payment_date) values (9, 108.77, '2023-02-11');
insert into payments (customer_id, payment_amount, payment_date) values (7, 48.91, '2023-11-03');
insert into payments (customer_id, payment_amount, payment_date) values (5, 101.12, '2023-09-16');
insert into payments (customer_id, payment_amount, payment_date) values (11, 162.24, '2023-11-17');
insert into payments (customer_id, payment_amount, payment_date) values (7, 114.43, '2023-09-01');
insert into payments (customer_id, payment_amount, payment_date) values (10, 155.44, '2023-06-24');
insert into payments (customer_id, payment_amount, payment_date) values (4, 106.96, '2023-03-09');
insert into payments (customer_id, payment_amount, payment_date) values (10, 26.1, '2023-06-22');
insert into payments (customer_id, payment_amount, payment_date) values (4, 65.52, '2023-10-23');
insert into payments (customer_id, payment_amount, payment_date) values (8, 50.49, '2023-10-13');
insert into payments (customer_id, payment_amount, payment_date) values (1, 98.36, '2023-08-01');
insert into payments (customer_id, payment_amount, payment_date) values (6, 192.56, '2023-02-17');
insert into payments (customer_id, payment_amount, payment_date) values (1, 74.19, '2023-07-10');
insert into payments (customer_id, payment_amount, payment_date) values (2, 57.53, '2023-04-25');
insert into payments (customer_id, payment_amount, payment_date) values (12, 139.35, '2023-08-13');
insert into payments (customer_id, payment_amount, payment_date) values (3, 113.98, '2023-05-18');
insert into payments (customer_id, payment_amount, payment_date) values (12, 51.38, '2023-02-27');
insert into payments (customer_id, payment_amount, payment_date) values (3, 186.43, '2023-06-03');
insert into payments (customer_id, payment_amount, payment_date) values (11, 178.54, '2023-07-28');
insert into payments (customer_id, payment_amount, payment_date) values (9, 48.27, '2023-12-06');
insert into payments (customer_id, payment_amount, payment_date) values (3, 92.62, '2023-09-21');
insert into payments (customer_id, payment_amount, payment_date) values (10, 171.48, '2023-06-02');
insert into payments (customer_id, payment_amount, payment_date) values (7, 164.17, '2023-12-25');
insert into payments (customer_id, payment_amount, payment_date) values (12, 99.45, '2023-09-19');
insert into payments (customer_id, payment_amount, payment_date) values (8, 194.68, '2023-12-23');
insert into payments (customer_id, payment_amount, payment_date) values (8, 24.36, '2023-10-07');
insert into payments (customer_id, payment_amount, payment_date) values (5, 79.8, '2023-04-11');
insert into payments (customer_id, payment_amount, payment_date) values (6, 104.94, '2023-03-12');
insert into payments (customer_id, payment_amount, payment_date) values (10, 66.4, '2023-08-03');
insert into payments (customer_id, payment_amount, payment_date) values (4, 25.94, '2023-08-13');
insert into payments (customer_id, payment_amount, payment_date) values (2, 133.81, '2023-04-30');
insert into payments (customer_id, payment_amount, payment_date) values (3, 153.46, '2023-04-16');
insert into payments (customer_id, payment_amount, payment_date) values (8, 40.5, '2023-09-30');
insert into payments (customer_id, payment_amount, payment_date) values (5, 135.68, '2023-01-30');
insert into payments (customer_id, payment_amount, payment_date) values (2, 192.45, '2023-01-27');
insert into payments (customer_id, payment_amount, payment_date) values (9, 60.74, '2023-03-26');
insert into payments (customer_id, payment_amount, payment_date) values (5, 169.02, '2023-01-04');
insert into payments (customer_id, payment_amount, payment_date) values (5, 195.56, '2023-04-20');
insert into payments (customer_id, payment_amount, payment_date) values (12, 99.56, '2023-08-02');
insert into payments (customer_id, payment_amount, payment_date) values (9, 175.86, '2023-03-28');
insert into payments (customer_id, payment_amount, payment_date) values (3, 32.05, '2023-11-04');
insert into payments (customer_id, payment_amount, payment_date) values (10, 103.99, '2023-04-26');
insert into payments (customer_id, payment_amount, payment_date) values (4, 110.23, '2023-12-24');
insert into payments (customer_id, payment_amount, payment_date) values (2, 100.31, '2023-06-18');
insert into payments (customer_id, payment_amount, payment_date) values (5, 71.95, '2023-06-27');
insert into payments (customer_id, payment_amount, payment_date) values (3, 107.94, '2023-02-07');
insert into payments (customer_id, payment_amount, payment_date) values (10, 92.32, '2023-09-22');

-- 1. Data scaling: adding 45 more rentals
insert into rentals (customer_id, rental_date, return_date) values (10, '2023-07-17', '2023-07-21');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-06-26', '2023-06-29');
insert into rentals (customer_id, rental_date, return_date) values (7, '2023-03-11', '2023-03-17');
insert into rentals (customer_id, rental_date, return_date) values (12, '2023-01-06', '2023-01-10');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-10-25', '2023-10-26');
insert into rentals (customer_id, rental_date, return_date) values (1, '2023-02-03', '2023-02-09');
insert into rentals (customer_id, rental_date, return_date) values (4, '2023-02-19', '2023-02-24');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-04-19', '2023-04-20');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-12-10', '2023-12-14');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-01-05', '2023-01-10');
insert into rentals (customer_id, rental_date, return_date) values (7, '2023-09-12', '2023-09-14');
insert into rentals (customer_id, rental_date, return_date) values (9, '2023-05-04', '2023-05-07');
insert into rentals (customer_id, rental_date, return_date) values (1, '2023-01-15', '2023-01-20');
insert into rentals (customer_id, rental_date, return_date) values (5, '2023-02-25', '2023-02-27');
insert into rentals (customer_id, rental_date, return_date) values (1, '2023-01-17', '2023-01-20');
insert into rentals (customer_id, rental_date, return_date) values (5, '2023-10-16', '2023-10-18');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-01-08', '2023-01-11');
insert into rentals (customer_id, rental_date, return_date) values (2, '2023-10-05', '2023-10-11');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-10-14', '2023-10-20');
insert into rentals (customer_id, rental_date, return_date) values (3, '2023-10-30', '2023-10-31');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-06-17', '2023-06-20');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-04-01', '2023-04-03');
insert into rentals (customer_id, rental_date, return_date) values (12, '2023-04-24', '2023-04-25');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-01-14', '2023-01-15');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-12-28', '2024-01-03');
insert into rentals (customer_id, rental_date, return_date) values (10, '2023-02-19', '2023-02-21');
insert into rentals (customer_id, rental_date, return_date) values (2, '2023-03-02', '2023-03-06');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-05-02', '2023-05-03');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-07-20', '2023-07-26');
insert into rentals (customer_id, rental_date, return_date) values (2, '2023-11-07', '2023-11-09');
insert into rentals (customer_id, rental_date, return_date) values (7, '2023-04-12', '2023-04-13');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-10-11', '2023-10-12');
insert into rentals (customer_id, rental_date, return_date) values (7, '2023-05-06', '2023-05-09');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-10-13', '2023-10-16');
insert into rentals (customer_id, rental_date, return_date) values (6, '2023-09-14', '2023-09-18');
insert into rentals (customer_id, rental_date, return_date) values (9, '2023-10-20', '2023-10-24');
insert into rentals (customer_id, rental_date, return_date) values (5, '2023-03-12', '2023-03-14');
insert into rentals (customer_id, rental_date, return_date) values (7, '2023-11-24', '2023-11-29');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-11-21', '2023-11-25');
insert into rentals (customer_id, rental_date, return_date) values (11, '2023-01-24', '2023-01-29');
insert into rentals (customer_id, rental_date, return_date) values (8, '2023-08-20', '2023-08-25');
insert into rentals (customer_id, rental_date, return_date) values (3, '2023-03-20', '2023-03-22');
insert into rentals (customer_id, rental_date, return_date) values (2, '2023-10-16', '2023-10-21');
insert into rentals (customer_id, rental_date, return_date) values (10, '2023-12-05', '2023-12-10');
insert into rentals (customer_id, rental_date, return_date) values (3, '2023-08-11', '2023-08-15');

-- check to see all tables have been updated correctly 
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_payments FROM payments;
SELECT COUNT(*) AS total_rentals FROM rentals;
SELECT * FROM customers WHERE email IS NULL;  -- the data quality issue


