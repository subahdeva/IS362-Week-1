-- 1. How many airplanes have listed speeds?  
-- What is the minimum listed speed and the maximum listed speed?
SELECT * FROM planes WHERE speed is NOT NULL
ORDER BY speed DESC;
-- When running the above query, there are 23 planes that have listed speeds. 
-- The maximum speed is at 432 and the minimum speed is at 90. 

-- 2. What is the total distance flown by all of the planes in January 2013?  
SELECT sum(distance) FROM flights.flights
WHERE year = '2013' AND month = 1
ORDER BY distance DESC;

-- When running the above query, the total distance flown by all of the planes in January 2013 are 
-- 27,188,805

-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT sum(distance) FROM flights.flights
WHERE year = '2013' AND month = 1 AND tailnum = ''
ORDER BY distance DESC;

-- Total distance of planes flown in January 2013 where the tailnum is missing is 81,763

-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
SELECT planes.manufacturer, sum(flights.distance) as totaldistance 
FROM flights.flights INNER JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.month = 7 AND flights.day = 5 AND flights.year = 2013 AND planes.manufacturer IS NOT NULL
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer DESC;

-- MCDONNELL DOUGLAS CORPORATION, 4767
-- MCDONNELL DOUGLAS AIRCRAFT CO, 15690
-- MCDONNELL DOUGLAS, 7486
-- GULFSTREAM AEROSPACE, 1157
-- EMBRAER, 77909
-- DOUGLAS, 1089
-- CESSNA, 2898
-- CANADAIR, 1142
-- BOMBARDIER INC, 31160
-- BOEING, 335028
-- BARKER JACK L, 937
-- AMERICAN AIRCRAFT INC, 2199
-- AIRBUS INDUSTRIE, 78786
-- AIRBUS, 195089


-- Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN.  
-- How do your results compare?

-- The results are the same with an INNER JOIN as they are with a LEFT OUTER JOIN.

-- 4. Write and answer at least one question of your own choosing that joins information 
-- from at least three of the tables in the flights database. 

-- What's the average wind speed in the month of February of 2013?

SELECT distinct AVG(wind_speed), month, year FROM flights.weather 
WHERE month = 2 AND year = 2013
GROUP BY month, year;

-- 12.183518807749634




