-- Запуск очереди
BEGIN
  dbms_aqadm.start_queue(
    queue_name  => 'KK_XXI.QUEUE_FOR_CD'
  );
END;