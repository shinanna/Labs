CREATE DATABASE student_score;

USE student_score;

CREATE TABLE score(
student_id int,
score int);

INSERT INTO score
VALUES
(1,91),
(2,72),
(3,98),
(4,62),
(5,62),
(6,95),
(7,83),
(8,86),
(9,56),
(10,97),
(11,58),
(12,71),
(13,87),
(14,83),
(15,98);

SELECT avg(score),
sum(score), 
stddev(score), 
variance(score), 
min(score),
max(score)
FROM score;
