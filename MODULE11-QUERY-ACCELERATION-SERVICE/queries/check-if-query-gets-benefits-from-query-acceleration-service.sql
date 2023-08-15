

















--> PARA QUE O QUERY ACCELERATION SERVICE SEJA USADO,


A BASIC CRITERIA É:







1) A QUERY DEVE DEMORAR MAIS TEMPO COM O "REMOTE DISK I/O",


com o extract DA DATA DO STORAGE LAYER (remote storage layer)

NO SENTIDO DO VIRTUAL WAREHOUSE LAYER...


(

QUER DIZER QUE O MAIOR TEMPO GASTO COM A QUERY 

FOI COM __ TABLE SCAN... --> COM ISSO, PODEMOS DIZER QUE 

A QUERY PODE SE BENEFICIAR DO 
QUERY ACCELERATION...


)







2) A MESMA COISA PODE SER CONFIRMADA 

POR MEIO DO USO 


DA SNOWFLAKE FUNCTION E DAS 

ACCOUNT VIEWS DO SNOWFLAKE...














--> NA ÚLTIMA AULA,

1 DAS QUERIES ESTAVA TOMANDO 4MIN E 12 SEGUNDOS PARA COMPLETAR....













--> AGORA DEVEMOS PEGAR O QUERY ID DESSA QUERY 




E CHECAR SE ELA É ELIGIBLE 
PARA RECEBER OS EFEITOS DO QUERY ACCELERATION SERVICE...



para isso, O PROFESSOR TEM ESTE COMANDO:








SELECT PARSE_JSON(system$estimate_query_acceleration('<query_id>'));
















--> ESSA É UMA SYSTEM-LEVEL FUNCTION,



E PRECISAMOS DO ROLE DE ACCOUNTADMIN 

PARA RECEBER SEU RESULT....








--> NO OUTPUT,



NO JSON, TEMOS ISTO:






"eligible": true,
"upperLimitScaleFactor": 1














--> QUER DIZER QUE ESSA QUERY É ELIGIBLE PARA ESSE SERVICE...








--> ELE TAMBÉM 


PROPÕE UM UPPER LIMIT SCALE FACTOR DE 1 (


    quer dizer que APENAS 1 MÁQUINA EXTRA É ADICIONADA 

    PARA LER A DATA DO STORAGE LAYER E A DEPOSITAR 

    NO VIRTUAL WAREHOUSE LAYER...
)












--> TAMBÉM LEMOS "originalQueryTime",


de 252 seconds ------> 4.2 minutes,

é a duracao original da query, 

sem a query acceleration...






--> E O RESULTADO DESSE JSON NOS MOSTRA 


QUE 


ESSA QUERY, COM O upperLimitScaleFactor DE 1 ,


PODE SER COMPLETADA EM 





133 segundos....










--> OK, QUER DIZER QUE ESSA É UMA ESTIMATIVA QUE CONSEGUIMOS 


COM ESSA FUNCTION...- -------> MAS DEVEMOS TER EM MENTE 




QUE PARA CONSEGUIR CHECAR ISSO, 
A QUERY PRIMEIRAMENTE PRECISA SER 


EXECUTADA...













--> SE A QUERY ESTÁ DEMORANDO DEMAIS,
VC PODE 

CHECAR 

SE ELA É ELIGIBLE PARA QUERY ACCELERATION,



SE SERIA BENÉFICO 


HABILITAR O QUERY ACCELERATION NESSA WAREHOUSE...











-------> A OUTRA ALTERNATIVA QUE TEMOS 

É 


RODAR O SELECT NESSA VIEW:









SELECT * FROM snowflake.account_usage.query_acceleration_eligible
ORDER BY eligible_query_acceleration_time DESC;










--> O PROFESSOR RODA ESSA QUERY....






--> COM ISSO, PODEMOS VER VÁRIOS DETALHES..






"eligible_query_acceleration_time" -> TAMBÉM 


PODEMOS VER O "UPPER LIMIT SCALE FACTOR"...













--> COM ISSO, PODEMOS VER QUAIS QUERIES PODEM SE BENEFICIAR 

DESSE SERVICE...








SE MTAS DAS QUERIES SAO ELIGIBLE PARA ESSE SERVICE,


VC PODE ACTUALLY TENTAR ENABLAR ESSE SERVICE,

NESSA WAREHOUSE ESPECÍFICA...