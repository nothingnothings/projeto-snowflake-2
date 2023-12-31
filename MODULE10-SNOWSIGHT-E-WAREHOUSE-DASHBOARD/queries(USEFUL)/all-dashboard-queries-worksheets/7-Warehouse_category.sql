WITH 

-- Warehouse will give information about credit information.
-- WAREHOUSE_HISTORY view will calculate credit and cost grouped by warehouse name.

WAREHOUSE_HISTORY AS

  (SELECT TO_DATE(START_TIME) START_TIME,
          WAREHOUSE_NAME,
          'SNOWFLAKE_WAREHOUSE_COST' CRITERIA,
                                     sum(credits_used) AS CREDITS,
                                     ROUND(sum(credits_used)*4, 2) COST
   FROM snowflake.account_usage.warehouse_metering_history
   WHERE to_date(start_time) >=date_trunc(MONTH, CURRENT_DATE)
     AND LENGTH(WAREHOUSE_NAME)>0
   GROUP BY TO_DATE(START_TIME),
            WAREHOUSE_NAME),


-- Using the query execution time we will calculate the approx credits for the queries executed on warehouse.
-- We will compare the credits calculated from query execution with total credits from WAREHOUSE_HISTORY to calculate Idle cost.
			
			
QUERY_HISTORY AS

  (SELECT TO_DATE(START_TIME) START_TIME,
          WAREHOUSE_NAME,
          'QUERY_EXECUTION_COST' CRITERIA,
                                 sum(WAREHOUSE_COST) CREDITS,
                                 ROUND(sum(WAREHOUSE_COST) *4, 2) COST
   FROM
     (SELECT TO_DATE(START_TIME) START_TIME,
             WAREHOUSE_NAME,
             CASE
                 WHEN WAREHOUSE_SIZE='X-Small' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*1))/60
                 WHEN WAREHOUSE_SIZE='Small' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*2))/60
                 WHEN WAREHOUSE_SIZE='Medium' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*4))/60
                 WHEN WAREHOUSE_SIZE='Large' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*8))/60
                 WHEN WAREHOUSE_SIZE='X-Large' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*16))/60
                 WHEN WAREHOUSE_SIZE='2X-Large' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*32))/60
                 WHEN WAREHOUSE_SIZE='3X-Large' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*64))/60
                 WHEN WAREHOUSE_SIZE='4X-Large' THEN ((((EXECUTION_TIME/1000)/60))*(CLUSTER_NUMBER*128))/60
             END WAREHOUSE_COST
      FROM snowflake.account_usage.query_history
      WHERE to_date(start_time) >=date_trunc(MONTH, CURRENT_DATE) )
   GROUP BY TO_DATE(START_TIME),
            WAREHOUSE_NAME),
			
-- Calculate approx Idle credits and cost. This will use the calculation done from above steps.
			
IDLE_COST AS

  (SELECT A.START_TIME,
          A.WAREHOUSE_NAME,
          'IDLE_COST' CRITERIA,
                      (A.CREDITS-B.CREDITS) CREDITS,
                      (A.CREDITS-B.CREDITS)*4 COST
   FROM WAREHOUSE_HISTORY A
   INNER JOIN QUERY_HISTORY B ON A.WAREHOUSE_NAME=B.WAREHOUSE_NAME
   AND A.START_TIME=B.START_TIME),
   
 -- Categorise and union actual snowflake warehouse cost, snowflake query execution cost and Idle cost.
  
OVERVIEW AS

  (SELECT START_TIME,
          WAREHOUSE_NAME,
          CRITERIA,
          ROUND(CREDITS, 2)CREDITS,
          ROUND(COST, 2) COST
   FROM WAREHOUSE_HISTORY
   UNION SELECT START_TIME,
                WAREHOUSE_NAME,
                CRITERIA,
                ROUND(CREDITS, 2)CREDITS,
                ROUND(COST, 2) COST
   FROM QUERY_HISTORY
   UNION SELECT START_TIME,
                WAREHOUSE_NAME,
                CRITERIA,
                ROUND(CREDITS, 2)CREDITS,
                ROUND(COST, 2) COST
   FROM IDLE_COST),
   
   
OVERVIEW_1 AS

  (SELECT *
   FROM OVERVIEW
   WHERE LENGTH(WAREHOUSE_NAME)>0 ),
   
   
SNOWFLAKE_WAREHOUSE_COST AS

  (SELECT START_TIME,
          WAREHOUSE_NAME,
          SUM(COST) COST_BY_DATE
   FROM OVERVIEW_1
   WHERE CRITERIA='SNOWFLAKE_WAREHOUSE_COST'
   GROUP BY START_TIME,
            WAREHOUSE_NAME)
			
			
SELECT START_TIME AS DATE,
       WAREHOUSE_NAME,
       CASE
           WHEN CRITERIA='IDLE_PERCENTAGE'
                AND COST_PERCENTAGE<=25 THEN 'VERY_ACTIVE'
           WHEN CRITERIA='IDLE_PERCENTAGE'
                AND COST_PERCENTAGE>25
                AND COST_PERCENTAGE<=75 THEN 'ACTIVE'
           WHEN CRITERIA='IDLE_PERCENTAGE'
                AND COST_PERCENTAGE>75 THEN 'DORMANT'
       END CATEGORY,
       COST,
       COST_PERCENTAGE IDLE_PERCENTAGE
FROM
  
  (SELECT A.START_TIME,
          CASE
              WHEN A.CRITERIA='IDLE_COST' THEN 'IDLE_PERCENTAGE'
              WHEN A.CRITERIA='QUERY_EXECUTION_COST' THEN 'ACTIVE_PERCENTAGE'
          END CRITERIA,
          A.WAREHOUSE_NAME,
          A.COST,
          ROUND(A.COST/IFF(B.COST_BY_DATE=0, 1, B.COST_BY_DATE)*100, 2) AS COST_PERCENTAGE
   FROM OVERVIEW_1 A,
        SNOWFLAKE_WAREHOUSE_COST B
   WHERE A.START_TIME=B.START_TIME
     AND A.WAREHOUSE_NAME=B.WAREHOUSE_NAME
     AND LENGTH((A.COST/IFF(B.COST_BY_DATE=0, 1, B.COST_BY_DATE)))>0
     AND CRITERIA!='SNOWFLAKE_WAREHOUSE_COST' )
WHERE CRITERIA!='ACTIVE_PERCENTAGE'
  AND WAREHOUSE_NAME =:my_warehouse 
ORDER BY DATE DESC
