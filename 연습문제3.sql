-- �������� 9)
-- 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����ϼ� ��, LKIE �����ڿ� ���ϵ�ī��(%, _)�� ����ϼ�
SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

-- �������� 10)
-- �����ڰ� ���� ����� �̸��� ��� ������ ����ϼ�
-- MANAGER �÷� : ������ �÷�
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE MANAGER IS NULL;

-- �������� 11)
-- COMMITION�� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ�, �޿� �� Ŀ�̼��� �������� �������� ���� ����
SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC, COMMISSION DESC;