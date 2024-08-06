/****** Script for SelectTopNRows command from SSMS ****/

/*******Why Store Procedure is used is for security purpose
----Helps Hide Code, i.e Encapsulate Data
----To Also make code reuseable. You dont have to keep rewriting Codes all the time.
---For Performance, i.e Helps improve performance of a code.
--- If you automate a Code you dont have to rewrite your code from scratch
--For Security Purpose
*/
---How to create store Procedure
Drop Procedure If Exists SpPullEmployeeInfoData
;
Create Procedure SpPullEmployeeInfoData
As
Begin

---How to Remove a Table
Drop Table If Exists EmployeeInfoBackup

---Creating  A Backup Table
Select * Into EmployeeInfoBackup
From EmployeeInfo

Update EmployeeInfo
Set Employee = 100
Where Employee = 10

Select *
From EmployeeInfoBackup
SELECT  [FirstName]
      ,[LastName]
      ,[Employee]
  FROM [CompanyInfoo].[dbo].[EmployeeInfo]
End 

Select *
From EmployeeInfo

  ---How To Run Store Procedure
Execute SpPullEmployeeInfoData

---How to remove Store Procedure From The Database

Drop Procedure SpPullEmployeeInfoData

---How to Create BackupTable

Select * Into EmployeeInfoBackup
From EmployeeInfo

Select *
From EmployeeInfoBackup

---How to Modify Store Procedure

Alter Procedure SpPullEmployeeInfoData
As
Begin

---How to Remove a Table
Drop Table If Exists EmployeeInfoBackup

---Creating  A Backup Table
Select * Into EmployeeInfoBackup
From EmployeeInfo

Update EmployeeInfo
Set Employee = 100
Where Employee = 10

Select *
From EmployeeInfoBackup
SELECT  [FirstName]
      ,[LastName]
      ,[Employee]
  FROM [CompanyInfoo].[dbo].[EmployeeInfo]
End 

Select *
From EmployeeInfo

Exec SpPullEmployeeInfoData

---How to Track changes in a code 





