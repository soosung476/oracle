-- scott 데이터베이스에 접속

-- select:read

-- EMP 테이블의 모든 내용 보기 
SELECT	* FROM EMP e ;

-- 조회할 때 특정 행 단위로 조회 (selection)
-- 조회할 때 특정 열 단위로 조회 (projection)
SELECT	e.EMPNO, e.ENAME, e.MGR
FROM EMP e ;

-- 중복 데이터 제거
SELECT deptno FROM EMP e;
SELECT DISTINCT deptno FROM EMP e;

SELECT job FROM EMP e;
SELECT DISTINCT e.job, e.ename FROM EMP e ;

-- as 별칭
-- "별칭" or 별칭 (단, 별칭에 공백이 있다면 반드시 "" 사용)
-- as 키워드 생략 가능
SELECT e.EMPNO AS "사원 번호" , e.SAL * 12 연봉
FROM EMP e;

-- order by
-- 오름차순(default) : asc / 내림차순 : desc

SELECT e.EMPNO ,e.ENAME 
FROM EMP e
ORDER BY e.EMPNO DESC;

SELECT e.EMPNO , e.ENAME ,e.SAL 
FROM EMP e
ORDER BY e.SAL DESC ;

SELECT e.EMPNO , e.ENAME ,e.SAL 
FROM EMP e
ORDER BY e.DEPTNO asc, e.SAL DESC ;

SELECT
	e.EMPNO EMPLOYEE_NO,
	e.ENAME EMPLOYEE_NAME,
	e.MGR MANAGER,
	e.SAL SALARY,
	e.COMM COMMISSION,
	e.DEPTNO DEPARTMENT_NO
FROM
	EMP e
ORDER BY
	DEPARTMENT_NO DESC,
	EMPLOYEE_NAME ASC;
    
-- 조건
-- 부서번호가 30번인 직원만 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30;

-- empno가 7782인 직원 조회
SELECT 
	*
FROM 
	EMP e 
WHERE 
	e.EMPNO =7782;

-- 부서번호가 30번이고, 사원 직책이 salesman 직원 조회
SELECT *
FROM EMP e 
WHERE e.DEPTNO =30 AND e.JOB = 'SALESMAN';


-- 사원번호 7499 부서번호 30인 사원 조회
SELECT	*
FROM EMP e
WHERE e.EMPNO =7499 AND e.DEPTNO =30;


-- 부서번호가 30이거나 직책이 CLERK 사원 조회
SELECT *
FROM EMP e 
WHERE e.DEPTNO =30 OR e.JOB = 'CLERK';

-- sal(월급) 일 때
-- 연봉이 36000인 사원의 전체 정보 조회
SELECT	*
FROM EMP e 
WHERE e.SAL *12 =36000;


-- 월급여가 3000 초과인 사원의 전체 정보 조회
SELECT  *
FROM EMP e 
WHERE e.SAL >3000;
-- 월급여가 2500 이상이고 사원직책이 'ANALYST'인 사원 정보 조회
SELECT  *
FROM EMP e 
WHERE e.SAL >2500 AND e.JOB ='ANALYST';
-- 사원 직책이 MANAGER, SALESMAN, CLERK인 사원 정보 조
SELECT  *
FROM EMP e 
WHERE e.JOB ='MANAGER' OR e.JOB  = 'SALESMAN' OR e.JOB = 'CLERK';

-- ename의 시작이 f 이후의 문자로 시작하는 사원 조회
SELECT	*
FROM EMP e 
WHERE e.ENAME >= 'F';

-- =(같다) !=(같지않다)
SELECT  *
FROM EMP e 
WHERE e.SAL !=3000;

SELECT  *
FROM EMP e 
WHERE e.SAL <>3000;

SELECT  *
FROM EMP e 
WHERE e.SAL ^=3000;

-- IN 
SELECT  *
FROM EMP e 
WHERE e.JOB IN('MANAGER', 'SALESMAN', 'CLERK');


-- 부서번호가 10번이거나 20번인 사원 조회
SELECT  *
FROM EMP e 
WHERE e.DEPTNO  IN(10, 20);

-- NOT IN
SELECT  *
FROM EMP e 
WHERE e.JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT
	*
FROM
	emp e
WHERE
	e.HIREDATE  >= DATE'1980-01-01' 
	AND E.HIREDATE  <= DATE'1980-12-31';

-- 특정 범위에 있는 값 추출할 때 사용 : BETWEEN A AND B
-- SALARY 2000 이상 3000 이하인 사원정보 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL BETWEEN 2000 AND 3000;

-- 2000 이상 3000 이하가 아닌
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL NOT BETWEEN 2000 AND 3000;

-- 문자열 연결로 문장 만들기
-- 이렇게 만든 값은 원본테이블에 저장되지 않고 조회화면에만 나타나는 가상의 
SELECT	e.ENAME ||'님의 직업은'||e.JOB ||'입니다.'AS "소개"
FROM EMP e 
WHERE e.DEPTNO =10;