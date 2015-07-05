--Show the total number of flights
select count(*) from flights;

--Show the total number of flights by airline (carrier).
select carrier, count(*) from flights group by carrier;

--Show all of the airlines, ordered by number of flights in descending order
select carrier, count(*) as num_flights from flights group by carrier order by num_flights desc;

--Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
select carrier, count(*) as num_flights from flights group by carrier order by num_flights desc LIMIT 5;

--Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
--flights in descending order.
select carrier, count(*) as num_flights from flights where distance >= 1000 group by carrier order by num_flights desc LIMIT 5;

--List down the number of planes each manufacturer released under each model , every year
select year, manufacturer, model, count(*) as num_planes from planes 
where year IS NOT null
group by manufacturer, model , year
order by year desc, manufacturer, model
