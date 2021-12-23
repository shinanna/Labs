USE publications;

SELECT *
FROM titles;

-- Challenge 1

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE',
publishers.pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
;

-- Challenge 2

SELECT COUNT(title_id)
FROM titleauthor;
-- Count = 25

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
publishers.pub_name AS 'PUBLISHER',
COUNT(DISTINCT titles.title_id) AS 'TITLE' 
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id,
publishers.pub_id;
-- Check count = 25

-- Challenge 3

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
COUNT(DISTINCT titleauthor.title_id) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY COUNT(DISTINCT titleauthor.title_id) DESC
LIMIT 3;

-- Challenge 4

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
COUNT(DISTINCT titleauthor.title_id) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY COUNT(DISTINCT titleauthor.title_id) DESC;