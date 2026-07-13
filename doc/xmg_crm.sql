/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : xmg_crm

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 10/09/2024 10:12:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `signinday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lateday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `earlyday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vacateday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime(0) NULL DEFAULT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `allDay` tinyint(2) NULL DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `className` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `textColor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calendar
-- ----------------------------

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userIP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(2) NULL DEFAULT NULL,
  `signInTime` datetime(0) NULL DEFAULT NULL,
  `signOutTime` datetime(0) NULL DEFAULT NULL,
  `checkTime` datetime(0) NULL DEFAULT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `checkman_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkin
-- ----------------------------

-- ----------------------------
-- Table structure for clew
-- ----------------------------
DROP TABLE IF EXISTS `clew`;
CREATE TABLE `clew`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inputTime` datetime(0) NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clew
-- ----------------------------

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signTime` datetime(0) NULL DEFAULT NULL,
  `contractSum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payTime` datetime(0) NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifyTime` datetime(0) NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `seller_id` bigint(20) NULL DEFAULT NULL,
  `modifyUser_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(10) NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `salaryLevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收入水平',
  `customerSource` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户来源，数据字典',
  `inChargeUser_id` bigint(10) NULL DEFAULT NULL COMMENT '负责人',
  `inputUser_id` bigint(10) NULL DEFAULT NULL COMMENT '创建人',
  `inputTime` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '-2:流失，-1:开发失败，0:潜在客户，1:正式客户，2:资源池客户',
  `becomeTime` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (15, 'test001', 21, 1, '111', '1341@qq.com', '111', '141234', '司机', '4000-8000', '报纸', 26, 26, '2022-02-23 18:24:33', 1, NULL);
INSERT INTO `customer` VALUES (16, 'lisi', 42, 1, '412412', '4121@qq.com', '412', '414', '司机', '4000-8000', '报纸', 27, 27, '2022-02-23 18:43:11', 0, NULL);
INSERT INTO `customer` VALUES (17, '松江2', 1241, 1, '41412', '2142@qq.com', '4124', '1412', '教师', '4000-8000', '广播', 26, 26, '2022-02-23 18:48:41', 0, NULL);

-- ----------------------------
-- Table structure for customerdevplan
-- ----------------------------
DROP TABLE IF EXISTS `customerdevplan`;
CREATE TABLE `customerdevplan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `planTime` datetime(0) NULL DEFAULT NULL COMMENT '计划时间',
  `planSubject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划主题',
  `planType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划实施方式:比如电话,邀约上门',
  `planDetails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划内容',
  `traceResult` int(4) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `inputTime` datetime(0) NULL DEFAULT NULL,
  `type` int(4) NULL DEFAULT NULL,
  `inputUser_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customerdevplan
-- ----------------------------
INSERT INTO `customerdevplan` VALUES (3, '2022-02-23 00:00:00', '1111', '电话沟通', '1、341423\r\n2、14214\r\n3、答复', 2, '11', 17, '2022-02-23 18:51:57', 0, 26);

-- ----------------------------
-- Table structure for customertransfer
-- ----------------------------
DROP TABLE IF EXISTS `customertransfer`;
CREATE TABLE `customertransfer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '移交客户id',
  `transUser_id` bigint(20) NULL DEFAULT NULL COMMENT '移交用户id',
  `transTime` datetime(0) NULL DEFAULT NULL COMMENT '移交时间',
  `oldSeller_id` bigint(20) NULL DEFAULT NULL COMMENT '原负责市场专员',
  `newSeller_id` bigint(20) NULL DEFAULT NULL COMMENT '新负责市场专员',
  `transReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移交原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customertransfer
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `manager_id` bigint(20) NULL DEFAULT NULL COMMENT '部门经理',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '部门状态0正常 -1停用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '003', '总事办', 16, 4, 1);
INSERT INTO `department` VALUES (2, '001', '财务部', 7, 1, 1);
INSERT INTO `department` VALUES (4, '005', '董事会', NULL, NULL, 1);
INSERT INTO `department` VALUES (7, '007', '人事部', NULL, NULL, 0);
INSERT INTO `department` VALUES (8, '008', '企划部', NULL, NULL, 0);
INSERT INTO `department` VALUES (9, '009', '技术部', NULL, NULL, 0);
INSERT INTO `department` VALUES (10, '010', '销售部', NULL, 4, 1);
INSERT INTO `department` VALUES (11, '011', '采购部', NULL, 1, 1);
INSERT INTO `department` VALUES (12, '012', '客户服务部', NULL, NULL, 1);
INSERT INTO `department` VALUES (13, 'N013', '测试部', 25, 9, 1);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工账号',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门',
  `inputtime` date NULL DEFAULT NULL COMMENT '入职时间',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '1正常，0离职',
  `admin` tinyint(1) NULL DEFAULT NULL COMMENT '1超级管理员 0普通',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_dept`(`dept_id`) USING BTREE,
  CONSTRAINT `FK_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'admin', '超级管理员', 'admin', '17839934031', '780798160@qq.com', 4, '2021-06-16', 1, 1);
INSERT INTO `employee` VALUES (26, 'test', 'test', '000000', '13372553124', '24552121@163.com', 10, '2022-02-23', 1, 0);
INSERT INTO `employee` VALUES (27, 'test2', 'wangwu', '000000', '1421', '12@qq.com', 10, '2022-02-23', 1, 0);
INSERT INTO `employee` VALUES (28, 'tt1', 'zhaoliu', '000000', '1412', '412', 10, '2022-02-23', 1, 0);

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` bigint(20) NULL DEFAULT NULL,
  `r_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_EMPLOYY_M`(`e_id`) USING BTREE,
  INDEX ` FK_ROLE_M`(`r_id`) USING BTREE,
  CONSTRAINT ` FK_ROLE_M` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EMPLOYY_M` FOREIGN KEY (`e_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES (3, 26, 6);
INSERT INTO `employee_role` VALUES (4, 27, 6);
INSERT INTO `employee_role` VALUES (5, 28, 9);

-- ----------------------------
-- Table structure for guarantee
-- ----------------------------
DROP TABLE IF EXISTS `guarantee`;
CREATE TABLE `guarantee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dueTime` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guarantee
-- ----------------------------

-- ----------------------------
-- Table structure for guaranteeitem
-- ----------------------------
DROP TABLE IF EXISTS `guaranteeitem`;
CREATE TABLE `guaranteeitem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guaranteeTime` datetime(0) NULL DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `cost` int(10) NULL DEFAULT NULL COMMENT '保修费用',
  `guarantee_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guaranteeitem
-- ----------------------------

-- ----------------------------
-- Table structure for know
-- ----------------------------
DROP TABLE IF EXISTS `know`;
CREATE TABLE `know`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of know
-- ----------------------------

-- ----------------------------
-- Table structure for knowledgemenu
-- ----------------------------
DROP TABLE IF EXISTS `knowledgemenu`;
CREATE TABLE `knowledgemenu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(2) NULL DEFAULT NULL,
  `checked` tinyint(2) NULL DEFAULT NULL,
  `attributes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledgemenu
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opuser_id` bigint(20) NULL DEFAULT NULL,
  `optime` datetime(0) NULL DEFAULT NULL,
  `opip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, NULL, '2024-09-09 10:19:56', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (2, 1, '2024-09-09 10:20:10', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (3, 1, '2024-09-09 10:20:21', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (4, NULL, '2024-09-09 13:41:18', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (5, 1, '2024-09-09 13:42:15', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (6, 1, '2024-09-09 13:42:21', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (7, NULL, '2024-09-09 14:23:55', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (8, 1, '2024-09-09 14:24:21', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (9, 1, '2024-09-09 14:24:33', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (10, NULL, '2024-09-09 23:21:16', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (11, 1, '2024-09-09 23:21:20', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (12, 1, '2024-09-09 23:21:20', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (13, 1, '2024-09-09 23:25:55', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (14, 1, '2024-09-09 23:25:55', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (15, 1, '2024-09-09 23:25:55', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (16, NULL, '2024-09-09 23:26:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:getEmployeeForLogin', '{\r\n  \"password\" : \"admin\",\r\n  \"username\" : \"admin\"\r\n}');
INSERT INTO `log` VALUES (17, 1, '2024-09-09 23:27:02', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (18, 1, '2024-09-09 23:27:06', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.MenuServiceImpl:queryForMenu', '{ }');
INSERT INTO `log` VALUES (19, 1, '2024-09-09 23:27:32', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.RoleServiceImpl:queryForEmp', '{ }');
INSERT INTO `log` VALUES (20, 1, '2024-09-09 23:27:32', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.DepartmentServiceImpl:queryForEmp', '{ }');
INSERT INTO `log` VALUES (21, 1, '2024-09-09 23:27:33', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"keyword\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (22, 1, '2024-09-09 23:27:37', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.RoleServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"keyword\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (23, 1, '2024-09-09 23:27:37', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (24, 1, '2024-09-09 23:27:38', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"keyword\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (25, 1, '2024-09-09 23:27:38', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.DepartmentServiceImpl:queryForPage', '{\r\n  \"qo\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"keyword\" : null,\r\n    \"state\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (26, 1, '2024-09-09 23:27:56', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : null,\r\n    \"rows\" : null,\r\n    \"rid\" : 1,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (27, 1, '2024-09-09 23:28:06', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 2,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 10\r\n  }\r\n}');
INSERT INTO `log` VALUES (28, 1, '2024-09-09 23:28:07', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 3,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 20\r\n  }\r\n}');
INSERT INTO `log` VALUES (29, 1, '2024-09-09 23:28:08', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 4,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 30\r\n  }\r\n}');
INSERT INTO `log` VALUES (30, 1, '2024-09-09 23:28:08', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 5,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 40\r\n  }\r\n}');
INSERT INTO `log` VALUES (31, 1, '2024-09-09 23:28:09', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 6,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 50\r\n  }\r\n}');
INSERT INTO `log` VALUES (32, 1, '2024-09-09 23:28:09', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 7,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 60\r\n  }\r\n}');
INSERT INTO `log` VALUES (33, 1, '2024-09-09 23:28:10', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 8,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 70\r\n  }\r\n}');
INSERT INTO `log` VALUES (34, 1, '2024-09-09 23:28:10', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 9,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 80\r\n  }\r\n}');
INSERT INTO `log` VALUES (35, 1, '2024-09-09 23:28:11', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 10,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 90\r\n  }\r\n}');
INSERT INTO `log` VALUES (36, 1, '2024-09-09 23:28:11', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 11,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 100\r\n  }\r\n}');
INSERT INTO `log` VALUES (37, 1, '2024-09-09 23:28:11', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.PermissionServiceImpl:queryForPage', '{\r\n  \"queryObject\" : {\r\n    \"page\" : 12,\r\n    \"rows\" : 10,\r\n    \"rid\" : null,\r\n    \"start\" : 110\r\n  }\r\n}');
INSERT INTO `log` VALUES (38, 1, '2024-09-09 23:28:51', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.CustomerTransferServiceImpl:list', '{\r\n  \"qo\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"customername\" : null,\r\n    \"begintime\" : null,\r\n    \"endtime\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');
INSERT INTO `log` VALUES (39, 1, '2024-09-09 23:28:51', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:queryEmployeeByRole', '{ }');
INSERT INTO `log` VALUES (41, 1, '2024-09-09 23:28:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.SystemDictionaryItemServiceImpl:queryDicItem', '{\r\n  \"id\" : 1\r\n}');
INSERT INTO `log` VALUES (42, 1, '2024-09-09 23:28:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.SystemDictionaryItemServiceImpl:queryDicItem', '{\r\n  \"id\" : 2\r\n}');
INSERT INTO `log` VALUES (43, 1, '2024-09-09 23:28:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.SystemDictionaryItemServiceImpl:queryDicItem', '{\r\n  \"id\" : 3\r\n}');
INSERT INTO `log` VALUES (44, 1, '2024-09-09 23:28:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.EmployeeServiceImpl:queryEmployeeByRole', '{ }');
INSERT INTO `log` VALUES (45, 1, '2024-09-09 23:28:57', '0:0:0:0:0:0:0:1', 'com._520it.crm.service.impl.CustomerServiceImpl:queryForPage', '{\r\n  \"qo\" : {\r\n    \"page\" : 1,\r\n    \"rows\" : 10,\r\n    \"userid\" : null,\r\n    \"keyword\" : null,\r\n    \"status\" : null,\r\n    \"start\" : 0\r\n  }\r\n}');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `iconCls` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `checked` tinyint(1) NULL DEFAULT NULL,
  `state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否展开菜单',
  `attributes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '当前菜单的父节点',
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用来判断是否有该菜单的访问权限',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_PARENT`(`parent_id`) USING BTREE,
  CONSTRAINT `FK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (2, '员工管理', NULL, NULL, NULL, '{\"url\":\"/employee\"}', 1, 'com._520it.crm.web.controller.EmployeeController:index');
INSERT INTO `menu` VALUES (3, '角色管理', NULL, NULL, NULL, '{\"url\":\"/role\"}', 1, 'com._520it.crm.web.controller.RoleController:index');
INSERT INTO `menu` VALUES (4, '部门管理', NULL, NULL, NULL, '{\"url\":\"/department\"}', 1, 'com._520it.crm.web.controller.DepartmentController:index');
INSERT INTO `menu` VALUES (5, '数据字典', NULL, NULL, NULL, '{\"url\":\"/systemDictionary\"}', NULL, 'com._520it.crm.web.controller.SystemDictionaryController:index');
INSERT INTO `menu` VALUES (6, '任务模块', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (7, '今日任务', NULL, NULL, NULL, '{\"url\":\"/task\"}', 6, 'com._520it.crm.web.controller.TaskController:index');
INSERT INTO `menu` VALUES (8, '网盘', NULL, NULL, NULL, '{\"url\":\"/netdisk\"}', 6, 'com._520it.crm.web.controller.NetworkDiskController:index');
INSERT INTO `menu` VALUES (9, '知识库', NULL, NULL, NULL, '{\"url\":\"/knowledge\"}', 6, 'com._520it.crm.web.controller.KnowledgeController:index');
INSERT INTO `menu` VALUES (10, '客户线索', NULL, NULL, NULL, '{\"url\":\"/clew\"}', 6, 'com._520it.crm.web.controller.ClewController:index');
INSERT INTO `menu` VALUES (11, '日历', NULL, NULL, NULL, '{\"url\":\"/calendar\"}', 6, 'com._520it.crm.web.controller.CalendarController:index');
INSERT INTO `menu` VALUES (12, '营销管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (13, '潜在客户管理', NULL, NULL, NULL, '{\"url\":\"/potentialCustomer\"}', 12, 'com._520it.crm.web.controller.PotentialCustomerController:index');
INSERT INTO `menu` VALUES (14, '客户信息管理', NULL, NULL, NULL, '{\"url\":\"/customer\"}', 12, 'com._520it.crm.web.controller.CustomerController:index');
INSERT INTO `menu` VALUES (15, '客户移交记录', NULL, NULL, NULL, '{\"url\":\"/customerTransfer\"}', 12, 'com._520it.crm.web.controller.CustomerTransferController:index');
INSERT INTO `menu` VALUES (16, '潜在客户开发计划', NULL, NULL, NULL, '{\"url\":\"/potentialCustomerDevPlan\"}', 12, 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:index');
INSERT INTO `menu` VALUES (17, '正式客户开发计划', NULL, NULL, NULL, '{\"url\":\"/customerDevPlan\"}', 12, 'com._520it.crm.web.controller.CustomerDevPlanController:index');
INSERT INTO `menu` VALUES (18, '客户资源池', NULL, NULL, NULL, '{\"url\":\"/customerResourcePool\"}', 12, 'com._520it.crm.web.controller.CustomerResourcePoolController:index');
INSERT INTO `menu` VALUES (19, '订单合同管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (20, '订单管理', NULL, NULL, NULL, '{\"url\":\"/orderBill\"}', 19, 'com._520it.crm.web.controller.OrderBillController:index');
INSERT INTO `menu` VALUES (21, '合同管理', NULL, NULL, NULL, '{\"url\":\"/contract\"}', 19, 'com._520it.crm.web.controller.ContractController:index');
INSERT INTO `menu` VALUES (22, '售后管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (23, '保修', NULL, NULL, NULL, '{\"url\":\"/guarantee\"}', 22, 'com._520it.crm.web.controller.GuaranteeController:index');
INSERT INTO `menu` VALUES (24, '报表管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (25, '销售报表', NULL, NULL, NULL, '{\"url\":\"/contractmm\"}', 25, 'com._520it.crm.web.controller.ContractChartController:index');
INSERT INTO `menu` VALUES (26, '考勤管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (27, '考勤签到', NULL, NULL, NULL, '{\"url\":\"/checkIn\"}', 26, 'com._520it.crm.web.controller.CheckInController:index');
INSERT INTO `menu` VALUES (28, '考勤记录', NULL, NULL, NULL, '{\"url\":\"/attendance\"}', 26, 'com._520it.crm.web.controller.AttendanceController:index');
INSERT INTO `menu` VALUES (29, '请假管理', NULL, NULL, NULL, '{\"url\":\"/vacate\"}', 26, 'com._520it.crm.web.controller.VacateController:index');
INSERT INTO `menu` VALUES (30, '工资管理', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (31, '员工工资', NULL, NULL, NULL, '{\"url\":\"/salary\"}', 30, 'com._520it.crm.web.controller.SalaryController:index');
INSERT INTO `menu` VALUES (33, '客户移交记录', NULL, NULL, NULL, '{\"url\":\"/customerTransfer\"}', 12, 'com._520it.crm.web.controller.CustomerTransferController:index');

-- ----------------------------
-- Table structure for networkdisk
-- ----------------------------
DROP TABLE IF EXISTS `networkdisk`;
CREATE TABLE `networkdisk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dir` tinyint(2) NULL DEFAULT NULL,
  `uploadTime` datetime(0) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub` tinyint(2) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of networkdisk
-- ----------------------------

-- ----------------------------
-- Table structure for orderbill
-- ----------------------------
DROP TABLE IF EXISTS `orderbill`;
CREATE TABLE `orderbill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `signTime` datetime(0) NULL DEFAULT NULL,
  `totalSum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bargainMoney` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `modifyTime` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `seller_id` bigint(20) NULL DEFAULT NULL,
  `modifyUser_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderbill
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '员工ALL', 'com._520it.crm.web.controller.EmployeeController:ALL');
INSERT INTO `permission` VALUES (2, '员工主页', 'com._520it.crm.web.controller.EmployeeController:index');
INSERT INTO `permission` VALUES (3, '员工列表', 'com._520it.crm.web.controller.EmployeeController:list');
INSERT INTO `permission` VALUES (4, '员工新增', 'com._520it.crm.web.controller.EmployeeController:save');
INSERT INTO `permission` VALUES (5, '员工编辑', 'com._520it.crm.web.controller.EmployeeController:update');
INSERT INTO `permission` VALUES (6, '员工离职', 'com._520it.crm.web.controller.EmployeeController:delete');
INSERT INTO `permission` VALUES (7, '角色ALL', 'com._520it.crm.web.controller.RoleController:ALL');
INSERT INTO `permission` VALUES (8, '角色ALL', 'com._520it.crm.web.controller.RoleController:index');
INSERT INTO `permission` VALUES (9, '角色列表', 'com._520it.crm.web.controller.RoleController:list');
INSERT INTO `permission` VALUES (10, '角色新增', 'com._520it.crm.web.controller.RoleController:save');
INSERT INTO `permission` VALUES (11, '角色编辑', 'com._520it.crm.web.controller.RoleController:edit');
INSERT INTO `permission` VALUES (12, '角色删除', 'com._520it.crm.web.controller.RoleController:delete');
INSERT INTO `permission` VALUES (13, '任务模块ALL', 'com._520it.crm.web.controller.TaskController:ALL');
INSERT INTO `permission` VALUES (14, '任务模块主页', 'com._520it.crm.web.controller.TaskController:index');
INSERT INTO `permission` VALUES (15, '任务列表', 'com._520it.crm.web.controller.TaskController:list');
INSERT INTO `permission` VALUES (16, '分配任务', 'com._520it.crm.web.controller.TaskController:save');
INSERT INTO `permission` VALUES (17, '编辑任务', 'com._520it.crm.web.controller.TaskController:update');
INSERT INTO `permission` VALUES (18, '删除任务', 'com._520it.crm.web.controller.TaskController:delete');
INSERT INTO `permission` VALUES (19, '标记任务完成', 'com._520it.crm.web.controller.TaskController:complete');
INSERT INTO `permission` VALUES (20, '标记任务失败', 'com._520it.crm.web.controller.TaskController:lose');
INSERT INTO `permission` VALUES (21, '添加任务描述', 'com._520it.crm.web.controller.TaskController:addDescribe');
INSERT INTO `permission` VALUES (22, '潜在客户ALL', 'com._520it.crm.web.controller.PotentialCustomerController:ALL');
INSERT INTO `permission` VALUES (23, '潜在客户主页', 'com._520it.crm.web.controller.PotentialCustomerController:index');
INSERT INTO `permission` VALUES (24, '潜在客户列表', 'com._520it.crm.web.controller.PotentialCustomerController:list');
INSERT INTO `permission` VALUES (25, '潜在客户新增', 'com._520it.crm.web.controller.PotentialCustomerController:save');
INSERT INTO `permission` VALUES (26, '潜在客户编辑', 'com._520it.crm.web.controller.PotentialCustomerController:update');
INSERT INTO `permission` VALUES (27, '潜在客户移交', 'com._520it.crm.web.controller.PotentialCustomerController:updateInCharge');
INSERT INTO `permission` VALUES (28, '潜在客户开发失败', 'com._520it.crm.web.controller.PotentialCustomerController:developFailed');
INSERT INTO `permission` VALUES (29, '潜在客户转正', 'com._520it.crm.web.controller.PotentialCustomerController:become');
INSERT INTO `permission` VALUES (30, '客户ALL', 'com._520it.crm.web.controller.CustomerController:ALL');
INSERT INTO `permission` VALUES (31, '客户主页', 'com._520it.crm.web.controller.CustomerController:index');
INSERT INTO `permission` VALUES (32, '客户列表', 'com._520it.crm.web.controller.CustomerController:list');
INSERT INTO `permission` VALUES (33, '客户新增', 'com._520it.crm.web.controller.CustomerController:save');
INSERT INTO `permission` VALUES (34, '客户编辑', 'com._520it.crm.web.controller.CustomerController:update');
INSERT INTO `permission` VALUES (35, '客户移交', 'com._520it.crm.web.controller.CustomerController:updateInCharge');
INSERT INTO `permission` VALUES (36, '客户提交资源池', 'com._520it.crm.web.controller.CustomerController:moveToResourcePool');
INSERT INTO `permission` VALUES (37, '客户流失', 'com._520it.crm.web.controller.CustomerController:customerLost');
INSERT INTO `permission` VALUES (38, '客户信息导出', 'com._520it.crm.web.controller.CustomerController:export');
INSERT INTO `permission` VALUES (39, '潜在客户开发计划ALL', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:ALL');
INSERT INTO `permission` VALUES (40, '潜在客户开发计划主页', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:index');
INSERT INTO `permission` VALUES (41, '潜在客户开发计划列表', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:list');
INSERT INTO `permission` VALUES (42, '潜在客户开发计划增加', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:save');
INSERT INTO `permission` VALUES (43, '潜在客户开发计划编辑', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:update');
INSERT INTO `permission` VALUES (44, '潜在客户开发计划删除', 'com._520it.crm.web.controller.PontentialCustomerDevPlanController:delete');
INSERT INTO `permission` VALUES (45, '正式客户开发计划ALL', 'com._520it.crm.web.controller.CustomerDevPlanController:ALL');
INSERT INTO `permission` VALUES (46, '正式客户开发计划主页', 'com._520it.crm.web.controller.CustomerDevPlanController:index');
INSERT INTO `permission` VALUES (47, '正式客户开发计划列表', 'com._520it.crm.web.controller.CustomerDevPlanController:list');
INSERT INTO `permission` VALUES (48, '正式客户开发计划增加', 'com._520it.crm.web.controller.CustomerDevPlanController:save');
INSERT INTO `permission` VALUES (49, '正式客户开发计划编辑', 'com._520it.crm.web.controller.CustomerDevPlanController:update');
INSERT INTO `permission` VALUES (50, '正式客户开发计划删除', 'com._520it.crm.web.controller.CustomerDevPlanController:delete');
INSERT INTO `permission` VALUES (51, '客户资源池ALL', 'com._520it.crm.web.controller.CustomerResourcePoolController:ALL');
INSERT INTO `permission` VALUES (52, '客户资源池主页', 'com._520it.crm.web.controller.CustomerResourcePoolController:index');
INSERT INTO `permission` VALUES (53, '客户资源池列表', 'com._520it.crm.web.controller.CustomerResourcePoolController:list');
INSERT INTO `permission` VALUES (54, '客户资源池客户增加', 'com._520it.crm.web.controller.CustomerResourcePoolController:save');
INSERT INTO `permission` VALUES (55, '客户资源池客户编辑', 'com._520it.crm.web.controller.CustomerResourcePoolController:update');
INSERT INTO `permission` VALUES (56, '客户资源池客户吸纳', 'com._520it.crm.web.controller.CustomerResourcePoolController:admit');
INSERT INTO `permission` VALUES (57, '订单管理ALL', 'com._520it.crm.web.controller.OrderBillController:ALL');
INSERT INTO `permission` VALUES (58, '订单管理主页', 'com._520it.crm.web.controller.OrderBillController:index');
INSERT INTO `permission` VALUES (59, '订单列表', 'com._520it.crm.web.controller.OrderBillController:list');
INSERT INTO `permission` VALUES (60, '订单新增', 'com._520it.crm.web.controller.OrderBillController:save');
INSERT INTO `permission` VALUES (61, '订单编辑', 'com._520it.crm.web.controller.OrderBillController:update');
INSERT INTO `permission` VALUES (62, '订单删除', 'com._520it.crm.web.controller.OrderBillController:delete');
INSERT INTO `permission` VALUES (63, '订单本人审核', 'com._520it.crm.web.controller.OrderBillController:checked');
INSERT INTO `permission` VALUES (64, '订单部门审核', 'com._520it.crm.web.controller.OrderBillController:');
INSERT INTO `permission` VALUES (65, '订单财务审核', 'com._520it.crm.web.controller.OrderBillController:');
INSERT INTO `permission` VALUES (66, '订单拒绝审核', 'com._520it.crm.web.controller.OrderBillController:noChecked');
INSERT INTO `permission` VALUES (67, '生成合同', 'com._520it.crm.web.controller.OrderBillController:doContract');
INSERT INTO `permission` VALUES (68, '合同管理ALL', 'com._520it.crm.web.controller.ContractController:ALL');
INSERT INTO `permission` VALUES (69, '合同管理主页', 'com._520it.crm.web.controller.ContractController:index');
INSERT INTO `permission` VALUES (70, '合同列表', 'com._520it.crm.web.controller.ContractController:list');
INSERT INTO `permission` VALUES (71, '合同新增', 'com._520it.crm.web.controller.ContractController:save');
INSERT INTO `permission` VALUES (72, '合同编辑', 'com._520it.crm.web.controller.ContractController:update');
INSERT INTO `permission` VALUES (73, '合同删除', 'com._520it.crm.web.controller.ContractController:delete');
INSERT INTO `permission` VALUES (74, '合同本人审核', 'com._520it.crm.web.controller.ContractController:checked');
INSERT INTO `permission` VALUES (75, '合同部门审核', 'com._520it.crm.web.controller.ContractController:');
INSERT INTO `permission` VALUES (76, '合同财务审核', 'com._520it.crm.web.controller.ContractController:');
INSERT INTO `permission` VALUES (77, '合同拒绝审核', 'com._520it.crm.web.controller.ContractController:noChecked');
INSERT INTO `permission` VALUES (78, '生成维修单', 'com._520it.crm.web.controller.ContractController:doContract');
INSERT INTO `permission` VALUES (79, '保修管理ALL', 'com._520it.crm.web.controller.GuaranteeController:ALL');
INSERT INTO `permission` VALUES (80, '保修单主页', 'com._520it.crm.web.controller.GuaranteeController:index');
INSERT INTO `permission` VALUES (81, '保修单列表', 'com._520it.crm.web.controller.GuaranteeController:list');
INSERT INTO `permission` VALUES (82, '保修单编辑', 'com._520it.crm.web.controller.GuaranteeController:update');
INSERT INTO `permission` VALUES (83, '保修单删除', 'com._520it.crm.web.controller.GuaranteeController:delete');
INSERT INTO `permission` VALUES (84, '保修单延保', 'com._520it.crm.web.controller.GuaranteeController:keep');
INSERT INTO `permission` VALUES (85, '保修单明细列表', 'com._520it.crm.web.controller.GuaranteeController:itemList');
INSERT INTO `permission` VALUES (86, '保修单明细新增', 'com._520it.crm.web.controller.GuaranteeController:itemSave');
INSERT INTO `permission` VALUES (87, '保修单明细编辑', 'com._520it.crm.web.controller.GuaranteeController:itemUpdate');
INSERT INTO `permission` VALUES (88, '保修单明细删除', 'com._520it.crm.web.controller.GuaranteeController:itemDelete');
INSERT INTO `permission` VALUES (89, '考勤签到ALL', 'com._520it.crm.web.controller.CheckInController:ALL');
INSERT INTO `permission` VALUES (90, '考勤签到主页', 'com._520it.crm.web.controller.CheckInController:index');
INSERT INTO `permission` VALUES (91, '考勤签到列表', 'com._520it.crm.web.controller.CheckInController:list');
INSERT INTO `permission` VALUES (92, '考勤签到', 'com._520it.crm.web.controller.CheckInController:signIn');
INSERT INTO `permission` VALUES (93, '考勤签退', 'com._520it.crm.web.controller.CheckInController:signOut');
INSERT INTO `permission` VALUES (94, '考勤签到补签', 'com._520it.crm.web.controller.CheckInController:addCheckIn');
INSERT INTO `permission` VALUES (95, '考勤记录ALL', 'com._520it.crm.web.controller.AttendanceController:ALL');
INSERT INTO `permission` VALUES (96, '考勤记录主页', 'com._520it.crm.web.controller.AttendanceController:index');
INSERT INTO `permission` VALUES (97, '考勤记录列表', 'com._520it.crm.web.controller.AttendanceController:list');
INSERT INTO `permission` VALUES (98, '考勤记录新增', 'com._520it.crm.web.controller.AttendanceController:save');
INSERT INTO `permission` VALUES (99, '考勤记录编辑', 'com._520it.crm.web.controller.AttendanceController:update');
INSERT INTO `permission` VALUES (100, '考勤记录删除', 'com._520it.crm.web.controller.AttendanceController:delete');
INSERT INTO `permission` VALUES (101, '考勤记录导入', 'com._520it.crm.web.controller.AttendanceController:updateAttendance');
INSERT INTO `permission` VALUES (102, '请假管理ALL', 'com._520it.crm.web.controller.VacateController:ALL');
INSERT INTO `permission` VALUES (103, '请假管理主页', 'com._520it.crm.web.controller.VacateController:index');
INSERT INTO `permission` VALUES (104, '请假管理列表', 'com._520it.crm.web.controller.VacateController:list');
INSERT INTO `permission` VALUES (105, '请假记录新增', 'com._520it.crm.web.controller.VacateController:save');
INSERT INTO `permission` VALUES (106, '请假记录编辑', 'com._520it.crm.web.controller.VacateController:update');
INSERT INTO `permission` VALUES (107, '请假记录删除', 'com._520it.crm.web.controller.VacateController:delete');
INSERT INTO `permission` VALUES (108, '请假记录审核', 'com._520it.crm.web.controller.VacateController:audit');
INSERT INTO `permission` VALUES (109, '员工工资ALL', 'com._520it.crm.web.controller.SalaryController:ALL');
INSERT INTO `permission` VALUES (110, '员工工资主页', 'com._520it.crm.web.controller.SalaryController:index');
INSERT INTO `permission` VALUES (111, '员工工资列表', 'com._520it.crm.web.controller.SalaryController:list');
INSERT INTO `permission` VALUES (112, '员工工资导入', 'com._520it.crm.web.controller.SalaryController:upload');
INSERT INTO `permission` VALUES (113, '客户移交记录ALL', 'com._520it.crm.web.controller.CustomerTransferController:ALL');
INSERT INTO `permission` VALUES (114, '客户移交记录主页', 'com._520it.crm.web.controller.CustomerTransferController:index');
INSERT INTO `permission` VALUES (115, '客户移交记录列表', 'com._520it.crm.web.controller.CustomerTransferController:list');
INSERT INTO `permission` VALUES (116, '客户移交新增', 'com._520it.crm.web.controller.CustomerTransferController:save');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '人事专员', 'HR');
INSERT INTO `role` VALUES (6, '市场专员', 'MS');
INSERT INTO `role` VALUES (9, '销售主管', 'XRZG');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) NULL DEFAULT NULL,
  `p_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_PERMISSION`(`p_id`) USING BTREE,
  INDEX `FK_ROLE`(`r_id`) USING BTREE,
  CONSTRAINT `FK_PERMISSION` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (49, 6, 23);
INSERT INTO `role_permission` VALUES (50, 6, 24);
INSERT INTO `role_permission` VALUES (51, 6, 25);
INSERT INTO `role_permission` VALUES (52, 6, 26);
INSERT INTO `role_permission` VALUES (53, 6, 27);
INSERT INTO `role_permission` VALUES (54, 6, 28);
INSERT INTO `role_permission` VALUES (55, 6, 29);
INSERT INTO `role_permission` VALUES (56, 6, 31);
INSERT INTO `role_permission` VALUES (57, 6, 32);
INSERT INTO `role_permission` VALUES (58, 6, 33);
INSERT INTO `role_permission` VALUES (59, 6, 34);
INSERT INTO `role_permission` VALUES (60, 6, 35);
INSERT INTO `role_permission` VALUES (61, 6, 36);
INSERT INTO `role_permission` VALUES (62, 6, 37);
INSERT INTO `role_permission` VALUES (63, 6, 38);
INSERT INTO `role_permission` VALUES (64, 6, 40);
INSERT INTO `role_permission` VALUES (65, 6, 41);
INSERT INTO `role_permission` VALUES (66, 6, 42);
INSERT INTO `role_permission` VALUES (67, 6, 43);
INSERT INTO `role_permission` VALUES (68, 6, 44);
INSERT INTO `role_permission` VALUES (69, 6, 46);
INSERT INTO `role_permission` VALUES (70, 6, 47);
INSERT INTO `role_permission` VALUES (71, 6, 48);
INSERT INTO `role_permission` VALUES (72, 6, 49);
INSERT INTO `role_permission` VALUES (73, 6, 50);
INSERT INTO `role_permission` VALUES (74, 6, 52);
INSERT INTO `role_permission` VALUES (75, 6, 53);
INSERT INTO `role_permission` VALUES (76, 6, 56);
INSERT INTO `role_permission` VALUES (77, 9, 22);
INSERT INTO `role_permission` VALUES (78, 9, 30);
INSERT INTO `role_permission` VALUES (79, 9, 39);
INSERT INTO `role_permission` VALUES (80, 9, 45);
INSERT INTO `role_permission` VALUES (81, 9, 51);
INSERT INTO `role_permission` VALUES (82, 9, 113);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `salary` decimal(10, 2) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `employee_id` tinyint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------

-- ----------------------------
-- Table structure for systemdictionary
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionary`;
CREATE TABLE `systemdictionary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemdictionary
-- ----------------------------
INSERT INTO `systemdictionary` VALUES (1, 'job', '职业', NULL);
INSERT INTO `systemdictionary` VALUES (2, 'salarylevel', '收入水平(月)', NULL);
INSERT INTO `systemdictionary` VALUES (3, 'customersource', '客户来源', NULL);
INSERT INTO `systemdictionary` VALUES (4, 'plantype', '实施方式', NULL);

-- ----------------------------
-- Table structure for systemdictionaryitem
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionaryitem`;
CREATE TABLE `systemdictionaryitem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '字典明细是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_SD`(`parent_id`) USING BTREE,
  CONSTRAINT `FK_SD` FOREIGN KEY (`parent_id`) REFERENCES `systemdictionary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemdictionaryitem
-- ----------------------------
INSERT INTO `systemdictionaryitem` VALUES (1, '司机', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (2, '教师', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (3, '程序员', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (4, '清洁工', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (5, '白领', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (6, '歌手', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (7, '演员', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (8, '公知', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (9, '银行职工', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (10, '农名工', '', 1, 1);
INSERT INTO `systemdictionaryitem` VALUES (13, '学徒', '', 1, 1);
INSERT INTO `systemdictionaryitem` VALUES (14, '化妆师', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (23, '4000以下', '', 2, 0);
INSERT INTO `systemdictionaryitem` VALUES (24, '4000-8000', '', 2, 0);
INSERT INTO `systemdictionaryitem` VALUES (25, '8000-12000', '', 2, 0);
INSERT INTO `systemdictionaryitem` VALUES (26, '12000以上', '', 2, 0);
INSERT INTO `systemdictionaryitem` VALUES (28, '报纸', '', 3, 0);
INSERT INTO `systemdictionaryitem` VALUES (29, '电台', '', 3, 0);
INSERT INTO `systemdictionaryitem` VALUES (30, '广播', '', 3, 0);
INSERT INTO `systemdictionaryitem` VALUES (31, '微博', '', 3, 0);
INSERT INTO `systemdictionaryitem` VALUES (32, '厨师', '', 1, 0);
INSERT INTO `systemdictionaryitem` VALUES (33, '电话沟通', '', 4, 0);
INSERT INTO `systemdictionaryitem` VALUES (34, '邀约上门', '', 4, 0);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT,
  `start` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mintaskdescribe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `minhandledescribe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `handleUser` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for vacate
-- ----------------------------
DROP TABLE IF EXISTS `vacate`;
CREATE TABLE `vacate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begintime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `audittime` datetime(0) NULL DEFAULT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `audit_id` bigint(20) NULL DEFAULT NULL,
  `state` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacate
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
