DECLARE @BusinessDate DATE = '2017-04-30';
DECLARE @BusinessMonth INTEGER = 201704;

DELETE FROM Landing.Import_XML_File;
DELETE FROM Landing.Import_Daily;
DELETE FROM Landing.Import_Event;

DELETE FROM App.AP70_HIGHEST_ORDER_DEDUCTION WHERE Business_Date = @BusinessDate;

DELETE FROM App.AP56_SIMULATOR WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP55_DEFECT WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP54_IMPACTED WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP53_DELAY WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP52_AVAILABILITY WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP51_CANCELLATION WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP50_EVENT WHERE Business_Date = @BusinessDate;

DELETE FROM App.AP68_WORK_ORDER_SUSPENSION;

DELETE FROM App.AP65_COMMENT WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP60_STATE_RECORD WHERE Business_Date = @BusinessDate;

DELETE FROM App.AP02_EVENT_ATTRIBUTE_VALUE WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP01_DAILY_ATTRIBUTE_VALUE WHERE Business_Date = @BusinessDate;
DELETE FROM App.AP00_MONTHLY_ATTRIBUTE_VALUE WHERE Business_Month_ID = @BusinessMonth;

DELETE FROM App.AP05_XML_FILE WHERE Business_Date = @BusinessDate;

UPDATE App.AP11_BUSINESS_DAY
   SET [Status] = 'OPEN'
     , QR_XML_Loaded = 'N'
     , PC_XML_Loaded = 'N'
 WHERE Business_Date = @BusinessDate;

UPDATE App.AP10_BUSINESS_MONTH
   SET [Status] = 'OPEN'
 WHERE [ID] = @BusinessMonth



