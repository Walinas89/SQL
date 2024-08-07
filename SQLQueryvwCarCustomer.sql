USE [SqlTrainingCase]
GO

/****** Object:  View [dbo].[vwCarCustomer]    Script Date: 8/6/2024 7:10:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Waliat Nasiru>
-- Create date: <2024/08/06>
-- Description:	<This View Extract Data from CarCustomer Table>
--Version: 1.0
--Revision Date: 2024/08/06
-- =============================================



CREATE VIEW [dbo].[vwCarCustomer]
AS
SELECT        Customer_ID, LastName, FisrtName
FROM            dbo.CarCustomer
GO


