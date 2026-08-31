Dataset Requirements 

For the task that were to be completed under the dataset requirements, the tool claude was used to help me generate the data that was used to expand the customers table. I also used it to ensure that the dates that were created by Mockaroo for the attribute return_date in the table rentals occured after the rental_date attribute.

Part A - Relational database tasks

1. Customer spending analysis
    I realised that none of my promts were handling the data issue that were present (NULL values in customer emails) and I wasn't sure how to handle it so I asked claude for ideas on how it could be handled. Claude suggested to use COALESCE(c.email, 'No email on file') AS email`, and so I changed the string to be outputted to be 'No email registered'. I learned what COALESCE was and how it can be used to handle missing data gracefully when outputting query data.

2. Procedural programming
    I asked claude to help me with the exception handling as I wasn't sure as to how to write it and to also generate the test cases so that I can verify whether the code works or not. 