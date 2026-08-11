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