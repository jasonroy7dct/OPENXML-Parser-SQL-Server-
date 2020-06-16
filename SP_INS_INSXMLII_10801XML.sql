USE [HISBILLINGDB]
GO

--EXEC SP_INS_INSXMLII_10801XML
--DROP TABLE INSXMLII_10801XML

--TRUNCATE TABLE dbo.CLATInpNHIPointsList
--select * from dbo.CLATInpNHIPointsList
ALTER PROCEDURE [dbo].[SP_INS_INSXMLII_10801XML]
 @INS_CNT INT = 0 OUTPUT
,@UPD_CNT INT = 0 OUTPUT
AS
BEGIN

IF OBJECT_ID('TEMPDB..#INSXMLII_10801XML') is not null drop table #INSXMLII_10801XML
CREATE TABLE #INSXMLII_10801XML
(
Id INT IDENTITY PRIMARY KEY,
XMLData XML,
LoadedDateTime DATETIME
)

--insert into table
INSERT INTO #INSXMLII_10801XML(XMLData, LoadedDateTime)
SELECT CONVERT(XML,BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Users\Administrator\Desktop\XML\10801-XML\INSXMLII.XML',SINGLE_BLOB) AS x;

--SELECT * FROM INSXMLII_10801XML


Declare @XMLData XML
Set @XMLData = (Select XMLData From #INSXMLII_10801XML For XML AUTO,TYPE)

--Select @XMLData

IF OBJECT_ID('TEMPDB..#CLATInpNHIPointsList_INSXMLII') IS NOT NULL DROP TABLE #CLATInpNHIPointsList_INSXMLII
CREATE TABLE #CLATInpNHIPointsList_INSXMLII (
--[InpNHIPointsList] [bigint] IDENTITY(1,1) NOT NULL,
	[AmendmentReasonCode] [varchar](MAX) NULL,
	[ClaimNo] [varchar](MAX) NULL,
	[CopaymentTypeCode] [varchar](MAX) NULL,
	[PatientIdNo] [varchar](MAX) NULL,
	[PatientBirthday] [varchar](MAX) NULL,
	[NHIBenefitTypeCode][varchar](MAX) NULL,
	[NHICaseTypeCode] [varchar](MAX) NULL,
	[DivisionCode][varchar](MAX) NULL,
	[AdmissionDate] [varchar](MAX) NULL,
	[DischargeDate] [varchar](MAX) NULL,
	[ClaimBeginDate][varchar](MAX) NULL,
	[ClaimEndDate][varchar](MAX) NULL,
	[AcuteBedDay] [varchar](MAX) NULL,
	[ChronicBedDay] [varchar](MAX) NULL,
	[PatientTypeCode] [varchar](MAX) NULL,
	[ICFormatNo][varchar](MAX) NULL,
	[TWDrgCode] [varchar](MAX) NULL,
	[TWDrgPaymentCode][varchar](MAX) NULL,
	[DoctorIdNo][varchar](MAX) NULL,
	[DrgCode] [varchar](MAX) NULL,
	--[ExternalFactorType1] [varchar](MAX) NULL,
	--[ExternalFactorType2] [varchar](MAX) NULL,
	[DischargeStateCode][varchar](MAX) NULL,--轉歸代碼
	[MainDiseasesCode][varchar](MAX) NULL,
	[SubDiseasesCode1][varchar](MAX) NULL,
	[SubDiseasesCode2][varchar](MAX) NULL,
	[SubDiseasesCode3][varchar](MAX) NULL,
	[SubDiseasesCode4][varchar](MAX) NULL,
	[SubDiseasesCode5][varchar](MAX) NULL,
	[SubDiseasesCode6][varchar](MAX) NULL,
	[SubDiseasesCode7][varchar](MAX) NULL,
	[SubDiseasesCode8][varchar](MAX) NULL,
	[SubDiseasesCode9][varchar](MAX) NULL,
	[SubDiseasesCode10] [varchar](MAX) NULL,
	[SubDiseasesCode11] [varchar](MAX) NULL,
	[SubDiseasesCode12] [varchar](MAX) NULL,
	[SubDiseasesCode13] [varchar](MAX) NULL,
	[SubDiseasesCode14] [varchar](MAX) NULL,
	[SubDiseasesCode15] [varchar](MAX) NULL,
	[SubDiseasesCode16] [varchar](MAX) NULL,
	[SubDiseasesCode17] [varchar](MAX) NULL,
	[SubDiseasesCode18] [varchar](MAX) NULL,
	[SubDiseasesCode19] [varchar](MAX) NULL,
	[MainOperationCode] [varchar](MAX) NULL,
	[SubOperationCode1] [varchar](MAX) NULL,
	[SubOperationCode2] [varchar](MAX) NULL,
	[SubOperationCode3] [varchar](MAX) NULL,
	[SubOperationCode4] [varchar](MAX) NULL,
	[SubOperationCode5] [varchar](MAX) NULL,
	[SubOperationCode6] [varchar](MAX) NULL,
	[SubOperationCode7] [varchar](MAX) NULL,
	[SubOperationCode8] [varchar](MAX) NULL,
	[SubOperationCode9] [varchar](MAX) NULL,
	[SubOperationCode10][varchar](MAX) NULL,
	[SubOperationCode11][varchar](MAX) NULL,
	[SubOperationCode12][varchar](MAX) NULL,
	[SubOperationCode13][varchar](MAX) NULL,
	[SubOperationCode14][varchar](MAX) NULL,
	[SubOperationCode15][varchar](MAX) NULL,
	[SubOperationCode16][varchar](MAX) NULL,
	[SubOperationCode17][varchar](MAX) NULL,
	[SubOperationCode18][varchar](MAX) NULL,
	[SubOperationCode19][varchar](MAX) NULL,
	[TotalOrderCount] [varchar](MAX) NULL,
	[DiagnosticFee] [varchar](MAX) NULL,
	[WardFee] [varchar](MAX) NULL,
	[TubeMealFee] [varchar](MAX) NULL,
	[ExaminationFee][varchar](MAX) NULL,
	[XRayFee] [varchar](MAX) NULL,
	[TreatmentFee][varchar](MAX) NULL,
	[OperationFee][varchar](MAX) NULL,
	[RehabilitationFee] [varchar](MAX) NULL,
	[BloodFee][varchar](MAX) NULL,
	[HemoFee] [varchar](MAX) NULL,
	[AnesthesiaFee] [varchar](MAX) NULL,
	[OptionalMaterialsFee][varchar](MAX) NULL,
	[MedicineFee] [varchar](MAX) NULL,
	[MedicineServiceFee][varchar](MAX) NULL,
	[PsychiatricFee][varchar](MAX) NULL,
	[InjectionFee][varchar](MAX) NULL,
	[BabyFee] [varchar](MAX) NULL,
	[TotalAmount] [varchar](MAX) NULL,
	[CopaymentAmount] [varchar](MAX) NULL,
	[ApplicationAmount] [varchar](MAX) NULL,
	[Acute1To30Amount][varchar](MAX) NULL,
	[Acute1To30CopaymentAmount] [varchar](MAX) NULL,
	[Acute31To60Amount] [varchar](MAX) NULL,
	[Acute31To60CopaymentAmount][varchar](MAX) NULL,
	[AcuteOver61Amount] [varchar](MAX) NULL,
	[AcuteOver61CopaymentAmount][varchar](MAX) NULL,
	[Chronic1To30Amount][varchar](MAX) NULL,
	[Chronic1To30CopaymentAmount] [varchar](MAX) NULL,
	[Chronic31To90Amount] [varchar](MAX) NULL,
	[Chronic31To90CopaymentAmount][varchar](MAX) NULL,
	[Chronic91To180Amount][varchar](MAX) NULL,
	[Chronic91To180CopaymentAmount] [varchar](MAX) NULL,
	[ChronicOver180Amount][varchar](MAX) NULL,
	[ChronicOver180CopaymentAmount] [varchar](MAX) NULL,
	[NeonatalBirthday][varchar](MAX) NULL,
	[MultipBirthsTypeCode][varchar](MAX) NULL,
	[InapplicableTWDrgCode] [varchar](MAX) NULL,
	[PatientName] [nvarchar](MAX) NULL,
	[CorrectiveHospital][varchar](MAX) NULL,
	--[EmergencyBeginTime ][varchar](MAX) NULL,
	--[EmergencyEndTime ][varchar](MAX) NULL,
	[ReferralFromHospitalCode][varchar](MAX) NULL,
	[ReferralToHospitalCode][varchar](MAX) NULL,
	[ActualHospitalCode][varchar](MAX) NULL,
	[MedicalServicePlanCode][varchar](MAX) NULL,
	[PilotPlanTypeCode] [varchar](MAX) NULL,
	[TotalNursePatientPoints] [varchar](MAX) NULL

	--InpSummaryId bigint NOT NULL,
	--InpSplitFileId int NOT NULL,
	--ExpenseYearMonth varchar(6) NOT NULL,
	--InpatientNo char(9) NOT NULL,
	--MedicalNoteNo char(8) NOT NULL,
	--SplitNo int NOT NULL,
	--PatientType int NOT NULL,
	--AmendmentReasonType int NOT NULL,
	--InpExpenseFileId bigint NOT NULL,
	--CopaymentType int NOT NULL,
	--MultipBirthsType int NOT NULL,
	--ClaimType int NOT NULL,
	--ClaimTypeCode varchar(16) NOT NULL,
	--NHIDivisionCode varchar(16) NOT NULL,
	--PilotPlanType int NOT NULL,
	--IsTemp bit NOT NULL,
	--IsAccident bit NOT NULL,
	--ModifyTime datetime NOT NULL,
	--ModifyEmpId int NOT NULL,
)

INSERT INTO #CLATInpNHIPointsList_INSXMLII
SELECT
Node.Data.value('(dhead/d5)[1]','VARCHAR(MAX)')
,Node.Data.value('(dhead/d2)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d4)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d3)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d6)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d7)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d1)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d9)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d10)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d11)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d12)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d13)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d14)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d15)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d16)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d17)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d18)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d19)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d20)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d21)[1]','VARCHAR(MAX)')
--,Node.Data.value('(dbody/d22)[1]','VARCHAR(MAX)')
--,Node.Data.value('(dbody/d23)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d24)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d25)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d26)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d27)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d28)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d29)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d30)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d31)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d32)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d33)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d34)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d35)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d36)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d37)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d38)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d39)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d40)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d41)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d42)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d43)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d44)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d45)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d46)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d47)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d48)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d49)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d50)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d51)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d52)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d53)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d54)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d55)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d56)[1]','VARCHAR(MAX)')
,Node.Data.value('(dhead/d57)[1]','VARCHAR(MAX)')
,Node.Data.value('(dhead/d58)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d59)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d60)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d61)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d62)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d63)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d64)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d65)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d66)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d67)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d68)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d69)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d70)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d71)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d72)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d73)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d74)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d75)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d76)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d77)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d78)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d79)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d80)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d81)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d82)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d83)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d84)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d85)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d86)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d87)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d88)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d89)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d90)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d91)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d92)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d93)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d94)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d95)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d96)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d97)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d98)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d99)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d100)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d101)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d102)[1]','NVARCHAR(MAX)')
,Node.Data.value('(dbody/d103)[1]','NVARCHAR(MAX)')
,Node.Data.value('(dbody/d104)[1]','VARCHAR(MAX)')
--,Node.Data.value('(dbody/d105)[1]','VARCHAR(MAX)')
--,Node.Data.value('(dbody/d106)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d107)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d108)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d109)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d110)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d111)[1]','VARCHAR(MAX)')
,Node.Data.value('(dbody/d112)[1]','VARCHAR(MAX)')
FROM @XMLData.nodes('_x0023_INSXMLII_10801XML/XMLData/inpatient/ddata') Node(Data) 




--SELECT * FROM CLATInpNHIPointsList

--set identity_insert dbo.CLATInpNHIPointsList on

insert into dbo.CLATInpNHIPointsList(
[InpSummaryId]
           ,[InpSplitFileId]
           ,[NHICaseTypeCode]
           ,[ExpenseYearMonth]
           ,[InpatientNo]
           ,[MedicalNoteNo]
           ,[PatientName]
           ,[ClaimNo]
           ,[SplitNo]
           ,[PatientType]
           ,[PatientTypeCode]
           ,[AmendmentReasonType]
           ,[AmendmentReasonCode]
           ,[InpExpenseFileId]
           ,[TWDrgCode]
           ,[TotalNursePatientPoints]
           ,[CopaymentType]
           ,[CopaymentTypeCode]
           ,[ReferralToHospitalCode]
           ,[MultipBirthsType]
           ,[MultipBirthsTypeCode]
           ,[PatientBirthday]
           ,[NHIBenefitTypeCode]
           ,[ClaimType]
           ,[ClaimTypeCode]
           ,[PatientIdNo]
           ,[DivisionCode]
           ,[NHIDivisionCode]
           ,[AdmissionDate]
           ,[DischargeDate]
           ,[ClaimBeginDate]
           ,[ClaimEndDate]
           ,[AcuteBedDay]
           ,[ChronicBedDay]
           ,[ICFormatNo]
           ,[TWDrgPaymentCode]
           ,[DoctorIdNo]
           ,[DrgCode]
           ,[DischargeStateCode]
           ,[ExternalFactorType1]
           ,[ExternalFactorType2]
           ,[MainDiseasesCode]
           ,[SubDiseasesCode1]
           ,[SubDiseasesCode2]
           ,[SubDiseasesCode3]
           ,[SubDiseasesCode4]
           ,[SubDiseasesCode5]
           ,[SubDiseasesCode6]
           ,[SubDiseasesCode7]
           ,[SubDiseasesCode8]
           ,[SubDiseasesCode9]
           ,[SubDiseasesCode10]
           ,[SubDiseasesCode11]
           ,[SubDiseasesCode12]
           ,[SubDiseasesCode13]
           ,[SubDiseasesCode14]
           ,[SubDiseasesCode15]
           ,[SubDiseasesCode16]
           ,[SubDiseasesCode17]
           ,[SubDiseasesCode18]
           ,[SubDiseasesCode19]
           ,[MainOperationCode]
           ,[SubOperationCode1]
           ,[SubOperationCode2]
           ,[SubOperationCode3]
           ,[SubOperationCode4]
           ,[SubOperationCode5]
           ,[SubOperationCode6]
           ,[SubOperationCode7]
           ,[SubOperationCode8]
           ,[SubOperationCode9]
           ,[SubOperationCode10]
           ,[SubOperationCode11]
           ,[SubOperationCode12]
           ,[SubOperationCode13]
           ,[SubOperationCode14]
           ,[SubOperationCode15]
           ,[SubOperationCode16]
           ,[SubOperationCode17]
           ,[SubOperationCode18]
           ,[SubOperationCode19]
           ,[TotalOrderCount]
           ,[DiagnosticFee]
           ,[WardFee]
           ,[TubeMealFee]
           ,[ExaminationFee]
           ,[XRayFee]
           ,[TreatmentFee]
           ,[OperationFee]
           ,[RehabilitationFee]
           ,[BloodFee]
           ,[HemoFee]
           ,[AnesthesiaFee]
           ,[OptionalMaterialsFee]
           ,[MedicineFee]
           ,[MedicineServiceFee]
           ,[PsychiatricFee]
           ,[InjectionFee]
           ,[BabyFee]
           ,[TotalAmount]
           ,[CopaymentAmount]
           ,[ApplicationAmount]
           ,[Acute1To30Amount]
           ,[Acute1To30CopaymentAmount]
           ,[Acute31To60Amount]
           ,[Acute31To60CopaymentAmount]
           ,[AcuteOver61Amount]
           ,[AcuteOver61CopaymentAmount]
           ,[Chronic1To30Amount]
           ,[Chronic1To30CopaymentAmount]
           ,[Chronic31To90Amount]
           ,[Chronic31To90CopaymentAmount]
           ,[Chronic91To180Amount]
           ,[Chronic91To180CopaymentAmount]
           ,[ChronicOver180Amount]
           ,[ChronicOver180CopaymentAmount]
           ,[NeonatalBirthday]
           ,[InapplicableTWDrgCode]
           ,[EmergencyBeginTime]
           ,[EmergencyEndTime]
           ,[ReferralFromHospitalCode]
           ,[ActualHospitalCode]
           ,[MedicalServicePlanCode]
           ,[CorrectiveHospital]
           ,[PilotPlanType]
           ,[PilotPlanTypeCode]
           ,[IsTemp]
           ,[IsAccident]
           ,[ModifyTime]
		   ,[ModifyEmpId]
)

select 
   ''
      ,''
      ,ISNULL(NHICaseTypeCode,'')
      ,''
      ,''
      ,''
      ,LTRIM(RTRIM(PatientName))
      ,ISNULL(ClaimNo,'')
      ,''
      ,''
      ,ISNULL(PatientTypeCode,'')
      ,''
      ,ISNULL(AmendmentReasonCode,'')
      ,''
      ,ISNULL(TWDrgCode,'')
      ,ISNULL(convert(smallint,TotalNursePatientPoints),0)
      ,''
      ,ISNULL(CopaymentTypeCode,'')
      ,ISNULL(ReferralToHospitalCode,'')
      ,''
      ,ISNULL(MultipBirthsTypeCode,'')
      ,ISNULL(PatientBirthday,'')
      ,ISNULL(NHIBenefitTypeCode,'')
      ,''
      ,''
      ,ISNULL(PatientIdNo,'')
      ,ISNULL(DivisionCode,'')
      ,''
      ,ISNULL(AdmissionDate,'')
      ,ISNULL(DischargeDate,'')
      ,ISNULL(ClaimBeginDate,'')
      ,ISNULL(ClaimEndDate,'')
      ,ISNULL(AcuteBedDay,'')
      ,ISNULL(ChronicBedDay,'')
      ,ISNULL(ICFormatNo,'')
      ,ISNULL(TWDrgPaymentCode,'')
      ,ISNULL(DoctorIdNo,'')
      ,ISNULL(DrgCode,'')
      ,ISNULL(DischargeStateCode,'')
      ,''
      ,''
      ,ISNULL(MainDiseasesCode,'')
      ,ISNULL(SubDiseasesCode1,'')
      ,ISNULL(SubDiseasesCode2,'')
      ,ISNULL(SubDiseasesCode3,'')
      ,ISNULL(SubDiseasesCode4,'')
      ,ISNULL(SubDiseasesCode5,'')
      ,ISNULL(SubDiseasesCode6,'')
      ,ISNULL(SubDiseasesCode7,'')
      ,ISNULL(SubDiseasesCode8,'')
      ,ISNULL(SubDiseasesCode9,'')
      ,ISNULL(SubDiseasesCode10,'')
      ,ISNULL(SubDiseasesCode11,'')
      ,ISNULL(SubDiseasesCode12,'')
      ,ISNULL(SubDiseasesCode13,'')
      ,ISNULL(SubDiseasesCode14,'')
      ,ISNULL(SubDiseasesCode15,'')
      ,ISNULL(SubDiseasesCode16,'')
      ,ISNULL(SubDiseasesCode17,'')
      ,ISNULL(SubDiseasesCode18,'')
      ,ISNULL(SubDiseasesCode19,'')
      ,ISNULL(MainOperationCode,'')
      ,ISNULL(SubOperationCode1,'')
      ,ISNULL(SubOperationCode2,'')
      ,ISNULL(SubOperationCode3,'')
      ,ISNULL(SubOperationCode4,'')
      ,ISNULL(SubOperationCode5,'')
      ,ISNULL(SubOperationCode6,'')
      ,ISNULL(SubOperationCode7,'')
      ,ISNULL(SubOperationCode8,'')
      ,ISNULL(SubOperationCode9,'')
      ,ISNULL(SubOperationCode10,'')
      ,ISNULL(SubOperationCode11,'')
      ,ISNULL(SubOperationCode12,'')
      ,ISNULL(SubOperationCode13,'')
      ,ISNULL(SubOperationCode14,'')
      ,ISNULL(SubOperationCode15,'')
      ,ISNULL(SubOperationCode16,'')
      ,ISNULL(SubOperationCode17,'')
      ,ISNULL(SubOperationCode18,'')
      ,ISNULL(SubOperationCode19,'')
      ,ISNULL(convert(smallint,TotalOrderCount),0)
      ,ISNULL(convert(int,DiagnosticFee),0)
      ,ISNULL(convert(int,WardFee),0)
      ,ISNULL(convert(int,TubeMealFee),0)
      ,ISNULL(convert(int,ExaminationFee),0)
      ,ISNULL(convert(int,XRayFee),0)
      ,ISNULL(convert(int,TreatmentFee),0)
      ,ISNULL(convert(int,OperationFee),0)
      ,ISNULL(convert(int,RehabilitationFee),0)
      ,ISNULL(convert(int,BloodFee),0)
      ,ISNULL(convert(int,HemoFee),0)
      ,ISNULL(convert(int,AnesthesiaFee),0)
      ,ISNULL(convert(int,OptionalMaterialsFee),0)
      ,ISNULL(convert(int,MedicineFee),0)
      ,ISNULL(convert(int,MedicineServiceFee),0)
      ,ISNULL(convert(int,PsychiatricFee),0)
      ,ISNULL(convert(int,InjectionFee),0)
      ,ISNULL(convert(int,BabyFee),0)
      ,ISNULL(convert(int,TotalAmount),0)
      ,ISNULL(convert(int,CopaymentAmount),0)
      ,ISNULL(convert(int,ApplicationAmount),0)
      ,ISNULL(convert(int,Acute1To30Amount),0)
      ,ISNULL(convert(int,Acute1To30CopaymentAmount),0)
      ,ISNULL(convert(int,Acute31To60Amount),0)
      ,ISNULL(convert(int,Acute31To60CopaymentAmount),0)
      ,ISNULL(convert(int,AcuteOver61Amount),0)
      ,ISNULL(convert(int,AcuteOver61CopaymentAmount),0)
      ,ISNULL(convert(int,Chronic1To30Amount),0)
      ,ISNULL(convert(int,Chronic1To30CopaymentAmount),0)
      ,ISNULL(convert(int,Chronic31To90Amount),0)
      ,ISNULL(convert(int,Chronic31To90CopaymentAmount),0)
      ,ISNULL(convert(int,Chronic91To180Amount),0)
      ,ISNULL(convert(int,Chronic91To180CopaymentAmount),0)
      ,ISNULL(convert(int,ChronicOver180Amount),0)
      ,ISNULL(convert(int,ChronicOver180CopaymentAmount),0)
      ,ISNULL(NeonatalBirthday,'')
      ,ISNULL(InapplicableTWDrgCode,'')
      ,''
      ,''
      ,ISNULL(ReferralFromHospitalCode,'')
      ,ISNULL(ActualHospitalCode,'')
      ,ISNULL(MedicalServicePlanCode,'')
      ,ISNULL(CorrectiveHospital,'')
      ,''
      ,ISNULL(PilotPlanTypeCode,'')
      ,''
      ,''
      ,''
	  ,''

	
	  
from #CLATInpNHIPointsList_INSXMLII

--UPDATE CLATInpNHIPointsList SET SubDiseasesCode19 = LTRIM(RTRIM(SubDiseasesCode19)) 

--truncate table dbo.#CLATInpNHIPointsList_INSXMLII

--SELECT * FROM #CLATInpNHIPointsList_INSXMLII
--SELECT * FROM CLATInpNHIPointsList


--set identity_insert dbo.CLATInpNHIPointsList OFF

SET @INS_CNT = @@ROWCOUNT;




END
GO


