/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[PAYM_30_AMI_Payment]
      ,[PAYM_30_HF_Payment]
      ,[PAYM_30_PN_Payment]
      ,[PAYM_30_AMI_LowerEstimate]
      ,[PAYM_30_HF_LowerEstimate]
      ,[PAYM_30_PN_LowerEstimate]
      ,[PAYM_30_AMI_HigherEstimate]
      ,[PAYM_30_HF_HigherEstimate]
      ,[PAYM_30_PN_HigherEstimate]
      ,[PAYM_30_AMI_Denominator]
      ,[PAYM_30_HF_Denominator]
      ,[PAYM_30_PN_Denominator]
      ,[PAYM_30_AMI_NationalComparisonCategory]
      ,[PAYM_30_HF_NationalComparisonCategory]
      ,[PAYM_30_PN_NationalComparisonCategory]
  FROM [UNRHealthcareData].[dbo].[vPaymentScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_payment', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_lowerestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_higherestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_denominator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_nationalcomparisoncategory', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]