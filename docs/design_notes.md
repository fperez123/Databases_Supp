Dataset Requirements

1. Data scaling 
    I expanded the database by adding 11 customers, 80 payments, and 45 rentals. These expansions were done by using a mix of claude and mockaroo. Mockaroo was used to generate the payments and rentals that were added, and claude was used to create the customers and ensure that the return dates in the rentals table that were created by mockaroo came after the rental dates.

2. Schema personalisation
    I made all three modifications to the schema.
        - The attribute amount in payments was changed to payment_amounts. This was done to clarify what value is being represented in payments
        - The attribute phone_number was added to the table customers
        - The constraint UNIQUE was added to the customer email to ensure that no two customer emails are the same

3. Parameter personalisation
    The personalised threshold that came from the last 3 digits of my student ID are 083

4. Data quality variation 
    The data issue of NULL values was created for the email of two of the new customers that added. This is to replicate a real world scenario where certain rows in a table may be empty  
