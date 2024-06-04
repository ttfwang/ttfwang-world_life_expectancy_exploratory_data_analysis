-- Exploratory Data Analysis Script

-- 1. Inspect the data
SELECT * FROM world_life_expectancy;

-- 2. Min and max life expectancy by country
SELECT Country, MIN(`Life expectancy`) AS Min_Life_Expectancy, MAX(`Life expectancy`) AS Max_Life_Expectancy
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND MAX(`Life expectancy`) <> 0
ORDER BY Country DESC;

-- 3. Increase of life expectancy over the past 15 years
SELECT Country, 
       MIN(`Life expectancy`) AS Min_Life_Expectancy, 
       MAX(`Life expectancy`) AS Max_Life_Expectancy, 
       ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`), 1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND MAX(`Life expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC;

-- 4. Average life expectancy by year
SELECT Year, ROUND(AVG(`Life expectancy`), 1) AS Avg_Life_Expectancy
FROM world_life_expectancy
WHERE `Life expectancy` <> 0 
GROUP BY Year
ORDER BY Year DESC;

-- 5. Correlation between GDP and life expectancy
SELECT Country, 
       ROUND(AVG(`Life expectancy`), 1) AS Avg_Life_Expectancy, 
       ROUND(AVG(GDP), 1) AS Avg_GDP
FROM world_life_expectancy
WHERE `Life expectancy` <> 0 AND GDP > 0
GROUP BY Country
ORDER BY Avg_GDP DESC;

-- 6. Categorize countries by GDP
SELECT 
    SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
    ROUND(AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END), 1) AS High_GDP_Life_Expectancy,
    SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
    ROUND(AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END), 1) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy;

-- 7. Correlation between status and life expectancy
SELECT Status, ROUND(AVG(`Life expectancy`), 1) AS Avg_Life_Expectancy
FROM world_life_expectancy
GROUP BY Status;

-- 8. Correlation between BMI and life expectancy
SELECT Country, 
       ROUND(AVG(`Life expectancy`), 1) AS Avg_Life_Expectancy, 
       ROUND(AVG(BMI), 1) AS Avg_BMI
FROM world_life_expectancy
WHERE `Life expectancy` <> 0 AND BMI > 0
GROUP BY Country
ORDER BY Avg_BMI DESC;

-- 9. Rolling total of Adult Mortality for countries containing 'United'
SELECT Country, Year, `Life expectancy`, `Adult Mortality`, 
       SUM(`Adult Mortality`) OVER (PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%';
