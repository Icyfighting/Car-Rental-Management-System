# Car-Rental-Management-System
This project is training project that I completed in programing school.The project is management system of car rental company.It provides management of car, subscriber and admin information, and also provides the services of renting car, returning car, checking car, generating bills and recording system operation.
****
    
|Author|Bing Yan|
|---|---
|E-mail|187233718@qq.com


****
## Table of Contents
* [Functions Introduction](#Functions-Introduction)
    * [User Management](#User-Management)
    * [Client Management](#Client-Management)
    * [Car Management](#Car-Management)
    * [Business Management](#Business-Management)
    * [System Management](#System-Management)
* [Project Directory Structure](#Project-Directory-Structure)
* [How to run](#How-to-run)
    * [Environment Dependence](#Environment-Dependence)
    * [Deployment Configuration](#Deployment-Configuration)
    * [Test Information](#Test-Information)
    
### Functions-Introduction
#### User-Management
```
User Management module provides add, delete, update, conditional query operations of users in system.
User Management use Role-based Access Control in database.
User information includes user name, ID, real name, gender, address, role name, position and so on.
```
#### Client-Management
```
Client Management module provides add, delete, update, conditional query operations of clients of this car rental company.
Client information includes ID, name, gender, career, address and so on.
This system is background management system, client information should be operated by user of system.
```
#### Car-Management
```
Car Management module provides add, delete, update, conditional query operation of car resources in the company.
Car information includes car number, car type, color, rent price, deposit, renting status, description and so on.
```
#### Business-Management
```
Business Managemnt module includes operation of car renting, car returning, car renting table management and car checking table management.
Each module in business management provide add, conditional query operation according to needs of different business logic.
Car renting module provides operation including conditional car search, renting selected car and selected time.
Car returning module provides operation including returning car with real renting time, renting table creation.
Car renting talbe module provides operation including conditional query of renting record, checking table creation.
Car checking table module provides operation including conditional query of checking table. 
```
#### System-Management
```
System management module includs Role creation, Log searching.
Role creation module provide operation to create a new role by selecting operation permission defined in system.
Log searching module provide operation including login records and operation records defined in interceptor which operation can change data in database.
```

### Project-Directory-Structure
* WEBROOT
    * WEB-INF
        * car (car management module jsp)
        * customer (client managemnt module jsp)
        * user (user management module jsp)
        * system (system management module jsp)
        * rent (rent car module jsp)
        * check (check table module jsp)
        * main.jsp (main page when user login successfully)
        * web.xml (configuration file)
    * static (images, js, EasyUI themes)
* resources (data base connection properties, SSM framework configuration)
* src (java source files)
    * sql (sql of db tables creation and initial test data insertion)
    * cn/sxt
        * controller (controller layer of SSM)
        * service (service layer, interface and implements of main business logic)
        * mapper (mapper layer, Mybatis .java and .xml files)
        * pojo (entity class )
        * interceptor (record login and modification operation with detail information)
* README
* LICENSE
### How-to-run
#### Environment-Dependence 
```
JDK 1.8
Tomcat
MySQL 5.0
```
#### Deployment-Configuration
```
1. modify database connection configuration in resources\resource\db.properties.
2. Run sql file in src\sql to generate tables and initial test data in MySQL database.
3. Deploy project and access root directory of project.
4. Login with provided test user name and password.
```
#### Test-Information
```
user:admin
passwd:a1231
```

