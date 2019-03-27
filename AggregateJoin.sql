/*

Overview
For this kata we will be using the DVD Rental database. http://www.postgresqltutorial.com/postgresql-sample-database/

Your are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent. Total number of payments has also been requested.

The query should output the following columns:

customer_id [int4]
email [varchar]
payments_count [int]
total_amount [float]
and has the following requirements:

only returns the 10 top customers, ordered by total amount spent

*/

select c.customer_id, 
c.email, 
count(p.payment_id) as payments_count, 
cast(sum(p.amount) as float) as total_amount
from customer c
join payment p using (customer_id)
group by c.customer_id
order by total_amount desc
limit 10;
