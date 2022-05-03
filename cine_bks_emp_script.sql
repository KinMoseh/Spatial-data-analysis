rem	*********************************************************************
rem	**   SQL statements to create tables used for the ORACLE database  **
rem	*********************************************************************


rem	**********************************************************************
rem	*********************   Drop existing tables   ***********************
rem	**********************************************************************

DROP TABLE emp CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE salgrade CASCADE CONSTRAINTS;

rem	**********************************************************************
rem	******************   Create tables in the scheme   *******************
rem	**********************************************************************

CREATE TABLE dept
	(deptno NUMBER(2) CONSTRAINT dept_pk PRIMARY KEY,
	 dname VARCHAR2(14) ,
	 loc VARCHAR2(13)
	);

CREATE TABLE emp
	(empno NUMBER(4) CONSTRAINT emp_pk PRIMARY KEY,
	 ename VARCHAR2(10),
	 job VARCHAR2(9),
	 mgr NUMBER(4) CONSTRAINT empno_fk REFERENCES emp(empno),
	 hiredate DATE,
	 sal NUMBER(7,2),
	 comm NUMBER(7,2),
	 deptno NUMBER(2) CONSTRAINT emp_fk REFERENCES dept
	);

CREATE TABLE salgrade
	(grade NUMBER,
	 losal NUMBER,
	 hisal NUMBER
	);


rem	**********************************************************************
rem	****************   Disable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE emp DISABLE CONSTRAINT emp_fk;
ALTER TABLE emp DISABLE CONSTRAINT empno_fk;


rem	**********************************************************************
rem	*****************   Populate Tables in the scheme   ******************
rem	**********************************************************************

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','CHICAGO');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,800,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2975,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87','dd-mm-yy')-85,3000,2000,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,to_date('13-JUL-87', 'dd-mm-yy')-51,1100,NULL,NULL);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,2000,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9000);


rem	**********************************************************************
rem	****************   Enable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE emp ENABLE CONSTRAINT emp_fk;
ALTER TABLE emp ENABLE CONSTRAINT empno_fk;



rem	*********************************************************************
rem	**   SQL statements to create tables used for the Cinemas database  **
rem	*********************************************************************

rem	**********************************************************************
rem	*********************   Drop existing tables   ***********************
rem	**********************************************************************

DROP TABLE performances CASCADE CONSTRAINTS;
DROP TABLE screens CASCADE CONSTRAINTS;
DROP TABLE movies CASCADE CONSTRAINTS;

rem	**********************************************************************
rem	******************   Create tables in the scheme   *******************
rem	**********************************************************************

CREATE TABLE screens (
     scr_id           CHAR(2) CONSTRAINT screens_pk PRIMARY KEY,
	 seating_capacity NUMBER(3),
	 disabled_access  CHAR(1)
	);

CREATE TABLE movies (
     mov_id   CHAR(2) CONSTRAINT movies_pk PRIMARY KEY,
     title    VARCHAR2(35),
     country  VARCHAR2(15),
     prod_yr  NUMBER(4)
	);

CREATE TABLE performances (
	 p_day         DATE,
	 p_time        DATE,
	 scr_id        CHAR(2) CONSTRAINT prf_2_scr_fk REFERENCES screens(scr_id),
     mov_id        CHAR(2) CONSTRAINT prf_2_mov_fk REFERENCES movies(mov_id),
     tickets_sold NUMBER(3),
     CONSTRAINT performances_pk PRIMARY KEY(p_day, p_time, scr_id)
	);

rem	**********************************************************************
rem	****************   Disable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE performances DISABLE CONSTRAINT prf_2_scr_fk;
ALTER TABLE performances DISABLE CONSTRAINT prf_2_mov_fk;

rem	**********************************************************************
rem	*****************   Populate Tables in the scheme   ******************
rem	**********************************************************************

INSERT INTO screens VALUES ('S1', 100, 'Y');
INSERT INTO screens VALUES ('S2', 75, 'N');
INSERT INTO screens VALUES ('S3', 55, 'Y');

INSERT INTO movies VALUES ('M1', 'Lord of the Keys', 'USA', 2001);
INSERT INTO movies VALUES ('M2', 'Planet Wars – Episode Eleven', NULL, 2020);
INSERT INTO movies VALUES ('M3', 'Henry Plotter', 'UK', 2002);
INSERT INTO movies VALUES ('M4', 'The Saxophone', 'AUS', NULL);
INSERT INTO movies VALUES ('M5', 'Julius Caesar', 'ITA', 1965);
INSERT INTO movies VALUES ('M6', 'James Bond – Live once more', 'UK', 2002);
    
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('18:10','HH24:MI'), 'S1', 'M1', 95);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('18:10','HH24:MI'), 'S2', 'M1', NULL);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('18:10','HH24:MI'), 'S3', 'M3', 50);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('20:50','HH24:MI'), 'S2', 'M6', 60);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('21:30','HH24:MI'), 'S3', 'M1', 50);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('20:50','HH24:MI'), 'S1', 'M3', 90);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('19:30','HH24:MI'), 'S1', 'M6', 75);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('19:30','HH24:MI'), 'S3', 'M5', NULL);
INSERT INTO performances VALUES (TO_DATE('10-Nov-2018','DD-MM-YYYY'), TO_DATE('19:30','HH24:MI'), 'S2', 'M3', 15);

rem	**********************************************************************
rem	****************   Enable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE performances ENABLE CONSTRAINT prf_2_scr_fk;
ALTER TABLE performances ENABLE CONSTRAINT prf_2_mov_fk;




rem	*********************************************************************
rem	** SQL statements to create tables used for the BOOKS database **
rem	*********************************************************************


rem	**********************************************************************
rem	*********************   Drop existing tables   ***********************
rem	**********************************************************************

DROP TABLE books CASCADE CONSTRAINTS;
DROP TABLE warehouses CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE stock CASCADE CONSTRAINTS;
DROP TABLE ordered_items CASCADE CONSTRAINTS;


rem	**********************************************************************
rem	******************   Create tables in the scheme   *******************
rem	**********************************************************************

CREATE TABLE books
	(bk_id CHAR(3),
	 title VARCHAR2(50),
     price NUMBER(6,2),
	 CONSTRAINT books_pk PRIMARY KEY (bk_id)
	);

CREATE TABLE warehouses
	(w_id CHAR(2),
	 descr VARCHAR2(50),
	 CONSTRAINT warehouses_pk PRIMARY KEY (w_id)
	);

CREATE TABLE orders
	(ord_id CHAR(3),
	 cust_id VARCHAR2(50),
     ord_dt DATE,
	 CONSTRAINT orders_pk PRIMARY KEY (ord_id)
	);
   
CREATE TABLE stock
	(w_id CHAR(2),
     bk_id CHAR(3),
     qty_in_stock NUMBER,
	 CONSTRAINT stock_pk PRIMARY KEY (w_id, bk_id),
	 CONSTRAINT stock_warehouses_fk FOREIGN KEY (w_id) REFERENCES warehouses,
	 CONSTRAINT stock_books_fk FOREIGN KEY (bk_id) REFERENCES books 
	);
   
CREATE TABLE ordered_items
	(ord_id CHAR(3),
     bk_id CHAR(3),
     ord_qty NUMBER,
	 CONSTRAINT ordered_items_pk PRIMARY KEY (ord_id, bk_id),
	 CONSTRAINT ordered_items_orders_fk FOREIGN KEY (ord_id) REFERENCES orders,
	 CONSTRAINT ordered_items_books_fk FOREIGN KEY (bk_id) REFERENCES books 
	);


rem	**********************************************************************
rem	****************   Disable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE ordered_items DISABLE CONSTRAINT ordered_items_books_fk;
ALTER TABLE ordered_items DISABLE CONSTRAINT ordered_items_orders_fk;

ALTER TABLE stock DISABLE CONSTRAINT stock_warehouses_fk;
ALTER TABLE stock DISABLE CONSTRAINT stock_books_fk;



rem	**********************************************************************
rem	*****************   Populate Tables in the scheme   ******************
rem	**********************************************************************

INSERT INTO books VALUES ('B01', 'Oracle for Beginners', 35.00);
INSERT INTO books VALUES ('B02', 'SQL in 21 days', 34.50);
INSERT INTO books VALUES ('B03', 'The DBA’s Handbook', 28.20);
INSERT INTO books VALUES ('B04', 'iPad for novices', null);
INSERT INTO books VALUES ('B05', 'Practical Optimization', 35.00);
INSERT INTO books VALUES ('B06', 'The Web and You', 50.00);
INSERT INTO books VALUES ('B07', 'How to solve problems', 27.70);
INSERT INTO books VALUES ('B08', 'PL/SQL Essentials', NULL);
INSERT INTO books VALUES ('B09', 'When Snowhite met Peter Pan', null);

INSERT INTO warehouses VALUES ('W1', 'Asia Distribution Centre');
INSERT INTO warehouses VALUES ('W2', 'UK Distribution Centre');
INSERT INTO warehouses VALUES ('W3', 'EMEA Distribution Centre');

INSERT INTO orders VALUES ('003', 'C100', TO_DATE('10-OCT-2013', 'DD-MON-YYYY'));
INSERT INTO orders VALUES ('004', 'C101', TO_DATE('03-DEC-2012', 'DD-MON-YYYY'));
INSERT INTO orders VALUES ('005', 'C100', TO_DATE('30-JUN-2013', 'DD-MON-YYYY'));
INSERT INTO orders VALUES ('006', NULL, TO_DATE('29-MAY-2013', 'DD-MON-YYYY'));
INSERT INTO orders VALUES ('007', 'C201', TO_DATE('10-APR-2013', 'DD-MON-YYYY'));
INSERT INTO orders VALUES ('008', 'C512', TO_DATE('30-SEP-2013', 'DD-MON-YYYY'));

INSERT INTO ordered_items VALUES ('003', 'B09', 10);
INSERT INTO ordered_items VALUES ('003', 'B02', 25);
INSERT INTO ordered_items VALUES ('004', 'B08', null);
INSERT INTO ordered_items VALUES ('004', 'B01', 10);
INSERT INTO ordered_items VALUES ('005', 'B03', 70);
INSERT INTO ordered_items VALUES ('005', 'B04', null);
INSERT INTO ordered_items VALUES ('005', 'B09', 20);
INSERT INTO ordered_items VALUES ('006', 'B07', 15);
INSERT INTO ordered_items VALUES ('006', 'B01', 2);
INSERT INTO ordered_items VALUES ('006', 'B04', 7);
INSERT INTO ordered_items VALUES ('007', 'B06', null);
INSERT INTO ordered_items VALUES ('007', 'B03', 10);

INSERT INTO stock VALUES ('W1', 'B01', null);
INSERT INTO stock VALUES ('W1', 'B09', 45);
INSERT INTO stock VALUES ('W2', 'B04', 5);
INSERT INTO stock VALUES ('W2', 'B07', 100);
INSERT INTO stock VALUES ('W2', 'B08', 120);
INSERT INTO stock VALUES ('W2', 'B09', null);
INSERT INTO stock VALUES ('W3', 'B01', 250);
INSERT INTO stock VALUES ('W3', 'B03', 5);
INSERT INTO stock VALUES ('W3', 'B09', 10);


rem	**********************************************************************
rem	*****************   Enable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE ordered_items ENABLE CONSTRAINT ordered_items_books_fk;
ALTER TABLE ordered_items ENABLE CONSTRAINT ordered_items_orders_fk;

ALTER TABLE stock ENABLE CONSTRAINT stock_warehouses_fk;
ALTER TABLE stock ENABLE CONSTRAINT stock_books_fk;


COMMIT;