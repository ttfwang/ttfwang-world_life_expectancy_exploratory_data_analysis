-- Data Cleaning Script

-- 1. Inspect the data
SELECT * FROM world_life_expectancy;

-- 2. Locate any duplication
SELECT Country, Year, CONCAT(Country, Year) AS CountryYear
FROM world_life_expectancy;

-- 3. Find duplication
SELECT Country, Year, CONCAT(Country, Year) AS CountryYear, COUNT(CONCAT(Country, Year)) AS Count
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1;

-- 4. Find row_id that have duplication
SELECT *
FROM (
    SELECT Row_ID, CONCAT(Country, Year) AS CountryYear, ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
    FROM world_life_expectancy
) AS row_table
WHERE row_num > 1;

-- 5. Remove the duplicated Row_ID
DELETE FROM world_life_expectancy
WHERE ROW_ID IN (
    SELECT Row_ID
    FROM (
        SELECT Row_ID, CONCAT(Country, Year) AS CountryYear, ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
        FROM world_life_expectancy
    ) AS row_table
    WHERE row_num > 1
);

-- 6. Check the table again
SELECT * FROM world_life_expectancy;

-- 7. Identify missing data
SELECT * FROM world_life_expectancy WHERE Status = '';

-- 8. Update missing 'Status' data using self-join
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = '' AND t2.Status <> '' AND t2.Status = 'Developing';

-- 9. Update the remaining missing 'Status' data for developed countries
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = '' AND t2.Status <> '' AND t2.Status = 'Developed';

-- 10. Handle missing 'Life expectancy' data
SELECT * FROM world_life_expectancy WHERE `Life expectancy` = '';

-- 11. Calculate average value to fill missing 'Life expectancy'
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2)
WHERE t1.`Life expectancy` = '';
