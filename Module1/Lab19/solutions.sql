select * from olist.order_items;

-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
select order_id, max(price) from olist.order_items;
select order_id, min(price) from olist.order_items;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
select min(shipping_limit_date), max(shipping_limit_date) from olist.order_items;

-- 3. From the customers table, find the states with the greatest number of customers.
select customer_state, count(customer_unique_id) from olist.customers group by customer_state order by count(customer_unique_id) desc;

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
select customer_city, count(customer_unique_id) from olist.customers where customer_state = 'SP' group by customer_city order by count(customer_unique_id) desc;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
select count(distinct(business_segment)) from olist.closed_deals;

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
select business_segment, sum(declared_monthly_revenue) from olist.closed_deals group by business_segment order by sum(declared_monthly_revenue) desc limit 3;

-- 7. From the order_reviews table, find the total number of distinct review score values.
select count(distinct(review_score)) from olist.order_reviews;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
alter table order_reviews
add description text;

update order_reviews set description = 'Bad' where review_score = 1;
update order_reviews set description = 'Fair' where review_score = 2; 
update order_reviews set description = 'Good' where review_score = 3; 
update order_reviews set description = 'Very good' where review_score = 4;
update order_reviews set description = 'Excellent' where review_score = 5;

select review_score, description from order_reviews group by review_score order by count(review_id) desc;

-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
select review_score, description, count(review_id) from order_reviews group by review_score order by count(review_id) desc;