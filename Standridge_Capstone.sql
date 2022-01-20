# Ryan Standridge 
# Walmart Retail Sales Analysis (2010-2012)

# Using the Walmart Schema

USE Walmart;

# First look at the data set 
# (saved as Walmart_Sales_SQL.csv)
SELECT	Store, 
		DATE_FORMAT(Date, "%Y-%m-%d") AS Date, 
        Weekly_Sales, 
        Holiday_Flag,
        Temperature,
        Fuel_Price,
        CPI,
        Unemployment
        from Walmart.walmart_store_sales;

#######################################################
# Exploratory Data Analysis
#######################################################

## How many weeks are recorded for each year

# 48
SELECT Store, Date FROM Walmart.walmart_store_sales
WHERE Store = 1 AND (Date Between "2010-02-05" AND "2010-12-31");

# 52
SELECT Store, Date FROM Walmart.walmart_store_sales
WHERE Store = 1 AND (Date Between "2011-01-07" AND "2011-12-30");

# 43
SELECT Store, Date FROM Walmart.walmart_store_sales
WHERE Store = 1 AND (Date Between "2012-01-06" AND "2012-10-26");

#######################################################

## Creating new tables to visualize

# Store averages for each variable (minus date) 
# (saved as Store_Avgs.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Avg_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Avg_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Avg_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Avg_CPI,
        ROUND(AVG(Unemployment), 2) AS Avg_Unemployment
        FROM Walmart.walmart_store_sales
GROUP BY Store
ORDER BY Avg_Weekly_Sales DESC;

# Store averages for each variable (minus date) for non holiday days 
# (saved as Holiday_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS NonHoliday_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS NonHoliday_Temp,
        ROUND(AVG(Fuel_Price), 2) AS NonHoliday_Fuel_Price,
        ROUND(AVG(CPI), 2) AS NonHoliday_CPI,
        ROUND(AVG(Unemployment), 2) AS NonHoliday_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 0
GROUP BY Store
ORDER BY NonHoliday_Weekly_Sales DESC;

# Store averages for each variable (minus date) for only holiday days 
# (saved as NonHoliday_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Holiday_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Holiday_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Holiday_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Holiday_CPI,
        ROUND(AVG(Unemployment), 2) AS Holiday_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 1
GROUP BY Store
ORDER BY Holiday_Weekly_Sales DESC
;

# Store averages for each variable (minus date and holiday_flag) for the Super Bowl in years 2010-2012
# (saved as SuperBowl_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS SB_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS SB_Temp,
        ROUND(AVG(Fuel_Price), 2) AS SB_Fuel_Price,
        ROUND(AVG(CPI), 2) AS SB_CPI,
        ROUND(AVG(Unemployment), 2) AS SB_Unemployment
        FROM Walmart.walmart_store_sales
WHERE (Date = '2010-02-12' OR Date = '2011-02-11' OR Date = '2012-02-10')
GROUP BY Store
ORDER BY SB_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday_flag) for Labour Day in years 2010-2012
# (saved as LabourDay_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS LD_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS LD_Temp,
        ROUND(AVG(Fuel_Price), 2) AS LD_Fuel_Price,
        ROUND(AVG(CPI), 2) AS LD_CPI,
        ROUND(AVG(Unemployment), 2) AS LD_Unemployment
        FROM Walmart.walmart_store_sales
WHERE (Date = '2010-09-10' OR Date = '2011-09-09' OR Date = '2012-09-07')
GROUP BY Store
ORDER BY LD_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday_flag) for Thanksgiving in years 2010-2011
# (saved as Thanksgiving_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Thanksgiving_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Thanksgiving_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Thanksgiving_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Thanksgiving_CPI,
        ROUND(AVG(Unemployment), 2) AS Thanksgiving_Unemployment
        FROM Walmart.walmart_store_sales
WHERE (Date = '2010-11-26' OR Date = '2011-11-25')
GROUP BY Store
ORDER BY Thanksgiving_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday_flag) for Christmas in years 2010-2011
# (saved as Christmas_Sales.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Christmas_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Christmas_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Christmas_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Christmas_CPI,
        ROUND(AVG(Unemployment), 2) AS Christmas_Unemployment
        FROM Walmart.walmart_store_sales
WHERE (Date = '2010-12-31' OR Date = '2011-12-30')
GROUP BY Store
ORDER BY Christmas_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday flag) for nonholiday February weeks
# (saved as Feb_NH_Avgs.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Feb_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Feb_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Feb_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Feb_CPI,
        ROUND(AVG(Unemployment), 2) AS Feb_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 0 AND ((Date >= '2010-02-12' AND Date <= '2010-02-26') 
	OR (Date >= '2011-02-04' AND Date <= '2011-02-25')
    OR (Date >= '2012-02-03' AND Date <= '2012-02-24'))
GROUP BY Store
ORDER BY Feb_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday flag) for nonholiday September weeks
# (saved as Sep_NH_Avgs.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Sep_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Sep_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Sep_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Sep_CPI,
        ROUND(AVG(Unemployment), 2) AS Sep_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 0 AND ((Date >= '2010-09-03' AND Date <= '2010-09-24') 
	OR (Date >= '2011-09-02' AND Date <= '2011-09-30')
    OR (Date >= '2012-09-07' AND Date <= '2012-09-28'))
GROUP BY Store
ORDER BY Sep_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday flag) for nonholiday November weeks
# (saved as Nov_NH_Avgs.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Nov_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Nov_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Nov_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Nov_CPI,
        ROUND(AVG(Unemployment), 2) AS Nov_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 0 AND ((Date >= '2010-11-05' AND Date <= '2010-11-26') 
	OR (Date >= '2011-11-04' AND Date <= '2011-11-25'))
GROUP BY Store
ORDER BY Nov_Weekly_Sales DESC;

# Store averages for each variable (minus date and holiday flag) for nonholiday December weeks
# (saved as Dec_NH_Avgs.csv)

SELECT 	Store, 
		ROUND(AVG(Weekly_Sales), 2) AS Dec_Weekly_Sales, 
        ROUND(AVG(Temperature), 2) AS Dec_Temp,
        ROUND(AVG(Fuel_Price), 2) AS Dec_Fuel_Price,
        ROUND(AVG(CPI), 2) AS Dec_CPI,
        ROUND(AVG(Unemployment), 2) AS Dec_Unemployment
        FROM Walmart.walmart_store_sales
WHERE Holiday_Flag = 0 AND ((Date >= '2010-12-03' AND Date <= '2010-12-31') 
	OR (Date >= '2011-12-02' AND Date <= '2011-12-30'))
GROUP BY Store
ORDER BY Dec_Weekly_Sales DESC;

# Store Averages, Non holiday and holiday joined
# (saved as Holiday_Nonholiday_Avgs.csv)

SELECT * FROM Walmart.holiday_sales 
INNER JOIN Walmart.nonholiday_sales ON Walmart.holiday_sales.Store = Walmart.nonholiday_sales.Store;

# Store Averages, Non holiday feb weeks joined with super bowl
# (saved as Feb_vs_SB.csv)

SELECT * FROM Walmart.feb_nh_avgs
INNER JOIN Walmart.superbowl_sales ON Walmart.feb_nh_avgs.Store = Walmart.superbowl_sales.Store;

# Store Averages, Non holiday Sep weeks joined with Labour day
# (saved as Sep_vs_LD.csv)

SELECT * FROM Walmart.sep_nh_avgs
INNER JOIN Walmart.labourday_sales ON Walmart.sep_nh_avgs.Store = Walmart.labourday_sales.Store;

# Store Averages, Non holiday Nov weeks joined with thanksgiving
# (saved as Nov_vs_TG.csv)

SELECT * FROM Walmart.nov_nh_avgs
INNER JOIN Walmart.thanksgiving_sales ON Walmart.nov_nh_avgs.Store = Walmart.thanksgiving_sales.Store;

# Store Averages, Non holiday Dec weeks joined with christmas
# (saved as Dec_vs_Christmas.csv)

SELECT * FROM Walmart.dec_nh_avgs
INNER JOIN Walmart.christmas_sales ON Walmart.dec_nh_avgs.Store = Walmart.christmas_sales.Store;