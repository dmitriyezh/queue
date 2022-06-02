-- ���������� ������ ���������� �������� � �������
DECLARE
   L_MSG_ID      RAW(16);                        --id ��������� �������
   L_ENQ_OPT     DBMS_AQ.ENQUEUE_OPTIONS_T;      --��������� ����� � �������
   L_MSG_PROP    DBMS_AQ.MESSAGE_PROPERTIES_T;   --��� ��������� ������������� � �������
BEGIN

   DBMS_AQ.ENQUEUE(QUEUE_NAME         => 'KK_XXI.QUEUE_FOR_CD',
                   ENQUEUE_OPTIONS    => L_ENQ_OPT,
                   MESSAGE_PROPERTIES => L_MSG_PROP,
                   PAYLOAD            => KK_XXI.QUEUE_FOR_CD_DATA(AGRID => 111335669
                                                     ),
                   MSGID              => L_MSG_ID);
    
   COMMIT;
END;