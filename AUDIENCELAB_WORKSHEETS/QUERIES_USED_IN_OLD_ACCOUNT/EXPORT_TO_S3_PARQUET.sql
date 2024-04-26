// 0) Validate Tables:
SELECT * FROM TROVO.PUBLIC.BIG_IP_TO_UPID LIMIT 5;
SELECT * FROM AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON LIMIT 5;



//1) Target Tables are "TROVO.PUBLIC.BIG_IP_TO_UPID" and "AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON"



//2) Need to unload the content of these tables into s3, in parquet format.




//3) Create FOUR_EYES_PARQUET FILE FORMAT:
CREATE OR REPLACE FILE FORMAT FOUR_EYES.PUBLIC.FOUR_EYES_PARQUET_FORMAT
  TYPE = 'PARQUET'
  COMPRESSION = 'SNAPPY';





-- Create Stage - PARQUET (up_to_hem folder)
CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.FOUR_EYES_UP_TO_HEM_STAGE
    url='s3://audiencelab-4eyes/up_to_hem/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='FOUR_EYES.PUBLIC.FOUR_EYES_PARQUET_FORMAT'
    );

    
-- Create Stage - PARQUET (universal_person folder)
CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.FOUR_EYES_UNIVERSAL_PERSON_STAGE
    url='s3://audiencelab-4eyes/universal_person/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='FOUR_EYES.PUBLIC.FOUR_EYES_PARQUET_FORMAT'
    );



// 4) List all files in "FOUR_EYES_UP_TO_HEM_STAGE":
LIST @FOUR_EYES.PUBLIC.FOUR_EYES_UP_TO_HEM_STAGE;
LIST @FOUR_EYES.PUBLIC.FOUR_EYES_UNIVERSAL_PERSON_STAGE;


// 5) Unload data into s3 stage/s3 folder (test with "SMALL_IP_TO_UPID" table):
COPY INTO @FOUR_EYES.PUBLIC.FOUR_EYES_UP_TO_HEM_STAGE
FROM (
    SELECT * FROM TROVO.PUBLIC.BIG_IP_TO_UPID
      );



// 6) Unload data into s3 stage/s3 folder (now with universal_person):
COPY INTO @FOUR_EYES.PUBLIC.FOUR_EYES_UNIVERSAL_PERSON_STAGE
FROM (
    SELECT * FROM AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON
      );










353027495



SELECT COUNT(*) FROM TROVO.PUBLIC.BIG_IP_TO_UPID;


// 350753273
SELECT COUNT(*) FROM AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON;
