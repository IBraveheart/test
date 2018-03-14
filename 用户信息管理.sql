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
   角色编号                 int                  not null,
   角色名称                 varchar(50)          not null,
   备注                   varchar(60)          not null,
   constraint PK_ROLER primary key nonclustered (角色编号)
)
go

/*==============================================================*/
/* Table: Roler&&functions                                      */
/*==============================================================*/
create table Roler&&functions (
   功能编号                 int                  not null,
   角色编号                 int                  not null,
   constraint PK_ROLER&&FUNCTIONS primary key nonclustered (功能编号, 角色编号)
)
go

/*==============================================================*/
/* Index: Roler&&functions2_FK                                  */
/*==============================================================*/
create index Roler&&functions2_FK on Roler&&functions (
角色编号 ASC
)
go

/*==============================================================*/
/* Index: Roler&&functions_FK                                   */
/*==============================================================*/
create index Roler&&functions_FK on Roler&&functions (
功能编号 ASC
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   用户编号                 int                  not null,
   用户名                  varchar(20)          not null,
   密码                   varchar(20)          not null,
   性别                   varchar(10)          not null,
   出生日期                 datetime             not null,
   手机号                  varchar(20)          not null,
   电子邮箱                 varchar(50)          not null,
   地址                   varchar(50)          not null,
   身份证                  varchar(18)          not null,
   constraint PK_USER primary key nonclustered (用户编号)
)
go

/*==============================================================*/
/* Table: User&&Roler                                           */
/*==============================================================*/
create table User&&Roler (
   角色编号                 int                  not null,
   用户编号                 int                  not null,
   constraint PK_USER&&ROLER primary key nonclustered (角色编号, 用户编号)
)
go

/*==============================================================*/
/* Index: User&&Roler2_FK                                       */
/*==============================================================*/
create index User&&Roler2_FK on User&&Roler (
用户编号 ASC
)
go

/*==============================================================*/
/* Index: User&&Roler_FK                                        */
/*==============================================================*/
create index User&&Roler_FK on User&&Roler (
角色编号 ASC
)
go

/*==============================================================*/
/* Table: User&&functions                                       */
/*==============================================================*/
create table User&&functions (
   功能编号                 int                  not null,
   用户编号                 int                  not null,
   constraint PK_USER&&FUNCTIONS primary key nonclustered (功能编号, 用户编号)
)
go

/*==============================================================*/
/* Index: User&&functions2_FK                                   */
/*==============================================================*/
create index User&&functions2_FK on User&&functions (
用户编号 ASC
)
go

/*==============================================================*/
/* Index: User&&functions_FK                                    */
/*==============================================================*/
create index User&&functions_FK on User&&functions (
功能编号 ASC
)
go

/*==============================================================*/
/* Table: "function"                                            */
/*==============================================================*/
create table "function" (
   功能编号                 int                  not null,
   功能名称                 varchar(20)          not null,
   网址                   varchar(50)          not null,
   备注                   varchar(60)          not null,
   constraint PK_FUNCTION primary key nonclustered (功能编号)
)
go

alter table Roler&&functions
   add constraint FK_ROLER&&F_ROLER&&FU_FUNCTION foreign key (功能编号)
      references "function" (功能编号)
go

alter table Roler&&functions
   add constraint FK_ROLER&&F_ROLER&&FU_ROLER foreign key (角色编号)
      references Roler (角色编号)
go

alter table User&&Roler
   add constraint FK_USER&&RO_USER&&ROL_ROLER foreign key (角色编号)
      references Roler (角色编号)
go

alter table User&&Roler
   add constraint FK_USER&&RO_USER&&ROL_USER foreign key (用户编号)
      references "User" (用户编号)
go

alter table User&&functions
   add constraint FK_USER&&FU_USER&&FUN_FUNCTION foreign key (功能编号)
      references "function" (功能编号)
go

alter table User&&functions
   add constraint FK_USER&&FU_USER&&FUN_USER foreign key (用户编号)
      references "User" (用户编号)
go

