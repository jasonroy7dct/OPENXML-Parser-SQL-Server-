USE
[HISBILLINGDB]
Go

Declare @XMLData xml  
SET @XMLData = (SELECT XMLData  
               FROM   INSXMLII  
               FOR XML AUTO, TYPE)  
--SELECT @XMLData  


IF OBJECT_ID('CLATInpOrderList_INSXMLII') IS NOT NULL DROP TABLE CLATInpOrderList_INSXMLII
CREATE TABLE CLATInpOrderList_INSXMLII (
  [OrderSortNo]                int  NULL      
, [MedicalDispensingTypeCode]  [varchar](MAX)  NULL      
, [NHIOrderType]               [varchar](MAX)  NULL      
, [PayNumber]                  int  NULL      
, [MedicationQuantity]         int  NULL      
, [MedFrequencyCode]           [varchar](MAX)  NULL   
, [RouteTypeCode]              [varchar](MAX)  NULL      
, [NHICnsDivisionCode]         [varchar](MAX)  NULL  
, [BedNo]                      [nvarchar](MAX)  NULL
, [ClaimItem]                  [nvarchar](MAX)  NULL      
, [TwDrgs]                     decimal(19, 4)  NULL      
, [CutPreviousData]            [nvarchar](MAX)  NULL    
, [OrganDonationInfo]          [varchar](MAX)  NULL
, [ExecuteBeginTime]           [varchar](MAX)  NULL
, [ExecuteEndTime]             [varchar](MAX)  NULL
, [NHIQuantity]                decimal(9, 1)  NULL
, [NHIPoints]                  decimal(19, 8)  NULL
, [NHIPlusRate]                decimal(9, 2)  NULL
, [PreCertificationRequestNo]  [varchar](MAX)  NULL
, [ExecuteIdNo]                [varchar](MAX)  NULL
, [ImageSourceCode]            [varchar](MAX)  NULL
, [NHIDivisionCode]            [nvarchar](MAX)  NULL
, [OptionalMaterialsGroupNo]   [varchar](MAX)  NULL
, [NonNHIItemCode]             [varchar](MAX)  NULL
, [NonNHIItemName]             [nvarchar](MAX)  NULL
, [AssociatedHosptialCode]     [varchar](MAX)  NULL
	 )

INSERT INTO CLATInpOrderList_INSXMLII
SELECT
 Node.Data.value('(pdata/p1)[1]','int')
,Node.Data.value('(pdata/p2)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p3)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p4)[1]','int')
,Node.Data.value('(pdata/p5)[1]','int')
,Node.Data.value('(pdata/p6)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p7)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p8)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p9)[1]','NVARCHAR(MAX)')
,Node.Data.value('(pdata/p10)[1]','NVARCHAR(MAX)')
,Node.Data.value('(pdata/p11)[1]','decimal')
,Node.Data.value('(pdata/p12)[1]','NVARCHAR(MAX)')
,Node.Data.value('(pdata/p13)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p14)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p15)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p16)[1]','decimal')
,Node.Data.value('(pdata/p17)[1]','decimal')
,Node.Data.value('(pdata/p18)[1]','decimal')
,Node.Data.value('(pdata/p19)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p20)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p21)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p22)[1]','NVARCHAR(MAX)')
,Node.Data.value('(pdata/p23)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p24)[1]','VARCHAR(MAX)')
,Node.Data.value('(pdata/p25)[1]','NVARCHAR(MAX)')
,Node.Data.value('(pdata/p26)[1]','VARCHAR(MAX)')
FROM @XMLData.nodes('INSXMLII/XMLData/inpatient/ddata/dbody') Node(Data)   

GO