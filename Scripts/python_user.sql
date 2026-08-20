
CREATE TABLE manufacture
(
  manu_name         VARCHAR2(50)  NOT NULL,
  manu_phone_number VARCHAR2(20)  NOT NULL,
  manu_addr         VARCHAR2(100) NOT NULL,
  manager           varchar2(30) ,
  CONSTRAINT PK_manufacture PRIMARY KEY (manu_name)
);

CREATE TABLE mart_member
(
  member_id VARCHAR2(20) NOT NULL,
  password  VARCHAR2(20) NOT NULL,
  name      VARCHAR2(20) NOT NULL,
  age       number(2)    NOT NULL,
  rank      VARCHAR2(10) NOT NULL,
  savings   number(10)   NOT NULL,
  CONSTRAINT PK_mart_member PRIMARY KEY (member_id)
);

CREATE TABLE order_detail
(
  order_detail_id number(10) NOT NULL,
  quantity        number(10) NOT NULL,
  order_id        NUMBER(10) NOT NULL,
  product_id      NUMBER(10) NOT NULL,
  CONSTRAINT PK_order_detail PRIMARY KEY (order_detail_id)
);

CREATE TABLE orders
(
  order_id   NUMBER(10)    NOT NULL,
  order_date DATE          NOT NULL,
  menber_id  VARCHAR2(20)  NOT NULL,
  address    VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_orders PRIMARY KEY (order_id)
);

CREATE TABLE post
(
  post_id      number(10)     NOT NULL,
  post_title   VARCHAR2(100)  NOT NULL,
  post_content VARCHAR2(4000) NOT NULL,
  post_date    DATE           NOT NULL,
  menber_id    VARCHAR2(20)   NOT NULL,
  CONSTRAINT PK_post PRIMARY KEY (post_id)
);

CREATE TABLE product
(
  product_id     NUMBER(10)   NOT NULL,
  product_name   VARCHAR2(50) NOT NULL,
  price          number(10)   NOT NULL,
  stock_quantity NUMBER(10)   NOT NULL,
  manu_name      VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_product PRIMARY KEY (product_id)
);

CREATE TABLE supply
(
  supply_id       number(10)   NOT NULL,
  supply_date     VARCHAR2(20) NOT NULL,
  supply_quantity number(10)   NOT NULL,
  product_id      NUMBER(10)   NOT NULL,
  CONSTRAINT PK_supply PRIMARY KEY (supply_id)
);

ALTER TABLE orders
  ADD CONSTRAINT FK_mart_member_TO_orders
    FOREIGN KEY (menber_id)
    REFERENCES mart_member (member_id);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_orders_TO_order_detail
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_product_TO_order_detail
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);

ALTER TABLE post
  ADD CONSTRAINT FK_mart_member_TO_post
    FOREIGN KEY (menber_id)
    REFERENCES mart_member (member_id);

ALTER TABLE supply
  ADD CONSTRAINT FK_product_TO_supply
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);

ALTER TABLE product
  ADD CONSTRAINT FK_manufacture_TO_product
    FOREIGN KEY (manu_name)
    REFERENCES manufacture (manu_name);



