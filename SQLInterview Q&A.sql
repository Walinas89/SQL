---Assighnment----

---create table---
CREATE TABLE EmadeconsultingLOCATION
(
LOCATION_ID INT not null,
CITY VARCHAR (20) null,
)

---load data ---
INSERT INTO EmadeconsultingLOCATION
VALUES
(122, 'NEW YORK'),
(123, 'DALLAS'), 
(124, 'CHICAGO'), 
(167, 'BOSTON')

Select *
From EmadeconsultingLOCATION

---create Table---- 
CREATE TABLE EmadeconsultingDEPARTMENT
(
DEPARTMENT_ID INT not null,
NAME VARCHAR(20) null,
LOCATION_ID INT not null
)

---Load Data---
INSERT INTO EmadeconsultingDEPARTMENT
VALUES
(10, 'ACCOUNTING', 122),
(20, 'SALES', 124),
(30, 'RESEARCH', 123),
(40, 'OPERATIONS', 167)

select *
From EmadeconsultingDEPARTMENT

-----Create Table----
CREATE TABLE EmadeconsultingJOB
(
JOB_ID INT not null, 
DESIGNATION VARCHAR (20) null
)

----Load Data-----
INSERT INTO EmadeconsultingJOB 
VALUES
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President')
select *from EmadeconsultingJOB 
---Create table---
CREATE TABLE Emadeconsulting_EMPLOYEE
(
EMPLOYEE_ID INT not null,
Last_Name VARCHAR(20) null,
First_Name VARCHAR(20) null,
Middle_Name VARCHAR(20) null,
Job_ID INT not null,
Manager_ID INT not null, 
Hire_Date DATE null,
Salary Money null,
Comm INT null,
Department_ID INT not null
)

---Load Data---
INSERT INTO Emadeconsulting_EMPLOYEE
VALUES
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '20-FEB-85', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30)
select *from Emadeconsulting_EMPLOYEE--QUESTION 1- DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES 
/**Assuming Salary less than 1000 is Grade A
Salary between 1001 and 2000 is Grade B
Salary between 2001 and 2500 is Grade C
Salary between 2001 and 2500 is Grade D..**/

---Solution Display

SELECT 
EMPLOYEE_ID,
Last_Name,
First_Name,
Middle_Name,
Job_ID,
Manager_ID, 
Hire_Date,
Salary ,
Comm,
Department_ID,
CASE 
WHEN Salary <= 1000 THEN 'Grade A'
WHEN Salary between 1001 and 2000 THEN 'Grade B'
WHEN Salary between 2001 and 2500 THEN 'Grade C'
ELSE 'Grade D'
END AS SalaryGrade
FROM Emadeconsulting_EMPLOYEE
ORDER BY Salary

--QUESTION 2 - LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS
SELECT
E.Last_Name, 
E. First_Name,
J.Job_ID,
J.Designation, 
E.Department_ID, 
D.Name AS DEpartmentName
FROM [dbo].[EmadeconsultingJOB] AS J
JOIN [dbo].[Emadeconsulting_EMPLOYEE] AS E
ON J.Job_ID = E.Job_ID
JOIN [dbo].[EmadeconsultingDEPARTMENT] AS D
ON E.Department_ID = D.DEPARTMENT_ID
WHERE D.Name IN ('Accounting', 'Sales')


--QUESTION 3 - DISPLAY THE EMPLOYEES LIST WITH highest SALARY 
SELECT [Last_Name],[First_Name], Salary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
WHERE Salary =
(
SELECT MAX (Salary) AS HighestSalary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
)

--QUESTION 4 - DISPLAY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT 

SELECT
E.Last_Name, 
E. First_Name,
J.Job_ID,
J.Designation, 
E.Department_ID, 
D.Name AS DEpartmentName
FROM [dbo].[EmadeconsultingJOB] AS J
JOIN [dbo].[Emadeconsulting_EMPLOYEE] AS E
ON J.Job_ID = E.Job_ID
JOIN [dbo].[EmadeconsultingDEPARTMENT] AS D
ON E.Department_ID = D.DEPARTMENT_ID
WHERE D.Name = 'Sales'


--QUESTION 5 - FIND OUT THE NO. OF EMPLOYEES WORKING IN SALES DEPARTMENT 

SELECT Name, Count (*) AS NumberOfEmployeeInSales
FROM [dbo].[Emadeconsulting_EMPLOYEE] AS E
JOIN[dbo].[EmadeconsultingDEPARTMENT] AS D 
ON E.Department_ID = D.DEPARTMENT_ID
WHERE D.NAME = 'Sales'
Group BY Name--QUESTION 6 - DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS
SELECT TOP 2*
FROM
(
SELECT
E.Last_Name, 
E. First_Name,
J.Job_ID,
J.Designation, 
E.Salary, 
D.Name AS DEpartmentName
FROM [dbo].[EmadeconsultingJOB] AS J
JOIN [dbo].[Emadeconsulting_EMPLOYEE] AS E
ON J.Job_ID = E.Job_ID
JOIN [dbo].[EmadeconsultingDEPARTMENT] AS D
ON E.Department_ID = D.DEPARTMENT_ID
)A


--QUESTION 7 - LIST OUT EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30

SELECT [Last_Name],[First_Name], Salary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
WHERE Salary =
(
SELECT Salary AS ResearchSalary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
WHERE Department_ID = 30
)

--QUESTION 8 - FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY (***FOR THEIR DEPARTMENT

SELECT [Last_Name],[First_Name], Salary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
WHERE Salary >
(
SELECT AVG (Salary) AS AverageSalary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
)
 
 OR ---so i can get more info

SELECT
E.Last_Name, 
E. First_Name,
J.Job_ID,
J.Designation, 
E.Salary, 
D.Name AS DEpartmentName
FROM [dbo].[EmadeconsultingJOB] AS J
JOIN [dbo].[Emadeconsulting_EMPLOYEE] AS E
ON J.Job_ID = E.Job_ID
JOIN [dbo].[EmadeconsultingDEPARTMENT] AS D
ON E.Department_ID = D.DEPARTMENT_ID
WHERE Salary >
(
SELECT AVG (Salary) AS AverageSalary
FROM [dbo].[Emadeconsulting_EMPLOYEE]
)


--ASSIGNMENT 2-----
Create Database SQLInterview
use SQLInterview
--create Table
CREATE TABLE Emadeconsultingcustomers (
    customer_id integer PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

--LOAD DATA TO THE TABLES
INSERT INTO Emadeconsultingcustomers (customer_id, first_name, last_name, email) 
VALUES
(1, 'John', 'Doe', 'johndoe@email.com'),
(2, 'Jane', 'Smith', 'janesmith@email.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@email.com'),
(4, 'Alice', 'Brown', 'alicebrown@email.com'),
(5, 'Charlie', 'Davis', 'charliedavis@email.com'),
(6, 'Eva', 'Fisher', 'evafisher@email.com'),
(7, 'George', 'Harris', 'georgeharris@email.com'),
(8, 'Ivy', 'Jones', 'ivyjones@email.com'),
(9, 'Kevin', 'Miller', 'kevinmiller@email.com'),
(10, 'Lily', 'Nelson', 'lilynelson@email.com'),
(11, 'Oliver', 'Patterson', 'oliverpatterson@email.com'),
(12, 'Quinn', 'Roberts', 'quinnroberts@email.com'),
(13, 'Sophia', 'Thomas', 'sophiathomas@email.com');

select *
from  Emadeconsultingcustomers 

--create Table--
CREATE TABLE Emadeconsultingproducts (
    product_id integer PRIMARY KEY,
    product_name varchar(100),
    price decimal
);

--LOAD DATA TO THE TABLES
INSERT INTO Emadeconsultingproducts (product_id, product_name, price)
VALUES
(1, 'Product A', 10.00),
(2, 'Product B', 15.00),
(3, 'Product C', 20.00),
(4, 'Product D', 25.00),
(5, 'Product E', 30.00),
(6, 'Product F', 35.00),
(7, 'Product G', 40.00),
(8, 'Product H', 45.00),
(9, 'Product I', 50.00),
(10, 'Product J', 55.00),
(11, 'Product K', 60.00),
(12, 'Product L', 65.00),
(13, 'Product M', 70.00);

select *
from Emadeconsultingproducts 

--create Table
CREATE TABLE Emadeconsultingorders (
    order_id integer PRIMARY KEY,
    customer_id integer,
    order_date date
);

--LOAD DATA TO THE TABLES
INSERT INTO Emadeconsultingorders (order_id, customer_id, order_date) 
VALUES
(1, 1, '2023-05-01'),
(2, 2, '2023-05-02'),
(3, 3, '2023-05-03'),
(4, 1, '2023-05-04'),
(5, 2, '2023-05-05'),
(6, 3, '2023-05-06'),
(7, 4, '2023-05-07'),
(8, 5, '2023-05-08'),
(9, 6, '2023-05-09'),
(10, 7, '2023-05-10'),
(11, 8, '2023-05-11'),
(12, 9, '2023-05-12'),
(13, 10, '2023-05-13'),
(14, 11, '2023-05-14'),
(15, 12, '2023-05-15'),
(16, 13, '2023-05-16');

select *
from Emadeconsultingorders

--create Table
CREATE TABLE Emadeconsultingorder_items (
    order_id integer,
    product_id integer,
    quantity integer
);

--LOAD DATA TO THE TABLES
INSERT INTO Emadeconsultingorder_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 1),
(2, 3, 3),
(3, 1, 1),
(3, 3, 2),
(4, 2, 4),
(4, 3, 1),
(5, 1, 1),
(5, 3, 2),
(6, 2, 3),
(6, 1, 1),
(7, 4, 1),
(7, 5, 2),
(8, 6, 3),
(8, 7, 1),
(9, 8, 2),
(9, 9, 1),
(10, 10, 3),
(10, 11, 2),
(11, 12, 1),
(11, 13, 3),
(12, 4, 2),
(12, 5, 1),
(13, 6, 3),
(13, 7, 2),
(14, 8, 1),
(14, 9, 2),
(15, 10, 3),
(15, 11, 1),
(16, 12, 2),
(16, 13, 3);


---create table order_items----
CREATE TABLE order_items (
    order_id integer,
    product_id integer,
    quantity integer
);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 1),
(2, 3, 3),
(3, 1, 1),
(3, 3, 2),
(4, 2, 4),
(4, 3, 1),
(5, 1, 1),
(5, 3, 2),
(6, 2, 3),
(6, 1, 1),
(7, 4, 1),
(7, 5, 2),
(8, 6, 3),
(8, 7, 1),
(9, 8, 2),
(9, 9, 1),
(10, 10, 3),
(10, 11, 2),
(11, 12, 1),
(11, 13, 3),
(12, 4, 2),
(12, 5, 1),
(13, 6, 3),
(13, 7, 2),
(14, 8, 1),
(14, 9, 2),
(15, 10, 3),
(15, 11, 1),
(16, 12, 2),
(16, 13, 3);

Select *
From  order_items

select *
from Emadeconsultingorder_items


--QUESTION 1 - WHICH PRODUCT HAS THE HIGHEST PRICE? ONLY RETURN A SINGLE ROW

Select * from products
where price= (
select max(price)
from products
)

--QUESTION 2 - WHICH CUSTOMER HAS MADE THE MOST ORDERS?
SELECT c.customer_id,
c.first_name,
c.last_name,
COUNT(o.order_id) AS total_orders
FROM Emadeconsultingcustomers c
JOIN Emadeconsultingorders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC



- --QUESTION 3- WHAT IS THE TOTAL REVENUE PER PRODUCT---

SELECT
    p.product_id,
    p.product_name,
    SUM(p.price * o.quantity) AS total_revenue
FROM
    Emadeconsultingproducts p
JOIN
    Order_items o ON p.product_id = o.product_id
GROUP BY
    p.product_id, p.product_name;

---QUESTION 5 - FIND THE FIRST ORDER (BY DATE) FOR EACH CUSTOMER---

SELECT
    o.customer_id,
    c.first_name,
    c.last_name,
    MIN(o.order_date) AS first_order_date
FROM
    Emadeconsultingorders o
JOIN
    Emadeconsultingcustomers c ON o.customer_id = c.customer_id
GROUP BY
    o.customer_id, c.first_name, c.last_name;

----QUESTION 6 -FIND THE TOP 3 CUSTOMERS WHO HAVE ORDERED THE MOST DISTINCT PRODUCTS----

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT oi.product_id) AS distinct_products_ordered
FROM
    Emadeconsultingcustomers c
JOIN
    Emadeconsultingorders o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    distinct_products_ordered DESC


--QUESTION 7 - WHICH PRODUCT HAS BEEN BOUGHT THE LEAST IN TERMS OF QUANTITY---

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM
    Emadeconsultingproducts p
JOIN
    order_items o ON p.product_id = o.product_id
GROUP BY
    p.product_id, p.product_name
ORDER BY
    total_quantity_sold ASC


---QUESTION 8 - WHAT IS THE MEDIAN ORDER TOTAL----

WITH OrderTotals AS (
    SELECT
        oi.order_id,
        SUM(oi.quantity * p.price) AS total_amount
    FROM
        order_items oi
    JOIN
        Emadeconsultingproducts p ON oi.product_id = p.product_id
    GROUP BY
        oi.order_id
),
RankedTotals AS (
    SELECT
        total_amount,
        ROW_NUMBER() OVER (ORDER BY total_amount) AS rn_asc,
        ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS rn_desc,
        COUNT(*) OVER () AS total_count
    FROM
        OrderTotals
)
SELECT
    AVG(total_amount) AS median_order_total
FROM
    RankedTotals
WHERE
    rn_asc = rn_desc
    OR rn_asc + 1 = rn_desc;

----QUESTION 9 -FOR EACH ORDER, DETERMINE IF IT WAS 'EXPENSIVE' (TOTAL OVER 300)----
---AFFORDABLE (TOTAL OVER 100), CHEAP (<100)

SELECT
    o.order_id,
    SUM(p.price * oi.quantity) AS total_amount,
    CASE
        WHEN SUM(p.price * oi.quantity) > 300 THEN 'Expensive'
        WHEN SUM(p.price * oi.quantity) > 100 THEN 'Affordable'
        ELSE 'Cheap'
    END AS price_category
FROM
    Emadeconsultingorders o
JOIN
    order_items oi ON oi.order_id = oi.order_id
JOIN
    Emadeconsultingproducts p ON oi.product_id = p.product_id
GROUP BY
    o.order_id;



--QUESTION 10 - FIND CUSTOMERS WHO HAVE ORDERED THE PRODUCT WITH THE HIGHEST PRICE---

WITH HighestPricedProduct AS (
    SELECT
        product_id,
        price
    FROM
        Emadeconsultingproducts
    ORDER BY
        price DESC
   
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    hpp.product_id,
    p.product_name,
    p.price
FROM
    Emadeconsultingcustomers c
JOIN
    Emadeconsultingorders o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
JOIN
    HighestPricedProduct hpp ON oi.product_id = hpp.product_id
JOIN
    Emadeconsultingproducts p ON p.product_id = hpp.product_id


-----Assignment:------

CREATE TABLE EmadeCustomer									
(
[ID] int, 
[CustomerName] varchar(30), 
[CustomerNumber] varchar(10), 
[Address] varchar(30), 
[City] varchar(30), 
[State] varchar(2), 
[Zip] varchar(10), 
[Country] varchar(2), 
[FamilyID] int
);									
	
--LOAD DATA TO THE TABLES
INSERT INTO EmadeCustomer ([ID], [CustomerName], [CustomerNumber], [Address], [City], [State], [Zip], [Country], [FamilyID])									
VALUES									
('37925182','Bicycles R Us 1','C9879A3','16 Shore St.','Fort Lauderdale','FL','33308','US','1321'),									
('37925183','Globex Corporation NY','C6548A6','192 Cypress Lane','La Porte','NY','11741','US','6549'),									
('37925184','Hooli East Coast','C2367A5','200 West Purple Finch St.','Johnstown','NC','49509','US','9843'),									
('37925185','Ben Johnson','C3984A9','280 Oakland Rd.','Etobicoke','ON','L4C 6B9','CA',''),									
('37925186','Hooli West Coast','C3284A5','7233 South James Road','Fayetteville','CA','28303','US','9843'),									
('37925187','Globex Corporation CT','C8974A4','7375 Purple Finch Road','Derry','CT','03038','US','6549'),									
('37925188','Bicycles R Us 2','C1321A8','7387 Grant Drive','Valley Stream','NY','11580','US','1321'),									
('37925189','Hooli Northeast','C6543A7','7693 Marsh Dr.','Atwater','ME','04401','US','9843'),									
('37925190','Globex Corporation PA','C6894A3','77 Mayfair Dr.','Taunton','PA','02780','US','6549'),									
('37925193','Dylan Coopers','C4897A1','8107 Mayflower Street','Montreal','QC','H4P 1V5','CA','')									
;		

select *
from EmadeCustomer

---create table
CREATE TABLE EmadeFamily									
(
[ID] int, 
[FamilyName] varchar(20), 
[FamilyNumber] varchar(10)
);

--LOAD DATA TO THE TABLES
INSERT INTO EmadeFamily ([ID], [FamilyName], [FamilyNumber])									
VALUES									
('1321','Bicycles R Us','BIKES100'),									
('6549','Globex Corporation','GLOBCORP'),									
('9843','Hooli','HOOLI123');	

select *
from EmadeFamily
			
			--create table---
CREATE TABLE EmadeHawb									
(
[ID] int, 
[Hawb] varchar(10), 
[HawbDate] date, 
[ServiceCodeID] int, 
[DueDate] date, 
[PODDate] date, 
[AccountID] int, 
[ConsigneeID] int, 
[Revenue] decimal(10,2)
);

--LOAD DATA TO THE TABLES
INSERT INTO EmadeHawb ([ID], [Hawb], [HawbDate], [ServiceCodeID], [DueDate], [PODDate], [AccountID], [ConsigneeID], [Revenue])									
VALUES									
('1656549987','H659124','01/13/2021','101','01/15/2021','01/16/2021','37925182','37925193','37.50'),				('1656549988','H659125','05/21/2021','102','05/25/2021','05/23/2021','37925183','37925193','18.00'),				
('1656549989','H659126','06/14/2021','100','06/22/2021','06/21/2021','37925186','37925185','21.00'),			
('1656549990','H659127','05/16/2021','101','05/19/2021','05/19/2021','37925187','37925193','16.25'),				
('1656549991','H659128','06/30/2021','100','07/01/2021',NULL,'37925188','37925185','15.00'),					
('1656549992','H659129','05/25/2021','102','05/31/2021','06/01/2021','37925189','37925185','18.00'),				
('1656549993','H659130','08/22/2020','100','08/29/2020','08/29/2020','37925190','37925193','21.00'),				
('1656549994','H659131','02/26/2021','101','02/28/2021','02/27/2021','37925190','37925185','24.25'),				
('1656549995','H659132','05/28/2020','101','05/30/2020','05/30/2020','37925184','37925193','14.00'),				
('1656549996','H659133','12/24/2020','100','01/04/2021','01/03/2021','37925183','37925185','18.50'),				
('1656549997','H659134','05/01/2021','102','05/09/2021','05/08/2021','37925182','37925185','32.00'),			
('1656549998','H659135','07/15/2021','100','07/21/2021',NULL,'37925184','37925193','14.00'),('1656549999','H659136','05/02/2021','101','05/10/2021','05/09/2021','37925183','37925185','37.50'),	('1656550000','H659137','03/15/2021','101','03/21/2021','03/27/2021','37925182','37925185','19.00'),			
('1656550001','H659138','04/03/2023','102','07/15/2024',NULL,'37925183','37925193','27.25');									

select *
from EmadeHawb

---create table---
CREATE TABLE EmadeServiceType									
(
[ID] int, 
[ServiceCode] varchar(5),
[ServiceDescription] varchar(15), 
[ServiceCategoryName] varchar(10)
);	

--LOAD DATA TO THE TABLES
INSERT INTO EmadeServiceType ([ID], [ServiceCode], [ServiceDescription], [ServiceCategoryName])						
VALUES									
('100','S200','Express','Courier'),									
('101','S400','Canada LTL','LTL'),									
('102','S300','Ground','Courier');

select *
from EmadeServiceType
/**
Note: Customer ID field joins to both AccountID and ConsigneeID from EmadeHawb table

Question 1:	Calculate the delivery days for each Hawb with Service Code "S200".  Be sure to account for Hawbs that are still en-route.
Question 2	: For all shipments related to Hooli and Globex Corporation, write a query that shows the Family Name, Hawb, Revenue, a column with the total Revenue per Family, and another column with the % of Family revenue.
Hint: Use a SQL window function to calculate the family revenue column if you know how.

3: Write a query that retrieves the number of late delivery days and associated revenue grouped by Family Name and Consignee State.

4: Create a pivot with the Service Code concatenated with Service Category Name as the column headers, Delivery Days as the data values, and grouped by consignee name.

Only include shipments already delivered.


**/