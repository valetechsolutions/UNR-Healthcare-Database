/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[HAI_1_StandardizedInfectionRatio]
      ,[HAI_1A_StandardizedInfectionRatio]
      ,[HAI_2_StandardizedInfectionRatio]
      ,[HAI_2A_StandardizedInfectionRatio]
      ,[HAI_3_StandardizedInfectionRatio]
      ,[HAI_4_StandardizedInfectionRatio]
      ,[HAI_5_StandardizedInfectionRatio]
      ,[HAI_6_StandardizedInfectionRatio]
      ,[HAI_1_ConfidenceIntervalLower]
      ,[HAI_1A_ConfidenceIntervalLower]
      ,[HAI_2_ConfidenceIntervalLower]
      ,[HAI_2A_ConfidenceIntervalLower]
      ,[HAI_3_ConfidenceIntervalLower]
      ,[HAI_4_ConfidenceIntervalLower]
      ,[HAI_5_ConfidenceIntervalLower]
      ,[HAI_6_ConfidenceIntervalLower]
      ,[HAI_1_ConfidenceIntervalHigher]
      ,[HAI_1A_ConfidenceIntervalHigher]
      ,[HAI_2_ConfidenceIntervalHigher]
      ,[HAI_2A_ConfidenceIntervalHigher]
      ,[HAI_3_ConfidenceIntervalHigher]
      ,[HAI_4_ConfidenceIntervalHigher]
      ,[HAI_5_ConfidenceIntervalHigher]
      ,[HAI_6_ConfidenceIntervalHigher]
      ,[HAI_1_Numerator]
      ,[HAI_1A_Numerator]
      ,[HAI_2_Numerator]
      ,[HAI_2A_Numerator]
      ,[HAI_3_Numerator]
      ,[HAI_4_Numerator]
      ,[HAI_5_Numerator]
      ,[HAI_6_Numerator]
      ,[HAI_1_NumberOfDaysOrPatients]
      ,[HAI_1A_NumberOfDaysOrPatients]
      ,[HAI_2_NumberOfDaysOrPatients]
      ,[HAI_2A_NumberOfDaysOrPatients]
      ,[HAI_3_NumberOfDaysOrPatients]
      ,[HAI_4_NumberOfDaysOrPatients]
      ,[HAI_5_NumberOfDaysOrPatients]
      ,[HAI_6_NumberOfDaysOrPatients]
      ,[HAI_1_NationalComparisonCategory]
      ,[HAI_1A_NationalComparisonCategory]
      ,[HAI_2_NationalComparisonCategory]
      ,[HAI_2A_NationalComparisonCategory]
      ,[HAI_3_NationalComparisonCategory]
      ,[HAI_4_NationalComparisonCategory]
      ,[HAI_5_NationalComparisonCategory]
      ,[HAI_6_NationalComparisonCategory]
  FROM [UNRHealthcareData].[dbo].[vHealthcareAssociatedInfectionScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_standardizedinfectionratio', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_confidenceintervallower', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_confidenceintervalhigher', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numerator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numberofdaysorpatients', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_nationalcomparisoncategory', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]