-- Generated by Oracle SQL Developer Data Modeler 19.1.0.081.0911 
--   at:        2019-06-12 08:55:44 CEST 
--   site:      SQL Server 2012 
--   type:      SQL Server 2012 


USE Project_Alumni

go

CREATE TABLE addresses 
  ( 
     addressid    INTEGER NOT NULL, 
     country      NVARCHAR (25), 
     state        NVARCHAR (25), 
     city         NVARCHAR (25), 
     street       NVARCHAR(25), 
     streetnumber VARCHAR (10) 
  ) 

go 

ALTER TABLE addresses 
  ADD CONSTRAINT addresses_pk PRIMARY KEY CLUSTERED (addressid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE courses 
  ( 
     courseid            INTEGER NOT NULL, 
     NAME                VARCHAR(25) NOT NULL, 
     addresses_addressid INTEGER NOT NULL 
  ) 

go 

ALTER TABLE courses 
  ADD CONSTRAINT courses_pk PRIMARY KEY CLUSTERED (courseid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE genders 
  ( 
     genderid INTEGER NOT NULL, 
     NAME     VARCHAR(25) NOT NULL 
  ) 

go 

ALTER TABLE genders 
  ADD CONSTRAINT genders_pk PRIMARY KEY CLUSTERED (genderid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE messages 
  ( 
     messageid     INTEGER NOT NULL, 
     text          NVARCHAR (max), 
     users_userid1 INTEGER NOT NULL, 
     users_userid  INTEGER NOT NULL, 
     date          DATETIME2 NOT NULL, 
     picture       VARBINARY 
  ) 

go 

ALTER TABLE messages 
  ADD CONSTRAINT messages_pk PRIMARY KEY CLUSTERED (messageid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE news 
  ( 
     newsid       INTEGER NOT NULL, 
     title        NVARCHAR (50) NOT NULL, 
     text         NVARCHAR (max) NOT NULL, 
     users_userid INTEGER NOT NULL, 
     date         DATETIME2 NOT NULL 
  ) 

go 

ALTER TABLE news 
  ADD CONSTRAINT news_pk PRIMARY KEY CLUSTERED (newsid) WITH ( allow_page_locks 
  = on, allow_row_locks = on ) 

go 

CREATE TABLE pictures 
  ( 
     news_newsid INTEGER NOT NULL, 
     pictureid   INTEGER NOT NULL, 
     picture     VARBINARY NOT NULL 
  ) 

go 

ALTER TABLE pictures 
  ADD CONSTRAINT pictures_pk PRIMARY KEY CLUSTERED (pictureid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE posts 
  ( 
     postid       INTEGER NOT NULL, 
     title        NVARCHAR (50) NOT NULL, 
     text         NVARCHAR (max) NOT NULL, 
     users_userid INTEGER NOT NULL, 
     date         DATETIME2 NOT NULL 
  ) 

go 

ALTER TABLE posts 
  ADD CONSTRAINT posts_pk PRIMARY KEY CLUSTERED (postid) WITH ( allow_page_locks 
  = on, allow_row_locks = on ) 

go 

CREATE TABLE replies 
  ( 
     repliesid    INTEGER NOT NULL, 
     text         NVARCHAR (max) NOT NULL, 
     date         DATETIME2 NOT NULL, 
     posts_postid INTEGER NOT NULL 
  ) 

go 

ALTER TABLE replies 
  ADD CONSTRAINT replies_pk PRIMARY KEY CLUSTERED (repliesid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE reports 
  ( 
     vacancies_vacancyid INTEGER NOT NULL, 
     posts_postid        INTEGER NOT NULL, 
     reportid            INTEGER NOT NULL, 
     text                NVARCHAR (max) NOT NULL, 
     date                DATETIME2 NOT NULL 
  ) 

go 

ALTER TABLE reports 
  ADD CONSTRAINT reports_pk PRIMARY KEY CLUSTERED (reportid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE roles 
  ( 
     roleid INTEGER NOT NULL, 
     NAME   VARCHAR(25) NOT NULL 
  ) 

go 

ALTER TABLE roles 
  ADD CONSTRAINT roles_pk PRIMARY KEY CLUSTERED (roleid) WITH ( allow_page_locks 
  = on, allow_row_locks = on ) 

go 

CREATE TABLE tags 
  ( 
     tagid INTEGER NOT NULL, 
     NAME  VARCHAR(25) NOT NULL 
  ) 

go 

ALTER TABLE tags 
  ADD CONSTRAINT tags_pk PRIMARY KEY CLUSTERED (tagid) WITH ( allow_page_locks = 
  on, allow_row_locks = on ) 

go 

CREATE TABLE usercourses 
  ( 
     graduationyear   CHAR(4), 
     courses_courseid INTEGER NOT NULL, 
     users_userid     INTEGER NOT NULL 
  ) 

go 

CREATE TABLE userroles 
  ( 
     users_userid INTEGER NOT NULL, 
     roles_roleid INTEGER NOT NULL 
  ) 

go 

ALTER TABLE userroles 
  ADD CONSTRAINT relation_30_pk PRIMARY KEY CLUSTERED (users_userid, 
  roles_roleid) WITH ( allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE users 
  ( 
     userid              INTEGER NOT NULL, 
     NAME                NVARCHAR (25) NOT NULL, 
     password            NVARCHAR (50) NOT NULL, 
     email               NVARCHAR (25) NOT NULL, 
     phonenumber         VARCHAR (25), 
     description         NVARCHAR(max), 
     addresses_addressid INTEGER, 
     dateofbirth         DATE, 
     profilepicture      VARBINARY, 
     genders_genderid    INTEGER 
  ) 

go 

ALTER TABLE users 
  ADD CONSTRAINT users_pk PRIMARY KEY CLUSTERED (userid) WITH ( allow_page_locks 
  = on, allow_row_locks = on ) 

go 

CREATE TABLE usertags 
  ( 
     users_userid INTEGER NOT NULL, 
     tags_tagid   INTEGER NOT NULL 
  ) 

go 

ALTER TABLE usertags 
  ADD CONSTRAINT relation_28_pk PRIMARY KEY CLUSTERED (users_userid, tags_tagid) 
  WITH ( allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE vacancies 
  ( 
     vacancyid    INTEGER NOT NULL, 
     title        NVARCHAR (50) NOT NULL, 
     text         NVARCHAR (max) NOT NULL, 
     users_userid INTEGER NOT NULL, 
     date         DATETIME2 NOT NULL 
  ) 

go 

ALTER TABLE vacancies 
  ADD CONSTRAINT vacancies_pk PRIMARY KEY CLUSTERED (vacancyid) WITH ( 
  allow_page_locks = on, allow_row_locks = on ) 

go 

CREATE TABLE vacancytags 
  ( 
     vacancies_vacancyid INTEGER NOT NULL, 
     tags_tagid          INTEGER NOT NULL 
  ) 

go 

ALTER TABLE vacancytags 
  ADD CONSTRAINT relation_29_pk PRIMARY KEY CLUSTERED (vacancies_vacancyid, 
  tags_tagid) WITH ( allow_page_locks = on, allow_row_locks = on ) 

go 

ALTER TABLE courses 
  ADD CONSTRAINT courses_addresses_fk FOREIGN KEY ( addresses_addressid ) 
  REFERENCES addresses ( addressid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE messages 
  ADD CONSTRAINT messages_users_fk FOREIGN KEY ( users_userid ) REFERENCES users 
  ( userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE messages 
  ADD CONSTRAINT messages_users_fkv2 FOREIGN KEY ( users_userid1 ) REFERENCES 
  users ( userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE news 
  ADD CONSTRAINT news_users_fk FOREIGN KEY ( users_userid ) REFERENCES users ( 
  userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE pictures 
  ADD CONSTRAINT pictures_news_fk FOREIGN KEY ( news_newsid ) REFERENCES news ( 
  newsid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE posts 
  ADD CONSTRAINT posts_users_fk FOREIGN KEY ( users_userid ) REFERENCES users ( 
  userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE usertags 
  ADD CONSTRAINT relation_28_tags_fk FOREIGN KEY ( tags_tagid ) REFERENCES tags 
  ( tagid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE usertags 
  ADD CONSTRAINT relation_28_users_fk FOREIGN KEY ( users_userid ) REFERENCES 
  users ( userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE vacancytags 
  ADD CONSTRAINT relation_29_tags_fk FOREIGN KEY ( tags_tagid ) REFERENCES tags 
  ( tagid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE vacancytags 
  ADD CONSTRAINT relation_29_vacancies_fk FOREIGN KEY ( vacancies_vacancyid ) 
  REFERENCES vacancies ( vacancyid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE userroles 
  ADD CONSTRAINT relation_30_roles_fk FOREIGN KEY ( roles_roleid ) REFERENCES 
  roles ( roleid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE userroles 
  ADD CONSTRAINT relation_30_users_fk FOREIGN KEY ( users_userid ) REFERENCES 
  users ( userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE replies 
  ADD CONSTRAINT replies_posts_fk FOREIGN KEY ( posts_postid ) REFERENCES posts 
  ( postid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE reports 
  ADD CONSTRAINT reports_posts_fk FOREIGN KEY ( posts_postid ) REFERENCES posts 
  ( postid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE reports 
  ADD CONSTRAINT reports_vacancies_fk FOREIGN KEY ( vacancies_vacancyid ) 
  REFERENCES vacancies ( vacancyid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE usercourses 
  ADD CONSTRAINT usercourses_courses_fk FOREIGN KEY ( courses_courseid ) 
  REFERENCES courses ( courseid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE usercourses 
  ADD CONSTRAINT usercourses_users_fk FOREIGN KEY ( users_userid ) REFERENCES 
  users ( userid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE users 
  ADD CONSTRAINT users_addresses_fk FOREIGN KEY ( addresses_addressid ) 
  REFERENCES addresses ( addressid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE users 
  ADD CONSTRAINT users_genders_fk FOREIGN KEY ( genders_genderid ) REFERENCES 
  genders ( genderid ) ON DELETE no action ON UPDATE no action 

go 

ALTER TABLE vacancies 
  ADD CONSTRAINT vacancies_users_fk FOREIGN KEY ( users_userid ) REFERENCES 
  users ( userid ) ON DELETE no action ON UPDATE no action 

go 
-- Oracle SQL Developer Data Modeler Summary Report:  
--  
-- CREATE TABLE                            17 
-- CREATE INDEX                             0 
-- ALTER TABLE                             36 
-- CREATE VIEW                              0 
-- ALTER VIEW                               0 
-- CREATE PACKAGE                           0 
-- CREATE PACKAGE BODY                      0 
-- CREATE PROCEDURE                         0 
-- CREATE FUNCTION                          0 
-- CREATE TRIGGER                           0 
-- ALTER TRIGGER                            0 
-- CREATE DATABASE                          0 
-- CREATE DEFAULT                           0 
-- CREATE INDEX ON VIEW                     0 
-- CREATE ROLLBACK SEGMENT                  0 
-- CREATE ROLE                              0 
-- CREATE RULE                              0 
-- CREATE SCHEMA                            0 
-- CREATE SEQUENCE                          0 
-- CREATE PARTITION FUNCTION                0 
-- CREATE PARTITION SCHEME                  0 
--  
-- DROP DATABASE                            0 
--  
-- ERRORS                                   0 
-- WARNINGS                                 0 