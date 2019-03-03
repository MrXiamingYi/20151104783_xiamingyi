mysql -u root -p 
drop database xiaoyoulu;
CREATE DATABASE xiaoyoulu;
USE xiaoyoulu;
-- -----------------------------------------------------------------
alter table STUDENT     drop FOREIGN key F_KEY_STUDENT_1;

drop table STUDENT;
drop table ACCOUNT;
drop table SCHOOL;
drop table THE_CLASS;
drop table ROOT_US;
drop table SHENQING;
drop table US_W_CL;
drop table SC_W_CL;
drop table RO_W_CL_SC;
-- 账户
create table ACCOUNT
(
	HOLD_NO	      CHAR(6)   NOT NULL,   -- HOLD_NO 账户  
	PASSWORD      CHAR(6)   NOT NULL,	-- PASSWORD 密码
	constraint P_KEY_ACCOUNT_1 primary key (HOLD_NO)
);

-- 用户
create table STUDENT
(
	HOLD_NO	        CHAR(6)	  NOT NULL,		-- HOLD_NO 	账号
	STU_NO	        CHAR(12)  NOT NULL,		-- USR_NO 	学号 ID
	NAME            CHAR(8)	  NOT NULL,		-- NAME 	姓名
	SEC             CHAR(2)	  NOT NULL,		-- SEC		性别
	PHONE           CHAR(12)  ,		-- PHONE	电话
	HOME            CHAR(12)  ,		-- HOME		住址
	CONSTRAINT F_KEY_STUDENT_1 FOREIGN KEY (HOLD_NO ) REFERENCES ACCOUNT (HOLD_NO)
);

-- 学校
create table SCHOOL
(
   SCHOOL_ID    CHAR(6)     not null,  -- 学校 ID
   SHCOOL_NAME  CHAR(40)    not null,  -- 学校名称
   constraint P_KEY_SCHOOL primary key (SCHOOL_ID)
);

-- 班级
create table THE_CLASS
(
   CLASS_ID     	 CHAR(6)        not null,  -- 班级ID
   CLASS_NAME   	 CHAR(30)       not null,  -- 班级名称
   constraint P_KEY_THE_CLASS primary key (CLASS_ID)
);


-- 管理员
create table ROOT_US
(
   ROOT_ID          CHAR(6)     not null,  -- 管理员 ID
   ROOT_NAME        CHAR(8)     not null,  -- 管理员姓名
   ROOT_PASWD       CHAR(6)     not null,  -- 管理员密码
   PHONE            CHAR(12)    not null,  -- 电话
   constraint P_KEY_ROOT_US primary key (ROOT_ID)
);

-- 学校班关系
create table SC_W_CL
(
   SWC_NUNBER   CHAR(5)     not null,  -- 学校班关系序号
   SCHOOL_ID    CHAR(6)     not null,  -- 学校ID
   CLASS_ID     CHAR(6)     not null,  -- 班级ID
   constraint P_KEY_SCHOOL_1 primary key (SWC_NUNBER)
);

-- 用户和班
create table US_W_CL
(
   STU_NO       CHAR(12)     not null,  -- 用户ID
   SWC_NUNBER   CHAR(5)      not null,  -- 学校班关系序号
   constraint P_KEY_US_W_CL_1 primary key (STU_NO,SWC_NUNBER)
);

-- 管理员班级学校
create table RO_W_CL_SC
(
   ROOT_ID      CHAR(6)     not null,  -- 管理员 ID
   SWC_NUNBER   CHAR(5)     not null,  -- 学校班关系序号
   constraint RO_W_CL_SC primary key (ROOT_ID,SWC_NUNBER)
);

-- 申请表
create table SHENQING
(
   SHQNRING_ID      CHAR(3)      not null,  -- 申请编号
   ROOT_ID          CHAR(6)      not null,  -- 管理员 ID
   STU_NO           CHAR(12)     not null,  -- 申请人 ID
   FLAG             CHAR(1)      not null,  -- 是否同意，0不同意，1同意，2未处理
   constraint P_KEY_SHENQING_1 primary key (SHQNRING_ID)
);

-- #---------------------------------------------------------------------------------
-- 插入数据
-- #---------------------------------------------------------------------------------

-- 学校表数据
INSERT INTO SCHOOL (SCHOOL_ID, SHCOOL_NAME) VALUES("000001","内蒙古师范大学");
INSERT INTO SCHOOL (SCHOOL_ID, SHCOOL_NAME) VALUES("000002","上海财经大学");

-- root管理员数据
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000001","张师一","000001");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000002","张师二","000002");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000003","张师三","000003");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000004","李海一","000004");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000005","李海二","000005");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000006","李海三","000006");

-- 班级数据
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000001","2015美术教育");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000002","2016美术教育");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000003","2017美术教育");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000004","2015土木工程");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000005","2016土木工程");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000006","2017土木工程");

-- 账户数据
INSERT INTO ACCOUNT (HOLD_NO,PASSWORD) VALUES("000001","000001");
INSERT INTO ACCOUNT (HOLD_NO,PASSWORD) VALUES("000002","000002");

-- 用户数据
INSERT INTO STUDENT (HOLD_NO,STU_NO,NAME,SEC,PHONE,HOME) VALUES("000001","00000100001","王内","女","","");
INSERT INTO STUDENT (HOLD_NO,STU_NO,NAME,SEC,PHONE,HOME) VALUES("000002","00000200001","陈海","男","","");

-- 学校班关系
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("1","000001","000001");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("2","000001","000002");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("3","000001","000003");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("4","000002","000004");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("5","000002","000005");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("6","000002","000006");

-- 管理员班级学校
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000001","1");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000002","2");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000003","3");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000004","4");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000005","5");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000006","6");

--申请表

INSERT INTO SHENQING (SHQNRING_ID,ROOT_ID,STU_NO,FLAG) VALUES("001","000001","000002","2");
