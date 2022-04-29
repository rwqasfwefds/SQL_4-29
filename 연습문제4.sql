-- �������� 12)
-- �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���ϼ���.
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '__R%';

-- �������� 13)
-- �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���ϼ�
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

-- �������� 14)
-- ������(JOB�÷�)�� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭, �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ������, �޿��� ����ϼ�
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE JOB IN ('CLERK', 'SALESMAN') AND
SALARY NOT IN (1600, 950, 1300);

-- �������� 15)
-- Ŀ�̼�(�󿩱�)�� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼�(�󿩱�)�� ����ϼ�
SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION >= 500;