-- SELECT 절에 컬럼 * 12 와 같은 사칙연산 쌉 가능
SELECT ENAME, SALARY, SALARY*12 FROM EMPLOYEE;
-- SELECT 절에 컬럼 + 다른컬럼 = 계산 쌉 가능
-- 컬럼 + 다른컬럼(NULL값이 있으면) == NULL(해당 데이터); 한 마디로 X * 0이라는 말임 ㅇㅇ
-- SALARY : 월급
-- SALARY * 12 : 연봉
-- SALARY * 12 + COMMISSION(보너스) : 연봉 + 보너스(최종 1년치 연봉)
-- 컬럼 명에 SALARY*12, SALARY*12 + COMMISSION 이 이름들이 그대로 나옴
SELECT ENAME, SALARY, JOB, DNO, COMMISSION, SALARY*12, SALARY*12 + COMMISSION FROM EMPLOYEE;

-- 문제점) 상기 값에 COMMISSION에 NULL이 있어서 몇 개는 제대로 최종 1년치 연봉이 나오지 않음
-- 해결) NVL(NULL값이 있는 컬럼, NULL을 바꿀 값) = NULL컬럼을 0으로 변환하는 내장함수 적용
-- 컬럼명(별칭)주기 : 'AS 별칭(ALIAS)' 형태로 내가 원하는 컬럼명 줄 수 있음
-- 별칭줄때 공백을 줄려면 쌍따음표가 필수
-- 보통 이렇게 콤마 기준으로 한칸 씩 띄워서 작성 함
SELECT ENAME,
       SALARY,
       JOB,
       DNO,
       NVL(COMMISSION, 0) AS 보너스,
       SALARY*12 AS "연     봉",
       SALARY*12 + NVL(COMMISSION, 0) AS 최종연봉
FROM EMPLOYEE;

-- DISTINCT : 컬럼에 중복을 제거하고 보기(실제 데이터는 변화 X)
SELECT DISTINCT DNO AS 부서번호 
FROM EMPLOYEE;

-- 테스트용, 간이 계산용 내장테이블 소개
-- 테이블 명 : DUAL
DESC DUAL;

SELECT 10 * 4 / 3 FROM DUAL;

-- 현재 시간, 날짜 출력하기 내장함수
-- 전체 데이터 건수에 비례해서 날짜가 나옴
SELECT SYSDATE FROM DEPARTMENT;

-- DUAL : 데이터가 한 건인 간이 테이블임
SELECT SYSDATE FROM DUAL;

-- 조건 : 범위 검색
-- SALARY(월급)가 1500이상인 직원 데이터 뽑기
-- 등호 : <> = 같지 않다
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1500;

-- 문제 1) 직원(EMPLOYEE) 테이블에서 부서번호가 20보다 큰 직원을 모두 출력하셈
SELECT * FROM EMPLOYEE
WHERE DNO > 20;

-- 날짜 데이터 검색
-- 문자열 처럼 넣으면 됨
SELECT * FROM EMPLOYEE
WHERE HIREDATE <= '1981/01/01';

-- 날짜 포맷을 변경해서 문자열로 출력하는 내장 함수
-- 얘를
SELECT SYSDATE FROM DUAL;
-- 얘로 바꿈
-- TO_CHAR(컬럼명, 변경포맷) : 날짜, 날짜컬럼 => 문자열로 변경(지정된 포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;

-- 문자열을 날짜 데이터 형식으로 변경하는 내장 함수
SELECT TO_DATE('2022-04-29 17:10:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- 논리연산자 : AND(동시에 참), OR(둘 중에 하나가 참이면 참), NOT(반대)

-- 문제 2) 부서 번호(DNO)가 10이고 직급(JOB)이 'MANAGER'인 사원만 출력하셈
SELECT * FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';

-- 문제 3) 부서번호가 10이거나 직급이 'MANAGER'인 사원만 출력하기
SELECT * FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';

-- 문제 4) 10번 부서에 소속된 사원만 제외하고 나머지 사원의 정보를 출력하셈
SELECT * FROM EMPLOYEE
WHERE NOT DNO = 10;

-- 문제4번 해답 이렇게도 쌉 가능
SELECT * FROM EMPLOYEE
WHERE DNO <> 10;

-- 문제 5번) 급여가 1000에서 1500사이의 사원을 출력하셈
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000 AND SALARY <= 1500;

-- 문제 6) 급여가 1000 미만이거나 1500 초과인 사원을 출력하세요
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000 OR SALARY > 1500;

-- 문제 7) 커미션이 300이거나 500이거나 1400인 사원을 출력하셈
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;

-- 범위 검색 2
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000 AND SALARY <= 1500;
-- 위랑 동일한 문법
-- WHERE절 컬럼명 BETWEEN 초기 값 AND 끝 값;
-- 초기 값 ~ 끝 값 사이의 값을 출력
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 1000 AND 1500;

-- 변경 할 것
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000 OR SALARY > 1500;
-- 위랑 동일한 문법
-- WHERE절 컬럼명 NOT BETWEEN 초기 값 AND 끝 값;
-- 초기 값보다 작거나 끝 값보다 큰 값
SELECT * FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1000 AND 1500;

-- 문제 8) 1982년도에 입사한 사원 출력하기
-- BETWEEN AND를 써서 출력해보셈
SELECT * FROM EMPLOYEE
WHERE HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- COMMISSION(보너스) 300이거나 500이거나 1400인 직원 출력
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;

-- 위와 동일한 결과를 보여주는 문법
SELECT * FROM EMPLOYEE
WHERE COMMISSION IN(300, 500, 1400);

-- COMMISSION(보너스) 300이 아니고 500도 아니고 1400도 아닌 직원 출력
SELECT * FROM EMPLOYEE
WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;

-- 위와 동일한 결과를 보여주는 문법
SELECT * FROM EMPLOYEE
WHERE COMMISSION NOT IN (300, 500, 1400);

-- LIKE 용범 심층해서 검토
-- 어떤 문자로 시작하는 데이터는 모두 뽑기
-- 1) WHERE 컬럼명 LIKE '문자%'
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

-- 2) WHERE 컬럼명 LIKE '%문자%'; = 중간에 문자가 들어간 것만 뽑아라 
-- 이름에 M이 들어가는 사원들 모두 출력
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%M%';

-- 문제 9) 이름이 'N'으로 끝나는 사원 검색하기
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%N';

-- % : 문자가 없거나 하나 이상의 문자가 어떤 값이 와도 상관없음(문자가 없어도 쌉 가능)
-- _ : 하나의 문자가 어떤 값이 와도 상관없음(무조건 하나의 문자가 와야 됨)
-- 이름 2번째에 A가 들어간 쉨들만 뽑아라 ㅇㅇ
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

--문제 10) 이름의 세번째 글자가 A인 사원을 출력
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '__A%';

-- 직원 이름중에 A가 안 들어가는 직원의 정보를 출력
SELECT * FROM EMPLOYEE
WHERE ENAME NOT LIKE '%A%';

-- NULL : 아무 값도 없고, 공간도 없는 것
-- NULL과 연산을 하면 NULL이 됨
-- IS NULL : NULL인 데이터만 뽑기
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NULL;

-- IS NOT NULL : NULL이 아닌 데이터만 뽑기
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

-- 문제 11) COMMISSION이 NULL값 중에서 SALARY가 1000보다 큰 직원의 정보를 출력
SELECT * FROM EMPLOYEE
WHERE COMMISSION IS NULL AND SALARY > 1000;

-- 문제 12) 직원 테이블에서 날짜 정보를 내림차순으로 정렬하여 출력하셈
SELECT * FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- 문제 13) 동일한 급여를 받는 사원에 대해서 이름의 순서가 빠른 사람부터 출력해주세요
SELECT * FROM EMPLOYEE
ORDER BY SALARY, ENAME;

-- 오라클 내장 함수
-- WHERE절에 내장함수를 쓰면 성능 씹망
-- 1) UPPER(문자열) / LOWER(문자열) / INITCAP(문자열)
SELECT 'Orcle mania', 
UPPER('Orcle mania') AS 대문자, 
LOWER('Orcle mania') AS 소문자,
INITCAP('Orcle mania') AS "첫 글자 대문자"
FROM DUAL;

-- 직원 테이블
SELECT ENAME, 
LOWER(ENAME), 
JOB, 
INITCAP(JOB)
FROM EMPLOYEE;

-- SCOTT 사원 검색하기
-- 이렇게 하면 안 나옴
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWERENAME = 'scott';

-- 상기내용 고치는 법 1
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE ENAME = UPPER('scott');

-- 상기내용 고치는 법 2(컬럼의 데이터를 일괄 소문자로 변경해서 비교)
-- 성능은 썩창임
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';

-- 참고
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE INITCAP(ENAME) = 'Scott';

-- 오라클 내장함수
-- 2) 문자길이를 반환하는 함수(이건 바이트 계산 같은거 안 하고 ㄹㅇ 길이만 봄)
-- LENGTH(문자열) : 한글이든 영어든 상관없이 문자 개수를 세어서 반환
SELECT LENGTH('OracleManina'), 
LENGTH('오라클매니아')
FROM DUAL;

-- 오라클 내장함수
-- 3) 문자 조작 함수
-- CONCAT : 문자의 값을 연결하는 함수(문자열 붙이기)
-- 참고) 문자열 || 문자열 : 문자열 붙이기
-- 'Oracle' + 'mania' == 'Oracle' || 'mania'
SELECT 'Oracle', 
'mania',
CONCAT('Oracle', 'mania'),
'Oracle' || 'mania'
FROM DUAL;

-- 오라클 내장함수
-- 4) 문자열 자르기
-- SUBSTR(대상 컬럼(문자), 시작위치, 개수) : 인덱스가 1부터 시작
-- 성능은 LIKE에 비해 줫망
SELECT SUBSTR('Oracle mania', 4, 3),
-- 끝에서 찾는거임
SUBSTR('Oracle mania', -1, 1)
FROM DUAL;

-- 문제 14) 이름이 N으로 끝나는 사원 표시하기
-- 대상 테이블 : EMPLOYEE
-- 단, SUBSTR() 쓰기

SELECT * 
FROM EMPLOYEE
WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- 문제 15) 87년도에 입사한 사원 표시하기
-- 대상 테이블 : EMPLOYEE
-- 단, SUBSTR() 쓰기

SELECT *
FROM EMPLOYEE
WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(대상 컬럼(문자), 시작위치, 개수) : 문자 BYTE 기준으로 출력
-- 영문(1BYTE) : SUBSTR / SUBSTRB 결과가 동일
-- 한글(3BYTE) : SUBSTR / SUBSTRB 결과가 틀림

-- 오라클 내장함수
-- 5) 문자열에서 대상 문자 찾아서 인덱스 번호 반환
-- 오라클에서는 인덱스 번호가 1부터 시작함
-- INSTR(대상 컬럼(문자), 찾을글자, 시작위치, 몇 번째 발견)

SELECT INSTR('Oracle mania', 'a')
FROM DUAL;

-- 대상 문자열에 'a' 의 위치를 5번째 위치부터 찾기 시작하고, 2번째 'a'를 찾았을때 인덱스 번호 반환
SELECT INSTR('Oracle mania', 'a', 5, 2)
FROM DUAL;

-- 문제 16) 사원 정보에서 세 번째 자리가 'R'인 사원을 검색하는 쿼리문을 작성하셈
-- 단, INSTR을 사용하셈
-- WHERE절에 내장함수 쓰면 성능 씹창 개 죶 씹창 에미 뒤짐ㅇㅇ 그래서 쓰지마셈 LIKE 쓰셈

SELECT * 
FROM EMPLOYEE
WHERE INSTR(ENAME, 'R') = 3;








