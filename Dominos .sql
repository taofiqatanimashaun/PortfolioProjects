--creating a database
create database DOMINOS;

--create branch table
create table Branches(
BR_CODE int primary key,
BR_NAME varchar(20));

--create product table
Create table Products(
PRD_CODE int primary key,
PRD_NAME varchar(25),
PRD_PRICE decimal(6,2));

--create sales table
Create table Sales(
SAL_SN int primary key,
SAL_BR_CODE int,
SAL_PRD_CODE int,
SAL_DATE date,
SAL_TIME time,
SAL_QTY int,
foreign key(SAL_BR_CODE) references Branches(BR_CODE),
foreign key(SAL_PRD_CODE) references Products(PRD_CODE) on delete set null);

--Inserting into Product table
INSERT INTO [DOMINOS].[dbo].[Products] (PRD_CODE,PRD_NAME,PRD_PRICE)
SELECT Product_code, Product_Name, Product_Price FROM [DOMINOS].[dbo].[Domino's Pizza Product Data]

--inserting into branch table
INSERT INTO [DOMINOS].[dbo].[Branches] (BR_CODE,BR_NAME)
SELECT Branch_code, Branch_Name FROM [DOMINOS].[dbo].[Domino's Pizza Branch Data]

--inserting into sales table
INSERT INTO [DOMINOS].[dbo].[Sales] (SAL_SN,SAL_BR_CODE,SAL_PRD_CODE,SAL_DATE,SAL_TIME,SAL_QTY)
SELECT S_N,Branch_code,product_code,Date,Time,Quantity FROM [DOMINOS].[dbo].[Domino's Pizza Sales Data]

select * from [DOMINOS].[dbo].[Sales]
drop database tao;






