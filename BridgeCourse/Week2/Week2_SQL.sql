--2. Are older planes more likely to be delayed?
--
--Assumptions - Arrival delay is only considered here for calculating the delays

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

SELECT * FROM weather LIMIT 10
SELECT * FROM flights LIMIT 10

SELECT f.year, f.month, f.day, f.hour, f.origin, f.dep_delay, w.visib
--       w.temp, w.dewp, w.humid, w.wind_dir, w.wind_gust,
--       w.precip, w.pressure, w.visib
FROM flights f, weather w
WHERE f.year = w.year and f.month = w.month and f.day = w.day 
      and f.hour = w.hour and f.origin = w.origin and f.dep_delay <> 0
      and f.origin in ('JFK', 'LGA', 'EWR')
ORDER BY f.dep_delay desc
LIMIT 10

select distinct(precip) from weather



   