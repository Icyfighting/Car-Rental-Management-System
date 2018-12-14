
set feedback off
set define off
prompt Dropping CARS...
drop table CARS cascade constraints;
prompt Dropping ROLES...
drop table ROLES cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping CUSTOMERS...
drop table CUSTOMERS cascade constraints;
prompt Dropping RENTTABLE...
drop table RENTTABLE cascade constraints;
prompt Dropping CHECKTABLE...
drop table CHECKTABLE cascade constraints;
prompt Dropping MENUS...
drop table MENUS cascade constraints;
prompt Dropping FUNS...
drop table FUNS cascade constraints;
prompt Dropping LOGINLOGS...
drop table LOGINLOGS cascade constraints;
prompt Dropping LOGS...
drop table LOGS cascade constraints;
prompt Dropping ROLES_MENUS...
drop table ROLES_MENUS cascade constraints;
prompt Creating CARS...
create table CARS
(
  carnumber VARCHAR2(20) not null,
  cartype   VARCHAR2(50) not null,
  color     VARCHAR2(10) not null,
  price     NUMBER(10,2) not null,
  rentprice NUMBER(10,2) not null,
  deposit   NUMBER(10,2) not null,
  isrenting VARCHAR2(20) not null,
  cardesc   VARCHAR2(500),
  carimg    VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARS
  add constraint CARS_PK primary key (CARNUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES...
create table ROLES
(
  roleid   NUMBER not null,
  rolename VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES
  add constraint ROLES_PK primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  username  VARCHAR2(40) not null,
  identity  VARCHAR2(20) not null,
  fullname  VARCHAR2(20) not null,
  sex       VARCHAR2(10) not null,
  address   VARCHAR2(40) not null,
  phone     VARCHAR2(20) not null,
  position  VARCHAR2(20) not null,
  userlevel NUMBER not null,
  userpwd   VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_PK primary key (USERNAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_UK unique (IDENTITY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_FK foreign key (USERLEVEL)
  references ROLES (ROLEID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  identity VARCHAR2(20) not null,
  custname VARCHAR2(40) not null,
  sex      VARCHAR2(10) not null,
  address  VARCHAR2(100) not null,
  phone    VARCHAR2(20) not null,
  career   VARCHAR2(20) not null,
  custpwd  VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add constraint CUSTOMERS_PK primary key (IDENTITY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating RENTTABLE...
create table RENTTABLE
(
  tableid          NUMBER not null,
  imprest          NUMBER(10,2) not null,
  shouldpayprice   NUMBER(10,2) not null,
  price            NUMBER(10,2) not null,
  begindate        DATE not null,
  shouldreturndate DATE not null,
  returndate       DATE,
  rentflag         NUMBER not null,
  custid           VARCHAR2(20) not null,
  carid            VARCHAR2(20) not null,
  userid           VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_PK primary key (TABLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_CUSTIONERS_FK3 foreign key (USERID)
  references USERS (USERNAME);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTOMERS_FK1 foreign key (CUSTID)
  references CUSTOMERS (IDENTITY);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTONERS_FK2 foreign key (CARID)
  references CARS (CARNUMBER);

prompt Creating CHECKTABLE...
create table CHECKTABLE
(
  checkid     NUMBER not null,
  checkdate   DATE not null,
  field       VARCHAR2(100),
  problem     VARCHAR2(100),
  paying      NUMBER(10,2),
  checkuserid VARCHAR2(40) not null,
  rentid      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_PK primary key (CHECKID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_RENTTABLE_FK2 foreign key (RENTID)
  references RENTTABLE (TABLEID);
alter table CHECKTABLE
  add constraint CHECKTABLE_USERS_FK1 foreign key (CHECKUSERID)
  references USERS (USERNAME);

prompt Creating MENUS...
create table MENUS
(
  menuid   NUMBER not null,
  menuname VARCHAR2(40) not null,
  connurl  VARCHAR2(80),
  fatherid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MENUS
  add constraint MENUS_PK primary key (MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating FUNS...
create table FUNS
(
  funid   NUMBER not null,
  funname VARCHAR2(40) not null,
  funurl  VARCHAR2(80) not null,
  menuid  NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_PK primary key (FUNID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_FK foreign key (MENUID)
  references MENUS (MENUID);

prompt Creating LOGINLOGS...
create table LOGINLOGS
(
  loginlogid NUMBER not null,
  loginname  VARCHAR2(80),
  loginip    VARCHAR2(40),
  logintime  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOGINLOGS
  add constraint LOGINLOGS_PK primary key (LOGINLOGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating LOGS...
create table LOGS
(
  id         NUMBER not null,
  username   VARCHAR2(40) not null,
  action     VARCHAR2(40) not null,
  actiontime DATE not null,
  flag       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES_MENUS...
create table ROLES_MENUS
(
  roleid NUMBER not null,
  menuid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_PK primary key (ROLEID, MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK1 foreign key (ROLEID)
  references ROLES (ROLEID);
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK2 foreign key (MENUID)
  references MENUS (MENUID);

prompt Disabling triggers for CARS...
alter table CARS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for RENTTABLE...
alter table RENTTABLE disable all triggers;
prompt Disabling triggers for CHECKTABLE...
alter table CHECKTABLE disable all triggers;
prompt Disabling triggers for MENUS...
alter table MENUS disable all triggers;
prompt Disabling triggers for FUNS...
alter table FUNS disable all triggers;
prompt Disabling triggers for LOGINLOGS...
alter table LOGINLOGS disable all triggers;
prompt Disabling triggers for LOGS...
alter table LOGS disable all triggers;
prompt Disabling triggers for ROLES_MENUS...
alter table ROLES_MENUS disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint USERS_FK;
prompt Disabling foreign key constraints for RENTTABLE...
alter table RENTTABLE disable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE disable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE disable constraint RENTTABLE_CUSTONERS_FK2;
prompt Disabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE disable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE disable constraint CHECKTABLE_USERS_FK1;
prompt Disabling foreign key constraints for FUNS...
alter table FUNS disable constraint FUNS_FK;
prompt Disabling foreign key constraints for ROLES_MENUS...
alter table ROLES_MENUS disable constraint ROLES_MENUS_FK1;
alter table ROLES_MENUS disable constraint ROLES_MENUS_FK2;
prompt Loading CARS...
prompt Table is empty
prompt Loading ROLES...
insert into ROLES (roleid, rolename)
values (1, '管理员');
commit;
prompt 1 records loaded
prompt Loading USERS...
insert into USERS (username, identity, fullname, sex, address, phone, position, userlevel, userpwd)
values ('admin', '111111111111111111', 'admin', '男', '北京', '1112222211', 'Manager', 1, 'a1231');
commit;
prompt 1 records loaded
prompt Loading CUSTOMERS...
prompt Table is empty
prompt Loading RENTTABLE...
prompt Table is empty
prompt Loading CHECKTABLE...
prompt Table is empty
prompt Loading MENUS...
insert into MENUS (menuid, menuname, connurl, fatherid)
values (18, '系统管理', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (1, '汽车租赁管理系统', null, -1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (2, '用户管理', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (3, '添加用户', 'AddUserAction.do?method=preAddUser', 2);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (4, '查询用户', 'FindUserAction.do?method=preFindUser', 2);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (5, '客户管理', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (6, '添加客户信息', 'custManager/addCustomers.jsp', 5);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (7, '查询客户信息', 'custManager/findCustomers.jsp', 5);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (8, '汽车管理', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (9, '添加汽车信息', 'carManager/addCar.jsp', 8);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (10, '查询汽车信息', 'carManager/findCar.jsp', 8);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (11, '业务管理', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (12, '汽车出租', 'operatorManager/rentCar.jsp', 11);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (13, '汽车入库', 'operatorManager/returnCar.jsp', 11);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (14, '出租单管理', 'operatorManager/rentManager.jsp', 11);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (15, '检查单管理', 'operatorManager/checkManager.jsp', 11);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (16, '业务统计', null, 1);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (17, '当月应还汽车', 'MonthStatisticsCarAction.do?method=theCurrentMonth', 16);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (20, '角色管理', 'systemManager/roleManager.jsp', 18);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (21, '日志管理', 'systemManager/findLog.jsp', 18);
insert into MENUS (menuid, menuname, connurl, fatherid)
values (22, '登陆信息管理', 'systemManager/findLoginInfo.jsp', 18);
commit;
prompt 21 records loaded
prompt Loading FUNS...
insert into FUNS (funid, funname, funurl, menuid)
values (30, '底页面', 'foot.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (27, '查询登陆信息页面', 'findLoginInfo.jsp', 22);
insert into FUNS (funid, funname, funurl, menuid)
values (28, '查询登陆信息动作', 'LoginInfoOperatorAction.do', 22);
insert into FUNS (funid, funname, funurl, menuid)
values (29, '显示登陆信息页面', 'showLoginLogInfo.jsp', 22);
insert into FUNS (funid, funname, funurl, menuid)
values (26, '删除日志信息动作', 'DeleteLog.do', 21);
insert into FUNS (funid, funname, funurl, menuid)
values (17, '查询角色信息动作', 'FindRole.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (18, '添加新角色的菜单查询动作', 'FindMenus.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (19, '预修改角色信息查询动作', 'PreUpdateRole.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (20, '修改角色信息动作', 'UpdateRole.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (21, '删除角色动作', 'DeleteRole.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (22, '添加新角色页面', 'addRole.jsp', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (50, '添加用户角色查询动作n', 'AddUserAction.do', 3);
insert into FUNS (funid, funname, funurl, menuid)
values (11, '操作失败提示页面', 'error.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (12, '系统崩溃提示页面', 'appError.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (51, '添加用户页面', 'addUser.jsp', 3);
insert into FUNS (funid, funname, funurl, menuid)
values (52, '添加用户动作', 'AddUser.do', 3);
insert into FUNS (funid, funname, funurl, menuid)
values (13, '成功页面', 'ok.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (53, '查询用户角色查询动作n', 'FindUserAction.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (54, '查询用户页面', 'findUser.jsp', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (201, '添加汽车动作n', 'AddCarAction.do', 9);
insert into FUNS (funid, funname, funurl, menuid)
values (202, '查询汽车页面', 'findCar.jsp', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (203, '显示查询汽车结果页面', 'viewCars.jsp', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (204, '查询汽车信息动作n', 'FindCarAction.do', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (205, '预更新查询汽车动作', 'PreUpdateCar.do', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (206, '显示更新汽车结果页面', 'updateCar.jsp', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (207, '更新汽车动作', 'UpdateCar.do', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (209, '删除汽车动作', 'DeleteCar.do', 10);
insert into FUNS (funid, funname, funurl, menuid)
values (108, '删除客户动作', 'DeleteCustomers.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (61, '预修改用户密码', 'PreChangeUserPwd.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (62, '修改用户密码页面', 'chengeUserPwd.jsp', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (63, '修改用户密码动作', 'ChangeUserPwd.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (109, '预修改客户密码', 'PreChangeCustomerPwd.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (110, '修改客户密码页面', 'chengeCustomersPwd.jsp', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (111, '修改用户密码动作', 'ChangeCustomersPwd.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (300, '租车页面', 'rentCar.jsp', 12);
insert into FUNS (funid, funname, funurl, menuid)
values (301, '预生成出租单动作n', 'RentingCarAction.do', 12);
insert into FUNS (funid, funname, funurl, menuid)
values (302, '预生成出租单页面', 'preCreateRenting.jsp', 12);
insert into FUNS (funid, funname, funurl, menuid)
values (303, '生成出租单动作', 'CreateRentCarTable.do', 12);
insert into FUNS (funid, funname, funurl, menuid)
values (304, '汽车出租单查询页面', 'returnCar.jsp', 13);
insert into FUNS (funid, funname, funurl, menuid)
values (305, '预还车查询动作', 'PreReturnCarSearch.do', 13);
insert into FUNS (funid, funname, funurl, menuid)
values (307, '创建检查单动作', 'CreateCheckTable.do', 13);
insert into FUNS (funid, funname, funurl, menuid)
values (309, '出租单管理查询动作', 'RentManagerSearch.do', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (321, '删除检查单动作', 'DeleteCheckTables.do', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (322, '查询当月应还汽车动作n', 'MonthStatisticsCarAction.do', 17);
insert into FUNS (funid, funname, funurl, menuid)
values (55, '显示查询用户结果页面n', 'viewUser.jsp', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (56, '查询用户动作', 'FindUser.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (57, '预更新查询用户动作', 'PreUpdateUser.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (58, '显示更新用户页面', 'updateUser.jsp', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (1, '主页面', 'index.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (2, '头页面', 'head.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (3, '菜单页面', 'menu.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (4, '脚页面', 'foot.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (5, '操作页面', 'welcome.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (6, '权限提示页面', 'norole.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (8, '退出系统动作n', 'ExitSystemAction.do', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (9, '菜单导航', 'modNavTop.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (10, '菜单条', 'splitor.jsp', 1);
insert into FUNS (funid, funname, funurl, menuid)
values (101, '添加客户动作n', 'AddCustomersAction.do', 6);
insert into FUNS (funid, funname, funurl, menuid)
values (102, '查询客户页面', 'findCustomers.jsp', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (103, '查询客户信息动作n', 'FindCustomersAction.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (104, '显示查询客户结果页面', 'viewCustomers.jsp', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (105, '预更新客户查询动作', 'PreCustomers.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (106, '显示更新客户页面', 'updateCustomers.jsp', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (107, '更新客户动作', 'UpdateCustomers.do', 7);
insert into FUNS (funid, funname, funurl, menuid)
values (200, '添加汽车页面', 'addCar.jsp', 9);
insert into FUNS (funid, funname, funurl, menuid)
values (306, '创建检查单页面', 'createCheckTable.jsp', 13);
insert into FUNS (funid, funname, funurl, menuid)
values (308, '出租单管理页面', 'rentManager.jsp', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (310, '显示查询出租单结果页面', 'viewRenttables.jsp', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (317, '显示查询检查单结果页面', 'viewCheckTables.jsp', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (318, '预更新检查单查询动作', 'PreUdateCheckTable.do', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (319, '更新检查单页面', 'updateCheckTable.jsp', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (320, '更新检查单动作', 'UpdateCheckTable.do', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (400, '显示当月应还车结果页面', 'viewMonthReturnCarResult.jsp', 17);
insert into FUNS (funid, funname, funurl, menuid)
values (401, '查询当月应归还汽车相信信息', 'FindMonthReturnCarByInfo.do', 17);
insert into FUNS (funid, funname, funurl, menuid)
values (402, '显示当月应还汽车详细信息', 'findMonthReturnCarByInfo.jsp', 17);
insert into FUNS (funid, funname, funurl, menuid)
values (59, '更新用户动作', 'UpdateUser.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (311, '预更新出租单查询动作', 'PreUpdateRenttable.do', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (312, '更新出租单页面', 'updateRenttable.jsp', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (313, '更新出租单动作', 'UpdateRenttable.do', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (314, '删除出租单动作', 'DeleteRenttable.do', 14);
insert into FUNS (funid, funname, funurl, menuid)
values (315, '检查单管理页面', 'checkManager.jsp', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (316, '查询检查单动作', 'FindCheckTable.do', 15);
insert into FUNS (funid, funname, funurl, menuid)
values (60, '删除用户动作', 'DeleteUser.do', 4);
insert into FUNS (funid, funname, funurl, menuid)
values (100, '添加客户页面', 'addCustomers.jsp', 6);
insert into FUNS (funid, funname, funurl, menuid)
values (15, '添加角色功能n', 'RoleManagerAction.do', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (16, '角色管理页面', 'roleManager.jsp', 20);
insert into FUNS (funid, funname, funurl, menuid)
values (23, '查询日志信息页面', 'findLog.jsp', 21);
insert into FUNS (funid, funname, funurl, menuid)
values (24, '查询日志信息动作n', 'LogOperatorAction.do', 21);
insert into FUNS (funid, funname, funurl, menuid)
values (25, '显示日志信息页面', 'viewLog.jsp', 21);
commit;
prompt 89 records loaded
prompt Loading LOGINLOGS...
prompt Table is empty
prompt Loading LOGS...
prompt Table is empty
prompt Loading ROLES_MENUS...
insert into ROLES_MENUS (roleid, menuid)
values (1, 1);
insert into ROLES_MENUS (roleid, menuid)
values (1, 2);
insert into ROLES_MENUS (roleid, menuid)
values (1, 3);
insert into ROLES_MENUS (roleid, menuid)
values (1, 4);
insert into ROLES_MENUS (roleid, menuid)
values (1, 5);
insert into ROLES_MENUS (roleid, menuid)
values (1, 6);
insert into ROLES_MENUS (roleid, menuid)
values (1, 7);
insert into ROLES_MENUS (roleid, menuid)
values (1, 8);
insert into ROLES_MENUS (roleid, menuid)
values (1, 9);
insert into ROLES_MENUS (roleid, menuid)
values (1, 10);
insert into ROLES_MENUS (roleid, menuid)
values (1, 11);
insert into ROLES_MENUS (roleid, menuid)
values (1, 12);
insert into ROLES_MENUS (roleid, menuid)
values (1, 13);
insert into ROLES_MENUS (roleid, menuid)
values (1, 14);
insert into ROLES_MENUS (roleid, menuid)
values (1, 15);
insert into ROLES_MENUS (roleid, menuid)
values (1, 16);
insert into ROLES_MENUS (roleid, menuid)
values (1, 17);
insert into ROLES_MENUS (roleid, menuid)
values (1, 18);
insert into ROLES_MENUS (roleid, menuid)
values (1, 20);
insert into ROLES_MENUS (roleid, menuid)
values (1, 21);
insert into ROLES_MENUS (roleid, menuid)
values (1, 22);
commit;
prompt 21 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint USERS_FK;
prompt Enabling foreign key constraints for RENTTABLE...
alter table RENTTABLE enable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE enable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE enable constraint RENTTABLE_CUSTONERS_FK2;
prompt Enabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE enable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE enable constraint CHECKTABLE_USERS_FK1;
prompt Enabling foreign key constraints for FUNS...
alter table FUNS enable constraint FUNS_FK;
prompt Enabling foreign key constraints for ROLES_MENUS...
alter table ROLES_MENUS enable constraint ROLES_MENUS_FK1;
alter table ROLES_MENUS enable constraint ROLES_MENUS_FK2;
prompt Enabling triggers for CARS...
alter table CARS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for RENTTABLE...
alter table RENTTABLE enable all triggers;
prompt Enabling triggers for CHECKTABLE...
alter table CHECKTABLE enable all triggers;
prompt Enabling triggers for MENUS...
alter table MENUS enable all triggers;
prompt Enabling triggers for FUNS...
alter table FUNS enable all triggers;
prompt Enabling triggers for LOGINLOGS...
alter table LOGINLOGS enable all triggers;
prompt Enabling triggers for LOGS...
alter table LOGS enable all triggers;
prompt Enabling triggers for ROLES_MENUS...
alter table ROLES_MENUS enable all triggers;
set feedback on
set define on

