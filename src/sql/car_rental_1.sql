/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/18 11:56:06                           */
/*==============================================================*/


drop table if exists cars;

drop table if exists checktable;

drop table if exists funs;

drop table if exists loginlogs;

drop table if exists logs;

drop table if exists menus;

drop table if exists renttable;

drop table if exists roles;

drop table if exists roles_menus;

drop table if exists t_customers;

drop table if exists users;

/*==============================================================*/
/* Table: cars                                                  */
/*==============================================================*/
create table cars
(
   carnumber            varchar(50) not null,
   cartype              varchar(50) not null,
   color                varchar(50) not null,
   price                Integer not null,
   rentprice            Integer not null,
   deposit              Integer not null,
   isrenting            varchar(50) not null,
   description          varchar(100),
   primary key (carnumber)
);

/*==============================================================*/
/* Table: checktable                                            */
/*==============================================================*/
create table checktable
(
   checkid              varchar(50) not null,
   checkdate            date not null,
   field                varchar(50),
   problem              varchar(100),
   paying               Integer,
   checkuser            varchar(50) not null,
   rentid               varchar(50) not null,
   primary key (checkid)
);

/*==============================================================*/
/* Table: funs                                                  */
/*==============================================================*/
create table funs
(
   funid                Integer not null,
   name                 varchar(50) not null,
   uri                  varchar(100) not null,
   menus_id             Integer not null,
   primary key (funid)
);

/*==============================================================*/
/* Table: loginlogs                                             */
/*==============================================================*/
create table loginlogs
(
   loginlogid           Integer not null auto_increment,
   loginname            varchar(50) not null,
   loginip              varchar(50) not null,
   logintime            date not null,
   primary key (loginlogid)
);

/*==============================================================*/
/* Table: logs                                                  */
/*==============================================================*/
create table logs
(
   id                   Integer not null auto_increment,
   username             varchar(50) not null,
   action               varchar(50) not null,
   actiontime           date not null,
   primary key (id)
);

/*==============================================================*/
/* Table: menus                                                 */
/*==============================================================*/
create table menus
(
   menuid               Integer not null,
   name                 varchar(50) not null,
   uri                  varchar(100) not null,
   fartherid            Integer not null,
   primary key (menuid)
);

/*==============================================================*/
/* Table: renttable                                             */
/*==============================================================*/
create table renttable
(
   tableid              varchar(50) not null,
   imprest              Integer not null,
   shouldpayprice       Integer not null,
   price                Integer not null,
   begindate            date not null,
   shouldreturndate     date not null,
   returndate           date,
   rentflag             Integer not null,
   custid               varchar(50) not null,
   carid                varchar(50) not null,
   username             varchar(50) not null,
   primary key (tableid)
);

/*==============================================================*/
/* Table: roles                                                 */
/*==============================================================*/
create table roles
(
   roleid               Integer not null auto_increment,
   rolename             varchar(50) not null,
   primary key (roleid)
);

/*==============================================================*/
/* Table: roles_menus                                           */
/*==============================================================*/
create table roles_menus
(
   roleid               Integer not null,
   menuid               Integer not null,
   primary key (roleid, menuid)
);

/*==============================================================*/
/* Table: t_customers                                           */
/*==============================================================*/
create table t_customers
(
   identity             varchar(50) not null,
   custname             varchar(50) not null,
   sex                  varchar(50) not null,
   address              varchar(100) not null,
   phone                varchar(50) not null,
   career               varchar(50) not null,
   custpwd              varchar(50) not null,
   primary key (identity)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   username             varchar(50) not null,
   identity             varchar(50) not null,
   fullname             varchar(50) not null,
   sex                  varchar(50) not null,
   address              varchar(100) not null,
   phone                varchar(50) not null,
   roleid               Integer not null,
   userpwd              varchar(50) not null,
   position             varchar(50) not null,
   primary key (username)
);

alter table checktable add constraint FK_check_rent foreign key (rentid)
      references renttable (tableid) on delete restrict on update restrict;

alter table checktable add constraint FK_check_user foreign key (checkuser)
      references users (username) on delete restrict on update restrict;

alter table funs add constraint FK_fun_menu foreign key (menus_id)
      references menus (menuid) on delete restrict on update restrict;

alter table renttable add constraint FK_rent_car foreign key (carid)
      references cars (carnumber) on delete restrict on update restrict;

alter table renttable add constraint FK_rent_customer foreign key (custid)
      references t_customers (identity) on delete restrict on update restrict;

alter table renttable add constraint FK_rent_user foreign key (username)
      references users (username) on delete restrict on update restrict;

alter table roles_menus add constraint FK_rolemenus_menu foreign key (menuid)
      references menus (menuid) on delete restrict on update restrict;

alter table roles_menus add constraint FK_rolemenus_role foreign key (roleid)
      references roles (roleid) on delete restrict on update restrict;

