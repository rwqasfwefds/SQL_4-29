-- 연습문제 12)
-- 이름의 세번째 문자가 R인 사원의 이름을 표시하세요.
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '__R%';

-- 연습문제 13)
-- 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하셈
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

-- 연습문제 14)
-- 담당업무(JOB컬럼)가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서, 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하셈
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE JOB IN ('CLERK', 'SALESMAN') AND
SALARY NOT IN (1600, 950, 1300);

-- 연습문제 15)
-- 커미션(상여금)이 $500 이상인 사원의 이름과 급여 및 커미션(상여금)을 출력하셈
SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION >= 500;