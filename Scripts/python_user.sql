
CREATE TABLE author
(
  author_id   NUMBER(10)   NOT NULL,
  author_name VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_author PRIMARY KEY (author_id)
);

CREATE TABLE Book
(
  book_id     NUMBER(10)    NOT NULL,
  title       VARCHAR2(200) NOT NULL,
  price       NUMBER(8)     NOT NULL,
  stock_qty   NUMBER(10)    DEFAULT 0 NOT NULL,
  category_id NUMBER(10)    NOT NULL,
  CONSTRAINT PK_Book PRIMARY KEY (book_id)
);

CREATE TABLE book_author
(
  author_id NUMBER(10) NOT NULL,
  book_id   NUMBER(10) NOT NULL,
  CONSTRAINT PK_book_author PRIMARY KEY (author_id, book_id)
);

CREATE TABLE Category
(
  category_id   NUMBER(10)   NOT NULL,
  category_name VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Category PRIMARY KEY (category_id)
);

CREATE TABLE Member
(
  member_id NUMBER(10)    NOT NULL,
  name      VARCHAR2(50)  NOT NULL,
  email     VARCHAR2(100) NOT NULL,
  phone     varchar2(20) ,
  joined_at DATE          NOT NULL,
  CONSTRAINT PK_Member PRIMARY KEY (member_id)
);

CREATE TABLE order_detail
(
  order_id   NUMBER(10) NOT NULL,
  book_id    NUMBER(10) NOT NULL,
  quantity   NUMBER(10) NOT NULL,
  sale_price NUMBER     NOT NULL,
  CONSTRAINT PK_order_detail PRIMARY KEY (order_id, book_id)
);

CREATE TABLE Orders
(
  order_id   NUMBER(10)   NOT NULL,
  status     VARCHAR2(20) NOT NULL,
  order_date DATE         NOT NULL,
  member_id  NUMBER(10)   NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY (order_id)
);

ALTER TABLE Orders
  ADD CONSTRAINT FK_Member_TO_Orders
    FOREIGN KEY (member_id)
    REFERENCES Member (member_id);

ALTER TABLE Book
  ADD CONSTRAINT FK_Category_TO_Book
    FOREIGN KEY (category_id)
    REFERENCES Category (category_id);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_Orders_TO_order_detail
    FOREIGN KEY (order_id)
    REFERENCES Orders (order_id);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_Book_TO_order_detail
    FOREIGN KEY (book_id)
    REFERENCES Book (book_id);

ALTER TABLE book_author
  ADD CONSTRAINT FK_author_TO_book_author
    FOREIGN KEY (author_id)
    REFERENCES author (author_id);

ALTER TABLE book_author
  ADD CONSTRAINT FK_Book_TO_book_author
    FOREIGN KEY (book_id)
    REFERENCES Book (book_id);
