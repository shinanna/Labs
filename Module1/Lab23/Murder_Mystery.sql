SELECT * FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City';

-- 20180115	murder	Security footage shows that there were 2 witnesses. 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".	SQL City

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number;

-- The first and last results of this query:
-- id		name			license_id	address_number	address_street_name	ssn
-- 89906	Kinsey Erickson	510019		309				Northwestern Dr		635287661
-- 14887	Morty Schapiro	118009		4919			Northwestern Dr		111564949

SELECT person_id, transcript
FROM interview
WHERE person_id = 89906
OR person_id = 14887;

-- person_id	transcript
-- 14887	I heard a gunshot and then saw a man run out. 
-- He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
-- Only gold members have those bags. 
-- The man got into a car with a plate that included "H42W".

SELECT person.id, person.name, person.ssn 
FROM person
LEFT JOIN get_fit_now_member 
ON get_fit_now_member.person_id = person.id
LEFT JOIN drivers_license
ON drivers_license.id = person.license_id
WHERE get_fit_now_member.membership_status = 'gold'
AND get_fit_now_member.id LIKE '48Z%'
AND drivers_license.plate_number LIKE '%H42W%';

-- id		name			ssn
-- 67318	Jeremy Bowers	871539279

SELECT person_id, transcript
FROM interview 
WHERE person_id = 99716
OR person_id = 67318;

-- person_id	transcript
-- 67318		I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%';

-- id		name			license_id	address_number	address_street_name	ssn
-- 16371	Annabel Miller	490173		103				Franklin Ave		318771143

SELECT get_fit_now_member.name, interview.transcript
FROM get_fit_now_member 
INNER JOIN interview 
ON get_fit_now_member.person_id = interview.person_id
WHERE get_fit_now_member.name = 'Annabel Miller';

-- Annabel Miller	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT get_fit_now_member.name, 
get_fit_now_check_in.check_in_time, 
get_fit_now_check_in.check_out_time
FROM get_fit_now_member 
INNER JOIN get_fit_now_check_in 
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
WHERE get_fit_now_check_in.check_in_date = 20180109
ORDER BY get_fit_now_check_in.check_out_time;

-- name				check_in_time	check_out_time
-- Jeremy Bowers	1530			1700
-- Annabel Miller	1600			1700
-- Joe Germuska		1600			1730

SELECT get_fit_now_member.name, interview.transcript
FROM get_fit_now_member 
INNER JOIN interview 
ON get_fit_now_member.person_id = interview.person_id
WHERE get_fit_now_member.name = 'Jeremy Bowers';

-- Jeremy Bowers	I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT id,age,height,car_model
FROM drivers_license 
WHERE drivers_license.car_make = 'Tesla'
AND gender = 'female'
AND hair_color = 'red';

-- id		age	height	car_model
-- 202298	68	66		Model S
-- 291182	65	66		Model S
-- 918773	48	65		Model S

SELECT person_id, event_id, event_name, date
FROM facebook_event_checkin fb
INNER JOIN person
ON person.id = fb.person_id
INNER JOIN drivers_license
ON person.license_id = drivers_license.id
WHERE person.license_id = 202298
OR person.license_id = 291182
OR person.license_id = 918773;

-- person_id	event_id	event_name	date
-- 99716	1143	SQL Symphony Concert	20171206
-- 99716	1143	SQL Symphony Concert	20171212
-- 99716	1143	SQL Symphony Concert	20171229

SELECT person.id, person.name, person.ssn, 
income.annual_income
FROM person
INNER JOIN income
ON person.ssn = income.ssn
WHERE person.id = 99716
OR person.id = 67318;

-- id		name				ssn			annual_income
-- 67318	Jeremy Bowers		871539279	10500
-- 99716	Miranda Priestly	987756388	310000

-- Miranda Priestly is the sponsor of murderer Jeremy Bowers, and the true murderer.