/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[FiscalYear]
      ,[AHRQ_PSI_90_Score]
      ,[CLABSI_Score]
      ,[CAUTI_Score]
      ,[SSI_Score]
  FROM [UNRHealthcareData].[dbo].[HACQuarterlyHospital]