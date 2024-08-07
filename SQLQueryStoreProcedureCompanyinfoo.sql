Create Procedure SpPullCompanyInfooData
As

SELECT [FirstName]
      ,[LastName]
      ,[Country]
  FROM [CompanyInfoo].[dbo].[CompanyInfoo]

  Exec SpPullCompanyInfooData

  ---Creating  a Backup Table
  Select * Into CompanyInfooBackup
  From CompanyInfoo

---- Fetching all Records
Select *
From CompanyInfooBackup
SELECT [FirstName]
      ,[LastName]
      ,[Country]
  FROM [CompanyInfoo].[dbo].[CompanyInfoo]

