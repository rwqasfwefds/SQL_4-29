-- 검색(R) 문법(4-28 정리)
-- SELECT 컬럼명 FROM 테이블명 WHERE 조건컬럼 = 또는 LIKE ''
-- ORDER BY 정렬대상컬럼[복수개] ASC[오름차순] 또는 DESC[내림차순];
-- SELECT 컬럼의 순서에 따라 출력되는 위치가 바뀜
SELECT * FROM EMP ORDER BY ENAME, EMPNO;
-- 컬럼ID로도 정렬 줄 수 있음
SELECT * FROM EMP ORDER BY 2, 1;

-- DESC 테이블명
-- 테이블의 구조를 보여주는 명령어
-- 이름 : 컬럼 명, 널 = NULL값을 줘도 되는지 안 되는지, 유형 = 자료형 (괄호안에 있는건 자릿수)
-- NUMBER : 정수, 실수를 표기하는 자료형(*)
-- NUMBER(4) : 4는 숫자 4자리
-- NUMBER(7,2) : 7은 정수자리수 7, 2는 소수자리수 2
-- VARCHAR2 : 문자열을 표기하는 자료형(*)
-- VARCHAR2(10) : 10은 자리수
-- 처음 설정할때 UTF-8로 설정했잖 
-- UTF-8 : 영어(한 단어) 1BYTE, 한글(한 글자) 3BYTE (그니깐 VARCHAR2(10) 이런식으로 잡으면 한글 3글자는 쌉가능인데(9BYTE) 4글자는 12바이트라 쌉 불가능)
-- 참고)KSC5601 : 영어 (한글자) 1BYTE, 한글(한글자) 2BYTE
-- DATE : 날짜를 표기하는 자료형
DESC EMP;

SELECT EMPNO, ENAME, SAL*12 FROM EMP;