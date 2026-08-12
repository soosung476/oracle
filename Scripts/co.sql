-- orders 테이블의 모든 컬럼 조회
SELECT *
FROM ORDERS o ;

-- 주문번호와 주문일시만 조회
SELECT o.ORDER_ID ,o.ORDER_TMS 
FROM ORDERS o ;

-- 주문상태가 OPEN인 주문만 조회.
SELECT  *
FROM ORDERS o 
WHERE o.ORDER_STATUS = 'OPEN';
-- 주문상태가 CANCELLED OR REFUNDED인 주문 조회

SELECT  *
FROM ORDERS o 
WHERE o.ORDER_STATUS = 'CANCELLED' OR  o.ORDER_STATUS ='REFUNDED';

-- STORE_ID 가 1인 주문 중에서 주문 상태가 COMPLETE가 아닌 주문 조회

SELECT *
FROM ORDERS o 
WHERE o.STORE_ID ='1' AND o.ORDER_STATUS != 'COMPLETE';

-- 2024년 1월 1일 이후 주문된 건만 조회

SELECT *
FROM ORDERS o 
WHERE o.ORDER_TMS > DATE '2022-01-01';


-- 전체 주문을 최신 주문일시 순으로 정렬하여 조회
SELECT *
FROM ORDERS o 
ORDER BY o.ORDER_TMS DESC;


-- CUSTOMERS TABLE
SELECT * FROM CUSTOMERS c ;

-- 이름이 'K'로 시작하는 고객의 CUSTOMER_ID, FULL_NAME 조회
SELECT c.CUSTOMER_ID , c.FULL_NAME 
FROM CUSTOMERS c 
WHERE c.FULL_NAME LIKE 'K%';


-- 이름이 'son'로 끝나는 고객의 CUSTOMER_ID, FULL_NAME 조회
SELECT c.CUSTOMER_ID, c.FULL_NAME 
FROM CUSTOMERS c 
WHERE c.FULL_NAME LIKE '%son';


-- 이메일에서 '@'앞부분 (아이디) 추출하기
SELECT substr(c.EMAIL_ADDRESS ,1,INSTR(c.EMAIL_ADDRESS, '@')-1) 
FROM CUSTOMERS c; 

-- 이름에서 공백 위치 찾기
SELECT instr(c.FULL_NAME ,' ')
FROM customers c;
-- 이름과 이메일을 하나의 문자열로 합치기 name(name@gmail.com)
SELECT c.FULL_NAME || ' (' || c.EMAIL_ADDRESS || ')'
FROM CUSTOMERS c 


-- 이름 앞 뒤 공백 제거 후 조회(customer_id, full_name)

SELECT c.CUSTOMER_ID ,trim(c.FULL_NAME) AS fullname
FROM CUSTOMERS c;

-- customer_id를 5자리로, 빈자리는 0으로 채우기

SELECT LPAD(c.CUSTOMER_ID, 5, 0) 
FROM CUSTOMERS c 

-- PRODUCTS TABLE
SELECT * FROM PRODUCTS p ;
-- 상품명에 'Shirt' 가 포함된 상품 정보 조회
SELECT *
FROM PRODUCTS p 
WHERE p.PRODUCT_NAME LIKE '%Shirt%'; 



-- 상품명에 Boy로 시작하는 상품 정보 조회
SELECT * FROM PRODUCTS p 
WHERE p.PRODUCT_NAME LIKE 'Boy%';

-- 상품명 앞 10글자만 추출 후 short_name 컬럼명으로 추출
SELECT substr(p.PRODUCT_NAME,1,10) AS short_name  
FROM PRODUCTS p ;

-- 상품명 20자 초과시 앞 20자 + ‘…’
-- case ~ when 사용 (as display_name)
SELECT 
CASE
WHEN LENGTH(p.PRODUCT_NAME) >20 THEN substr(p.product_name,1,20) || '...'
ELSE p.product_name 
END AS display_name
FROM PRODUCTS p ;

-- 상품명 길이가 짝수/활수 인 상품 구분
-- product_id, name, 상품명길이 (name_len으로 지정)
-- 짝수, 홀수  컬럼명은 len_type 으로 지정
-- case~when 사용

SELECT p.PRODUCT_ID , p.PRODUCT_NAME , length(p.PRODUCT_NAME) AS name_len ,
CASE
	WHEN MOD(length(p.product_name),2) = 0 THEN 'Even'
	ELSE 'Odd'
	END AS len_type
FROM PRODUCTS p ;



-- STORE TABLE
SELECT * FROM STORES s ;
-- WEB_ADDRESS가 NULL이 아니면서 'https'로 시작하는 매장 조회
-- store_id, store_name, web_address 조회

SELECT s.STORE_ID , s.STORE_NAME , s.WEB_ADDRESS 
FROM STORES s 
WHERE s.WEB_ADDRESS IS NOT NULL AND s.WEB_ADDRESS LIKE 'https%';

-- ORDERS TABLE
SELECT * FROM ORDERS o ;
-- ORDER_ID를 ‘ORD-0001’ 형태로
-- ORDER_ID, ‘ORD-9991’(ORDER_CODE) 
SELECT o.ORDER_ID  ,'ORD-' || LPAD(o.ORDER_ID ,5,0) AS ORDER_CODE
FROM ORDERS o ;

