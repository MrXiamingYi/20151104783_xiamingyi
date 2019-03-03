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
-- �˻�
create table ACCOUNT
(
	HOLD_NO	      CHAR(6)   NOT NULL,   -- HOLD_NO �˻�  
	PASSWORD      CHAR(6)   NOT NULL,	-- PASSWORD ����
	constraint P_KEY_ACCOUNT_1 primary key (HOLD_NO)
);

-- �û�
create table STUDENT
(
	HOLD_NO	        CHAR(6)	  NOT NULL,		-- HOLD_NO 	�˺�
	STU_NO	        CHAR(12)  NOT NULL,		-- USR_NO 	ѧ�� ID
	NAME            CHAR(8)	  NOT NULL,		-- NAME 	����
	SEC             CHAR(2)	  NOT NULL,		-- SEC		�Ա�
	PHONE           CHAR(12)  ,		-- PHONE	�绰
	HOME            CHAR(12)  ,		-- HOME		סַ
	CONSTRAINT F_KEY_STUDENT_1 FOREIGN KEY (HOLD_NO ) REFERENCES ACCOUNT (HOLD_NO)
);

-- ѧУ
create table SCHOOL
(
   SCHOOL_ID    CHAR(6)     not null,  -- ѧУ ID
   SHCOOL_NAME  CHAR(40)    not null,  -- ѧУ����
   constraint P_KEY_SCHOOL primary key (SCHOOL_ID)
);

-- �༶
create table THE_CLASS
(
   CLASS_ID     	 CHAR(6)        not null,  -- �༶ID
   CLASS_NAME   	 CHAR(30)       not null,  -- �༶����
   constraint P_KEY_THE_CLASS primary key (CLASS_ID)
);


-- ����Ա
create table ROOT_US
(
   ROOT_ID          CHAR(6)     not null,  -- ����Ա ID
   ROOT_NAME        CHAR(8)     not null,  -- ����Ա����
   ROOT_PASWD       CHAR(6)     not null,  -- ����Ա����
   PHONE            CHAR(12)    not null,  -- �绰
   constraint P_KEY_ROOT_US primary key (ROOT_ID)
);

-- ѧУ���ϵ
create table SC_W_CL
(
   SWC_NUNBER   CHAR(5)     not null,  -- ѧУ���ϵ���
   SCHOOL_ID    CHAR(6)     not null,  -- ѧУID
   CLASS_ID     CHAR(6)     not null,  -- �༶ID
   constraint P_KEY_SCHOOL_1 primary key (SWC_NUNBER)
);

-- �û��Ͱ�
create table US_W_CL
(
   STU_NO       CHAR(12)     not null,  -- �û�ID
   SWC_NUNBER   CHAR(5)      not null,  -- ѧУ���ϵ���
   constraint P_KEY_US_W_CL_1 primary key (STU_NO,SWC_NUNBER)
);

-- ����Ա�༶ѧУ
create table RO_W_CL_SC
(
   ROOT_ID      CHAR(6)     not null,  -- ����Ա ID
   SWC_NUNBER   CHAR(5)     not null,  -- ѧУ���ϵ���
   constraint RO_W_CL_SC primary key (ROOT_ID,SWC_NUNBER)
);

-- �����
create table SHENQING
(
   SHQNRING_ID      CHAR(3)      not null,  -- ������
   ROOT_ID          CHAR(6)      not null,  -- ����Ա ID
   STU_NO           CHAR(12)     not null,  -- ������ ID
   FLAG             CHAR(1)      not null,  -- �Ƿ�ͬ�⣬0��ͬ�⣬1ͬ�⣬2δ����
   constraint P_KEY_SHENQING_1 primary key (SHQNRING_ID)
);

-- #---------------------------------------------------------------------------------
-- ��������
-- #---------------------------------------------------------------------------------

-- ѧУ������
INSERT INTO SCHOOL (SCHOOL_ID, SHCOOL_NAME) VALUES("000001","���ɹ�ʦ����ѧ");
INSERT INTO SCHOOL (SCHOOL_ID, SHCOOL_NAME) VALUES("000002","�Ϻ��ƾ���ѧ");

-- root����Ա����
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000001","��ʦһ","000001");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000002","��ʦ��","000002");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000003","��ʦ��","000003");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000004","�һ","000004");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000005","���","000005");
INSERT INTO ROOT_US (ROOT_ID, ROOT_NAME,ROOT_PASWD) VALUES("000006","���","000006");

-- �༶����
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000001","2015��������");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000002","2016��������");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000003","2017��������");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000004","2015��ľ����");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000005","2016��ľ����");
INSERT INTO THE_CLASS (CLASS_ID,CLASS_NAME) VALUES("000006","2017��ľ����");

-- �˻�����
INSERT INTO ACCOUNT (HOLD_NO,PASSWORD) VALUES("000001","000001");
INSERT INTO ACCOUNT (HOLD_NO,PASSWORD) VALUES("000002","000002");

-- �û�����
INSERT INTO STUDENT (HOLD_NO,STU_NO,NAME,SEC,PHONE,HOME) VALUES("000001","00000100001","����","Ů","","");
INSERT INTO STUDENT (HOLD_NO,STU_NO,NAME,SEC,PHONE,HOME) VALUES("000002","00000200001","�º�","��","","");

-- ѧУ���ϵ
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("1","000001","000001");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("2","000001","000002");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("3","000001","000003");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("4","000002","000004");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("5","000002","000005");
INSERT INTO SC_W_CL (SWC_NUNBER,SCHOOL_ID,CLASS_ID) VALUES("6","000002","000006");

-- ����Ա�༶ѧУ
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000001","1");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000002","2");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000003","3");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000004","4");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000005","5");
INSERT INTO RO_W_CL_SC (ROOT_ID,SWC_NUNBER) VALUES("000006","6");

--�����

INSERT INTO SHENQING (SHQNRING_ID,ROOT_ID,STU_NO,FLAG) VALUES("001","000001","000002","2");
