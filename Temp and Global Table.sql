--Temp Table 
---Temp Table are accesible in the current session
--To create a Temp table you add pound sign (#)
--Put the # sign infront of the table name no space
SELECT [EMPLOYEE_ID]
      ,substring (Last_Name, 1,4) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
	  into #Employee_String
  FROM [SqlTrainingCase].[dbo].[EMPLOYEE]

  Select *
  From #Employee_String

--Global Table
---are accesible in the other session
--To create a Global table you add 2 Pound sign(##)
--Put the ## sign infront of the table name no space
SELECT [EMPLOYEE_ID]
      ,substring (Last_Name, 1,4) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
	  into ##Employee_string
  FROM [SqlTrainingCase].[dbo].[EMPLOYEE]

  
  Select *
  From ##Employee_String

