/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[PCH_1_Numerator]
      ,[PCH_2_Numerator]
      ,[PCH_1_Denominator]
      ,[PCH_2_Denominator]
  FROM [UNRHealthcareData].[dbo].[vCancerSpecificMeasuresScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numerator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[CancerSpecificMeasuresScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_denominator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[CancerSpecificMeasuresScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]