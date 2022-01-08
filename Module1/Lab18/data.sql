create database store;
select * from store.applestore;

#1. What are the different genres?
select prime_genre from store.applestore group by prime_genre;

#2. Which is the genre with the most apps rated?
select prime_genre from store.applestore group by prime_genre order by rating_count_tot desc;

#3. Which is the genre with most apps?
select prime_genre from store.applestore group by prime_genre order by count(track_name) desc;

#4. Which is the one with least?
select prime_genre from store.applestore group by prime_genre order by count(track_name) asc;

#5. Find the top 10 apps most rated.
select track_name from store.applestore order by rating_count_tot desc limit 10;

#6. Find the top 10 apps best rated by users.
select track_name from store.applestore order by user_rating desc limit 10;

#7. Take a look at the data you retrieved in question 5. Give some insights.
select track_name, prime_genre, user_rating, rating_count_tot, price from store.applestore order by rating_count_tot desc limit 10;

#8. Take a look at the data you retrieved in question 6. Give some insights.
select track_name, prime_genre, user_rating, rating_count_tot, price from store.applestore order by user_rating desc limit 10;

#9. Now compare the data from questions 5 and 6. What do you see?
select track_name, prime_genre, user_rating, rating_count_tot, price from store.applestore order by rating_count_tot desc limit 10;

#10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, user_rating, rating_count_tot from store.applestore order by user_rating desc, rating_count_tot desc limit 3;

#11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select rating_count_tot, price from store.applestore group by price order by rating_count_tot desc;
select rating_count_tot, price from store.applestore group by price order by price desc;