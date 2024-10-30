USE [SqlTrainingCase]
GO

/****** Object:  StoredProcedure [dbo].[spProduct_ID]    Script Date: 10/22/2024 7:26:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[spProduct_ID]
@Product_ID int
As
Begin
SELECT TOP (1000) [Product_ID]

      ,[Product_Name]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Products]
  Where Product_ID = @Product_ID
  End
GO

Exec [dbo].[spProduct_ID] 2

-----Creating Store Procedure-----

Create Proc [dbo].[spDEPARTMENT_ID]
@DEPARTMENT_ID int
As
Begin
SELECT TOP (1000) [DEPARTMENT_ID]
      ,[NAME]
      ,[LOCATION_ID]
  FROM [SqlTrainingCase].[dbo].[DEPARTMENT]
  where DEPARTMENT_ID = @DEPARTMENT_ID
  End
  Go

  Exec [dbo].[spDEPARTMENT_ID] 20

   ----Creating EmadeConsultingHR storeprocedure-----

	Create Proc [dbo].[spId]
	@Id int
	As
	Begin
   SELECT TOP (1000) [Id]
      ,[Firstname]
      ,[Lastname]
      ,[MaritalStatus]
  FROM [SqlTrainingCase].[dbo].[EmadeConsultingHR]
  where Id = @Id
  End
  Go

  Exec [dbo].[spId] 3

  ----Creating Job Store Procedure----

  Create Proc [dbo].[spJOB_ID]
  @JOB_ID int
  As
  Begin
  SELECT TOP (1000) [JOB_ID]
      ,[DESIGNATION]
  FROM [SqlTrainingCase].[dbo].[JOB]
  where JOB_ID = @JOB_ID
  End
  Go

  Exec [dbo].[spJOB_ID] 669

  ---Creating store procedures----
  USE Dev

  Create Proc [dbo].[spCUSTOMER_ID]
  @CUSTOMER_ID int
  As 
  Begin
  SELECT TOP (1000) [CUSTOMER_ID]
      ,[FIRST_NAME]
      ,[LAST_NAME]
      ,[AGE]
      ,[COUNTRY]
  FROM [Dev].[dbo].[BEST_BUY_CUSTOMERS]
  where CUSTOMER_ID = @CUSTOMER_ID
  End
  Go

  Exec [dbo].[spCUSTOMER_ID] 4

  Create Proc [dbo].[spORDER_ID]
  @ORDER_ID int
  As
  Begin
  SELECT TOP (1000) [ORDER_ID]
      ,[ITEM]
      ,[AMOUNT]
      ,[CUSTOMER_ID]
  FROM [Dev].[dbo].[BEST_BUY_ORDERS]
  where ORDER_ID = @ORDER_ID
  End
  Go

  Exec [dbo].[spORDER_ID] 4

----create store procedure---

Create Proc spStudentName
@StudentName varchar(50)
As
Begin
SELECT TOP (1000) [StudentName]
      ,[Subject]
      ,[Marks]
  FROM [Dev].[dbo].[CollegeGrade]
  where StudentName = @StudentName
  End

  Exec spStudentName 'Lily'

  ---- Craeting SP---
  Create Proc spMiddle_Name
  @Middle_Name varchar (20)
  As
  Begin
  SELECT TOP (1000) [EMPLOYEE_ID]
      ,[Last_Name]
      ,[First_Name]
      ,[Middle_Name]
      ,[Job_ID]
      ,[Manager_ID]
      ,[Hire_Date]
      ,[Salary]
      ,[Comm]
      ,[Department_ID]
  FROM [Dev].[dbo].[Emadeconsulting_EMPLOYEE]
  where Middle_Name = @Middle_Name
  End

  Exec spMiddle_Name 'D'


  ---creating SP---
  Create Proc [dbo].[spname]
  @name varchar(20)
  As
  Begin
  SELECT TOP (1000) [name]
      ,[occupation]
      ,[working_date]
      ,[working_hours]
      ,[salary]
  FROM [Dev].[dbo].[EmadeConsultingEmployee]
  where name = @name
  End
  Go

  Exec [dbo].[spname] 'Laura Paul'


