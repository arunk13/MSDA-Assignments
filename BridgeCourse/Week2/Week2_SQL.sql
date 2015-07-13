--1. 

--To analyze the impact of weather parameters on the flight delays, I have taken - 
--1. weather pressure
--2. visibility
--
--Next I searched for the top delays in flights and checked the delayes against the corresponsing hourly delay and pressure. 
--To understand if the visibility or pressure has impacted the delay, i calculated the average visibility and pressure for that day.
--Comparing the delay , the visibility/pressure for that hour and how deviant was the visibility/pressure from the average visibility/pressure
--will give me a idea about the contribution of these weather parameters towards the delay.

SELECT w.year, w.month, w.day, w.hour, f.dep_delay, w.visib, w1.visib_avg, w.visib - w1.visib_avg as visibility_deviation,
w.pressure, w1.pressure_avg, w.pressure - w1.pressure_avg as pressure_deviation
FROM weather w, flights f,
(SELECT w.year as year, w.month as month, w.day as day, avg(w.visib) as visib_avg, avg(w.pressure) as pressure_avg 
FROM weather w
GROUP BY w.year, w.month, w.day) w1
WHERE w.year = f.year and
      w.month = f.month and
      w.hour = f.hour and
      w.day =  f.day and
      w.origin = f.origin and
      w.year = w1.year and
      w.month = w1.month and
      w.day = w1.day and
      f.dep_delay > 0 and --- Only considering clean data
      w.pressure > 0 and--- Only considering clean data
      f.origin in ('JFK', 'LGA', 'EWR')
order by f.dep_delay desc LIMIT 100

--2. Are older planes more likely to be delayed?
--
--Assumptions - Arrival delay is only considered here for calculating the delays
--I am calculating the delays of the flight and year of the model
--To understand which is an old plane, I have grouped the year of the model in decades.

SELECT model_decade, sum(total_delay) as total_delay
FROM
(
SELECT p.year as model_year, (p.year/10)*10 as model_decade, sum(f.arr_delay) as total_delay FROM flights f INNER JOIN planes p
ON f.tailnum = p.tailnum
WHERE 
f.arr_delay > 0 and p.year > 0
GROUP BY p.year
ORDER BY total_delay desc
) yearly_data
GROUP BY model_decade 
ORDER BY total_delay desc

--

--------------

3.
--Problem statement- Are the flights getting used to their maximum capacity ?
--I need 3 parameters here - 
--1. Popular destinations by climates(Summer/Fall) - This can be calculated by finding destinations of passenger booking to various places from NYC
--2. Flights operated to various destinations by airlines
--3. Capacity used in each flight
--With above 3 parameters, I can find the if airlines are operating to the above identified popular destinations, and f their flights are completely 
--booked or not.






   