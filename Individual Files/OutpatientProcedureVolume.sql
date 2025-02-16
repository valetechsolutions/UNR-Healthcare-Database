/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[MId_60_PTId_7_ProcedureVolume]
      ,[MId_60_PTId_1_ProcedureVolume]
      ,[MId_60_PTId_4_ProcedureVolume]
      ,[MId_60_PTId_2_ProcedureVolume]
      ,[MId_60_PTId_5_ProcedureVolume]
      ,[MId_60_PTId_8_ProcedureVolume]
      ,[MId_60_PTId_9_ProcedureVolume]
      ,[MId_60_PTId_3_ProcedureVolume]
      ,[MId_60_PTId_6_ProcedureVolume]
  FROM [UNRHealthcareData].[dbo].[vOutpatientProcedureVolumePivot]

  SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[MeasureId] as varchar)) + LOWER('_PTId_' + CAST(mis.[ProcedureTypeId] as varchar)) + '_procedurevolume', 1, 32) + ' "' + ISNULL(SUBSTRING([ProcedureType], 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[OutpatientProcedureVolume] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
INNER JOIN [UNRHealthcareData].[dbo].[ProcedureType] p on p.ProcedureTypeId = mis.ProcedureTypeId
group by mis.[MeasureId], [MeasureName], mis.ProcedureTypeId, ProcedureType