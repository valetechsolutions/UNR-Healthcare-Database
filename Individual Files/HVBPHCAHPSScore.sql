/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[MId_3_AchievementPoints]
      ,[MId_6_AchievementPoints]
      ,[MId_7_AchievementPoints]
      ,[MId_1_AchievementPoints]
      ,[MId_4_AchievementPoints]
      ,[MId_5_AchievementPoints]
      ,[MId_2_AchievementPoints]
      ,[MId_8_AchievementPoints]
      ,[MId_3_ImprovementPoints]
      ,[MId_6_ImprovementPoints]
      ,[MId_7_ImprovementPoints]
      ,[MId_1_ImprovementPoints]
      ,[MId_4_ImprovementPoints]
      ,[MId_5_ImprovementPoints]
      ,[MId_2_ImprovementPoints]
      ,[MId_8_ImprovementPoints]
      ,[MId_3_DimensionScore]
      ,[MId_6_DimensionScore]
      ,[MId_7_DimensionScore]
      ,[MId_1_DimensionScore]
      ,[MId_4_DimensionScore]
      ,[MId_5_DimensionScore]
      ,[MId_2_DimensionScore]
      ,[MId_8_DimensionScore]
  FROM [UNRHealthcareData].[dbo].[vHVBPHCAHPSScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[HVBPHCAHPSMeasureId] as varchar)) + '_achievementpoints', 1, 32) + ' "' + SUBSTRING(MeasureName, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPHCAHPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[HVBPHCAHPSMeasure] m on m.HVBPHCAHPSMeasureId = mis.HVBPHCAHPSMeasureId
group by mis.[HVBPHCAHPSMeasureId], [MeasureName]
UNION
SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[HVBPHCAHPSMeasureId] as varchar)) + '_dimensionscore', 1, 32) + ' "' + SUBSTRING(MeasureName, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPHCAHPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[HVBPHCAHPSMeasure] m on m.HVBPHCAHPSMeasureId = mis.HVBPHCAHPSMeasureId
group by mis.[HVBPHCAHPSMeasureId], [MeasureName]