SELECT TOP (1000) [EMPLOYEE_ID]
      ,Upper((LAST_NAME + ' ' + FIRST_NAME + ' ' + MIDDLE_NAME)) As EmployeeName
	   ,Upper((LAST_NAME + FIRST_NAME + MIDDLE_NAME)) As EmployeeName2
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  FROM [SqlTrainingCase].[dbo].[EMPLOYEE]

  ---To change all the selescted  fields to upper case
  ---The + sign is to join while the ' ' is to give space in between something  (Concatenate)
  
  ---Show first 4 Letter in the last Name
  ---Create a new table as EmployeeString
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
  FROM [SqlTrainingCase].[dbo].[EMPLOYEE]


  ---Create a new table as EmployeeString

   SELECT [EMPLOYEE_ID]
      ,substring (Last_Name, 1,5) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
	  into Employee_String1
  FROM [SqlTrainingCase].[dbo].[EMPLOYEE]

  ---Join table Employee_strings LastName_Strings to Employee Table LastName( just where 2 tables match)
  Select *
  From Employee_String1 As ES
  Join Employee as E
  on substring (ES.Lastname_string, 1,5) = substring (E.Last_Name, 1,5)

  ---Join Table Employee_strings Last_name to Employee table Last_Name
    Select *
  From Employee_String As ES
  Join Employee as E
  on ES.Last_name = E .LAST_NAME


  **/
---- Union All shows all records on both Tables, but the tables have to have same column for it to work, hence why we added the table structure 
--- while union Eliminates duplicates

   SELECT [EMPLOYEE_ID]
      ,substring (Last_Name, 1,5) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From Employee_String
  Union all
  SELECT [EMPLOYEE_ID]
      ,substring (Last_Name, 1,5) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From EMPLOYEE

  ---Union Eliminates Duplicates
    SELECT [EMPLOYEE_ID]
   --,substring (Last_Name, 1,5) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From Employee_String
  Union 
  SELECT [EMPLOYEE_ID]
  --,substring (Last_Name, 1,5) As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From EMPLOYEE


  ---Adding a dervied coumn when combining 2 tables using union all clause.
  ---' ' Creates Fake column or derived column


   SELECT [EMPLOYEE_ID]
  -- ,'Employee_String ' as TableName
      --,Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From Employee_String
  Union 
  SELECT [EMPLOYEE_ID]
 --   ,'Employee ' as TableName
    --   ,' 'As Lastname_string
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[JOB_ID]
      ,[MANAGER_ID]
      ,[HIRE_DATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENT_I]
  From EMPLOYEE


  Select *
  From Employee_String1

 