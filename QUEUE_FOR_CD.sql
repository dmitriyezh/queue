BEGIN
  SYS.DBMS_AQADM.CREATE_QUEUE
  (
    QUEUE_NAME          =>   'KK_XXI.QUEUE_FOR_CD'
   ,QUEUE_TABLE         =>   'KK_XXI.QUEUE_FOR_CD_TABLE'
   ,QUEUE_TYPE          =>   SYS.DBMS_AQADM.NORMAL_QUEUE
   ,MAX_RETRIES         =>   2147483646
   ,RETRY_DELAY         =>   0
   ,RETENTION_TIME      =>   0
   ,COMMENT             =>   'Очередь договоров для выполнения групп процесса'
   );
END;
/

BEGIN
  SYS.DBMS_AQADM.START_QUEUE
  (
    QUEUE_NAME => 'KK_XXI.QUEUE_FOR_CD'
   ,ENQUEUE => TRUE 
   ,DEQUEUE => TRUE 
   );
END;
/


BEGIN
  sys.dbms_aqadm.grant_queue_privilege
 ('ENQUEUE', 'KK_XXI.QUEUE_FOR_CD', 'ODB', TRUE);
  sys.dbms_aqadm.grant_queue_privilege
 ('DEQUEUE', 'KK_XXI.QUEUE_FOR_CD', 'ODB', TRUE);
END;
/