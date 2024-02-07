













-- Seeing if simple command works
COPY INTO PIXEL_RESOLUTIONS.USER1."RESOLUTIONS_PIX_e0bfc1fc-8a06-48a8-b221-673653f0020e"
FROM
    (
          SELECT
          $1 IDENTITY_ID,
          $2 DATE,
          $3 HTTP_REFERER,
          $4 REQUEST_URI,
          REPLACE($5,'"','') AS ZIP,
          $6 EMAIL,
          $7 FIRSTNAME,
          $8 LASTNAME,
          $9 ADDRESS,
          $10 CITY,
          $11 STATE,
          REPLACE($12,'"','') AS ZIPCODE,
          REPLACE($13, '"', '') AS PLUS_4,
          $14 COUNTYNAME,
          $15 LATITUDE,
          $16 LONGITUDE,
          $17 MARITALSTATUS,
          $18 ESTIMATEDINCOMERANGE,
          $19 DATEOFBIRTH,
          $20 BIRTHYEAR,
          $21 AGE,
          $22 GENDER,
          $23 INFERREDCREDITSCORE,
          $24 ETHNIC,
          $25 DWELLINGTYPE,
          $26 HOMEOWNERRENTER,
          $27 HOMEVALUE,
          $28 AUTOVIN,
          $29 YEAR,
          $30 MAKE,
          $31 MODEL,
          $32 TRIM,
          $33 STYLE,
          $34 VEHICLE_TYPE,
          $35 BODY_TYPE,
          $36 BODY_SUBTYPE,
          $37 DOORS,
          REPLACE(SUBSTR($38, 2), ',', '') AS MSRP,
          $39 GVW_RANGE,
          REPLACE(REPLACE($40, ',', ''), ' lbs', '') AS GROSS_VEHICLE_WEIGHT_RATING,
          $41 TMP_TANK1_GAL,
          REPLACE(REPLACE($42, ',', ''), ' lbs', '') AS MAX_PAYLOAD,
          $43 TONNAGE,
          $44 DEF_ENGINE_ID,
          $45 DRIVE_TYPE,
          $46 FUEL_TYPE,
          $47 DEF_ENGINE_BLOCK,
          $48 DEF_ENGINE_CYLINDERS,
          $49 DEF_ENGINE_SIZE,
          $50 ENGINE_SIZE_UOM,
          $51 DEF_ENGINE_ASPIRATION,
          REPLACE($52, 'AUTO', '') DEF_TRANS_ID,
          $53 DEF_TRANS_SPEEDS,
          $54 AUTO_VALIDATION_DATE,
          $55 TRANSACTION_TYPE,
          $56 AUTO_TRANSACTION_DATE,
          $57 FIRST_SEEN,
          $58 LAST_SEEN,
          $59 RECORDID,
          $60 BROWSER,
          $61 DEVICE,
          $62 OS,
          $63 CARRIER_ROUTE,
          $64 MSA,
          REPLACE($65, 'MSA', '') MSA_CODE,
          $66 AGE_RANGE,
          CAST($67 AS STRING) AS ESTIMATED_INCOME,
          CAST($68 AS STRING) AS NET_WORTH,
          $69 ETHNIC_GROUP,
          $70 LANGUAGE,
          $71 DOB_MONTH,
          $72 DOB_DAY,
          $73 RELIGION,
          $74 YEARS_SINCE_HOME_WAS_BUILT,
          $75 NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER,
          $76 BANK_CARD_HOLDER,
          $77 CREDIT_CARD_HOLDER_UNKNOWN_TYPE,
          $78 CREDIT_CARD_USER,
          $79 BANK_CARD_PRESENCE_IN_HOUSEHOLD,
          $80 EDUCATION,
          $81 PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE,
          $82 _2ND_MOST_RECENT_MORTGAGE_DATE,
          $83 _2ND_MOST_RECENT_LENDER_NAME,
          $84 LOAN_TO_VALUE_RATIO,
          $85 _2ND_MORTGAGE_TYPE,
          $86 AIR_CONDITIONING,
          $87 POLITICAL_CHARITABLE_DONATION,
          $88 CONSUMER_ELECTRONICS,
          $89 ELECTRONICS_COMPUTING_AND_HOME_OFFICE,
          $90 INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH,
          $91 READING_GENERAL,
          $92 READING_MAGAZINES,
          $93 LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES,
          $94 COOKING_GENERAL,
          $95 FOODS_NATURAL,
          $96 HEALTH_ENTHUSIAST,
          $97 HEALTH_MEDICAL,
          $98 COMP_OWN,
          $99 GAMBLERS,
          $100 OUTDOORSMEN,
          $101 HOME_FURNISHINGS_DECORATING,
          $102 ALCOHOL_USER,
          $103 SOURCE,
          $104 DATE_AND_TIME
        FROM @CONTROL_DB.PIXEL_RESOLUTION_STAGES."RESOLUTIONS_PIX_e0bfc1fc-8a06-48a8-b221-673653f0020e_STAGE"
    )
    FILE_FORMAT=(
    FORMAT_NAME=CONTROL_DB.FILE_FORMATS.CSV_FORMAT
    );






CREATE OR REPLACE TASK CONTROL_DB.PIXEL_RESOLUTION_TASKS."RESOLUTIONS_PIX_e0bfc1fc-8a06-48a8-b221-673653f0020e_TASK"
    WAREHOUSE = PIXEL_WH
    SCHEDULE='1 MINUTE' -- shortest amount of time possible between runs
-- SCHEDULE='15 MINUTES' - desired time
AS 
MERGE INTO PIXEL_RESOLUTIONS.USER1."RESOLUTIONS_PIX_e0bfc1fc-8a06-48a8-b221-673653f0020e" AS PIX_R_INT
USING 
    (
          SELECT
          $1 IDENTITY_ID,
          $2 DATE,
          $3 HTTP_REFERER,
          $4 REQUEST_URI,
          REPLACE($5,'"','') AS ZIP,
          $6 EMAIL,
          $7 FIRSTNAME,
          $8 LASTNAME,
          $9 ADDRESS,
          $10 CITY,
          $11 STATE,
          REPLACE($12,'"','') AS ZIPCODE,
          REPLACE($13, '"', '') AS PLUS_4,
          $14 COUNTYNAME,
          $15 LATITUDE,
          $16 LONGITUDE,
          $17 MARITALSTATUS,
          $18 ESTIMATEDINCOMERANGE,
          $19 DATEOFBIRTH,
          $20 BIRTHYEAR,
          $21 AGE,
          $22 GENDER,
          $23 INFERREDCREDITSCORE,
          $24 ETHNIC,
          $25 DWELLINGTYPE,
          $26 HOMEOWNERRENTER,
          $27 HOMEVALUE,
          $28 AUTOVIN,
          $29 YEAR,
          $30 MAKE,
          $31 MODEL,
          $32 TRIM,
          $33 STYLE,
          $34 VEHICLE_TYPE,
          $35 BODY_TYPE,
          $36 BODY_SUBTYPE,
          $37 DOORS,
          REPLACE(SUBSTR($38, 2), ',', '') AS MSRP,
          $39 GVW_RANGE,
          REPLACE(REPLACE($40, ',', ''), ' lbs', '') AS GROSS_VEHICLE_WEIGHT_RATING,
          $41 TMP_TANK1_GAL,
          REPLACE(REPLACE($42, ',', ''), ' lbs', '') AS MAX_PAYLOAD,
          $43 TONNAGE,
          $44 DEF_ENGINE_ID,
          $45 DRIVE_TYPE,
          $46 FUEL_TYPE,
          $47 DEF_ENGINE_BLOCK,
          $48 DEF_ENGINE_CYLINDERS,
          $49 DEF_ENGINE_SIZE,
          $50 ENGINE_SIZE_UOM,
          $51 DEF_ENGINE_ASPIRATION,
          REPLACE($52, 'AUTO', '') DEF_TRANS_ID,
          $53 DEF_TRANS_SPEEDS,
          $54 AUTO_VALIDATION_DATE,
          $55 TRANSACTION_TYPE,
          $56 AUTO_TRANSACTION_DATE,
          $57 FIRST_SEEN,
          $58 LAST_SEEN,
          $59 RECORDID,
          $60 BROWSER,
          $61 DEVICE,
          $62 OS,
          $63 CARRIER_ROUTE,
          $64 MSA,
          REPLACE($65, 'MSA', '') MSA_CODE,
          $66 AGE_RANGE,
          CAST($67 AS STRING) AS ESTIMATED_INCOME,
          CAST($68 AS STRING) AS NET_WORTH,
          $69 ETHNIC_GROUP,
          $70 LANGUAGE,
          $71 DOB_MONTH,
          $72 DOB_DAY,
          $73 RELIGION,
          $74 YEARS_SINCE_HOME_WAS_BUILT,
          $75 NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER,
          $76 BANK_CARD_HOLDER,
          $77 CREDIT_CARD_HOLDER_UNKNOWN_TYPE,
          $78 CREDIT_CARD_USER,
          $79 BANK_CARD_PRESENCE_IN_HOUSEHOLD,
          $80 EDUCATION,
          $81 PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE,
          $82 _2ND_MOST_RECENT_MORTGAGE_DATE,
          $83 _2ND_MOST_RECENT_LENDER_NAME,
          $84 LOAN_TO_VALUE_RATIO,
          $85 _2ND_MORTGAGE_TYPE,
          $86 AIR_CONDITIONING,
          $87 POLITICAL_CHARITABLE_DONATION,
          $88 CONSUMER_ELECTRONICS,
          $89 ELECTRONICS_COMPUTING_AND_HOME_OFFICE,
          $90 INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH,
          $91 READING_GENERAL,
          $92 READING_MAGAZINES,
          $93 LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES,
          $94 COOKING_GENERAL,
          $95 FOODS_NATURAL,
          $96 HEALTH_ENTHUSIAST,
          $97 HEALTH_MEDICAL,
          $98 COMP_OWN,
          $99 GAMBLERS,
          $100 OUTDOORSMEN,
          $101 HOME_FURNISHINGS_DECORATING,
          $102 ALCOHOL_USER,
          $103 SOURCE,
          $104 DATE_AND_TIME
        FROM @CONTROL_DB.PIXEL_RESOLUTION_STAGES."RESOLUTIONS_PIX_e0bfc1fc-8a06-48a8-b221-673653f0020e_STAGE"
    ) AS PIX_R_EXT
ON PIX_R_INT.IDENTITY_ID = PIX_R_EXT.IDENTITY_ID
WHEN MATCHED THEN
    UPDATE SET
       -- PIX_R_INT.DATE = TRY_TO_DATE(PIX_R_EXT.DATE, 'YYYY-MM-DD'),
        PIX_R_INT.DATE = PIX_R_EXT_DATE,
        PIX_R_INT.HTTP_REFERER = PIX_R_EXT.HTTP_REFERER,
        PIX_R_INT.REQUEST_URI = PIX_R_EXT.REQUEST_URI,
        PIX_R_INT.ZIP = PIX_R_EXT.ZIP,
        PIX_R_INT.EMAIL = PIX_R_EXT.EMAIL,
        PIX_R_INT.FIRSTNAME = PIX_R_EXT.FIRSTNAME,
        PIX_R_INT.LASTNAME = PIX_R_EXT.LASTNAME,
        PIX_R_INT.ADDRESS = PIX_R_EXT.ADDRESS,
        PIX_R_INT.CITY = PIX_R_EXT.CITY,
        PIX_R_INT.STATE = PIX_R_EXT.STATE,
        PIX_R_INT.ZIPCODE = PIX_R_EXT.ZIPCODE,
        PIX_R_INT.PLUS_4 = PIX_R_EXT.PLUS_4,
        PIX_R_INT.COUNTYNAME = PIX_R_EXT.COUNTYNAME,
        PIX_R_INT.LATITUDE = PIX_R_EXT.LATITUDE,
        PIX_R_INT.LONGITUDE = PIX_R_EXT.LONGITUDE,
        PIX_R_INT.MARITALSTATUS = PIX_R_EXT.MARITALSTATUS,
        PIX_R_INT.ESTIMATEDINCOMERANGE = PIX_R_EXT.ESTIMATEDINCOMERANGE,
        PIX_R_INT.DATEOFBIRTH = PIX_R_EXT.DATEOFBIRTH,
        PIX_R_INT.BIRTHYEAR = PIX_R_EXT.BIRTHYEAR,
        PIX_R_INT.AGE = PIX_R_EXT.AGE,
        PIX_R_INT.GENDER = PIX_R_EXT.GENDER,
        PIX_R_INT.INFERREDCREDITSCORE = PIX_R_EXT.INFERREDCREDITSCORE,
        PIX_R_INT.ETHNIC = PIX_R_EXT.ETHNIC,
        PIX_R_INT.DWELLINGTYPE = PIX_R_EXT.DWELLINGTYPE,
        PIX_R_INT.HOMEOWNERRENTER = PIX_R_EXT.HOMEOWNERRENTER,
        PIX_R_INT.HOMEVALUE = PIX_R_EXT.HOMEVALUE,
        PIX_R_INT.AUTOVIN = PIX_R_EXT.AUTOVIN,
        PIX_R_INT.YEAR = PIX_R_EXT.YEAR,
        PIX_R_INT.MAKE = PIX_R_EXT.MAKE,
        PIX_R_INT.MODEL = PIX_R_EXT.MODEL,
        PIX_R_INT.TRIM = PIX_R_EXT.TRIM,
        PIX_R_INT.STYLE = PIX_R_EXT.STYLE,
        PIX_R_INT.VEHICLE_TYPE = PIX_R_EXT.VEHICLE_TYPE,
        PIX_R_INT.BODY_TYPE = PIX_R_EXT.BODY_TYPE,
        PIX_R_INT.BODY_SUBTYPE = PIX_R_EXT.BODY_SUBTYPE,
        PIX_R_INT.DOORS = PIX_R_EXT.DOORS,
        PIX_R_INT.MSRP = PIX_R_EXT.MSRP,
        PIX_R_INT.GVW_RANGE = PIX_R_EXT.GVW_RANGE,
        PIX_R_INT.GROSS_VEHICLE_WEIGHT_RATING = PIX_R_EXT.GROSS_VEHICLE_WEIGHT_RATING,
        PIX_R_INT.TMP_TANK1_GAL = PIX_R_EXT.TMP_TANK1_GAL,
        PIX_R_INT.MAX_PAYLOAD = PIX_R_EXT.MAX_PAYLOAD,
        PIX_R_INT.TONNAGE = PIX_R_EXT.TONNAGE,
        PIX_R_INT.DEF_ENGINE_ID = PIX_R_EXT.DEF_ENGINE_ID,
        PIX_R_INT.DRIVE_TYPE = PIX_R_EXT.DRIVE_TYPE,
        PIX_R_INT.FUEL_TYPE = PIX_R_EXT.FUEL_TYPE,
        PIX_R_INT.DEF_ENGINE_BLOCK = PIX_R_EXT.DEF_ENGINE_BLOCK,
        PIX_R_INT.DEF_ENGINE_CYLINDERS = PIX_R_EXT.DEF_ENGINE_CYLINDERS,
        PIX_R_INT.DEF_ENGINE_SIZE = PIX_R_EXT.DEF_ENGINE_SIZE,
        PIX_R_INT.ENGINE_SIZE_UOM = PIX_R_EXT.ENGINE_SIZE_UOM,
        PIX_R_INT.DEF_ENGINE_ASPIRATION = PIX_R_EXT.DEF_ENGINE_ASPIRATION,
        PIX_R_INT.DEF_TRANS_ID = PIX_R_EXT.DEF_TRANS_ID,
        PIX_R_INT.DEF_TRANS_SPEEDS = PIX_R_EXT.DEF_TRANS_SPEEDS,
        PIX_R_INT.AUTO_VALIDATION_DATE = PIX_R_EXT.AUTO_VALIDATION_DATE,
        PIX_R_INT.TRANSACTION_TYPE = PIX_R_EXT.TRANSACTION_TYPE,
        PIX_R_INT.AUTO_TRANSACTION_DATE = PIX_R_EXT.AUTO_TRANSACTION_DATE,
        PIX_R_INT.FIRST_SEEN = PIX_R_EXT.FIRST_SEEN,
        PIX_R_INT.LAST_SEEN = PIX_R_EXT.LAST_SEEN,
        PIX_R_INT.RECORDID = PIX_R_EXT.RECORDID,
        PIX_R_INT.BROWSER = PIX_R_EXT.BROWSER,
        PIX_R_INT.DEVICE = PIX_R_EXT.DEVICE,
        PIX_R_INT.OS = PIX_R_EXT.OS,
        PIX_R_INT.CARRIER_ROUTE = PIX_R_EXT.CARRIER_ROUTE,
        PIX_R_INT.MSA = PIX_R_EXT.MSA,
        PIX_R_INT.MSA_CODE = PIX_R_EXT.MSA_CODE,
        PIX_R_INT.AGE_RANGE = PIX_R_EXT.AGE_RANGE,
        PIX_R_INT.ESTIMATED_INCOME = TO_CHAR(PIX_R_EXT.ESTIMATED_INCOME),
        PIX_R_INT.NET_WORTH = TO_CHAR(PIX_R_EXT.NET_WORTH),
        PIX_R_INT.ETHNIC_GROUP = PIX_R_EXT.ETHNIC_GROUP,
        PIX_R_INT.LANGUAGE = PIX_R_EXT.LANGUAGE,
        PIX_R_INT.DOB_MONTH = PIX_R_EXT.DOB_MONTH,
        PIX_R_INT.DOB_DAY = PIX_R_EXT.DOB_DAY,
        PIX_R_INT.RELIGION = PIX_R_EXT.RELIGION,
        PIX_R_INT.YEARS_SINCE_HOME_WAS_BUILT = PIX_R_EXT.YEARS_SINCE_HOME_WAS_BUILT,
        PIX_R_INT.NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER = PIX_R_EXT.NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER,
        PIX_R_INT.BANK_CARD_HOLDER = PIX_R_EXT.BANK_CARD_HOLDER,
        PIX_R_INT.CREDIT_CARD_HOLDER_UNKNOWN_TYPE = PIX_R_EXT.CREDIT_CARD_HOLDER_UNKNOWN_TYPE,
        PIX_R_INT.CREDIT_CARD_USER = PIX_R_EXT.CREDIT_CARD_USER,
        PIX_R_INT.BANK_CARD_PRESENCE_IN_HOUSEHOLD = PIX_R_EXT.BANK_CARD_PRESENCE_IN_HOUSEHOLD,
        PIX_R_INT.EDUCATION = PIX_R_EXT.EDUCATION,
        PIX_R_INT.PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE = PIX_R_EXT.PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE,
        PIX_R_INT._2ND_MOST_RECENT_MORTGAGE_DATE = PIX_R_EXT._2ND_MOST_RECENT_MORTGAGE_DATE,
        PIX_R_INT._2ND_MOST_RECENT_LENDER_NAME = PIX_R_EXT._2ND_MOST_RECENT_LENDER_NAME,
        PIX_R_INT.LOAN_TO_VALUE_RATIO = PIX_R_EXT.LOAN_TO_VALUE_RATIO,
        PIX_R_INT._2ND_MORTGAGE_TYPE = PIX_R_EXT._2ND_MORTGAGE_TYPE,
        PIX_R_INT.AIR_CONDITIONING = PIX_R_EXT.AIR_CONDITIONING,
        PIX_R_INT.POLITICAL_CHARITABLE_DONATION = PIX_R_EXT.POLITICAL_CHARITABLE_DONATION,
        PIX_R_INT.CONSUMER_ELECTRONICS = PIX_R_EXT.CONSUMER_ELECTRONICS,
        PIX_R_INT.ELECTRONICS_COMPUTING_AND_HOME_OFFICE = PIX_R_EXT.ELECTRONICS_COMPUTING_AND_HOME_OFFICE,
        PIX_R_INT.INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH = PIX_R_EXT.INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH,
        PIX_R_INT.READING_GENERAL = PIX_R_EXT.READING_GENERAL,
        PIX_R_INT.READING_MAGAZINES = PIX_R_EXT.READING_MAGAZINES,
        PIX_R_INT.LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES = PIX_R_EXT.LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES,
        PIX_R_INT.COOKING_GENERAL = PIX_R_EXT.COOKING_GENERAL,
        PIX_R_INT.FOODS_NATURAL = PIX_R_EXT.FOODS_NATURAL,
        PIX_R_INT.HEALTH_ENTHUSIAST = PIX_R_EXT.HEALTH_ENTHUSIAST,
        PIX_R_INT.HEALTH_MEDICAL = PIX_R_EXT.HEALTH_MEDICAL,
        PIX_R_INT.COMP_OWN = PIX_R_EXT.COMP_OWN,
        PIX_R_INT.GAMBLERS = PIX_R_EXT.GAMBLERS,
        PIX_R_INT.OUTDOORSMEN = PIX_R_EXT.OUTDOORSMEN,
        PIX_R_INT.HOME_FURNISHINGS_DECORATING = PIX_R_EXT.HOME_FURNISHINGS_DECORATING,
        PIX_R_INT.ALCOHOL_USER = PIX_R_EXT.ALCOHOL_USER,
        PIX_R_INT.SOURCE = PIX_R_EXT.SOURCE,
        PIX_R_INT.DATE_AND_TIME = PIX_R_EXT.DATE_AND_TIME
WHEN NOT MATCHED THEN
    INSERT (
        IDENTITY_ID,
        DATE,
        HTTP_REFERER,
        REQUEST_URI,
        ZIP,
        EMAIL,
        FIRSTNAME,
        LASTNAME,
        ADDRESS,
        CITY,
        STATE,
        ZIPCODE,
        PLUS_4,
        COUNTYNAME,
        LATITUDE,
        LONGITUDE,
        MARITALSTATUS,
        ESTIMATEDINCOMERANGE,
        DATEOFBIRTH,
        BIRTHYEAR,
        AGE,
        GENDER,
        INFERREDCREDITSCORE,
        ETHNIC,
        DWELLINGTYPE,
        HOMEOWNERRENTER,
        HOMEVALUE,
        AUTOVIN,
        YEAR,
        MAKE,
        MODEL,
        TRIM,
        STYLE,
        VEHICLE_TYPE,
        BODY_TYPE,
        BODY_SUBTYPE,
        DOORS,
        MSRP,
        GVW_RANGE,
        GROSS_VEHICLE_WEIGHT_RATING,
        TMP_TANK1_GAL,
        MAX_PAYLOAD,
        TONNAGE,
        DEF_ENGINE_ID,
        DRIVE_TYPE,
        FUEL_TYPE,
        DEF_ENGINE_BLOCK,
        DEF_ENGINE_CYLINDERS,
        DEF_ENGINE_SIZE,
        ENGINE_SIZE_UOM,
        DEF_ENGINE_ASPIRATION,
        DEF_TRANS_ID,
        DEF_TRANS_SPEEDS,
        AUTO_VALIDATION_DATE,
        TRANSACTION_TYPE,
        AUTO_TRANSACTION_DATE,
        FIRST_SEEN,
        LAST_SEEN,
        RECORDID,
        BROWSER,
        DEVICE,
        OS,
        CARRIER_ROUTE,
        MSA,
        MSA_CODE,
        AGE_RANGE,
        ESTIMATED_INCOME,
        NET_WORTH,
        ETHNIC_GROUP,
        LANGUAGE,
        DOB_MONTH,
        DOB_DAY,
        RELIGION,
        YEARS_SINCE_HOME_WAS_BUILT,
        NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER,
        BANK_CARD_HOLDER,
        CREDIT_CARD_HOLDER_UNKNOWN_TYPE,
        CREDIT_CARD_USER,
        BANK_CARD_PRESENCE_IN_HOUSEHOLD,
        EDUCATION,
        PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE,
        _2ND_MOST_RECENT_MORTGAGE_DATE,
        _2ND_MOST_RECENT_LENDER_NAME,
        LOAN_TO_VALUE_RATIO,
        _2ND_MORTGAGE_TYPE,
        AIR_CONDITIONING,
        POLITICAL_CHARITABLE_DONATION,
        CONSUMER_ELECTRONICS,
        ELECTRONICS_COMPUTING_AND_HOME_OFFICE,
        INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH,
        READING_GENERAL,
        READING_MAGAZINES,
        LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES,
        COOKING_GENERAL,
        FOODS_NATURAL,
        HEALTH_ENTHUSIAST,
        HEALTH_MEDICAL,
        COMP_OWN,
        GAMBLERS,
        OUTDOORSMEN,
        HOME_FURNISHINGS_DECORATING,
        ALCOHOL_USER,
        SOURCE,
        DATE_AND_TIME
    )
    VALUES
    (
    PIX_R_EXT.IDENTITY_ID,
    PIX_R_EXT.DATE,
    PIX_R_EXT.HTTP_REFERER,
    PIX_R_EXT.REQUEST_URI,
    PIX_R_EXT.ZIP,
    PIX_R_EXT.EMAIL,
    PIX_R_EXT.FIRSTNAME,
    PIX_R_EXT.LASTNAME,
    PIX_R_EXT.ADDRESS,
    PIX_R_EXT.CITY,
    PIX_R_EXT.STATE,
    PIX_R_EXT.ZIPCODE,
    PIX_R_EXT.PLUS_4,
    PIX_R_EXT.COUNTYNAME,
    PIX_R_EXT.LATITUDE,
    PIX_R_EXT.LONGITUDE,
    PIX_R_EXT.MARITALSTATUS,
    PIX_R_EXT.ESTIMATEDINCOMERANGE,
    PIX_R_EXT.DATEOFBIRTH,
    PIX_R_EXT.BIRTHYEAR,
    PIX_R_EXT.AGE,
    PIX_R_EXT.GENDER,
    PIX_R_EXT.INFERREDCREDITSCORE,
    PIX_R_EXT.ETHNIC,
    PIX_R_EXT.DWELLINGTYPE,
    PIX_R_EXT.HOMEOWNERRENTER,
    PIX_R_EXT.HOMEVALUE,
    PIX_R_EXT.AUTOVIN,
    PIX_R_EXT.YEAR,
    PIX_R_EXT.MAKE,
    PIX_R_EXT.MODEL,
    PIX_R_EXT.TRIM,
    PIX_R_EXT.STYLE,
    PIX_R_EXT.VEHICLE_TYPE,
    PIX_R_EXT.BODY_TYPE,
    PIX_R_EXT.BODY_SUBTYPE,
    PIX_R_EXT.DOORS,
    PIX_R_EXT.MSRP,
    PIX_R_EXT.GVW_RANGE,
    PIX_R_EXT.GROSS_VEHICLE_WEIGHT_RATING,
    PIX_R_EXT.TMP_TANK1_GAL,
    PIX_R_EXT.MAX_PAYLOAD,
    PIX_R_EXT.TONNAGE,
    PIX_R_EXT.DEF_ENGINE_ID,
    PIX_R_EXT.DRIVE_TYPE,
    PIX_R_EXT.FUEL_TYPE,
    PIX_R_EXT.DEF_ENGINE_BLOCK,
    PIX_R_EXT.DEF_ENGINE_CYLINDERS,
    PIX_R_EXT.DEF_ENGINE_SIZE,
    PIX_R_EXT.ENGINE_SIZE_UOM,
    PIX_R_EXT.DEF_ENGINE_ASPIRATION,
    PIX_R_EXT.DEF_TRANS_ID,
    PIX_R_EXT.DEF_TRANS_SPEEDS,
    PIX_R_EXT.AUTO_VALIDATION_DATE,
    PIX_R_EXT.TRANSACTION_TYPE,
    PIX_R_EXT.AUTO_TRANSACTION_DATE,
    PIX_R_EXT.FIRST_SEEN,
    PIX_R_EXT.LAST_SEEN,
    PIX_R_EXT.RECORDID,
    PIX_R_EXT.BROWSER,
    PIX_R_EXT.DEVICE,
    PIX_R_EXT.OS,
    PIX_R_EXT.CARRIER_ROUTE,
    PIX_R_EXT.MSA,
    PIX_R_EXT.MSA_CODE,
    PIX_R_EXT.AGE_RANGE,
    PIX_R_EXT.ESTIMATED_INCOME,
    PIX_R_EXT.NET_WORTH,
    PIX_R_EXT.ETHNIC_GROUP,
    PIX_R_EXT.LANGUAGE,
    PIX_R_EXT.DOB_MONTH,
    PIX_R_EXT.DOB_DAY,
    PIX_R_EXT.RELIGION,
    PIX_R_EXT.YEARS_SINCE_HOME_WAS_BUILT,
    PIX_R_EXT.NUMBER_OF_LINES_OF_CREDIT_TRADE_COUNTER,
    PIX_R_EXT.BANK_CARD_HOLDER,
    PIX_R_EXT.CREDIT_CARD_HOLDER_UNKNOWN_TYPE,
    PIX_R_EXT.CREDIT_CARD_USER,
    PIX_R_EXT.BANK_CARD_PRESENCE_IN_HOUSEHOLD,
    PIX_R_EXT.EDUCATION,
    PIX_R_EXT.PASS_PROSPECTOR_VALUE_HOME_VALUE_MORTGAGE_FILE,
    PIX_R_EXT._2ND_MOST_RECENT_MORTGAGE_DATE,
    PIX_R_EXT._2ND_MOST_RECENT_LENDER_NAME,
    PIX_R_EXT.LOAN_TO_VALUE_RATIO,
    PIX_R_EXT._2ND_MORTGAGE_TYPE,
    PIX_R_EXT.AIR_CONDITIONING,
    PIX_R_EXT.POLITICAL_CHARITABLE_DONATION,
    PIX_R_EXT.CONSUMER_ELECTRONICS,
    PIX_R_EXT.ELECTRONICS_COMPUTING_AND_HOME_OFFICE,
    PIX_R_EXT.INTEND_TO_PURCHASE_HDTV_SATELLITE_DISH,
    PIX_R_EXT.READING_GENERAL,
    PIX_R_EXT.READING_MAGAZINES,
    PIX_R_EXT.LIFESTYLES_INTERESTS_AND_PASSIONS_RAFT_HOBBIES,
    PIX_R_EXT.COOKING_GENERAL,
    PIX_R_EXT.FOODS_NATURAL,
    PIX_R_EXT.HEALTH_ENTHUSIAST,
    PIX_R_EXT.HEALTH_MEDICAL,
    PIX_R_EXT.COMP_OWN,
    PIX_R_EXT.GAMBLERS,
    PIX_R_EXT.OUTDOORSMEN,
    PIX_R_EXT.HOME_FURNISHINGS_DECORATING,
    PIX_R_EXT.ALCOHOL_USER,
    PIX_R_EXT.SOURCE,
    PIX_R_EXT.DATE_AND_TIME
    );