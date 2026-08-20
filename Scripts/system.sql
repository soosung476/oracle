-- 대소문자 구별 안함
SELECT * FROM dba_tables;

SELECT * FROM dba_users WHERE username = 'SCOTT';


-- 사용자 생성
-- CREATE USER 사용자이름 IDENTIFIED BY 비밀번호;


CREATE USER TEST_USER1 IDENTIFIED BY 12345;
DROP USER TEST_USER1;

CREATE USER TEST_USER2 IDENTIFIED BY 12345;

-- 접속 권한 주기
GRANT CREATE SESSION TO TEST_USER2;

-- 개별권한 묶어서 관리 => ROLE
-- 필수 권한 한꺼번에 주기
GRANT CONNECT, resource TO test_user2;

-- 권한 취소
REVOKE CONNECT, resource FROM test_user2;

DROP USER TEST_USER2 cascade;

-- python 사용자


CREATE USER PYTHON_USER IDENTIFIED BY 12345
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp
quota 10M ON users;


GRANT CONNECT, resource TO PYTHON_USER;

-- 비밀번호 변경
ALTER USER PYTHON_USER IDENTIFIED BY 54321;

-- 오라클은 사용자별로 객체를 생성
-- 스키마 : 관계, 데이터 구조, 제약조건 등 데이터를 관리하고자 정의한 데이터베이스 구조 범위
-- 사용자 == 스키






