


CREATE OR REPLACE TRANSIENT TABLE TROVO.TEST.MANUAL_AUDIENCE (
UP_ID STRING
);






SELECT * FROM AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON WHERE UP_ID IN (SELECT UP_ID FROM TROVO.TEST.MANUAL_AUDIENCE);