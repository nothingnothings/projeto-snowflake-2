// 0) Create Schema for testing:
CREATE TRANSIENT SCHEMA FOUR_EYES.TEST;

// 0.5) Create Transient Table for testing:
CREATE TRANSIENT TABLE FOUR_EYES.TEST.PREMADE_4EYES_TEST (
    DATE DATE,
	SEGMENT VARCHAR(16777216),
	UP_ID VARCHAR(16777216)
);

// 0.6) Disable Time-Travel:
ALTER TABLE FOUR_EYES.TEST.PREMADE_4EYES_TEST
SET DATA_RETENTION_TIME_IN_DAYS=0;

// 0.7) Fill table with some rows from premade_4eyes_lite table:
INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-11') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-12') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-13') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-14') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-15') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-16') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-17') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-18') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-19') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-20') LIMIT 100;

INSERT INTO FOUR_EYES.TEST.PREMADE_4EYES_TEST
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-21') LIMIT 100;


// 0.8) Check PREMADE_4EYES_TEST Table's contents 
SELECT * FROM FOUR_EYES.TEST.PREMADE_4EYES_TEST;



// 1) Create procedure which will delete rows older than 7 days from premade_4eyes_lite table, daily
CREATE OR REPLACE PROCEDURE FOUR_EYES.PUBLIC.DELETE_OLD_DATA()
  //RETURNS STRING
  RETURNS STRING
  LANGUAGE JAVASCRIPT
  EXECUTE AS CALLER
AS
$$
  var currentDate = new Date();
  var sevenDaysAgo = new Date();
  sevenDaysAgo.setDate(currentDate.getDate() - 7);

  var formattedDate = sevenDaysAgo.toISOString().split('T')[0];

  //return formattedDate;

  //var sql_command = `DELETE FROM FOUR_EYES.TEST.PREMADE_4EYES_TEST
   //             WHERE DATE < '${formattedDate}'`

   //var sql_command = `SELECT COUNT(*) AS Row_Count FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
    //            WHERE DATE < '${formattedDate}'`;

   var sql_command = `DELETE FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
                     WHERE DATE < '${formattedDate}'`;

                     
  try {
    var stmt = snowflake.createStatement({sqlText: sql_command});
    var rs = stmt.execute();
   return 'Old data successfully deleted.';

  //var row;
  //while (rs.next()) {
   // row = rs.getColumnValue(1);
  //}
  //return row;
  } catch (err) {
    return 'Error deleting old data: ' + err.message;
  }
$$;


CALL FOUR_EYES.PUBLIC.DELETE_OLD_DATA();








// currently, we have 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21.


// desired dates are 15,16,17,18,19,20,21.










// 3) Validate PREMADE_4EYES_LITE (12 days of data):
SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-11') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-12') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-13') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-14') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-15') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-16') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-17') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-18') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-19') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-20') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-21') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-22') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-23') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-24') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-25') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-26') LIMIT 1000;



// procedure output (without special select logic): 9.301.425.378

// procedure output (with special select logic): 9.301.425.378 (the same).

// 19.350.903.902 rows
SELECT COUNT(*) AS Row_Count FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-02-11', '2024-02-12', '2024-02-13', '2024-02-14', '2024-02-15', '2024-02-16', '2024-02-17', '2024-02-18');


13.490.895.949
SELECT COUNT(*) AS Row_Count FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE;

// KEEP:
// 19, 20, 21, 22, 23, 24, 25

// LOSE:
// 11, 12, 13, 14, 15, 16, 17, 18 




//2) Create task which will run the procedure, everyday, at 1 AM CST:
CREATE OR REPLACE TASK FOUR_EYES.PUBLIC.DELETE_OLD_DATA_TASK
   WAREHOUSE=ANALYST_WH
   SCHEDULE='USING CRON 0 2 * * * America/Chicago'
   COMMENT= 'Task to delete data from PREMADE_4EYES_LITE table older than 7 days from the current runtime'
   AS
   CALL FOUR_EYES.PUBLIC.DELETE_OLD_DATA();


//3) Resume task:
ALTER TASK FOUR_EYES.PUBLIC.DELETE_OLD_DATA_TASK RESUME;




EXPLAIN USING TEXT CREATE OR REPLACE TRANSIENT TABLE STATISTICS.PUBLIC.RESOLVED_TROVO_FEED_FULL
AS 
SELECT 
-- Info from Universal Person:
UP.FIRST_NAME AS "FIRST_NAME",
UP.LAST_NAME AS "LAST_NAME",
UP.BUSINESS_EMAIL AS "BUSINESS_EMAIL",
UP.PROGRAMMATIC_BUSINESS_EMAILS AS "PROGRAMMATIC_BUSINESS_EMAILS", 
UP.MOBILE_PHONE AS "MOBILE_PHONE",
UP.DIRECT_NUMBER AS "DIRECT_NUMBER",
UP.PERSONAL_PHONE AS "PERSONAL_PHONE",
UP.LINKEDIN_URL AS "LINKEDIN_URL",
UP.PERSONAL_ADDRESS AS "PERSONAL_ADDRESS",
UP.PERSONAL_ADDRESS_2 AS "PERSONAL_ADDRESS_2",
UP.PERSONAL_CITY AS "PERSONAL_CITY",
UP.PERSONAL_STATE AS "PERSONAL_STATE",
UP.PERSONAL_ZIP AS "PERSONAL_ZIP",
UP.PERSONAL_ZIP4 AS "PERSONAL_ZIP4",
UP.PERSONAL_EMAIL AS "PERSONAL_EMAIL",
UP.ADDITIONAL_PERSONAL_EMAILS AS "ADDITIONAL_PERSONAL_EMAILS",
UP.GENDER AS "GENDER",
UP.AGE_RANGE AS "AGE_RANGE",
UP.MARRIED AS "MARRIED",
UP.CHILDREN AS "CHILDREN",
UP.INCOME_RANGE AS "INCOME_RANGE",
UP.NET_WORTH AS "NET_WORTH",
UP.HOMEOWNER AS "HOMEOWNER",
UP.JOB_TITLE AS "JOB_TITLE",
UP.SENIORITY_LEVEL AS "SENIORITY_LEVEL",
UP.DEPARTMENT AS "DEPARTMENT",
UP.PROFESSIONAL_ADDRESS AS "PROFESSIONAL_ADDRESS",
UP.PROFESSIONAL_ADDRESS2 AS "PROFESSIONAL_ADDRESS2",
UP.PROFESSIONAL_CITY AS "PROFESSIONAL_CITY",
UP.PROFESSIONAL_STATE AS "PROFESSIONAL_STATE",
UP.PROFESSIONAL_ZIP AS "PROFESSIONAL_ZIP",
UP.PROFESSIONAL_ZIP4 AS "PROFESSIONAL_ZIP4",
UP.COMPANY_NAME AS "COMPANY_NAME",
UP.COMPANY_DOMAIN AS "COMPANY_DOMAIN",
UP.COMPANY_PHONE AS "COMPANY_PHONE",
UP.COMPANY_SIC AS "COMPANY_SIC",
UP.COMPANY_ADDRESS AS "COMPANY_ADDRESS",
UP.COMPANY_CITY AS "COMPANY_CITY",
UP.COMPANY_STATE AS "COMPANY_STATE",
UP.COMPANY_ZIP AS "COMPANY_ZIP",
UP.COMPANY_LINKEDIN_URL AS "COMPANY_LINKEDIN_URL",
UP.COMPANY_REVENUE AS "COMPANY_REVENUE",
UP.COMPANY_EMPLOYEE_COUNT AS "COMPANY_EMPLOYEE_COUNT",
UP.PRIMARY_INDUSTRY AS "PRIMARY_INDUSTRY",
UP.BUSINESS_EMAIL_VALIDATION_STATUS AS "BUSINESS_EMAIL_VALIDATION_STATUS",
UP.BUSINES_EMAIL_LAST_SEEN AS "BUSINES_EMAIL_LAST_SEEN",
UP.PERSONAL_EMAIL_LAST_SEEN_VALIDATION_STATUS AS "PERSONAL_EMAIL_LAST_SEEN_VALIDATION_STATUS",
UP.PERSONAL_EMAIL_LAST_SEEN AS "PERSONAL_EMAIL_LAST_SEEN",
UP.COMPANY_LAST_UPDATED AS "COMPANY_LAST_UPDATED",
UP.JOB_TITLE_LAST_UPDATED AS "JOB_TITLE_LAST_UPDATED",
UP.LAST_UPDATED AS "LAST_UPDATED",
UP.SHA256_PERSONAL_EMAIL AS "SHA256_PERSONAL_EMAIL",
-- Info from RESOLVED_TROVO_FEED:
RTF.SHA256 AS "SHA256",
RTF.PARTNERUID AS "PARTNERUID",
RTF.PIXEL_ID AS "PIXEL_ID",
RTF.CREATED_AT AS "RESOLVED_TROVO_FEED_CREATED_AT",
-- Info from VISITS:
V.PATH AS "PATH",
V.TITLE AS "TITLE",
V.URL AS "URL",
V.CREATED_AT AS "VISIT_CREATED_AT"
FROM STATISTICS.PUBLIC.RESOLVED_TROVO_FEED AS RTF
INNER JOIN AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON AS UP
ON RTF.EMAIL_ADDRESS_1 = UP.PERSONAL_EMAIL OR RTF.SHA256 = UP.SHA256_PERSONAL_EMAIL
INNER JOIN STATISTICS.PUBLIC.VISITS AS V
ON V.COOKIE_SYNC_ID = RTF.PARTNERUID;