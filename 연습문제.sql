-- 연습문제 1)
-- 덧셈 연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산 한 후 사원의 이름, 급여, 인상된 급여를 출력하셈
SELECT ENAME, SALARY, SALARY + 300 AS 인상급여 
FROM EMPLOYEE;

-- 연습문제 2)
-- 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것 부터 작은 순으로 출력하세요.
-- (연간 총 수입은 월급에 12를 곱한 후 $100의 상여금을 더 해서 계산하세요)
SELECT ENAME, SALARY, SALARY * 12 + 100 AS "연간 총 수입" 
FROM EMPLOYEE
ORDER BY SALARY * 12 + 300 DESC;

-- 연습문제 3)
-- 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 출력하세요
SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > 2000
ORDER BY SALARY DESC;
-- 연습문제 4)
-- 사원번호가 7788인 사원의 이름과 부서번호를 출력하셈
SELECT ENAME, DNO 
FROM EMPLOYEE
WHERE ENO = 7788;