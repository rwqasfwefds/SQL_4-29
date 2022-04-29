-- SELECT ���� �÷� * 12 �� ���� ��Ģ���� �� ����
SELECT ENAME, SALARY, SALARY*12 FROM EMPLOYEE;
-- SELECT ���� �÷� + �ٸ��÷� = ��� �� ����
-- �÷� + �ٸ��÷�(NULL���� ������) == NULL(�ش� ������); �� ����� X * 0�̶�� ���� ����
-- SALARY : ����
-- SALARY * 12 : ����
-- SALARY * 12 + COMMISSION(���ʽ�) : ���� + ���ʽ�(���� 1��ġ ����)
-- �÷� �� SALARY*12, SALARY*12 + COMMISSION �� �̸����� �״�� ����
SELECT ENAME, SALARY, JOB, DNO, COMMISSION, SALARY*12, SALARY*12 + COMMISSION FROM EMPLOYEE;

-- ������) ��� ���� COMMISSION�� NULL�� �־ �� ���� ����� ���� 1��ġ ������ ������ ����
-- �ذ�) NVL(NULL���� �ִ� �÷�, NULL�� �ٲ� ��) = NULL�÷��� 0���� ��ȯ�ϴ� �����Լ� ����
-- �÷���(��Ī)�ֱ� : 'AS ��Ī(ALIAS)' ���·� ���� ���ϴ� �÷��� �� �� ����
-- ��Ī�ٶ� ������ �ٷ��� �ֵ���ǥ�� �ʼ�
-- ���� �̷��� �޸� �������� ��ĭ �� ����� �ۼ� ��
SELECT ENAME,
       SALARY,
       JOB,
       DNO,
       NVL(COMMISSION, 0) AS ���ʽ�,
       SALARY*12 AS "��     ��",
       SALARY*12 + NVL(COMMISSION, 0) AS ��������
FROM EMPLOYEE;

-- DISTINCT : �÷��� �ߺ��� �����ϰ� ����(���� �����ʹ� ��ȭ X)
SELECT DISTINCT DNO AS �μ���ȣ 
FROM EMPLOYEE;

-- �׽�Ʈ��, ���� ���� �������̺� �Ұ�
-- ���̺� �� : DUAL
DESC DUAL;

SELECT 10 * 4 / 3 FROM DUAL;

-- ���� �ð�, ��¥ ����ϱ� �����Լ�
-- ��ü ������ �Ǽ��� ����ؼ� ��¥�� ����
SELECT SYSDATE FROM DEPARTMENT;

-- DUAL : �����Ͱ� �� ���� ���� ���̺���
SELECT SYSDATE FROM DUAL;

-- ���� : ���� �˻�
-- SALARY(����)�� 1500�̻��� ���� ������ �̱�
-- ��ȣ : <> = ���� �ʴ�
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1500;

-- ���� 1) ����(EMPLOYEE) ���̺��� �μ���ȣ�� 20���� ū ������ ��� ����ϼ�
SELECT * FROM EMPLOYEE
WHERE DNO > 20;

-- ��¥ ������ �˻�
-- ���ڿ� ó�� ������ ��
SELECT * FROM EMPLOYEE
WHERE HIREDATE <= '1981/01/01';

-- ��¥ ������ �����ؼ� ���ڿ��� ����ϴ� ���� �Լ�
-- �긦
SELECT SYSDATE FROM DUAL;
-- ��� �ٲ�
-- TO_CHAR(�÷���, ��������) : ��¥, ��¥�÷� => ���ڿ��� ����(������ ����)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;

-- ���ڿ��� ��¥ ������ �������� �����ϴ� ���� �Լ�
SELECT TO_DATE('2022-04-29 17:10:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- �������� : AND(���ÿ� ��), OR(�� �߿� �ϳ��� ���̸� ��), NOT(�ݴ�)

-- ���� 2) �μ� ��ȣ(DNO)�� 10�̰� ����(JOB)�� 'MANAGER'�� ����� ����ϼ�
SELECT * FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';

-- ���� 3) �μ���ȣ�� 10�̰ų� ������ 'MANAGER'�� ����� ����ϱ�
SELECT * FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';

-- ���� 4) 10�� �μ��� �Ҽӵ� ����� �����ϰ� ������ ����� ������ ����ϼ�
SELECT * FROM EMPLOYEE
WHERE NOT DNO = 10;

-- ����4�� �ش� �̷��Ե� �� ����
SELECT * FROM EMPLOYEE
WHERE DNO <> 10;

-- ���� 5��) �޿��� 1000���� 1500������ ����� ����ϼ�
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000 AND SALARY <= 1500;

-- ���� 6) �޿��� 1000 �̸��̰ų� 1500 �ʰ��� ����� ����ϼ���
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000 OR SALARY > 1500;

-- ���� 7) Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ����ϼ�
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;

-- ���� �˻� 2
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000 AND SALARY <= 1500;
-- ���� ������ ����
-- WHERE�� �÷��� BETWEEN �ʱ� �� AND �� ��;
-- �ʱ� �� ~ �� �� ������ ���� ���
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 1000 AND 1500;

-- ���� �� ��
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000 OR SALARY > 1500;
-- ���� ������ ����
-- WHERE�� �÷��� NOT BETWEEN �ʱ� �� AND �� ��;
-- �ʱ� ������ �۰ų� �� ������ ū ��
SELECT * FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1000 AND 1500;

-- ���� 8) 1982�⵵�� �Ի��� ��� ����ϱ�
-- BETWEEN AND�� �Ἥ ����غ���
SELECT * FROM EMPLOYEE
WHERE HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- COMMISSION(���ʽ�) 300�̰ų� 500�̰ų� 1400�� ���� ���
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;

-- ���� ������ ����� �����ִ� ����
SELECT * FROM EMPLOYEE
WHERE COMMISSION IN(300, 500, 1400);

-- COMMISSION(���ʽ�) 300�� �ƴϰ� 500�� �ƴϰ� 1400�� �ƴ� ���� ���
SELECT * FROM EMPLOYEE
WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;

-- ���� ������ ����� �����ִ� ����
SELECT * FROM EMPLOYEE
WHERE COMMISSION NOT IN (300, 500, 1400);

-- LIKE ��� �����ؼ� ����
-- � ���ڷ� �����ϴ� �����ʹ� ��� �̱�
-- 1) WHERE �÷��� LIKE '����%'
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

-- 2) WHERE �÷��� LIKE '%����%'; = �߰��� ���ڰ� �� �͸� �̾ƶ� 
-- �̸��� M�� ���� ����� ��� ���
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%M%';

-- ���� 9) �̸��� 'N'���� ������ ��� �˻��ϱ�
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%N';

-- % : ���ڰ� ���ų� �ϳ� �̻��� ���ڰ� � ���� �͵� �������(���ڰ� ��� �� ����)
-- _ : �ϳ��� ���ڰ� � ���� �͵� �������(������ �ϳ��� ���ڰ� �;� ��)
-- �̸� 2��°�� A�� �� ���鸸 �̾ƶ� ����
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

--���� 10) �̸��� ����° ���ڰ� A�� ����� ���
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '__A%';

-- ���� �̸��߿� A�� �� ���� ������ ������ ���
SELECT * FROM EMPLOYEE
WHERE ENAME NOT LIKE '%A%';

-- NULL : �ƹ� ���� ����, ������ ���� ��
-- NULL�� ������ �ϸ� NULL�� ��
-- IS NULL : NULL�� �����͸� �̱�
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NULL;

-- IS NOT NULL : NULL�� �ƴ� �����͸� �̱�
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

-- ���� 11) COMMISSION�� NULL�� �߿��� SALARY�� 1000���� ū ������ ������ ���
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NULL AND SALARY > 1000;

-- ���� 12) ���� ���̺��� ��¥ ������ ������������ �����Ͽ� ����ϼ�
SELECT * FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- ���� 13) ������ �޿��� �޴� ����� ���ؼ� �̸��� ������ ���� ������� ������ּ���
SELECT * FROM EMPLOYEE
ORDER BY SALARY, ENAME;

-- ����Ŭ ���� �Լ�
-- WHERE���� �����Լ��� ���� ���� �ø�
-- 1) UPPER(���ڿ�) / LOWER(���ڿ�) / INITCAP(���ڿ�)
SELECT 'Orcle mania', 
UPPER('Orcle mania') AS �빮��, 
LOWER('Orcle mania') AS �ҹ���,
INITCAP('Orcle mania') AS "ù ���� �빮��"
FROM DUAL;

-- ���� ���̺�
SELECT ENAME, 
LOWER(ENAME), 
JOB, 
INITCAP(JOB)
FROM EMPLOYEE;

-- SCOTT ��� �˻��ϱ�
-- �̷��� �ϸ� �� ����
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWERENAME = 'scott';

-- ��⳻�� ��ġ�� �� 1
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE ENAME = UPPER('scott');

-- ��⳻�� ��ġ�� �� 2(�÷��� �����͸� �ϰ� �ҹ��ڷ� �����ؼ� ��)
-- ������ ��â��
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';

-- ����
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE INITCAP(ENAME) = 'Scott';

-- ����Ŭ �����Լ�
-- 2) ���ڱ��̸� ��ȯ�ϴ� �Լ�(�̰� ����Ʈ ��� ������ �� �ϰ� ���� ���̸� ��)
-- LENGTH(���ڿ�) : �ѱ��̵� ����� ������� ���� ������ ��� ��ȯ
SELECT LENGTH('OracleManina'), 
LENGTH('����Ŭ�ŴϾ�')
FROM DUAL;

-- ����Ŭ �����Լ�
-- 3) ���� ���� �Լ�
-- CONCAT : ������ ���� �����ϴ� �Լ�(���ڿ� ���̱�)
-- ����) ���ڿ� || ���ڿ� : ���ڿ� ���̱�
-- 'Oracle' + 'mania' == 'Oracle' || 'mania'
SELECT 'Oracle', 
'mania',
CONCAT('Oracle', 'mania'),
'Oracle' || 'mania'
FROM DUAL;

-- ����Ŭ �����Լ�
-- 4) ���ڿ� �ڸ���
-- SUBSTR(��� �÷�(����), ������ġ, ����) : �ε����� 1���� ����
-- ������ LIKE�� ���� �Z��
SELECT SUBSTR('Oracle mania', 4, 3),
-- ������ ã�°���
SUBSTR('Oracle mania', -1, 1)
FROM DUAL;

-- ���� 14) �̸��� N���� ������ ��� ǥ���ϱ�
-- ��� ���̺� : EMPLOYEE
-- ��, SUBSTR() ����

SELECT * 
FROM EMPLOYEE
WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- ���� 15) 87�⵵�� �Ի��� ��� ǥ���ϱ�
-- ��� ���̺� : EMPLOYEE
-- ��, SUBSTR() ����

SELECT *
FROM EMPLOYEE
WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(��� �÷�(����), ������ġ, ����) : ���� BYTE �������� ���
-- ����(1BYTE) : SUBSTR / SUBSTRB ����� ����
-- �ѱ�(3BYTE) : SUBSTR / SUBSTRB ����� Ʋ��

-- ����Ŭ �����Լ�
-- 5) ���ڿ����� ��� ���� ã�Ƽ� �ε��� ��ȣ ��ȯ
-- ����Ŭ������ �ε��� ��ȣ�� 1���� ������
-- INSTR(��� �÷�(����), ã������, ������ġ, �� ��° �߰�)

SELECT INSTR('Oracle mania', 'a')
FROM DUAL;

-- ��� ���ڿ��� 'a' �� ��ġ�� 5��° ��ġ���� ã�� �����ϰ�, 2��° 'a'�� ã������ �ε��� ��ȣ ��ȯ
SELECT INSTR('Oracle mania', 'a', 5, 2)
FROM DUAL;

-- ���� 16) ��� �������� �� ��° �ڸ��� 'R'�� ����� �˻��ϴ� �������� �ۼ��ϼ�
-- ��, INSTR�� ����ϼ�
-- WHERE���� �����Լ� ���� ���� ��â �� �� ��â ���� �������� �׷��� �������� LIKE ����

SELECT * 
FROM EMPLOYEE
WHERE INSTR(ENAME, 'R') = 3;








