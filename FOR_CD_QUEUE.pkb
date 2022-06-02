CREATE OR REPLACE PACKAGE BODY KK_XXI.FOR_CD_QUEUE AS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ������� ��������� � ������� ��������� �������
PROCEDURE ADD_IN_QUEUE_CD(P_AGRID IN NUMBER 
                          ) IS

   PRAGMA AUTONOMOUS_TRANSACTION;
   L_MSG_ID      RAW(16);                        -- id ��������� �������
   L_ENQ_OPT     DBMS_AQ.ENQUEUE_OPTIONS_T;      -- ��������� ����� � �������
   L_MSG_PROP    DBMS_AQ.MESSAGE_PROPERTIES_T;   -- ��� ��������� ������������� � �������
   
BEGIN

   DBMS_AQ.ENQUEUE(QUEUE_NAME         => 'KK_XXI.QUEUE_FOR_CD',  -- �������� �������
                   ENQUEUE_OPTIONS    => L_ENQ_OPT,
                   MESSAGE_PROPERTIES => L_MSG_PROP,
                   PAYLOAD            => KK_XXI.QUEUE_FOR_CD_DATA(AGRID => P_AGRID
                                                                  ),
                   MSGID              => L_MSG_ID);
    
   COMMIT;
   
EXCEPTION WHEN OTHERS THEN
   KK_XXI.FOR_CD.PUT_LOG_FUNC('������ '||sqlerrm(sqlcode), P_AGRID, '�������');
END ADD_IN_QUEUE_CD;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------                                             
END FOR_CD_QUEUE;
/