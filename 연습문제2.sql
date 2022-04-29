-- �������� 5)
-- �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����ϼ�
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY < 2000 OR SALARY > 3000;

-- �ٸ� ���
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 2000 AND 3000 ;

-- �������� 6)
-- 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ��� ����, �Ի����� ���
-- JOB �÷� : ������
SELECT ENAME, JOB, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE >= '1981/02/20' AND HIREDATE <= '1981/05/01';

--�ٸ� ���
SELECT ENAME, JOB, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

--�������� 7)
-- �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� �������� �������� ����ϼ�
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO = 20 OR DNO = 30
ORDER BY ENAME DESC;

--�ٸ� ���
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO IN (20, 30)
ORDER BY ENAME DESC;


--�������� 8)
-- ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿�, �μ���ȣ�� ����ϴµ� �̸����� ������������ ��� ��
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000 AND DNO = 20 OR DNO = 30
ORDER BY ENAME;

-- �ٸ� ���
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000 
AND DNO IN (20, 30)
ORDER BY ENAME;