Part A - Relational database tasks

1. Customer spending analysis 
    For the correlated subquery, the output that is given is a list of all of the users (their id, first name, last name, and email) who have exceeded my personal threshold of 183. This output is achieved by recalculating each customers total for every row that is checked.

    The JOIN-based approach outputs the same results as the correlated subquery but achieves it in a different way. It joins all of the customers to all of their payments first, and then performs a group and sum. 

    The optimisation that we performed in this task was to create an index. Indexes organise a columns values into a sorted B-tree which allows the Postgres to go straight to the ones that match instead of checking every row one by one. 

    For the comparison of performance I compared the JOIN-based approach before and after creating an index of payments(customer.id). Before creating the index, a sequential scan was performed on payments and customers. These were then combined using a hash join, and then grouped and filtered using hash aggregate. After creating the index and running analyze, I ran the JOIN-based query again and the same exact approach was used. This is because the payments table is still fairly small and the query itself needs to find the sum of every customer before it can check who exceeds the threshold meaning every row in payments has to be visited anyways. This leads to the sequential scan still being cheaper than using an index, so that approach is chosen rather than using an index.

    The queries both handle the NULL emails by using COALESCE. The use of COALESCE allows you to handle the incomplete data gracefully as we can control what is outputted (in this case "No email registered") instead of it being blank or NULL. 