#
#							Assignment: SQL and NULLs
#
USE flights;
#1. How many airplanes have listed speeds? 
SELECT COUNT(*) as Total_Airplanes
FROM planes
WHERE speed IS NOT NULL
  AND speed <> ' ';

#   What is the minimum listed speed and the maximum listed speed?  
SELECT max(speed) as Maximum_Listed_Speed
FROM planes
WHERE speed IS NOT NULL
  AND speed <> ' ';
  
SELECT min(speed) as Minimum_Listed_Speed
FROM planes
WHERE speed IS NOT NULL
  AND speed <> ' ';

#2. What is the total distance flown by all of the planes in January 2013? 
SELECT sum(distance) as Total_Distance_January
FROM flights
WHERE year = '2013' and month = '1';

#What is the total distance flown by all of
#the planes in January 2013 where the tailnum is missing?
SELECT sum(distance) as Total_Distance_January
FROM flights
WHERE year = '2013' and month = '1'
  AND tailnum = ' '
  OR  tailnum IS NULL;
  
#3. What is the total distance flown for all planes on July 5, 2013 
#grouped by aircraft manufacturer?

#Using inner join
SELECT p.manufacturer, sum(f.distance) as Total_Distance
FROM flights f INNER JOIN planes p ON f.tailnum = p.tailnum
WHERE f.year = '2013' AND f.month = '7' and f.day = '5'
GROUP BY p.manufacturer;

#Using LEFT OUTER JOIN
SELECT p.manufacturer, sum(f.distance) as Total_Distance
FROM planes p LEFT OUTER JOIN flights f ON p.tailnum = f.tailnum
WHERE f.year = '2013' AND f.month = '7' and f.day = '5'
GROUP BY p.manufacturer;

#Observation : The above two results are same. The reason for both the results are same is the 
#where clause having filter for year, month an day.


#3. I want to find out if there is any relation between high wind gust and flight departure delay. 
# For this, I combined 3 tables :
# a. Airport - which has the location details
# b. Weather - which has the wind gust details. 
# c. Flights - which has the departure delays
#Due to huge data in flights table, I restricted my search to one day's data.
#Looking at one days data, I see that there is no positive correlation between wind gust and delays.

SELECT 	a.name as Airport, round(avg(w.wind_gust), 2) as Average_WindGust, round(avg(f.dep_delay), 2) as Average_DepartureDelay
FROM 	airports a 
		INNER JOIN flights f 
			ON f.origin = a.faa 
		INNER JOIN weather w 
			ON w.origin = a.faa 
WHERE 	f.year = '2013' and f.month = '5' and f.day = '10'
GROUP 	BY a.name
ORDER 	BY Average_WindGust desc;







