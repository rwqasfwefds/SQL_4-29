-- �������� 1)
-- ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ��� �� �� ����� �̸�, �޿�, �λ�� �޿��� ����ϼ�
SELECT ENAME, SALARY, SALARY + 300 AS �λ�޿� 
FROM EMPLOYEE;

-- �������� 2)
-- ����� �̸�, �޿�, ���� �� ������ �� ������ ���� �� ���� ���� ������ ����ϼ���.
-- (���� �� ������ ���޿� 12�� ���� �� $100�� �󿩱��� �� �ؼ� ����ϼ���)
SELECT ENAME, SALARY, SALARY * 12 + 100 AS "���� �� ����" 
FROM EMPLOYEE
ORDER BY SALARY * 12 + 300 DESC;

-- �������� 3)
-- �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ����ϼ���
SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > 2000
ORDER BY SALARY DESC;
-- �������� 4)
-- �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ�
SELECT ENAME, DNO 
FROM EMPLOYEE
WHERE ENO = 7788;