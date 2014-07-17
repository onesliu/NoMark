/******************************************************************************/
/****                               Domains                                ****/
/******************************************************************************/

CREATE DOMAIN D_MONEY AS 
NUMERIC(18,2)
CHECK (VALUE > 0.00);



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR T_CANCEL_GEN;
CREATE GENERATOR T_CHECK_GEN;
CREATE GENERATOR T_CHECK_GOODS_GEN;
CREATE GENERATOR T_CONST_GEN;
CREATE GENERATOR T_GOOD_ATTRIB_GEN;
CREATE GENERATOR T_GOODATTRIB_RELATION_GEN;
CREATE GENERATOR T_GOODS_GEN;
CREATE GENERATOR T_GOODTYPE_GEN;
CREATE GENERATOR T_ORDER_GEN;
/******************************************************************************/
/****                              Exceptions                              ****/
/******************************************************************************/

/******************************************************************************/
/****                              Procedures                              ****/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/****                           Tables and Views                           ****/
/******************************************************************************/

CREATE TABLE T_CANCEL (
    IDX INTEGER NOT NULL,
    GOODID INTEGER NOT NULL,
    CANCELPRICE D_MONEY NOT NULL,
    CANCELCOUNT INTEGER DEFAULT 1,
    TOTALPRICE D_MONEY NOT NULL,
    CANCELTIME TIMESTAMP DEFAULT 'NOW');


CREATE TABLE T_CHECK (
    IDX INTEGER NOT NULL,
    DESP VARCHAR(255),
    CHECKDATE TIMESTAMP DEFAULT 'NOW');


CREATE TABLE T_CHECK_GOODS (
    IDX INTEGER NOT NULL,
    CHECKID INTEGER NOT NULL,
    GOODID INTEGER NOT NULL,
    STORAGECOUNT INTEGER NOT NULL,
    CHECKTIME TIMESTAMP DEFAULT 'NOW');


CREATE TABLE T_CONST (
    IDX INTEGER NOT NULL,
    INTVAL INTEGER,
    CHARVAL VARCHAR(255));


CREATE TABLE T_GOOD_ATTRIB (
    IDX INTEGER NOT NULL,
    ATTRIBCODE VARCHAR(6) NOT NULL,
    ATTRIBCODESTART INTEGER DEFAULT 5 NOT NULL,
    ATTRIBCODELENGTH INTEGER DEFAULT 2 NOT NULL,
    ATTRIBNAME VARCHAR(255),
    ATTRIBVALUE VARCHAR(255));


CREATE TABLE T_GOODATTRIB_RELATION (
    IDX INTEGER NOT NULL,
    GOODID INTEGER NOT NULL,
    ATTRIBID INTEGER NOT NULL);


CREATE TABLE T_GOODS (
    IDX INTEGER NOT NULL,
    TYPEID INTEGER NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    BUYID VARCHAR(255),
    GOODCODE VARCHAR(6) NOT NULL,
    BARCODE VARCHAR(13) NOT NULL,
    COST D_MONEY NOT NULL,
    GOODCOUNT INTEGER DEFAULT 1 NOT NULL,
    HIGHPRICE D_MONEY NOT NULL,
    LOWPRICE D_MONEY NOT NULL,
    FIXPRICE BOOLEAN DEFAULT false NOT NULL,
    STORAGEDATE TIMESTAMP DEFAULT 'NOW');


CREATE TABLE T_GOODTYPE (
    IDX INTEGER NOT NULL,
    PID INTEGER DEFAULT 0 NOT NULL,
    NAME VARCHAR(255) NOT NULL);


CREATE TABLE T_ORDER (
    IDX INTEGER NOT NULL,
    GOODID INTEGER NOT NULL,
    ORDERPRICE D_MONEY NOT NULL,
    ORDERCOUNT INTEGER DEFAULT 1,
    TOTALPRICE D_MONEY NOT NULL,
    ORDERTIME TIMESTAMP DEFAULT 'NOW');




/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/


ALTER TABLE T_CANCEL ADD CONSTRAINT PK_T_CANCEL PRIMARY KEY (IDX);
ALTER TABLE T_CHECK ADD CONSTRAINT PK_T_CHECK PRIMARY KEY (IDX);
ALTER TABLE T_CHECK_GOODS ADD CONSTRAINT PK_T_CHECK_GOODS PRIMARY KEY (IDX);
ALTER TABLE T_CONST ADD CONSTRAINT PK_T_CONST PRIMARY KEY (IDX);
ALTER TABLE T_GOOD_ATTRIB ADD CONSTRAINT PK_T_GOOD_ATTRIB PRIMARY KEY (IDX);
ALTER TABLE T_GOODATTRIB_RELATION ADD CONSTRAINT PK_T_GOODATTRIB_RELATION PRIMARY KEY (IDX);
ALTER TABLE T_GOODS ADD CONSTRAINT PK_T_GOODS PRIMARY KEY (IDX);
ALTER TABLE T_GOODTYPE ADD CONSTRAINT PK_T_GOODTYPE PRIMARY KEY (IDX);
ALTER TABLE T_ORDER ADD CONSTRAINT PK_T_ORDER PRIMARY KEY (IDX);

/******************************************************************************/
/****                          Unique constraints                          ****/
/******************************************************************************/


ALTER TABLE T_GOODATTRIB_RELATION ADD CONSTRAINT UK_RELATION UNIQUE (ATTRIBID, GOODID);

/******************************************************************************/
/****                             Foreign keys                             ****/
/******************************************************************************/


ALTER TABLE T_CANCEL ADD CONSTRAINT FK_T_CANCEL_GOODS FOREIGN KEY (GOODID) REFERENCES T_GOODS (IDX) ON DELETE SET DEFAULT ON UPDATE CASCADE;
ALTER TABLE T_CHECK_GOODS ADD CONSTRAINT FK_T_CHECK_CHECK FOREIGN KEY (CHECKID) REFERENCES T_CHECK (IDX) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE T_CHECK_GOODS ADD CONSTRAINT FK_T_CHECK_GOODS FOREIGN KEY (GOODID) REFERENCES T_GOODS (IDX);
ALTER TABLE T_GOODATTRIB_RELATION ADD CONSTRAINT FK_T_RELATION_ATTRIB FOREIGN KEY (GOODID) REFERENCES T_GOODS (IDX);
ALTER TABLE T_GOODATTRIB_RELATION ADD CONSTRAINT FK_T_GOODATTRIB_RELATION_2 FOREIGN KEY (ATTRIBID) REFERENCES T_GOOD_ATTRIB (IDX);
ALTER TABLE T_GOODS ADD CONSTRAINT FK_T_GOODS_GOODTYPE FOREIGN KEY (TYPEID) REFERENCES T_GOODTYPE (IDX);
ALTER TABLE T_ORDER ADD CONSTRAINT FK_T_ORDER_GOODS FOREIGN KEY (GOODID) REFERENCES T_GOODS (IDX) ON DELETE SET DEFAULT ON UPDATE CASCADE;

/******************************************************************************/
/****                          Check constraints                           ****/
/******************************************************************************/



/******************************************************************************/
/****                               Indices                                ****/
/******************************************************************************/


CREATE INDEX IDX_GOOD_TYPE_PID ON T_GOODTYPE (PID);

/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/

SET TERM ^ ;

CREATE TRIGGER T_CANCEL_AUTOID FOR T_CANCEL
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_cancel_gen, 1 );
end

^

CREATE TRIGGER T_CHECK_AUTOID FOR T_CHECK
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_check_gen, 1 );
end

^

CREATE TRIGGER T_CHECK_GOODS_AUTOID FOR T_CHECK_GOODS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_check_goods_gen, 1 );
end

^

CREATE TRIGGER T_CONST_AUTOID FOR T_CONST
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_const_gen, 1 );
end

^

CREATE TRIGGER T_GOOD_ATTRIB_AUTOID FOR T_GOOD_ATTRIB
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_good_attrib_gen, 1 );
end

^

CREATE TRIGGER T_GOODATTRIB_RELATION_AUTOID FOR T_GOODATTRIB_RELATION
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Trigger text */
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_goodattrib_relation_gen, 1 );
end

^

CREATE TRIGGER T_GOODS_AUTOID FOR T_GOODS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_goods_gen, 1 );
end

^

CREATE TRIGGER T_GOODTYPE_AUTOID FOR T_GOODTYPE
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_goodtype_gen, 1 );
end

^

CREATE TRIGGER T_ORDER_AUTOID FOR T_ORDER
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Auto increase index field: idx */
  if (new.idx is null) then
    new.idx = gen_id( t_order_gen, 1 );
end

^

SET TERM ; ^

/******************************************************************************/
/****                              Procedures                              ****/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/****                         Object descriptions                          ****/
/******************************************************************************/
