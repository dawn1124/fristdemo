/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : db_lc

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-05-16 16:17:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_slrad_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_auth`;
CREATE TABLE `tbl_slrad_auth` (
  `uid` varchar(50) NOT NULL,
  `utype` char(1) NOT NULL,
  `pid` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`,`utype`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slrad_auth
-- ----------------------------
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_1');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_11');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_111');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_112');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_113');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_12');
INSERT INTO `tbl_slrad_auth` VALUES ('admin', '1', 'eie_2');
INSERT INTO `tbl_slrad_auth` VALUES ('zhangsan', '1', 'eie_1');
INSERT INTO `tbl_slrad_auth` VALUES ('zhangsan', '1', 'eie_2');
INSERT INTO `tbl_slrad_auth` VALUES ('zhangsan', '1', 'eie_21');

-- ----------------------------
-- Table structure for `tbl_slrad_perm_map`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_perm_map`;
CREATE TABLE `tbl_slrad_perm_map` (
  `pid` varchar(50) NOT NULL,
  `service_view` varchar(100) NOT NULL,
  `explain` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`,`service_view`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slrad_perm_map
-- ----------------------------
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'hello.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'login.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'RoleService.listOption', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'UserService.getById', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'UserService.login', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'UserService.welcomeFwd', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('default', 'welcome_fwd.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_11', 'userlist.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_11', 'UserService.list', '用户列表');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_111', 'addUser.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_111', 'UserService.create', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_112', 'editUser.jsp', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_112', 'UserService.update', ' ');
INSERT INTO `tbl_slrad_perm_map` VALUES ('eie_113', 'UserService.delete', ' ');

-- ----------------------------
-- Table structure for `tbl_slrad_perm_res`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_perm_res`;
CREATE TABLE `tbl_slrad_perm_res` (
  `pid` varchar(50) NOT NULL,
  `parent_id` varchar(50) NOT NULL,
  `item_type` char(1) NOT NULL,
  `explain` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slrad_perm_res
-- ----------------------------
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_1', '', '1', '用户管理');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_11', 'eie_1', '2', '用户列表');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_111', 'eie_11', '3', '新增用户');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_112', 'eie_11', '3', '修改用户');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_113', 'eie_11', '3', '删除用户');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_12', 'eie_2', '2', '机密');
INSERT INTO `tbl_slrad_perm_res` VALUES ('eie_2', '', '1', '机密2');

-- ----------------------------
-- Table structure for `tbl_slrad_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_role`;
CREATE TABLE `tbl_slrad_role` (
  `role_id` varchar(50) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slrad_role
-- ----------------------------
INSERT INTO `tbl_slrad_role` VALUES ('sys_admin', '系统管理员');
INSERT INTO `tbl_slrad_role` VALUES ('sys_user', '普通用户');

-- ----------------------------
-- Table structure for `tbl_slrad_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_user`;
CREATE TABLE `tbl_slrad_user` (
  `user_id` varchar(50) NOT NULL COMMENT '账号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `role` varchar(50) DEFAULT NULL COMMENT '引用tbl_slrad_role 表的role_id字段',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_slrad_user
-- ----------------------------
INSERT INTO `tbl_slrad_user` VALUES ('admin', '系统管理员', '4a1e233b1c3419', '18375310410', 'sys_admin', null);
INSERT INTO `tbl_slrad_user` VALUES ('admin1', '流程', '4e1a3f1f203015', '18375310514', 'sys_admin', null);
INSERT INTO `tbl_slrad_user` VALUES ('admin2', '123456', '2f05441a3d173e', '18375310410', 'sys_user', null);
INSERT INTO `tbl_slrad_user` VALUES ('zhangsan', '张三', '4a1e233b1c3419', '18375310412', 'sys_user', null);

-- ----------------------------
-- Table structure for `tbl_slrad_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slrad_user_role`;
CREATE TABLE `tbl_slrad_user_role` (
  `user_id` varchar(50) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slrad_user_role
-- ----------------------------
INSERT INTO `tbl_slrad_user_role` VALUES ('admin', 'sys_admin');
INSERT INTO `tbl_slrad_user_role` VALUES ('admin1', 'sys_admin');
INSERT INTO `tbl_slrad_user_role` VALUES ('admin2', 'sys_user');
INSERT INTO `tbl_slrad_user_role` VALUES ('zhangsan', 'sys_user');
