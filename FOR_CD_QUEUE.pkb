CREATE OR REPLACE PACKAGE BODY KK_XXI.FOR_CD_QUEUE AS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- функция добавляет в очередь кредитный договор
PROCEDURE ADD_IN_QUEUE_CD(P_AGRID IN NUMBER 
                          ) IS

   PRAGMA AUTONOMOUS_TRANSACTION;
   L_MSG_ID      RAW(16);                        -- id сообщения очереди
   L_ENQ_OPT     DBMS_AQ.ENQUEUE_OPTIONS_T;      -- параметры ввода в очередь
   L_MSG_PROP    DBMS_AQ.MESSAGE_PROPERTIES_T;   -- доп параметры отправляемого в очередь
   
BEGIN

   DBMS_AQ.ENQUEUE(QUEUE_NAME         => 'KK_XXI.QUEUE_FOR_CD',  -- название очереди
                   ENQUEUE_OPTIONS    => L_ENQ_OPT,
                   MESSAGE_PROPERTIES => L_MSG_PROP,
                   PAYLOAD            => KK_XXI.QUEUE_FOR_CD_DATA(AGRID => P_AGRID
                                                                  ),
                   MSGID              => L_MSG_ID);
    
   COMMIT;
   
EXCEPTION WHEN OTHERS THEN
   KK_XXI.FOR_CD.PUT_LOG_FUNC('Ошибка '||sqlerrm(sqlcode), P_AGRID, 'ОЧЕРЕДИ');
END ADD_IN_QUEUE_CD;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------                                             
END FOR_CD_QUEUE;
/