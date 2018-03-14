/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018/3/9 10:56:48                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Roler&&functions') and o.name = 'FK_ROLER&&F_ROLER&&FU_FUNCTION')
alter table Roler&&functions
   drop constraint FK_ROLER&&F_ROLER&&FU_FUNCTION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Roler&&functions') and o.name = 'FK_ROLER&&F_ROLER&&FU_ROLER')
alter table Roler&&functions
   drop constraint FK_ROLER&&F_ROLER&&FU_ROLER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('User&&Roler') and o.name = 'FK_USER&&RO_USER&&ROL_ROLER')
alter table User&&Roler
   drop constraint FK_USER&&RO_USER&&ROL_ROLER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('User&&Roler') and o.name = 'FK_USER&&RO_USER&&ROL_USER')
alter table User&&Roler
   drop constraint FK_USER&&RO_USER&&ROL_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('User&&functions') and o.name = 'FK_USER&&FU_USER&&FUN_FUNCTION')
alter table User&&functions
   drop constraint FK_USER&&FU_USER&&FUN_FUNCTION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('User&&functions') and o.name = 'FK_USER&&FU_USER&&FUN_USER')
alter table User&&functions
   drop constraint FK_USER&&FU_USER&&FUN_USER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Roler')
            and   type = 'U')
   drop table Roler
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Roler&&functions')
            and   name  = 'Roler&&functions_FK'
            and   indid > 0
            and   indid < 255)
   drop index Roler&&functions.Roler&&functions_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Roler&&functions')
            and   name  = 'Roler&&functions2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Roler&&functions.Roler&&functions2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Roler&&functions')
            and   type = 'U')
   drop table Roler&&functions
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('User&&Roler')
            and   name  = 'User&&Roler_FK'
            and   indid > 0
            and   indid < 255)
   drop index User&&Roler.User&&Roler_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('User&&Roler')
            and   name  = 'User&&Roler2_FK'
            and   indid > 0
            and   indid < 255)
   drop index User&&Roler.User&&Roler2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('User&&Roler')
            and   type = 'U')
   drop table User&&Roler
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('User&&functions')
            and   name  = 'User&&functions_FK'
            and   indid > 0
            and   indid < 255)
   drop index User&&functions.User&&functions_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('User&&functions')
            and   name  = 'User&&functions2_FK'
            and   indid > 0
            and   indid < 255)
   drop index User&&functions.User&&functions2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('User&&functions')
            and   type = 'U')
   drop table User&&functions
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"function"')
            and   type = 'U')
   drop table "function"
go

/*==============================================================*/
/* Table: Roler                                                 */
/*==============================================================*/
create table Roler (
   ��ɫ���                 int                  not null,
   ��ɫ����                 varchar(50)          not null,
   ��ע                   varchar(60)          not null,
   constraint PK_ROLER primary key nonclustered (��ɫ���)
)
go

/*==============================================================*/
/* Table: Roler&&functions                                      */
/*==============================================================*/
create table Roler&&functions (
   ���ܱ��                 int                  not null,
   ��ɫ���                 int                  not null,
   constraint PK_ROLER&&FUNCTIONS primary key nonclustered (���ܱ��, ��ɫ���)
)
go

/*==============================================================*/
/* Index: Roler&&functions2_FK                                  */
/*==============================================================*/
create index Roler&&functions2_FK on Roler&&functions (
��ɫ��� ASC
)
go

/*==============================================================*/
/* Index: Roler&&functions_FK                                   */
/*==============================================================*/
create index Roler&&functions_FK on Roler&&functions (
���ܱ�� ASC
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   �û����                 int                  not null,
   �û���                  varchar(20)          not null,
   ����                   varchar(20)          not null,
   �Ա�                   varchar(10)          not null,
   ��������                 datetime             not null,
   �ֻ���                  varchar(20)          not null,
   ��������                 varchar(50)          not null,
   ��ַ                   varchar(50)          not null,
   ���֤                  varchar(18)          not null,
   constraint PK_USER primary key nonclustered (�û����)
)
go

/*==============================================================*/
/* Table: User&&Roler                                           */
/*==============================================================*/
create table User&&Roler (
   ��ɫ���                 int                  not null,
   �û����                 int                  not null,
   constraint PK_USER&&ROLER primary key nonclustered (��ɫ���, �û����)
)
go

/*==============================================================*/
/* Index: User&&Roler2_FK                                       */
/*==============================================================*/
create index User&&Roler2_FK on User&&Roler (
�û���� ASC
)
go

/*==============================================================*/
/* Index: User&&Roler_FK                                        */
/*==============================================================*/
create index User&&Roler_FK on User&&Roler (
��ɫ��� ASC
)
go

/*==============================================================*/
/* Table: User&&functions                                       */
/*==============================================================*/
create table User&&functions (
   ���ܱ��                 int                  not null,
   �û����                 int                  not null,
   constraint PK_USER&&FUNCTIONS primary key nonclustered (���ܱ��, �û����)
)
go

/*==============================================================*/
/* Index: User&&functions2_FK                                   */
/*==============================================================*/
create index User&&functions2_FK on User&&functions (
�û���� ASC
)
go

/*==============================================================*/
/* Index: User&&functions_FK                                    */
/*==============================================================*/
create index User&&functions_FK on User&&functions (
���ܱ�� ASC
)
go

/*==============================================================*/
/* Table: "function"                                            */
/*==============================================================*/
create table "function" (
   ���ܱ��                 int                  not null,
   ��������                 varchar(20)          not null,
   ��ַ                   varchar(50)          not null,
   ��ע                   varchar(60)          not null,
   constraint PK_FUNCTION primary key nonclustered (���ܱ��)
)
go

alter table Roler&&functions
   add constraint FK_ROLER&&F_ROLER&&FU_FUNCTION foreign key (���ܱ��)
      references "function" (���ܱ��)
go

alter table Roler&&functions
   add constraint FK_ROLER&&F_ROLER&&FU_ROLER foreign key (��ɫ���)
      references Roler (��ɫ���)
go

alter table User&&Roler
   add constraint FK_USER&&RO_USER&&ROL_ROLER foreign key (��ɫ���)
      references Roler (��ɫ���)
go

alter table User&&Roler
   add constraint FK_USER&&RO_USER&&ROL_USER foreign key (�û����)
      references "User" (�û����)
go

alter table User&&functions
   add constraint FK_USER&&FU_USER&&FUN_FUNCTION foreign key (���ܱ��)
      references "function" (���ܱ��)
go

alter table User&&functions
   add constraint FK_USER&&FU_USER&&FUN_USER foreign key (�û����)
      references "User" (�û����)
go

