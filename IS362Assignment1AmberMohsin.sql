SELECT COUNT(*) FROM planes
	WHERE speed IS NOT NULL;
SELECT COUNT(speed) FROM planes;

SELECT MAX(speed) FROM planes;
SELECT MIN(speed) FROM planes;

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights;
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1);

SELECT COUNT(tailnum) FROM flights;		# 334,264
SELECT COUNT(*) FROM flights
	WHERE tailnum IS NOT NULL;			# 334,264
SELECT COUNT(*) FROM flights
	WHERE tailnum IS NULL;				#   2,512

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1)
    AND tailnum IS NULL;
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

#What planes had the most delays grouped by manufacturer

SELECT COUNT(*) AS 'Planes', SUM(delays) AS 'Number of Delays', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN planes ON flights.planes = flights.manufacturer
GROUP BY manufacturer;