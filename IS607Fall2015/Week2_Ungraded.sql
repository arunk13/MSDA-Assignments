SELECT * FROM planes;

SELECT  origin ,CONCAT(month,'/',day,'/',year) as date,
		temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, visib
FROM weather;

SELECT * 
FROM planes
ORDER BY seats DESC;

SELECT * 
FROM planes
WHERE engine = 'Reciprocating';

SELECT *
FROM flights
LIMIT 5;

SELECT max(arr_time) as Longest_Air_Time
FROM flights;

SELECT min(arr_time) as Longest_Air_Time
FROM flights;

SELECT *, STR_To_DATE(CONCAT(month,'/',day,'/',year), '%c/%e/%Y') as flight_date
FROM flights
WHERE carrier = (SELECT carrier FROM airlines WHERE name like '%Alaska Airlines%')
HAVING
flight_date BETWEEN '2013-06-01' AND '2013-06-03';

SELECT * 
FROM airlines
WHERE name like '%america%';

SELECT COUNT(*) as Number_Of_Flights
FROM flights
WHERE dest in (SELECT faa FROM airports WHERE name LIKE '%miami%');

SELECT COUNT(*)
FROM flights
WHERE dest in (SELECT faa FROM airports WHERE name LIKE '%miami%')
AND year = '2013' AND month = '7';

SELECT avg(alt) FROM airports;
