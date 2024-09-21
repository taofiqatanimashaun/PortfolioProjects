--deleting and adding columns

  select * from Trips_by_Distance_2019
  where date between '2020-12-01' and '2020-12-31'
  order by date
  delete from Trips_by_Distance_2021
  where date = '2020-12-01'

  SELECT 
  --UNION ALL DATASETS
  SELECT *
  INTO Trips_Dataset_2019_2022
  FROM trips_by_Distance_2019
  UNION 
  SELECT * FROM Trips_by_Distance_2020
  UNION 
  SELECT * FROM Trips_by_Distance_2021
  UNION 
  SELECT * FROM trips_by_Distance_2022


  --REPLACE NULL VALUES
  SELECT Level
      ,Date
      ,DATENAME(Month,Date) AS Month_Name
      ,DATENAME(WeekDay,Date) AS Day_Name
      ,YEAR(Date) AS Year
      ,ISNULL(State_FIPS, 0) AS State_FIPS_Full
      ,ISNULL(State_Postal_Code, 'NA') AS State_Postal_Code_Full
      ,ISNULL(County_FIPS, 0) AS County_FIPS_Full
      ,ISNULL(County_Name, 'NA') AS County_Name_Full
      ,ISNULL(Population_Staying_at_Home, 0) AS Population_Staying_at_Home_Full
      ,ISNULL(Population_Not_Staying_at_Home, 0) AS Population_Not_Staying_at_Home_Full
      ,ISNULL(Number_of_Trips, 0) AS Number_of_Trips_Full
      ,ISNULL(Number_of_Trips_1, 0) AS Number_of_Trips_1_Full
      ,ISNULL(Number_of_Trips_1_3, 0) AS Number_of_Trips_1_3_Full
      ,ISNULL(Number_of_Trips_3_5, 0) AS Number_of_Trips_3_5_Full
      ,ISNULL(Number_of_Trips_5_10, 0) AS Number_of_Trips_5_10_Full
      ,ISNULL(Number_of_Trips_10_25, 0) AS Number_of_Trips_10_25_Full
      ,ISNULL(Number_of_Trips_25_50, 0) AS Number_of_Trips_25_50_Full
      ,ISNULL(Number_of_Trips_50_100, 0) AS Number_of_Trips_50_100_Full
      ,ISNULL(Number_of_Trips_100_250, 0) AS Number_of_Trips_100_250_Full
      ,ISNULL(Number_of_Trips_250_500, 0) AS Number_of_Trips_250_500_Full
      ,ISNULL(Number_of_Trips_500, 0) AS Number_of_Trips_500_Full
      ,Row_ID
      ,Week
	   ,Month
      ,CASE 
        WHEN MONTH(Date) IN (1,2,12) THEN 'Winter'
        WHEN MONTH(Date) IN (3,4,5) THEN 'Spring'
        WHEN MONTH(Date) IN (6,7,8) THEN 'Summer'
        WHEN MONTH(Date) IN (9,10,11) THEN 'Autumn'
ELSE 'NA'
END AS 'Seasons'
INTO Trips_Dataset_2019_2022_Final
FROM Trips_Dataset_2019_2022

 --population by level and year(Test)
 SELECT SUM(Population_Staying_at_Home_Full)
 FROM Trips_Analysis_2019_2022
 WHERE year = '2019'

 --data by postal code (test)
 SELECT distinct level, sum( population_staying_at_home) FROM Trips_by_Distance_2019
 WHERE State_Postal_Code = 'NV'
 group by level
 select * from Trips_by_Distance_2019
 --Test
 SELECT SUM(population_staying_at_home) as sum
 from Trips_by_Distance_2019
 WHERE State_Postal_Code = 'NV' AND date = '2019-01-07' AND level = 'County' 

 --Get data based on just state level
 SELECT year, SUM(CAST(Population_Staying_at_Home_Full AS bigint)) AS SPSAH, SUM(CAST(Population_not_staying_at_home_full AS bigint)) AS SPNSAH
 FROM Trips_Dataset_2019_2023_Final
 WHERE year between 2019 and 2022 AND LEVEL = 'state'
 GROUP BY year

 --final draft for analysis on just state and between 2019 and 2022
 SELECT *
 FROM Trips_Dataset_2019_2023_Final
 WHERE year between 2019 and 2022 AND Level ='state'
 select Row_ID into Fact_trip_table from Trips_Analysis_2019_2022

 
 
