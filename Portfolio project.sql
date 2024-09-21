--Sql query to union all crimes dataset
select * 
into crimes
from [dbo].[Crimes_-_2020]
union 
select * from [dbo].[Crimes_-_2021]
union 
select * from [dbo].[Crimes_-_2022]
union 
select * from [dbo].[Crimes_-_2023]

--sql query to clean the crimes dataset and import into a new table

SELECT 
ID
, Case_Number
   , Date
   , CAST(DATE AS TIME) AS Time
, DATENAME(MONTH, DATE) AS Month
, DATENAME(DAY, DATE) AS Day
, DATENAME(WEEKDAY, DATE) AS Weekday
, Year
, Block
, IUCR
, Primary_Type
, Description
, ISNULL(Location_Description, 'NA') AS Location_DescriptionFull
, Arrest
, Domestic
, Beat
, District
, ISNULL(Ward, 0.0 ) AS Ward_Full
, ISNULL(Community_Area, 0.0) AS Community_Area_full
, ISNULL(Latitude, 0.0) AS Latitude_full
   , ISNULL(Longitude, 0.0) AS Longitude_full
, ISNULL(Location, 'NA') AS Location_full
, ISNULL(Census_Tracts, 0.0) AS Census_Tracts_Full
INTO Crime_Prep_final
FROM 
crimes
ORDER BY Date ASC;
