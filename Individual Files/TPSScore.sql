/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[TPSId_9_MeasureScore]
      ,[TPSId_3_MeasureScore]
      ,[TPSId_6_MeasureScore]
      ,[TPSId_7_MeasureScore]
      ,[TPSId_1_MeasureScore]
      ,[TPSId_4_MeasureScore]
      ,[TPSId_5_MeasureScore]
      ,[TPSId_2_MeasureScore]
      ,[TPSId_8_MeasureScore]
  FROM [UNRHealthcareData].[dbo].[vTPSScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER('TPSId_' + CAST(mis.[TPSMeasureId] as varchar)) + '_measurescore', 1, 32) + ' "' + SUBSTRING([MeasureName], 1, 80) + '"' + char(13) + char(10)   
FROM [UNRHealthcareData].[dbo].[TPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[TPSMeasure] m on m.TPSMeasureId = mis.TPSMeasureId
group by mis.[TPSMeasureId], [MeasureName]