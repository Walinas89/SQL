---Functions
1. UpperCase
2. LowerCase
3. SubStrings
4. Trims

---UpperCase
---Make the values in the field type (Capital Letters)
SELECT [Name]
   ,Upper(Type) As Type_Cap
   ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]

  ---LowerCase
  ---Make all the Stars in the fiels ( Lower Letters)
  SELECT [Name]
      ,[Type]
      ,[Rating]
   ,lower(Stars) as star_low
   ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]
  
  Update [SqlTrainingCase].[dbo].[Movies]
 Set Stars = lower(Stars) 
 Where Stars = 'Cruise'

  ---SubStrings
  ---This is used to Determine the location of a values of a records
  SELECT [Name]
  ,SubString (Type,1,3) As Type_String
  ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]

 
   ---WildCards
  ---This is used for pattern searching
  SELECT [Name]
      ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]
  Where Stars like 'c%' -- Begins with C

   SELECT [Name]
      ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]
  Where Stars like '%e' ---Begins with E



  ---Trims
  SELECT [Name]
      ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTrainingCase].[dbo].[Movies]











