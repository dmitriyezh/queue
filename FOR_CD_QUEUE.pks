CREATE OR REPLACE PACKAGE KK_XXI.FOR_CD_QUEUE IS

    --
    -- ���������� ������. ����� �������������� � ��������� ��� ��������� ���������.
    --

    Version CONSTANT VARCHAR2 (250) := 'v 0.01 20.04.2022';

    --  ��������:
    --
    -- ADD_IN_QUEUE_CD  - ��������� ���������� ���������� �������� � �������
    --

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ��������� ��������� � ������� ��������� �������
PROCEDURE ADD_IN_QUEUE_CD(P_AGRID IN NUMBER -- ID ���������� ��������
                          ); 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------   
END FOR_CD_QUEUE;
/