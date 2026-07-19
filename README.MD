# xmg_crm

## 项目简介

`xmg-crm` 是一个基于 SSM 的传统 CRM 后台管理系统，打包方式为 `war`。项目主要面向企业内部客户关系管理场景，提供员工与组织架构、角色权限、客户跟进、订单合同、售后保修、考勤薪资、任务日历、知识库、网盘和销售报表等功能。

项目采用 JSP 页面加 Spring MVC Controller 的单体 Web 架构，后端通过 MyBatis XML Mapper 访问 MySQL 数据库，运行时使用 Tomcat7 Maven 插件启动。

## 功能模块

- 系统管理：员工、部门、角色、权限、数据字典。
- 客户管理：潜在客户、正式客户、客户资源池、客户移交记录、客户开发计划。
- 订单合同：订单管理、合同管理、合同审核、合同转保修。
- 售后管理：保修单、保修明细、延保。
- 办公协同：任务、日历、网盘、知识库、客户线索。
- 人事考勤：签到签退、考勤记录、请假审批、工资导入与查询。
- 报表分析：客户统计、合同销售统计，前端使用图表组件展示。

## 技术栈

| 分类 | 技术 |
|------|------|
| 后端框架 | Spring 4.2.3、Spring MVC、Spring JDBC、Spring AOP |
| ORM/持久层 | MyBatis 3.2.3、MyBatis-Spring、MyBatis Generator |
| 数据库 | MySQL 8 驱动、Druid 连接池 |
| Web 运行环境 | Servlet 2.5、JSP、JSTL、Tomcat7 Maven Plugin |
| 前端 | jQuery EasyUI、FullCalendar、Highcharts、FancyBox、JSP |
| 权限与会话 | 自定义登录拦截器、Session 权限缓存、菜单/按钮权限控制 |
| 日志与 AOP | SLF4J、Log4j、AspectJ、CGLIB |
| 文件与报表 | Commons FileUpload、JXL Excel 导入导出 |
| 搜索 | Lucene 4.10.4、IK Analyzer 分词 |
| WebService | Apache CXF JAX-WS、JAX-RS |
| 工具库 | Lombok、Hutool、Jackson、json-lib、Commons Lang、Dom4j |
| 构建工具 | Maven，Java 8 源码级别 |

换名字了？以前叫xmg，现在是dmg，网站：https://www.520it.com/dmg

## 重点

1.aop是使用代理模式来生成接口的实现类，以service举例，假如使用了aop，就不可使用@autowired直接注入service的实现类，因代理类和实现类类型是不一致的，
反之，未使用aop来代理service，则可以直接注入到ServiceImpl中

## 权限设计

**url权限控制：对接口的权限进行限制**

方案1：用户登录的时候将用户的权限存放到session中，缺点：及时性不够

方案2：每次访问都查询数据库，及时性和安全性都比较好，缺点：频繁访问数据库

针对以上的方案，可以判断用户获取权限的时间和用户权限重新加载的时间，当用户获取权限的时间<用户权限重新加载的时间，就需要重新查询数据库更新

**按钮权限控制：隐藏页面没有权限的按钮**

页面使用了taglib的自定义标签函数，参考：standard-1.1.2.jar!\META-INF\fn.tld

**菜单权限控制**

## 调试问题

### 数据库连接问题

1. 日志：`create connection error, url: jdbc:mysql:///xmg_crm?createDatabaseIfNotExist=true&amp;useUnicode=true&amp;characterEncoding=UTF-8
   java.sql.SQLException: java.lang.ClassCastException: java.math.BigInteger cannot be cast to java.lang.Long`，原因：
   mysql驱动jar版本不适配
2. mysql地址报错,原链接：`jdbc:mysql://localhost:3306/mybatis?
   serverTimezone=UTC&amp;useSSL=false&amp;useUnicode=true&amp;characterEncoding=utf8`，去掉`&amp;`替换为`&`
3. 


## 扩展

1.使用tomcat7插件：idea可以在Configurations中新增一个maven配置，在run中填入tomcat7:run，这样就可以debug的方式启动项目。
2.每个request.getSession()都会创建一个session，若客户端请求携带了服务端传递的jSessionId，那么request.getSession()
就会获取该sessionId对应的session，否则创建一个新的session

## lucene（全文检索） 

分词器

安装jar到本地maven

```mvn
mvn install:install-file -DgroupId=org.wltea.ik-analyzer -DartifactId=ik-analyzer -Dversion=2012FF_u1 -Dmaven.test.skip=true -Dpackaging=jar -Dfile=D:\c-data\IKAnalyzer2012FF_u1.jar
```