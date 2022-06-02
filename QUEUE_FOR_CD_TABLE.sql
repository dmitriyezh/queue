BEGIN
  SYS.DBMS_AQADM.CREATE_QUEUE_TABLE
  (
    QUEUE_TABLE           =>        'KK_XXI.QUEUE_FOR_CD_TABLE'
   ,QUEUE_PAYLOAD_TYPE    =>        'KK_XXI.QUEUE_FOR_CD_DATA'
   ,COMPATIBLE            =>        '10.0.0'
   ,STORAGE_CLAUSE        =>        'NOCOMPRESS
                                     TABLESPACE USERS
                                     RESULT_CACHE (MODE DEFAULT)
                                     PCTUSED    0
                                     PCTFREE    10
                                     INITRANS   1
                                     MAXTRANS   255
                                     STORAGE    (
                                                 INITIAL          80K
                                                 NEXT             1M
                                                 MINEXTENTS       1
                                                 MAXEXTENTS       UNLIMITED
                                                 PCTINCREASE      0
                                                 BUFFER_POOL      DEFAULT
                                                 FLASH_CACHE      DEFAULT
                                                 CELL_FLASH_CACHE DEFAULT
                                                )'
   ,SORT_LIST             =>        'ENQ_TIME'
   ,MULTIPLE_CONSUMERS    =>         FALSE
   ,MESSAGE_GROUPING      =>         0
   ,COMMENT               =>         'Таблица очереди договоров для выполнения групп процесса'
   ,SECURE                =>         FALSE
   );
End;
/


GRANT DELETE, INSERT, SELECT, UPDATE ON KK_XXI.QUEUE_FOR_CD_TABLE TO ODB;