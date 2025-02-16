/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[MSPB_1_Score]
      ,[MeasureStartDate]
      ,[MeasureEndDate]
  FROM [UNRHealthcareData].[dbo].[vMedicareSpendingPerBeneficiaryScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingPerBeneficiaryScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]