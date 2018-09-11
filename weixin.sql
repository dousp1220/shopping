/*
Navicat MySQL Data Transfer

Source Server         : dou
Source Server Version : 80003
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 80003
File Encoding         : 65001

Date: 2018-09-11 09:22:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_myuser
-- ----------------------------
DROP TABLE IF EXISTS `account_myuser`;
CREATE TABLE `account_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(32) NOT NULL,
  `nickName` varchar(32) NOT NULL,
  `header` varchar(256) NOT NULL,
  `city` longtext NOT NULL,
  `addDate` datetime(6) NOT NULL,
  `loginDate` datetime(6) DEFAULT NULL,
  `six` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_myuser
-- ----------------------------
INSERT INTO `account_myuser` VALUES ('1', 'o3q3W5dYuc0TKYnyn8sqMErUXl8I', 'Q', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWptmyDNgTCj95umOpL6zlUuaictgSa31K8SeOvTPcGNGiaQjB3MbtHLeyuoe3pcgVygNh3HCAXJNg/132', 'China:::Shanxi:::Luliang', '2018-09-04 16:13:23.000000', '2018-09-10 11:45:48.000000', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add my user', '7', 'add_myuser');
INSERT INTO `auth_permission` VALUES ('20', 'Can change my user', '7', 'change_myuser');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete my user', '7', 'delete_myuser');
INSERT INTO `auth_permission` VALUES ('22', 'Can add order from', '8', 'add_orderfrom');
INSERT INTO `auth_permission` VALUES ('23', 'Can change order from', '8', 'change_orderfrom');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete order from', '8', 'delete_orderfrom');
INSERT INTO `auth_permission` VALUES ('25', 'Can add product item', '9', 'add_productitem');
INSERT INTO `auth_permission` VALUES ('26', 'Can change product item', '9', 'change_productitem');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete product item', '9', 'delete_productitem');
INSERT INTO `auth_permission` VALUES ('28', 'Can add address', '10', 'add_address');
INSERT INTO `auth_permission` VALUES ('29', 'Can change address', '10', 'change_address');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete address', '10', 'delete_address');
INSERT INTO `auth_permission` VALUES ('31', 'Can add product type', '11', 'add_producttype');
INSERT INTO `auth_permission` VALUES ('32', 'Can change product type', '11', 'change_producttype');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete product type', '11', 'delete_producttype');
INSERT INTO `auth_permission` VALUES ('34', 'Can add shopping cart rela', '12', 'add_shoppingcartrela');
INSERT INTO `auth_permission` VALUES ('35', 'Can change shopping cart rela', '12', 'change_shoppingcartrela');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete shopping cart rela', '12', 'delete_shoppingcartrela');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$YRKxQyuDx8UC$7S9s7vbfT95PyAFH63Etn11g3Bd3XNUCqjl2djWBvAQ=', '2018-09-05 10:24:28.880000', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2018-09-04 15:54:30.230000');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$36000$CpPt54B0IrAZ$aL0l6vI7z3uXWNluqF8KB1miWTACpXzJLteN69lcHdI=', '2018-09-04 16:00:18.565000', '0', 'qiaozp123', '', '', '', '1', '1', '2018-09-04 15:56:47.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '2', '1');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '2', '2');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '2', '3');
INSERT INTO `auth_user_user_permissions` VALUES ('4', '2', '4');
INSERT INTO `auth_user_user_permissions` VALUES ('5', '2', '5');
INSERT INTO `auth_user_user_permissions` VALUES ('6', '2', '6');
INSERT INTO `auth_user_user_permissions` VALUES ('7', '2', '7');
INSERT INTO `auth_user_user_permissions` VALUES ('8', '2', '8');
INSERT INTO `auth_user_user_permissions` VALUES ('9', '2', '9');
INSERT INTO `auth_user_user_permissions` VALUES ('10', '2', '10');
INSERT INTO `auth_user_user_permissions` VALUES ('11', '2', '11');
INSERT INTO `auth_user_user_permissions` VALUES ('12', '2', '12');
INSERT INTO `auth_user_user_permissions` VALUES ('13', '2', '13');
INSERT INTO `auth_user_user_permissions` VALUES ('14', '2', '14');
INSERT INTO `auth_user_user_permissions` VALUES ('15', '2', '15');
INSERT INTO `auth_user_user_permissions` VALUES ('16', '2', '16');
INSERT INTO `auth_user_user_permissions` VALUES ('17', '2', '17');
INSERT INTO `auth_user_user_permissions` VALUES ('18', '2', '18');
INSERT INTO `auth_user_user_permissions` VALUES ('19', '2', '19');
INSERT INTO `auth_user_user_permissions` VALUES ('20', '2', '20');
INSERT INTO `auth_user_user_permissions` VALUES ('21', '2', '21');
INSERT INTO `auth_user_user_permissions` VALUES ('22', '2', '22');
INSERT INTO `auth_user_user_permissions` VALUES ('23', '2', '23');
INSERT INTO `auth_user_user_permissions` VALUES ('24', '2', '24');
INSERT INTO `auth_user_user_permissions` VALUES ('25', '2', '25');
INSERT INTO `auth_user_user_permissions` VALUES ('26', '2', '26');
INSERT INTO `auth_user_user_permissions` VALUES ('27', '2', '27');
INSERT INTO `auth_user_user_permissions` VALUES ('28', '2', '28');
INSERT INTO `auth_user_user_permissions` VALUES ('29', '2', '29');
INSERT INTO `auth_user_user_permissions` VALUES ('30', '2', '30');
INSERT INTO `auth_user_user_permissions` VALUES ('31', '2', '31');
INSERT INTO `auth_user_user_permissions` VALUES ('32', '2', '32');
INSERT INTO `auth_user_user_permissions` VALUES ('33', '2', '33');
INSERT INTO `auth_user_user_permissions` VALUES ('34', '2', '34');
INSERT INTO `auth_user_user_permissions` VALUES ('35', '2', '35');
INSERT INTO `auth_user_user_permissions` VALUES ('36', '2', '36');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-09-04 15:56:48.020000', '2', 'qiaozp123', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-09-04 15:59:43.581000', '2', 'qiaozp123', '2', '[{\"changed\": {\"fields\": [\"user_permissions\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-09-04 16:00:08.684000', '2', 'qiaozp123', '2', '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-09-04 17:24:46.147000', '5', '肉夹馍', '1', '[{\"added\": {}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('5', '2018-09-04 17:27:49.541000', '13', '炒货', '1', '[{\"added\": {}}]', '11', '2');
INSERT INTO `django_admin_log` VALUES ('6', '2018-09-04 17:29:55.320000', '6', '糖炒栗子', '1', '[{\"added\": {}}]', '9', '2');
INSERT INTO `django_admin_log` VALUES ('7', '2018-09-04 17:31:41.117000', '7', '瓜子酥', '1', '[{\"added\": {}}]', '9', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('7', 'account', 'myuser');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('10', 'shopping', 'address');
INSERT INTO `django_content_type` VALUES ('8', 'shopping', 'orderfrom');
INSERT INTO `django_content_type` VALUES ('9', 'shopping', 'productitem');
INSERT INTO `django_content_type` VALUES ('11', 'shopping', 'producttype');
INSERT INTO `django_content_type` VALUES ('12', 'shopping', 'shoppingcartrela');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'account', '0001_initial', '2018-09-04 15:45:39.641000');
INSERT INTO `django_migrations` VALUES ('2', 'account', '0002_auto_20180829_1650', '2018-09-04 15:45:39.971000');
INSERT INTO `django_migrations` VALUES ('3', 'account', '0003_auto_20180829_1659', '2018-09-04 15:45:41.102000');
INSERT INTO `django_migrations` VALUES ('4', 'account', '0004_auto_20180829_1729', '2018-09-04 15:45:42.443000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0001_initial', '2018-09-04 15:45:43.658000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0001_initial', '2018-09-04 15:46:02.196000');
INSERT INTO `django_migrations` VALUES ('7', 'admin', '0001_initial', '2018-09-04 15:46:06.283000');
INSERT INTO `django_migrations` VALUES ('8', 'admin', '0002_logentry_remove_auto_add', '2018-09-04 15:46:07.065000');
INSERT INTO `django_migrations` VALUES ('9', 'contenttypes', '0002_remove_content_type_name', '2018-09-04 15:46:12.165000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0002_alter_permission_name_max_length', '2018-09-04 15:46:13.909000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0003_alter_user_email_max_length', '2018-09-04 15:46:15.817000');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0004_alter_user_username_opts', '2018-09-04 15:46:15.926000');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0005_alter_user_last_login_null', '2018-09-04 15:46:17.712000');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0006_require_contenttypes_0002', '2018-09-04 15:46:17.804000');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0007_alter_validators_add_error_messages', '2018-09-04 15:46:17.926000');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0008_alter_user_username_max_length', '2018-09-04 15:46:19.977000');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2018-09-04 15:46:20.997000');
INSERT INTO `django_migrations` VALUES ('18', 'shopping', '0001_initial', '2018-09-04 15:46:36.526000');
INSERT INTO `django_migrations` VALUES ('19', 'shopping', '0002_shoppingcartrela_user', '2018-09-04 15:53:21.762000');
INSERT INTO `django_migrations` VALUES ('20', 'shopping', '0003_auto_20180904_1713', '2018-09-04 17:13:38.538000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('90bjbx2v11o5nsg05xquetjj6czkqd9j', 'YmYzZmM1ZGNmZDUzNWYyZWI2MmRhZGFhYmRiMWY1Mjk2MGQ3MzQ5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOWM1ZWRhZWIzYmZjZTUxNGRiZjY1MWM3YjdmNjQyODI4ZmRiYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-18 15:59:26.991000');
INSERT INTO `django_session` VALUES ('ompzn1252xwok0vgnima38rg9tiqr9v6', 'YmYzZmM1ZGNmZDUzNWYyZWI2MmRhZGFhYmRiMWY1Mjk2MGQ3MzQ5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOWM1ZWRhZWIzYmZjZTUxNGRiZjY1MWM3YjdmNjQyODI4ZmRiYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-19 10:24:28.944000');
INSERT INTO `django_session` VALUES ('zogfuhzz25clvtutthlu6tlpulf2yh9z', 'Njk3ZjEwY2Q0Yjc0NTE3ZmMxMGU2OWZlMzAyMDBlMjdkOWY5N2NlNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmZjU3YmFkMjU5ZTY3YzhiNDgzYmI4NDcwZTk2NmMwN2M0MDIxMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-09-18 16:00:18.699000');
INSERT INTO `django_session` VALUES ('zr56ubfi4yna4et3qt5f8hzqj16mdq8a', 'YmYzZmM1ZGNmZDUzNWYyZWI2MmRhZGFhYmRiMWY1Mjk2MGQ3MzQ5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOWM1ZWRhZWIzYmZjZTUxNGRiZjY1MWM3YjdmNjQyODI4ZmRiYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-18 15:54:57.300000');

-- ----------------------------
-- Table structure for shopping_address
-- ----------------------------
DROP TABLE IF EXISTS `shopping_address`;
CREATE TABLE `shopping_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `addrDetail` varchar(256) NOT NULL,
  `isDefault` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_address_user_id_91492b56_fk_account_myuser_id` (`user_id`),
  CONSTRAINT `shopping_address_user_id_91492b56_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_address
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_orderfrom
-- ----------------------------
DROP TABLE IF EXISTS `shopping_orderfrom`;
CREATE TABLE `shopping_orderfrom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderState` int(11) NOT NULL,
  `orderDateTime` datetime(6) DEFAULT NULL,
  `stateLog` longtext NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `remarks` longtext,
  `realDiscount` decimal(10,2) NOT NULL,
  `orderDetail` longtext NOT NULL,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_orderfrom_address_id_397b6b37_fk_shopping_address_id` (`address_id`),
  KEY `shopping_orderfrom_user_id_f3f705be_fk_account_myuser_id` (`user_id`),
  CONSTRAINT `shopping_orderfrom_address_id_397b6b37_fk_shopping_address_id` FOREIGN KEY (`address_id`) REFERENCES `shopping_address` (`id`),
  CONSTRAINT `shopping_orderfrom_user_id_f3f705be_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_orderfrom
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_productitem
-- ----------------------------
DROP TABLE IF EXISTS `shopping_productitem`;
CREATE TABLE `shopping_productitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(32) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imgHeight` int(10) unsigned NOT NULL,
  `imgWidth` int(10) unsigned NOT NULL,
  `productImage` varchar(100) NOT NULL,
  `desc` longtext,
  `isSpecialPrice` tinyint(1) NOT NULL,
  `newPrice` decimal(10,2) NOT NULL,
  `productType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_productitem_productType_id_a4b567e1_fk_shopping_` (`productType_id`),
  CONSTRAINT `shopping_productitem_productType_id_a4b567e1_fk_shopping_` FOREIGN KEY (`productType_id`) REFERENCES `shopping_producttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_productitem
-- ----------------------------
INSERT INTO `shopping_productitem` VALUES ('2', '苹果', '33.00', '206', '238', 'images/apple.png', '苹果可好吃了', '1', '22.00', '2');
INSERT INTO `shopping_productitem` VALUES ('3', '羊肉泡馍', '28.00', '340', '500', 'images/u39807377292085750781fm26gp0.jpg', '羊肉泡馍', '0', '28.00', '3');
INSERT INTO `shopping_productitem` VALUES ('4', '方便面', '2.00', '299', '418', 'images/fangbianm.png', '好吃不贵，经济实惠', '0', '2.00', '4');
INSERT INTO `shopping_productitem` VALUES ('5', '肉夹馍', '9.00', '350', '550', 'images/timg.jpg', '肉夹馍贵的都快吃不起了', '1', '12.00', '2');
INSERT INTO `shopping_productitem` VALUES ('6', '糖炒栗子', '16.00', '216', '288', 'images/1308679722966.jpg288w_216h_99q_1e_1c.jpg', '好吃不贵', '0', '18.00', '13');
INSERT INTO `shopping_productitem` VALUES ('7', '瓜子酥', '9.00', '640', '640', 'images/86e7668c88c411e6b87c0242ac110003_640w_640h.jpg', '恩恩，还不错', '0', '10.00', '13');

-- ----------------------------
-- Table structure for shopping_producttype
-- ----------------------------
DROP TABLE IF EXISTS `shopping_producttype`;
CREATE TABLE `shopping_producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortIndex` int(11) NOT NULL,
  `typeName` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_producttype
-- ----------------------------
INSERT INTO `shopping_producttype` VALUES ('2', '2', '小吃');
INSERT INTO `shopping_producttype` VALUES ('3', '3', '干果');
INSERT INTO `shopping_producttype` VALUES ('4', '4', '饮品冲剂');
INSERT INTO `shopping_producttype` VALUES ('5', '5', '豆制品');
INSERT INTO `shopping_producttype` VALUES ('6', '6', '海鲜制品');
INSERT INTO `shopping_producttype` VALUES ('7', '7', '肉类制品');
INSERT INTO `shopping_producttype` VALUES ('8', '8', '巧克力');
INSERT INTO `shopping_producttype` VALUES ('9', '9', '面包');
INSERT INTO `shopping_producttype` VALUES ('10', '10', '膨化食品');
INSERT INTO `shopping_producttype` VALUES ('11', '11', '果冻');
INSERT INTO `shopping_producttype` VALUES ('12', '12', '口香糖');
INSERT INTO `shopping_producttype` VALUES ('13', '1', '炒货');

-- ----------------------------
-- Table structure for shopping_shoppingcartrela
-- ----------------------------
DROP TABLE IF EXISTS `shopping_shoppingcartrela`;
CREATE TABLE `shopping_shoppingcartrela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(10) unsigned NOT NULL,
  `productItem_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_shoppingcar_productItem_id_83f6f390_fk_shopping_` (`productItem_id`),
  KEY `shopping_shoppingcartrela_user_id_705594da_fk_account_myuser_id` (`user_id`),
  CONSTRAINT `shopping_shoppingcar_productItem_id_83f6f390_fk_shopping_` FOREIGN KEY (`productItem_id`) REFERENCES `shopping_productitem` (`id`),
  CONSTRAINT `shopping_shoppingcartrela_user_id_705594da_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_shoppingcartrela
-- ----------------------------
INSERT INTO `shopping_shoppingcartrela` VALUES ('4', '4', '5', '1');
INSERT INTO `shopping_shoppingcartrela` VALUES ('5', '4', '7', '1');
INSERT INTO `shopping_shoppingcartrela` VALUES ('6', '16', '2', '1');
INSERT INTO `shopping_shoppingcartrela` VALUES ('7', '33', '6', '1');
