CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.AUDIENCELAB_BACKUP_STAGE
    url='s3://audiencelab-4eyes/audiencelab_backup/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='TROVO.PUBLIC.UNIVERSAL_PERSON_FILE_FORMAT_2'
    );


CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.FOUR_EYES_STAGE_CSV
    url='s3://audiencelab-4eyes/AIGDS/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='FOUR_EYES.PUBLIC.FOUR_EYES_CSV_FORMAT'
    );



CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.FOUR_EYES_STAGE_JSON
    url='s3://audiencelab-4eyes/hem_upid/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='FOUR_EYES.PUBLIC.FOUR_EYES_JSON_FORMAT'
    );



CREATE OR REPLACE STAGE FOUR_EYES.PUBLIC.FOUR_EYES_UNIVERSAL_PERSON_STAGE
    url='s3://audiencelab-4eyes/universal_person/'
    STORAGE_INTEGRATION=FOUR_EYES_INTEGRATION
    FILE_FORMAT=(
        FORMAT_NAME='FOUR_EYES.PUBLIC.FOUR_EYES_PARQUET_FORMAT'
    );
    


LIST @FOUR_EYES.PUBLIC.FOUR_EYES_STAGE_CSV;



