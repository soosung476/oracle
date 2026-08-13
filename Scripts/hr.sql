-- hr 데이터베이스에 접속
SELECT * FROM EMPLOYEES e ;

-- first_name, last_name, job_id 컬럼만 조회

SELECT *
FROM EMPLOYEES e
WHERE e.FIRST_NAME ='William'

-- EMPLOYEES에서 연봉이 12000 이상 되는 직원들의 LAST_NAME, SALARY 조회
SELECT	e.LAST_NAME ,e.SALARY 
FROM EMPLOYEES e
WHERE e.SALARY >12000;
-- 사원번호가 176인 직원의 LASTNAME, DEPARTMENT_ID 조회
SELECT e.LAST_NAME , e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.EMPLOYEE_ID =176;
-- 연봉이 5000에서 12000범위 이외인 사람들의 LAST_NAME, SALARY조회
SELECT e.LAST_NAME, e.SALARY 
FROM EMPLOYEES e 
WHERE e.SALARY < 5000 OR  e.SALARY >12000
ORDER BY e.SALARY DESC;

-- 20번 혹은 50번 부서에서 근무하는 모든 사원들의
-- LAST_NAME, DEPARTMENT_ID  알파벳 순으로 조회

SELECT e.LAST_NAME, e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (20, 50)
ORDER BY e.LAST_NAME , e.DEPARTMENT_ID ;

-- 커미션이 0보다 큰 사원들의 LAST_NAME, SALARY, COMMISSION_PCT 조회
-- SALARY DESC, COMMISION_PCT DESC
SELECT e.LAST_NAME ,e.SALARY ,e.COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE e.COMMISSION_PCT >0
ORDER BY e.SALARY DESC , e.COMMISSION_PCT DESC ;

-- SALARY가 2500 OR 3500 OR 7000 이 아니며  JOB_ID가
-- SA_REP OR ST_CLERK인 직원 조회 
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY NOT IN (2500, 3500, 7000)
	AND e.JOB_ID IN('SA_REP', 'ST_CLERK');

-- 2015년도에 고용된 직원 조회 후 입사일(HIRE_DATE)기준으로 오름차순 정렬
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	E.HIRE_DATE >= DATE'2015-01-01' 
	AND E.HIRE_DATE <= DATE'2015-12-31'
ORDER BY
	e.HIRE_DATE ASC;


-- 20번 혹은 50번 부서에서 근무하는 모든 사원들의
-- LAST_NAME, DEPARTMENT_ID  알파벳 순으로 조회
-- 단 SALARY가 5000 ~ 12000 이하인 사람
SELECT	e.LAST_NAME , e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.SALARY BETWEEN 5000 AND 12000;

-- SALARY가 5000~12000 범위가 아닌 직원들의
-- LAST_NAME , SALARY 조회
SELECT e.LAST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE e.SALARY NOT BETWEEN 5000 AND 12000;


-- 2015년도에 고용된 직원 조회 
-- BETWEEN을 써서
SELECT	*
FROM EMPLOYEES e 
WHERE e.HIRE_DATE BETWEEN DATE '2015-01-01' AND DATE '2015-12-31';


-- last_name에 u가 포함된 사원들의 first_name, last_name, employee_id 조회
SELECT e.FIRST_NAME ,e.LAST_NAME ,e.EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE '%u%';

-- last_name의 네 번째 글자가 a인 사원들의 employee_id, first_name, last_name 조회
SELECT e.FIRST_NAME ,e.LAST_NAME ,e.EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE '___a%';

-- last_name에  a 혹은 e글자가 있는 사원들의 employee_id, first_name, last_name 조회
SELECT e.FIRST_NAME ,e.LAST_NAME ,e.EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE e.LAST_NAME LIKE '%a%' OR e.LAST_NAME  LIKE '%e%';


-- manager_id가 없는 직원들의 last_name, job_id 조회
SELECT e.last_name, e.job_id
FROM employees e
WHERE e.manager_id IS NULL;



-- ST-CLERK인 직업 id를 가진 사원이 없는 부서 id 조회 (단, 부서 번호가 null인 경우 제외)
SELECT DISTINCT e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.JOB_ID NOT IN ('ST_CLERK') AND e.DEPARTMENT_ID IS NOT NULL
ORDER BY e.DEPARTMENT_ID ;


-- COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMISSION = SALARY*COMMISSION_PCT를 구한 후
-- EMPLOYEE_ID, FIRST_NAME, JOB_ID 조회

SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , e.COMMISSION_PCT * e.SALARY  AS COMMISSION
FROM employees e
WHERE e.COMMISSION_PCT IS NOT NULL;


-- 문자열 함수

-- first_name 이 Curtis인 사람의 first_name last_name, _email, phone_number, job_id 조회
-- 단 job_id의 결과는 소문자로 출력

SELECT e.first_name, e.LAST_NAME , e.EMAIL , e.PHONE_NUMBER ,lower(e.JOB_ID)  
FROM EMPLOYEES e 
WHERE e.FIRST_NAME ='Curtis';

-- 부서번호가 60,70,80,90 인 사원들의 employee_id, first_name, hire_date, job_id를 조회
-- 단 job_id가 IT_PROG인 사원의 경우 '프로그래머'로 변경 후 출력

SELECT e.EMPLOYEE_ID ,e.FIRST_NAME ,e.HIRE_DATE , REPLACE(e.JOB_ID, 'IT_PROG', '프로그래머') JOB_ID
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (60,70,80,90);

-- JOB_ID가 AD_PRES, PU_CLERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
-- JOB_ID 를 조회, 단 사원명은 FIRST_NAME, LAST_NAME을 연결하여 출력 (사이에 공백 하나 포함)

SELECT e.EMPLOYEE_ID , e.FIRST_NAME || ' ' || e.LAST_NAME , e.DEPARTMENT_ID , e.JOB_ID 
FROM EMPLOYEES e 
WHERE e.JOB_ID IN ('AD_PRES', 'PU_CLERK');


-- 입사 10주년이 되는 날짜 출력
-- 사원번호, 이름(first_name, last_name), 입사일

SELECT ADD_MONTHS(e.HIRE_DATE, 120) , e.FIRST_NAME , e.LAST_NAME , e.EMPLOYEE_ID 
FROM EMPLOYEES e;

-- 회사 내의 최대연봉 및 최소연봉 차이를 조회(SAL_GAP)
SELECT max(e.SALARY ), min(e.SALARY ), MAX(e.SALARY )-min(e.SALARY ) AS SAL_GAP
FROM EMPLOYEES e ;

-- 매니저로 근무하는 사우너들의 총 수 조회 (중복제거)
SELECT count(distinct e.MANAGER_ID) 
FROM EMPLOYEES e ;
 
-- 부서별 인원수와 최고 급여를 부서번호 순으로 조회.
SELECT e.DEPARTMENT_ID , count(*) AS 인원수, max(e.SALARY ) AS 최고급여
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID;

-- 부서별 급여의 평균 연봉 출력 (평균은 반올림)
-- 부서번호, 평균

SELECT e.DEPARTMENT_ID , round(avg(e.SALARY ), 2)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 

-- 부서별 동일한 직업을 가진 사원들의 총 수를 출력
SELECT e.DEPARTMENT_ID AS 부서 , e.JOB_ID 직무, count(*) 인원수
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID , e.JOB_ID 


-- 매니저가 없는 사원들은 제외하고 매니저가 관리하는 사원들 중에서 최소 급여를 받는 사원들 출력
-- 단 매니저가 관리하는 사원 중에서 연봉이 6000 미만인 사원 제외

SELECT e.MANAGER_ID, count(*) 관리인원,min(e.SALARY ) 최소연봉
FROM EMPLOYEES e 
WHERE e.MANAGER_ID IS NOT NULL AND e.SALARY >=6000
GROUP BY e.MANAGER_ID ;


-- 자신의 담당 매니저의 입사일보다 더 빨리 입사한 사원 찾기
SELECT e2.EMPLOYEE_ID AS 사번 ,e2.FIRST_NAME ||e2.LAST_NAME 이름, e.FIRST_NAME ||e.LAST_NAME 매니저이름, e2.MANAGER_ID 매니저사번
FROM EMPLOYEES e 
JOIN EMPLOYEES e2 
ON e.EMPLOYEE_ID = e2.MANAGER_ID 
WHERE e.HIRE_DATE >e2.HIRE_DATE ;



-- 위치 아이디가 1700인 사원들의 LAST_NAME, DEPARTMENT_ID, SALARY 조회

SELECT e.LAST_NAME , e.DEPARTMENT_ID , e.SALARY, d.LOCATION_ID 
FROM EMPLOYEES e 
JOIN DEPARTMENTS d 
ON d.DEPARTMENT_ID =e.DEPARTMENT_ID 
WHERE d.LOCATION_ID = 1700
ORDER BY e.DEPARTMENT_ID  ;


-- executive 부서에 근문하는 모든 사원들의 부서번호 last_name, department_id, salary, job_id
SELECT e.DEPARTMENT_ID , e.LAST_NAME , e.SALARY , e.JOB_ID , d.DEPARTMENT_NAME 
FROM EMPLOYEES e 
JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE d.DEPARTMENT_NAME = 'Executive';


-- 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 더 많은 연봉을 받는 사원이 존재하는 사원정보 조회
-- 사번, 이름
SELECT DISTINCT 
e.EMPLOYEE_ID,
e.FIRST_NAME || ' ' ||e.LAST_NAME ,
e.HIRE_DATE,
e.SALARY  
FROM EMPLOYEES e 
JOIN EMPLOYEES e2 
ON e.DEPARTMENT_ID =e.DEPARTMENT_ID
WHERE e.HIRE_DATE >e2.HIRE_DATE AND e.SALARY >e2.SALARY 
ORDER BY e.EMPLOYEE_ID ; 


-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
SELECT e.EMPLOYEE_ID , e.LAST_NAME , e.DEPARTMENT_ID, l.CITY 
FROM DEPARTMENTS d
JOIN EMPLOYEES e  
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
JOIN LOCATIONS l
ON d.LOCATION_ID = l.LOCATION_ID
WHERE l.CITY LIKE 'T%';
