-- ������� ������ ���������� �������� �� �������
DECLARE
   L_MSG_ID      RAW(16);                        --id ��������� �������
   L_ENQ_OPT     DBMS_AQ.DEQUEUE_OPTIONS_T;      --��������� ����� � �������
   L_MSG_PROP    DBMS_AQ.MESSAGE_PROPERTIES_T;   --��� ��������� ������������� � �������
   L_AGRID       KK_XXI.QUEUE_FOR_CD_DATA;         --id ���������� ��������
BEGIN

   DBMS_AQ.DEQUEUE(QUEUE_NAME         => 'KK_XXI.QUEUE_FOR_CD',
                   DEQUEUE_OPTIONS    => L_ENQ_OPT,
                   MESSAGE_PROPERTIES => L_MSG_PROP,
                   PAYLOAD            => L_AGRID,
                   MSGID              => L_MSG_ID);
                   
   dbms_output.put_line('L_AGRID='||L_AGRID.AGRID); 
    
   COMMIT;
END;