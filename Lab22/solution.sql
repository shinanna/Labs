USE publications;

## Challenge 1 - Most Profiting Authors
-- **who are the top 3 most profiting authors**

### Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT *
FROM titles;

SELECT 
	titleauthor.title_id AS title_id,
	titleauthor.au_id AS author_id, 
	ROUND((titles.advance * titleauthor.royaltyper / 100), 0) AS advances,
	ROUND((titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)), 0) AS sales_royalty
FROM 
	titleauthor
LEFT JOIN 
	titles
ON 
	titles.title_id = titleauthor.title_id
LEFT JOIN 
	sales
ON 
	sales.title_id = titles.title_id;

### Step 2: Aggregate the total royalties for each title and author

SELECT 
	title_id,
	author_id, 
	SUM(sales_royalty) AS agg_roy
FROM
	(SELECT 
		titleauthor.title_id AS title_id,
		titleauthor.au_id AS author_id, 
		ROUND((titles.advance * titleauthor.royaltyper / 100), 0) AS advances,
		ROUND((titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)), 0) AS sales_royalty
	FROM titleauthor
		LEFT JOIN titles
		ON titles.title_id = titleauthor.title_id
		LEFT JOIN sales
		ON sales.title_id = titles.title_id) AS roy_adv
GROUP BY 
	title_id,
	author_id;	

### Step 3: Calculate the total profits of each author

SELECT
	author_id,
    (agg_roy + advances) AS profits
FROM
	(SELECT 
		title_id,
		author_id, 
        advances,
		SUM(sales_royalty) AS agg_roy
	FROM
		(SELECT 
			titleauthor.title_id AS title_id,
			titleauthor.au_id AS author_id, 
			ROUND((titles.advance * titleauthor.royaltyper / 100), 0) AS advances,
			ROUND((titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)), 0) AS sales_royalty
		FROM titleauthor
			LEFT JOIN titles
			ON titles.title_id = titleauthor.title_id
			LEFT JOIN sales
			ON sales.title_id = titles.title_id) AS roy_adv
	GROUP BY 
		title_id,
		author_id) AS roy_ta
GROUP BY 
	author_id;

## Challenge 2 - Alternative Solution

CREATE TEMPORARY TABLE roy_adv
SELECT 
	titleauthor.title_id AS title_id,
	titleauthor.au_id AS author_id, 
	ROUND((titles.advance * titleauthor.royaltyper / 100), 0) AS advances,
	ROUND((titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)), 0) AS sales_royalty
FROM 
	titleauthor
LEFT JOIN 
	titles
ON 
	titles.title_id = titleauthor.title_id
LEFT JOIN 
	sales
ON 
	sales.title_id = titles.title_id;

CREATE TEMPORARY TABLE roy_ta
SELECT 
	title_id,
	author_id, 
	SUM(sales_royalty) AS agg_roy
FROM
	roy_adv
GROUP BY 
	title_id,
	author_id;
	
SELECT
	roy_ta.author_id,
    (agg_roy + advances) AS profits
FROM
	roy_adv,
    roy_ta
GROUP BY 
	roy_ta.author_id;
   
   
## Challenge 3

CREATE TABLE most_profiting_authors
SELECT
	roy_ta.author_id,
    (agg_roy + advances) AS profits
FROM
	roy_adv,
    roy_ta
GROUP BY 
	roy_ta.author_id;
