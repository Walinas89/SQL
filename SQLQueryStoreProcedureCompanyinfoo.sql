Create Procedure SpPullCompanyInfooData
As

SELECT [FirstName]
      ,[LastName]
      ,[Country]
  FROM [CompanyInfoo].[dbo].[CompanyInfoo]

  Exec SpPullCompanyInfooData