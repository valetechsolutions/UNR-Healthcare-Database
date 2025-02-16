/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[OP_10_Score]
      ,[OP_11_Score]
      ,[OP_13_Score]
      ,[OP_14_Score]
      ,[OP_8_Score]
      ,[OP_9_Score]
      ,[OP_10_Sample]
      ,[OP_11_Sample]
      ,[OP_13_Sample]
      ,[OP_14_Sample]
      ,[OP_8_Sample]
      ,[OP_9_Sample]
      ,[MeasureStartDate]
      ,[MeasureEndDate]
  FROM [UNRHealthcareData].[dbo].[vMedicalImagingScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicalImagingScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_sample', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicalImagingScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]