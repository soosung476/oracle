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


-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE 'S%';


-- 사원 이름의 두 번째 글자가 L인 사원 조회
SELECT *
FROM EMP e
WHERE e.ENAME LIKE '_L%';



-- 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT	*
FROM EMP e 
WHERE e.ENAME LIKE '%AM%';

-- AM이 포함되지 않은 사람

SELECT	*
FROM EMP e 
WHERE e.ENAME NOT LIKE '%AM%';


-- IS NULL
SELECT * FROM EMP e WHERE e.comm IS NULL;

-- MGR이 NULL인 직원
SELECT * FROM emp e WHERE e.MGR IS NULL;


-- NULL 에 산술, 비교 연산시 결과값은 모두 NULL
SELECT  e.SAL ,e.COMM, E.SAL * e.COMM, e.sal + e.COMM 
FROM EMP e 
WHERE e.COMM IS NOT NULL;


-- 집합 연산자 
-- UNION, UNION ALL(중복 결과값도 출력), MINUS, INTERSECT

SELECT e.EMPNO , e.ENAME , e.SAL , e.DEPTNO 
FROM EMP e 
WHERE e.DEPTNO =10
UNION
SELECT e.EMPNO , e.ENAME , e.SAL, e.DEPTNO 
FROM EMP e 
WHERE e.DEPTNO =10;



SELECT e.EMPNO , e.ENAME , e.SAL , e.DEPTNO 
FROM EMP e 
MINUS
SELECT e.EMPNO , e.ENAME , e.SAL, e.DEPTNO 
FROM EMP e 
WHERE e.DEPTNO =10;


SELECT e.EMPNO , e.ENAME , e.SAL , e.DEPTNO 
FROM EMP e 
INTERSECT
SELECT e.EMPNO , e.ENAME , e.SAL, e.DEPTNO 
FROM EMP e 
WHERE e.DEPTNO =10;


----
-- 연습문제
-- 1. 사원명이 S로 끝나는 사원 데이터 조회 
SELECT *
FROM EMP e
WHERE e.ENAME LIKE '%S';

-- 2. 30번 부서에서 근무하고 있는 사원 중에서 job이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 조회

SELECT e.EMPNO ,e.ENAME ,e.SAL, e.JOB , e.DEPTNO 
FROM emp e
WHERE e.DEPTNO = 30 AND e.JOB = 'SALESMAN';



-- 3. 20번, 30번 부서에서 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두 가지 방식의
-- Select 문을 사용하여 이름, 사원번호, 직책, 급여, 부서번호를 출력
-- 집합 연산자를 사용하지 않는 방식
-- 집합 연산자를 활용한 방식

SELECT *
FROM EMP e 
WHERE (e.DEPTNO =20 OR e.DEPTNO = 30) AND e.SAL >2000; 

SELECT *
FROM emp e
WHERE e.DEPTNO IN (20,30)
INTERSECT 
SELECT *
FROM emp e
WHERE e.SAL  >2000;

-- 4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여 열이 2000이상 3000이하 범위 이외의 값을
-- 가진 데이터만 출력
SELECT *
FROM emp e
WHERE e.sal <=2000 or e.sal >= 3000;


-- 5. 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000~ 2000 사이가 아닌 사원이름, 사원번호, 급여
-- 부서번호를 출력

SELECT e.ENAME , e.EMPNO , e.SAL 
FROM EMP e 
WHERE e.ENAME LIKE '%E%' AND e.DEPTNO =30 AND e.SAL NOT BETWEEN 1000 AND 2000 ;
-- 6. 추가수당이 존재하지 않고 상급자가 있으며, 직책이 MANAGER, CLERK인 사원 중에서 사원 이름의
-- 두번째 글자가 L이 아닌 사원의 정보 출력

SELECT
	*
FROM
	EMP e
WHERE
	e.comm IS NULL
	AND e.mgr IS NOT NULL
	AND e.JOB IN ('MANAGER', 'CLERK')
	AND e.ENAME NOT LIKE '_L%'
	
	
-- 오라클 함수
-- 1. 문자함수
-- upper(), lower(), initcap()

SELECT e.ename, upper(e.ename), lower(e.ENAME ), INITCAP(e.ENAME )
FROM EMP e ;

-- job이 salesman인 직원 조회
SELECT *
FROM EMP e 
WHERE lower(e.job)='salesman';


	
-- length(), lengthb() : 바이트 수 반환

SELECT e.ename, length(e.ENAME ), lengthb(e.ENAME )
FROM EMP e ;


-- dual: 더미 테이블
-- 한글 한자당 3byte
SELECT LENGTH('한글'), LENGTHB('한글')
FROM dual;

-- 직책 이름이 6자리 이상인 사원 조회
SELECT *
FROM emp e
WHERE LENGTH(e.job) >=6;

-- substr(문자열데이터, 시작위치, 추출길이) : 부분 문자열 추출

SELECT e.job, substr(e.job,1,2),substr(e.job, 3, 2),substr(e.job,5)
FROM emp e;


-- -는 오른쪽에서부터
SELECT e.job, substr(e.job, -LENGTH(e.job)),substr(e.job, -LENGTH(e.job), 2),substr(e.job, -3)
FROM emp e;


-- instr(원본문자열, 찾을문자, 시작위치, 몇번째 것 찾을건지) : 문자열 데이터 안에서 특정 문자 위치 찾기
-- index 1부터
SELECT
	INSTR('HELLO ORACLE', 'L') INSTR_1,
	INSTR('HELLO ORACLE', 'L', 5) INSTR_2,
	INSTR('HELLO ORACLE', 'L', 2, 2) INSTR_3 ,
	INSTR('HELLO ORACLE', 'P', 2, 2) INSTR_4
FROM
	dual;

-- instr() 이용해서 사원이름에 S가 있는 사원
SELECT *
FROM EMP e
WHERE (INSTR(e.ENAME,'S')) != 0;

-- replace(원본, 찾는문자, 대체문자)
SELECT '010-1234-5678',REPLACE('010-1234-5678', '-', ''),REPLACE('010-1234-5678', '-')
FROM dual;


-- concat() : 두 문자열 데이터 연결
SELECT e.EMPNO , e.ENAME , CONCAT(e.EMPNO,':' ,e.ENAME )
FROM EMP e ;

-- ||
SELECT e.EMPNO ,e.ENAME ,e.EMPNO ||e.ENAME , e.EMPNO ||':'||e.ENAME 
FROM EMP e ;

-- 데이터의 공간을 특정 문자로 채우는 LPAD(), RPAD()
SELECT
	'Oracle',
	LPAD('Oracle', 10, '#'),
	RPAD('Oracle', 12, '*'),
	LPAD('Oracle', 12),
	RPAD('Oracle', 12)
FROM
	dual;


SELECT RPAD('971225-', 14, '*')
FROM dual;


-- 특정 문자를 지우는 TRIM, LTRIM, RTRIM

SELECT '[' || TRIM(' __ORACLE__ ') || ']' AS trim,
'[' || LTRIM(' __ORACLE__ ') || ']' AS ltrim,
'[' || RTRIM(' __ORACLE__ ') || ']' AS rtrim

FROM dual;

SELECT '[' || TRIM('_' from '__ORACLE__') || ']' AS trim,
'[' || LTRIM('<__ORACLE__>','_<') || ']' AS ltrim,
'[' || RTRIM('__ORACLE__', '>_') || ']' AS rtrim,

FROM dual;


-- 2. 숫자함수
-- round(), trunc(), ceil(), floor(), mod()

SELECT round(1234.5678) AS round,
round(1234.5678, 0) AS round0,
round(1234.5678, 1) AS round1,
round(1234.5678, 2) AS round2,
round(1234.5678, -1) AS round_minus1,
round(1234.5678, -2) AS round_minus2
FROM dual;



-- TRUNC() 특정 위치에서 버림
SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC0,
TRUNC(1234.5678, 1) AS TRUNC1,
TRUNC(1234.5678, 2) AS TRUNC2,
TRUNC(1234.5678, -1) AS TRUNC_minus1,
TRUNC(1234.5678, -2) AS TRUNC_minus2
FROM dual;



-- ceil()  
-- floor() 

SELECT CEIL(3.14), floor(3.14),ceil(-3.14),floor(-3.14)
FROM dual;

-- mod() 나머지
SELECT mod(3,2), mod(15,6), MOD (20,2)
FROM dual;


-- 3. 날짜함수
SELECT SYSDATE, sysdate -1, sysdate +1
FROM dual;


-- 현재 날짜를 기준으로 3개월 이후 날짜 조회 add_month()
SELECT sysdate, ADD_MONTHS(sysdate, 3)
FROM dual;


-- 두 날짜 사이 개월 수 차이 : month_between()

SELECT e.EMPNO , e.HIREDATE , sysdate, MONTHS_BETWEEN(e.HIREDATE ,sysdate) AS month1,
MONTHS_BETWEEN(sysdate,e.HIREDATE ) AS month2,
trunc(MONTHS_BETWEEN(sysdate,e.HIREDATE )) AS month3
FROM EMP e 


-- last_day(날짜) :  그 날짜가 속한 달의 마지막 날을 돌려줍니다
-- next_day(날짜, '요일') : 날짜 이후 처음 맞이하는 특정 요일

SELECT sysdate, LAST_DAY(sysdate), NEXT_DAY(sysdate,'Fri')
FROM dual;


-- 형변환 함수
-- 1) to_char() : 숫자, 날짜 데이터 => 문자 데이터 변환
-- 2) to_number() : 문자 데이터를 숫자로 변
SELECT sysdate, to_CHAR(sysdate, 'yyyy/mm/dd')
FROM dual;

SELECT
	sysdate,
	to_CHAR(sysdate, 'mm'),
	to_CHAR(sysdate, 'mon'),
	to_CHAR(sysdate, 'month'),
	to_CHAR(sysdate, 'dd'),
	to_CHAR(sysdate, 'dy'),
	to_CHAR(sysdate, 'day')
FROM
	dual;


SELECT
	sysdate,
	to_CHAR(sysdate, 'HH24:MI:SS'),
	to_CHAR(sysdate, 'HH24:MI:SS AM'),
	to_CHAR(sysdate, 'HH24:MI:SS A.M.')
	
FROM
	dual;

-- 문자숫자와 산술연산 시 자동으로 숫자데이터로 형변환 발생
SELECT 1300-'1500', '1300'+1500
FROM dual;

SELECT '1300'-'1500', '1300'+'1500'
FROM dual;


SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500','999,999')
FROM dual;


-- 널 처리함수
-- NVL(NULL, 변경할값), NVL2(NULL,널이 아닐때 값,널일때 값)


-- NULL + Number = NULL 
SELECT e.EMPNO , e.ENAME , e.SAL , e.COMM , e.SAL +e.COMM 
FROM EMP e ;

SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL ,
	NVL(e.COMM, 0) ,
	e.SAL + NVL(e.COMM, 0)
FROM
	EMP e;
	
	SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL ,
	NVL2(e.COMM, 'o' , 'x') ,
	NVL2(e.COMM, e.COMM + e.sal*12 , e.sal*12)
FROM
	EMP e;
	
	
	
SELECT NVL(to_char(e.comm), 'N/A')
FROM EMP e;
	
-- DECODE(비교대상, 값1, 결과1, 값2, 결과2, ... , 기본값(조건에 맞는 경우가 없을 때 반환값))
	
	
-- 직책 MANAGER, -> SAL*10%, SALESMAN -> 5%, ANALYST -> ,OTHERS -> 3%
-- 사원번호, 이름, 직책, 급여 출력
	
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	DECODE(e.JOB, 'MANAGER', E.SAL*1.1, 'SALESMAN', E.SAL*1.05, 'ANALYST', E.SAL, E.SAL*1.03) AS 급여
FROM EMP e;

-- CASE 단순형

-- CASE 컬럼 
-- WHEN 값1 THEN 결과1
-- WHEN 값2 THEN 결과2
-- ELSE 기본값
-- END


-- CASE 검색형

-- CASE
--  WHEN 조건1 THEN 결과1
--  WHEN 조건2 THEN 결과2
--  ELSE 기본값
--END

SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	CASE e.JOB 
	WHEN 'MANAGER' THEN e.sal*1.1
	WHEN 'SALESMAN' THEN e.SAL* 1.05
	WHEN 'ANALYST' THEN e.sal
	ELSE E.SAL * 1.03
	END AS 급여
FROM EMP e;



-- COMM 널이면 '해당없음' / COMM = 0 '수당없음' / COMM >0 '수당 : 800'
-- COMM_TEXT 컬럼명
SELECT
e.empno,
e.ename,
e.job,
e.sal,
CASE
WHEN e.comm IS null THEN '해당없음'
WHEN e.comm = 0 THEN '수당없음'
WHEN e.comm > 0 THEN '수당 : ' || e.COMM
END AS COMM_TEXT
FROM EMP e ;

-- 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원이 정직원이 되는 날짜를 YYYY-MM-DD 형식으로 출력 (R_JOB)
-- 단, 추가 수당이 없는 사원의 추가수당은 N/A로 출력 (COMM)
-- 사원번호, 이름, 고용일,

SELECT 
e.EMPNO ,
e.ENAME ,
e.HIREDATE,
to_char(NEXT_DAY(ADD_MONTHS(e.HIREDATE, 3),'Mon'), 'YYYY-MM-DD') AS R_JOB,
NVL(to_char(e.COMM), 'N/A')
FROM EMP e;


-- MGR을 기준으로 CHG_MGR 컬럼에 출력
-- 직속상관 번호가 없는 경우 0000
-- 직속상관 앞번호 2자리가 75일 경우 5555 
-- 직속상관 앞번호 2자리가 76일 경우 6666
-- 직속상관 앞번호 2자리가 77일 경우 7777
-- 직속상관 앞번호 2자리가 78일 경우 8888
-- 그외는 본래 직속상관의 사번 그대로 출력

SELECT e.EMPNO ,
e.ENAME ,
e.HIREDATE,
CASE SUBSTR(nvl(to_char(e.MGR),'NULL'), 1, 2)
WHEN '75' THEN '5555'
WHEN '76' THEN '6666'
WHEN '77' THEN '7777'
WHEN '78' THEN '8888'
WHEN 'NU' THEN '0000'
ELSE to_char(e.mgr)
END AS CHG_MGR
FROM EMP e 
ORDER BY e.MGR ;