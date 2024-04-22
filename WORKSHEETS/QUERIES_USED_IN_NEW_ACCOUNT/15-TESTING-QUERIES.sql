
// Working:
SELECT count(*) as count from (SELECT consumer.up_id FROM four_eyes.public.premade_4eyes_lite pa INNER JOIN AUDIENCELAB_INTERNAL_PROD.PUBLIC.CONSUMER_B2C_FULL consumer ON pa.up_id=consumer.up_id WHERE consumer.id IS NOT NULL AND (ZIP IN (75009,75034,75701,75702,75703,75704,75706,75708,75709,75771,75773,76048,76049,76574,78130,78131,78132,78135,78610,78640,78641,78646)) AND SEGMENT IN ('4eyes_101211')  AND date >= '2024-04-16' AND date <= '2024-04-17');


SELECT * FROM AUDIENCELAB_INTERNAL_PROD.PUBLIC.UNIVERSAL_PERSON WHERE UP_ID IN (SELECT consumer.up_id FROM four_eyes.public.premade_4eyes_lite pa INNER JOIN AUDIENCELAB_INTERNAL_PROD.PUBLIC.CONSUMER_B2C_FULL consumer ON pa.up_id=consumer.up_id WHERE consumer.id IS NOT NULL AND (EXACT_AGE between 25 AND 55) AND (STATE IN ('GA','FL','NC','SC','VA','WV','TX','MO','KS','NV','AL','TN','IL','IN','OH')) AND SEGMENT IN ('4eyes_120092','4eyes_120674')  AND date >= '2024-04-12' AND date <= '2024-04-17' LIMIT 200000);





