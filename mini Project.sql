--extract released country from released column
select released,
substring(released,charindex('(',released)+ 1, 
charindex(')',released) - charindex('(',released) - 1) 
AS Release_Country
from dbo.movies;

--Inserting extracted column into a new table
Select *, 
substring(released,charindex('(',released)+ 1, 
charindex(')',released) - charindex('(',released) - 1) 
AS Release_Country
into movies_prep
from dbo.movies;

select * from movies_prep

--1. What are the top 3 ratings for movies released in the United States?
select top 3 rating, count(rating) AS 'Movie Rating' 
from movies_prep
where Release_Country = 'United States'
group by rating
order by count(rating)desc

--create a new table for Q1
select
top 3 rating, count(rating) AS 'Movie Rating'
into Q1
from movies_prep
where Release_Country = 'United States'
group by rating
order by count(rating)desc

--2.What are the Top 10 companies based on number of movies?
select top 10 company, count(name) AS 'Number of movies' 
from movies_prep
group by company
order by count(name)desc

--create table for Q2
select top 10 company, count(name) AS 'Number of movies' 
into Q2
from movies_prep
group by company
order by count(name)desc

--3.What are the Top 10 companies in the United Kingdom based on movie revenue?
select top 10 company, sum(gross) AS 'Total Revenue' 
from movies_prep
where Release_Country = 'United Kingdom'
group by company
order by sum(gross)desc

--create table for Q3
select top 10 company, sum(gross) AS 'Total Revenue' 
into Q3
from movies_prep
where Release_Country = 'United Kingdom'
group by company
order by sum(gross)desc

--4.What are the Top 10 companies in the countries that begin with “I” based on the movie revenue?
select top 10 company, sum(gross) AS 'Total Revenue' 
from movies_prep
where Release_Country like 'I%'
group by company
order by sum(gross)desc

--create table for Q4
select top 10 company, sum(gross) AS 'Total Revenue' 
into Q4
from movies_prep
where Release_Country like 'I%'
group by company
order by sum(gross)desc

--5.What is the average movie time for movies in France and any country that contains Germany
select round(avg(runtime),2) AS 'Average movie time' 
from movies_prep
where Release_Country = 'France' or Release_Country = '%Germany%'

--create table for Q5
select round(avg(runtime),2) AS 'Average movie time' 
into Q5
from movies_prep
where Release_Country = 'France' or Release_Country = '%Germany%'

--6.As a single analyst, what is the average movie time for movies with title that contain ‘love’?
select round(avg(runtime),2) AS 'Average movie time for love' 
from movies_prep
where name like '%love%'

--create table for Q6
select round(avg(runtime),2) AS 'Average movie time for love' 
into Q6
from movies_prep
where name like '%love%'

--7.Which company has generated most revenue? How much did they make in 2018?
select company, sum(gross) AS 'Total Revenue' 
from movies_prep
group by company
order by sum(gross) desc


select sum(gross) AS 'Total Revenue in 2018'
from movies_prep
where company = 'Warner Bros.' and year = 2018

--create table for Q7
select sum(gross) AS 'Total Revenue in 2018'
into Q7
from movies_prep
where company = 'Warner Bros.' and year = 2018

--8.Which star has been featured in most movies? What are the top 3 movies genre he/she has acted in?
select star, count(name) AS 'Most Featured movies' 
from movies_prep
group by star
order by count(name) desc

select top 3 genre, count(genre) AS 'Top 3 genre'
from movies_prep
where star = 'Nicolas Cage' 
group by genre
order by count(genre) desc

--create table for Q8
select top 3 genre, count(genre) AS 'Top 3 genre'
into Q8
from movies_prep
where star = 'Nicolas Cage' 
group by genre
order by count(genre) desc

--9.Which movie genre is most popular in India? What is the average revenue generated for this movie genre in India?
select genre, count(genre) AS 'Most Popular movie genre' 
from movies_prep
where country = 'India'
group by genre
order by count(genre)desc

select avg(gross) AS 'Average Revenue'
from movies_prep
where genre = 'Action' and country = 'India'

--create table for Q9
select avg(gross) AS 'Average Revenue'
into Q9
from movies_prep
where genre = 'Action' and country = 'India'

--10.How many movies start with a consonant letter?
select count(name) AS 'No of Movies with Consonant Start'
from movies_prep
where name like '[b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z]%'

--create table for Q10
select count(name) AS 'No of Movies with Consonant Start'
into Q10
from movies_prep
where name like '[b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z]%'

