USE [HISBILLINGDB]
GO

/****** Object:  StoredProcedure [dbo].[mSP_INS_CLATInpOrderList_all]    Script Date: 2020/4/20 ¤W¤È 11:02:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[mSP_INS_#CLATInpOrderList_all]
 @INS_CNT INT = 0 OUTPUT
,@UPD_CNT INT = 0 OUTPUT
AS

--truncate table dbo.CLATInpOrderList

--SELECT * FROM CLATInpOrderList_INSXMLII
--SELECT * FROM CLATInpOrderList

--set identity_insert dbo.CLATInpOrderList on

IF OBJECT_ID('TEMPDB..#CLATInpOrderList') IS NOT NULL DROP TABLE #CLATInpOrderList

CREATE TABLE #CLATInpOrderList(
--[InpOrderListId] [bigint] IDENTITY(1,1) NOT NULL,
	[InpNHIPointsList] [bigint] NOT NULL,
	[InpatientNo] [char](9) NULL,
	[OrderSortNo] [varchar](6) NOT NULL,
	[NHIOrderTypeCode] [varchar](16) NOT NULL,
	[NHIFeeTypeCode] [varchar](16) NOT NULL,
	[NHIItemCode] [varchar](12) NULL,
	[NHIPoints] [decimal](19, 8) NOT NULL,
	[NHIQuantity] [decimal](9, 1) NOT NULL,
	[NHIPlusRate] [decimal](9, 2) NOT NULL,
	[RouteTypeCode] [varchar](16) NULL,
	[TotalPoints] [int] NOT NULL,
	[NonNHIItemCode] [varchar](16) NOT NULL,
	[NonNHIItemName] [nvarchar](128) NULL,
	[InpOrderFileId] [bigint] NULL,
	[AssociatedHosptialCode] [varchar](11) NULL,
	[CutPreviousData] [varchar](21) NULL,
	[ChargeCode] [varchar](40) NOT NULL,
	[MedicationQuantity] [int] NULL,
	[MedFrequencyCode] [varchar](16) NULL,
	[NHICnsDivisionCode] [varchar](16) NULL,
	[BedNo] [varchar](10) NULL,
	[ClaimItem] [nvarchar](18) NULL,
	[TwDrgs] [decimal](19, 4) NULL,
	[OrganDonationInfo] [varchar](28) NULL,
	[ExecuteBeginTime] [varchar](11) NOT NULL,
	[ExecuteEndTime] [varchar](11) NOT NULL,
	[PreCertificationRequestNo] [varchar](21) NULL,
	[ExecuteIdNo] [varchar](10) NOT NULL,
	[ImageSourceType] [int] NOT NULL,
	[ImageSourceCode] [varchar](16) NOT NULL,
	[InpSummaryId] [bigint] NOT NULL,
	[NHIDivisionCode] [varchar](16) NOT NULL,
	[OptionalMaterialsGroupNo] [varchar](3) NULL,
	[TreatmentName] [nvarchar](128) NOT NULL,
	[DivisionCode] [varchar](16) NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ExecuteEmpId] [int] NOT NULL
	)

insert into dbo.CLATInpOrderList(
--[InpOrderListId],
[InpNHIPointsList]
      ,[InpatientNo]
      ,[OrderSortNo]
      ,[NHIOrderTypeCode]
      ,[NHIFeeTypeCode]
      ,[NHIItemCode]
      ,[NHIPoints]
      ,[NHIQuantity]
      ,[NHIPlusRate]
      ,[RouteTypeCode]
      ,[TotalPoints]
      ,[NonNHIItemCode]
      ,[NonNHIItemName]
      ,[InpOrderFileId]
      ,[AssociatedHosptialCode]
      ,[CutPreviousData]
      ,[ChargeCode]
      ,[MedicationQuantity]
      ,[MedFrequencyCode]
      ,[NHICnsDivisionCode]
      ,[BedNo]
      ,[ClaimItem]
      ,[TwDrgs]
      ,[OrganDonationInfo]
      ,[ExecuteBeginTime]
      ,[ExecuteEndTime]
      ,[PreCertificationRequestNo]
      ,[ExecuteIdNo]
      ,[ImageSourceType]
      ,[ImageSourceCode]
      ,[InpSummaryId]
      ,[NHIDivisionCode]
      ,[OptionalMaterialsGroupNo]
      ,[TreatmentName]
      ,[DivisionCode]
      ,[IsTemp]
      ,[ExecuteEmpId]
)

select 
--InpOrderListId,

'0'
      ,''
      ,CONVERT(nvarchar,OrderSortNo)
      ,''
      ,''
      ,''
      ,ISNULL(CONVERT(decimal,NHIPoints),0)
      ,ISNULL(CONVERT(decimal,NHIQuantity),0)
      ,ISNULL(CONVERT(decimal,NHIPlusRate),0)
      ,ISNULL(RouteTypeCode,0)
      ,'0'
      ,ISNULL(NonNHIItemCode,0)
      ,ISNULL(NonNHIItemName,0)
      ,'0'
      ,ISNULL(AssociatedHosptialCode,0)
      ,ISNULL(CutPreviousData,0)
      ,''
      ,ISNULL(convert(decimal,MedicationQuantity),0)
      ,ISNULL(MedFrequencyCode,0)
      ,ISNULL(NHICnsDivisionCode,0)
      ,ISNULL(BedNo,0)
      ,ISNULL(ClaimItem,0)
      ,ISNULL(CONVERT(decimal,TwDrgs),0)
      ,ISNULL(OrganDonationInfo,0)
      ,ISNULL(ExecuteBeginTime,0)
      ,ISNULL(ExecuteEndTime,0)
      ,ISNULL(PreCertificationRequestNo,0)
      ,ISNULL(ExecuteIdNo,0)
      ,'0'
      ,ISNULL(ImageSourceCode,0)
      ,'0'
      ,ISNULL(NHIDivisionCode,0)
      ,ISNULL(OptionalMaterialsGroupNo,0)
      ,''
      ,''
      ,''
      ,'0'
	  
from CLATInpOrderList_INSXMLII

--select * from CLATInpOrderList_INSXMLOC

--set identity_insert dbo.CLATInpOrderList OFF

SET @INS_CNT = @@ROWCOUNT;



IF OBJECT_ID('TEMPDB..#CLATInpOrderList') IS NOT NULL DROP TABLE #CLATInpOrderList
GO


