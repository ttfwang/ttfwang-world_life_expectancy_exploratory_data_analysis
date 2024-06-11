# World Life Expectancy Exploratory Data Analysis

## Project Overview

This practice project is a part of the data analytics lesson offered by [Analyst Builder](https://www.analystbuilder.com/courses/mysql-for-data-analytics/lesson/world-life-expectancy-exploratory-data-analysis). 

This project focuses on analyzing real-world life expectancy data using MySQL. The primary objective is to clean the dataset and explore various factors affecting life expectancy across different countries over the past 15 years. The project is divided into two main stages: data cleaning and exploratory data analysis (EDA).

## Objectives

- **Data Cleaning:** Remove duplicates, handle missing values, and standardize data for consistency.
- **Exploratory Data Analysis:** Identify patterns and correlations between life expectancy and other variables such as GDP, BMI, and country development status.

## Data

The data used in this project is sourced from a publicly available dataset containing life expectancy information for various countries from 2007 to 2022.

## Files in this Repository

- [README.md](https://github.com/ttfwang/world_life_expectancy_exploratory_data_analysis/edit/main/README.md): Documentation of the project.
- [data_cleaning.sql](https://github.com/ttfwang/world_life_expectancy_exploratory_data_analysis/blob/main/SQL%20Script/data_cleaning.sql): SQL script for data cleaning.
- [exploratory_analysis.sql](https://github.com/ttfwang/world_life_expectancy_exploratory_data_analysis/blob/main/SQL%20Script/exploratory_analysis.sql): SQL script for exploratory data analysis.
- [world_life_expectancy.csv](https://github.com/ttfwang/world_life_expectancy_exploratory_data_analysis/blob/main/raw_data_WorldLifeExpectancy.csv): Raw data file in CSV format.

## Data Cleaning Process

1. **Inspect the Data:** Initial exploration of the dataset.
2. **Identify and Remove Duplicates:** Locate and delete duplicate records.
3. **Handle Missing Values:** Identify missing data and fill gaps appropriately.
4. **Standardize Data:** Ensure consistency in data formatting.

## Exploratory Data Analysis

1. **Life Expectancy Trends:** Analyze minimum, maximum, and average life expectancy by country and year.
2. **GDP Correlation:** Examine the relationship between GDP and life expectancy.
3. **Status Correlation:** Compare life expectancy between developed and developing countries.
4. **BMI Analysis:** Investigate the correlation between BMI and life expectancy.

## Challenges and Insights

### Challenges

- **Data Quality Issues:** Encountered several instances of zero values for life expectancy, which required careful handling to avoid skewed results.
- **Missing Data:** Faced challenges in filling missing values accurately, especially for the 'Life expectancy' column.
- **Updating Data Efficiently:** Initial attempts to update the 'Status' column faced issues due to subquery constraints.

### Insights

- **Use of Self-Joins:** Learned the effectiveness of self-joins in updating and filling missing data based on related records.
- **Correlation Patterns:** Observed clear correlations between GDP and life expectancy, highlighting the impact of economic factors on health.
- **Data Visualization Needs:** Realized the importance of visual tools like Tableau for better pattern recognition and presentation.

## Findings and Improvements

1. **Lowest Average Income States:** Puerto Rico has the lowest average income at $27,841.7 per person per year, followed by Mississippi at $49,385 per person per year, Arkansas, West Virginia, and Alabama.
2. **Highest Average Income States:** Columbia has the highest average income at $90,668 per person per year, followed by Connecticut, New Jersey, Maryland, and Massachusetts.
3. **Highest Median Income State:** New Jersey is the highest median income state at $126,772.7 per person per year, followed by Wyoming, Alaska, Connecticut, and Massachusetts.
4. **Lowest Median Income State:** Puerto Rico is the lowest median income state at $22,522.4 per person per year.
5. **Income by Place Type:** Municipality has the highest average income but lacks sufficient representation with only one city. Urban and Community types have significantly lower incomes compared to City, Track, and Municipality types.
6. **Community Type Analysis:** Puerto Rico is the only state with the Community type, explaining its lowest average income status.
7. **Average Income by State and City:** Delta Junction in Alaska has the highest average income, with many high-income cities located in the northeastern US.

## Conclusion

This project demonstrates the use of MySQL for data cleaning and exploratory data analysis, showcasing skills in handling real-world data, identifying patterns, and deriving insights.

## How to Use

1. Load the `world_life_expectancy.csv` file into your MySQL database.
2. Run the `data_cleaning.sql` script to clean the data.
3. Execute the `exploratory_analysis.sql` script to perform exploratory data analysis.

## Acknowledgment

This project is a part of the data analytics lesson offered by [Analyst Builder](https://www.analystbuilder.com/courses/mysql-for-data-analytics/lesson/world-life-expectancy-exploratory-data-analysis).


## Author

Tengfei Wang
