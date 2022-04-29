-- 연습문제 9)
-- 1981년도에 입사한 사원의 이름과 입사일을 출력하셈 단, LKIE 연산자와 와일드카드(%, _)를 사용하셈
SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE LIKE '81%';

-- 연습문제 10)
-- 관리자가 없는 사원의 이름과 담당 업무를 출력하셈
-- MANAGER 컬럼 : 관리자 컬럼
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE MANAGER IS NULL;

-- 연습문제 11)
-- COMMITION을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되, 급여 및 커미션을 기준으로 내림차순 정렬 ㄱㄱ
SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC, COMMISSION DESC;