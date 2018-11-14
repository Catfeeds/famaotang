/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : famaotangdb

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-10 16:55:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fw_adinfo
-- ----------------------------
DROP TABLE IF EXISTS `fw_adinfo`;
CREATE TABLE `fw_adinfo` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_unitcode` varchar(32) DEFAULT NULL,
  `ad_group` int(11) DEFAULT '0' COMMENT '海报分组',
  `ad_name` varchar(64) DEFAULT NULL,
  `ad_des` varchar(256) DEFAULT NULL,
  `ad_pic` varchar(32) DEFAULT NULL,
  `ad_url` varchar(128) DEFAULT NULL,
  `ad_addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='海报设置';

-- ----------------------------
-- Records of fw_adinfo
-- ----------------------------

-- ----------------------------
-- Table structure for fw_applogin
-- ----------------------------
DROP TABLE IF EXISTS `fw_applogin`;
CREATE TABLE `fw_applogin` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT,
  `lg_unitcode` varchar(32) DEFAULT NULL,
  `lg_userid` int(11) DEFAULT NULL,
  `lg_username` varchar(64) DEFAULT NULL,
  `lg_token` varchar(64) DEFAULT NULL,
  `lg_imei` varchar(32) DEFAULT NULL,
  `lg_time` int(11) DEFAULT NULL,
  `lg_ip` varchar(32) DEFAULT NULL,
  `lg_useragent` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`lg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='app出货登录状态';

-- ----------------------------
-- Records of fw_applogin
-- ----------------------------

-- ----------------------------
-- Table structure for fw_applydltype
-- ----------------------------
DROP TABLE IF EXISTS `fw_applydltype`;
CREATE TABLE `fw_applydltype` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_unitcode` varchar(32) DEFAULT NULL,
  `apply_dlid` int(11) DEFAULT '0' COMMENT '申请代理id',
  `apply_agobelong` int(11) DEFAULT '0' COMMENT '申请前上家',
  `apply_agodltype` int(11) DEFAULT '0' COMMENT '申请前级别',
  `apply_afterbelong` int(11) DEFAULT '0' COMMENT '申请后的上家',
  `apply_afterdltype` int(11) DEFAULT '0' COMMENT '申请的级别',
  `apply_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  `apply_addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `apply_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `apply_remark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `apply_state` int(11) DEFAULT '0' COMMENT '处理状态',
  PRIMARY KEY (`apply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代理申请调整级别';

-- ----------------------------
-- Records of fw_applydltype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_balance
-- ----------------------------
DROP TABLE IF EXISTS `fw_balance`;
CREATE TABLE `fw_balance` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT,
  `bl_unitcode` varchar(32) DEFAULT NULL,
  `bl_type` int(11) DEFAULT '0' COMMENT '余额类型',
  `bl_sendid` int(11) DEFAULT '0' COMMENT '发款方id',
  `bl_receiveid` int(11) DEFAULT '0' COMMENT '收款方id',
  `bl_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `bl_odid` int(11) DEFAULT '0' COMMENT '订单id',
  `bl_orderid` varchar(32) DEFAULT NULL COMMENT '订单号',
  `bl_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `bl_addtime` int(11) DEFAULT '0',
  `bl_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `bl_state` int(11) DEFAULT '0' COMMENT '状态',
  `bl_rcid` int(11) DEFAULT '0' COMMENT '对应提现id',
  `bl_isyfk` int(11) DEFAULT '0' COMMENT '预付款支付订单款项',
  `bl_dltype` int(11) DEFAULT '0' COMMENT '充值时的代理级别',
  PRIMARY KEY (`bl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代理商余额明细表';

-- ----------------------------
-- Records of fw_balance
-- ----------------------------

-- ----------------------------
-- Table structure for fw_batch
-- ----------------------------
DROP TABLE IF EXISTS `fw_batch`;
CREATE TABLE `fw_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `codebegin` int(11) DEFAULT NULL,
  `codeend` int(11) DEFAULT NULL,
  `voice` varchar(256) DEFAULT NULL,
  `smsnote` varchar(500) DEFAULT NULL,
  `resmsnote` varchar(500) DEFAULT NULL,
  `errsmsnote` varchar(500) DEFAULT NULL,
  `oversmsnote` varchar(500) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `unitcode` (`unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='码分批处理';

-- ----------------------------
-- Records of fw_batch
-- ----------------------------

-- ----------------------------
-- Table structure for fw_brand
-- ----------------------------
DROP TABLE IF EXISTS `fw_brand`;
CREATE TABLE `fw_brand` (
  `br_id` int(11) NOT NULL AUTO_INCREMENT,
  `br_unitcode` varchar(32) DEFAULT NULL,
  `br_name` varchar(64) DEFAULT NULL,
  `br_pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`br_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='授权品牌';

-- ----------------------------
-- Records of fw_brand
-- ----------------------------

-- ----------------------------
-- Table structure for fw_brandattorney
-- ----------------------------
DROP TABLE IF EXISTS `fw_brandattorney`;
CREATE TABLE `fw_brandattorney` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT,
  `ba_unitcode` varchar(32) DEFAULT NULL,
  `ba_brandid` int(11) DEFAULT NULL,
  `ba_dealerid` int(11) DEFAULT NULL,
  `ba_pic` varchar(64) DEFAULT NULL,
  `ba_level` int(11) DEFAULT '0' COMMENT '代理级别',
  PRIMARY KEY (`ba_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='品牌授权图片';

-- ----------------------------
-- Records of fw_brandattorney
-- ----------------------------

-- ----------------------------
-- Table structure for fw_chaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_chaibox`;
CREATE TABLE `fw_chaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_deliver` int(11) DEFAULT '0',
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拆箱记录';

-- ----------------------------
-- Records of fw_chaibox
-- ----------------------------

-- ----------------------------
-- Table structure for fw_code
-- ----------------------------
DROP TABLE IF EXISTS `fw_code`;
CREATE TABLE `fw_code` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `codea` varchar(32) DEFAULT NULL,
  `codeb` varchar(32) DEFAULT NULL,
  `codec` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=4017524 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_code
-- ----------------------------
INSERT INTO `fw_code` VALUES ('4015208', '3183', '1', '7710', '3866', '7189');
INSERT INTO `fw_code` VALUES ('4015209', '3183', '2', '8631', '1465', '3931');
INSERT INTO `fw_code` VALUES ('4015210', '3183', '3', '7670', '2858', '7350');
INSERT INTO `fw_code` VALUES ('4015211', '3183', '4', '6281', '9315', '6734');
INSERT INTO `fw_code` VALUES ('4015212', '3183', '5', '6428', '9056', '5082');
INSERT INTO `fw_code` VALUES ('4015213', '3183', '6', '5894', '5386', '2538');
INSERT INTO `fw_code` VALUES ('4015214', '3183', '7', '2970', '8557', '2957');
INSERT INTO `fw_code` VALUES ('4015215', '3183', '8', '6454', '5775', '3913');
INSERT INTO `fw_code` VALUES ('4015216', '3183', '9', '8311', '5263', '8404');
INSERT INTO `fw_code` VALUES ('4015217', '3183', '10', '6322', '0322', '6573');
INSERT INTO `fw_code` VALUES ('4015218', '3183', '11', '1434', '5271', '3993');
INSERT INTO `fw_code` VALUES ('4015219', '3183', '12', '7136', '9188', '4806');
INSERT INTO `fw_code` VALUES ('4015220', '3183', '13', '3357', '2485', '7154');
INSERT INTO `fw_code` VALUES ('4015221', '3183', '14', '9913', '6275', '6038');
INSERT INTO `fw_code` VALUES ('4015222', '3183', '15', '0406', '8938', '8743');
INSERT INTO `fw_code` VALUES ('4015223', '3183', '16', '0981', '3616', '1127');
INSERT INTO `fw_code` VALUES ('4015224', '3183', '17', '8911', '6660', '9618');
INSERT INTO `fw_code` VALUES ('4015225', '3183', '18', '6668', '3243', '0931');
INSERT INTO `fw_code` VALUES ('4015226', '3183', '19', '2543', '3620', '8922');
INSERT INTO `fw_code` VALUES ('4015227', '3183', '20', '7990', '9061', '2877');
INSERT INTO `fw_code` VALUES ('4015228', '3183', '21', '7629', '1850', '7511');
INSERT INTO `fw_code` VALUES ('4015229', '3183', '22', '3931', '7164', '9538');
INSERT INTO `fw_code` VALUES ('4015230', '3183', '23', '7843', '9319', '4529');
INSERT INTO `fw_code` VALUES ('4015231', '3183', '24', '8163', '5521', '0056');
INSERT INTO `fw_code` VALUES ('4015232', '3183', '25', '6856', '3993', '9118');
INSERT INTO `fw_code` VALUES ('4015233', '3183', '26', '4358', '2100', '3574');
INSERT INTO `fw_code` VALUES ('4015234', '3183', '27', '3651', '1969', '3850');
INSERT INTO `fw_code` VALUES ('4015235', '3183', '28', '8845', '8934', '0948');
INSERT INTO `fw_code` VALUES ('4015236', '3183', '29', '1902', '1215', '7868');
INSERT INTO `fw_code` VALUES ('4015237', '3183', '30', '7950', '8053', '3038');
INSERT INTO `fw_code` VALUES ('4015238', '3183', '31', '5279', '9700', '0315');
INSERT INTO `fw_code` VALUES ('4015239', '3183', '32', '2690', '3362', '7270');
INSERT INTO `fw_code` VALUES ('4015240', '3183', '33', '7456', '5390', '0332');
INSERT INTO `fw_code` VALUES ('4015241', '3183', '34', '2049', '0957', '6216');
INSERT INTO `fw_code` VALUES ('4015242', '3183', '35', '7416', '4382', '0493');
INSERT INTO `fw_code` VALUES ('4015243', '3183', '36', '9699', '8807', '9020');
INSERT INTO `fw_code` VALUES ('4015244', '3183', '37', '6174', '0580', '8225');
INSERT INTO `fw_code` VALUES ('4015245', '3183', '38', '1968', '8942', '6538');
INSERT INTO `fw_code` VALUES ('4015246', '3183', '39', '2716', '0081', '6100');
INSERT INTO `fw_code` VALUES ('4015247', '3183', '40', '9872', '5267', '6199');
INSERT INTO `fw_code` VALUES ('4015248', '3183', '41', '8057', '6787', '1547');
INSERT INTO `fw_code` VALUES ('4015249', '3183', '42', '2395', '3878', '0574');
INSERT INTO `fw_code` VALUES ('4015250', '3183', '43', '8524', '2731', '5422');
INSERT INTO `fw_code` VALUES ('4015251', '3183', '44', '0554', '8680', '7091');
INSERT INTO `fw_code` VALUES ('4015252', '3183', '45', '0447', '9945', '8582');
INSERT INTO `fw_code` VALUES ('4015253', '3183', '46', '3331', '5767', '8323');
INSERT INTO `fw_code` VALUES ('4015254', '3183', '47', '7497', '6398', '0172');
INSERT INTO `fw_code` VALUES ('4015255', '3183', '48', '4399', '3108', '3413');
INSERT INTO `fw_code` VALUES ('4015256', '3183', '49', '6001', '4120', '1047');
INSERT INTO `fw_code` VALUES ('4015257', '3183', '50', '0086', '2735', '3216');
INSERT INTO `fw_code` VALUES ('4015258', '3183', '51', '2289', '5144', '2065');
INSERT INTO `fw_code` VALUES ('4015259', '3183', '52', '1408', '8553', '5163');
INSERT INTO `fw_code` VALUES ('4015260', '3183', '53', '4719', '9310', '8939');
INSERT INTO `fw_code` VALUES ('4015261', '3183', '54', '7349', '6656', '1824');
INSERT INTO `fw_code` VALUES ('4015262', '3183', '55', '4933', '6779', '5957');
INSERT INTO `fw_code` VALUES ('4015263', '3183', '56', '1581', '5013', '2341');
INSERT INTO `fw_code` VALUES ('4015264', '3183', '57', '6602', '5517', '2261');
INSERT INTO `fw_code` VALUES ('4015265', '3183', '58', '7777', '1592', '5859');
INSERT INTO `fw_code` VALUES ('4015266', '3183', '59', '3397', '3493', '6993');
INSERT INTO `fw_code` VALUES ('4015267', '3183', '60', '2263', '8426', '3234');
INSERT INTO `fw_code` VALUES ('4015268', '3183', '61', '1648', '2739', '1011');
INSERT INTO `fw_code` VALUES ('4015269', '3183', '62', '1368', '7545', '5324');
INSERT INTO `fw_code` VALUES ('4015270', '3183', '63', '2369', '7160', '1743');
INSERT INTO `fw_code` VALUES ('4015271', '3183', '64', '6108', '2854', '9556');
INSERT INTO `fw_code` VALUES ('4015272', '3183', '65', '7202', '6914', '3475');
INSERT INTO `fw_code` VALUES ('4015273', '3183', '66', '5467', '0449', '8502');
INSERT INTO `fw_code` VALUES ('4015274', '3183', '67', '4506', '1842', '1922');
INSERT INTO `fw_code` VALUES ('4015275', '3183', '68', '4364', '0810', '5023');
INSERT INTO `fw_code` VALUES ('4015276', '3183', '69', '7167', '4615', '5085');
INSERT INTO `fw_code` VALUES ('4015277', '3183', '70', '6633', '0945', '2541');
INSERT INTO `fw_code` VALUES ('4015278', '3183', '71', '1052', '0052', '1246');
INSERT INTO `fw_code` VALUES ('4015279', '3183', '72', '4537', '7270', '2201');
INSERT INTO `fw_code` VALUES ('4015280', '3183', '73', '6393', '6758', '6692');
INSERT INTO `fw_code` VALUES ('4015281', '3183', '74', '7060', '5881', '6576');
INSERT INTO `fw_code` VALUES ('4015282', '3183', '75', '9516', '6766', '2282');
INSERT INTO `fw_code` VALUES ('4015283', '3183', '76', '5218', '0683', '3094');
INSERT INTO `fw_code` VALUES ('4015284', '3183', '77', '1439', '3980', '5442');
INSERT INTO `fw_code` VALUES ('4015285', '3183', '78', '7995', '7770', '4326');
INSERT INTO `fw_code` VALUES ('4015286', '3183', '79', '8489', '0433', '7032');
INSERT INTO `fw_code` VALUES ('4015287', '3183', '80', '1719', '9175', '1130');
INSERT INTO `fw_code` VALUES ('4015288', '3183', '81', '6993', '8155', '7907');
INSERT INTO `fw_code` VALUES ('4015289', '3183', '82', '4750', '4738', '9219');
INSERT INTO `fw_code` VALUES ('4015290', '3183', '83', '0625', '5115', '7210');
INSERT INTO `fw_code` VALUES ('4015291', '3183', '84', '6073', '0556', '1165');
INSERT INTO `fw_code` VALUES ('4015292', '3183', '85', '5712', '3345', '5800');
INSERT INTO `fw_code` VALUES ('4015293', '3183', '86', '2014', '8659', '7826');
INSERT INTO `fw_code` VALUES ('4015294', '3183', '87', '5925', '0814', '2817');
INSERT INTO `fw_code` VALUES ('4015295', '3183', '88', '6246', '7016', '8344');
INSERT INTO `fw_code` VALUES ('4015296', '3183', '89', '7594', '9552', '9121');
INSERT INTO `fw_code` VALUES ('4015297', '3183', '90', '2441', '3595', '1862');
INSERT INTO `fw_code` VALUES ('4015298', '3183', '91', '4389', '7528', '3853');
INSERT INTO `fw_code` VALUES ('4015299', '3183', '92', '6927', '0429', '9237');
INSERT INTO `fw_code` VALUES ('4015300', '3183', '93', '9984', '2710', '6157');
INSERT INTO `fw_code` VALUES ('4015301', '3183', '94', '6032', '9548', '1326');
INSERT INTO `fw_code` VALUES ('4015302', '3183', '95', '3362', '1195', '8603');
INSERT INTO `fw_code` VALUES ('4015303', '3183', '96', '3428', '8921', '7273');
INSERT INTO `fw_code` VALUES ('4015304', '3183', '97', '5538', '6885', '8621');
INSERT INTO `fw_code` VALUES ('4015305', '3183', '98', '2787', '6516', '6219');
INSERT INTO `fw_code` VALUES ('4015306', '3183', '99', '5498', '5877', '8782');
INSERT INTO `fw_code` VALUES ('4015307', '3183', '100', '7782', '0302', '7308');
INSERT INTO `fw_code` VALUES ('4015308', '3183', '101', '4257', '2075', '6514');
INSERT INTO `fw_code` VALUES ('4015309', '3183', '102', '0051', '0437', '4826');
INSERT INTO `fw_code` VALUES ('4015310', '3183', '103', '0798', '1576', '4389');
INSERT INTO `fw_code` VALUES ('4015311', '3183', '104', '7955', '6762', '4487');
INSERT INTO `fw_code` VALUES ('4015312', '3183', '105', '6139', '8282', '9835');
INSERT INTO `fw_code` VALUES ('4015313', '3183', '106', '0478', '5373', '8862');
INSERT INTO `fw_code` VALUES ('4015314', '3183', '107', '6607', '4226', '3710');
INSERT INTO `fw_code` VALUES ('4015315', '3183', '108', '8636', '0175', '5380');
INSERT INTO `fw_code` VALUES ('4015316', '3183', '109', '8529', '1440', '6871');
INSERT INTO `fw_code` VALUES ('4015317', '3183', '110', '4069', '1326', '8326');
INSERT INTO `fw_code` VALUES ('4015318', '3183', '111', '8235', '1957', '0175');
INSERT INTO `fw_code` VALUES ('4015319', '3183', '112', '5137', '8667', '3416');
INSERT INTO `fw_code` VALUES ('4015320', '3183', '113', '6739', '9679', '1050');
INSERT INTO `fw_code` VALUES ('4015321', '3183', '114', '8168', '4230', '1505');
INSERT INTO `fw_code` VALUES ('4015322', '3183', '115', '0371', '6639', '0353');
INSERT INTO `fw_code` VALUES ('4015323', '3183', '116', '2146', '4111', '5166');
INSERT INTO `fw_code` VALUES ('4015324', '3183', '117', '5458', '4869', '8943');
INSERT INTO `fw_code` VALUES ('4015325', '3183', '118', '5432', '8151', '0112');
INSERT INTO `fw_code` VALUES ('4015326', '3183', '119', '5671', '2338', '5960');
INSERT INTO `fw_code` VALUES ('4015327', '3183', '120', '9664', '6508', '0630');
INSERT INTO `fw_code` VALUES ('4015328', '3183', '121', '4684', '7012', '0549');
INSERT INTO `fw_code` VALUES ('4015329', '3183', '122', '5859', '3087', '4148');
INSERT INTO `fw_code` VALUES ('4015330', '3183', '123', '1480', '4988', '5282');
INSERT INTO `fw_code` VALUES ('4015331', '3183', '124', '3001', '3984', '3237');
INSERT INTO `fw_code` VALUES ('4015332', '3183', '125', '9730', '4234', '9300');
INSERT INTO `fw_code` VALUES ('4015333', '3183', '126', '9450', '9040', '3612');
INSERT INTO `fw_code` VALUES ('4015334', '3183', '127', '3108', '2719', '1746');
INSERT INTO `fw_code` VALUES ('4015335', '3183', '128', '6846', '8413', '9559');
INSERT INTO `fw_code` VALUES ('4015336', '3183', '129', '5284', '8409', '1764');
INSERT INTO `fw_code` VALUES ('4015337', '3183', '130', '6205', '6008', '8505');
INSERT INTO `fw_code` VALUES ('4015338', '3183', '131', '5244', '7401', '1925');
INSERT INTO `fw_code` VALUES ('4015339', '3183', '132', '3855', '3857', '1309');
INSERT INTO `fw_code` VALUES ('4015340', '3183', '133', '4003', '3599', '9657');
INSERT INTO `fw_code` VALUES ('4015341', '3183', '134', '3469', '9929', '7112');
INSERT INTO `fw_code` VALUES ('4015342', '3183', '135', '7888', '9036', '5817');
INSERT INTO `fw_code` VALUES ('4015343', '3183', '136', '1373', '6254', '6773');
INSERT INTO `fw_code` VALUES ('4015344', '3183', '137', '5885', '9806', '2978');
INSERT INTO `fw_code` VALUES ('4015345', '3183', '138', '3896', '4865', '1148');
INSERT INTO `fw_code` VALUES ('4015346', '3183', '139', '6353', '5750', '6853');
INSERT INTO `fw_code` VALUES ('4015347', '3183', '140', '4710', '3730', '9380');
INSERT INTO `fw_code` VALUES ('4015348', '3183', '141', '8275', '2964', '0014');
INSERT INTO `fw_code` VALUES ('4015349', '3183', '142', '7487', '0818', '0612');
INSERT INTO `fw_code` VALUES ('4015350', '3183', '143', '5325', '9417', '1603');
INSERT INTO `fw_code` VALUES ('4015351', '3183', '144', '8555', '8159', '5701');
INSERT INTO `fw_code` VALUES ('4015352', '3183', '145', '3829', '7139', '2478');
INSERT INTO `fw_code` VALUES ('4015353', '3183', '146', '1586', '3722', '3791');
INSERT INTO `fw_code` VALUES ('4015354', '3183', '147', '7461', '4099', '1782');
INSERT INTO `fw_code` VALUES ('4015355', '3183', '148', '5564', '3603', '7451');
INSERT INTO `fw_code` VALUES ('4015356', '3183', '149', '2548', '2329', '0371');
INSERT INTO `fw_code` VALUES ('4015357', '3183', '150', '8850', '7643', '2398');
INSERT INTO `fw_code` VALUES ('4015358', '3183', '151', '2761', '9798', '7389');
INSERT INTO `fw_code` VALUES ('4015359', '3183', '152', '3082', '6000', '2915');
INSERT INTO `fw_code` VALUES ('4015360', '3183', '153', '4430', '8536', '3692');
INSERT INTO `fw_code` VALUES ('4015361', '3183', '154', '1933', '6643', '8148');
INSERT INTO `fw_code` VALUES ('4015362', '3183', '155', '1225', '6512', '8425');
INSERT INTO `fw_code` VALUES ('4015363', '3183', '156', '6419', '3476', '5523');
INSERT INTO `fw_code` VALUES ('4015364', '3183', '157', '6820', '1694', '0728');
INSERT INTO `fw_code` VALUES ('4015365', '3183', '158', '2868', '8532', '5898');
INSERT INTO `fw_code` VALUES ('4015366', '3183', '159', '0198', '0179', '3174');
INSERT INTO `fw_code` VALUES ('4015367', '3183', '160', '0264', '7905', '1844');
INSERT INTO `fw_code` VALUES ('4015368', '3183', '161', '5030', '9933', '4907');
INSERT INTO `fw_code` VALUES ('4015369', '3183', '162', '9623', '5500', '0791');
INSERT INTO `fw_code` VALUES ('4015370', '3183', '163', '2334', '4861', '3353');
INSERT INTO `fw_code` VALUES ('4015371', '3183', '164', '7273', '3349', '3594');
INSERT INTO `fw_code` VALUES ('4015372', '3183', '165', '3749', '5123', '2800');
INSERT INTO `fw_code` VALUES ('4015373', '3183', '166', '6887', '9421', '9398');
INSERT INTO `fw_code` VALUES ('4015374', '3183', '167', '7634', '0560', '8960');
INSERT INTO `fw_code` VALUES ('4015375', '3183', '168', '4791', '5746', '9058');
INSERT INTO `fw_code` VALUES ('4015376', '3183', '169', '2975', '7266', '4407');
INSERT INTO `fw_code` VALUES ('4015377', '3183', '170', '7314', '4357', '3433');
INSERT INTO `fw_code` VALUES ('4015378', '3183', '171', '6098', '7274', '9996');
INSERT INTO `fw_code` VALUES ('4015379', '3183', '172', '8128', '3223', '1666');
INSERT INTO `fw_code` VALUES ('4015380', '3183', '173', '8021', '4488', '3157');
INSERT INTO `fw_code` VALUES ('4015381', '3183', '174', '7166', '2777', '1747');
INSERT INTO `fw_code` VALUES ('4015382', '3183', '175', '1332', '3408', '3595');
INSERT INTO `fw_code` VALUES ('4015383', '3183', '176', '8234', '0118', '6836');
INSERT INTO `fw_code` VALUES ('4015384', '3183', '177', '9836', '1130', '4470');
INSERT INTO `fw_code` VALUES ('4015385', '3183', '178', '1265', '5681', '4925');
INSERT INTO `fw_code` VALUES ('4015386', '3183', '179', '3468', '8090', '3773');
INSERT INTO `fw_code` VALUES ('4015387', '3183', '180', '5243', '5563', '8586');
INSERT INTO `fw_code` VALUES ('4015388', '3183', '181', '1184', '3666', '5247');
INSERT INTO `fw_code` VALUES ('4015389', '3183', '182', '8768', '3789', '9381');
INSERT INTO `fw_code` VALUES ('4015390', '3183', '183', '0437', '2527', '5684');
INSERT INTO `fw_code` VALUES ('4015391', '3183', '184', '1612', '8602', '9282');
INSERT INTO `fw_code` VALUES ('4015392', '3183', '185', '4577', '6439', '8702');
INSERT INTO `fw_code` VALUES ('4015393', '3183', '186', '2827', '5685', '2720');
INSERT INTO `fw_code` VALUES ('4015394', '3183', '187', '9943', '9864', '2979');
INSERT INTO `fw_code` VALUES ('4015395', '3183', '188', '8381', '9860', '5184');
INSERT INTO `fw_code` VALUES ('4015396', '3183', '189', '8341', '8852', '5345');
INSERT INTO `fw_code` VALUES ('4015397', '3183', '190', '6952', '5309', '4729');
INSERT INTO `fw_code` VALUES ('4015398', '3183', '191', '7100', '5050', '3077');
INSERT INTO `fw_code` VALUES ('4015399', '3183', '192', '6566', '1380', '0532');
INSERT INTO `fw_code` VALUES ('4015400', '3183', '193', '3641', '4551', '0952');
INSERT INTO `fw_code` VALUES ('4015401', '3183', '194', '4470', '7705', '0193');
INSERT INTO `fw_code` VALUES ('4015402', '3183', '195', '8982', '1257', '6398');
INSERT INTO `fw_code` VALUES ('4015403', '3183', '196', '1372', '4415', '3434');
INSERT INTO `fw_code` VALUES ('4015404', '3183', '197', '0584', '2269', '4032');
INSERT INTO `fw_code` VALUES ('4015405', '3183', '198', '1078', '4932', '6738');
INSERT INTO `fw_code` VALUES ('4015406', '3183', '199', '1652', '9610', '9122');
INSERT INTO `fw_code` VALUES ('4015407', '3183', '200', '9582', '2654', '7613');
INSERT INTO `fw_code` VALUES ('4015408', '3183', '201', '4683', '5173', '7211');
INSERT INTO `fw_code` VALUES ('4015409', '3183', '202', '3214', '9614', '6916');
INSERT INTO `fw_code` VALUES ('4015410', '3183', '203', '8661', '5055', '0872');
INSERT INTO `fw_code` VALUES ('4015411', '3183', '204', '8301', '7844', '5506');
INSERT INTO `fw_code` VALUES ('4015412', '3183', '205', '4603', '3158', '7532');
INSERT INTO `fw_code` VALUES ('4015413', '3183', '206', '8514', '5313', '2524');
INSERT INTO `fw_code` VALUES ('4015414', '3183', '207', '8835', '1515', '8050');
INSERT INTO `fw_code` VALUES ('4015415', '3183', '208', '7527', '9987', '7113');
INSERT INTO `fw_code` VALUES ('4015416', '3183', '209', '4323', '7963', '1845');
INSERT INTO `fw_code` VALUES ('4015417', '3183', '210', '2573', '7209', '5863');
INSERT INTO `fw_code` VALUES ('4015418', '3183', '211', '8621', '4047', '1032');
INSERT INTO `fw_code` VALUES ('4015419', '3183', '212', '3295', '1630', '6595');
INSERT INTO `fw_code` VALUES ('4015420', '3183', '213', '3361', '9356', '5264');
INSERT INTO `fw_code` VALUES ('4015421', '3183', '214', '8127', '1384', '8327');
INSERT INTO `fw_code` VALUES ('4015422', '3183', '215', '2720', '6951', '4211');
INSERT INTO `fw_code` VALUES ('4015423', '3183', '216', '8087', '0376', '8488');
INSERT INTO `fw_code` VALUES ('4015424', '3183', '217', '0370', '4801', '7014');
INSERT INTO `fw_code` VALUES ('4015425', '3183', '218', '0731', '2011', '2380');
INSERT INTO `fw_code` VALUES ('4015426', '3183', '219', '0544', '1261', '4193');
INSERT INTO `fw_code` VALUES ('4015427', '3183', '220', '8728', '2781', '9541');
INSERT INTO `fw_code` VALUES ('4015428', '3183', '221', '0411', '5808', '6854');
INSERT INTO `fw_code` VALUES ('4015429', '3183', '222', '1118', '5939', '6577');
INSERT INTO `fw_code` VALUES ('4015430', '3183', '223', '4002', '1761', '6318');
INSERT INTO `fw_code` VALUES ('4015431', '3183', '224', '5070', '9102', '1407');
INSERT INTO `fw_code` VALUES ('4015432', '3183', '225', '6672', '0114', '9041');
INSERT INTO `fw_code` VALUES ('4015433', '3183', '226', '0757', '8729', '1211');
INSERT INTO `fw_code` VALUES ('4015434', '3183', '227', '0304', '7074', '8345');
INSERT INTO `fw_code` VALUES ('4015435', '3183', '228', '5391', '5304', '6934');
INSERT INTO `fw_code` VALUES ('4015436', '3183', '229', '5604', '2773', '3952');
INSERT INTO `fw_code` VALUES ('4015437', '3183', '230', '2253', '1007', '0336');
INSERT INTO `fw_code` VALUES ('4015438', '3183', '231', '8448', '7586', '3854');
INSERT INTO `fw_code` VALUES ('4015439', '3183', '232', '4068', '9487', '4988');
INSERT INTO `fw_code` VALUES ('4015440', '3183', '233', '2934', '4420', '1229');
INSERT INTO `fw_code` VALUES ('4015441', '3183', '234', '9663', '4669', '7291');
INSERT INTO `fw_code` VALUES ('4015442', '3183', '235', '2039', '3539', '3318');
INSERT INTO `fw_code` VALUES ('4015443', '3183', '236', '3041', '3154', '9738');
INSERT INTO `fw_code` VALUES ('4015444', '3183', '237', '6779', '8848', '7550');
INSERT INTO `fw_code` VALUES ('4015445', '3183', '238', '5217', '8844', '9755');
INSERT INTO `fw_code` VALUES ('4015446', '3183', '239', '6138', '6443', '6497');
INSERT INTO `fw_code` VALUES ('4015447', '3183', '240', '5177', '7836', '9916');
INSERT INTO `fw_code` VALUES ('4015448', '3183', '241', '3936', '4035', '7648');
INSERT INTO `fw_code` VALUES ('4015449', '3183', '242', '3402', '0364', '5104');
INSERT INTO `fw_code` VALUES ('4015450', '3183', '243', '3962', '0753', '6479');
INSERT INTO `fw_code` VALUES ('4015451', '3183', '244', '5818', '0241', '0970');
INSERT INTO `fw_code` VALUES ('4015452', '3183', '245', '8941', '0249', '6559');
INSERT INTO `fw_code` VALUES ('4015453', '3183', '246', '4643', '4166', '7372');
INSERT INTO `fw_code` VALUES ('4015454', '3183', '247', '0864', '7463', '9720');
INSERT INTO `fw_code` VALUES ('4015455', '3183', '248', '7420', '1253', '8604');
INSERT INTO `fw_code` VALUES ('4015456', '3183', '249', '8488', '8594', '3693');
INSERT INTO `fw_code` VALUES ('4015457', '3183', '250', '6418', '1638', '2184');
INSERT INTO `fw_code` VALUES ('4015458', '3183', '251', '4175', '8221', '3497');
INSERT INTO `fw_code` VALUES ('4015459', '3183', '252', '0050', '8598', '1488');
INSERT INTO `fw_code` VALUES ('4015460', '3183', '253', '5497', '4039', '5443');
INSERT INTO `fw_code` VALUES ('4015461', '3183', '254', '5350', '4297', '7095');
INSERT INTO `fw_code` VALUES ('4015462', '3183', '255', '4363', '8971', '1684');
INSERT INTO `fw_code` VALUES ('4015463', '3183', '256', '1866', '7078', '6139');
INSERT INTO `fw_code` VALUES ('4015464', '3183', '257', '1159', '6947', '6416');
INSERT INTO `fw_code` VALUES ('4015465', '3183', '258', '6352', '3912', '3514');
INSERT INTO `fw_code` VALUES ('4015466', '3183', '259', '9409', '6193', '0434');
INSERT INTO `fw_code` VALUES ('4015467', '3183', '260', '5457', '3031', '5604');
INSERT INTO `fw_code` VALUES ('4015468', '3183', '261', '0197', '8340', '9836');
INSERT INTO `fw_code` VALUES ('4015469', '3183', '262', '4963', '0368', '2898');
INSERT INTO `fw_code` VALUES ('4015470', '3183', '263', '4923', '9360', '3059');
INSERT INTO `fw_code` VALUES ('4015471', '3183', '264', '8482', '6208', '5567');
INSERT INTO `fw_code` VALUES ('4015472', '3183', '265', '4957', '7982', '4772');
INSERT INTO `fw_code` VALUES ('4015473', '3183', '266', '0751', '6343', '3085');
INSERT INTO `fw_code` VALUES ('4015474', '3183', '267', '1499', '7482', '2647');
INSERT INTO `fw_code` VALUES ('4015475', '3183', '268', '8655', '2668', '2745');
INSERT INTO `fw_code` VALUES ('4015476', '3183', '269', '6839', '4188', '8093');
INSERT INTO `fw_code` VALUES ('4015477', '3183', '270', '1178', '1279', '7120');
INSERT INTO `fw_code` VALUES ('4015478', '3183', '271', '7307', '0132', '1968');
INSERT INTO `fw_code` VALUES ('4015479', '3183', '272', '9337', '6081', '3638');
INSERT INTO `fw_code` VALUES ('4015480', '3183', '273', '9230', '7347', '5129');
INSERT INTO `fw_code` VALUES ('4015481', '3183', '274', '2114', '3168', '4870');
INSERT INTO `fw_code` VALUES ('4015482', '3183', '275', '6279', '3799', '6718');
INSERT INTO `fw_code` VALUES ('4015483', '3183', '276', '3182', '0509', '9959');
INSERT INTO `fw_code` VALUES ('4015484', '3183', '277', '4784', '1521', '7593');
INSERT INTO `fw_code` VALUES ('4015485', '3183', '278', '8869', '0136', '9763');
INSERT INTO `fw_code` VALUES ('4015486', '3183', '279', '1072', '2545', '8611');
INSERT INTO `fw_code` VALUES ('4015487', '3183', '280', '0191', '5954', '1709');
INSERT INTO `fw_code` VALUES ('4015488', '3183', '281', '3502', '6712', '5486');
INSERT INTO `fw_code` VALUES ('4015489', '3183', '282', '6132', '4057', '8370');
INSERT INTO `fw_code` VALUES ('4015490', '3183', '283', '3716', '4180', '2504');
INSERT INTO `fw_code` VALUES ('4015491', '3183', '284', '0364', '2414', '8888');
INSERT INTO `fw_code` VALUES ('4015492', '3183', '285', '5385', '2918', '8808');
INSERT INTO `fw_code` VALUES ('4015493', '3183', '286', '6559', '8993', '2406');
INSERT INTO `fw_code` VALUES ('4015494', '3183', '287', '2180', '0894', '3540');
INSERT INTO `fw_code` VALUES ('4015495', '3183', '288', '1046', '5827', '9781');
INSERT INTO `fw_code` VALUES ('4015496', '3183', '289', '0431', '0140', '7558');
INSERT INTO `fw_code` VALUES ('4015497', '3183', '290', '0151', '4946', '1870');
INSERT INTO `fw_code` VALUES ('4015498', '3183', '291', '1152', '4561', '8290');
INSERT INTO `fw_code` VALUES ('4015499', '3183', '292', '4891', '0255', '6102');
INSERT INTO `fw_code` VALUES ('4015500', '3183', '293', '5985', '4315', '0022');
INSERT INTO `fw_code` VALUES ('4015501', '3183', '294', '4250', '7850', '5049');
INSERT INTO `fw_code` VALUES ('4015502', '3183', '295', '3289', '9243', '8468');
INSERT INTO `fw_code` VALUES ('4015503', '3183', '296', '1900', '5700', '7852');
INSERT INTO `fw_code` VALUES ('4015504', '3183', '297', '4703', '9506', '7915');
INSERT INTO `fw_code` VALUES ('4015505', '3183', '298', '4169', '5835', '5370');
INSERT INTO `fw_code` VALUES ('4015506', '3183', '299', '8589', '4942', '4075');
INSERT INTO `fw_code` VALUES ('4015507', '3183', '300', '2073', '2160', '5031');
INSERT INTO `fw_code` VALUES ('4015508', '3183', '301', '3930', '1648', '9522');
INSERT INTO `fw_code` VALUES ('4015509', '3183', '302', '4596', '0771', '9406');
INSERT INTO `fw_code` VALUES ('4015510', '3183', '303', '7053', '1656', '5111');
INSERT INTO `fw_code` VALUES ('4015511', '3183', '304', '2755', '5573', '5924');
INSERT INTO `fw_code` VALUES ('4015512', '3183', '305', '8976', '8871', '8272');
INSERT INTO `fw_code` VALUES ('4015513', '3183', '306', '5532', '2660', '7156');
INSERT INTO `fw_code` VALUES ('4015514', '3183', '307', '6025', '5323', '9861');
INSERT INTO `fw_code` VALUES ('4015515', '3183', '308', '9256', '4065', '3960');
INSERT INTO `fw_code` VALUES ('4015516', '3183', '309', '4530', '3045', '0736');
INSERT INTO `fw_code` VALUES ('4015517', '3183', '310', '2287', '9628', '2049');
INSERT INTO `fw_code` VALUES ('4015518', '3183', '311', '8162', '0005', '0040');
INSERT INTO `fw_code` VALUES ('4015519', '3183', '312', '3609', '5446', '3995');
INSERT INTO `fw_code` VALUES ('4015520', '3183', '313', '3248', '8236', '8629');
INSERT INTO `fw_code` VALUES ('4015521', '3183', '314', '9550', '3549', '0656');
INSERT INTO `fw_code` VALUES ('4015522', '3183', '315', '3462', '5704', '5647');
INSERT INTO `fw_code` VALUES ('4015523', '3183', '316', '3782', '1906', '1174');
INSERT INTO `fw_code` VALUES ('4015524', '3183', '317', '5130', '4442', '1951');
INSERT INTO `fw_code` VALUES ('4015525', '3183', '318', '9977', '8485', '4692');
INSERT INTO `fw_code` VALUES ('4015526', '3183', '319', '1926', '2418', '6683');
INSERT INTO `fw_code` VALUES ('4015527', '3183', '320', '4464', '5319', '2066');
INSERT INTO `fw_code` VALUES ('4015528', '3183', '321', '7521', '7601', '8986');
INSERT INTO `fw_code` VALUES ('4015529', '3183', '322', '3569', '4438', '4156');
INSERT INTO `fw_code` VALUES ('4015530', '3183', '323', '0898', '6085', '1433');
INSERT INTO `fw_code` VALUES ('4015531', '3183', '324', '0965', '3811', '0102');
INSERT INTO `fw_code` VALUES ('4015532', '3183', '325', '3075', '1775', '1450');
INSERT INTO `fw_code` VALUES ('4015533', '3183', '326', '0324', '1406', '9049');
INSERT INTO `fw_code` VALUES ('4015534', '3183', '327', '3035', '0767', '1611');
INSERT INTO `fw_code` VALUES ('4015535', '3183', '328', '5318', '5192', '0138');
INSERT INTO `fw_code` VALUES ('4015536', '3183', '329', '1793', '6966', '9343');
INSERT INTO `fw_code` VALUES ('4015537', '3183', '330', '7587', '5327', '7656');
INSERT INTO `fw_code` VALUES ('4015538', '3183', '331', '8335', '6466', '7218');
INSERT INTO `fw_code` VALUES ('4015539', '3183', '332', '5491', '1652', '7317');
INSERT INTO `fw_code` VALUES ('4015540', '3183', '333', '3676', '3172', '2665');
INSERT INTO `fw_code` VALUES ('4015541', '3183', '334', '8014', '0263', '1692');
INSERT INTO `fw_code` VALUES ('4015542', '3183', '335', '4143', '9116', '6540');
INSERT INTO `fw_code` VALUES ('4015543', '3183', '336', '6173', '5065', '8209');
INSERT INTO `fw_code` VALUES ('4015544', '3183', '337', '6066', '6331', '9700');
INSERT INTO `fw_code` VALUES ('4015545', '3183', '338', '1606', '6216', '1156');
INSERT INTO `fw_code` VALUES ('4015546', '3183', '339', '5771', '6847', '3004');
INSERT INTO `fw_code` VALUES ('4015547', '3183', '340', '2674', '3557', '6245');
INSERT INTO `fw_code` VALUES ('4015548', '3183', '341', '4276', '4569', '3879');
INSERT INTO `fw_code` VALUES ('4015549', '3183', '342', '5705', '9120', '4334');
INSERT INTO `fw_code` VALUES ('4015550', '3183', '343', '7908', '1529', '3183');
INSERT INTO `fw_code` VALUES ('4015551', '3183', '344', '9683', '9002', '7995');
INSERT INTO `fw_code` VALUES ('4015552', '3183', '345', '2994', '9760', '1772');
INSERT INTO `fw_code` VALUES ('4015553', '3183', '346', '2968', '3041', '2941');
INSERT INTO `fw_code` VALUES ('4015554', '3183', '347', '3208', '7228', '8790');
INSERT INTO `fw_code` VALUES ('4015555', '3183', '348', '7200', '1398', '3459');
INSERT INTO `fw_code` VALUES ('4015556', '3183', '349', '2221', '1902', '3379');
INSERT INTO `fw_code` VALUES ('4015557', '3183', '350', '3396', '7977', '6977');
INSERT INTO `fw_code` VALUES ('4015558', '3183', '351', '9016', '9878', '8111');
INSERT INTO `fw_code` VALUES ('4015559', '3183', '352', '0537', '8875', '6067');
INSERT INTO `fw_code` VALUES ('4015560', '3183', '353', '7267', '9125', '2129');
INSERT INTO `fw_code` VALUES ('4015561', '3183', '354', '6987', '3930', '6442');
INSERT INTO `fw_code` VALUES ('4015562', '3183', '355', '0644', '7609', '4576');
INSERT INTO `fw_code` VALUES ('4015563', '3183', '356', '4383', '3303', '2388');
INSERT INTO `fw_code` VALUES ('4015564', '3183', '357', '2821', '3299', '4593');
INSERT INTO `fw_code` VALUES ('4015565', '3183', '358', '3742', '0898', '1335');
INSERT INTO `fw_code` VALUES ('4015566', '3183', '359', '2781', '2291', '4754');
INSERT INTO `fw_code` VALUES ('4015567', '3183', '360', '1392', '8748', '4138');
INSERT INTO `fw_code` VALUES ('4015568', '3183', '361', '1539', '8490', '2486');
INSERT INTO `fw_code` VALUES ('4015569', '3183', '362', '1005', '4819', '9942');
INSERT INTO `fw_code` VALUES ('4015570', '3183', '363', '5425', '3926', '8647');
INSERT INTO `fw_code` VALUES ('4015571', '3183', '364', '8909', '1144', '9602');
INSERT INTO `fw_code` VALUES ('4015572', '3183', '365', '3421', '4696', '5808');
INSERT INTO `fw_code` VALUES ('4015573', '3183', '366', '1432', '9755', '3977');
INSERT INTO `fw_code` VALUES ('4015574', '3183', '367', '3889', '0640', '9683');
INSERT INTO `fw_code` VALUES ('4015575', '3183', '368', '2246', '8621', '2210');
INSERT INTO `fw_code` VALUES ('4015576', '3183', '369', '5812', '7855', '2843');
INSERT INTO `fw_code` VALUES ('4015577', '3183', '370', '5024', '5708', '3442');
INSERT INTO `fw_code` VALUES ('4015578', '3183', '371', '2861', '4307', '4433');
INSERT INTO `fw_code` VALUES ('4015579', '3183', '372', '6092', '3049', '8531');
INSERT INTO `fw_code` VALUES ('4015580', '3183', '373', '1366', '2029', '5308');
INSERT INTO `fw_code` VALUES ('4015581', '3183', '374', '8040', '5143', '7184');
INSERT INTO `fw_code` VALUES ('4015582', '3183', '375', '3915', '5520', '5175');
INSERT INTO `fw_code` VALUES ('4015583', '3183', '376', '2018', '5025', '0845');
INSERT INTO `fw_code` VALUES ('4015584', '3183', '377', '9001', '3750', '3764');
INSERT INTO `fw_code` VALUES ('4015585', '3183', '378', '5303', '9064', '5791');
INSERT INTO `fw_code` VALUES ('4015586', '3183', '379', '9215', '1219', '0782');
INSERT INTO `fw_code` VALUES ('4015587', '3183', '380', '9535', '7421', '6309');
INSERT INTO `fw_code` VALUES ('4015588', '3183', '381', '0883', '9957', '7085');
INSERT INTO `fw_code` VALUES ('4015589', '3183', '382', '8386', '8064', '1541');
INSERT INTO `fw_code` VALUES ('4015590', '3183', '383', '7679', '7933', '1818');
INSERT INTO `fw_code` VALUES ('4015591', '3183', '384', '2872', '4898', '8916');
INSERT INTO `fw_code` VALUES ('4015592', '3183', '385', '3274', '3116', '4121');
INSERT INTO `fw_code` VALUES ('4015593', '3183', '386', '9322', '9953', '9291');
INSERT INTO `fw_code` VALUES ('4015594', '3183', '387', '6651', '1600', '6568');
INSERT INTO `fw_code` VALUES ('4015595', '3183', '388', '6718', '9326', '5237');
INSERT INTO `fw_code` VALUES ('4015596', '3183', '389', '1484', '1354', '8300');
INSERT INTO `fw_code` VALUES ('4015597', '3183', '390', '6077', '6921', '4184');
INSERT INTO `fw_code` VALUES ('4015598', '3183', '391', '8787', '6282', '6746');
INSERT INTO `fw_code` VALUES ('4015599', '3183', '392', '3727', '4771', '6987');
INSERT INTO `fw_code` VALUES ('4015600', '3183', '393', '0202', '6544', '6193');
INSERT INTO `fw_code` VALUES ('4015601', '3183', '394', '3340', '0842', '2791');
INSERT INTO `fw_code` VALUES ('4015602', '3183', '395', '4088', '1981', '2353');
INSERT INTO `fw_code` VALUES ('4015603', '3183', '396', '1244', '7167', '2451');
INSERT INTO `fw_code` VALUES ('4015604', '3183', '397', '9428', '8687', '7800');
INSERT INTO `fw_code` VALUES ('4015605', '3183', '398', '3767', '5778', '6827');
INSERT INTO `fw_code` VALUES ('4015606', '3183', '399', '2552', '8695', '3389');
INSERT INTO `fw_code` VALUES ('4015607', '3183', '400', '4581', '4644', '5059');
INSERT INTO `fw_code` VALUES ('4015608', '3183', '401', '4474', '5909', '6550');
INSERT INTO `fw_code` VALUES ('4015609', '3183', '402', '7358', '1731', '6291');
INSERT INTO `fw_code` VALUES ('4015610', '3183', '403', '1524', '2362', '8139');
INSERT INTO `fw_code` VALUES ('4015611', '3183', '404', '8427', '9072', '1380');
INSERT INTO `fw_code` VALUES ('4015612', '3183', '405', '0029', '0084', '9014');
INSERT INTO `fw_code` VALUES ('4015613', '3183', '406', '1458', '4635', '9469');
INSERT INTO `fw_code` VALUES ('4015614', '3183', '407', '3660', '7044', '8318');
INSERT INTO `fw_code` VALUES ('4015615', '3183', '408', '5436', '4517', '3130');
INSERT INTO `fw_code` VALUES ('4015616', '3183', '409', '8747', '5274', '6907');
INSERT INTO `fw_code` VALUES ('4015617', '3183', '410', '1377', '2620', '9791');
INSERT INTO `fw_code` VALUES ('4015618', '3183', '411', '8961', '2743', '3925');
INSERT INTO `fw_code` VALUES ('4015619', '3183', '412', '2953', '6913', '8594');
INSERT INTO `fw_code` VALUES ('4015620', '3183', '413', '0629', '1481', '0228');
INSERT INTO `fw_code` VALUES ('4015621', '3183', '414', '1804', '7556', '3827');
INSERT INTO `fw_code` VALUES ('4015622', '3183', '415', '4769', '5393', '3246');
INSERT INTO `fw_code` VALUES ('4015623', '3183', '416', '6290', '4390', '1202');
INSERT INTO `fw_code` VALUES ('4015624', '3183', '417', '3020', '4639', '7264');
INSERT INTO `fw_code` VALUES ('4015625', '3183', '418', '2740', '9445', '1576');
INSERT INTO `fw_code` VALUES ('4015626', '3183', '419', '6397', '3124', '9711');
INSERT INTO `fw_code` VALUES ('4015627', '3183', '420', '0136', '8818', '7523');
INSERT INTO `fw_code` VALUES ('4015628', '3183', '421', '8574', '8814', '9728');
INSERT INTO `fw_code` VALUES ('4015629', '3183', '422', '9495', '6413', '6469');
INSERT INTO `fw_code` VALUES ('4015630', '3183', '423', '8533', '7806', '9889');
INSERT INTO `fw_code` VALUES ('4015631', '3183', '424', '7145', '4263', '9273');
INSERT INTO `fw_code` VALUES ('4015632', '3183', '425', '7292', '4004', '7621');
INSERT INTO `fw_code` VALUES ('4015633', '3183', '426', '6758', '0334', '5076');
INSERT INTO `fw_code` VALUES ('4015634', '3183', '427', '3834', '3505', '5496');
INSERT INTO `fw_code` VALUES ('4015635', '3183', '428', '4662', '6659', '4737');
INSERT INTO `fw_code` VALUES ('4015636', '3183', '429', '9174', '0211', '0943');
INSERT INTO `fw_code` VALUES ('4015637', '3183', '430', '7185', '5270', '9112');
INSERT INTO `fw_code` VALUES ('4015638', '3183', '431', '9642', '6155', '4818');
INSERT INTO `fw_code` VALUES ('4015639', '3183', '432', '7999', '4136', '7344');
INSERT INTO `fw_code` VALUES ('4015640', '3183', '433', '1565', '3370', '7978');
INSERT INTO `fw_code` VALUES ('4015641', '3183', '434', '0776', '1223', '8577');
INSERT INTO `fw_code` VALUES ('4015642', '3183', '435', '1270', '3886', '1282');
INSERT INTO `fw_code` VALUES ('4015643', '3183', '436', '1845', '8564', '3666');
INSERT INTO `fw_code` VALUES ('4015644', '3183', '437', '9775', '1608', '2157');
INSERT INTO `fw_code` VALUES ('4015645', '3183', '438', '4876', '4127', '1755');
INSERT INTO `fw_code` VALUES ('4015646', '3183', '439', '3406', '8568', '1461');
INSERT INTO `fw_code` VALUES ('4015647', '3183', '440', '8854', '4009', '5416');
INSERT INTO `fw_code` VALUES ('4015648', '3183', '441', '8493', '6798', '0050');
INSERT INTO `fw_code` VALUES ('4015649', '3183', '442', '4795', '2112', '2077');
INSERT INTO `fw_code` VALUES ('4015650', '3183', '443', '8707', '4267', '7068');
INSERT INTO `fw_code` VALUES ('4015651', '3183', '444', '9027', '0469', '2595');
INSERT INTO `fw_code` VALUES ('4015652', '3183', '445', '7719', '8941', '1657');
INSERT INTO `fw_code` VALUES ('4015653', '3183', '446', '5222', '7048', '6112');
INSERT INTO `fw_code` VALUES ('4015654', '3183', '447', '4515', '6917', '6389');
INSERT INTO `fw_code` VALUES ('4015655', '3183', '448', '9708', '3882', '3487');
INSERT INTO `fw_code` VALUES ('4015656', '3183', '449', '2765', '6163', '0407');
INSERT INTO `fw_code` VALUES ('4015657', '3183', '450', '8813', '3001', '5577');
INSERT INTO `fw_code` VALUES ('4015658', '3183', '451', '3487', '0584', '1139');
INSERT INTO `fw_code` VALUES ('4015659', '3183', '452', '3554', '8310', '9809');
INSERT INTO `fw_code` VALUES ('4015660', '3183', '453', '8320', '0338', '2871');
INSERT INTO `fw_code` VALUES ('4015661', '3183', '454', '2913', '5905', '8755');
INSERT INTO `fw_code` VALUES ('4015662', '3183', '455', '8279', '9330', '3032');
INSERT INTO `fw_code` VALUES ('4015663', '3183', '456', '0563', '3755', '1559');
INSERT INTO `fw_code` VALUES ('4015664', '3183', '457', '7038', '5528', '0764');
INSERT INTO `fw_code` VALUES ('4015665', '3183', '458', '0176', '9826', '7362');
INSERT INTO `fw_code` VALUES ('4015666', '3183', '459', '0924', '0965', '6925');
INSERT INTO `fw_code` VALUES ('4015667', '3183', '460', '0736', '0215', '8737');
INSERT INTO `fw_code` VALUES ('4015668', '3183', '461', '8920', '1735', '4086');
INSERT INTO `fw_code` VALUES ('4015669', '3183', '462', '0603', '4762', '1398');
INSERT INTO `fw_code` VALUES ('4015670', '3183', '463', '9388', '7679', '7961');
INSERT INTO `fw_code` VALUES ('4015671', '3183', '464', '1417', '3628', '9630');
INSERT INTO `fw_code` VALUES ('4015672', '3183', '465', '1311', '4893', '1121');
INSERT INTO `fw_code` VALUES ('4015673', '3183', '466', '4194', '0715', '0862');
INSERT INTO `fw_code` VALUES ('4015674', '3183', '467', '8360', '1346', '2710');
INSERT INTO `fw_code` VALUES ('4015675', '3183', '468', '5263', '8056', '5952');
INSERT INTO `fw_code` VALUES ('4015676', '3183', '469', '6865', '9068', '3585');
INSERT INTO `fw_code` VALUES ('4015677', '3183', '470', '0950', '7683', '5755');
INSERT INTO `fw_code` VALUES ('4015678', '3183', '471', '0496', '6028', '2889');
INSERT INTO `fw_code` VALUES ('4015679', '3183', '472', '2272', '3501', '7702');
INSERT INTO `fw_code` VALUES ('4015680', '3183', '473', '5583', '4258', '1478');
INSERT INTO `fw_code` VALUES ('4015681', '3183', '474', '8213', '1604', '4362');
INSERT INTO `fw_code` VALUES ('4015682', '3183', '475', '5797', '1727', '8496');
INSERT INTO `fw_code` VALUES ('4015683', '3183', '476', '2445', '9961', '4880');
INSERT INTO `fw_code` VALUES ('4015684', '3183', '477', '7465', '0465', '4800');
INSERT INTO `fw_code` VALUES ('4015685', '3183', '478', '8640', '6540', '8398');
INSERT INTO `fw_code` VALUES ('4015686', '3183', '479', '4261', '8441', '9532');
INSERT INTO `fw_code` VALUES ('4015687', '3183', '480', '4373', '5885', '9490');
INSERT INTO `fw_code` VALUES ('4015688', '3183', '481', '1102', '6134', '5552');
INSERT INTO `fw_code` VALUES ('4015689', '3183', '482', '3478', '5004', '1579');
INSERT INTO `fw_code` VALUES ('4015690', '3183', '483', '4480', '4619', '7999');
INSERT INTO `fw_code` VALUES ('4015691', '3183', '484', '8218', '0313', '5811');
INSERT INTO `fw_code` VALUES ('4015692', '3183', '485', '6656', '0309', '8017');
INSERT INTO `fw_code` VALUES ('4015693', '3183', '486', '7577', '7908', '4758');
INSERT INTO `fw_code` VALUES ('4015694', '3183', '487', '6616', '9301', '8177');
INSERT INTO `fw_code` VALUES ('4015695', '3183', '488', '5227', '5758', '7561');
INSERT INTO `fw_code` VALUES ('4015696', '3183', '489', '4840', '1829', '3365');
INSERT INTO `fw_code` VALUES ('4015697', '3183', '490', '1916', '5000', '3785');
INSERT INTO `fw_code` VALUES ('4015698', '3183', '491', '5400', '2218', '4740');
INSERT INTO `fw_code` VALUES ('4015699', '3183', '492', '7257', '1706', '9231');
INSERT INTO `fw_code` VALUES ('4015700', '3183', '493', '5268', '6765', '7401');
INSERT INTO `fw_code` VALUES ('4015701', '3183', '494', '0380', '1714', '4821');
INSERT INTO `fw_code` VALUES ('4015702', '3183', '495', '6082', '5631', '5633');
INSERT INTO `fw_code` VALUES ('4015703', '3183', '496', '2303', '8928', '7981');
INSERT INTO `fw_code` VALUES ('4015704', '3183', '497', '8859', '2718', '6865');
INSERT INTO `fw_code` VALUES ('4015705', '3183', '498', '9352', '5381', '9570');
INSERT INTO `fw_code` VALUES ('4015706', '3183', '499', '9927', '0059', '1954');
INSERT INTO `fw_code` VALUES ('4015707', '3183', '500', '7857', '3103', '0445');
INSERT INTO `fw_code` VALUES ('4015708', '3183', '501', '5614', '9686', '1758');
INSERT INTO `fw_code` VALUES ('4015709', '3183', '502', '1489', '0063', '9749');
INSERT INTO `fw_code` VALUES ('4015710', '3183', '503', '6936', '5504', '3704');
INSERT INTO `fw_code` VALUES ('4015711', '3183', '504', '6575', '8293', '8338');
INSERT INTO `fw_code` VALUES ('4015712', '3183', '505', '2877', '3607', '0365');
INSERT INTO `fw_code` VALUES ('4015713', '3183', '506', '6789', '5762', '5356');
INSERT INTO `fw_code` VALUES ('4015714', '3183', '507', '7109', '1964', '0883');
INSERT INTO `fw_code` VALUES ('4015715', '3183', '508', '5802', '0436', '9945');
INSERT INTO `fw_code` VALUES ('4015716', '3183', '509', '3305', '8543', '4401');
INSERT INTO `fw_code` VALUES ('4015717', '3183', '510', '2597', '8412', '4677');
INSERT INTO `fw_code` VALUES ('4015718', '3183', '511', '7791', '5377', '1776');
INSERT INTO `fw_code` VALUES ('4015719', '3183', '512', '0848', '7658', '8695');
INSERT INTO `fw_code` VALUES ('4015720', '3183', '513', '6896', '4496', '3865');
INSERT INTO `fw_code` VALUES ('4015721', '3183', '514', '4225', '6143', '1142');
INSERT INTO `fw_code` VALUES ('4015722', '3183', '515', '1636', '9805', '8097');
INSERT INTO `fw_code` VALUES ('4015723', '3183', '516', '6402', '1833', '1160');
INSERT INTO `fw_code` VALUES ('4015724', '3183', '517', '0995', '7400', '7043');
INSERT INTO `fw_code` VALUES ('4015725', '3183', '518', '6362', '0825', '1320');
INSERT INTO `fw_code` VALUES ('4015726', '3183', '519', '8645', '5250', '9847');
INSERT INTO `fw_code` VALUES ('4015727', '3183', '520', '5120', '7023', '9052');
INSERT INTO `fw_code` VALUES ('4015728', '3183', '521', '0914', '5385', '7365');
INSERT INTO `fw_code` VALUES ('4015729', '3183', '522', '1662', '6524', '6928');
INSERT INTO `fw_code` VALUES ('4015730', '3183', '523', '8818', '1710', '7026');
INSERT INTO `fw_code` VALUES ('4015731', '3183', '524', '7003', '3230', '2374');
INSERT INTO `fw_code` VALUES ('4015732', '3183', '525', '1341', '0321', '1401');
INSERT INTO `fw_code` VALUES ('4015733', '3183', '526', '7470', '9174', '6249');
INSERT INTO `fw_code` VALUES ('4015734', '3183', '527', '9393', '6388', '9410');
INSERT INTO `fw_code` VALUES ('4015735', '3183', '528', '2277', '2210', '9151');
INSERT INTO `fw_code` VALUES ('4015736', '3183', '529', '6443', '2841', '0999');
INSERT INTO `fw_code` VALUES ('4015737', '3183', '530', '3345', '9551', '4240');
INSERT INTO `fw_code` VALUES ('4015738', '3183', '531', '4947', '0563', '1874');
INSERT INTO `fw_code` VALUES ('4015739', '3183', '532', '9032', '9178', '4044');
INSERT INTO `fw_code` VALUES ('4015740', '3183', '533', '1235', '1587', '2892');
INSERT INTO `fw_code` VALUES ('4015741', '3183', '534', '0354', '4996', '5990');
INSERT INTO `fw_code` VALUES ('4015742', '3183', '535', '3665', '5753', '9767');
INSERT INTO `fw_code` VALUES ('4015743', '3183', '536', '6295', '3099', '2651');
INSERT INTO `fw_code` VALUES ('4015744', '3183', '537', '3879', '3222', '6785');
INSERT INTO `fw_code` VALUES ('4015745', '3183', '538', '0527', '1456', '3169');
INSERT INTO `fw_code` VALUES ('4015746', '3183', '539', '5548', '1960', '3088');
INSERT INTO `fw_code` VALUES ('4015747', '3183', '540', '6723', '8035', '6686');
INSERT INTO `fw_code` VALUES ('4015748', '3183', '541', '2343', '9936', '7820');
INSERT INTO `fw_code` VALUES ('4015749', '3183', '542', '0594', '9182', '1838');
INSERT INTO `fw_code` VALUES ('4015750', '3183', '543', '0314', '3988', '6151');
INSERT INTO `fw_code` VALUES ('4015751', '3183', '544', '5054', '9297', '0383');
INSERT INTO `fw_code` VALUES ('4015752', '3183', '545', '6148', '3357', '4303');
INSERT INTO `fw_code` VALUES ('4015753', '3183', '546', '4413', '6892', '9329');
INSERT INTO `fw_code` VALUES ('4015754', '3183', '547', '3452', '8285', '2749');
INSERT INTO `fw_code` VALUES ('4015755', '3183', '548', '2063', '4742', '2133');
INSERT INTO `fw_code` VALUES ('4015756', '3183', '549', '4866', '8547', '2195');
INSERT INTO `fw_code` VALUES ('4015757', '3183', '550', '4332', '4877', '9651');
INSERT INTO `fw_code` VALUES ('4015758', '3183', '551', '2236', '1202', '9311');
INSERT INTO `fw_code` VALUES ('4015759', '3183', '552', '4093', '0690', '3802');
INSERT INTO `fw_code` VALUES ('4015760', '3183', '553', '4759', '9813', '3687');
INSERT INTO `fw_code` VALUES ('4015761', '3183', '554', '7216', '0698', '9392');
INSERT INTO `fw_code` VALUES ('4015762', '3183', '555', '9139', '7912', '2553');
INSERT INTO `fw_code` VALUES ('4015763', '3183', '556', '5695', '1702', '1436');
INSERT INTO `fw_code` VALUES ('4015764', '3183', '557', '6189', '4365', '4142');
INSERT INTO `fw_code` VALUES ('4015765', '3183', '558', '9419', '3107', '8240');
INSERT INTO `fw_code` VALUES ('4015766', '3183', '559', '4693', '2087', '5017');
INSERT INTO `fw_code` VALUES ('4015767', '3183', '560', '2450', '8670', '6329');
INSERT INTO `fw_code` VALUES ('4015768', '3183', '561', '8325', '9047', '4320');
INSERT INTO `fw_code` VALUES ('4015769', '3183', '562', '9672', '9744', '1759');
INSERT INTO `fw_code` VALUES ('4015770', '3183', '563', '9886', '7213', '8776');
INSERT INTO `fw_code` VALUES ('4015771', '3183', '564', '1555', '5951', '5080');
INSERT INTO `fw_code` VALUES ('4015772', '3183', '565', '8350', '3927', '9812');
INSERT INTO `fw_code` VALUES ('4015773', '3183', '566', '0888', '6828', '5196');
INSERT INTO `fw_code` VALUES ('4015774', '3183', '567', '3945', '9110', '2116');
INSERT INTO `fw_code` VALUES ('4015775', '3183', '568', '9993', '5947', '7285');
INSERT INTO `fw_code` VALUES ('4015776', '3183', '569', '7322', '7594', '4562');
INSERT INTO `fw_code` VALUES ('4015777', '3183', '570', '7389', '5320', '3232');
INSERT INTO `fw_code` VALUES ('4015778', '3183', '571', '9499', '3284', '4580');
INSERT INTO `fw_code` VALUES ('4015779', '3183', '572', '6748', '2915', '2178');
INSERT INTO `fw_code` VALUES ('4015780', '3183', '573', '9459', '2276', '4741');
INSERT INTO `fw_code` VALUES ('4015781', '3183', '574', '1742', '6701', '3267');
INSERT INTO `fw_code` VALUES ('4015782', '3183', '575', '8217', '8475', '2473');
INSERT INTO `fw_code` VALUES ('4015783', '3183', '576', '4011', '6836', '0785');
INSERT INTO `fw_code` VALUES ('4015784', '3183', '577', '1915', '3161', '0446');
INSERT INTO `fw_code` VALUES ('4015785', '3183', '578', '0100', '4681', '5794');
INSERT INTO `fw_code` VALUES ('4015786', '3183', '579', '0567', '0625', '9669');
INSERT INTO `fw_code` VALUES ('4015787', '3183', '580', '2490', '7840', '2830');
INSERT INTO `fw_code` VALUES ('4015788', '3183', '581', '8030', '7725', '4285');
INSERT INTO `fw_code` VALUES ('4015789', '3183', '582', '2195', '8356', '6134');
INSERT INTO `fw_code` VALUES ('4015790', '3183', '583', '9098', '5066', '9375');
INSERT INTO `fw_code` VALUES ('4015791', '3183', '584', '0700', '6078', '7009');
INSERT INTO `fw_code` VALUES ('4015792', '3183', '585', '2129', '0629', '7464');
INSERT INTO `fw_code` VALUES ('4015793', '3183', '586', '6107', '0511', '1125');
INSERT INTO `fw_code` VALUES ('4015794', '3183', '587', '9418', '1268', '4902');
INSERT INTO `fw_code` VALUES ('4015795', '3183', '588', '9392', '4550', '6071');
INSERT INTO `fw_code` VALUES ('4015796', '3183', '589', '9632', '8737', '1919');
INSERT INTO `fw_code` VALUES ('4015797', '3183', '590', '3624', '2907', '6589');
INSERT INTO `fw_code` VALUES ('4015798', '3183', '591', '9820', '9486', '0107');
INSERT INTO `fw_code` VALUES ('4015799', '3183', '592', '5440', '1387', '1241');
INSERT INTO `fw_code` VALUES ('4015800', '3183', '593', '6962', '0384', '9196');
INSERT INTO `fw_code` VALUES ('4015801', '3183', '594', '3691', '0633', '5259');
INSERT INTO `fw_code` VALUES ('4015802', '3183', '595', '3411', '5439', '9571');
INSERT INTO `fw_code` VALUES ('4015803', '3183', '596', '7068', '9118', '7705');
INSERT INTO `fw_code` VALUES ('4015804', '3183', '597', '0807', '4812', '5518');
INSERT INTO `fw_code` VALUES ('4015805', '3183', '598', '9245', '4808', '7723');
INSERT INTO `fw_code` VALUES ('4015806', '3183', '599', '0166', '2407', '4464');
INSERT INTO `fw_code` VALUES ('4015807', '3183', '600', '9205', '3800', '7884');
INSERT INTO `fw_code` VALUES ('4015808', '3183', '601', '7816', '0257', '7268');
INSERT INTO `fw_code` VALUES ('4015809', '3183', '602', '7963', '9998', '5616');
INSERT INTO `fw_code` VALUES ('4015810', '3183', '603', '7429', '6328', '3071');
INSERT INTO `fw_code` VALUES ('4015811', '3183', '604', '5333', '2653', '2732');
INSERT INTO `fw_code` VALUES ('4015812', '3183', '605', '9846', '6205', '8937');
INSERT INTO `fw_code` VALUES ('4015813', '3183', '606', '0313', '2149', '2812');
INSERT INTO `fw_code` VALUES ('4015814', '3183', '607', '8671', '0130', '5339');
INSERT INTO `fw_code` VALUES ('4015815', '3183', '608', '1448', '7217', '6571');
INSERT INTO `fw_code` VALUES ('4015816', '3183', '609', '9286', '5816', '7562');
INSERT INTO `fw_code` VALUES ('4015817', '3183', '610', '2516', '4558', '1660');
INSERT INTO `fw_code` VALUES ('4015818', '3183', '611', '7790', '3538', '8437');
INSERT INTO `fw_code` VALUES ('4015819', '3183', '612', '5547', '0121', '9750');
INSERT INTO `fw_code` VALUES ('4015820', '3183', '613', '1422', '0498', '7741');
INSERT INTO `fw_code` VALUES ('4015821', '3183', '614', '9525', '0003', '3410');
INSERT INTO `fw_code` VALUES ('4015822', '3183', '615', '2810', '4042', '8357');
INSERT INTO `fw_code` VALUES ('4015823', '3183', '616', '6722', '6197', '3348');
INSERT INTO `fw_code` VALUES ('4015824', '3183', '617', '7042', '2399', '8875');
INSERT INTO `fw_code` VALUES ('4015825', '3183', '618', '5893', '3042', '4107');
INSERT INTO `fw_code` VALUES ('4015826', '3183', '619', '5186', '2911', '4384');
INSERT INTO `fw_code` VALUES ('4015827', '3183', '620', '0781', '8094', '6687');
INSERT INTO `fw_code` VALUES ('4015828', '3183', '621', '6829', '4931', '1857');
INSERT INTO `fw_code` VALUES ('4015829', '3183', '622', '4159', '6578', '9133');
INSERT INTO `fw_code` VALUES ('4015830', '3183', '623', '8991', '6332', '0866');
INSERT INTO `fw_code` VALUES ('4015831', '3183', '624', '3584', '1899', '6750');
INSERT INTO `fw_code` VALUES ('4015832', '3183', '625', '1234', '9749', '9553');
INSERT INTO `fw_code` VALUES ('4015833', '3183', '626', '7709', '1522', '8759');
INSERT INTO `fw_code` VALUES ('4015834', '3183', '627', '0847', '5820', '5357');
INSERT INTO `fw_code` VALUES ('4015835', '3183', '628', '1595', '6959', '4919');
INSERT INTO `fw_code` VALUES ('4015836', '3183', '629', '0027', '4568', '8998');
INSERT INTO `fw_code` VALUES ('4015837', '3183', '630', '8211', '6088', '4346');
INSERT INTO `fw_code` VALUES ('4015838', '3183', '631', '2550', '3179', '3373');
INSERT INTO `fw_code` VALUES ('4015839', '3183', '632', '1335', '6096', '9936');
INSERT INTO `fw_code` VALUES ('4015840', '3183', '633', '3364', '2045', '1605');
INSERT INTO `fw_code` VALUES ('4015841', '3183', '634', '3257', '3311', '3096');
INSERT INTO `fw_code` VALUES ('4015842', '3183', '635', '6141', '9132', '2838');
INSERT INTO `fw_code` VALUES ('4015843', '3183', '636', '0307', '9763', '4686');
INSERT INTO `fw_code` VALUES ('4015844', '3183', '637', '7210', '6473', '7927');
INSERT INTO `fw_code` VALUES ('4015845', '3183', '638', '8812', '7485', '5561');
INSERT INTO `fw_code` VALUES ('4015846', '3183', '639', '0241', '2037', '6016');
INSERT INTO `fw_code` VALUES ('4015847', '3183', '640', '2443', '4445', '4864');
INSERT INTO `fw_code` VALUES ('4015848', '3183', '641', '4219', '1918', '9677');
INSERT INTO `fw_code` VALUES ('4015849', '3183', '642', '7530', '2676', '3454');
INSERT INTO `fw_code` VALUES ('4015850', '3183', '643', '0160', '0021', '6338');
INSERT INTO `fw_code` VALUES ('4015851', '3183', '644', '7744', '0144', '0471');
INSERT INTO `fw_code` VALUES ('4015852', '3183', '645', '1736', '4314', '5141');
INSERT INTO `fw_code` VALUES ('4015853', '3183', '646', '9412', '8882', '6775');
INSERT INTO `fw_code` VALUES ('4015854', '3183', '647', '0587', '4957', '0373');
INSERT INTO `fw_code` VALUES ('4015855', '3183', '648', '3552', '2794', '9793');
INSERT INTO `fw_code` VALUES ('4015856', '3183', '649', '5073', '1791', '7748');
INSERT INTO `fw_code` VALUES ('4015857', '3183', '650', '1803', '2041', '3811');
INSERT INTO `fw_code` VALUES ('4015858', '3183', '651', '1523', '6846', '8123');
INSERT INTO `fw_code` VALUES ('4015859', '3183', '652', '5180', '0525', '6257');
INSERT INTO `fw_code` VALUES ('4015860', '3183', '653', '8919', '6219', '4070');
INSERT INTO `fw_code` VALUES ('4015861', '3183', '654', '7357', '6215', '6275');
INSERT INTO `fw_code` VALUES ('4015862', '3183', '655', '8278', '3814', '3016');
INSERT INTO `fw_code` VALUES ('4015863', '3183', '656', '7316', '5207', '6436');
INSERT INTO `fw_code` VALUES ('4015864', '3183', '657', '5928', '1664', '5820');
INSERT INTO `fw_code` VALUES ('4015865', '3183', '658', '5541', '7735', '1623');
INSERT INTO `fw_code` VALUES ('4015866', '3183', '659', '2617', '0906', '2043');
INSERT INTO `fw_code` VALUES ('4015867', '3183', '660', '3445', '4060', '1284');
INSERT INTO `fw_code` VALUES ('4015868', '3183', '661', '7957', '7612', '7489');
INSERT INTO `fw_code` VALUES ('4015869', '3183', '662', '5968', '2671', '5659');
INSERT INTO `fw_code` VALUES ('4015870', '3183', '663', '8425', '3556', '1364');
INSERT INTO `fw_code` VALUES ('4015871', '3183', '664', '6782', '1537', '3891');
INSERT INTO `fw_code` VALUES ('4015872', '3183', '665', '9559', '8624', '5123');
INSERT INTO `fw_code` VALUES ('4015873', '3183', '666', '0053', '1287', '7829');
INSERT INTO `fw_code` VALUES ('4015874', '3183', '667', '0628', '5965', '0212');
INSERT INTO `fw_code` VALUES ('4015875', '3183', '668', '8558', '9009', '8704');
INSERT INTO `fw_code` VALUES ('4015876', '3183', '669', '2189', '5969', '8007');
INSERT INTO `fw_code` VALUES ('4015877', '3183', '670', '7637', '1410', '1963');
INSERT INTO `fw_code` VALUES ('4015878', '3183', '671', '7276', '4200', '6597');
INSERT INTO `fw_code` VALUES ('4015879', '3183', '672', '3578', '9513', '8623');
INSERT INTO `fw_code` VALUES ('4015880', '3183', '673', '7490', '1668', '3614');
INSERT INTO `fw_code` VALUES ('4015881', '3183', '674', '7810', '7870', '9141');
INSERT INTO `fw_code` VALUES ('4015882', '3183', '675', '6502', '6342', '8203');
INSERT INTO `fw_code` VALUES ('4015883', '3183', '676', '4005', '4449', '2659');
INSERT INTO `fw_code` VALUES ('4015884', '3183', '677', '3298', '4318', '2936');
INSERT INTO `fw_code` VALUES ('4015885', '3183', '678', '8491', '1283', '0034');
INSERT INTO `fw_code` VALUES ('4015886', '3183', '679', '1548', '3565', '6954');
INSERT INTO `fw_code` VALUES ('4015887', '3183', '680', '7596', '0402', '2123');
INSERT INTO `fw_code` VALUES ('4015888', '3183', '681', '2270', '7985', '7686');
INSERT INTO `fw_code` VALUES ('4015889', '3183', '682', '2337', '5711', '6355');
INSERT INTO `fw_code` VALUES ('4015890', '3183', '683', '7103', '7739', '9418');
INSERT INTO `fw_code` VALUES ('4015891', '3183', '684', '1696', '3306', '5302');
INSERT INTO `fw_code` VALUES ('4015892', '3183', '685', '7062', '6731', '9579');
INSERT INTO `fw_code` VALUES ('4015893', '3183', '686', '9346', '1156', '8105');
INSERT INTO `fw_code` VALUES ('4015894', '3183', '687', '5821', '2930', '7311');
INSERT INTO `fw_code` VALUES ('4015895', '3183', '688', '8959', '7227', '3909');
INSERT INTO `fw_code` VALUES ('4015896', '3183', '689', '9707', '8366', '3471');
INSERT INTO `fw_code` VALUES ('4015897', '3183', '690', '9519', '7616', '5284');
INSERT INTO `fw_code` VALUES ('4015898', '3183', '691', '7703', '9136', '0632');
INSERT INTO `fw_code` VALUES ('4015899', '3183', '692', '9386', '2164', '7944');
INSERT INTO `fw_code` VALUES ('4015900', '3183', '693', '8171', '5080', '4507');
INSERT INTO `fw_code` VALUES ('4015901', '3183', '694', '0200', '1029', '6177');
INSERT INTO `fw_code` VALUES ('4015902', '3183', '695', '0093', '2295', '7668');
INSERT INTO `fw_code` VALUES ('4015903', '3183', '696', '2977', '8116', '7409');
INSERT INTO `fw_code` VALUES ('4015904', '3183', '697', '7143', '8747', '9257');
INSERT INTO `fw_code` VALUES ('4015905', '3183', '698', '4046', '5457', '2498');
INSERT INTO `fw_code` VALUES ('4015906', '3183', '699', '5648', '6469', '0132');
INSERT INTO `fw_code` VALUES ('4015907', '3183', '700', '9733', '5084', '2302');
INSERT INTO `fw_code` VALUES ('4015908', '3183', '701', '9279', '3429', '9436');
INSERT INTO `fw_code` VALUES ('4015909', '3183', '702', '1055', '0902', '4248');
INSERT INTO `fw_code` VALUES ('4015910', '3183', '703', '4366', '1660', '8025');
INSERT INTO `fw_code` VALUES ('4015911', '3183', '704', '6996', '9005', '0909');
INSERT INTO `fw_code` VALUES ('4015912', '3183', '705', '4580', '9128', '5043');
INSERT INTO `fw_code` VALUES ('4015913', '3183', '706', '1228', '7362', '1427');
INSERT INTO `fw_code` VALUES ('4015914', '3183', '707', '6248', '7866', '1346');
INSERT INTO `fw_code` VALUES ('4015915', '3183', '708', '7423', '3941', '4945');
INSERT INTO `fw_code` VALUES ('4015916', '3183', '709', '3044', '5842', '6079');
INSERT INTO `fw_code` VALUES ('4015917', '3183', '710', '1909', '0775', '2320');
INSERT INTO `fw_code` VALUES ('4015918', '3183', '711', '8639', '1025', '8382');
INSERT INTO `fw_code` VALUES ('4015919', '3183', '712', '9931', '6425', '4973');
INSERT INTO `fw_code` VALUES ('4015920', '3183', '713', '0933', '6040', '1392');
INSERT INTO `fw_code` VALUES ('4015921', '3183', '714', '4671', '1734', '9204');
INSERT INTO `fw_code` VALUES ('4015922', '3183', '715', '3110', '1730', '1410');
INSERT INTO `fw_code` VALUES ('4015923', '3183', '716', '4030', '9329', '8151');
INSERT INTO `fw_code` VALUES ('4015924', '3183', '717', '3069', '0722', '1571');
INSERT INTO `fw_code` VALUES ('4015925', '3183', '718', '1681', '7179', '0955');
INSERT INTO `fw_code` VALUES ('4015926', '3183', '719', '1294', '3250', '6758');
INSERT INTO `fw_code` VALUES ('4015927', '3183', '720', '8369', '6421', '7178');
INSERT INTO `fw_code` VALUES ('4015928', '3183', '721', '1854', '3639', '8133');
INSERT INTO `fw_code` VALUES ('4015929', '3183', '722', '3710', '3127', '2624');
INSERT INTO `fw_code` VALUES ('4015930', '3183', '723', '1721', '8186', '0794');
INSERT INTO `fw_code` VALUES ('4015931', '3183', '724', '6834', '3135', '8214');
INSERT INTO `fw_code` VALUES ('4015932', '3183', '725', '2535', '7052', '9026');
INSERT INTO `fw_code` VALUES ('4015933', '3183', '726', '8756', '0349', '1374');
INSERT INTO `fw_code` VALUES ('4015934', '3183', '727', '5312', '4139', '0258');
INSERT INTO `fw_code` VALUES ('4015935', '3183', '728', '5806', '6802', '2964');
INSERT INTO `fw_code` VALUES ('4015936', '3183', '729', '6380', '1480', '5347');
INSERT INTO `fw_code` VALUES ('4015937', '3183', '730', '4310', '4524', '3839');
INSERT INTO `fw_code` VALUES ('4015938', '3183', '731', '2067', '1107', '5151');
INSERT INTO `fw_code` VALUES ('4015939', '3183', '732', '7942', '1484', '3142');
INSERT INTO `fw_code` VALUES ('4015940', '3183', '733', '3390', '6925', '7097');
INSERT INTO `fw_code` VALUES ('4015941', '3183', '734', '3029', '9714', '1731');
INSERT INTO `fw_code` VALUES ('4015942', '3183', '735', '9331', '5028', '3758');
INSERT INTO `fw_code` VALUES ('4015943', '3183', '736', '3242', '7183', '8749');
INSERT INTO `fw_code` VALUES ('4015944', '3183', '737', '3563', '3385', '4276');
INSERT INTO `fw_code` VALUES ('4015945', '3183', '738', '2255', '1857', '3338');
INSERT INTO `fw_code` VALUES ('4015946', '3183', '739', '9758', '9964', '7794');
INSERT INTO `fw_code` VALUES ('4015947', '3183', '740', '9051', '9833', '8070');
INSERT INTO `fw_code` VALUES ('4015948', '3183', '741', '7301', '9079', '2089');
INSERT INTO `fw_code` VALUES ('4015949', '3183', '742', '3349', '5917', '7258');
INSERT INTO `fw_code` VALUES ('4015950', '3183', '743', '0679', '7564', '4535');
INSERT INTO `fw_code` VALUES ('4015951', '3183', '744', '8089', '1226', '1490');
INSERT INTO `fw_code` VALUES ('4015952', '3183', '745', '2856', '3254', '4553');
INSERT INTO `fw_code` VALUES ('4015953', '3183', '746', '7449', '8821', '0437');
INSERT INTO `fw_code` VALUES ('4015954', '3183', '747', '2815', '2246', '4714');
INSERT INTO `fw_code` VALUES ('4015955', '3183', '748', '5099', '6671', '3240');
INSERT INTO `fw_code` VALUES ('4015956', '3183', '749', '1574', '8445', '2446');
INSERT INTO `fw_code` VALUES ('4015957', '3183', '750', '7368', '6806', '0758');
INSERT INTO `fw_code` VALUES ('4015958', '3183', '751', '8115', '7945', '0321');
INSERT INTO `fw_code` VALUES ('4015959', '3183', '752', '5272', '3131', '0419');
INSERT INTO `fw_code` VALUES ('4015960', '3183', '753', '3456', '4651', '5767');
INSERT INTO `fw_code` VALUES ('4015961', '3183', '754', '7795', '1742', '4794');
INSERT INTO `fw_code` VALUES ('4015962', '3183', '755', '3924', '0595', '9642');
INSERT INTO `fw_code` VALUES ('4015963', '3183', '756', '5846', '7810', '2803');
INSERT INTO `fw_code` VALUES ('4015964', '3183', '757', '8730', '3631', '2544');
INSERT INTO `fw_code` VALUES ('4015965', '3183', '758', '2896', '4262', '4392');
INSERT INTO `fw_code` VALUES ('4015966', '3183', '759', '9798', '0972', '7633');
INSERT INTO `fw_code` VALUES ('4015967', '3183', '760', '1401', '1984', '5267');
INSERT INTO `fw_code` VALUES ('4015968', '3183', '761', '5485', '0599', '7437');
INSERT INTO `fw_code` VALUES ('4015969', '3183', '762', '7688', '3008', '6285');
INSERT INTO `fw_code` VALUES ('4015970', '3183', '763', '6808', '6417', '9383');
INSERT INTO `fw_code` VALUES ('4015971', '3183', '764', '0119', '7175', '3160');
INSERT INTO `fw_code` VALUES ('4015972', '3183', '765', '2749', '4520', '6044');
INSERT INTO `fw_code` VALUES ('4015973', '3183', '766', '0332', '4643', '0178');
INSERT INTO `fw_code` VALUES ('4015974', '3183', '767', '6981', '2877', '6562');
INSERT INTO `fw_code` VALUES ('4015975', '3183', '768', '2001', '3381', '6481');
INSERT INTO `fw_code` VALUES ('4015976', '3183', '769', '3176', '9456', '0079');
INSERT INTO `fw_code` VALUES ('4015977', '3183', '770', '8797', '1357', '1213');
INSERT INTO `fw_code` VALUES ('4015978', '3183', '771', '7662', '6290', '7454');
INSERT INTO `fw_code` VALUES ('4015979', '3183', '772', '7047', '0603', '5231');
INSERT INTO `fw_code` VALUES ('4015980', '3183', '773', '6767', '5409', '9544');
INSERT INTO `fw_code` VALUES ('4015981', '3183', '774', '7769', '5024', '5963');
INSERT INTO `fw_code` VALUES ('4015982', '3183', '775', '1507', '0718', '3776');
INSERT INTO `fw_code` VALUES ('4015983', '3183', '776', '2601', '4778', '7696');
INSERT INTO `fw_code` VALUES ('4015984', '3183', '777', '0867', '8313', '2722');
INSERT INTO `fw_code` VALUES ('4015985', '3183', '778', '9905', '9706', '6142');
INSERT INTO `fw_code` VALUES ('4015986', '3183', '779', '1320', '9968', '5589');
INSERT INTO `fw_code` VALUES ('4015987', '3183', '780', '0786', '6298', '3044');
INSERT INTO `fw_code` VALUES ('4015988', '3183', '781', '5205', '5405', '1749');
INSERT INTO `fw_code` VALUES ('4015989', '3183', '782', '8690', '2623', '2705');
INSERT INTO `fw_code` VALUES ('4015990', '3183', '783', '0546', '2111', '7195');
INSERT INTO `fw_code` VALUES ('4015991', '3183', '784', '1213', '1234', '7080');
INSERT INTO `fw_code` VALUES ('4015992', '3183', '785', '3670', '2119', '2785');
INSERT INTO `fw_code` VALUES ('4015993', '3183', '786', '9371', '6036', '3597');
INSERT INTO `fw_code` VALUES ('4015994', '3183', '787', '5592', '9333', '5946');
INSERT INTO `fw_code` VALUES ('4015995', '3183', '788', '2148', '3123', '4829');
INSERT INTO `fw_code` VALUES ('4015996', '3183', '789', '2642', '5786', '7535');
INSERT INTO `fw_code` VALUES ('4015997', '3183', '790', '5872', '4528', '1633');
INSERT INTO `fw_code` VALUES ('4015998', '3183', '791', '1147', '3508', '8410');
INSERT INTO `fw_code` VALUES ('4015999', '3183', '792', '8903', '0091', '9722');
INSERT INTO `fw_code` VALUES ('4016000', '3183', '793', '4778', '0468', '7713');
INSERT INTO `fw_code` VALUES ('4016001', '3183', '794', '9865', '8699', '6303');
INSERT INTO `fw_code` VALUES ('4016002', '3183', '795', '6167', '4012', '8329');
INSERT INTO `fw_code` VALUES ('4016003', '3183', '796', '0078', '6167', '3321');
INSERT INTO `fw_code` VALUES ('4016004', '3183', '797', '0399', '2369', '8847');
INSERT INTO `fw_code` VALUES ('4016005', '3183', '798', '1747', '4905', '9624');
INSERT INTO `fw_code` VALUES ('4016006', '3183', '799', '6594', '8948', '2365');
INSERT INTO `fw_code` VALUES ('4016007', '3183', '800', '8543', '2881', '4356');
INSERT INTO `fw_code` VALUES ('4016008', '3183', '801', '1080', '5782', '9740');
INSERT INTO `fw_code` VALUES ('4016009', '3183', '802', '8761', '9059', '2823');
INSERT INTO `fw_code` VALUES ('4016010', '3183', '803', '8828', '6785', '1493');
INSERT INTO `fw_code` VALUES ('4016011', '3183', '804', '0938', '4749', '2841');
INSERT INTO `fw_code` VALUES ('4016012', '3183', '805', '8187', '4380', '0440');
INSERT INTO `fw_code` VALUES ('4016013', '3183', '806', '0897', '3741', '3002');
INSERT INTO `fw_code` VALUES ('4016014', '3183', '807', '3181', '8166', '1529');
INSERT INTO `fw_code` VALUES ('4016015', '3183', '808', '9656', '9940', '0734');
INSERT INTO `fw_code` VALUES ('4016016', '3183', '809', '5450', '8301', '9047');
INSERT INTO `fw_code` VALUES ('4016017', '3183', '810', '6198', '9440', '8609');
INSERT INTO `fw_code` VALUES ('4016018', '3183', '811', '3354', '4626', '8707');
INSERT INTO `fw_code` VALUES ('4016019', '3183', '812', '1538', '6146', '4056');
INSERT INTO `fw_code` VALUES ('4016020', '3183', '813', '5877', '3237', '3082');
INSERT INTO `fw_code` VALUES ('4016021', '3183', '814', '2006', '2090', '7930');
INSERT INTO `fw_code` VALUES ('4016022', '3183', '815', '4036', '8039', '9600');
INSERT INTO `fw_code` VALUES ('4016023', '3183', '816', '3929', '9305', '1091');
INSERT INTO `fw_code` VALUES ('4016024', '3183', '817', '9468', '9190', '2547');
INSERT INTO `fw_code` VALUES ('4016025', '3183', '818', '3634', '9821', '4395');
INSERT INTO `fw_code` VALUES ('4016026', '3183', '819', '2139', '7543', '5270');
INSERT INTO `fw_code` VALUES ('4016027', '3183', '820', '3568', '2094', '5725');
INSERT INTO `fw_code` VALUES ('4016028', '3183', '821', '5770', '4503', '4573');
INSERT INTO `fw_code` VALUES ('4016029', '3183', '822', '7546', '1976', '9386');
INSERT INTO `fw_code` VALUES ('4016030', '3183', '823', '0857', '2733', '3163');
INSERT INTO `fw_code` VALUES ('4016031', '3183', '824', '0831', '6015', '4332');
INSERT INTO `fw_code` VALUES ('4016032', '3183', '825', '1071', '0202', '0181');
INSERT INTO `fw_code` VALUES ('4016033', '3183', '826', '5063', '4372', '4850');
INSERT INTO `fw_code` VALUES ('4016034', '3183', '827', '0083', '4876', '4770');
INSERT INTO `fw_code` VALUES ('4016035', '3183', '828', '1258', '0951', '8368');
INSERT INTO `fw_code` VALUES ('4016036', '3183', '829', '6879', '2852', '9502');
INSERT INTO `fw_code` VALUES ('4016037', '3183', '830', '8400', '1849', '7457');
INSERT INTO `fw_code` VALUES ('4016038', '3183', '831', '4850', '6904', '7832');
INSERT INTO `fw_code` VALUES ('4016039', '3183', '832', '8507', '0583', '5966');
INSERT INTO `fw_code` VALUES ('4016040', '3183', '833', '0684', '6273', '5984');
INSERT INTO `fw_code` VALUES ('4016041', '3183', '834', '1605', '3872', '2725');
INSERT INTO `fw_code` VALUES ('4016042', '3183', '835', '0643', '5265', '6145');
INSERT INTO `fw_code` VALUES ('4016043', '3183', '836', '9255', '1722', '5529');
INSERT INTO `fw_code` VALUES ('4016044', '3183', '837', '9402', '1463', '3877');
INSERT INTO `fw_code` VALUES ('4016045', '3183', '838', '8868', '7793', '1332');
INSERT INTO `fw_code` VALUES ('4016046', '3183', '839', '3288', '6900', '0037');
INSERT INTO `fw_code` VALUES ('4016047', '3183', '840', '6772', '4118', '0993');
INSERT INTO `fw_code` VALUES ('4016048', '3183', '841', '1284', '7670', '7198');
INSERT INTO `fw_code` VALUES ('4016049', '3183', '842', '9295', '2729', '5368');
INSERT INTO `fw_code` VALUES ('4016050', '3183', '843', '1752', '3614', '1073');
INSERT INTO `fw_code` VALUES ('4016051', '3183', '844', '0109', '1595', '3600');
INSERT INTO `fw_code` VALUES ('4016052', '3183', '845', '3675', '0829', '4234');
INSERT INTO `fw_code` VALUES ('4016053', '3183', '846', '2886', '8682', '4832');
INSERT INTO `fw_code` VALUES ('4016054', '3183', '847', '0724', '7281', '5823');
INSERT INTO `fw_code` VALUES ('4016055', '3183', '848', '3955', '6023', '9922');
INSERT INTO `fw_code` VALUES ('4016056', '3183', '849', '9229', '5003', '6698');
INSERT INTO `fw_code` VALUES ('4016057', '3183', '850', '6986', '1586', '8011');
INSERT INTO `fw_code` VALUES ('4016058', '3183', '851', '0964', '1468', '1672');
INSERT INTO `fw_code` VALUES ('4016059', '3183', '852', '7947', '0194', '4591');
INSERT INTO `fw_code` VALUES ('4016060', '3183', '853', '4249', '5507', '6618');
INSERT INTO `fw_code` VALUES ('4016061', '3183', '854', '8161', '7662', '1609');
INSERT INTO `fw_code` VALUES ('4016062', '3183', '855', '8481', '3864', '7136');
INSERT INTO `fw_code` VALUES ('4016063', '3183', '856', '9829', '6400', '7913');
INSERT INTO `fw_code` VALUES ('4016064', '3183', '857', '7332', '4507', '2368');
INSERT INTO `fw_code` VALUES ('4016065', '3183', '858', '6625', '4376', '2645');
INSERT INTO `fw_code` VALUES ('4016066', '3183', '859', '1818', '1341', '9743');
INSERT INTO `fw_code` VALUES ('4016067', '3183', '860', '2220', '9559', '4948');
INSERT INTO `fw_code` VALUES ('4016068', '3183', '861', '8268', '6396', '0118');
INSERT INTO `fw_code` VALUES ('4016069', '3183', '862', '5597', '8043', '7395');
INSERT INTO `fw_code` VALUES ('4016070', '3183', '863', '5664', '5769', '6065');
INSERT INTO `fw_code` VALUES ('4016071', '3183', '864', '0430', '7797', '9127');
INSERT INTO `fw_code` VALUES ('4016072', '3183', '865', '5023', '3364', '5011');
INSERT INTO `fw_code` VALUES ('4016073', '3183', '866', '7734', '2725', '7573');
INSERT INTO `fw_code` VALUES ('4016074', '3183', '867', '2673', '1214', '7815');
INSERT INTO `fw_code` VALUES ('4016075', '3183', '868', '9148', '2987', '7020');
INSERT INTO `fw_code` VALUES ('4016076', '3183', '869', '2286', '7285', '3618');
INSERT INTO `fw_code` VALUES ('4016077', '3183', '870', '3034', '8424', '3180');
INSERT INTO `fw_code` VALUES ('4016078', '3183', '871', '0190', '3610', '3279');
INSERT INTO `fw_code` VALUES ('4016079', '3183', '872', '8374', '5130', '8627');
INSERT INTO `fw_code` VALUES ('4016080', '3183', '873', '2713', '2221', '7654');
INSERT INTO `fw_code` VALUES ('4016081', '3183', '874', '1498', '5138', '4216');
INSERT INTO `fw_code` VALUES ('4016082', '3183', '875', '3527', '1087', '5886');
INSERT INTO `fw_code` VALUES ('4016083', '3183', '876', '6305', '8174', '7118');
INSERT INTO `fw_code` VALUES ('4016084', '3183', '877', '0470', '8805', '8966');
INSERT INTO `fw_code` VALUES ('4016085', '3183', '878', '7373', '5515', '2207');
INSERT INTO `fw_code` VALUES ('4016086', '3183', '879', '8975', '6527', '9841');
INSERT INTO `fw_code` VALUES ('4016087', '3183', '880', '0404', '1078', '0296');
INSERT INTO `fw_code` VALUES ('4016088', '3183', '881', '2606', '3487', '9145');
INSERT INTO `fw_code` VALUES ('4016089', '3183', '882', '4382', '0960', '3957');
INSERT INTO `fw_code` VALUES ('4016090', '3183', '883', '7693', '1717', '7734');
INSERT INTO `fw_code` VALUES ('4016091', '3183', '884', '0323', '9063', '0618');
INSERT INTO `fw_code` VALUES ('4016092', '3183', '885', '4168', '1653', '3601');
INSERT INTO `fw_code` VALUES ('4016093', '3183', '886', '8160', '5823', '8270');
INSERT INTO `fw_code` VALUES ('4016094', '3183', '887', '5836', '0391', '9905');
INSERT INTO `fw_code` VALUES ('4016095', '3183', '888', '9976', '4303', '2922');
INSERT INTO `fw_code` VALUES ('4016096', '3183', '889', '1497', '3300', '0878');
INSERT INTO `fw_code` VALUES ('4016097', '3183', '890', '8227', '3550', '6940');
INSERT INTO `fw_code` VALUES ('4016098', '3183', '891', '1604', '2034', '9387');
INSERT INTO `fw_code` VALUES ('4016099', '3183', '892', '5343', '7728', '7199');
INSERT INTO `fw_code` VALUES ('4016100', '3183', '893', '3781', '7724', '9404');
INSERT INTO `fw_code` VALUES ('4016101', '3183', '894', '3740', '6716', '9565');
INSERT INTO `fw_code` VALUES ('4016102', '3183', '895', '2352', '3173', '8949');
INSERT INTO `fw_code` VALUES ('4016103', '3183', '896', '1965', '9244', '4753');
INSERT INTO `fw_code` VALUES ('4016104', '3183', '897', '9041', '2415', '5172');
INSERT INTO `fw_code` VALUES ('4016105', '3183', '898', '9869', '5569', '4413');
INSERT INTO `fw_code` VALUES ('4016106', '3183', '899', '4381', '9121', '0619');
INSERT INTO `fw_code` VALUES ('4016107', '3183', '900', '3206', '3046', '7021');
INSERT INTO `fw_code` VALUES ('4016108', '3183', '901', '5984', '0133', '8253');
INSERT INTO `fw_code` VALUES ('4016109', '3183', '902', '6477', '2796', '0958');
INSERT INTO `fw_code` VALUES ('4016110', '3183', '903', '7052', '7474', '3342');
INSERT INTO `fw_code` VALUES ('4016111', '3183', '904', '4982', '0518', '1833');
INSERT INTO `fw_code` VALUES ('4016112', '3183', '905', '8613', '7478', '1137');
INSERT INTO `fw_code` VALUES ('4016113', '3183', '906', '4061', '2919', '5092');
INSERT INTO `fw_code` VALUES ('4016114', '3183', '907', '0002', '1022', '1753');
INSERT INTO `fw_code` VALUES ('4016115', '3183', '908', '3914', '3177', '6744');
INSERT INTO `fw_code` VALUES ('4016116', '3183', '909', '4234', '9379', '2271');
INSERT INTO `fw_code` VALUES ('4016117', '3183', '910', '2926', '7851', '1333');
INSERT INTO `fw_code` VALUES ('4016118', '3183', '911', '0429', '5958', '5788');
INSERT INTO `fw_code` VALUES ('4016119', '3183', '912', '7973', '5073', '0083');
INSERT INTO `fw_code` VALUES ('4016120', '3183', '913', '4020', '1911', '5253');
INSERT INTO `fw_code` VALUES ('4016121', '3183', '914', '8694', '9494', '0815');
INSERT INTO `fw_code` VALUES ('4016122', '3183', '915', '8120', '4815', '8431');
INSERT INTO `fw_code` VALUES ('4016123', '3183', '916', '3486', '8240', '2708');
INSERT INTO `fw_code` VALUES ('4016124', '3183', '917', '5383', '8736', '7038');
INSERT INTO `fw_code` VALUES ('4016125', '3183', '918', '6131', '9875', '6601');
INSERT INTO `fw_code` VALUES ('4016126', '3183', '919', '4127', '0645', '3762');
INSERT INTO `fw_code` VALUES ('4016127', '3183', '920', '5810', '3672', '1074');
INSERT INTO `fw_code` VALUES ('4016128', '3183', '921', '4595', '6589', '7637');
INSERT INTO `fw_code` VALUES ('4016129', '3183', '922', '6624', '2538', '9306');
INSERT INTO `fw_code` VALUES ('4016130', '3183', '923', '6518', '3804', '0797');
INSERT INTO `fw_code` VALUES ('4016131', '3183', '924', '3567', '0256', '2386');
INSERT INTO `fw_code` VALUES ('4016132', '3183', '925', '2072', '7978', '3261');
INSERT INTO `fw_code` VALUES ('4016133', '3183', '926', '6157', '6593', '5431');
INSERT INTO `fw_code` VALUES ('4016134', '3183', '927', '5704', '4938', '2565');
INSERT INTO `fw_code` VALUES ('4016135', '3183', '928', '7479', '2411', '7378');
INSERT INTO `fw_code` VALUES ('4016136', '3183', '929', '0790', '3169', '1154');
INSERT INTO `fw_code` VALUES ('4016137', '3183', '930', '3420', '0514', '4038');
INSERT INTO `fw_code` VALUES ('4016138', '3183', '931', '1004', '0637', '8172');
INSERT INTO `fw_code` VALUES ('4016139', '3183', '932', '2672', '9375', '4476');
INSERT INTO `fw_code` VALUES ('4016140', '3183', '933', '3847', '5450', '8074');
INSERT INTO `fw_code` VALUES ('4016141', '3183', '934', '8333', '2284', '5449');
INSERT INTO `fw_code` VALUES ('4016142', '3183', '935', '7438', '1403', '7538');
INSERT INTO `fw_code` VALUES ('4016143', '3183', '936', '8440', '1018', '3958');
INSERT INTO `fw_code` VALUES ('4016144', '3183', '937', '0617', '6708', '3976');
INSERT INTO `fw_code` VALUES ('4016145', '3183', '938', '9188', '2157', '3520');
INSERT INTO `fw_code` VALUES ('4016146', '3183', '939', '8801', '8228', '9324');
INSERT INTO `fw_code` VALUES ('4016147', '3183', '940', '9361', '8617', '0699');
INSERT INTO `fw_code` VALUES ('4016148', '3183', '941', '1217', '8105', '5190');
INSERT INTO `fw_code` VALUES ('4016149', '3183', '942', '9228', '3164', '3360');
INSERT INTO `fw_code` VALUES ('4016150', '3183', '943', '4341', '8113', '0780');
INSERT INTO `fw_code` VALUES ('4016151', '3183', '944', '0042', '2030', '1592');
INSERT INTO `fw_code` VALUES ('4016152', '3183', '945', '9244', '0626', '5953');
INSERT INTO `fw_code` VALUES ('4016153', '3183', '946', '9737', '3289', '8659');
INSERT INTO `fw_code` VALUES ('4016154', '3183', '947', '0312', '7967', '1043');
INSERT INTO `fw_code` VALUES ('4016155', '3183', '948', '8242', '1011', '9534');
INSERT INTO `fw_code` VALUES ('4016156', '3183', '949', '1874', '7971', '8837');
INSERT INTO `fw_code` VALUES ('4016157', '3183', '950', '7321', '3412', '2793');
INSERT INTO `fw_code` VALUES ('4016158', '3183', '951', '6960', '6201', '7427');
INSERT INTO `fw_code` VALUES ('4016159', '3183', '952', '7174', '3670', '4445');
INSERT INTO `fw_code` VALUES ('4016160', '3183', '953', '7494', '9872', '9971');
INSERT INTO `fw_code` VALUES ('4016161', '3183', '954', '6187', '8344', '9034');
INSERT INTO `fw_code` VALUES ('4016162', '3183', '955', '3689', '6451', '3489');
INSERT INTO `fw_code` VALUES ('4016163', '3183', '956', '2982', '6320', '3766');
INSERT INTO `fw_code` VALUES ('4016164', '3183', '957', '8176', '3285', '0864');
INSERT INTO `fw_code` VALUES ('4016165', '3183', '958', '1233', '5566', '7784');
INSERT INTO `fw_code` VALUES ('4016166', '3183', '959', '7281', '2404', '2954');
INSERT INTO `fw_code` VALUES ('4016167', '3183', '960', '4610', '4051', '0230');
INSERT INTO `fw_code` VALUES ('4016168', '3183', '961', '2021', '7713', '7185');
INSERT INTO `fw_code` VALUES ('4016169', '3183', '962', '6787', '9741', '0248');
INSERT INTO `fw_code` VALUES ('4016170', '3183', '963', '1380', '5308', '6132');
INSERT INTO `fw_code` VALUES ('4016171', '3183', '964', '6747', '8733', '0409');
INSERT INTO `fw_code` VALUES ('4016172', '3183', '965', '1299', '3293', '6454');
INSERT INTO `fw_code` VALUES ('4016173', '3183', '966', '9203', '9618', '6114');
INSERT INTO `fw_code` VALUES ('4016174', '3183', '967', '7387', '1138', '1462');
INSERT INTO `fw_code` VALUES ('4016175', '3183', '968', '1726', '8229', '0489');
INSERT INTO `fw_code` VALUES ('4016176', '3183', '969', '7855', '7082', '5337');
INSERT INTO `fw_code` VALUES ('4016177', '3183', '970', '9778', '4296', '8498');
INSERT INTO `fw_code` VALUES ('4016178', '3183', '971', '6827', '0749', '0087');
INSERT INTO `fw_code` VALUES ('4016179', '3183', '972', '3730', '7459', '3328');
INSERT INTO `fw_code` VALUES ('4016180', '3183', '973', '5332', '8471', '0962');
INSERT INTO `fw_code` VALUES ('4016181', '3183', '974', '9417', '7086', '3132');
INSERT INTO `fw_code` VALUES ('4016182', '3183', '975', '1619', '9495', '1980');
INSERT INTO `fw_code` VALUES ('4016183', '3183', '976', '0739', '2904', '5078');
INSERT INTO `fw_code` VALUES ('4016184', '3183', '977', '4050', '3662', '8855');
INSERT INTO `fw_code` VALUES ('4016185', '3183', '978', '0912', '9364', '2257');
INSERT INTO `fw_code` VALUES ('4016186', '3183', '979', '5932', '9868', '2177');
INSERT INTO `fw_code` VALUES ('4016187', '3183', '980', '7107', '5943', '5775');
INSERT INTO `fw_code` VALUES ('4016188', '3183', '981', '0979', '7090', '0927');
INSERT INTO `fw_code` VALUES ('4016189', '3183', '982', '0699', '1896', '5239');
INSERT INTO `fw_code` VALUES ('4016190', '3183', '983', '1700', '1511', '1659');
INSERT INTO `fw_code` VALUES ('4016191', '3183', '984', '5439', '7205', '9471');
INSERT INTO `fw_code` VALUES ('4016192', '3183', '985', '6533', '1265', '3391');
INSERT INTO `fw_code` VALUES ('4016193', '3183', '986', '4798', '4800', '8418');
INSERT INTO `fw_code` VALUES ('4016194', '3183', '987', '2448', '2650', '1221');
INSERT INTO `fw_code` VALUES ('4016195', '3183', '988', '4717', '2785', '8739');
INSERT INTO `fw_code` VALUES ('4016196', '3183', '989', '9137', '1892', '7444');
INSERT INTO `fw_code` VALUES ('4016197', '3183', '990', '5144', '7721', '2775');
INSERT INTO `fw_code` VALUES ('4016198', '3183', '991', '7601', '8606', '8480');
INSERT INTO `fw_code` VALUES ('4016199', '3183', '992', '3303', '2523', '9293');
INSERT INTO `fw_code` VALUES ('4016200', '3183', '993', '6573', '2273', '3230');
INSERT INTO `fw_code` VALUES ('4016201', '3183', '994', '9804', '1015', '7329');
INSERT INTO `fw_code` VALUES ('4016202', '3183', '995', '5078', '9995', '4105');
INSERT INTO `fw_code` VALUES ('4016203', '3183', '996', '8710', '6955', '3409');
INSERT INTO `fw_code` VALUES ('4016204', '3183', '997', '4157', '2396', '7364');
INSERT INTO `fw_code` VALUES ('4016205', '3183', '998', '3796', '5185', '1998');
INSERT INTO `fw_code` VALUES ('4016206', '3183', '999', '0098', '0499', '4025');
INSERT INTO `fw_code` VALUES ('4016207', '3183', '1000', '4330', '8856', '4543');
INSERT INTO `fw_code` VALUES ('4016208', '3183', '1001', '5678', '1392', '5320');
INSERT INTO `fw_code` VALUES ('4016209', '3183', '1002', '0525', '5435', '8061');
INSERT INTO `fw_code` VALUES ('4016210', '3183', '1003', '2474', '9368', '0052');
INSERT INTO `fw_code` VALUES ('4016211', '3183', '1004', '4117', '1388', '7525');
INSERT INTO `fw_code` VALUES ('4016212', '3183', '1005', '1446', '3035', '4802');
INSERT INTO `fw_code` VALUES ('4016213', '3183', '1006', '3623', '8725', '4819');
INSERT INTO `fw_code` VALUES ('4016214', '3183', '1007', '3583', '7717', '4980');
INSERT INTO `fw_code` VALUES ('4016215', '3183', '1008', '5866', '2142', '3507');
INSERT INTO `fw_code` VALUES ('4016216', '3183', '1009', '2341', '3916', '2712');
INSERT INTO `fw_code` VALUES ('4016217', '3183', '1010', '8135', '2277', '1025');
INSERT INTO `fw_code` VALUES ('4016218', '3183', '1011', '8883', '3416', '0587');
INSERT INTO `fw_code` VALUES ('4016219', '3183', '1012', '5967', '8489', '3889');
INSERT INTO `fw_code` VALUES ('4016220', '3183', '1013', '3429', '5589', '8506');
INSERT INTO `fw_code` VALUES ('4016221', '3183', '1014', '7595', '6220', '0354');
INSERT INTO `fw_code` VALUES ('4016222', '3183', '1015', '5031', '6601', '6140');
INSERT INTO `fw_code` VALUES ('4016223', '3183', '1016', '4044', '1275', '0729');
INSERT INTO `fw_code` VALUES ('4016224', '3183', '1017', '5219', '7350', '4327');
INSERT INTO `fw_code` VALUES ('4016225', '3183', '1018', '0840', '9251', '5461');
INSERT INTO `fw_code` VALUES ('4016226', '3183', '1019', '9090', '8498', '9479');
INSERT INTO `fw_code` VALUES ('4016227', '3183', '1020', '4645', '2672', '1943');
INSERT INTO `fw_code` VALUES ('4016228', '3183', '1021', '5565', '0271', '8684');
INSERT INTO `fw_code` VALUES ('4016229', '3183', '1022', '0733', '0517', '6952');
INSERT INTO `fw_code` VALUES ('4016230', '3183', '1023', '5245', '4069', '3158');
INSERT INTO `fw_code` VALUES ('4016231', '3183', '1024', '7915', '2422', '5881');
INSERT INTO `fw_code` VALUES ('4016232', '3183', '1025', '3190', '1402', '2657');
INSERT INTO `fw_code` VALUES ('4016233', '3183', '1026', '6821', '8362', '1961');
INSERT INTO `fw_code` VALUES ('4016234', '3183', '1027', '4925', '7867', '7631');
INSERT INTO `fw_code` VALUES ('4016235', '3183', '1028', '2122', '4061', '7568');
INSERT INTO `fw_code` VALUES ('4016236', '3183', '1029', '3790', '2799', '3872');
INSERT INTO `fw_code` VALUES ('4016237', '3183', '1030', '5779', '7740', '5702');
INSERT INTO `fw_code` VALUES ('4016238', '3183', '1031', '2228', '2795', '6077');
INSERT INTO `fw_code` VALUES ('4016239', '3183', '1032', '9624', '2168', '2024');
INSERT INTO `fw_code` VALUES ('4016240', '3183', '1033', '4391', '4196', '5086');
INSERT INTO `fw_code` VALUES ('4016241', '3183', '1034', '1694', '9124', '3532');
INSERT INTO `fw_code` VALUES ('4016242', '3183', '1035', '6634', '7613', '3774');
INSERT INTO `fw_code` VALUES ('4016243', '3183', '1036', '6247', '3684', '9577');
INSERT INTO `fw_code` VALUES ('4016244', '3183', '1037', '6994', '4823', '9140');
INSERT INTO `fw_code` VALUES ('4016245', '3183', '1038', '4151', '0009', '9238');
INSERT INTO `fw_code` VALUES ('4016246', '3183', '1039', '6674', '8620', '3613');
INSERT INTO `fw_code` VALUES ('4016247', '3183', '1040', '7381', '8752', '3336');
INSERT INTO `fw_code` VALUES ('4016248', '3183', '1041', '1333', '1914', '8166');
INSERT INTO `fw_code` VALUES ('4016249', '3183', '1042', '4365', '7477', '6255');
INSERT INTO `fw_code` VALUES ('4016250', '3183', '1043', '1867', '5585', '0711');
INSERT INTO `fw_code` VALUES ('4016251', '3183', '1044', '3536', '4323', '7015');
INSERT INTO `fw_code` VALUES ('4016252', '3183', '1045', '4711', '0398', '0613');
INSERT INTO `fw_code` VALUES ('4016253', '3183', '1046', '7676', '8235', '0032');
INSERT INTO `fw_code` VALUES ('4016254', '3183', '1047', '9197', '7232', '7988');
INSERT INTO `fw_code` VALUES ('4016255', '3183', '1048', '5646', '2287', '8363');
INSERT INTO `fw_code` VALUES ('4016256', '3183', '1049', '2402', '9255', '3256');
INSERT INTO `fw_code` VALUES ('4016257', '3183', '1050', '1440', '0648', '6675');
INSERT INTO `fw_code` VALUES ('4016258', '3183', '1051', '0052', '7105', '6059');
INSERT INTO `fw_code` VALUES ('4016259', '3183', '1052', '9665', '3176', '1863');
INSERT INTO `fw_code` VALUES ('4016260', '3183', '1053', '7569', '9501', '1523');
INSERT INTO `fw_code` VALUES ('4016261', '3183', '1054', '8810', '1464', '0453');
INSERT INTO `fw_code` VALUES ('4016262', '3183', '1055', '9944', '6532', '4212');
INSERT INTO `fw_code` VALUES ('4016263', '3183', '1056', '0438', '9195', '6917');
INSERT INTO `fw_code` VALUES ('4016264', '3183', '1057', '1012', '3873', '9301');
INSERT INTO `fw_code` VALUES ('4016265', '3183', '1058', '2574', '3877', '7096');
INSERT INTO `fw_code` VALUES ('4016266', '3183', '1059', '8022', '9318', '1051');
INSERT INTO `fw_code` VALUES ('4016267', '3183', '1060', '7661', '2108', '5685');
INSERT INTO `fw_code` VALUES ('4016268', '3183', '1061', '7874', '9576', '2703');
INSERT INTO `fw_code` VALUES ('4016269', '3183', '1062', '2655', '5893', '6774');
INSERT INTO `fw_code` VALUES ('4016270', '3183', '1063', '2721', '3619', '5444');
INSERT INTO `fw_code` VALUES ('4016271', '3183', '1064', '6206', '0838', '6399');
INSERT INTO `fw_code` VALUES ('4016272', '3183', '1065', '9344', '5135', '2997');
INSERT INTO `fw_code` VALUES ('4016273', '3183', '1066', '0092', '6274', '2560');
INSERT INTO `fw_code` VALUES ('4016274', '3183', '1067', '9904', '5524', '4372');
INSERT INTO `fw_code` VALUES ('4016275', '3183', '1068', '9771', '0072', '7033');
INSERT INTO `fw_code` VALUES ('4016276', '3183', '1069', '8556', '2988', '3596');
INSERT INTO `fw_code` VALUES ('4016277', '3183', '1070', '0585', '8937', '5265');
INSERT INTO `fw_code` VALUES ('4016278', '3183', '1071', '6033', '4377', '9220');
INSERT INTO `fw_code` VALUES ('4016279', '3183', '1072', '0117', '2992', '1390');
INSERT INTO `fw_code` VALUES ('4016280', '3183', '1073', '4964', '7036', '4131');
INSERT INTO `fw_code` VALUES ('4016281', '3183', '1074', '2294', '8683', '1408');
INSERT INTO `fw_code` VALUES ('4016282', '3183', '1075', '9023', '8933', '7470');
INSERT INTO `fw_code` VALUES ('4016283', '3183', '1076', '2401', '7417', '9917');
INSERT INTO `fw_code` VALUES ('4016284', '3183', '1077', '5499', '0707', '6676');
INSERT INTO `fw_code` VALUES ('4016285', '3183', '1078', '3296', '8298', '7828');
INSERT INTO `fw_code` VALUES ('4016286', '3183', '1079', '2762', '4627', '5283');
INSERT INTO `fw_code` VALUES ('4016287', '3183', '1080', '9837', '7798', '5703');
INSERT INTO `fw_code` VALUES ('4016288', '3183', '1081', '3322', '5016', '6658');
INSERT INTO `fw_code` VALUES ('4016289', '3183', '1082', '5178', '4504', '1149');
INSERT INTO `fw_code` VALUES ('4016290', '3183', '1083', '3189', '9564', '9319');
INSERT INTO `fw_code` VALUES ('4016291', '3183', '1084', '8302', '4512', '6739');
INSERT INTO `fw_code` VALUES ('4016292', '3183', '1085', '6780', '5516', '8783');
INSERT INTO `fw_code` VALUES ('4016293', '3183', '1086', '3535', '2484', '3676');
INSERT INTO `fw_code` VALUES ('4016294', '3183', '1087', '9410', '2861', '1667');
INSERT INTO `fw_code` VALUES ('4016295', '3183', '1088', '4858', '8302', '5622');
INSERT INTO `fw_code` VALUES ('4016296', '3183', '1089', '4497', '1092', '0256');
INSERT INTO `fw_code` VALUES ('4016297', '3183', '1090', '0799', '6405', '2283');
INSERT INTO `fw_code` VALUES ('4016298', '3183', '1091', '4817', '7294', '5783');
INSERT INTO `fw_code` VALUES ('4016299', '3183', '1092', '9557', '2603', '0015');
INSERT INTO `fw_code` VALUES ('4016300', '3183', '1093', '4324', '4631', '3078');
INSERT INTO `fw_code` VALUES ('4016301', '3183', '1094', '8917', '0199', '8962');
INSERT INTO `fw_code` VALUES ('4016302', '3183', '1095', '4283', '3623', '3238');
INSERT INTO `fw_code` VALUES ('4016303', '3183', '1096', '6567', '8048', '1765');
INSERT INTO `fw_code` VALUES ('4016304', '3183', '1097', '3042', '9822', '0971');
INSERT INTO `fw_code` VALUES ('4016305', '3183', '1098', '8836', '8183', '9283');
INSERT INTO `fw_code` VALUES ('4016306', '3183', '1099', '9583', '9322', '8846');
INSERT INTO `fw_code` VALUES ('4016307', '3183', '1100', '6740', '4508', '8944');
INSERT INTO `fw_code` VALUES ('4016308', '3183', '1101', '0509', '5630', '7036');
INSERT INTO `fw_code` VALUES ('4016309', '3183', '1102', '6638', '4483', '1884');
INSERT INTO `fw_code` VALUES ('4016310', '3183', '1103', '8668', '0432', '3554');
INSERT INTO `fw_code` VALUES ('4016311', '3183', '1104', '8561', '1698', '5045');
INSERT INTO `fw_code` VALUES ('4016312', '3183', '1105', '1445', '7519', '4786');
INSERT INTO `fw_code` VALUES ('4016313', '3183', '1106', '5610', '8150', '6634');
INSERT INTO `fw_code` VALUES ('4016314', '3183', '1107', '2513', '4860', '9875');
INSERT INTO `fw_code` VALUES ('4016315', '3183', '1108', '4115', '5872', '7509');
INSERT INTO `fw_code` VALUES ('4016316', '3183', '1109', '8200', '4487', '9679');
INSERT INTO `fw_code` VALUES ('4016317', '3183', '1110', '0402', '6896', '8527');
INSERT INTO `fw_code` VALUES ('4016318', '3183', '1111', '9522', '0305', '1625');
INSERT INTO `fw_code` VALUES ('4016319', '3183', '1112', '2833', '1063', '5402');
INSERT INTO `fw_code` VALUES ('4016320', '3183', '1113', '5463', '8408', '8286');
INSERT INTO `fw_code` VALUES ('4016321', '3183', '1114', '3047', '8531', '2420');
INSERT INTO `fw_code` VALUES ('4016322', '3183', '1115', '4715', '7269', '8723');
INSERT INTO `fw_code` VALUES ('4016323', '3183', '1116', '5890', '3344', '2321');
INSERT INTO `fw_code` VALUES ('4016324', '3183', '1117', '1511', '5245', '3455');
INSERT INTO `fw_code` VALUES ('4016325', '3183', '1118', '0377', '0178', '9696');
INSERT INTO `fw_code` VALUES ('4016326', '3183', '1119', '9762', '4492', '7473');
INSERT INTO `fw_code` VALUES ('4016327', '3183', '1120', '0483', '8912', '8205');
INSERT INTO `fw_code` VALUES ('4016328', '3183', '1121', '4222', '4606', '6018');
INSERT INTO `fw_code` VALUES ('4016329', '3183', '1122', '5316', '8666', '9938');
INSERT INTO `fw_code` VALUES ('4016330', '3183', '1123', '3581', '2202', '4964');
INSERT INTO `fw_code` VALUES ('4016331', '3183', '1124', '2620', '3594', '8384');
INSERT INTO `fw_code` VALUES ('4016332', '3183', '1125', '1231', '0051', '7768');
INSERT INTO `fw_code` VALUES ('4016333', '3183', '1126', '3500', '0186', '5286');
INSERT INTO `fw_code` VALUES ('4016334', '3183', '1127', '7920', '9293', '3991');
INSERT INTO `fw_code` VALUES ('4016335', '3183', '1128', '1404', '6511', '4947');
INSERT INTO `fw_code` VALUES ('4016336', '3183', '1129', '3260', '5999', '9437');
INSERT INTO `fw_code` VALUES ('4016337', '3183', '1130', '3927', '5122', '9322');
INSERT INTO `fw_code` VALUES ('4016338', '3183', '1131', '6384', '6007', '5027');
INSERT INTO `fw_code` VALUES ('4016339', '3183', '1132', '2086', '9924', '5839');
INSERT INTO `fw_code` VALUES ('4016340', '3183', '1133', '4863', '7011', '7071');
INSERT INTO `fw_code` VALUES ('4016341', '3183', '1134', '5356', '9674', '9777');
INSERT INTO `fw_code` VALUES ('4016342', '3183', '1135', '8587', '8416', '3875');
INSERT INTO `fw_code` VALUES ('4016343', '3183', '1136', '3861', '7396', '0652');
INSERT INTO `fw_code` VALUES ('4016344', '3183', '1137', '1618', '3979', '1964');
INSERT INTO `fw_code` VALUES ('4016345', '3183', '1138', '7493', '4356', '9955');
INSERT INTO `fw_code` VALUES ('4016346', '3183', '1139', '2940', '9797', '3911');
INSERT INTO `fw_code` VALUES ('4016347', '3183', '1140', '2579', '2587', '8545');
INSERT INTO `fw_code` VALUES ('4016348', '3183', '1141', '8881', '7900', '0571');
INSERT INTO `fw_code` VALUES ('4016349', '3183', '1142', '2793', '0055', '5563');
INSERT INTO `fw_code` VALUES ('4016350', '3183', '1143', '3113', '6257', '1089');
INSERT INTO `fw_code` VALUES ('4016351', '3183', '1144', '4461', '8793', '1866');
INSERT INTO `fw_code` VALUES ('4016352', '3183', '1145', '9308', '2837', '4607');
INSERT INTO `fw_code` VALUES ('4016353', '3183', '1146', '1257', '6769', '6598');
INSERT INTO `fw_code` VALUES ('4016354', '3183', '1147', '3795', '9670', '1982');
INSERT INTO `fw_code` VALUES ('4016355', '3183', '1148', '6852', '1952', '8902');
INSERT INTO `fw_code` VALUES ('4016356', '3183', '1149', '2900', '8789', '4072');
INSERT INTO `fw_code` VALUES ('4016357', '3183', '1150', '0296', '8162', '0018');
INSERT INTO `fw_code` VALUES ('4016358', '3183', '1151', '2406', '6126', '1366');
INSERT INTO `fw_code` VALUES ('4016359', '3183', '1152', '9655', '5757', '8965');
INSERT INTO `fw_code` VALUES ('4016360', '3183', '1153', '2366', '5118', '1527');
INSERT INTO `fw_code` VALUES ('4016361', '3183', '1154', '4649', '9543', '0054');
INSERT INTO `fw_code` VALUES ('4016362', '3183', '1155', '1124', '1317', '9259');
INSERT INTO `fw_code` VALUES ('4016363', '3183', '1156', '6918', '9678', '7572');
INSERT INTO `fw_code` VALUES ('4016364', '3183', '1157', '7666', '0817', '7134');
INSERT INTO `fw_code` VALUES ('4016365', '3183', '1158', '4822', '6003', '7232');
INSERT INTO `fw_code` VALUES ('4016366', '3183', '1159', '3006', '7523', '2580');
INSERT INTO `fw_code` VALUES ('4016367', '3183', '1160', '7345', '4614', '1607');
INSERT INTO `fw_code` VALUES ('4016368', '3183', '1161', '3474', '3467', '6455');
INSERT INTO `fw_code` VALUES ('4016369', '3183', '1162', '5504', '9416', '8125');
INSERT INTO `fw_code` VALUES ('4016370', '3183', '1163', '5397', '0682', '9616');
INSERT INTO `fw_code` VALUES ('4016371', '3183', '1164', '0937', '0567', '1072');
INSERT INTO `fw_code` VALUES ('4016372', '3183', '1165', '5102', '1198', '2920');
INSERT INTO `fw_code` VALUES ('4016373', '3183', '1166', '3607', '8920', '3795');
INSERT INTO `fw_code` VALUES ('4016374', '3183', '1167', '5036', '3471', '4250');
INSERT INTO `fw_code` VALUES ('4016375', '3183', '1168', '7238', '5880', '3098');
INSERT INTO `fw_code` VALUES ('4016376', '3183', '1169', '9014', '3353', '7911');
INSERT INTO `fw_code` VALUES ('4016377', '3183', '1170', '2299', '7392', '2857');
INSERT INTO `fw_code` VALUES ('4016378', '3183', '1171', '2539', '1579', '8706');
INSERT INTO `fw_code` VALUES ('4016379', '3183', '1172', '6531', '5749', '3375');
INSERT INTO `fw_code` VALUES ('4016380', '3183', '1173', '1551', '6253', '3295');
INSERT INTO `fw_code` VALUES ('4016381', '3183', '1174', '8347', '4229', '8027');
INSERT INTO `fw_code` VALUES ('4016382', '3183', '1175', '9868', '3226', '5982');
INSERT INTO `fw_code` VALUES ('4016383', '3183', '1176', '6318', '8281', '6357');
INSERT INTO `fw_code` VALUES ('4016384', '3183', '1177', '8892', '8491', '5055');
INSERT INTO `fw_code` VALUES ('4016385', '3183', '1178', '2630', '4185', '2867');
INSERT INTO `fw_code` VALUES ('4016386', '3183', '1179', '1069', '4181', '5073');
INSERT INTO `fw_code` VALUES ('4016387', '3183', '1180', '1990', '1780', '1814');
INSERT INTO `fw_code` VALUES ('4016388', '3183', '1181', '9640', '9630', '4617');
INSERT INTO `fw_code` VALUES ('4016389', '3183', '1182', '9787', '9372', '2965');
INSERT INTO `fw_code` VALUES ('4016390', '3183', '1183', '9253', '5701', '0421');
INSERT INTO `fw_code` VALUES ('4016391', '3183', '1184', '7157', '2026', '0081');
INSERT INTO `fw_code` VALUES ('4016392', '3183', '1185', '1669', '5578', '6287');
INSERT INTO `fw_code` VALUES ('4016393', '3183', '1186', '0494', '9503', '2689');
INSERT INTO `fw_code` VALUES ('4016394', '3183', '1187', '3271', '6590', '3921');
INSERT INTO `fw_code` VALUES ('4016395', '3183', '1188', '1109', '5189', '4912');
INSERT INTO `fw_code` VALUES ('4016396', '3183', '1189', '4339', '3931', '9010');
INSERT INTO `fw_code` VALUES ('4016397', '3183', '1190', '3245', '9871', '5090');
INSERT INTO `fw_code` VALUES ('4016398', '3183', '1191', '1349', '9376', '0760');
INSERT INTO `fw_code` VALUES ('4016399', '3183', '1192', '8332', '8102', '3680');
INSERT INTO `fw_code` VALUES ('4016400', '3183', '1193', '4634', '3415', '5706');
INSERT INTO `fw_code` VALUES ('4016401', '3183', '1194', '8546', '5570', '0697');
INSERT INTO `fw_code` VALUES ('4016402', '3183', '1195', '8866', '1772', '6224');
INSERT INTO `fw_code` VALUES ('4016403', '3183', '1196', '0214', '4308', '7001');
INSERT INTO `fw_code` VALUES ('4016404', '3183', '1197', '2203', '9249', '8832');
INSERT INTO `fw_code` VALUES ('4016405', '3183', '1198', '2605', '7467', '4037');
INSERT INTO `fw_code` VALUES ('4016406', '3183', '1199', '8652', '4304', '9206');
INSERT INTO `fw_code` VALUES ('4016407', '3183', '1200', '6048', '3677', '5153');
INSERT INTO `fw_code` VALUES ('4016408', '3183', '1201', '0815', '5705', '8216');
INSERT INTO `fw_code` VALUES ('4016409', '3183', '1202', '5408', '1272', '4099');
INSERT INTO `fw_code` VALUES ('4016410', '3183', '1203', '3058', '9122', '6903');
INSERT INTO `fw_code` VALUES ('4016411', '3183', '1204', '9533', '0895', '6108');
INSERT INTO `fw_code` VALUES ('4016412', '3183', '1205', '2671', '5193', '2706');
INSERT INTO `fw_code` VALUES ('4016413', '3183', '1206', '0575', '1518', '2367');
INSERT INTO `fw_code` VALUES ('4016414', '3183', '1207', '8759', '3038', '7715');
INSERT INTO `fw_code` VALUES ('4016415', '3183', '1208', '3098', '0129', '6742');
INSERT INTO `fw_code` VALUES ('4016416', '3183', '1209', '3912', '8995', '4974');
INSERT INTO `fw_code` VALUES ('4016417', '3183', '1210', '3805', '0260', '6465');
INSERT INTO `fw_code` VALUES ('4016418', '3183', '1211', '6689', '6082', '6207');
INSERT INTO `fw_code` VALUES ('4016419', '3183', '1212', '0855', '6713', '8055');
INSERT INTO `fw_code` VALUES ('4016420', '3183', '1213', '7757', '3423', '1296');
INSERT INTO `fw_code` VALUES ('4016421', '3183', '1214', '9360', '4435', '8930');
INSERT INTO `fw_code` VALUES ('4016422', '3183', '1215', '0789', '8986', '9385');
INSERT INTO `fw_code` VALUES ('4016423', '3183', '1216', '2991', '1395', '8233');
INSERT INTO `fw_code` VALUES ('4016424', '3183', '1217', '4767', '8868', '3046');
INSERT INTO `fw_code` VALUES ('4016425', '3183', '1218', '8078', '9625', '6823');
INSERT INTO `fw_code` VALUES ('4016426', '3183', '1219', '0708', '6971', '9707');
INSERT INTO `fw_code` VALUES ('4016427', '3183', '1220', '8292', '7094', '3840');
INSERT INTO `fw_code` VALUES ('4016428', '3183', '1221', '2284', '1264', '8510');
INSERT INTO `fw_code` VALUES ('4016429', '3183', '1222', '9960', '5832', '0144');
INSERT INTO `fw_code` VALUES ('4016430', '3183', '1223', '1135', '1907', '3742');
INSERT INTO `fw_code` VALUES ('4016431', '3183', '1224', '5621', '8741', '1117');
INSERT INTO `fw_code` VALUES ('4016432', '3183', '1225', '2350', '8991', '7180');
INSERT INTO `fw_code` VALUES ('4016433', '3183', '1226', '2070', '3796', '1492');
INSERT INTO `fw_code` VALUES ('4016434', '3183', '1227', '5728', '7475', '9626');
INSERT INTO `fw_code` VALUES ('4016435', '3183', '1228', '7905', '3165', '9644');
INSERT INTO `fw_code` VALUES ('4016436', '3183', '1229', '8826', '0764', '6385');
INSERT INTO `fw_code` VALUES ('4016437', '3183', '1230', '6476', '8614', '9189');
INSERT INTO `fw_code` VALUES ('4016438', '3183', '1231', '6089', '4685', '4992');
INSERT INTO `fw_code` VALUES ('4016439', '3183', '1232', '3165', '7856', '5412');
INSERT INTO `fw_code` VALUES ('4016440', '3183', '1233', '3993', '1010', '4653');
INSERT INTO `fw_code` VALUES ('4016441', '3183', '1234', '8505', '4562', '0858');
INSERT INTO `fw_code` VALUES ('4016442', '3183', '1235', '6516', '9621', '9028');
INSERT INTO `fw_code` VALUES ('4016443', '3183', '1236', '8973', '0506', '4733');
INSERT INTO `fw_code` VALUES ('4016444', '3183', '1237', '7330', '8487', '7260');
INSERT INTO `fw_code` VALUES ('4016445', '3183', '1238', '0107', '5574', '8492');
INSERT INTO `fw_code` VALUES ('4016446', '3183', '1239', '0601', '8237', '1198');
INSERT INTO `fw_code` VALUES ('4016447', '3183', '1240', '9106', '5959', '2073');
INSERT INTO `fw_code` VALUES ('4016448', '3183', '1241', '4207', '8478', '1671');
INSERT INTO `fw_code` VALUES ('4016449', '3183', '1242', '9460', '0783', '9312');
INSERT INTO `fw_code` VALUES ('4016450', '3183', '1243', '9099', '3573', '3946');
INSERT INTO `fw_code` VALUES ('4016451', '3183', '1244', '5401', '8886', '5973');
INSERT INTO `fw_code` VALUES ('4016452', '3183', '1245', '9313', '1041', '0964');
INSERT INTO `fw_code` VALUES ('4016453', '3183', '1246', '9634', '7243', '6491');
INSERT INTO `fw_code` VALUES ('4016454', '3183', '1247', '8326', '5715', '5553');
INSERT INTO `fw_code` VALUES ('4016455', '3183', '1248', '5829', '3822', '0009');
INSERT INTO `fw_code` VALUES ('4016456', '3183', '1249', '5121', '3691', '0285');
INSERT INTO `fw_code` VALUES ('4016457', '3183', '1250', '0315', '0656', '7384');
INSERT INTO `fw_code` VALUES ('4016458', '3183', '1251', '9420', '9775', '9473');
INSERT INTO `fw_code` VALUES ('4016459', '3183', '1252', '4094', '7358', '5035');
INSERT INTO `fw_code` VALUES ('4016460', '3183', '1253', '8926', '7112', '6768');
INSERT INTO `fw_code` VALUES ('4016461', '3183', '1254', '1169', '0529', '5455');
INSERT INTO `fw_code` VALUES ('4016462', '3183', '1255', '7645', '2303', '4660');
INSERT INTO `fw_code` VALUES ('4016463', '3183', '1256', '0783', '6600', '1258');
INSERT INTO `fw_code` VALUES ('4016464', '3183', '1257', '1343', '6989', '2634');
INSERT INTO `fw_code` VALUES ('4016465', '3183', '1258', '9527', '8509', '7982');
INSERT INTO `fw_code` VALUES ('4016466', '3183', '1259', '4801', '7489', '4759');
INSERT INTO `fw_code` VALUES ('4016467', '3183', '1260', '8967', '8120', '6607');
INSERT INTO `fw_code` VALUES ('4016468', '3183', '1261', '5869', '4830', '9848');
INSERT INTO `fw_code` VALUES ('4016469', '3183', '1262', '1556', '4457', '9652');
INSERT INTO `fw_code` VALUES ('4016470', '3183', '1263', '2878', '0275', '1598');
INSERT INTO `fw_code` VALUES ('4016471', '3183', '1264', '6190', '1033', '5375');
INSERT INTO `fw_code` VALUES ('4016472', '3183', '1265', '8819', '8378', '8259');
INSERT INTO `fw_code` VALUES ('4016473', '3183', '1266', '6403', '8501', '2392');
INSERT INTO `fw_code` VALUES ('4016474', '3183', '1267', '3052', '6735', '8777');
INSERT INTO `fw_code` VALUES ('4016475', '3183', '1268', '8072', '7239', '8696');
INSERT INTO `fw_code` VALUES ('4016476', '3183', '1269', '9247', '3314', '2294');
INSERT INTO `fw_code` VALUES ('4016477', '3183', '1270', '4867', '5215', '3428');
INSERT INTO `fw_code` VALUES ('4016478', '3183', '1271', '7578', '4576', '5991');
INSERT INTO `fw_code` VALUES ('4016479', '3183', '1272', '6016', '4572', '8196');
INSERT INTO `fw_code` VALUES ('4016480', '3183', '1273', '6937', '2171', '4937');
INSERT INTO `fw_code` VALUES ('4016481', '3183', '1274', '4201', '6092', '3544');
INSERT INTO `fw_code` VALUES ('4016482', '3183', '1275', '1276', '9263', '3964');
INSERT INTO `fw_code` VALUES ('4016483', '3183', '1276', '9740', '5977', '5000');
INSERT INTO `fw_code` VALUES ('4016484', '3183', '1277', '5442', '9894', '5812');
INSERT INTO `fw_code` VALUES ('4016485', '3183', '1278', '1663', '3192', '8161');
INSERT INTO `fw_code` VALUES ('4016486', '3183', '1279', '8219', '6981', '7044');
INSERT INTO `fw_code` VALUES ('4016487', '3183', '1280', '9287', '4322', '2134');
INSERT INTO `fw_code` VALUES ('4016488', '3183', '1281', '7217', '7366', '0625');
INSERT INTO `fw_code` VALUES ('4016489', '3183', '1282', '4974', '3949', '1937');
INSERT INTO `fw_code` VALUES ('4016490', '3183', '1283', '0849', '4326', '9928');
INSERT INTO `fw_code` VALUES ('4016491', '3183', '1284', '6296', '9767', '3884');
INSERT INTO `fw_code` VALUES ('4016492', '3183', '1285', '5936', '2557', '8518');
INSERT INTO `fw_code` VALUES ('4016493', '3183', '1286', '6149', '0025', '5535');
INSERT INTO `fw_code` VALUES ('4016494', '3183', '1287', '6470', '6227', '1062');
INSERT INTO `fw_code` VALUES ('4016495', '3183', '1288', '5162', '4699', '0125');
INSERT INTO `fw_code` VALUES ('4016496', '3183', '1289', '1958', '2675', '4857');
INSERT INTO `fw_code` VALUES ('4016497', '3183', '1290', '7151', '9640', '1955');
INSERT INTO `fw_code` VALUES ('4016498', '3183', '1291', '6469', '4389', '7724');
INSERT INTO `fw_code` VALUES ('4016499', '3183', '1292', '9847', '2873', '0170');
INSERT INTO `fw_code` VALUES ('4016500', '3183', '1293', '2023', '8563', '0188');
INSERT INTO `fw_code` VALUES ('4016501', '3183', '1294', '1983', '7555', '0349');
INSERT INTO `fw_code` VALUES ('4016502', '3183', '1295', '0742', '3754', '8081');
INSERT INTO `fw_code` VALUES ('4016503', '3183', '1296', '6535', '2115', '6393');
INSERT INTO `fw_code` VALUES ('4016504', '3183', '1297', '4440', '8440', '6054');
INSERT INTO `fw_code` VALUES ('4016505', '3183', '1298', '2624', '9960', '1402');
INSERT INTO `fw_code` VALUES ('4016506', '3183', '1299', '6963', '7051', '0429');
INSERT INTO `fw_code` VALUES ('4016507', '3183', '1300', '3091', '5904', '5277');
INSERT INTO `fw_code` VALUES ('4016508', '3183', '1301', '5014', '3119', '8438');
INSERT INTO `fw_code` VALUES ('4016509', '3183', '1302', '7898', '8940', '8179');
INSERT INTO `fw_code` VALUES ('4016510', '3183', '1303', '2064', '9571', '0027');
INSERT INTO `fw_code` VALUES ('4016511', '3183', '1304', '8966', '6281', '3268');
INSERT INTO `fw_code` VALUES ('4016512', '3183', '1305', '0568', '7293', '0902');
INSERT INTO `fw_code` VALUES ('4016513', '3183', '1306', '4653', '5908', '3072');
INSERT INTO `fw_code` VALUES ('4016514', '3183', '1307', '5975', '1726', '5018');
INSERT INTO `fw_code` VALUES ('4016515', '3183', '1308', '1917', '9829', '1679');
INSERT INTO `fw_code` VALUES ('4016516', '3183', '1309', '9500', '9952', '5813');
INSERT INTO `fw_code` VALUES ('4016517', '3183', '1310', '2344', '4766', '5715');
INSERT INTO `fw_code` VALUES ('4016518', '3183', '1311', '7964', '6666', '6849');
INSERT INTO `fw_code` VALUES ('4016519', '3183', '1312', '6830', '1599', '3090');
INSERT INTO `fw_code` VALUES ('4016520', '3183', '1313', '6215', '5913', '0867');
INSERT INTO `fw_code` VALUES ('4016521', '3183', '1314', '0675', '6027', '9411');
INSERT INTO `fw_code` VALUES ('4016522', '3183', '1315', '1769', '0087', '3331');
INSERT INTO `fw_code` VALUES ('4016523', '3183', '1316', '9073', '5015', '1777');
INSERT INTO `fw_code` VALUES ('4016524', '3183', '1317', '7684', '1472', '1161');
INSERT INTO `fw_code` VALUES ('4016525', '3183', '1318', '0487', '5278', '1224');
INSERT INTO `fw_code` VALUES ('4016526', '3183', '1319', '9953', '1607', '8679');
INSERT INTO `fw_code` VALUES ('4016527', '3183', '1320', '7858', '7932', '8340');
INSERT INTO `fw_code` VALUES ('4016528', '3183', '1321', '9714', '7420', '2831');
INSERT INTO `fw_code` VALUES ('4016529', '3183', '1322', '0381', '6543', '2715');
INSERT INTO `fw_code` VALUES ('4016530', '3183', '1323', '2837', '7428', '8420');
INSERT INTO `fw_code` VALUES ('4016531', '3183', '1324', '8539', '1345', '9232');
INSERT INTO `fw_code` VALUES ('4016532', '3183', '1325', '1316', '8432', '0464');
INSERT INTO `fw_code` VALUES ('4016533', '3183', '1326', '1810', '1095', '3170');
INSERT INTO `fw_code` VALUES ('4016534', '3183', '1327', '9033', '4008', '1938');
INSERT INTO `fw_code` VALUES ('4016535', '3183', '1328', '5335', '9321', '3965');
INSERT INTO `fw_code` VALUES ('4016536', '3183', '1329', '9246', '1476', '8956');
INSERT INTO `fw_code` VALUES ('4016537', '3183', '1330', '9567', '7678', '4482');
INSERT INTO `fw_code` VALUES ('4016538', '3183', '1331', '9353', '0210', '7465');
INSERT INTO `fw_code` VALUES ('4016539', '3183', '1332', '6749', '9583', '3411');
INSERT INTO `fw_code` VALUES ('4016540', '3183', '1333', '3371', '1099', '0965');
INSERT INTO `fw_code` VALUES ('4016541', '3183', '1334', '4119', '2238', '0527');
INSERT INTO `fw_code` VALUES ('4016542', '3183', '1335', '5045', '8546', '8717');
INSERT INTO `fw_code` VALUES ('4016543', '3183', '1336', '1174', '7399', '3565');
INSERT INTO `fw_code` VALUES ('4016544', '3183', '1337', '3203', '3348', '5235');
INSERT INTO `fw_code` VALUES ('4016545', '3183', '1338', '9704', '1840', '3271');
INSERT INTO `fw_code` VALUES ('4016546', '3183', '1339', '2736', '7404', '1360');
INSERT INTO `fw_code` VALUES ('4016547', '3183', '1340', '4938', '9812', '0209');
INSERT INTO `fw_code` VALUES ('4016548', '3183', '1341', '9999', '1324', '9967');
INSERT INTO `fw_code` VALUES ('4016549', '3183', '1342', '0238', '5511', '5816');
INSERT INTO `fw_code` VALUES ('4016550', '3183', '1343', '4231', '9681', '0485');
INSERT INTO `fw_code` VALUES ('4016551', '3183', '1344', '9251', '0185', '0405');
INSERT INTO `fw_code` VALUES ('4016552', '3183', '1345', '0426', '6261', '4003');
INSERT INTO `fw_code` VALUES ('4016553', '3183', '1346', '6047', '8161', '5137');
INSERT INTO `fw_code` VALUES ('4016554', '3183', '1347', '7568', '7158', '3093');
INSERT INTO `fw_code` VALUES ('4016555', '3183', '1348', '4297', '7408', '9155');
INSERT INTO `fw_code` VALUES ('4016556', '3183', '1349', '4017', '2213', '3467');
INSERT INTO `fw_code` VALUES ('4016557', '3183', '1350', '7675', '5892', '1601');
INSERT INTO `fw_code` VALUES ('4016558', '3183', '1351', '9852', '1582', '1619');
INSERT INTO `fw_code` VALUES ('4016559', '3183', '1352', '0773', '9181', '8360');
INSERT INTO `fw_code` VALUES ('4016560', '3183', '1353', '9811', '0574', '1780');
INSERT INTO `fw_code` VALUES ('4016561', '3183', '1354', '8423', '7031', '1164');
INSERT INTO `fw_code` VALUES ('4016562', '3183', '1355', '8570', '6773', '9512');
INSERT INTO `fw_code` VALUES ('4016563', '3183', '1356', '8036', '3102', '6967');
INSERT INTO `fw_code` VALUES ('4016564', '3183', '1357', '2456', '2209', '5673');
INSERT INTO `fw_code` VALUES ('4016565', '3183', '1358', '5940', '9427', '6628');
INSERT INTO `fw_code` VALUES ('4016566', '3183', '1359', '0452', '2979', '2834');
INSERT INTO `fw_code` VALUES ('4016567', '3183', '1360', '8463', '8038', '1003');
INSERT INTO `fw_code` VALUES ('4016568', '3183', '1361', '0920', '8923', '6708');
INSERT INTO `fw_code` VALUES ('4016569', '3183', '1362', '2842', '6138', '9869');
INSERT INTO `fw_code` VALUES ('4016570', '3183', '1363', '2054', '3991', '0467');
INSERT INTO `fw_code` VALUES ('4016571', '3183', '1364', '9892', '2590', '1458');
INSERT INTO `fw_code` VALUES ('4016572', '3183', '1365', '3122', '1332', '5557');
INSERT INTO `fw_code` VALUES ('4016573', '3183', '1366', '8397', '0312', '2333');
INSERT INTO `fw_code` VALUES ('4016574', '3183', '1367', '2028', '7272', '1637');
INSERT INTO `fw_code` VALUES ('4016575', '3183', '1368', '0132', '6777', '7307');
INSERT INTO `fw_code` VALUES ('4016576', '3183', '1369', '7115', '5503', '0226');
INSERT INTO `fw_code` VALUES ('4016577', '3183', '1370', '3417', '0816', '2253');
INSERT INTO `fw_code` VALUES ('4016578', '3183', '1371', '7329', '2971', '7244');
INSERT INTO `fw_code` VALUES ('4016579', '3183', '1372', '7649', '9173', '2771');
INSERT INTO `fw_code` VALUES ('4016580', '3183', '1373', '8997', '1709', '3548');
INSERT INTO `fw_code` VALUES ('4016581', '3183', '1374', '6500', '9816', '8003');
INSERT INTO `fw_code` VALUES ('4016582', '3183', '1375', '5793', '9685', '8280');
INSERT INTO `fw_code` VALUES ('4016583', '3183', '1376', '0986', '6650', '5378');
INSERT INTO `fw_code` VALUES ('4016584', '3183', '1377', '1387', '4868', '0583');
INSERT INTO `fw_code` VALUES ('4016585', '3183', '1378', '7435', '1705', '5753');
INSERT INTO `fw_code` VALUES ('4016586', '3183', '1379', '4765', '3352', '3030');
INSERT INTO `fw_code` VALUES ('4016587', '3183', '1380', '9598', '3106', '4762');
INSERT INTO `fw_code` VALUES ('4016588', '3183', '1381', '4191', '8673', '0646');
INSERT INTO `fw_code` VALUES ('4016589', '3183', '1382', '6901', '8034', '3208');
INSERT INTO `fw_code` VALUES ('4016590', '3183', '1383', '1841', '6523', '3450');
INSERT INTO `fw_code` VALUES ('4016591', '3183', '1384', '8316', '8297', '2655');
INSERT INTO `fw_code` VALUES ('4016592', '3183', '1385', '1454', '2594', '9253');
INSERT INTO `fw_code` VALUES ('4016593', '3183', '1386', '2202', '3733', '8816');
INSERT INTO `fw_code` VALUES ('4016594', '3183', '1387', '9358', '8919', '8914');
INSERT INTO `fw_code` VALUES ('4016595', '3183', '1388', '7542', '0439', '4262');
INSERT INTO `fw_code` VALUES ('4016596', '3183', '1389', '1881', '7531', '3289');
INSERT INTO `fw_code` VALUES ('4016597', '3183', '1390', '0666', '0447', '9851');
INSERT INTO `fw_code` VALUES ('4016598', '3183', '1391', '5472', '3483', '2753');
INSERT INTO `fw_code` VALUES ('4016599', '3183', '1392', '9638', '4114', '4601');
INSERT INTO `fw_code` VALUES ('4016600', '3183', '1393', '6540', '0824', '7842');
INSERT INTO `fw_code` VALUES ('4016601', '3183', '1394', '8143', '1836', '5476');
INSERT INTO `fw_code` VALUES ('4016602', '3183', '1395', '1774', '8796', '4780');
INSERT INTO `fw_code` VALUES ('4016603', '3183', '1396', '3550', '6269', '9592');
INSERT INTO `fw_code` VALUES ('4016604', '3183', '1397', '6861', '7027', '3369');
INSERT INTO `fw_code` VALUES ('4016605', '3183', '1398', '7074', '4495', '0387');
INSERT INTO `fw_code` VALUES ('4016606', '3183', '1399', '1067', '8665', '5057');
INSERT INTO `fw_code` VALUES ('4016607', '3183', '1400', '8743', '3233', '6691');
INSERT INTO `fw_code` VALUES ('4016608', '3183', '1401', '9918', '9308', '0289');
INSERT INTO `fw_code` VALUES ('4016609', '3183', '1402', '2883', '7145', '9708');
INSERT INTO `fw_code` VALUES ('4016610', '3183', '1403', '4404', '6142', '7664');
INSERT INTO `fw_code` VALUES ('4016611', '3183', '1404', '4216', '3553', '6138');
INSERT INTO `fw_code` VALUES ('4016612', '3183', '1405', '6805', '9891', '9183');
INSERT INTO `fw_code` VALUES ('4016613', '3183', '1406', '1906', '2410', '8781');
INSERT INTO `fw_code` VALUES ('4016614', '3183', '1407', '5884', '2292', '2442');
INSERT INTO `fw_code` VALUES ('4016615', '3183', '1408', '5524', '5081', '7076');
INSERT INTO `fw_code` VALUES ('4016616', '3183', '1409', '1826', '0395', '9102');
INSERT INTO `fw_code` VALUES ('4016617', '3183', '1410', '5737', '2550', '4094');
INSERT INTO `fw_code` VALUES ('4016618', '3183', '1411', '1546', '5200', '3415');
INSERT INTO `fw_code` VALUES ('4016619', '3183', '1412', '9796', '4447', '7433');
INSERT INTO `fw_code` VALUES ('4016620', '3183', '1413', '5844', '1284', '2602');
INSERT INTO `fw_code` VALUES ('4016621', '3183', '1414', '0518', '8867', '8165');
INSERT INTO `fw_code` VALUES ('4016622', '3183', '1415', '7593', '2038', '8584');
INSERT INTO `fw_code` VALUES ('4016623', '3183', '1416', '7207', '8109', '4388');
INSERT INTO `fw_code` VALUES ('4016624', '3183', '1417', '7954', '9248', '3950');
INSERT INTO `fw_code` VALUES ('4016625', '3183', '1418', '5951', '0018', '1111');
INSERT INTO `fw_code` VALUES ('4016626', '3183', '1419', '2293', '6339', '2977');
INSERT INTO `fw_code` VALUES ('4016627', '3183', '1420', '3895', '7351', '0611');
INSERT INTO `fw_code` VALUES ('4016628', '3183', '1421', '7980', '5966', '2781');
INSERT INTO `fw_code` VALUES ('4016629', '3183', '1422', '9302', '1784', '4727');
INSERT INTO `fw_code` VALUES ('4016630', '3183', '1423', '2614', '2542', '8504');
INSERT INTO `fw_code` VALUES ('4016631', '3183', '1424', '9476', '8244', '1906');
INSERT INTO `fw_code` VALUES ('4016632', '3183', '1425', '1291', '6724', '6558');
INSERT INTO `fw_code` VALUES ('4016633', '3183', '1426', '0157', '1657', '2799');
INSERT INTO `fw_code` VALUES ('4016634', '3183', '1427', '9262', '0776', '4888');
INSERT INTO `fw_code` VALUES ('4016635', '3183', '1428', '7700', '0772', '7093');
INSERT INTO `fw_code` VALUES ('4016636', '3183', '1429', '1185', '7990', '8049');
INSERT INTO `fw_code` VALUES ('4016637', '3183', '1430', '6164', '7486', '8129');
INSERT INTO `fw_code` VALUES ('4016638', '3183', '1431', '5711', '5831', '5263');
INSERT INTO `fw_code` VALUES ('4016639', '3183', '1432', '1398', '5458', '5067');
INSERT INTO `fw_code` VALUES ('4016640', '3183', '1433', '2360', '4066', '1647');
INSERT INTO `fw_code` VALUES ('4016641', '3183', '1434', '2862', '8631', '7235');
INSERT INTO `fw_code` VALUES ('4016642', '3183', '1435', '9657', '6607', '1967');
INSERT INTO `fw_code` VALUES ('4016643', '3183', '1436', '4851', '3572', '9065');
INSERT INTO `fw_code` VALUES ('4016644', '3183', '1437', '3956', '2691', '1155');
INSERT INTO `fw_code` VALUES ('4016645', '3183', '1438', '8696', '8000', '5386');
INSERT INTO `fw_code` VALUES ('4016646', '3183', '1439', '8055', '5596', '4333');
INSERT INTO `fw_code` VALUES ('4016647', '3183', '1440', '3422', '9020', '8610');
INSERT INTO `fw_code` VALUES ('4016648', '3183', '1441', '7974', '3580', '4655');
INSERT INTO `fw_code` VALUES ('4016649', '3183', '1442', '8722', '4719', '4217');
INSERT INTO `fw_code` VALUES ('4016650', '3183', '1443', '5878', '9905', '4315');
INSERT INTO `fw_code` VALUES ('4016651', '3183', '1444', '4063', '1425', '9663');
INSERT INTO `fw_code` VALUES ('4016652', '3183', '1445', '8401', '8516', '8690');
INSERT INTO `fw_code` VALUES ('4016653', '3183', '1446', '6560', '3318', '5208');
INSERT INTO `fw_code` VALUES ('4016654', '3183', '1447', '6453', '4584', '6699');
INSERT INTO `fw_code` VALUES ('4016655', '3183', '1448', '3503', '1036', '8288');
INSERT INTO `fw_code` VALUES ('4016656', '3183', '1449', '2007', '8758', '9163');
INSERT INTO `fw_code` VALUES ('4016657', '3183', '1450', '3355', '1294', '9940');
INSERT INTO `fw_code` VALUES ('4016658', '3183', '1451', '0939', '1417', '4074');
INSERT INTO `fw_code` VALUES ('4016659', '3183', '1452', '2608', '0155', '0378');
INSERT INTO `fw_code` VALUES ('4016660', '3183', '1453', '9403', '8131', '5110');
INSERT INTO `fw_code` VALUES ('4016661', '3183', '1454', '8269', '3064', '1351');
INSERT INTO `fw_code` VALUES ('4016662', '3183', '1455', '7654', '7378', '9128');
INSERT INTO `fw_code` VALUES ('4016663', '3183', '1456', '7374', '2183', '3440');
INSERT INTO `fw_code` VALUES ('4016664', '3183', '1457', '8375', '1798', '9860');
INSERT INTO `fw_code` VALUES ('4016665', '3183', '1458', '1473', '5088', '6619');
INSERT INTO `fw_code` VALUES ('4016666', '3183', '1459', '0512', '6480', '0038');
INSERT INTO `fw_code` VALUES ('4016667', '3183', '1460', '9123', '2937', '9422');
INSERT INTO `fw_code` VALUES ('4016668', '3183', '1461', '1153', '8885', '1092');
INSERT INTO `fw_code` VALUES ('4016669', '3183', '1462', '1819', '8008', '0976');
INSERT INTO `fw_code` VALUES ('4016670', '3183', '1463', '9978', '2810', '7494');
INSERT INTO `fw_code` VALUES ('4016671', '3183', '1464', '6199', '6108', '9842');
INSERT INTO `fw_code` VALUES ('4016672', '3183', '1465', '6479', '1302', '5530');
INSERT INTO `fw_code` VALUES ('4016673', '3183', '1466', '1753', '0282', '2306');
INSERT INTO `fw_code` VALUES ('4016674', '3183', '1467', '9510', '6866', '3619');
INSERT INTO `fw_code` VALUES ('4016675', '3183', '1468', '0832', '2683', '5565');
INSERT INTO `fw_code` VALUES ('4016676', '3183', '1469', '0471', '5473', '0199');
INSERT INTO `fw_code` VALUES ('4016677', '3183', '1470', '6773', '0786', '2226');
INSERT INTO `fw_code` VALUES ('4016678', '3183', '1471', '0685', '2941', '7217');
INSERT INTO `fw_code` VALUES ('4016679', '3183', '1472', '2353', '1679', '3521');
INSERT INTO `fw_code` VALUES ('4016680', '3183', '1473', '7201', '5723', '6262');
INSERT INTO `fw_code` VALUES ('4016681', '3183', '1474', '1687', '2556', '3636');
INSERT INTO `fw_code` VALUES ('4016682', '3183', '1475', '4744', '4838', '0556');
INSERT INTO `fw_code` VALUES ('4016683', '3183', '1476', '4449', '3515', '0521');
INSERT INTO `fw_code` VALUES ('4016684', '3183', '1477', '3808', '1110', '9468');
INSERT INTO `fw_code` VALUES ('4016685', '3183', '1478', '6519', '0471', '2030');
INSERT INTO `fw_code` VALUES ('4016686', '3183', '1479', '8802', '4896', '0557');
INSERT INTO `fw_code` VALUES ('4016687', '3183', '1480', '5277', '6670', '9762');
INSERT INTO `fw_code` VALUES ('4016688', '3183', '1481', '7160', '2876', '3084');
INSERT INTO `fw_code` VALUES ('4016689', '3183', '1482', '7627', '8820', '6959');
INSERT INTO `fw_code` VALUES ('4016690', '3183', '1483', '5090', '5920', '1575');
INSERT INTO `fw_code` VALUES ('4016691', '3183', '1484', '6158', '3261', '6664');
INSERT INTO `fw_code` VALUES ('4016692', '3183', '1485', '7760', '4273', '4298');
INSERT INTO `fw_code` VALUES ('4016693', '3183', '1486', '3167', '8706', '8414');
INSERT INTO `fw_code` VALUES ('4016694', '3183', '1487', '6478', '9464', '2191');
INSERT INTO `fw_code` VALUES ('4016695', '3183', '1488', '6692', '6932', '9209');
INSERT INTO `fw_code` VALUES ('4016696', '3183', '1489', '6880', '7682', '7396');
INSERT INTO `fw_code` VALUES ('4016697', '3183', '1490', '2500', '9582', '8530');
INSERT INTO `fw_code` VALUES ('4016698', '3183', '1491', '4022', '8579', '6486');
INSERT INTO `fw_code` VALUES ('4016699', '3183', '1492', '4128', '7313', '4995');
INSERT INTO `fw_code` VALUES ('4016700', '3183', '1493', '7867', '3007', '2807');
INSERT INTO `fw_code` VALUES ('4016701', '3183', '1494', '6265', '1995', '5173');
INSERT INTO `fw_code` VALUES ('4016702', '3183', '1495', '4489', '4523', '0360');
INSERT INTO `fw_code` VALUES ('4016703', '3183', '1496', '2393', '0848', '0021');
INSERT INTO `fw_code` VALUES ('4016704', '3183', '1497', '6905', '4400', '6227');
INSERT INTO `fw_code` VALUES ('4016705', '3183', '1498', '4916', '9460', '4396');
INSERT INTO `fw_code` VALUES ('4016706', '3183', '1499', '5731', '8325', '2628');
INSERT INTO `fw_code` VALUES ('4016707', '3183', '1500', '9296', '7559', '3262');
INSERT INTO `fw_code` VALUES ('4016708', '3183', '1501', '8508', '5412', '3861');
INSERT INTO `fw_code` VALUES ('4016709', '3183', '1502', '6345', '4011', '4851');
INSERT INTO `fw_code` VALUES ('4016710', '3183', '1503', '9576', '2753', '8950');
INSERT INTO `fw_code` VALUES ('4016711', '3183', '1504', '2607', '8317', '7039');
INSERT INTO `fw_code` VALUES ('4016712', '3183', '1505', '6585', '8198', '0700');
INSERT INTO `fw_code` VALUES ('4016713', '3183', '1506', '9870', '2237', '5646');
INSERT INTO `fw_code` VALUES ('4016714', '3183', '1507', '4102', '0594', '6164');
INSERT INTO `fw_code` VALUES ('4016715', '3183', '1508', '5451', '3130', '6941');
INSERT INTO `fw_code` VALUES ('4016716', '3183', '1509', '7440', '8071', '8771');
INSERT INTO `fw_code` VALUES ('4016717', '3183', '1510', '1218', '4773', '6423');
INSERT INTO `fw_code` VALUES ('4016718', '3183', '1511', '1285', '2499', '5093');
INSERT INTO `fw_code` VALUES ('4016719', '3183', '1512', '6051', '4527', '8155');
INSERT INTO `fw_code` VALUES ('4016720', '3183', '1513', '8294', '7944', '6843');
INSERT INTO `fw_code` VALUES ('4016721', '3183', '1514', '7907', '4015', '2646');
INSERT INTO `fw_code` VALUES ('4016722', '3183', '1515', '2237', '5526', '2114');
INSERT INTO `fw_code` VALUES ('4016723', '3183', '1516', '1021', '8443', '8676');
INSERT INTO `fw_code` VALUES ('4016724', '3183', '1517', '3051', '4392', '0346');
INSERT INTO `fw_code` VALUES ('4016725', '3183', '1518', '2944', '5658', '1837');
INSERT INTO `fw_code` VALUES ('4016726', '3183', '1519', '5828', '1479', '1578');
INSERT INTO `fw_code` VALUES ('4016727', '3183', '1520', '9994', '2110', '3426');
INSERT INTO `fw_code` VALUES ('4016728', '3183', '1521', '8498', '9832', '4301');
INSERT INTO `fw_code` VALUES ('4016729', '3183', '1522', '2130', '6792', '3605');
INSERT INTO `fw_code` VALUES ('4016730', '3183', '1523', '3905', '4265', '8417');
INSERT INTO `fw_code` VALUES ('4016731', '3183', '1524', '7430', '2491', '9212');
INSERT INTO `fw_code` VALUES ('4016732', '3183', '1525', '1423', '6661', '3881');
INSERT INTO `fw_code` VALUES ('4016733', '3183', '1526', '0274', '7304', '9114');
INSERT INTO `fw_code` VALUES ('4016734', '3183', '1527', '3238', '5141', '8533');
INSERT INTO `fw_code` VALUES ('4016735', '3183', '1528', '4760', '4138', '6489');
INSERT INTO `fw_code` VALUES ('4016736', '3183', '1529', '1209', '9193', '6863');
INSERT INTO `fw_code` VALUES ('4016737', '3183', '1530', '8605', '8566', '2810');
INSERT INTO `fw_code` VALUES ('4016738', '3183', '1531', '7043', '8562', '5015');
INSERT INTO `fw_code` VALUES ('4016739', '3183', '1532', '5761', '3753', '2908');
INSERT INTO `fw_code` VALUES ('4016740', '3183', '1533', '3132', '6407', '0024');
INSERT INTO `fw_code` VALUES ('4016741', '3183', '1534', '7644', '9959', '6230');
INSERT INTO `fw_code` VALUES ('4016742', '3183', '1535', '5655', '5018', '4399');
INSERT INTO `fw_code` VALUES ('4016743', '3183', '1536', '8111', '5903', '0105');
INSERT INTO `fw_code` VALUES ('4016744', '3183', '1537', '0034', '3118', '3265');
INSERT INTO `fw_code` VALUES ('4016745', '3183', '1538', '9739', '3634', '6569');
INSERT INTO `fw_code` VALUES ('4016746', '3183', '1539', '1876', '8316', '6748');
INSERT INTO `fw_code` VALUES ('4016747', '3183', '1540', '7323', '3757', '0703');
INSERT INTO `fw_code` VALUES ('4016748', '3183', '1541', '7496', '0217', '7882');
INSERT INTO `fw_code` VALUES ('4016749', '3183', '1542', '3692', '6796', '1399');
INSERT INTO `fw_code` VALUES ('4016750', '3183', '1543', '2984', '6665', '1676');
INSERT INTO `fw_code` VALUES ('4016751', '3183', '1544', '8178', '3630', '8774');
INSERT INTO `fw_code` VALUES ('4016752', '3183', '1545', '1957', '0332', '6426');
INSERT INTO `fw_code` VALUES ('4016753', '3183', '1546', '1382', '5653', '4042');
INSERT INTO `fw_code` VALUES ('4016754', '3183', '1547', '5507', '5277', '6051');
INSERT INTO `fw_code` VALUES ('4016755', '3183', '1548', '7390', '1483', '9373');
INSERT INTO `fw_code` VALUES ('4016756', '3183', '1549', '9887', '3376', '4917');
INSERT INTO `fw_code` VALUES ('4016757', '3183', '1550', '9780', '4642', '6408');
INSERT INTO `fw_code` VALUES ('4016758', '3183', '1551', '2664', '0463', '6149');
INSERT INTO `fw_code` VALUES ('4016759', '3183', '1552', '3732', '7804', '1239');
INSERT INTO `fw_code` VALUES ('4016760', '3183', '1553', '5334', '8816', '8872');
INSERT INTO `fw_code` VALUES ('4016761', '3183', '1554', '0741', '3249', '2989');
INSERT INTO `fw_code` VALUES ('4016762', '3183', '1555', '4052', '4007', '6765');
INSERT INTO `fw_code` VALUES ('4016763', '3183', '1556', '6682', '1352', '9649');
INSERT INTO `fw_code` VALUES ('4016764', '3183', '1557', '4266', '1475', '3783');
INSERT INTO `fw_code` VALUES ('4016765', '3183', '1558', '7175', '2176', '9016');
INSERT INTO `fw_code` VALUES ('4016766', '3183', '1559', '2196', '2680', '8936');
INSERT INTO `fw_code` VALUES ('4016767', '3183', '1560', '4586', '5839', '5971');
INSERT INTO `fw_code` VALUES ('4016768', '3183', '1561', '0140', '0013', '8435');
INSERT INTO `fw_code` VALUES ('4016769', '3183', '1562', '8711', '5462', '7980');
INSERT INTO `fw_code` VALUES ('4016770', '3183', '1563', '8324', '1533', '3784');
INSERT INTO `fw_code` VALUES ('4016771', '3183', '1564', '8884', '1922', '5159');
INSERT INTO `fw_code` VALUES ('4016772', '3183', '1565', '8752', '6470', '7819');
INSERT INTO `fw_code` VALUES ('4016773', '3183', '1566', '9566', '5335', '6052');
INSERT INTO `fw_code` VALUES ('4016774', '3183', '1567', '5787', '8633', '8400');
INSERT INTO `fw_code` VALUES ('4016775', '3183', '1568', '0420', '5208', '4123');
INSERT INTO `fw_code` VALUES ('4016776', '3183', '1569', '0059', '7998', '8757');
INSERT INTO `fw_code` VALUES ('4016777', '3183', '1570', '4479', '7104', '7462');
INSERT INTO `fw_code` VALUES ('4016778', '3183', '1571', '5146', '6228', '7347');
INSERT INTO `fw_code` VALUES ('4016779', '3183', '1572', '2302', '1414', '7445');
INSERT INTO `fw_code` VALUES ('4016780', '3183', '1573', '0954', '8878', '6668');
INSERT INTO `fw_code` VALUES ('4016781', '3183', '1574', '8431', '0267', '2293');
INSERT INTO `fw_code` VALUES ('4016782', '3183', '1575', '3838', '4700', '6409');
INSERT INTO `fw_code` VALUES ('4016783', '3183', '1576', '9779', '2803', '3070');
INSERT INTO `fw_code` VALUES ('4016784', '3183', '1577', '7363', '2926', '7203');
INSERT INTO `fw_code` VALUES ('4016785', '3183', '1578', '3798', '3692', '6570');
INSERT INTO `fw_code` VALUES ('4016786', '3183', '1579', '8538', '9001', '0802');
INSERT INTO `fw_code` VALUES ('4016787', '3183', '1580', '7897', '6597', '9748');
INSERT INTO `fw_code` VALUES ('4016788', '3183', '1581', '2623', '7617', '2971');
INSERT INTO `fw_code` VALUES ('4016789', '3183', '1582', '1809', '8751', '4739');
INSERT INTO `fw_code` VALUES ('4016790', '3183', '1583', '7256', '4192', '8694');
INSERT INTO `fw_code` VALUES ('4016791', '3183', '1584', '6895', '6982', '3329');
INSERT INTO `fw_code` VALUES ('4016792', '3183', '1585', '4473', '4718', '9336');
INSERT INTO `fw_code` VALUES ('4016793', '3183', '1586', '8705', '3075', '9854');
INSERT INTO `fw_code` VALUES ('4016794', '3183', '1587', '4900', '9655', '3372');
INSERT INTO `fw_code` VALUES ('4016795', '3183', '1588', '6849', '3587', '5363');
INSERT INTO `fw_code` VALUES ('4016796', '3183', '1589', '2444', '8770', '7666');
INSERT INTO `fw_code` VALUES ('4016797', '3183', '1590', '7998', '2944', '0131');
INSERT INTO `fw_code` VALUES ('4016798', '3183', '1591', '5247', '2575', '7729');
INSERT INTO `fw_code` VALUES ('4016799', '3183', '1592', '6716', '8135', '8023');
INSERT INTO `fw_code` VALUES ('4016800', '3183', '1593', '2510', '6496', '6336');
INSERT INTO `fw_code` VALUES ('4016801', '3183', '1594', '3258', '7635', '5899');
INSERT INTO `fw_code` VALUES ('4016802', '3183', '1595', '0414', '2821', '5997');
INSERT INTO `fw_code` VALUES ('4016803', '3183', '1596', '8598', '4341', '1345');
INSERT INTO `fw_code` VALUES ('4016804', '3183', '1597', '2937', '1433', '0372');
INSERT INTO `fw_code` VALUES ('4016805', '3183', '1598', '9066', '0285', '5220');
INSERT INTO `fw_code` VALUES ('4016806', '3183', '1599', '1095', '6234', '6889');
INSERT INTO `fw_code` VALUES ('4016807', '3183', '1600', '0989', '7500', '8380');
INSERT INTO `fw_code` VALUES ('4016808', '3183', '1601', '9199', '5738', '2559');
INSERT INTO `fw_code` VALUES ('4016809', '3183', '1602', '7917', '0929', '0452');
INSERT INTO `fw_code` VALUES ('4016810', '3183', '1603', '7891', '4210', '1622');
INSERT INTO `fw_code` VALUES ('4016811', '3183', '1604', '2123', '2567', '2140');
INSERT INTO `fw_code` VALUES ('4016812', '3183', '1605', '8318', '9147', '5657');
INSERT INTO `fw_code` VALUES ('4016813', '3183', '1606', '3939', '1047', '6791');
INSERT INTO `fw_code` VALUES ('4016814', '3183', '1607', '5460', '0044', '4747');
INSERT INTO `fw_code` VALUES ('4016815', '3183', '1608', '2190', '0294', '0809');
INSERT INTO `fw_code` VALUES ('4016816', '3183', '1609', '1910', '5099', '5122');
INSERT INTO `fw_code` VALUES ('4016817', '3183', '1610', '9306', '4472', '1068');
INSERT INTO `fw_code` VALUES ('4016818', '3183', '1611', '6315', '9917', '2818');
INSERT INTO `fw_code` VALUES ('4016819', '3183', '1612', '6462', '9659', '1166');
INSERT INTO `fw_code` VALUES ('4016820', '3183', '1613', '0348', '5095', '7327');
INSERT INTO `fw_code` VALUES ('4016821', '3183', '1614', '3832', '2313', '8282');
INSERT INTO `fw_code` VALUES ('4016822', '3183', '1615', '8344', '5865', '4488');
INSERT INTO `fw_code` VALUES ('4016823', '3183', '1616', '7169', '9790', '0890');
INSERT INTO `fw_code` VALUES ('4016824', '3183', '1617', '9946', '6877', '2122');
INSERT INTO `fw_code` VALUES ('4016825', '3183', '1618', '7784', '5476', '3113');
INSERT INTO `fw_code` VALUES ('4016826', '3183', '1619', '6289', '3198', '3988');
INSERT INTO `fw_code` VALUES ('4016827', '3183', '1620', '9921', '0158', '3291');
INSERT INTO `fw_code` VALUES ('4016828', '3183', '1621', '8024', '9663', '8961');
INSERT INTO `fw_code` VALUES ('4016829', '3183', '1622', '5007', '8389', '1881');
INSERT INTO `fw_code` VALUES ('4016830', '3183', '1623', '1309', '3702', '3907');
INSERT INTO `fw_code` VALUES ('4016831', '3183', '1624', '5221', '5857', '8898');
INSERT INTO `fw_code` VALUES ('4016832', '3183', '1625', '6889', '4595', '5202');
INSERT INTO `fw_code` VALUES ('4016833', '3183', '1626', '4392', '2702', '9658');
INSERT INTO `fw_code` VALUES ('4016834', '3183', '1627', '3685', '2571', '9934');
INSERT INTO `fw_code` VALUES ('4016835', '3183', '1628', '9280', '7754', '2238');
INSERT INTO `fw_code` VALUES ('4016836', '3183', '1629', '5328', '4591', '7407');
INSERT INTO `fw_code` VALUES ('4016837', '3183', '1630', '2657', '6238', '4684');
INSERT INTO `fw_code` VALUES ('4016838', '3183', '1631', '8985', '6431', '2203');
INSERT INTO `fw_code` VALUES ('4016839', '3183', '1632', '1054', '3388', '3712');
INSERT INTO `fw_code` VALUES ('4016840', '3183', '1633', '5994', '1876', '3953');
INSERT INTO `fw_code` VALUES ('4016841', '3183', '1634', '5607', '7947', '9756');
INSERT INTO `fw_code` VALUES ('4016842', '3183', '1635', '3511', '4272', '9417');
INSERT INTO `fw_code` VALUES ('4016843', '3183', '1636', '1695', '5792', '4765');
INSERT INTO `fw_code` VALUES ('4016844', '3183', '1637', '6034', '2884', '3792');
INSERT INTO `fw_code` VALUES ('4016845', '3183', '1638', '4819', '5800', '0355');
INSERT INTO `fw_code` VALUES ('4016846', '3183', '1639', '6741', '3015', '3515');
INSERT INTO `fw_code` VALUES ('4016847', '3183', '1640', '3791', '9467', '5105');
INSERT INTO `fw_code` VALUES ('4016848', '3183', '1641', '0694', '6177', '8346');
INSERT INTO `fw_code` VALUES ('4016849', '3183', '1642', '2296', '7189', '5980');
INSERT INTO `fw_code` VALUES ('4016850', '3183', '1643', '3725', '1741', '6435');
INSERT INTO `fw_code` VALUES ('4016851', '3183', '1644', '3644', '9725', '6756');
INSERT INTO `fw_code` VALUES ('4016852', '3183', '1645', '5220', '4018', '5560');
INSERT INTO `fw_code` VALUES ('4016853', '3183', '1646', '4071', '4662', '0792');
INSERT INTO `fw_code` VALUES ('4016854', '3183', '1647', '8557', '1495', '8167');
INSERT INTO `fw_code` VALUES ('4016855', '3183', '1648', '5287', '1745', '4230');
INSERT INTO `fw_code` VALUES ('4016856', '3183', '1649', '0841', '5919', '6694');
INSERT INTO `fw_code` VALUES ('4016857', '3183', '1650', '1762', '3519', '3435');
INSERT INTO `fw_code` VALUES ('4016858', '3183', '1651', '0800', '4911', '6855');
INSERT INTO `fw_code` VALUES ('4016859', '3183', '1652', '9025', '7439', '2042');
INSERT INTO `fw_code` VALUES ('4016860', '3183', '1653', '6101', '0610', '2462');
INSERT INTO `fw_code` VALUES ('4016861', '3183', '1654', '6929', '3764', '1703');
INSERT INTO `fw_code` VALUES ('4016862', '3183', '1655', '1441', '7316', '7908');
INSERT INTO `fw_code` VALUES ('4016863', '3183', '1656', '9452', '2376', '6078');
INSERT INTO `fw_code` VALUES ('4016864', '3183', '1657', '0266', '1241', '4310');
INSERT INTO `fw_code` VALUES ('4016865', '3183', '1658', '3043', '8328', '5542');
INSERT INTO `fw_code` VALUES ('4016866', '3183', '1659', '3537', '0991', '8248');
INSERT INTO `fw_code` VALUES ('4016867', '3183', '1660', '4112', '5669', '0631');
INSERT INTO `fw_code` VALUES ('4016868', '3183', '1661', '2042', '8713', '9123');
INSERT INTO `fw_code` VALUES ('4016869', '3183', '1662', '5673', '5673', '8426');
INSERT INTO `fw_code` VALUES ('4016870', '3183', '1663', '1121', '1114', '2381');
INSERT INTO `fw_code` VALUES ('4016871', '3183', '1664', '0974', '1372', '4033');
INSERT INTO `fw_code` VALUES ('4016872', '3183', '1665', '9986', '6046', '8622');
INSERT INTO `fw_code` VALUES ('4016873', '3183', '1666', '5032', '3269', '7373');
INSERT INTO `fw_code` VALUES ('4016874', '3183', '1667', '5754', '7689', '8104');
INSERT INTO `fw_code` VALUES ('4016875', '3183', '1668', '2830', '0860', '8524');
INSERT INTO `fw_code` VALUES ('4016876', '3183', '1669', '9305', '2634', '7730');
INSERT INTO `fw_code` VALUES ('4016877', '3183', '1670', '3191', '8070', '3890');
INSERT INTO `fw_code` VALUES ('4016878', '3183', '1671', '5089', '5415', '6483');
INSERT INTO `fw_code` VALUES ('4016879', '3183', '1672', '5557', '1359', '0358');
INSERT INTO `fw_code` VALUES ('4016880', '3183', '1673', '7586', '7308', '2027');
INSERT INTO `fw_code` VALUES ('4016881', '3183', '1674', '7480', '8574', '3518');
INSERT INTO `fw_code` VALUES ('4016882', '3183', '1675', '4529', '5026', '5108');
INSERT INTO `fw_code` VALUES ('4016883', '3183', '1676', '7119', '1363', '8152');
INSERT INTO `fw_code` VALUES ('4016884', '3183', '1677', '8441', '7181', '0099');
INSERT INTO `fw_code` VALUES ('4016885', '3183', '1678', '1966', '5407', '0893');
INSERT INTO `fw_code` VALUES ('4016886', '3183', '1679', '8614', '3641', '7277');
INSERT INTO `fw_code` VALUES ('4016887', '3183', '1680', '4809', '0220', '0795');
INSERT INTO `fw_code` VALUES ('4016888', '3183', '1681', '3141', '1482', '4491');
INSERT INTO `fw_code` VALUES ('4016889', '3183', '1682', '1579', '1478', '6697');
INSERT INTO `fw_code` VALUES ('4016890', '3183', '1683', '0150', '6927', '6242');
INSERT INTO `fw_code` VALUES ('4016891', '3183', '1684', '0297', '6669', '4590');
INSERT INTO `fw_code` VALUES ('4016892', '3183', '1685', '9763', '2998', '2045');
INSERT INTO `fw_code` VALUES ('4016893', '3183', '1686', '7226', '0098', '6661');
INSERT INTO `fw_code` VALUES ('4016894', '3183', '1687', '4275', '6550', '8251');
INSERT INTO `fw_code` VALUES ('4016895', '3183', '1688', '6412', '1232', '8429');
INSERT INTO `fw_code` VALUES ('4016896', '3183', '1689', '1859', '6673', '2384');
INSERT INTO `fw_code` VALUES ('4016897', '3183', '1690', '7800', '4776', '9045');
INSERT INTO `fw_code` VALUES ('4016898', '3183', '1691', '1712', '6931', '4036');
INSERT INTO `fw_code` VALUES ('4016899', '3183', '1692', '2032', '3133', '9563');
INSERT INTO `fw_code` VALUES ('4016900', '3183', '1693', '0725', '1605', '8625');
INSERT INTO `fw_code` VALUES ('4016901', '3183', '1694', '7520', '9581', '3358');
INSERT INTO `fw_code` VALUES ('4016902', '3183', '1695', '2714', '6546', '0456');
INSERT INTO `fw_code` VALUES ('4016903', '3183', '1696', '1325', '3002', '9840');
INSERT INTO `fw_code` VALUES ('4016904', '3183', '1697', '5918', '8569', '5724');
INSERT INTO `fw_code` VALUES ('4016905', '3183', '1698', '0043', '8193', '7733');
INSERT INTO `fw_code` VALUES ('4016906', '3183', '1699', '5837', '6554', '6045');
INSERT INTO `fw_code` VALUES ('4016907', '3183', '1700', '1925', '4399', '1054');
INSERT INTO `fw_code` VALUES ('4016908', '3183', '1701', '4423', '6292', '6599');
INSERT INTO `fw_code` VALUES ('4016909', '3183', '1702', '4316', '7558', '8090');
INSERT INTO `fw_code` VALUES ('4016910', '3183', '1703', '8588', '6923', '8447');
INSERT INTO `fw_code` VALUES ('4016911', '3183', '1704', '7906', '1672', '4215');
INSERT INTO `fw_code` VALUES ('4016912', '3183', '1705', '1778', '2819', '9367');
INSERT INTO `fw_code` VALUES ('4016913', '3183', '1706', '6238', '2933', '7912');
INSERT INTO `fw_code` VALUES ('4016914', '3183', '1707', '4636', '1921', '0278');
INSERT INTO `fw_code` VALUES ('4016915', '3183', '1708', '6050', '2184', '9724');
INSERT INTO `fw_code` VALUES ('4016916', '3183', '1709', '9936', '7620', '5885');
INSERT INTO `fw_code` VALUES ('4016917', '3183', '1710', '5943', '3449', '1216');
INSERT INTO `fw_code` VALUES ('4016918', '3183', '1711', '4956', '8124', '5805');
INSERT INTO `fw_code` VALUES ('4016919', '3183', '1712', '1324', '1164', '6501');
INSERT INTO `fw_code` VALUES ('4016920', '3183', '1713', '5811', '7997', '3876');
INSERT INTO `fw_code` VALUES ('4016921', '3183', '1714', '2245', '8763', '3242');
INSERT INTO `fw_code` VALUES ('4016922', '3183', '1715', '2312', '6489', '1912');
INSERT INTO `fw_code` VALUES ('4016923', '3183', '1716', '4422', '4453', '3260');
INSERT INTO `fw_code` VALUES ('4016924', '3183', '1717', '3140', '9644', '1153');
INSERT INTO `fw_code` VALUES ('4016925', '3183', '1718', '8934', '8005', '9466');
INSERT INTO `fw_code` VALUES ('4016926', '3183', '1719', '6838', '4330', '9126');
INSERT INTO `fw_code` VALUES ('4016927', '3183', '1720', '5022', '5850', '4474');
INSERT INTO `fw_code` VALUES ('4016928', '3183', '1721', '5490', '1794', '8349');
INSERT INTO `fw_code` VALUES ('4016929', '3183', '1722', '7118', '9525', '4814');
INSERT INTO `fw_code` VALUES ('4016930', '3183', '1723', '5623', '7247', '5689');
INSERT INTO `fw_code` VALUES ('4016931', '3183', '1724', '1030', '1680', '9805');
INSERT INTO `fw_code` VALUES ('4016932', '3183', '1725', '4315', '5719', '4751');
INSERT INTO `fw_code` VALUES ('4016933', '3183', '1726', '4555', '9906', '0599');
INSERT INTO `fw_code` VALUES ('4016934', '3183', '1727', '8547', '4076', '5269');
INSERT INTO `fw_code` VALUES ('4016935', '3183', '1728', '1884', '1553', '7876');
INSERT INTO `fw_code` VALUES ('4016936', '3183', '1729', '5730', '5981', '4198');
INSERT INTO `fw_code` VALUES ('4016937', '3183', '1730', '2739', '1426', '5948');
INSERT INTO `fw_code` VALUES ('4016938', '3183', '1731', '4768', '7374', '7617');
INSERT INTO `fw_code` VALUES ('4016939', '3183', '1732', '2779', '2433', '5787');
INSERT INTO `fw_code` VALUES ('4016940', '3183', '1733', '8434', '2956', '8634');
INSERT INTO `fw_code` VALUES ('4016941', '3183', '1734', '5484', '9408', '0223');
INSERT INTO `fw_code` VALUES ('4016942', '3183', '1735', '3989', '7130', '1098');
INSERT INTO `fw_code` VALUES ('4016943', '3183', '1736', '1746', '3714', '2410');
INSERT INTO `fw_code` VALUES ('4016944', '3183', '1737', '7620', '4091', '0401');
INSERT INTO `fw_code` VALUES ('4016945', '3183', '1738', '2707', '2321', '8991');
INSERT INTO `fw_code` VALUES ('4016946', '3183', '1739', '9009', '7634', '1017');
INSERT INTO `fw_code` VALUES ('4016947', '3183', '1740', '2920', '9789', '6009');
INSERT INTO `fw_code` VALUES ('4016948', '3183', '1741', '3241', '5991', '1535');
INSERT INTO `fw_code` VALUES ('4016949', '3183', '1742', '4589', '8527', '2312');
INSERT INTO `fw_code` VALUES ('4016950', '3183', '1743', '6578', '3468', '4143');
INSERT INTO `fw_code` VALUES ('4016951', '3183', '1744', '6979', '1686', '9348');
INSERT INTO `fw_code` VALUES ('4016952', '3183', '1745', '3027', '8523', '4517');
INSERT INTO `fw_code` VALUES ('4016953', '3183', '1746', '0357', '0170', '1794');
INSERT INTO `fw_code` VALUES ('4016954', '3183', '1747', '2493', '4852', '1973');
INSERT INTO `fw_code` VALUES ('4016955', '3183', '1748', '7433', '3341', '2214');
INSERT INTO `fw_code` VALUES ('4016956', '3183', '1749', '7046', '9412', '8018');
INSERT INTO `fw_code` VALUES ('4016957', '3183', '1750', '7793', '0551', '7580');
INSERT INTO `fw_code` VALUES ('4016958', '3183', '1751', '4950', '5737', '7678');
INSERT INTO `fw_code` VALUES ('4016959', '3183', '1752', '3134', '7257', '3026');
INSERT INTO `fw_code` VALUES ('4016960', '3183', '1753', '7473', '4349', '2053');
INSERT INTO `fw_code` VALUES ('4016961', '3183', '1754', '6258', '7265', '8616');
INSERT INTO `fw_code` VALUES ('4016962', '3183', '1755', '8287', '3214', '0286');
INSERT INTO `fw_code` VALUES ('4016963', '3183', '1756', '1064', '0301', '1518');
INSERT INTO `fw_code` VALUES ('4016964', '3183', '1757', '5230', '0932', '3366');
INSERT INTO `fw_code` VALUES ('4016965', '3183', '1758', '3735', '8654', '4241');
INSERT INTO `fw_code` VALUES ('4016966', '3183', '1759', '5164', '3206', '4696');
INSERT INTO `fw_code` VALUES ('4016967', '3183', '1760', '2666', '1313', '9152');
INSERT INTO `fw_code` VALUES ('4016968', '3183', '1761', '6659', '5483', '3821');
INSERT INTO `fw_code` VALUES ('4016969', '3183', '1762', '5510', '6127', '9053');
INSERT INTO `fw_code` VALUES ('4016970', '3183', '1763', '8475', '3964', '8473');
INSERT INTO `fw_code` VALUES ('4016971', '3183', '1764', '9996', '2960', '6428');
INSERT INTO `fw_code` VALUES ('4016972', '3183', '1765', '6725', '3210', '2491');
INSERT INTO `fw_code` VALUES ('4016973', '3183', '1766', '6445', '8015', '6803');
INSERT INTO `fw_code` VALUES ('4016974', '3183', '1767', '3841', '7388', '2750');
INSERT INTO `fw_code` VALUES ('4016975', '3183', '1768', '2280', '7384', '4955');
INSERT INTO `fw_code` VALUES ('4016976', '3183', '1769', '3200', '4984', '1696');
INSERT INTO `fw_code` VALUES ('4016977', '3183', '1770', '2239', '6376', '5116');
INSERT INTO `fw_code` VALUES ('4016978', '3183', '1771', '0851', '2833', '4500');
INSERT INTO `fw_code` VALUES ('4016979', '3183', '1772', '0464', '8904', '0303');
INSERT INTO `fw_code` VALUES ('4016980', '3183', '1773', '8368', '5229', '9964');
INSERT INTO `fw_code` VALUES ('4016981', '3183', '1774', '2880', '8781', '6169');
INSERT INTO `fw_code` VALUES ('4016982', '3183', '1775', '0891', '3841', '4339');
INSERT INTO `fw_code` VALUES ('4016983', '3183', '1776', '3348', '4726', '0044');
INSERT INTO `fw_code` VALUES ('4016984', '3183', '1777', '1705', '2706', '2571');
INSERT INTO `fw_code` VALUES ('4016985', '3183', '1778', '5270', '1940', '3205');
INSERT INTO `fw_code` VALUES ('4016986', '3183', '1779', '4482', '9793', '3803');
INSERT INTO `fw_code` VALUES ('4016987', '3183', '1780', '1237', '4923', '5358');
INSERT INTO `fw_code` VALUES ('4016988', '3183', '1781', '9741', '2645', '6233');
INSERT INTO `fw_code` VALUES ('4016989', '3183', '1782', '4843', '5165', '5831');
INSERT INTO `fw_code` VALUES ('4016990', '3183', '1783', '3373', '9605', '5536');
INSERT INTO `fw_code` VALUES ('4016991', '3183', '1784', '8821', '5046', '9491');
INSERT INTO `fw_code` VALUES ('4016992', '3183', '1785', '4762', '3149', '6152');
INSERT INTO `fw_code` VALUES ('4016993', '3183', '1786', '8994', '1506', '6670');
INSERT INTO `fw_code` VALUES ('4016994', '3183', '1787', '7686', '9978', '5732');
INSERT INTO `fw_code` VALUES ('4016995', '3183', '1788', '9675', '4919', '7563');
INSERT INTO `fw_code` VALUES ('4016996', '3183', '1789', '2732', '7201', '4483');
INSERT INTO `fw_code` VALUES ('4016997', '3183', '1790', '3454', '1621', '5215');
INSERT INTO `fw_code` VALUES ('4016998', '3183', '1791', '8286', '1375', '6947');
INSERT INTO `fw_code` VALUES ('4016999', '3183', '1792', '8246', '0367', '7108');
INSERT INTO `fw_code` VALUES ('4017000', '3183', '1793', '0530', '4792', '5634');
INSERT INTO `fw_code` VALUES ('4017001', '3183', '1794', '7005', '6566', '4840');
INSERT INTO `fw_code` VALUES ('4017002', '3183', '1795', '0143', '0863', '1438');
INSERT INTO `fw_code` VALUES ('4017003', '3183', '1796', '0890', '2002', '1000');
INSERT INTO `fw_code` VALUES ('4017004', '3183', '1797', '0703', '1252', '2813');
INSERT INTO `fw_code` VALUES ('4017005', '3183', '1798', '9355', '8716', '2036');
INSERT INTO `fw_code` VALUES ('4017006', '3183', '1799', '1384', '4665', '3706');
INSERT INTO `fw_code` VALUES ('4017007', '3183', '1800', '1277', '5931', '5197');
INSERT INTO `fw_code` VALUES ('4017008', '3183', '1801', '4161', '1752', '4938');
INSERT INTO `fw_code` VALUES ('4017009', '3183', '1802', '8327', '2383', '6786');
INSERT INTO `fw_code` VALUES ('4017010', '3183', '1803', '6832', '0105', '7661');
INSERT INTO `fw_code` VALUES ('4017011', '3183', '1804', '0916', '8721', '9831');
INSERT INTO `fw_code` VALUES ('4017012', '3183', '1805', '0463', '7066', '6965');
INSERT INTO `fw_code` VALUES ('4017013', '3183', '1806', '5550', '5296', '5554');
INSERT INTO `fw_code` VALUES ('4017014', '3183', '1807', '5763', '2764', '2572');
INSERT INTO `fw_code` VALUES ('4017015', '3183', '1808', '8607', '7578', '2474');
INSERT INTO `fw_code` VALUES ('4017016', '3183', '1809', '4228', '9478', '3608');
INSERT INTO `fw_code` VALUES ('4017017', '3183', '1810', '3093', '4411', '9849');
INSERT INTO `fw_code` VALUES ('4017018', '3183', '1811', '9822', '4661', '5911');
INSERT INTO `fw_code` VALUES ('4017019', '3183', '1812', '6938', '8839', '6170');
INSERT INTO `fw_code` VALUES ('4017020', '3183', '1813', '5377', '8835', '8375');
INSERT INTO `fw_code` VALUES ('4017021', '3183', '1814', '5336', '7828', '8536');
INSERT INTO `fw_code` VALUES ('4017022', '3183', '1815', '3948', '4284', '7920');
INSERT INTO `fw_code` VALUES ('4017023', '3183', '1816', '4095', '4026', '6268');
INSERT INTO `fw_code` VALUES ('4017024', '3183', '1817', '3561', '0355', '3723');
INSERT INTO `fw_code` VALUES ('4017025', '3183', '1818', '4121', '0744', '5099');
INSERT INTO `fw_code` VALUES ('4017026', '3183', '1819', '5977', '0232', '9590');
INSERT INTO `fw_code` VALUES ('4017027', '3183', '1820', '3988', '5292', '7759');
INSERT INTO `fw_code` VALUES ('4017028', '3183', '1821', '9101', '0240', '5179');
INSERT INTO `fw_code` VALUES ('4017029', '3183', '1822', '7579', '1244', '7224');
INSERT INTO `fw_code` VALUES ('4017030', '3183', '1823', '8073', '3907', '9929');
INSERT INTO `fw_code` VALUES ('4017031', '3183', '1824', '8647', '8585', '2313');
INSERT INTO `fw_code` VALUES ('4017032', '3183', '1825', '6577', '1629', '0804');
INSERT INTO `fw_code` VALUES ('4017033', '3183', '1826', '4334', '8213', '2117');
INSERT INTO `fw_code` VALUES ('4017034', '3183', '1827', '0209', '8589', '0108');
INSERT INTO `fw_code` VALUES ('4017035', '3183', '1828', '5657', '4030', '4063');
INSERT INTO `fw_code` VALUES ('4017036', '3183', '1829', '9198', '3395', '4129');
INSERT INTO `fw_code` VALUES ('4017037', '3183', '1830', '5500', '8708', '6155');
INSERT INTO `fw_code` VALUES ('4017038', '3183', '1831', '9732', '7065', '6673');
INSERT INTO `fw_code` VALUES ('4017039', '3183', '1832', '8424', '5537', '5735');
INSERT INTO `fw_code` VALUES ('4017040', '3183', '1833', '5927', '3644', '0191');
INSERT INTO `fw_code` VALUES ('4017041', '3183', '1834', '0413', '0478', '7566');
INSERT INTO `fw_code` VALUES ('4017042', '3183', '1835', '3470', '2760', '4486');
INSERT INTO `fw_code` VALUES ('4017043', '3183', '1836', '9518', '9597', '9655');
INSERT INTO `fw_code` VALUES ('4017044', '3183', '1837', '4259', '4906', '3887');
INSERT INTO `fw_code` VALUES ('4017045', '3183', '1838', '8984', '5926', '7111');
INSERT INTO `fw_code` VALUES ('4017046', '3183', '1839', '1268', '0351', '5637');
INSERT INTO `fw_code` VALUES ('4017047', '3183', '1840', '7743', '2125', '4843');
INSERT INTO `fw_code` VALUES ('4017048', '3183', '1841', '4284', '1625', '2718');
INSERT INTO `fw_code` VALUES ('4017049', '3183', '1842', '9625', '8331', '8164');
INSERT INTO `fw_code` VALUES ('4017050', '3183', '1843', '3964', '5422', '7191');
INSERT INTO `fw_code` VALUES ('4017051', '3183', '1844', '2015', '1490', '5200');
INSERT INTO `fw_code` VALUES ('4017052', '3183', '1845', '4899', '7311', '4941');
INSERT INTO `fw_code` VALUES ('4017053', '3183', '1846', '9065', '7942', '6789');
INSERT INTO `fw_code` VALUES ('4017054', '3183', '1847', '1655', '4279', '9834');
INSERT INTO `fw_code` VALUES ('4017055', '3183', '1848', '3857', '6688', '8682');
INSERT INTO `fw_code` VALUES ('4017056', '3183', '1849', '8918', '8200', '8441');
INSERT INTO `fw_code` VALUES ('4017057', '3183', '1850', '3150', '6557', '8959');
INSERT INTO `fw_code` VALUES ('4017058', '3183', '1851', '8170', '7061', '8878');
INSERT INTO `fw_code` VALUES ('4017059', '3183', '1852', '9345', '3137', '2477');
INSERT INTO `fw_code` VALUES ('4017060', '3183', '1853', '4966', '5037', '3611');
INSERT INTO `fw_code` VALUES ('4017061', '3183', '1854', '3831', '9970', '9852');
INSERT INTO `fw_code` VALUES ('4017062', '3183', '1855', '2936', '9089', '1941');
INSERT INTO `fw_code` VALUES ('4017063', '3183', '1856', '3938', '8704', '8361');
INSERT INTO `fw_code` VALUES ('4017064', '3183', '1857', '7677', '4398', '6173');
INSERT INTO `fw_code` VALUES ('4017065', '3183', '1858', '8771', '8458', '0093');
INSERT INTO `fw_code` VALUES ('4017066', '3183', '1859', '7036', '1994', '5119');
INSERT INTO `fw_code` VALUES ('4017067', '3183', '1860', '6074', '3386', '8539');
INSERT INTO `fw_code` VALUES ('4017068', '3183', '1861', '4686', '9843', '7923');
INSERT INTO `fw_code` VALUES ('4017069', '3183', '1862', '7489', '3649', '7986');
INSERT INTO `fw_code` VALUES ('4017070', '3183', '1863', '1375', '9085', '4146');
INSERT INTO `fw_code` VALUES ('4017071', '3183', '1864', '4859', '6303', '5102');
INSERT INTO `fw_code` VALUES ('4017072', '3183', '1865', '6715', '5791', '9593');
INSERT INTO `fw_code` VALUES ('4017073', '3183', '1866', '7382', '4914', '9477');
INSERT INTO `fw_code` VALUES ('4017074', '3183', '1867', '9839', '5799', '5182');
INSERT INTO `fw_code` VALUES ('4017075', '3183', '1868', '5540', '9716', '5994');
INSERT INTO `fw_code` VALUES ('4017076', '3183', '1869', '1761', '3014', '8343');
INSERT INTO `fw_code` VALUES ('4017077', '3183', '1870', '8317', '6803', '7227');
INSERT INTO `fw_code` VALUES ('4017078', '3183', '1871', '8811', '9466', '9932');
INSERT INTO `fw_code` VALUES ('4017079', '3183', '1872', '2041', '8208', '4030');
INSERT INTO `fw_code` VALUES ('4017080', '3183', '1873', '0947', '4148', '0111');
INSERT INTO `fw_code` VALUES ('4017081', '3183', '1874', '2295', '4846', '7549');
INSERT INTO `fw_code` VALUES ('4017082', '3183', '1875', '8597', '0159', '9575');
INSERT INTO `fw_code` VALUES ('4017083', '3183', '1876', '2509', '2314', '4567');
INSERT INTO `fw_code` VALUES ('4017084', '3183', '1877', '4177', '1052', '0870');
INSERT INTO `fw_code` VALUES ('4017085', '3183', '1878', '0973', '9028', '5603');
INSERT INTO `fw_code` VALUES ('4017086', '3183', '1879', '3510', '1929', '0986');
INSERT INTO `fw_code` VALUES ('4017087', '3183', '1880', '2615', '1048', '3076');
INSERT INTO `fw_code` VALUES ('4017088', '3183', '1881', '9945', '2695', '0352');
INSERT INTO `fw_code` VALUES ('4017089', '3183', '1882', '0011', '0421', '9022');
INSERT INTO `fw_code` VALUES ('4017090', '3183', '1883', '9370', '8016', '7969');
INSERT INTO `fw_code` VALUES ('4017091', '3183', '1884', '2081', '7377', '0531');
INSERT INTO `fw_code` VALUES ('4017092', '3183', '1885', '4538', '8262', '6236');
INSERT INTO `fw_code` VALUES ('4017093', '3183', '1886', '2722', '9782', '1584');
INSERT INTO `fw_code` VALUES ('4017094', '3183', '1887', '6495', '4098', '1110');
INSERT INTO `fw_code` VALUES ('4017095', '3183', '1888', '6388', '5364', '2601');
INSERT INTO `fw_code` VALUES ('4017096', '3183', '1889', '4598', '3602', '6780');
INSERT INTO `fw_code` VALUES ('4017097', '3183', '1890', '8230', '0562', '6083');
INSERT INTO `fw_code` VALUES ('4017098', '3183', '1891', '3291', '2074', '5842');
INSERT INTO `fw_code` VALUES ('4017099', '3183', '1892', '7523', '0431', '6360');
INSERT INTO `fw_code` VALUES ('4017100', '3183', '1893', '7589', '8158', '5030');
INSERT INTO `fw_code` VALUES ('4017101', '3183', '1894', '7309', '2963', '9342');
INSERT INTO `fw_code` VALUES ('4017102', '3183', '1895', '0967', '6642', '7476');
INSERT INTO `fw_code` VALUES ('4017103', '3183', '1896', '4705', '2336', '5289');
INSERT INTO `fw_code` VALUES ('4017104', '3183', '1897', '2060', '8863', '8057');
INSERT INTO `fw_code` VALUES ('4017105', '3183', '1898', '2981', '6462', '4798');
INSERT INTO `fw_code` VALUES ('4017106', '3183', '1899', '0631', '4312', '7602');
INSERT INTO `fw_code` VALUES ('4017107', '3183', '1900', '0778', '4054', '5950');
INSERT INTO `fw_code` VALUES ('4017108', '3183', '1901', '0244', '0383', '3406');
INSERT INTO `fw_code` VALUES ('4017109', '3183', '1902', '4664', '9490', '2111');
INSERT INTO `fw_code` VALUES ('4017110', '3183', '1903', '3128', '6204', '3147');
INSERT INTO `fw_code` VALUES ('4017111', '3183', '1904', '5051', '3419', '6307');
INSERT INTO `fw_code` VALUES ('4017112', '3183', '1905', '5509', '3783', '0623');
INSERT INTO `fw_code` VALUES ('4017113', '3183', '1906', '3347', '2382', '1613');
INSERT INTO `fw_code` VALUES ('4017114', '3183', '1907', '1851', '0104', '2489');
INSERT INTO `fw_code` VALUES ('4017115', '3183', '1908', '5483', '7064', '1792');
INSERT INTO `fw_code` VALUES ('4017116', '3183', '1909', '0570', '5295', '0381');
INSERT INTO `fw_code` VALUES ('4017117', '3183', '1910', '6872', '0608', '2408');
INSERT INTO `fw_code` VALUES ('4017118', '3183', '1911', '1104', '8965', '2926');
INSERT INTO `fw_code` VALUES ('4017119', '3183', '1912', '2452', '1501', '3703');
INSERT INTO `fw_code` VALUES ('4017120', '3183', '1913', '9955', '9608', '8158');
INSERT INTO `fw_code` VALUES ('4017121', '3183', '1914', '4441', '6442', '5533');
INSERT INTO `fw_code` VALUES ('4017122', '3183', '1915', '4842', '4660', '0738');
INSERT INTO `fw_code` VALUES ('4017123', '3183', '1916', '4481', '5611', '2034');
INSERT INTO `fw_code` VALUES ('4017124', '3183', '1917', '4547', '3337', '0704');
INSERT INTO `fw_code` VALUES ('4017125', '3183', '1918', '3906', '0933', '9650');
INSERT INTO `fw_code` VALUES ('4017126', '3183', '1919', '6617', '0293', '2212');
INSERT INTO `fw_code` VALUES ('4017127', '3183', '1920', '1170', '4853', '8257');
INSERT INTO `fw_code` VALUES ('4017128', '3183', '1921', '9074', '1178', '7918');
INSERT INTO `fw_code` VALUES ('4017129', '3183', '1922', '7258', '2698', '3266');
INSERT INTO `fw_code` VALUES ('4017130', '3183', '1923', '2411', '8655', '0525');
INSERT INTO `fw_code` VALUES ('4017131', '3183', '1924', '2304', '9921', '2016');
INSERT INTO `fw_code` VALUES ('4017132', '3183', '1925', '5188', '5742', '1757');
INSERT INTO `fw_code` VALUES ('4017133', '3183', '1926', '7532', '5506', '0827');
INSERT INTO `fw_code` VALUES ('4017134', '3183', '1927', '9134', '6518', '8461');
INSERT INTO `fw_code` VALUES ('4017135', '3183', '1928', '2766', '3479', '7765');
INSERT INTO `fw_code` VALUES ('4017136', '3183', '1929', '2058', '3347', '8041');
INSERT INTO `fw_code` VALUES ('4017137', '3183', '1930', '9734', '7915', '9675');
INSERT INTO `fw_code` VALUES ('4017138', '3183', '1931', '3874', '1828', '2693');
INSERT INTO `fw_code` VALUES ('4017139', '3183', '1932', '2125', '1074', '6711');
INSERT INTO `fw_code` VALUES ('4017140', '3183', '1933', '5502', '9558', '9158');
INSERT INTO `fw_code` VALUES ('4017141', '3183', '1934', '9241', '5252', '6970');
INSERT INTO `fw_code` VALUES ('4017142', '3183', '1935', '8600', '2848', '5916');
INSERT INTO `fw_code` VALUES ('4017143', '3183', '1936', '6250', '0697', '8720');
INSERT INTO `fw_code` VALUES ('4017144', '3183', '1937', '5863', '6768', '4524');
INSERT INTO `fw_code` VALUES ('4017145', '3183', '1938', '2939', '9939', '4943');
INSERT INTO `fw_code` VALUES ('4017146', '3183', '1939', '0670', '9804', '7425');
INSERT INTO `fw_code` VALUES ('4017147', '3183', '1940', '9882', '7657', '8024');
INSERT INTO `fw_code` VALUES ('4017148', '3183', '1941', '8880', '8042', '1604');
INSERT INTO `fw_code` VALUES ('4017149', '3183', '1942', '7959', '0443', '4863');
INSERT INTO `fw_code` VALUES ('4017150', '3183', '1943', '7812', '0701', '6515');
INSERT INTO `fw_code` VALUES ('4017151', '3183', '1944', '6825', '5375', '1104');
INSERT INTO `fw_code` VALUES ('4017152', '3183', '1945', '8814', '0316', '2934');
INSERT INTO `fw_code` VALUES ('4017153', '3183', '1946', '7919', '9435', '5024');
INSERT INTO `fw_code` VALUES ('4017154', '3183', '1947', '2592', '7018', '0586');
INSERT INTO `fw_code` VALUES ('4017155', '3183', '1948', '2659', '4744', '9256');
INSERT INTO `fw_code` VALUES ('4017156', '3183', '1949', '7425', '6772', '2318');
INSERT INTO `fw_code` VALUES ('4017157', '3183', '1950', '7385', '5764', '2479');
INSERT INTO `fw_code` VALUES ('4017158', '3183', '1951', '9668', '0189', '1006');
INSERT INTO `fw_code` VALUES ('4017159', '3183', '1952', '6143', '1963', '0211');
INSERT INTO `fw_code` VALUES ('4017160', '3183', '1953', '9281', '6260', '6809');
INSERT INTO `fw_code` VALUES ('4017161', '3183', '1954', '9841', '6649', '8184');
INSERT INTO `fw_code` VALUES ('4017162', '3183', '1955', '8025', '8169', '3533');
INSERT INTO `fw_code` VALUES ('4017163', '3183', '1956', '0523', '0062', '9077');
INSERT INTO `fw_code` VALUES ('4017164', '3183', '1957', '0416', '1328', '0568');
INSERT INTO `fw_code` VALUES ('4017165', '3183', '1958', '3300', '7149', '0309');
INSERT INTO `fw_code` VALUES ('4017166', '3183', '1959', '4368', '4490', '5399');
INSERT INTO `fw_code` VALUES ('4017167', '3183', '1960', '8972', '0649', '5766');
INSERT INTO `fw_code` VALUES ('4017168', '3183', '1961', '3605', '7224', '1489');
INSERT INTO `fw_code` VALUES ('4017169', '3183', '1962', '3819', '4692', '8507');
INSERT INTO `fw_code` VALUES ('4017170', '3183', '1963', '5487', '3430', '4810');
INSERT INTO `fw_code` VALUES ('4017171', '3183', '1964', '2003', '6212', '3855');
INSERT INTO `fw_code` VALUES ('4017172', '3183', '1965', '8692', '5454', '0078');
INSERT INTO `fw_code` VALUES ('4017173', '3183', '1966', '2043', '7220', '3694');
INSERT INTO `fw_code` VALUES ('4017174', '3183', '1967', '9078', '9383', '4275');
INSERT INTO `fw_code` VALUES ('4017175', '3183', '1968', '2390', '0141', '8051');
INSERT INTO `fw_code` VALUES ('4017176', '3183', '1969', '2577', '0890', '6239');
INSERT INTO `fw_code` VALUES ('4017177', '3183', '1970', '0080', '8998', '0694');
INSERT INTO `fw_code` VALUES ('4017178', '3183', '1971', '3671', '4950', '0159');
INSERT INTO `fw_code` VALUES ('4017179', '3183', '1972', '8412', '0259', '4391');
INSERT INTO `fw_code` VALUES ('4017180', '3183', '1973', '8438', '6978', '3221');
INSERT INTO `fw_code` VALUES ('4017181', '3183', '1974', '3218', '3295', '7292');
INSERT INTO `fw_code` VALUES ('4017182', '3183', '1975', '5808', '9633', '0337');
INSERT INTO `fw_code` VALUES ('4017183', '3183', '1976', '7303', '1910', '9462');
INSERT INTO `fw_code` VALUES ('4017184', '3183', '1977', '9119', '0390', '4114');
INSERT INTO `fw_code` VALUES ('4017185', '3183', '1978', '7369', '9637', '8132');
INSERT INTO `fw_code` VALUES ('4017186', '3183', '1979', '0227', '8740', '9042');
INSERT INTO `fw_code` VALUES ('4017187', '3183', '1980', '0085', '7707', '2143');
INSERT INTO `fw_code` VALUES ('4017188', '3183', '1981', '2888', '1513', '2206');
INSERT INTO `fw_code` VALUES ('4017189', '3183', '1982', '2354', '7842', '9661');
INSERT INTO `fw_code` VALUES ('4017190', '3183', '1983', '6774', '6949', '8367');
INSERT INTO `fw_code` VALUES ('4017191', '3183', '1984', '2115', '3655', '3813');
INSERT INTO `fw_code` VALUES ('4017192', '3183', '1985', '5238', '3663', '9402');
INSERT INTO `fw_code` VALUES ('4017193', '3183', '1986', '0940', '7580', '0215');
INSERT INTO `fw_code` VALUES ('4017194', '3183', '1987', '7161', '0878', '2563');
INSERT INTO `fw_code` VALUES ('4017195', '3183', '1988', '3717', '4667', '1447');
INSERT INTO `fw_code` VALUES ('4017196', '3183', '1989', '4211', '7330', '4152');
INSERT INTO `fw_code` VALUES ('4017197', '3183', '1990', '0472', '1636', '6340');
INSERT INTO `fw_code` VALUES ('4017198', '3183', '1991', '6347', '2012', '4331');
INSERT INTO `fw_code` VALUES ('4017199', '3183', '1992', '1967', '3913', '5465');
INSERT INTO `fw_code` VALUES ('4017200', '3183', '1993', '0111', '4425', '0974');
INSERT INTO `fw_code` VALUES ('4017201', '3183', '1994', '2649', '7326', '6358');
INSERT INTO `fw_code` VALUES ('4017202', '3183', '1995', '9150', '5818', '4394');
INSERT INTO `fw_code` VALUES ('4017203', '3183', '1996', '1260', '3782', '5741');
INSERT INTO `fw_code` VALUES ('4017204', '3183', '1997', '8509', '3414', '3340');
INSERT INTO `fw_code` VALUES ('4017205', '3183', '1998', '1220', '2774', '5902');
INSERT INTO `fw_code` VALUES ('4017206', '3183', '1999', '5772', '7334', '1947');
INSERT INTO `fw_code` VALUES ('4017207', '3183', '2000', '6520', '8473', '1510');
INSERT INTO `fw_code` VALUES ('4017208', '3183', '2001', '1861', '5179', '6956');
INSERT INTO `fw_code` VALUES ('4017209', '3183', '2002', '6200', '2271', '5983');
INSERT INTO `fw_code` VALUES ('4017210', '3183', '2003', '2328', '1123', '0831');
INSERT INTO `fw_code` VALUES ('4017211', '3183', '2004', '9791', '8223', '5447');
INSERT INTO `fw_code` VALUES ('4017212', '3183', '2005', '0859', '5564', '0536');
INSERT INTO `fw_code` VALUES ('4017213', '3183', '2006', '2461', '6576', '8170');
INSERT INTO `fw_code` VALUES ('4017214', '3183', '2007', '3890', '1128', '8626');
INSERT INTO `fw_code` VALUES ('4017215', '3183', '2008', '6093', '3536', '7474');
INSERT INTO `fw_code` VALUES ('4017216', '3183', '2009', '7868', '1009', '2286');
INSERT INTO `fw_code` VALUES ('4017217', '3183', '2010', '1179', '1767', '6063');
INSERT INTO `fw_code` VALUES ('4017218', '3183', '2011', '1393', '9235', '3081');
INSERT INTO `fw_code` VALUES ('4017219', '3183', '2012', '5452', '1132', '6420');
INSERT INTO `fw_code` VALUES ('4017220', '3183', '2013', '5172', '5937', '0733');
INSERT INTO `fw_code` VALUES ('4017221', '3183', '2014', '8829', '9616', '8867');
INSERT INTO `fw_code` VALUES ('4017222', '3183', '2015', '2568', '5310', '6679');
INSERT INTO `fw_code` VALUES ('4017223', '3183', '2016', '1006', '5306', '8884');
INSERT INTO `fw_code` VALUES ('4017224', '3183', '2017', '1927', '2906', '5626');
INSERT INTO `fw_code` VALUES ('4017225', '3183', '2018', '9724', '0497', '6777');
INSERT INTO `fw_code` VALUES ('4017226', '3183', '2019', '9190', '6826', '4233');
INSERT INTO `fw_code` VALUES ('4017227', '3183', '2020', '3610', '5933', '2938');
INSERT INTO `fw_code` VALUES ('4017228', '3183', '2021', '7094', '3151', '3893');
INSERT INTO `fw_code` VALUES ('4017229', '3183', '2022', '9618', '1763', '8268');
INSERT INTO `fw_code` VALUES ('4017230', '3183', '2023', '2074', '2647', '3974');
INSERT INTO `fw_code` VALUES ('4017231', '3183', '2024', '9470', '0182', '6582');
INSERT INTO `fw_code` VALUES ('4017232', '3183', '2025', '9444', '3464', '7751');
INSERT INTO `fw_code` VALUES ('4017233', '3183', '2026', '7547', '2968', '3421');
INSERT INTO `fw_code` VALUES ('4017234', '3183', '2027', '4958', '6630', '0376');
INSERT INTO `fw_code` VALUES ('4017235', '3183', '2028', '5558', '8027', '1591');
INSERT INTO `fw_code` VALUES ('4017236', '3183', '2029', '8483', '4856', '1171');
INSERT INTO `fw_code` VALUES ('4017237', '3183', '2030', '6159', '9424', '2805');
INSERT INTO `fw_code` VALUES ('4017238', '3183', '2031', '1820', '2333', '3778');
INSERT INTO `fw_code` VALUES ('4017239', '3183', '2032', '4103', '6757', '2305');
INSERT INTO `fw_code` VALUES ('4017240', '3183', '2033', '9363', '1448', '8073');
INSERT INTO `fw_code` VALUES ('4017241', '3183', '2034', '0192', '4602', '7314');
INSERT INTO `fw_code` VALUES ('4017242', '3183', '2035', '4704', '8154', '3519');
INSERT INTO `fw_code` VALUES ('4017243', '3183', '2036', '3529', '2079', '9921');
INSERT INTO `fw_code` VALUES ('4017244', '3183', '2037', '8295', '4107', '2983');
INSERT INTO `fw_code` VALUES ('4017245', '3183', '2038', '4343', '0944', '8153');
INSERT INTO `fw_code` VALUES ('4017246', '3183', '2039', '3809', '7273', '5609');
INSERT INTO `fw_code` VALUES ('4017247', '3183', '2040', '2567', '3472', '3341');
INSERT INTO `fw_code` VALUES ('4017248', '3183', '2041', '4917', '5622', '0537');
INSERT INTO `fw_code` VALUES ('4017249', '3183', '2042', '8222', '3994', '6187');
INSERT INTO `fw_code` VALUES ('4017250', '3183', '2043', '0999', '1081', '7419');
INSERT INTO `fw_code` VALUES ('4017251', '3183', '2044', '5165', '1712', '9268');
INSERT INTO `fw_code` VALUES ('4017252', '3183', '2045', '2068', '8422', '2509');
INSERT INTO `fw_code` VALUES ('4017253', '3183', '2046', '9077', '3867', '4259');
INSERT INTO `fw_code` VALUES ('4017254', '3183', '2047', '2388', '4625', '8035');
INSERT INTO `fw_code` VALUES ('4017255', '3183', '2048', '5018', '1970', '0919');
INSERT INTO `fw_code` VALUES ('4017256', '3183', '2049', '2602', '2093', '5053');
INSERT INTO `fw_code` VALUES ('4017257', '3183', '2050', '9250', '0327', '1437');
INSERT INTO `fw_code` VALUES ('4017258', '3183', '2051', '4270', '0831', '1357');
INSERT INTO `fw_code` VALUES ('4017259', '3183', '2052', '1066', '8808', '6089');
INSERT INTO `fw_code` VALUES ('4017260', '3183', '2053', '6661', '3990', '8393');
INSERT INTO `fw_code` VALUES ('4017261', '3183', '2054', '9036', '2859', '4420');
INSERT INTO `fw_code` VALUES ('4017262', '3183', '2055', '0038', '2474', '0839');
INSERT INTO `fw_code` VALUES ('4017263', '3183', '2056', '3777', '8168', '8652');
INSERT INTO `fw_code` VALUES ('4017264', '3183', '2057', '2215', '8164', '0857');
INSERT INTO `fw_code` VALUES ('4017265', '3183', '2058', '2174', '7157', '1018');
INSERT INTO `fw_code` VALUES ('4017266', '3183', '2059', '7475', '2855', '6625');
INSERT INTO `fw_code` VALUES ('4017267', '3183', '2060', '0826', '4621', '0241');
INSERT INTO `fw_code` VALUES ('4017268', '3183', '2061', '7861', '6784', '0821');
INSERT INTO `fw_code` VALUES ('4017269', '3183', '2062', '4417', '0573', '9705');
INSERT INTO `fw_code` VALUES ('4017270', '3183', '2063', '4911', '3236', '2411');
INSERT INTO `fw_code` VALUES ('4017271', '3183', '2064', '3416', '0958', '3286');
INSERT INTO `fw_code` VALUES ('4017272', '3183', '2065', '1173', '7542', '4598');
INSERT INTO `fw_code` VALUES ('4017273', '3183', '2066', '2495', '3359', '6544');
INSERT INTO `fw_code` VALUES ('4017274', '3183', '2067', '2134', '6149', '1178');
INSERT INTO `fw_code` VALUES ('4017275', '3183', '2068', '8863', '6399', '7241');
INSERT INTO `fw_code` VALUES ('4017276', '3183', '2069', '8156', '6268', '7518');
INSERT INTO `fw_code` VALUES ('4017277', '3183', '2070', '6406', '5514', '1536');
INSERT INTO `fw_code` VALUES ('4017278', '3183', '2071', '2454', '2351', '6705');
INSERT INTO `fw_code` VALUES ('4017279', '3183', '2072', '9784', '3998', '3982');
INSERT INTO `fw_code` VALUES ('4017280', '3183', '2073', '7195', '7660', '0937');
INSERT INTO `fw_code` VALUES ('4017281', '3183', '2074', '1961', '9688', '4000');
INSERT INTO `fw_code` VALUES ('4017282', '3183', '2075', '6554', '5256', '9884');
INSERT INTO `fw_code` VALUES ('4017283', '3183', '2076', '1920', '8681', '4161');
INSERT INTO `fw_code` VALUES ('4017284', '3183', '2077', '4204', '3105', '2687');
INSERT INTO `fw_code` VALUES ('4017285', '3183', '2078', '6473', '3240', '0205');
INSERT INTO `fw_code` VALUES ('4017286', '3183', '2079', '7221', '4379', '9768');
INSERT INTO `fw_code` VALUES ('4017287', '3183', '2080', '4377', '9565', '9866');
INSERT INTO `fw_code` VALUES ('4017288', '3183', '2081', '2561', '1085', '5214');
INSERT INTO `fw_code` VALUES ('4017289', '3183', '2082', '5058', '2978', '0759');
INSERT INTO `fw_code` VALUES ('4017290', '3183', '2083', '4952', '4244', '2250');
INSERT INTO `fw_code` VALUES ('4017291', '3183', '2084', '7836', '0065', '1991');
INSERT INTO `fw_code` VALUES ('4017292', '3183', '2085', '4591', '7034', '6884');
INSERT INTO `fw_code` VALUES ('4017293', '3183', '2086', '5862', '2586', '2754');
INSERT INTO `fw_code` VALUES ('4017294', '3183', '2087', '7037', '8661', '6352');
INSERT INTO `fw_code` VALUES ('4017295', '3183', '2088', '8131', '2721', '0272');
INSERT INTO `fw_code` VALUES ('4017296', '3183', '2089', '5435', '7650', '8718');
INSERT INTO `fw_code` VALUES ('4017297', '3183', '2090', '6075', '0054', '9772');
INSERT INTO `fw_code` VALUES ('4017298', '3183', '2091', '1122', '7277', '8522');
INSERT INTO `fw_code` VALUES ('4017299', '3183', '2092', '7678', '1066', '7406');
INSERT INTO `fw_code` VALUES ('4017300', '3183', '2093', '1402', '2471', '4210');
INSERT INTO `fw_code` VALUES ('4017301', '3183', '2094', '5755', '3852', '4245');
INSERT INTO `fw_code` VALUES ('4017302', '3183', '2095', '5608', '4110', '5897');
INSERT INTO `fw_code` VALUES ('4017303', '3183', '2096', '6609', '3725', '2317');
INSERT INTO `fw_code` VALUES ('4017304', '3183', '2097', '5715', '2844', '4406');
INSERT INTO `fw_code` VALUES ('4017305', '3183', '2098', '7464', '3598', '0388');
INSERT INTO `fw_code` VALUES ('4017306', '3183', '2099', '0481', '4872', '7469');
INSERT INTO `fw_code` VALUES ('4017307', '3183', '2100', '8212', '4737', '9950');
INSERT INTO `fw_code` VALUES ('4017308', '3183', '2101', '3751', '4622', '1406');
INSERT INTO `fw_code` VALUES ('4017309', '3183', '2102', '7851', '7527', '4585');
INSERT INTO `fw_code` VALUES ('4017310', '3183', '2103', '5114', '1447', '3192');
INSERT INTO `fw_code` VALUES ('4017311', '3183', '2104', '5354', '5634', '9040');
INSERT INTO `fw_code` VALUES ('4017312', '3183', '2105', '1802', '8851', '6076');
INSERT INTO `fw_code` VALUES ('4017313', '3183', '2106', '5394', '4803', '5541');
INSERT INTO `fw_code` VALUES ('4017314', '3183', '2107', '2790', '4176', '1487');
INSERT INTO `fw_code` VALUES ('4017315', '3183', '2108', '4499', '3922', '7630');
INSERT INTO `fw_code` VALUES ('4017316', '3183', '2109', '0373', '4299', '5621');
INSERT INTO `fw_code` VALUES ('4017317', '3183', '2110', '9692', '0887', '4728');
INSERT INTO `fw_code` VALUES ('4017318', '3183', '2111', '0734', '1509', '0987');
INSERT INTO `fw_code` VALUES ('4017319', '3183', '2112', '0948', '8978', '8005');
INSERT INTO `fw_code` VALUES ('4017320', '3183', '2113', '8451', '7085', '2460');
INSERT INTO `fw_code` VALUES ('4017321', '3183', '2114', '5780', '8732', '9737');
INSERT INTO `fw_code` VALUES ('4017322', '3183', '2115', '5887', '7466', '8246');
INSERT INTO `fw_code` VALUES ('4017323', '3183', '2116', '9626', '3160', '6058');
INSERT INTO `fw_code` VALUES ('4017324', '3183', '2117', '8064', '3156', '8264');
INSERT INTO `fw_code` VALUES ('4017325', '3183', '2118', '6635', '8605', '7808');
INSERT INTO `fw_code` VALUES ('4017326', '3183', '2119', '4570', '0358', '7749');
INSERT INTO `fw_code` VALUES ('4017327', '3183', '2120', '5399', '3512', '6990');
INSERT INTO `fw_code` VALUES ('4017328', '3183', '2121', '7922', '2124', '1365');
INSERT INTO `fw_code` VALUES ('4017329', '3183', '2122', '0378', '3009', '7070');
INSERT INTO `fw_code` VALUES ('4017330', '3183', '2123', '8736', '0989', '9597');
INSERT INTO `fw_code` VALUES ('4017331', '3183', '2124', '2301', '0223', '0231');
INSERT INTO `fw_code` VALUES ('4017332', '3183', '2125', '1513', '8076', '0829');
INSERT INTO `fw_code` VALUES ('4017333', '3183', '2126', '2581', '5417', '5918');
INSERT INTO `fw_code` VALUES ('4017334', '3183', '2127', '0511', '8461', '4410');
INSERT INTO `fw_code` VALUES ('4017335', '3183', '2128', '5612', '0981', '4007');
INSERT INTO `fw_code` VALUES ('4017336', '3183', '2129', '9443', '1120', '9320');
INSERT INTO `fw_code` VALUES ('4017337', '3183', '2130', '5959', '3902', '8365');
INSERT INTO `fw_code` VALUES ('4017338', '3183', '2131', '5251', '3771', '8642');
INSERT INTO `fw_code` VALUES ('4017339', '3183', '2132', '0445', '0735', '5740');
INSERT INTO `fw_code` VALUES ('4017340', '3183', '2133', '4290', '5163', '2061');
INSERT INTO `fw_code` VALUES ('4017341', '3183', '2134', '9056', '7191', '5124');
INSERT INTO `fw_code` VALUES ('4017342', '3183', '2135', '3649', '2759', '1008');
INSERT INTO `fw_code` VALUES ('4017343', '3183', '2136', '1660', '7818', '9177');
INSERT INTO `fw_code` VALUES ('4017344', '3183', '2137', '1472', '7068', '0990');
INSERT INTO `fw_code` VALUES ('4017345', '3183', '2138', '1340', '1616', '3650');
INSERT INTO `fw_code` VALUES ('4017346', '3183', '2139', '0124', '4533', '0213');
INSERT INTO `fw_code` VALUES ('4017347', '3183', '2140', '2154', '0481', '1883');
INSERT INTO `fw_code` VALUES ('4017348', '3183', '2141', '2047', '1747', '3374');
INSERT INTO `fw_code` VALUES ('4017349', '3183', '2142', '4931', '7568', '3115');
INSERT INTO `fw_code` VALUES ('4017350', '3183', '2143', '9097', '8199', '4963');
INSERT INTO `fw_code` VALUES ('4017351', '3183', '2144', '5999', '4909', '8204');
INSERT INTO `fw_code` VALUES ('4017352', '3183', '2145', '1686', '4537', '8008');
INSERT INTO `fw_code` VALUES ('4017353', '3183', '2146', '3008', '0354', '9954');
INSERT INTO `fw_code` VALUES ('4017354', '3183', '2147', '6319', '1112', '3731');
INSERT INTO `fw_code` VALUES ('4017355', '3183', '2148', '8949', '8457', '6615');
INSERT INTO `fw_code` VALUES ('4017356', '3183', '2149', '8202', '7318', '7052');
INSERT INTO `fw_code` VALUES ('4017357', '3183', '2150', '9377', '3394', '0651');
INSERT INTO `fw_code` VALUES ('4017358', '3183', '2151', '0592', '0477', '4088');
INSERT INTO `fw_code` VALUES ('4017359', '3183', '2152', '3970', '8961', '6534');
INSERT INTO `fw_code` VALUES ('4017360', '3183', '2153', '7708', '4655', '4347');
INSERT INTO `fw_code` VALUES ('4017361', '3183', '2154', '7067', '2251', '3293');
INSERT INTO `fw_code` VALUES ('4017362', '3183', '2155', '4890', '6560', '3276');
INSERT INTO `fw_code` VALUES ('4017363', '3183', '2156', '4758', '1108', '5936');
INSERT INTO `fw_code` VALUES ('4017364', '3183', '2157', '5572', '9973', '4168');
INSERT INTO `fw_code` VALUES ('4017365', '3183', '2158', '8349', '7060', '5400');
INSERT INTO `fw_code` VALUES ('4017366', '3183', '2159', '8843', '9723', '8106');
INSERT INTO `fw_code` VALUES ('4017367', '3183', '2160', '9896', '0936', '8848');
INSERT INTO `fw_code` VALUES ('4017368', '3183', '2161', '5196', '6635', '4455');
INSERT INTO `fw_code` VALUES ('4017369', '3183', '2162', '4209', '1309', '9044');
INSERT INTO `fw_code` VALUES ('4017370', '3183', '2163', '9321', '6258', '6464');
INSERT INTO `fw_code` VALUES ('4017371', '3183', '2164', '0069', '7397', '6027');
INSERT INTO `fw_code` VALUES ('4017372', '3183', '2165', '7225', '2583', '6125');
INSERT INTO `fw_code` VALUES ('4017373', '3183', '2166', '5409', '4103', '1473');
INSERT INTO `fw_code` VALUES ('4017374', '3183', '2167', '4702', '3972', '1750');
INSERT INTO `fw_code` VALUES ('4017375', '3183', '2168', '5129', '8909', '5785');
INSERT INTO `fw_code` VALUES ('4017376', '3183', '2169', '0750', '0809', '6919');
INSERT INTO `fw_code` VALUES ('4017377', '3183', '2170', '9722', '4476', '1669');
INSERT INTO `fw_code` VALUES ('4017378', '3183', '2171', '2820', '7766', '8428');
INSERT INTO `fw_code` VALUES ('4017379', '3183', '2172', '7159', '4857', '7455');
INSERT INTO `fw_code` VALUES ('4017380', '3183', '2173', '3166', '0687', '2786');
INSERT INTO `fw_code` VALUES ('4017381', '3183', '2174', '6732', '9920', '3419');
INSERT INTO `fw_code` VALUES ('4017382', '3183', '2175', '2179', '5361', '7375');
INSERT INTO `fw_code` VALUES ('4017383', '3183', '2176', '6091', '7516', '2366');
INSERT INTO `fw_code` VALUES ('4017384', '3183', '2177', '1645', '1690', '4830');
INSERT INTO `fw_code` VALUES ('4017385', '3183', '2178', '8894', '1322', '2428');
INSERT INTO `fw_code` VALUES ('4017386', '3183', '2179', '3888', '5107', '3517');
INSERT INTO `fw_code` VALUES ('4017387', '3183', '2180', '0363', '6881', '2723');
INSERT INTO `fw_code` VALUES ('4017388', '3183', '2181', '3521', '5510', '0025');
INSERT INTO `fw_code` VALUES ('4017389', '3183', '2182', '6018', '7403', '5570');
INSERT INTO `fw_code` VALUES ('4017390', '3183', '2183', '5911', '8669', '7061');
INSERT INTO `fw_code` VALUES ('4017391', '3183', '2184', '1451', '8554', '8516');
INSERT INTO `fw_code` VALUES ('4017392', '3183', '2185', '5617', '9185', '0364');
INSERT INTO `fw_code` VALUES ('4017393', '3183', '2186', '2519', '5895', '3606');
INSERT INTO `fw_code` VALUES ('4017394', '3183', '2187', '5551', '1459', '1695');
INSERT INTO `fw_code` VALUES ('4017395', '3183', '2188', '7753', '3868', '0543');
INSERT INTO `fw_code` VALUES ('4017396', '3183', '2189', '2840', '2098', '9132');
INSERT INTO `fw_code` VALUES ('4017397', '3183', '2190', '2814', '5379', '0302');
INSERT INTO `fw_code` VALUES ('4017398', '3183', '2191', '3053', '9566', '6150');
INSERT INTO `fw_code` VALUES ('4017399', '3183', '2192', '2066', '4240', '0739');
INSERT INTO `fw_code` VALUES ('4017400', '3183', '2193', '8862', '2217', '5471');
INSERT INTO `fw_code` VALUES ('4017401', '3183', '2194', '0383', '1213', '3427');
INSERT INTO `fw_code` VALUES ('4017402', '3183', '2195', '0490', '9947', '1936');
INSERT INTO `fw_code` VALUES ('4017403', '3183', '2196', '1238', '1086', '1498');
INSERT INTO `fw_code` VALUES ('4017404', '3183', '2197', '5271', '6264', '6007');
INSERT INTO `fw_code` VALUES ('4017405', '3183', '2198', '8755', '3482', '6962');
INSERT INTO `fw_code` VALUES ('4017406', '3183', '2199', '5937', '5387', '5891');
INSERT INTO `fw_code` VALUES ('4017407', '3183', '2200', '1212', '4367', '2668');
INSERT INTO `fw_code` VALUES ('4017408', '3183', '2201', '2947', '0832', '7641');
INSERT INTO `fw_code` VALUES ('4017409', '3183', '2202', '6232', '4871', '2587');
INSERT INTO `fw_code` VALUES ('4017410', '3183', '2203', '0144', '7026', '7579');
INSERT INTO `fw_code` VALUES ('4017411', '3183', '2204', '3801', '0705', '5713');
INSERT INTO `fw_code` VALUES ('4017412', '3183', '2205', '0250', '5760', '6087');
INSERT INTO `fw_code` VALUES ('4017413', '3183', '2206', '7580', '7407', '3364');
INSERT INTO `fw_code` VALUES ('4017414', '3183', '2207', '2413', '7161', '5097');
INSERT INTO `fw_code` VALUES ('4017415', '3183', '2208', '5016', '7788', '9150');
INSERT INTO `fw_code` VALUES ('4017416', '3183', '2209', '2173', '2974', '9248');
INSERT INTO `fw_code` VALUES ('4017417', '3183', '2210', '6365', '0324', '9927');
INSERT INTO `fw_code` VALUES ('4017418', '3183', '2211', '1959', '3668', '8892');
INSERT INTO `fw_code` VALUES ('4017419', '3183', '2212', '3480', '2664', '6847');
INSERT INTO `fw_code` VALUES ('4017420', '3183', '2213', '9929', '7719', '7222');
INSERT INTO `fw_code` VALUES ('4017421', '3183', '2214', '5764', '7088', '5374');
INSERT INTO `fw_code` VALUES ('4017422', '3183', '2215', '6684', '4688', '2115');
INSERT INTO `fw_code` VALUES ('4017423', '3183', '2216', '8754', '1644', '3624');
INSERT INTO `fw_code` VALUES ('4017424', '3183', '2217', '7966', '9497', '4222');
INSERT INTO `fw_code` VALUES ('4017425', '3183', '2218', '6964', '9882', '7803');
INSERT INTO `fw_code` VALUES ('4017426', '3183', '2219', '0596', '6843', '7106');
INSERT INTO `fw_code` VALUES ('4017427', '3183', '2220', '6044', '2283', '1061');
INSERT INTO `fw_code` VALUES ('4017428', '3183', '2221', '1985', '0386', '7722');
INSERT INTO `fw_code` VALUES ('4017429', '3183', '2222', '5896', '2541', '2713');
INSERT INTO `fw_code` VALUES ('4017430', '3183', '2223', '4909', '7215', '7302');
INSERT INTO `fw_code` VALUES ('4017431', '3183', '2224', '0743', '6584', '5454');
INSERT INTO `fw_code` VALUES ('4017432', '3183', '2225', '5469', '7605', '8678');
INSERT INTO `fw_code` VALUES ('4017433', '3183', '2226', '7366', '8100', '3008');
INSERT INTO `fw_code` VALUES ('4017434', '3183', '2227', '8114', '9239', '2570');
INSERT INTO `fw_code` VALUES ('4017435', '3183', '2228', '2773', '2533', '7124');
INSERT INTO `fw_code` VALUES ('4017436', '3183', '2229', '0668', '3278', '7225');
INSERT INTO `fw_code` VALUES ('4017437', '3183', '2230', '3846', '8583', '3662');
INSERT INTO `fw_code` VALUES ('4017438', '3183', '2231', '3806', '7576', '3823');
INSERT INTO `fw_code` VALUES ('4017439', '3183', '2232', '2417', '4032', '3207');
INSERT INTO `fw_code` VALUES ('4017440', '3183', '2233', '2564', '3774', '1555');
INSERT INTO `fw_code` VALUES ('4017441', '3183', '2234', '2590', '0492', '0386');
INSERT INTO `fw_code` VALUES ('4017442', '3183', '2235', '4446', '9980', '4877');
INSERT INTO `fw_code` VALUES ('4017443', '3183', '2236', '7570', '9989', '0466');
INSERT INTO `fw_code` VALUES ('4017444', '3183', '2237', '9493', '7203', '3627');
INSERT INTO `fw_code` VALUES ('4017445', '3183', '2238', '6049', '0992', '2511');
INSERT INTO `fw_code` VALUES ('4017446', '3183', '2239', '7117', '8333', '7600');
INSERT INTO `fw_code` VALUES ('4017447', '3183', '2240', '5047', '1377', '6091');
INSERT INTO `fw_code` VALUES ('4017448', '3183', '2241', '2804', '7961', '7404');
INSERT INTO `fw_code` VALUES ('4017449', '3183', '2242', '8679', '8338', '5395');
INSERT INTO `fw_code` VALUES ('4017450', '3183', '2243', '4126', '3778', '9350');
INSERT INTO `fw_code` VALUES ('4017451', '3183', '2244', '3765', '6568', '3984');
INSERT INTO `fw_code` VALUES ('4017452', '3183', '2245', '0067', '1881', '6011');
INSERT INTO `fw_code` VALUES ('4017453', '3183', '2246', '3979', '4036', '1002');
INSERT INTO `fw_code` VALUES ('4017454', '3183', '2247', '4299', '0238', '6529');
INSERT INTO `fw_code` VALUES ('4017455', '3183', '2248', '2992', '8710', '5591');
INSERT INTO `fw_code` VALUES ('4017456', '3183', '2249', '4981', '3651', '7421');
INSERT INTO `fw_code` VALUES ('4017457', '3183', '2250', '4086', '2770', '9511');
INSERT INTO `fw_code` VALUES ('4017458', '3183', '2251', '1415', '4417', '6788');
INSERT INTO `fw_code` VALUES ('4017459', '3183', '2252', '3592', '0107', '6805');
INSERT INTO `fw_code` VALUES ('4017460', '3183', '2253', '3551', '9100', '6966');
INSERT INTO `fw_code` VALUES ('4017461', '3183', '2254', '5835', '3524', '5493');
INSERT INTO `fw_code` VALUES ('4017462', '3183', '2255', '2310', '5298', '4698');
INSERT INTO `fw_code` VALUES ('4017463', '3183', '2256', '8104', '3659', '3011');
INSERT INTO `fw_code` VALUES ('4017464', '3183', '2257', '8852', '4798', '2573');
INSERT INTO `fw_code` VALUES ('4017465', '3183', '2258', '6008', '9984', '2671');
INSERT INTO `fw_code` VALUES ('4017466', '3183', '2259', '4192', '1504', '8020');
INSERT INTO `fw_code` VALUES ('4017467', '3183', '2260', '8531', '8596', '7046');
INSERT INTO `fw_code` VALUES ('4017468', '3183', '2261', '4660', '7449', '1894');
INSERT INTO `fw_code` VALUES ('4017469', '3183', '2262', '6690', '3397', '3564');
INSERT INTO `fw_code` VALUES ('4017470', '3183', '2263', '9467', '0484', '4796');
INSERT INTO `fw_code` VALUES ('4017471', '3183', '2264', '3632', '1115', '6644');
INSERT INTO `fw_code` VALUES ('4017472', '3183', '2265', '0535', '7826', '9885');
INSERT INTO `fw_code` VALUES ('4017473', '3183', '2266', '2137', '8837', '7519');
INSERT INTO `fw_code` VALUES ('4017474', '3183', '2267', '6222', '7453', '9689');
INSERT INTO `fw_code` VALUES ('4017475', '3183', '2268', '7544', '3270', '1636');
INSERT INTO `fw_code` VALUES ('4017476', '3183', '2269', '3485', '1373', '8296');
INSERT INTO `fw_code` VALUES ('4017477', '3183', '2270', '7717', '9730', '8814');
INSERT INTO `fw_code` VALUES ('4017478', '3183', '2271', '2737', '0234', '8734');
INSERT INTO `fw_code` VALUES ('4017479', '3183', '2272', '7504', '2262', '1796');
INSERT INTO `fw_code` VALUES ('4017480', '3183', '2273', '2244', '7572', '6028');
INSERT INTO `fw_code` VALUES ('4017481', '3183', '2274', '3338', '1631', '9948');
INSERT INTO `fw_code` VALUES ('4017482', '3183', '2275', '1603', '5167', '4975');
INSERT INTO `fw_code` VALUES ('4017483', '3183', '2276', '0439', '9682', '5860');
INSERT INTO `fw_code` VALUES ('4017484', '3183', '2277', '0199', '5495', '0011');
INSERT INTO `fw_code` VALUES ('4017485', '3183', '2278', '9024', '9420', '6413');
INSERT INTO `fw_code` VALUES ('4017486', '3183', '2279', '1801', '6507', '7645');
INSERT INTO `fw_code` VALUES ('4017487', '3183', '2280', '4431', '3853', '0529');
INSERT INTO `fw_code` VALUES ('4017488', '3183', '2281', '1400', '8289', '2440');
INSERT INTO `fw_code` VALUES ('4017489', '3183', '2282', '8196', '6265', '7172');
INSERT INTO `fw_code` VALUES ('4017490', '3183', '2283', '1588', '9039', '0628');
INSERT INTO `fw_code` VALUES ('4017491', '3183', '2284', '8063', '0813', '9833');
INSERT INTO `fw_code` VALUES ('4017492', '3183', '2285', '5953', '2849', '8485');
INSERT INTO `fw_code` VALUES ('4017493', '3183', '2286', '9238', '6888', '3431');
INSERT INTO `fw_code` VALUES ('4017494', '3183', '2287', '9477', '1075', '9280');
INSERT INTO `fw_code` VALUES ('4017495', '3183', '2288', '5286', '3726', '8601');
INSERT INTO `fw_code` VALUES ('4017496', '3183', '2289', '6807', '2722', '6556');
INSERT INTO `fw_code` VALUES ('4017497', '3183', '2290', '3256', '7777', '6931');
INSERT INTO `fw_code` VALUES ('4017498', '3183', '2291', '0652', '7150', '2878');
INSERT INTO `fw_code` VALUES ('4017499', '3183', '2292', '9091', '7146', '5083');
INSERT INTO `fw_code` VALUES ('4017500', '3183', '2293', '7809', '2337', '2976');
INSERT INTO `fw_code` VALUES ('4017501', '3183', '2294', '5179', '4991', '0092');
INSERT INTO `fw_code` VALUES ('4017502', '3183', '2295', '8516', '2468', '2699');
INSERT INTO `fw_code` VALUES ('4017503', '3183', '2296', '7630', '3490', '7671');
INSERT INTO `fw_code` VALUES ('4017504', '3183', '2297', '3932', '8803', '9698');
INSERT INTO `fw_code` VALUES ('4017505', '3183', '2298', '9512', '9696', '0992');
INSERT INTO `fw_code` VALUES ('4017506', '3183', '2299', '5280', '1339', '0474');
INSERT INTO `fw_code` VALUES ('4017507', '3183', '2300', '5346', '9065', '9144');
INSERT INTO `fw_code` VALUES ('4017508', '3183', '2301', '2355', '4510', '0894');
INSERT INTO `fw_code` VALUES ('4017509', '3183', '2302', '8830', '6284', '0100');
INSERT INTO `fw_code` VALUES ('4017510', '3183', '2303', '1180', '8435', '7296');
INSERT INTO `fw_code` VALUES ('4017511', '3183', '2304', '3103', '5649', '0457');
INSERT INTO `fw_code` VALUES ('4017512', '3183', '2305', '5987', '1470', '0198');
INSERT INTO `fw_code` VALUES ('4017513', '3183', '2306', '0153', '2101', '2046');
INSERT INTO `fw_code` VALUES ('4017514', '3183', '2307', '7055', '8811', '5287');
INSERT INTO `fw_code` VALUES ('4017515', '3183', '2308', '8657', '9823', '2921');
INSERT INTO `fw_code` VALUES ('4017516', '3183', '2309', '4064', '4256', '7037');
INSERT INTO `fw_code` VALUES ('4017517', '3183', '2310', '7376', '5014', '0814');
INSERT INTO `fw_code` VALUES ('4017518', '3183', '2311', '0005', '2359', '3698');
INSERT INTO `fw_code` VALUES ('4017519', '3183', '2312', '1582', '6653', '2501');
INSERT INTO `fw_code` VALUES ('4017520', '3183', '2313', '9258', '1220', '4135');
INSERT INTO `fw_code` VALUES ('4017521', '3183', '2314', '3398', '5133', '7153');
INSERT INTO `fw_code` VALUES ('4017522', '3183', '2315', '5026', '2863', '3617');
INSERT INTO `fw_code` VALUES ('4017523', '3183', '2316', '7162', '7546', '3796');

-- ----------------------------
-- Table structure for fw_cust
-- ----------------------------
DROP TABLE IF EXISTS `fw_cust`;
CREATE TABLE `fw_cust` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `unitname` varchar(64) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `master` varchar(80) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `remark` int(254) DEFAULT NULL,
  `codelen` int(11) DEFAULT NULL,
  `mlength` int(11) DEFAULT NULL,
  `maxvalue` varchar(64) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `overk` int(11) DEFAULT NULL,
  `voicewelcome` varchar(254) DEFAULT NULL,
  `smsnote` varchar(500) DEFAULT NULL,
  `bcode` varchar(1) DEFAULT NULL,
  `upyn` varchar(1) DEFAULT NULL,
  `voicere` varchar(150) DEFAULT NULL,
  `renote` varchar(500) DEFAULT NULL,
  `vlen` int(11) DEFAULT NULL,
  `jfyn` varchar(1) DEFAULT NULL,
  `zjyn` varchar(1) DEFAULT NULL,
  `aajf` decimal(18,2) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `p_no` varchar(20) DEFAULT NULL,
  `unitinfo` varchar(500) DEFAULT NULL,
  `prodinfo` varchar(500) DEFAULT NULL,
  `zp` longblob,
  `ccodeyn` varchar(1) DEFAULT NULL,
  `ctype` varchar(20) DEFAULT NULL,
  `sntype` varchar(32) DEFAULT NULL,
  `snLen` int(11) DEFAULT NULL,
  `msnlength` int(11) DEFAULT NULL,
  `dckyn` varchar(1) DEFAULT NULL,
  `snpr` varchar(10) DEFAULT NULL,
  `chrtype` varchar(32) DEFAULT NULL,
  `ncxtype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=1828 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cust
-- ----------------------------
INSERT INTO `fw_cust` VALUES ('1827', '3183', '发茂堂', '', '', '', '', '', '', '0', '12', '2316', '800000万', '2018-04-27 00:00:00', '', '0', '', '', 'N', 'N', '', '', '0', 'N', 'N', '0.00', '', '', '', '', null, 'N', '', '4-双码流水号2', null, '0', 'N', '', '', '');

-- ----------------------------
-- Table structure for fw_dealer
-- ----------------------------
DROP TABLE IF EXISTS `fw_dealer`;
CREATE TABLE `fw_dealer` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT,
  `dl_unitcode` varchar(32) DEFAULT NULL,
  `dl_openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `dl_username` varchar(64) DEFAULT NULL,
  `dl_pwd` varchar(64) DEFAULT NULL,
  `dl_number` varchar(32) DEFAULT NULL,
  `dl_name` varchar(128) DEFAULT NULL,
  `dl_des` text,
  `dl_area` varchar(128) DEFAULT NULL,
  `dl_type` int(11) DEFAULT '0' COMMENT '代理级别分类1',
  `dl_sttype` int(11) DEFAULT '0' COMMENT '代理级别分类2',
  `dl_belong` int(11) DEFAULT '0' COMMENT '该经销商所属 上家',
  `dl_referee` int(11) DEFAULT '0' COMMENT '推荐人',
  `dl_level` int(4) DEFAULT '0' COMMENT '经销商级数',
  `dl_contact` varchar(32) DEFAULT NULL,
  `dl_tel` varchar(32) DEFAULT NULL,
  `dl_fax` varchar(32) DEFAULT NULL,
  `dl_email` varchar(64) DEFAULT NULL,
  `dl_weixin` varchar(32) DEFAULT NULL,
  `dl_wxnickname` varchar(64) DEFAULT NULL,
  `dl_wxsex` int(4) DEFAULT '0',
  `dl_wxprovince` varchar(32) DEFAULT NULL,
  `dl_wxcity` varchar(32) DEFAULT NULL,
  `dl_wxcountry` varchar(32) DEFAULT NULL,
  `dl_wxheadimg` varchar(512) DEFAULT NULL,
  `dl_qq` varchar(32) DEFAULT NULL,
  `dl_country` int(11) DEFAULT '0' COMMENT '国家',
  `dl_sheng` int(11) DEFAULT '0',
  `dl_shi` int(11) DEFAULT '0',
  `dl_qu` int(11) DEFAULT '0',
  `dl_qustr` varchar(64) DEFAULT NULL,
  `dl_address` varchar(64) DEFAULT NULL,
  `dl_idcard` varchar(64) DEFAULT NULL,
  `dl_idcardpic` varchar(64) DEFAULT NULL COMMENT '身份证图片',
  `dl_idcardpic2` varchar(64) DEFAULT NULL,
  `dl_bank` int(11) NOT NULL DEFAULT '0' COMMENT '开户行类型',
  `dl_bankcard` varchar(64) NOT NULL COMMENT '开户行卡号',
  `dl_tbdian` varchar(128) DEFAULT NULL COMMENT '淘宝店店铺名',
  `dl_tbzhanggui` varchar(128) DEFAULT NULL COMMENT '淘宝店掌柜名',
  `dl_tbsqpic` varchar(64) DEFAULT NULL COMMENT '淘宝授权书',
  `dl_tblevel` int(11) DEFAULT NULL COMMENT '淘宝授权级别',
  `dl_remark` varchar(512) DEFAULT NULL,
  `dl_status` int(4) DEFAULT NULL,
  `dl_startdate` int(11) DEFAULT NULL,
  `dl_enddate` int(11) DEFAULT NULL,
  `dl_addtime` int(11) DEFAULT NULL,
  `dl_pic` varchar(64) DEFAULT NULL,
  `dl_brand` varchar(128) DEFAULT NULL COMMENT '授权品牌',
  `dl_brandlevel` varchar(64) DEFAULT NULL COMMENT '授权品牌级别',
  `dl_oddtime` int(11) DEFAULT '0' COMMENT '出货单号计数日期',
  `dl_oddcount` int(11) DEFAULT '0' COMMENT '出货单号计数',
  `dl_logintime` int(11) DEFAULT '0',
  `dl_fanli` decimal(10,2) DEFAULT '0.00' COMMENT '代理返利金额',
  `dl_jifen` int(11) DEFAULT '0' COMMENT '代理积分',
  `dl_lastflid` int(11) DEFAULT '0' COMMENT '记录最近计算结束的返利明细id',
  `dl_flmodel` int(11) DEFAULT '0' COMMENT '[明臣使用]推荐人选择的返利模式，1-一次性  ',
  `dl_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '保证金',
  `dl_depositpic` varchar(32) DEFAULT NULL COMMENT '保证金支付图',
  `dl_paypic` varchar(32) DEFAULT NULL COMMENT '支付凭证图',
  `dl_stockpic` varchar(64) NOT NULL COMMENT '股权证书图',
  `dl_sz_sheng` varchar(255) DEFAULT '0',
  `dl_sz_shi` varchar(255) DEFAULT '0',
  `dl_sz_qu` varchar(255) DEFAULT '0',
  PRIMARY KEY (`dl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_dealer
-- ----------------------------
INSERT INTO `fw_dealer` VALUES ('1', '3183', null, 'test', '66730c784751efc66db25382bd59bbbb', 'FMT0000001', '钟琪', null, null, '7', '0', '0', '0', '1', '钟生', '15875872797', null, null, null, null, '0', '', '', '', null, null, '0', '44', '4401', '440103', '广州荔湾', '广州荔湾', null, null, null, '0', '', null, null, null, null, null, '1', '1539589846', '1571125846', null, null, null, null, '0', '0', '1541816338', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');
INSERT INTO `fw_dealer` VALUES ('43', '3183', '', '15875872792', '1bde2478115e4e64b4f71e030dc33710', 'FMT0000043', '钟琪2', null, null, '7', '0', '0', '1', '1', '钟琪2', '15875872792', null, null, '15875872792', '', '0', '', '', '', '', null, '0', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '440804199606160572', '', '', '0', '', '', '', null, null, '', '1', '1540454945', '1571990945', '1540454937', null, '', '', '0', '0', '1540535447', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');
INSERT INTO `fw_dealer` VALUES ('45', '3183', '', '15875872794', '8fa2bfbeed9dc739761683298301a3b4', 'FMT0000045', '钟琪4', null, null, '8', '0', '0', '44', '2', '钟琪4', '15875872794', null, null, '15875872794', '', '0', '', '', '', '', null, '0', '44', '4401', '440104', '广东广州越秀区', '广东广州越秀区', '440804199606160574', '', '', '0', '', '', '', null, null, '', '1', '1540522679', '1572058679', '1540522670', null, '', '', '0', '0', '1540534124', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');
INSERT INTO `fw_dealer` VALUES ('47', '3183', '', '15875872796', '531440891208d2c680f05d04aa42a247', 'FMT0000047', '钟琪6', null, null, '7', '0', '0', '0', '1', '钟琪6', '15875872796', null, null, '15875872796', '', '0', '', '', '', '', null, '0', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '440804199606160576', '', '', '0', '', '', '', null, null, '', '1', '1541139716', '1572675716', '1541139709', null, '', '', '0', '0', '0', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');
INSERT INTO `fw_dealer` VALUES ('46', '3183', '', '15875872795', '6299c582af7ba53fda8c1b769c6cb129', 'FMT0000046', '钟琪5', null, null, '10', '0', '0', '45', '4', '钟琪5', '15875872795', null, null, '15875872795', '', '0', '', '', '', '', null, '0', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '440804199606160575', '', '', '0', '', '', '', null, null, '', '1', '1540534202', '1572070202', '1540534187', null, '', '', '0', '0', '1541139637', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');
INSERT INTO `fw_dealer` VALUES ('44', '3183', '', '15875872793', 'ad2a523b032e8cb63f6a217150d94385', 'FMT0000044', '钟琪3', null, null, '7', '0', '0', '43', '1', '钟琪3', '15875872793', null, null, '15875872793', '', '0', '', '', '', '', null, '0', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '440804199606160573', '', '', '0', '', '', '', null, null, '', '1', '1540469315', '1572005315', '1540469282', null, '', '', '0', '0', '1541145484', '0.00', '0', '0', '0', '0.00', null, null, '', '0', '0', '0');

-- ----------------------------
-- Table structure for fw_dealerlogs
-- ----------------------------
DROP TABLE IF EXISTS `fw_dealerlogs`;
CREATE TABLE `fw_dealerlogs` (
  `dlg_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlg_unitcode` int(32) DEFAULT NULL COMMENT '企业码',
  `dlg_dlid` int(11) DEFAULT '0' COMMENT '对应代理id',
  `dlg_type` int(11) DEFAULT '0' COMMENT '0-公司操作 1-代理操作',
  `dlg_operatid` int(11) DEFAULT '0' COMMENT '操作者id',
  `dlg_dlusername` varchar(32) DEFAULT NULL COMMENT '操作者用户名',
  `dlg_dlname` varchar(32) DEFAULT NULL COMMENT '操作者名',
  `dlg_action` varchar(64) DEFAULT NULL COMMENT '动作',
  `dlg_addtime` int(11) DEFAULT NULL COMMENT '操作时间',
  `dlg_link` varchar(256) DEFAULT NULL COMMENT '操作链接',
  `dlg_ip` varchar(32) DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`dlg_id`),
  KEY `dlg_unitcode` (`dlg_unitcode`),
  KEY `dlg_dlid` (`dlg_dlid`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='代理商操作日志表';

-- ----------------------------
-- Records of fw_dealerlogs
-- ----------------------------
INSERT INTO `fw_dealerlogs` VALUES ('1', '3183', '1', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539589846', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('2', '3183', '1', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-1-1', '1539589851', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('3', '3183', '2', '1', '2', '15875872792', '钟琪2', '代理商注册 推荐人：famaotang 上家：总公司', '1539595042', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('4', '3183', '3', '1', '3', '15875872792', '钟琪2', '代理商注册 推荐人：famaotang 上家：总公司', '1539597034', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('5', '3183', '3', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539652018', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('6', '3183', '4', '1', '4', '15875872792', '钟琪2', '代理商注册 推荐人：famaotang 上家：总公司', '1539672802', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('7', '3183', '4', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539675630', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('8', '3183', '5', '1', '5', '15875872793', '钟琪3', '代理商注册 推荐人：famaotang 上家：总公司', '1539681329', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('9', '3183', '5', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539681338', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('10', '3183', '6', '1', '6', '15875872794', '钟琪4', '代理商注册 推荐人：famaotang 上家：总公司', '1539681496', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('11', '3183', '6', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539681505', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('12', '3183', '7', '1', '7', '15875872795', '钟琪5', '代理商注册 推荐人：famaotang 上家：总公司', '1539683628', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('13', '3183', '7', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539683640', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('14', '3183', '8', '1', '8', '15875872100', '钟琪100', '代理商注册 推荐人：famaotang 上家：总公司', '1539683821', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('15', '3183', '8', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539683850', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('16', '3183', '9', '1', '9', '15875872796', '钟琪6', '代理商注册 推荐人：famaotang 上家：总公司', '1539740924', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('17', '3183', '9', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539740933', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('18', '3183', '10', '1', '10', '15875872120', '钟琪120', '代理商注册 推荐人：famaotang 上家：总公司', '1539760632', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('19', '3183', '10', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539760641', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('20', '3183', '11', '1', '11', '15875872799', '钟琪9', '代理商注册 推荐人：famaotang 上家：总公司', '1539762884', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('21', '3183', '11', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539762899', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('22', '3183', '12', '1', '12', '15875872710', '钟琪10', '代理商注册 推荐人：famaotang 上家：总公司', '1539763552', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('23', '3183', '12', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539763562', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('24', '3183', '13', '1', '13', '15875872711', '钟琪11', '代理商注册 推荐人：famaotang 上家：总公司', '1539764272', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('25', '3183', '13', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539764280', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('26', '3183', '14', '1', '14', '15875872712', '钟琪12', '代理商注册 推荐人：famaotang 上家：总公司', '1539764383', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('27', '3183', '14', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539764390', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('28', '3183', '15', '1', '15', '15875872713', '钟琪13', '代理商注册 推荐人：famaotang 上家：总公司', '1539764544', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('29', '3183', '15', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539764552', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('30', '3183', '16', '1', '16', '15875872714', '钟琪14', '代理商注册 推荐人：famaotang 上家：总公司', '1539764744', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('31', '3183', '16', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539764753', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('32', '3183', '17', '1', '17', '15875872715', '钟琪', '代理商注册 推荐人：famaotang 上家：总公司', '1539764878', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('33', '3183', '17', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539764886', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('34', '3183', '18', '1', '18', '15875872716', '钟琪16', '代理商注册 推荐人：famaotang 上家：总公司', '1539766315', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('35', '3183', '18', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539766323', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('36', '3183', '19', '1', '19', '15875872717', '钟琪17', '代理商注册 推荐人：famaotang 上家：总公司', '1539832664', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('37', '3183', '19', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539832671', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('38', '3183', '20', '1', '20', '15875872718', '钟琪18', '代理商注册 推荐人：famaotang 上家：总公司', '1539832807', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('39', '3183', '20', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539832815', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('40', '3183', '21', '1', '21', '15875872200', '钟琪200', '代理商注册 推荐人：famaotang 上家：总公司', '1539917062', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('41', '3183', '21', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539917070', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('42', '3183', '22', '1', '22', '15875872201', '钟琪201', '代理商注册 推荐人：15875872200 上家：总公司', '1539917225', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('43', '3183', '22', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539917232', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('44', '3183', '23', '1', '23', '15875872300', '钟琪300', '代理商注册 推荐人：famaotang 上家：总公司', '1539928573', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('45', '3183', '23', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539928582', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('46', '3183', '24', '1', '24', '15875872202', '钟琪202', '代理商注册 推荐人：famaotang 上家：总公司', '1539934167', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('47', '3183', '24', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539934173', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('48', '3183', '26', '1', '26', '15875872720', '钟琪20', '代理商注册 推荐人：famaotang 上家：总公司', '1539939216', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('49', '3183', '26', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539939222', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('50', '3183', '27', '1', '27', '15875872721', '钟琪21', '代理商注册 推荐人：famaotang 上家：总公司', '1539939486', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('51', '3183', '27', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539939496', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('52', '3183', '28', '1', '28', '15875872101', '钟琪101', '代理商注册 推荐人：famaotang 上家：总公司', '1539939992', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('53', '3183', '28', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539940010', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('54', '3183', '29', '1', '29', '15875872102', '钟琪102', '代理商注册 推荐人：famaotang 上家：总公司', '1539940630', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('55', '3183', '29', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539940640', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('56', '3183', '30', '1', '30', '15875872103', '钟琪103', '代理商注册 推荐人：famaotang 上家：总公司', '1539940937', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('57', '3183', '30', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539940944', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('58', '3183', '31', '1', '31', '15875872104', '钟琪104', '代理商注册 推荐人：famaotang 上家：总公司', '1539941062', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('59', '3183', '31', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539941070', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('60', '3183', '32', '1', '32', '15875872500', '钟琪500', '代理商注册 推荐人：famaotang 上家：总公司', '1539942243', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('61', '3183', '32', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539942250', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('62', '3183', '33', '1', '33', '15875872501', '钟琪501', '代理商注册 推荐人：15875872500 上家：总公司', '1539942378', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('63', '3183', '33', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539942563', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('64', '3183', '34', '1', '34', '15875872504', '钟琪504', '代理商注册 推荐人：15875872795 上家：总公司', '1539943081', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('65', '3183', '34', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539943087', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('66', '3183', '35', '1', '35', '15875872505', '钟琪505', '代理商注册 推荐人：15875872795 上家：总公司', '1539944091', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('67', '3183', '35', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539944097', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('68', '3183', '36', '1', '36', '15875872506', '钟琪506', '代理商注册 推荐人：15875872795 上家：总公司', '1539945032', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('69', '3183', '36', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539945039', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('70', '3183', '37', '1', '37', '15875872507', '钟琪507', '代理商注册 推荐人：15875872795 上家：总公司', '1539949664', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('71', '3183', '37', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539949672', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('72', '3183', '38', '1', '38', '15875872508', '钟琪508', '代理商注册 推荐人：15875872795 上家：总公司', '1539999411', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('73', '3183', '38', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1539999420', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('74', '3183', '39', '1', '39', '15875872600', '钟琪600', '代理商注册 推荐人：15875872795 上家：总公司', '1540003206', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('75', '3183', '39', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540003217', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('76', '3183', '40', '1', '40', '15875872730', '钟琪30', '代理商注册 推荐人：15875872795 上家：总公司', '1540014728', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('77', '3183', '40', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540014735', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('78', '3183', '41', '1', '41', '15875872731', '钟琪31', '代理商注册 推荐人：15875872795 上家：总公司', '1540014825', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('79', '3183', '41', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540014831', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('80', '3183', '42', '1', '42', '15875872732', '钟琪32', '代理商注册 推荐人：15875872795 上家：总公司', '1540015018', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('81', '3183', '42', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540015035', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('82', '3183', '43', '1', '43', '15875872792', '钟琪2', '代理商注册 推荐人：test 上家：总公司', '1540454937', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('83', '3183', '43', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540454945', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('84', '3183', '44', '1', '44', '15875872793', '钟琪3', '代理商注册 推荐人：15875872792 上家：总公司', '1540469282', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('85', '3183', '44', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540469315', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('86', '3183', '45', '1', '45', '15875872794', '钟琪4', '代理商注册 推荐人：15875872793 上家：总公司', '1540522670', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('87', '3183', '45', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540522679', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('88', '3183', '46', '1', '46', '15875872795', '钟琪5', '代理商注册 推荐人：15875872794 上家：总公司', '1540534187', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('89', '3183', '46', '0', '1146', 'famaotang', 'famaotang', '审核/禁用经销商-0-1', '1540534202', '/famaotang/Mp/Dealer/active', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('90', '3183', '47', '1', '47', '15875872796', '钟琪6', '代理商注册 推荐人：15875872795 上家：总公司', '1541139709', '/famaotang/Famaotang/Dealer/apply', '0.0.0.0');
INSERT INTO `fw_dealerlogs` VALUES ('91', '3183', '47', '0', '1146', 'test', 'test', '审核/禁用经销商-0-1', '1541139716', '/famaotang/Mp/Dealer/active', '0.0.0.0');

-- ----------------------------
-- Table structure for fw_denyip
-- ----------------------------
DROP TABLE IF EXISTS `fw_denyip`;
CREATE TABLE `fw_denyip` (
  `deny_id` int(11) NOT NULL AUTO_INCREMENT,
  `deny_ip` varchar(32) DEFAULT NULL,
  `deny_remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`deny_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='禁止ip表';

-- ----------------------------
-- Records of fw_denyip
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dladdress
-- ----------------------------
DROP TABLE IF EXISTS `fw_dladdress`;
CREATE TABLE `fw_dladdress` (
  `dladd_id` int(11) NOT NULL AUTO_INCREMENT,
  `dladd_unitcode` varchar(32) DEFAULT NULL,
  `dladd_dlid` int(11) DEFAULT NULL COMMENT '代理商id',
  `dladd_contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `dladd_sheng` int(11) DEFAULT '0' COMMENT '省',
  `dladd_shi` int(11) DEFAULT '0' COMMENT '市',
  `dladd_qu` int(11) DEFAULT '0' COMMENT '区',
  `dladd_diqustr` varchar(64) DEFAULT NULL COMMENT '地区',
  `dladd_address` varchar(64) DEFAULT NULL COMMENT '地址',
  `dladd_tel` varchar(32) DEFAULT NULL,
  `dladd_default` int(11) DEFAULT '0' COMMENT '默认',
  `dladd_customer` int(11) DEFAULT '0' COMMENT '是否代理的客户',
  PRIMARY KEY (`dladd_id`),
  KEY `dladd_unitcode` (`dladd_unitcode`),
  KEY `dladd_dlid` (`dladd_dlid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='经销商地址表';

-- ----------------------------
-- Records of fw_dladdress
-- ----------------------------
INSERT INTO `fw_dladdress` VALUES ('1', '3183', '1', '钟琪', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区中山八路', '15875872797', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('4', '3183', '4', '钟琪2', '44', '4401', '440104', '广东广州越秀', '广东广州越秀', '15875872792', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('5', '3183', '5', '钟琪3', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区中山八路', '15875872793', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('6', '3183', '6', '钟琪4', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872794', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('7', '3183', '7', '钟琪5', '44', '4401', '440106', '广东广州天河', '广东广州天河', '15872872795', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('8', '3183', '8', '钟琪100', '44', '4401', '440184', '广东广州从化', '广东广州从化', '15875872100', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('9', '3183', '9', '钟琪6', '44', '4401', '440116', '广东广州萝岗区', '广东广州萝岗区', '15875872796', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('10', '3183', '10', '钟琪120', '44', '4401', '440105', '广东广州海珠区', '广东广州海珠区', '15875872120', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('11', '3183', '11', '钟琪9', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872799', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('12', '3183', '12', '钟琪10', '44', '4401', '440113', '广东广州番禺区', '广东广州番禺区', '15875872710', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('13', '3183', '13', '钟琪11', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872711', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('14', '3183', '14', '钟琪12', '44', '4401', '440104', '广东广州越秀区', '广东广州越秀区', '15875872712', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('15', '3183', '15', '钟琪13', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872713', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('16', '3183', '16', '钟琪14', '44', '4401', '440111', '广东广州白云区', '广东广州白云区', '15875872714', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('17', '3183', '17', '钟琪', '44', '4401', '440111', '广东广州白云区', '广东广州白云区', '15875872715', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('18', '3183', '18', '钟琪16', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872716', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('19', '3183', '19', '钟琪17', '44', '4401', '440114', '广东广州花都区', '广东广州花都区', '15875872717', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('20', '3183', '20', '钟琪18', '44', '4401', '440114', '广东广州花都区', '广东广州花都区', '15875872718', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('21', '3183', '21', '钟琪200', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区官方的风格', '15875872200', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('22', '3183', '22', '钟琪201', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872201', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('23', '3183', '23', '钟琪300', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872300', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('24', '3183', '24', '钟琪202', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872202', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('25', '3183', '25', '钟琪203', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区对方v的', '15875872203', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('26', '3183', '26', '钟琪20', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872720', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('27', '3183', '27', '钟琪21', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872721', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('28', '3183', '28', '钟琪101', '44', '4401', '440184', '广东广州从化市', '广东广州从化市', '15875872101', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('29', '3183', '29', '钟琪102', '44', '4401', '440184', '广东广州从化市', '广东广州从化市', '15875872102', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('30', '3183', '30', '钟琪103', '44', '4401', '440113', '广东广州番禺区', '广东广州番禺区', '15875872103', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('31', '3183', '31', '钟琪104', '44', '4401', '440112', '广东广州黄埔区', '广东广州黄埔区', '15875872104', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('32', '3183', '32', '钟琪500', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872500', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('33', '3183', '33', '钟琪501', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872501', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('34', '3183', '34', '钟琪504', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872504', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('35', '3183', '35', '钟琪505', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872505', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('36', '3183', '36', '钟琪506', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872506', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('37', '3183', '37', '钟琪507', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872507', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('38', '3183', '38', '钟琪508', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872508', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('39', '3183', '39', '钟琪600', '44', '4401', '440106', '广东广州天河区', '广东广州天河区', '15875872600', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('40', '3183', '40', '钟琪30', '44', '4401', '440115', '广东广州南沙区', '广东广州南沙区', '15875872730', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('41', '3183', '41', '钟琪31', '44', '4401', '440115', '广东广州南沙区', '广东广州南沙区', '15875872731', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('42', '3183', '42', '钟琪32', '44', '4401', '440115', '广东广州南沙区', '广东广州南沙区', '15875872732', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('43', '3183', '43', '钟琪2', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872792', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('44', '3183', '44', '钟琪3', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872793', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('45', '3183', '45', '钟琪4', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区uy', '15875872794', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('46', '3183', '46', '钟琪5', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872795', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('47', '3183', '47', '钟琪6', '44', '4401', '440103', '广东广州荔湾区', '广东广州荔湾区', '15875872796', '1', '0');

-- ----------------------------
-- Table structure for fw_dljfdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfdetail`;
CREATE TABLE `fw_dljfdetail` (
  `dljf_id` int(11) NOT NULL AUTO_INCREMENT,
  `dljf_unitcode` varchar(32) DEFAULT NULL,
  `dljf_dlid` int(11) DEFAULT '0' COMMENT '代理id',
  `dljf_username` varchar(32) DEFAULT NULL COMMENT '代理用户名',
  `dljf_type` int(11) DEFAULT '0' COMMENT '积分类型',
  `dljf_jf` int(11) DEFAULT '0' COMMENT '积分',
  `dljf_addtime` int(11) DEFAULT NULL,
  `dljf_ip` varchar(32) DEFAULT NULL,
  `dljf_actionuser` varchar(32) DEFAULT NULL COMMENT '积分操作者',
  `dljf_odid` int(11) DEFAULT '0' COMMENT '订单流水id',
  `dljf_orderid` varchar(32) DEFAULT NULL COMMENT '订单orderid',
  `dljf_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `dljf_proid` int(11) DEFAULT '0' COMMENT '订单产品id',
  `dljf_qty` int(11) DEFAULT '0' COMMENT '订单数量',
  `dljf_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  PRIMARY KEY (`dljf_id`),
  KEY `jf_uintcode` (`dljf_unitcode`),
  KEY `jf_code` (`dljf_orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代购积分详细';

-- ----------------------------
-- Records of fw_dljfdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfexchange
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfexchange`;
CREATE TABLE `fw_dljfexchange` (
  `exch_id` int(11) NOT NULL AUTO_INCREMENT,
  `exch_unitcode` varchar(32) DEFAULT NULL,
  `exch_jf` int(11) DEFAULT NULL,
  `exch_qty` int(11) DEFAULT NULL,
  `exch_dlid` int(11) DEFAULT '0' COMMENT '兑换代理id',
  `exch_username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `exch_contact` varchar(32) DEFAULT NULL,
  `exch_tel` varchar(32) DEFAULT NULL,
  `exch_address` varchar(254) DEFAULT NULL,
  `exch_msg` varchar(512) DEFAULT NULL,
  `exch_kuaidi` varchar(32) DEFAULT NULL,
  `exch_kdhao` varchar(32) DEFAULT NULL,
  `exch_time` int(11) DEFAULT NULL,
  `exch_remark` varchar(512) DEFAULT NULL,
  `exch_state` int(4) DEFAULT NULL,
  `exch_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代购积分兑换';

-- ----------------------------
-- Records of fw_dljfexchange
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfexchdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfexchdetail`;
CREATE TABLE `fw_dljfexchdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_exchid` int(11) DEFAULT NULL,
  `detail_unitcode` varchar(32) DEFAULT NULL,
  `detail_giftid` int(11) DEFAULT NULL,
  `detail_giftname` varchar(128) DEFAULT NULL,
  `detail_xnid` int(11) DEFAULT '0' COMMENT '虚拟礼品兑换数据id',
  `detail_xncardid` varchar(64) DEFAULT NULL,
  `detail_xnpwd` varchar(256) DEFAULT NULL,
  `detail_jf` int(11) DEFAULT NULL,
  `detail_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代理积分兑换详细';

-- ----------------------------
-- Records of fw_dljfexchdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfgift
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfgift`;
CREATE TABLE `fw_dljfgift` (
  `gif_id` int(11) NOT NULL AUTO_INCREMENT,
  `gif_unitcode` varchar(32) DEFAULT NULL,
  `gif_type` int(4) DEFAULT NULL,
  `gif_name` varchar(128) DEFAULT NULL,
  `gif_pic` varchar(64) DEFAULT NULL,
  `gif_jf` int(11) DEFAULT NULL,
  `gif_qty` int(11) DEFAULT NULL,
  `gif_brief` varchar(254) DEFAULT NULL,
  `gif_des` text,
  `gif_addtime` int(11) DEFAULT NULL,
  `gif_active` int(4) DEFAULT NULL,
  PRIMARY KEY (`gif_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代理积分礼品';

-- ----------------------------
-- Records of fw_dljfgift
-- ----------------------------
INSERT INTO `fw_dljfgift` VALUES ('1', '3183', '1', 'we', '3183/1541839169_4961.jpg', '34', '123', null, 'ertert', '1541839169', '1');

-- ----------------------------
-- Table structure for fw_dlsttype
-- ----------------------------
DROP TABLE IF EXISTS `fw_dlsttype`;
CREATE TABLE `fw_dlsttype` (
  `dlstt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlstt_unitcode` varchar(32) DEFAULT NULL,
  `dlstt_name` varchar(64) DEFAULT NULL,
  `dlstt_level` int(11) DEFAULT '0' COMMENT '代理级别',
  `dlstt_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利1级',
  `dlstt_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利2级',
  PRIMARY KEY (`dlstt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代理级别分类2';

-- ----------------------------
-- Records of fw_dlsttype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dltype
-- ----------------------------
DROP TABLE IF EXISTS `fw_dltype`;
CREATE TABLE `fw_dltype` (
  `dlt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlt_unitcode` varchar(32) DEFAULT NULL,
  `dlt_name` varchar(64) DEFAULT NULL,
  `dlt_level` int(11) DEFAULT '0' COMMENT '代理级别',
  `dlt_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利1级',
  `dlt_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利2级',
  `dlt_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利3级',
  `dlt_fanli4` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利4',
  `dlt_fanli5` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利5',
  `dlt_fanli6` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利6',
  `dlt_fanli7` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利7',
  `dlt_fanli8` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利8',
  `dlt_fanli9` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利9',
  `dlt_fanli10` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利10',
  `dlt_firstquota` decimal(10,2) DEFAULT '0.00' COMMENT '首次下单金额',
  `dlt_minnum` decimal(10,2) DEFAULT '0.00' COMMENT '最低补货金额',
  `dlt_butie` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总公司补贴',
  PRIMARY KEY (`dlt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='代理级别分类1';

-- ----------------------------
-- Records of fw_dltype
-- ----------------------------
INSERT INTO `fw_dltype` VALUES ('8', '3183', '体验店', '2', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltype` VALUES ('9', '3183', '工作室', '3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2448.00', '2448.00', '0.00');
INSERT INTO `fw_dltype` VALUES ('10', '3183', '合伙人', '4', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltype` VALUES ('11', '3183', 'VIP客户', '5', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltype` VALUES ('7', '3183', '旗舰店', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2000.00', '0.00');

-- ----------------------------
-- Table structure for fw_dltypefanli
-- ----------------------------
DROP TABLE IF EXISTS `fw_dltypefanli`;
CREATE TABLE `fw_dltypefanli` (
  `tfl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tfl_unitcode` varchar(32) DEFAULT NULL,
  `tfl_dltype` int(11) DEFAULT '0' COMMENT '推荐级别',
  `tfl_tjdltype` int(11) DEFAULT '0' COMMENT '被推荐级别',
  `tfl_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '直推返利',
  `tfl_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '间推返利',
  `tfl_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '第三间推返利',
  PRIMARY KEY (`tfl_id`),
  KEY `tfl_unitcode` (`tfl_unitcode`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='推荐返利设置';

-- ----------------------------
-- Records of fw_dltypefanli
-- ----------------------------
INSERT INTO `fw_dltypefanli` VALUES ('21', '3183', '8', '7', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('22', '3183', '8', '8', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('23', '3183', '8', '9', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('24', '3183', '8', '10', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('25', '3183', '8', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('26', '3183', '7', '7', '100.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('27', '3183', '7', '8', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('28', '3183', '7', '9', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('29', '3183', '7', '10', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('30', '3183', '7', '11', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for fw_express
-- ----------------------------
DROP TABLE IF EXISTS `fw_express`;
CREATE TABLE `fw_express` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_name` varchar(32) DEFAULT NULL COMMENT '快递名称',
  `exp_code` varchar(32) DEFAULT NULL COMMENT '快递100接口对应快递代码',
  `exp_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='快递表';

-- ----------------------------
-- Records of fw_express
-- ----------------------------
INSERT INTO `fw_express` VALUES ('5', '无需物流', '', '1500707836');
INSERT INTO `fw_express` VALUES ('6', '顺丰快递', 'shunfeng', '1500707833');
INSERT INTO `fw_express` VALUES ('7', '申通快递', 'shentong', '1500707785');
INSERT INTO `fw_express` VALUES ('8', '圆通快递', 'yuantong', '1500707811');
INSERT INTO `fw_express` VALUES ('9', '韵达快递', 'yunda', '1500707819');
INSERT INTO `fw_express` VALUES ('10', '中通快递', 'zhongtong', '1500707788');
INSERT INTO `fw_express` VALUES ('11', '德邦物流', 'debangwuliu', '1497510935');
INSERT INTO `fw_express` VALUES ('12', '百世汇通', 'huitongkuaidi', '1500707816');
INSERT INTO `fw_express` VALUES ('13', '国通快递', 'guotongkuaidi', '1497511162');
INSERT INTO `fw_express` VALUES ('14', '邮政包裹/平邮/挂号信', 'youzhengguonei', '1500703723');
INSERT INTO `fw_express` VALUES ('15', 'EMS', 'ems', '1500703783');
INSERT INTO `fw_express` VALUES ('16', '佳吉物流', 'jiajiwuliu', '1500703867');
INSERT INTO `fw_express` VALUES ('17', '加运美', 'jiayunmeiwuliu', '1500703892');
INSERT INTO `fw_express` VALUES ('18', '龙邦物流', 'longbanwuliu', '1500703920');
INSERT INTO `fw_express` VALUES ('19', '联邦快递', 'lianbangkuaidi', '1500703948');
INSERT INTO `fw_express` VALUES ('20', '全日通', 'quanritongkuaidi', '1500703984');
INSERT INTO `fw_express` VALUES ('21', '全峰快递', 'quanfengkuaidi', '1500704000');
INSERT INTO `fw_express` VALUES ('22', '如风达快递', 'rufengda', '1500704018');
INSERT INTO `fw_express` VALUES ('23', '天天快递', 'tiantian', '1500704054');
INSERT INTO `fw_express` VALUES ('24', '优速物流', 'youshuwuliu', '1500704390');
INSERT INTO `fw_express` VALUES ('25', '运通快递', 'yuntongkuaidi', '1500707666');
INSERT INTO `fw_express` VALUES ('26', '速尔物流', 'suer', '1500707766');

-- ----------------------------
-- Table structure for fw_fanlidetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_fanlidetail`;
CREATE TABLE `fw_fanlidetail` (
  `fl_id` int(11) NOT NULL AUTO_INCREMENT,
  `fl_unitcode` varchar(32) DEFAULT NULL COMMENT '企业码',
  `fl_dlid` int(11) DEFAULT '0' COMMENT '接收返利的经销商id',
  `fl_senddlid` int(11) DEFAULT '0' COMMENT '发放返利的代理',
  `fl_type` int(11) DEFAULT '0' COMMENT '返利类型',
  `fl_money` decimal(10,2) DEFAULT '0.00' COMMENT '返利金额',
  `fl_shouxufei` decimal(10,2) DEFAULT '0.00' COMMENT '返利手续费',
  `fl_refedlid` int(11) DEFAULT '0' COMMENT '推荐返利中被推荐的经销商id',
  `fl_oddlid` int(11) DEFAULT '0' COMMENT '订单返利中下单的经销商id',
  `fl_odid` int(11) DEFAULT '0' COMMENT '订单返利中订单id',
  `fl_orderid` varchar(32) DEFAULT NULL COMMENT '订单orderid',
  `fl_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `fl_oddtid` int(11) DEFAULT '0' COMMENT '订单详细id',
  `fl_proid` int(11) DEFAULT '0' COMMENT '订单产品id',
  `fl_qty` int(11) DEFAULT '0' COMMENT '订单产品数量',
  `fl_level` int(11) DEFAULT '0' COMMENT '该返利是第几级返利',
  `fl_addtime` int(11) DEFAULT '0' COMMENT '返利时间',
  `fl_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `fl_state` int(11) DEFAULT '0' COMMENT '0-待收款 1-已收款 2-收款中 9-取消',
  `fl_rcid` int(11) DEFAULT '0' COMMENT '对应提现id',
  `fl_blid` int(11) DEFAULT '0' COMMENT '对应充值明细id',
  PRIMARY KEY (`fl_id`),
  KEY `fl_unitcode` (`fl_unitcode`),
  KEY `fl_dlid` (`fl_dlid`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='返利明细';

-- ----------------------------
-- Records of fw_fanlidetail
-- ----------------------------
INSERT INTO `fw_fanlidetail` VALUES ('33', '3183', '1', '0', '1', '100.00', '10.00', '43', '0', '0', '', '0', '0', '0', '0', '1', '1540518200', '邀请代理 钟琪2(15875872792) 成为 旗舰店', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('34', '3183', '1', '0', '2', '4000.00', '400.00', '0', '43', '99', '201810260944231275', '0', '115', '1', '40', '1', '1540518280', '代理 钟琪2(15875872792) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('35', '3183', '1', '0', '2', '3200.00', '320.00', '0', '43', '99', '201810260944231275', '0', '114', '2', '16', '1', '1540518280', '代理 钟琪2(15875872792) 订购 测试2 数量 16', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('36', '3183', '1', '0', '2', '20000.00', '2000.00', '0', '43', '100', '201810260945226298', '0', '117', '1', '200', '1', '1540518344', '代理 钟琪2(15875872792) 订购 测试1 数量 200', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('37', '3183', '1', '0', '2', '20000.00', '2000.00', '0', '43', '101', '201810260949472594', '0', '121', '1', '200', '1', '1540518641', '代理 钟琪2(15875872792) 订购 测试1 数量 200', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('38', '3183', '1', '0', '2', '10000.00', '1000.00', '0', '43', '102', '201810260954531442', '0', '124', '1', '100', '1', '1540518914', '代理 钟琪2(15875872792) 订购 测试1 数量 100', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('39', '3183', '1', '0', '2', '500.00', '50.00', '0', '43', '102', '201810260954531442', '0', '123', '1', '5', '1', '1540518914', '代理 钟琪2(15875872792) 订购 测试1 数量 5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('40', '3183', '1', '0', '2', '1900.00', '190.00', '0', '43', '102', '201810260954531442', '0', '122', '2', '9', '1', '1540518914', '代理 钟琪2(15875872792) 订购 测试2 数量 9.5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('41', '3183', '43', '0', '1', '100.00', '10.00', '44', '0', '0', '', '0', '0', '0', '0', '1', '1540519182', '邀请代理 钟琪3(15875872793) 成为 旗舰店', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('42', '3183', '43', '0', '2', '4000.00', '400.00', '0', '44', '104', '201810261000371809', '0', '128', '1', '40', '1', '1540519265', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('43', '3183', '1', '0', '2', '400.00', '40.00', '0', '44', '104', '201810261000371809', '0', '128', '1', '40', '2', '1540519265', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('44', '3183', '43', '0', '2', '2400.00', '240.00', '0', '44', '104', '201810261000371809', '0', '127', '2', '12', '1', '1540519265', '代理 钟琪3(15875872793) 订购 测试2 数量 12', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('45', '3183', '43', '0', '2', '4000.00', '400.00', '0', '44', '105', '201810261007436871', '0', '130', '1', '40', '1', '1540519679', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('46', '3183', '1', '0', '2', '400.00', '40.00', '0', '44', '105', '201810261007436871', '0', '130', '1', '40', '2', '1540519679', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('47', '3183', '43', '0', '2', '3200.00', '320.00', '0', '44', '105', '201810261007436871', '0', '129', '2', '16', '1', '1540519679', '代理 钟琪3(15875872793) 订购 测试2 数量 16', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('48', '3183', '43', '0', '2', '4000.00', '400.00', '0', '44', '106', '201810261015515376', '0', '132', '1', '40', '1', '1540520425', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('49', '3183', '1', '0', '2', '400.00', '40.00', '0', '44', '106', '201810261015515376', '0', '132', '1', '40', '2', '1540520425', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('50', '3183', '43', '0', '2', '3200.00', '320.00', '0', '44', '106', '201810261015515376', '0', '131', '2', '16', '1', '1540520425', '代理 钟琪3(15875872793) 订购 测试2 数量 16', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('51', '3183', '43', '0', '2', '4000.00', '400.00', '0', '44', '107', '201810261049511620', '0', '134', '1', '40', '1', '1540522212', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('52', '3183', '1', '0', '2', '400.00', '40.00', '0', '44', '107', '201810261049511620', '0', '134', '1', '40', '2', '1540522212', '代理 钟琪3(15875872793) 订购 测试1 数量 40', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('53', '3183', '1', '0', '2', '320.00', '32.00', '0', '44', '107', '201810261049511620', '0', '133', '2', '16', '2', '1540522212', '代理 钟琪3(15875872793) 订购 测试2 数量 16', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('54', '3183', '43', '0', '2', '3200.00', '320.00', '0', '44', '107', '201810261049511620', '0', '133', '2', '16', '1', '1540522212', '代理 钟琪3(15875872793) 订购 测试2 数量 16', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('55', '3183', '43', '0', '2', '10000.00', '1000.00', '0', '45', '110', '201810261101267069', '0', '139', '2', '1000', '2', '1540522908', '代理 钟琪4(15875872794) 订购 测试2 数量 1000', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('56', '3183', '44', '0', '2', '100000.00', '10000.00', '0', '45', '110', '201810261101267069', '0', '139', '2', '1000', '1', '1540522908', '代理 钟琪4(15875872794) 订购 测试2 数量 1000', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('57', '3183', '44', '0', '2', '10000.00', '1000.00', '0', '45', '111', '201810261103341084', '0', '142', '1', '100', '1', '1540523033', '代理 钟琪4(15875872794) 订购 测试1 数量 100', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('58', '3183', '43', '0', '2', '1000.00', '100.00', '0', '45', '111', '201810261103341084', '0', '142', '1', '100', '2', '1540523033', '代理 钟琪4(15875872794) 订购 测试1 数量 100', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('59', '3183', '43', '0', '2', '1000.00', '100.00', '0', '45', '111', '201810261103341084', '0', '141', '2', '100', '2', '1540523033', '代理 钟琪4(15875872794) 订购 测试2 数量 100', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('60', '3183', '44', '0', '2', '10000.00', '1000.00', '0', '45', '111', '201810261103341084', '0', '141', '2', '100', '1', '1540523033', '代理 钟琪4(15875872794) 订购 测试2 数量 100', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('61', '3183', '43', '0', '2', '1000.00', '100.00', '0', '44', '112', '201810261112299385', '0', '146', '1', '10', '1', '1540523788', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('62', '3183', '1', '0', '2', '100.00', '10.00', '0', '44', '112', '201810261112299385', '0', '146', '1', '10', '2', '1540523788', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('63', '3183', '1', '0', '2', '12.36', '1.24', '0', '44', '112', '201810261112299385', '0', '145', '1', '1', '2', '1540523788', '代理 钟琪3(15875872793) 订购 测试1 数量 1.2359550561798', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('64', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '112', '201810261112299385', '0', '145', '1', '2', '1', '1540523788', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('65', '3183', '43', '0', '2', '900.00', '90.00', '0', '44', '113', '201810261118526705', '0', '150', '1', '9', '1', '1540523956', '代理 钟琪3(15875872793) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('66', '3183', '1', '0', '2', '90.00', '9.00', '0', '44', '113', '201810261118526705', '0', '150', '1', '9', '2', '1540523956', '代理 钟琪3(15875872793) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('67', '3183', '1', '0', '2', '30.00', '3.00', '0', '44', '113', '201810261118526705', '0', '149', '1', '3', '2', '1540523956', '代理 钟琪3(15875872793) 订购 测试1 数量 3', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('68', '3183', '43', '0', '2', '300.00', '30.00', '0', '44', '113', '201810261118526705', '0', '149', '1', '3', '1', '1540523956', '代理 钟琪3(15875872793) 订购 测试1 数量 3', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('69', '3183', '43', '0', '2', '1000.00', '100.00', '0', '44', '114', '201810261125035765', '0', '154', '1', '10', '1', '1540524717', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('70', '3183', '1', '0', '2', '100.00', '10.00', '0', '44', '114', '201810261125035765', '0', '154', '1', '10', '2', '1540524717', '代理 钟琪2(15875872792) 的邀请代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('71', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '114', '201810261125035765', '0', '153', '1', '2', '1', '1540524717', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('72', '3183', '1', '0', '2', '20.00', '2.00', '0', '44', '114', '201810261125035765', '0', '153', '1', '2', '2', '1540524717', '代理 钟琪2(15875872792) 的邀请代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('73', '3183', '43', '0', '2', '600.00', '60.00', '0', '44', '114', '201810261125035765', '0', '152', '1', '6', '1', '1540524717', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('74', '3183', '1', '0', '2', '60.00', '6.00', '0', '44', '114', '201810261125035765', '0', '152', '1', '6', '2', '1540524717', '代理 钟琪2(15875872792) 的邀请代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('75', '3183', '43', '0', '2', '1800.00', '180.00', '0', '44', '114', '201810261125035765', '0', '151', '2', '9', '1', '1540524717', '代理 钟琪3(15875872793) 订购 测试2 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('76', '3183', '1', '0', '2', '180.00', '18.00', '0', '44', '114', '201810261125035765', '0', '151', '2', '9', '2', '1540524717', '代理 钟琪2(15875872792) 的邀请代理 钟琪3(15875872793) 订购 测试2 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('77', '3183', '43', '0', '2', '1000.00', '100.00', '0', '44', '115', '201810261135412880', '0', '158', '1', '10', '1', '1540524958', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('78', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '115', '201810261135412880', '0', '157', '1', '2', '1', '1540524958', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('79', '3183', '1', '0', '2', '100.00', '10.00', '0', '44', '115', '201810261135412880', '0', '158', '1', '10', '2', '1540524958', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('80', '3183', '1', '0', '2', '20.00', '2.00', '0', '44', '115', '201810261135412880', '0', '157', '1', '2', '2', '1540524958', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('81', '3183', '43', '0', '2', '1000.00', '100.00', '0', '44', '116', '201810261147182324', '0', '162', '1', '10', '1', '1540525681', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('82', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '116', '201810261147182324', '0', '161', '1', '2', '1', '1540525681', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('83', '3183', '1', '0', '2', '100.00', '10.00', '0', '44', '116', '201810261147182324', '0', '162', '1', '10', '2', '1540525681', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('84', '3183', '1', '0', '2', '20.00', '2.00', '0', '44', '116', '201810261147182324', '0', '161', '1', '2', '2', '1540525681', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('85', '3183', '43', '0', '2', '600.00', '60.00', '0', '44', '118', '201810261154519650', '0', '170', '1', '6', '1', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('86', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '118', '201810261154519650', '0', '169', '1', '2', '1', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('87', '3183', '43', '0', '2', '400.00', '40.00', '0', '44', '118', '201810261154519650', '0', '168', '1', '4', '1', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 4', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('88', '3183', '1', '0', '2', '60.00', '6.00', '0', '44', '118', '201810261154519650', '0', '170', '1', '6', '2', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('89', '3183', '1', '0', '2', '20.00', '2.00', '0', '44', '118', '201810261154519650', '0', '169', '1', '2', '2', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('90', '3183', '1', '0', '2', '40.00', '4.00', '0', '44', '118', '201810261154519650', '0', '168', '1', '4', '2', '1540526109', '代理 钟琪3(15875872793) 订购 测试1 数量 4', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('91', '3183', '44', '0', '2', '900.00', '90.00', '0', '45', '119', '201810261158571492', '0', '174', '1', '9', '1', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('92', '3183', '44', '0', '2', '600.00', '60.00', '0', '45', '119', '201810261158571492', '0', '173', '1', '6', '1', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('93', '3183', '44', '0', '2', '200.00', '20.00', '0', '45', '119', '201810261158571492', '0', '172', '1', '2', '1', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('94', '3183', '44', '0', '2', '1000.00', '100.00', '0', '45', '119', '201810261158571492', '0', '171', '2', '10', '1', '1540526366', '代理 钟琪4(15875872794) 订购 测试2 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('95', '3183', '43', '0', '2', '90.00', '9.00', '0', '45', '119', '201810261158571492', '0', '174', '1', '9', '2', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('96', '3183', '43', '0', '2', '60.00', '6.00', '0', '45', '119', '201810261158571492', '0', '173', '1', '6', '2', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('97', '3183', '43', '0', '2', '20.00', '2.00', '0', '45', '119', '201810261158571492', '0', '172', '1', '2', '2', '1540526366', '代理 钟琪4(15875872794) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('98', '3183', '43', '0', '2', '100.00', '10.00', '0', '45', '119', '201810261158571492', '0', '171', '2', '10', '2', '1540526366', '代理 钟琪4(15875872794) 订购 测试2 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('99', '3183', '44', '0', '2', '600.00', '60.00', '0', '45', '120', '201810261202179495', '0', '178', '1', '6', '1', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('100', '3183', '44', '0', '2', '200.00', '20.00', '0', '45', '120', '201810261202179495', '0', '177', '1', '2', '1', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('101', '3183', '44', '0', '2', '1000.00', '100.00', '0', '45', '120', '201810261202179495', '0', '176', '1', '10', '1', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('102', '3183', '44', '0', '2', '900.00', '90.00', '0', '45', '120', '201810261202179495', '0', '175', '2', '9', '1', '1540526569', '代理 钟琪4(15875872794) 订购 测试2 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('103', '3183', '43', '0', '2', '60.00', '6.00', '0', '45', '120', '201810261202179495', '0', '178', '1', '6', '2', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('104', '3183', '43', '0', '2', '20.00', '2.00', '0', '45', '120', '201810261202179495', '0', '177', '1', '2', '2', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('105', '3183', '43', '0', '2', '100.00', '10.00', '0', '45', '120', '201810261202179495', '0', '176', '1', '10', '2', '1540526569', '代理 钟琪4(15875872794) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('106', '3183', '43', '0', '2', '90.00', '9.00', '0', '45', '120', '201810261202179495', '0', '175', '2', '9', '2', '1540526569', '代理 钟琪4(15875872794) 订购 测试2 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('107', '3183', '45', '0', '2', '30.00', '3.00', '0', '46', '122', '201810261416218868', '0', '186', '1', '1', '1', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('108', '3183', '45', '0', '2', '150.00', '15.00', '0', '46', '122', '201810261416218868', '0', '185', '1', '5', '1', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('109', '3183', '45', '0', '2', '270.00', '27.00', '0', '46', '122', '201810261416218868', '0', '184', '1', '9', '1', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('110', '3183', '45', '0', '2', '600.00', '60.00', '0', '46', '122', '201810261416218868', '0', '183', '2', '10', '1', '1540534598', '代理 钟琪5(15875872795) 订购 测试2 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('111', '3183', '44', '0', '2', '4.00', '0.40', '0', '46', '122', '201810261416218868', '0', '186', '1', '1', '2', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('112', '3183', '44', '0', '2', '20.00', '2.00', '0', '46', '122', '201810261416218868', '0', '185', '1', '5', '2', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('113', '3183', '44', '0', '2', '36.00', '3.60', '0', '46', '122', '201810261416218868', '0', '184', '1', '9', '2', '1540534598', '代理 钟琪5(15875872795) 订购 测试1 数量 9', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('114', '3183', '44', '0', '2', '50.00', '5.00', '0', '46', '122', '201810261416218868', '0', '183', '2', '10', '2', '1540534598', '代理 钟琪5(15875872795) 订购 测试2 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('115', '3183', '45', '0', '2', '300.00', '30.00', '0', '46', '123', '201810261418525470', '0', '190', '1', '10', '1', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('116', '3183', '45', '0', '2', '30.00', '3.00', '0', '46', '123', '201810261418525470', '0', '189', '1', '1', '1', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('117', '3183', '45', '0', '2', '30.00', '3.00', '0', '46', '123', '201810261418525470', '0', '188', '1', '1', '1', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('118', '3183', '45', '0', '2', '60.00', '6.00', '0', '46', '123', '201810261418525470', '0', '187', '2', '1', '1', '1540534780', '代理 钟琪5(15875872795) 订购 测试2 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('119', '3183', '44', '0', '2', '40.00', '4.00', '0', '46', '123', '201810261418525470', '0', '190', '1', '10', '2', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('120', '3183', '44', '0', '2', '4.00', '0.40', '0', '46', '123', '201810261418525470', '0', '189', '1', '1', '2', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('121', '3183', '44', '0', '2', '4.00', '0.40', '0', '46', '123', '201810261418525470', '0', '188', '1', '1', '2', '1540534780', '代理 钟琪5(15875872795) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('122', '3183', '44', '0', '2', '5.00', '0.50', '0', '46', '123', '201810261418525470', '0', '187', '2', '1', '2', '1540534780', '代理 钟琪5(15875872795) 订购 测试2 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('123', '3183', '43', '0', '2', '100.00', '10.00', '0', '44', '124', '201810261423015070', '0', '194', '1', '1', '1', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('124', '3183', '43', '0', '2', '100.00', '10.00', '0', '44', '124', '201810261423015070', '0', '193', '1', '1', '1', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('125', '3183', '43', '0', '2', '100.00', '10.00', '0', '44', '124', '201810261423015070', '0', '192', '1', '1', '1', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('126', '3183', '43', '0', '2', '2800.00', '280.00', '0', '44', '124', '201810261423015070', '0', '191', '2', '14', '1', '1540535000', '代理 钟琪3(15875872793) 订购 测试2 数量 14', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('127', '3183', '1', '0', '2', '10.00', '1.00', '0', '44', '124', '201810261423015070', '0', '194', '1', '1', '2', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('128', '3183', '1', '0', '2', '10.00', '1.00', '0', '44', '124', '201810261423015070', '0', '193', '1', '1', '2', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('129', '3183', '1', '0', '2', '10.00', '1.00', '0', '44', '124', '201810261423015070', '0', '192', '1', '1', '2', '1540535000', '代理 钟琪3(15875872793) 订购 测试1 数量 1', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('130', '3183', '1', '0', '2', '280.00', '28.00', '0', '44', '124', '201810261423015070', '0', '191', '2', '14', '2', '1540535000', '代理 钟琪3(15875872793) 订购 测试2 数量 14', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('131', '3183', '43', '0', '2', '1000.00', '100.00', '0', '44', '125', '201810261427332678', '0', '197', '1', '10', '1', '1540535370', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('132', '3183', '43', '0', '2', '500.00', '50.00', '0', '44', '125', '201810261427332678', '0', '196', '1', '5', '1', '1540535370', '代理 钟琪3(15875872793) 订购 测试1 数量 5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('133', '3183', '43', '0', '2', '1200.00', '120.00', '0', '44', '125', '201810261427332678', '0', '195', '2', '6', '1', '1540535370', '代理 钟琪3(15875872793) 订购 测试2 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('134', '3183', '1', '0', '2', '100.00', '10.00', '0', '44', '125', '201810261427332678', '0', '197', '1', '10', '2', '1540535370', '代理 钟琪3(15875872793) 订购 测试1 数量 10', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('135', '3183', '1', '0', '2', '50.00', '5.00', '0', '44', '125', '201810261427332678', '0', '196', '1', '5', '2', '1540535370', '代理 钟琪3(15875872793) 订购 测试1 数量 5', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('136', '3183', '1', '0', '2', '120.00', '12.00', '0', '44', '125', '201810261427332678', '0', '195', '2', '6', '2', '1540535370', '代理 钟琪3(15875872793) 订购 测试2 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('137', '3183', '43', '0', '2', '600.00', '60.00', '0', '44', '127', '201810261820579761', '0', '202', '1', '6', '1', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('138', '3183', '43', '0', '2', '800.00', '80.00', '0', '44', '127', '201810261820579761', '0', '201', '1', '8', '1', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 8', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('139', '3183', '43', '0', '2', '600.00', '60.00', '0', '44', '127', '201810261820579761', '0', '200', '1', '6', '1', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('140', '3183', '1', '0', '2', '60.00', '6.00', '0', '44', '127', '201810261820579761', '0', '202', '1', '6', '2', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('141', '3183', '1', '0', '2', '80.00', '8.00', '0', '44', '127', '201810261820579761', '0', '201', '1', '8', '2', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 8', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('142', '3183', '1', '0', '2', '60.00', '6.00', '0', '44', '127', '201810261820579761', '0', '200', '1', '6', '2', '1540549275', '代理 钟琪3(15875872793) 订购 测试1 数量 6', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('143', '3183', '43', '0', '2', '300.00', '30.00', '0', '44', '128', '201810261825107310', '0', '206', '1', '3', '1', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 3', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('144', '3183', '43', '0', '2', '700.00', '70.00', '0', '44', '128', '201810261825107310', '0', '205', '1', '7', '1', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 7', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('145', '3183', '43', '0', '2', '200.00', '20.00', '0', '44', '128', '201810261825107310', '0', '204', '1', '2', '1', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('146', '3183', '1', '0', '2', '30.00', '3.00', '0', '44', '128', '201810261825107310', '0', '206', '1', '3', '2', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 3', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('147', '3183', '1', '0', '2', '70.00', '7.00', '0', '44', '128', '201810261825107310', '0', '205', '1', '7', '2', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 7', '0', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('148', '3183', '1', '0', '2', '20.00', '2.00', '0', '44', '128', '201810261825107310', '0', '204', '1', '2', '2', '1540549665', '代理 钟琪3(15875872793) 订购 测试1 数量 2', '0', '0', '0');

-- ----------------------------
-- Table structure for fw_jfdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfdetail`;
CREATE TABLE `fw_jfdetail` (
  `jf_id` int(11) NOT NULL AUTO_INCREMENT,
  `jf_unitcode` varchar(32) DEFAULT NULL,
  `jf_userid` int(11) DEFAULT NULL,
  `jf_username` varchar(32) DEFAULT NULL,
  `jf_type` int(11) DEFAULT NULL,
  `jf_jf` int(11) DEFAULT NULL,
  `jf_addtime` int(11) DEFAULT NULL,
  `jf_ip` varchar(32) DEFAULT NULL,
  `jf_actionuser` int(11) DEFAULT NULL,
  `jf_code` varchar(32) DEFAULT NULL,
  `jf_proid` int(11) DEFAULT NULL,
  `jf_proname` varchar(64) DEFAULT NULL,
  `jf_pronumber` varchar(32) DEFAULT NULL,
  `jf_remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`jf_id`),
  KEY `jf_uintcode` (`jf_unitcode`),
  KEY `jf_code` (`jf_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户积分详细';

-- ----------------------------
-- Records of fw_jfdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfexchange
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfexchange`;
CREATE TABLE `fw_jfexchange` (
  `exch_id` int(11) NOT NULL AUTO_INCREMENT,
  `exch_unitcode` varchar(32) DEFAULT NULL,
  `exch_jf` int(11) DEFAULT NULL,
  `exch_qty` int(11) DEFAULT NULL,
  `exch_userid` int(11) DEFAULT NULL,
  `exch_username` varchar(64) DEFAULT NULL,
  `exch_contact` varchar(32) DEFAULT NULL,
  `exch_tel` varchar(32) DEFAULT NULL,
  `exch_address` varchar(254) DEFAULT NULL,
  `exch_msg` varchar(512) DEFAULT NULL,
  `exch_kuaidi` varchar(32) DEFAULT NULL,
  `exch_kdhao` varchar(32) DEFAULT NULL,
  `exch_time` int(11) DEFAULT NULL,
  `exch_remark` varchar(512) DEFAULT NULL,
  `exch_state` int(4) DEFAULT NULL,
  `exch_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户积分兑换';

-- ----------------------------
-- Records of fw_jfexchange
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfexchdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfexchdetail`;
CREATE TABLE `fw_jfexchdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_exchid` int(11) DEFAULT NULL,
  `detail_unitcode` varchar(32) DEFAULT NULL,
  `detail_giftid` int(11) DEFAULT NULL,
  `detail_giftname` varchar(128) DEFAULT NULL,
  `detail_xnid` int(11) DEFAULT '0' COMMENT '虚拟礼品兑换数据id',
  `detail_xncardid` varchar(64) DEFAULT NULL,
  `detail_xnpwd` varchar(256) DEFAULT NULL,
  `detail_jf` int(11) DEFAULT NULL,
  `detail_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户积分兑换详细';

-- ----------------------------
-- Records of fw_jfexchdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jffeedback
-- ----------------------------
DROP TABLE IF EXISTS `fw_jffeedback`;
CREATE TABLE `fw_jffeedback` (
  `fb_id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_unitcode` varchar(32) DEFAULT NULL,
  `fb_type` int(4) DEFAULT NULL,
  `fb_userid` int(11) DEFAULT NULL,
  `fb_username` varchar(32) DEFAULT NULL,
  `fb_contact` varchar(64) DEFAULT NULL,
  `fb_tel` varchar(64) DEFAULT NULL,
  `fb_qq` varchar(32) DEFAULT NULL,
  `fb_email` varchar(64) DEFAULT NULL,
  `fb_content` text,
  `fb_recontent` text,
  `fb_addtime` int(11) DEFAULT NULL,
  `fb_ip` varchar(32) DEFAULT NULL,
  `fb_state` int(4) DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='反馈留言';

-- ----------------------------
-- Records of fw_jffeedback
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfgift
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfgift`;
CREATE TABLE `fw_jfgift` (
  `gif_id` int(11) NOT NULL AUTO_INCREMENT,
  `gif_unitcode` varchar(32) DEFAULT NULL,
  `gif_type` int(4) DEFAULT NULL COMMENT '虚拟礼品 实物礼品',
  `gif_gifttype` int(11) NOT NULL DEFAULT '0' COMMENT '礼品分类',
  `gif_name` varchar(128) DEFAULT NULL,
  `gif_pic` varchar(64) DEFAULT NULL,
  `gif_jf` int(11) DEFAULT NULL,
  `gif_qty` int(11) DEFAULT NULL,
  `gif_brief` varchar(254) DEFAULT NULL,
  `gif_des` text,
  `gif_addtime` int(11) DEFAULT NULL,
  `gif_active` int(4) DEFAULT NULL,
  PRIMARY KEY (`gif_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品';

-- ----------------------------
-- Records of fw_jfgift
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfgifttype
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfgifttype`;
CREATE TABLE `fw_jfgifttype` (
  `giftype_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftype_unitcode` varchar(32) DEFAULT NULL,
  `giftype_name` varchar(128) DEFAULT NULL,
  `giftype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`giftype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_jfgifttype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfmobasic
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmobasic`;
CREATE TABLE `fw_jfmobasic` (
  `bas_id` int(11) NOT NULL AUTO_INCREMENT,
  `bas_unitcode` varchar(32) DEFAULT NULL,
  `bas_sitename` varchar(128) DEFAULT NULL,
  `bas_company` varchar(254) DEFAULT NULL,
  `bas_address` varchar(254) DEFAULT NULL,
  `bas_hotline` varchar(64) DEFAULT NULL,
  `bas_tel` varchar(64) DEFAULT NULL,
  `bas_fax` varchar(64) DEFAULT NULL,
  `bas_website` varchar(254) DEFAULT NULL,
  `bas_weixin` varchar(254) DEFAULT NULL,
  `bas_wxpic` varchar(64) DEFAULT NULL,
  `bas_weibo` varchar(254) DEFAULT NULL,
  `bas_wbpic` varchar(64) DEFAULT NULL,
  `bas_logopic` varchar(32) DEFAULT NULL COMMENT 'logo',
  `bas_footpic` varchar(32) DEFAULT NULL COMMENT '页面底部图片',
  `bas_profile` text,
  `bas_contact` text,
  `bas_agreement` text,
  `bas_rule` text,
  `bas_help` text,
  `bas_buyer` text,
  `bas_buyer2` text,
  `bas_buyer3` text,
  `bas_ppzc` text COMMENT '品牌政策',
  PRIMARY KEY (`bas_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='积分商城手机端基本资料';

-- ----------------------------
-- Records of fw_jfmobasic
-- ----------------------------
INSERT INTO `fw_jfmobasic` VALUES ('1', '3183', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for fw_jfmonews
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmonews`;
CREATE TABLE `fw_jfmonews` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_unitcode` varchar(32) DEFAULT NULL,
  `news_title` varchar(254) DEFAULT NULL,
  `news_type` int(4) DEFAULT NULL,
  `news_pic` varchar(64) DEFAULT NULL,
  `news_content` text,
  `news_addtime` int(11) DEFAULT NULL,
  `news_isgg` int(11) DEFAULT '0' COMMENT '是否公告',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分商城手机端企业动态';

-- ----------------------------
-- Records of fw_jfmonews
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfmopics
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmopics`;
CREATE TABLE `fw_jfmopics` (
  `pics_id` int(11) NOT NULL AUTO_INCREMENT,
  `pics_unitcode` varchar(32) DEFAULT NULL,
  `pics_title` varchar(64) DEFAULT NULL,
  `pics_group` int(11) DEFAULT NULL,
  `pics_name` varchar(64) DEFAULT NULL,
  `pics_name_s` varchar(64) DEFAULT NULL,
  `pics_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pics_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片管理';

-- ----------------------------
-- Records of fw_jfmopics
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfproduct
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfproduct`;
CREATE TABLE `fw_jfproduct` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unitcode` varchar(32) DEFAULT NULL,
  `pro_typeid` int(11) DEFAULT NULL,
  `pro_name` varchar(254) DEFAULT NULL,
  `pro_number` varchar(32) DEFAULT NULL,
  `pro_pic` varchar(64) DEFAULT NULL,
  `pro_price` decimal(8,2) DEFAULT NULL,
  `pro_desc` text,
  `pro_link` varchar(512) DEFAULT NULL,
  `pro_active` int(4) DEFAULT NULL,
  `pro_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品展示仅用于微站，无防窜';

-- ----------------------------
-- Records of fw_jfproduct
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfprotype
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfprotype`;
CREATE TABLE `fw_jfprotype` (
  `protype_id` int(11) NOT NULL AUTO_INCREMENT,
  `protype_unitcode` varchar(32) DEFAULT NULL,
  `protype_name` varchar(128) DEFAULT NULL,
  `protype_iswho` int(11) DEFAULT '0',
  `protype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`protype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品分类';

-- ----------------------------
-- Records of fw_jfprotype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfuser
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfuser`;
CREATE TABLE `fw_jfuser` (
  `jfuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `jfuser_unitcode` varchar(32) DEFAULT NULL,
  `jfuser_openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `jfuser_username` varchar(64) DEFAULT NULL,
  `jfuser_pwd` varchar(64) DEFAULT NULL,
  `jfuser_truename` varchar(32) DEFAULT NULL,
  `jfuser_tel` varchar(32) DEFAULT NULL,
  `jfuser_email` varchar(64) DEFAULT NULL,
  `jfuser_qq` varchar(32) DEFAULT NULL,
  `jfuser_sheng` int(11) DEFAULT NULL,
  `jfuser_shi` int(11) DEFAULT NULL,
  `jfuser_qu` int(11) DEFAULT NULL,
  `jfuser_diqustr` varchar(64) DEFAULT NULL,
  `jfuser_address` varchar(64) DEFAULT NULL,
  `jfuser_jf` int(11) DEFAULT '0',
  `jfuser_logintime` int(11) DEFAULT NULL,
  `jfuser_addtime` int(11) DEFAULT NULL,
  `jfuser_active` int(4) DEFAULT NULL,
  `jfuser_remark` varchar(512) DEFAULT NULL,
  `jfuser_weixin` varchar(32) DEFAULT NULL,
  `jfuser_wxnickname` varchar(128) DEFAULT NULL COMMENT '微信昵称',
  `jfuser_wxsex` int(4) DEFAULT NULL,
  `jfuser_wxprovince` varchar(32) DEFAULT NULL,
  `jfuser_wxcity` varchar(32) DEFAULT NULL,
  `jfuser_wxcountry` varchar(32) DEFAULT NULL,
  `jfuser_wxheadimg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`jfuser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分用户';

-- ----------------------------
-- Records of fw_jfuser
-- ----------------------------

-- ----------------------------
-- Table structure for fw_log
-- ----------------------------
DROP TABLE IF EXISTS `fw_log`;
CREATE TABLE `fw_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_qyid` int(11) DEFAULT NULL,
  `log_user` varchar(32) DEFAULT NULL,
  `log_qycode` varchar(32) DEFAULT NULL,
  `log_action` varchar(32) DEFAULT NULL,
  `log_addtime` int(11) DEFAULT NULL,
  `log_ip` varchar(32) DEFAULT NULL,
  `log_link` varchar(128) NOT NULL,
  `log_remark` text,
  `log_type` int(11) DEFAULT '0' COMMENT '日志分类0-系统 1-企业 2-经销商',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_log
-- ----------------------------
INSERT INTO `fw_log` VALUES ('1', '1146', 'famaotang', '3183', '企业登录', '1524887505', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2', '1146', 'famaotang', '3183', '添加经销商级别', '1524888608', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0,\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('3', '1146', 'famaotang', '3183', '添加经销商级别', '1524888623', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u91d1\\u724c\\u4ee3\\u7406\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0,\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('4', '1146', 'famaotang', '3183', '添加经销商级别', '1524888675', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u4f1a\\u5458\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0,\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('5', '1146', 'famaotang', '3183', '添加产品类型', '1524888742', '0.0.0.0', '/famaotang/Mp/Product/typeedit_save', '{\"protype_unitcode\":\"3183\",\"protype_name\":\"\\u62a4\\u53d1\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('6', '1146', 'famaotang', '3183', '企业登录', '1524888883', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('7', '1146', 'famaotang', '3183', '添加产品', '1524889016', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_name\":\"\\u5507\\u818f\",\"pro_number\":\"23443\",\"pro_order\":435,\"pro_unitcode\":\"3183\",\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1524889016,\"pro_active\":1,\"pro_price\":\"345\",\"pro_stock\":0,\"pro_units\":\"345\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3183\\/1524889016_1307.jpg\",\"pro_pic2\":\"3183\\/15248890162_4568.jpg\",\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"0\",\"5\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('8', '1146', 'famaotang', '3183', '添加产品', '1524889608', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_name\":\"sdfsdfdsfdsfd\",\"pro_number\":\"dfsfdsfd\",\"pro_order\":34,\"pro_unitcode\":\"3183\",\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1524889608,\"pro_active\":1,\"pro_price\":\"34\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3183\\/1524889608_4971.jpg\",\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"0\",\"5\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('9', '1146', 'famaotang', '3183', '企业登录', '1527823525', '127.0.0.1', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('10', '1146', 'famaotang', '3183', '企业登录', '1529048036', '127.0.0.1', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('11', '1146', 'famaotang', '3183', '企业登录', '1530586039', '127.0.0.1', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('12', '1146', 'famaotang', '3183', '企业登录', '1533968471', '127.0.0.1', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('13', '1146', 'famaotang', '3183', '修改经销商级别', '1533971145', '127.0.0.1', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":1,\"dlt_fanli1\":\"6468\",\"dlt_fanli2\":\"1812\",\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"29376\",\"dlt_minnum\":\"14688\",\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('14', '1146', 'famaotang', '3183', '修改经销商级别', '1533971194', '127.0.0.1', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":2,\"dlt_fanli1\":\"606\",\"dlt_fanli2\":\"202\",\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"2448\",\"dlt_minnum\":\"2448\",\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('15', '1146', 'famaotang', '3183', '修改经销商级别', '1533971397', '127.0.0.1', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u91d1\\u724c\\u4f1a\\u5458\",\"dlt_level\":3,\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":0}', '1');
INSERT INTO `fw_log` VALUES ('16', '1146', 'famaotang', '3183', '企业登录', '1537963996', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('17', '1146', 'famaotang', '3183', '修改经销商级别', '1537966986', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"1\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"6468.00\",\"dlt_fanli2\":\"1812.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":1,\"tfl_tjdltype\":\"1\",\"tfl_fanli1\":\"100\",\"tfl_fanli2\":\"2\"},{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"606.00\",\"dlt_fanli2\":\"202.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":1,\"tfl_tjdltype\":\"2\",\"tfl_fanli1\":\"52\",\"tfl_fanli2\":\"20\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u91d1\\u724c\\u4f1a\\u5458\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":1,\"tfl_tjdltype\":\"3\",\"tfl_fanli1\":\"41\",\"tfl_fanli2\":\"20\"}]}', '1');
INSERT INTO `fw_log` VALUES ('18', '1146', 'famaotang', '3183', '产品返利设置', '1537969361', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"10\",\"pfl_fanli2\":\"5\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"10\",\"pfl_fanli2\":\"2\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"0.00\",\"pfl_fanli2\":\"0.00\"}]', '1');
INSERT INTO `fw_log` VALUES ('19', '1146', 'famaotang', '3183', '产品返利设置', '1537969493', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"100\",\"pfl_fanli2\":\"20\"}]', '1');
INSERT INTO `fw_log` VALUES ('20', '1146', 'famaotang', '3183', '企业登录', '1538017738', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('21', '1146', 'famaotang', '3183', '企业登录', '1538115701', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('22', '1146', 'famaotang', '3183', '企业登录', '1539586809', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('23', '1', 'famaotang', '3183', '经销商账号登录', '1539590038', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('24', '2', '15875872792', '3183', '代理商注册', '1539595042', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872792\",\"dl_pwd\":\"1bde2478115e4e64b4f71e030dc33710\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a2\",\"dl_contact\":\"\\u949f\\u742a2\",\"dl_tel\":\"15875872792\",\"dl_idcard\":\"440804199606160572\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539595042,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872792\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('25', '3', '15875872792', '3183', '代理商注册', '1539597034', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872792\",\"dl_pwd\":\"1bde2478115e4e64b4f71e030dc33710\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a2\",\"dl_contact\":\"\\u949f\\u742a2\",\"dl_tel\":\"15875872792\",\"dl_idcard\":\"440804199606160572\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539597034,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440104\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872792\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('26', '1146', 'famaotang', '3183', '企业登录', '1539651828', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('27', '3', '15875872792', '3183', '经销商账号登录', '1539652025', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('28', '1146', 'famaotang', '3183', '企业登录', '1539670160', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('29', '1', 'famaotang', '3183', '经销商账号登录', '1539672727', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('30', '4', '15875872792', '3183', '代理商注册', '1539672802', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872792\",\"dl_pwd\":\"1bde2478115e4e64b4f71e030dc33710\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a2\",\"dl_contact\":\"\\u949f\\u742a2\",\"dl_tel\":\"15875872792\",\"dl_idcard\":\"440804199606160572\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539672802,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1101\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872792\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('31', '4', '15875872792', '3183', '经销商账号登录', '1539675700', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('32', '5', '15875872793', '3183', '代理商注册', '1539681329', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872793\",\"dl_pwd\":\"ad2a523b032e8cb63f6a217150d94385\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a3\",\"dl_contact\":\"\\u949f\\u742a3\",\"dl_tel\":\"15875872793\",\"dl_idcard\":\"440804199606160573\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539681329,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1101\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872793\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('33', '6', '15875872794', '3183', '代理商注册', '1539681496', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872794\",\"dl_pwd\":\"8fa2bfbeed9dc739761683298301a3b4\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a4\",\"dl_contact\":\"\\u949f\\u742a4\",\"dl_tel\":\"15875872794\",\"dl_idcard\":\"440804199606160574\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539681496,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1101\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872794\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('34', '7', '15875872795', '3183', '代理商注册', '1539683628', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872795\",\"dl_pwd\":\"6299c582af7ba53fda8c1b769c6cb129\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a5\",\"dl_contact\":\"\\u949f\\u742a5\",\"dl_tel\":\"15872872795\",\"dl_idcard\":\"440804199606160575\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539683628,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1101\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872795\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('35', '8', '15875872100', '3183', '代理商注册', '1539683821', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872100\",\"dl_pwd\":\"73e78bfeded7bafdc6910e8639d616c7\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a100\",\"dl_contact\":\"\\u949f\\u742a100\",\"dl_tel\":\"15875872100\",\"dl_idcard\":\"440804199606160100\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539683821,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1101\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u4e1c\\u57ce\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872100\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('36', '1', 'famaotang', '3183', '经销商账号登录', '1539683997', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('37', '1146', 'famaotang', '3183', '修改产品', '1539684035', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"sdfsdfdsfdsfd\",\"pro_number\":\"dfsfdsfd\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3183\\/1539684035_5376.jpg\",\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('38', '1146', 'famaotang', '3183', '修改产品', '1539684049', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":1,\"pro_name\":\"\\u5507\\u818f\",\"pro_number\":\"23443\",\"pro_order\":435,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"345.00\",\"pro_stock\":0,\"pro_units\":\"345\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3183\\/1539684049_9569.jpg\",\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u9ec4\\u8272\",\"2\":\"\\u767d\\u8272\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"1\",\"7\":\"2\",\"8\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('39', '1146', 'famaotang', '3183', '修改产品价格体系', '1539684093', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"1\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"10\",\"pro_id\":\"2\"},{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"20\",\"pro_id\":\"2\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"606.00\",\"dlt_fanli2\":\"202.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"30\",\"pro_id\":\"2\"},{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"40\",\"pro_id\":\"2\"},{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"50\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('40', '1146', 'famaotang', '3183', '修改产品', '1539684123', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"\\u6d4b\\u8bd51\",\"pro_number\":\"dfsfdsfd\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('41', '1146', 'famaotang', '3183', '修改产品', '1539684134', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":1,\"pro_name\":\"\\u6d4b\\u8bd52\",\"pro_number\":\"23443\",\"pro_order\":435,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"345.00\",\"pro_stock\":0,\"pro_units\":\"345\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u9ec4\\u8272\",\"2\":\"\\u767d\\u8272\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"1\",\"7\":\"2\",\"8\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('42', '1146', 'famaotang', '3183', '修改产品', '1539684154', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"\\u6d4b\\u8bd51\",\"pro_number\":\"1\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('43', '1146', 'famaotang', '3183', '修改产品', '1539684161', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":1,\"pro_name\":\"\\u6d4b\\u8bd52\",\"pro_number\":\"2\",\"pro_order\":435,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"345.00\",\"pro_stock\":0,\"pro_units\":\"345\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u9ec4\\u8272\",\"2\":\"\\u767d\\u8272\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"1\",\"7\":\"2\",\"8\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('44', '1146', 'famaotang', '3183', '修改产品价格体系', '1539684183', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"1\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100\",\"pro_id\":\"1\"},{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200\",\"pro_id\":\"1\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"606.00\",\"dlt_fanli2\":\"202.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300\",\"pro_id\":\"1\"},{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400\",\"pro_id\":\"1\"},{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500\",\"pro_id\":\"1\"}]', '1');
INSERT INTO `fw_log` VALUES ('45', '4', '15875872792', '3183', '经销商账号登录', '1539684543', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('46', '8', '15875872100', '3183', '经销商账号登录', '1539684636', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('47', '5', '15875872793', '3183', '经销商账号登录', '1539684756', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('48', '6', '15875872794', '3183', '经销商账号登录', '1539684832', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('49', '7', '15875872795', '3183', '经销商账号登录', '1539684880', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('50', '1146', 'famaotang', '3183', '企业登录', '1539690513', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('51', '1146', 'famaotang', '3183', '企业登录', '1539739234', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('52', '9', '15875872796', '3183', '代理商注册', '1539740924', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872796\",\"dl_pwd\":\"531440891208d2c680f05d04aa42a247\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a6\",\"dl_contact\":\"\\u949f\\u742a6\",\"dl_tel\":\"15875872796\",\"dl_idcard\":\"440804199606160576\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539740924,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u841d\\u5c97\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440116\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u841d\\u5c97\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872796\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('53', '9', '15875872101', '3183', '经销商账号登录', '1539760237', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('54', '1146', 'famaotang', '3183', '删除订单', '1539760536', '0.0.0.0', '/famaotang/Mp/Orders/deleteorder/od_id/7', '{\"od_id\":\"7\",\"od_unitcode\":\"3183\",\"od_orderid\":\"201810171510599652\",\"od_total\":\"300000.00\",\"od_addtime\":\"1539760259\",\"od_oddlid\":\"9\",\"od_rcdlid\":\"0\",\"od_belongship\":\"0\",\"od_paypic\":\"\",\"od_contact\":\"\\u949f\\u742a6\",\"od_addressid\":\"9\",\"od_sheng\":\"44\",\"od_shi\":\"4401\",\"od_qu\":\"440116\",\"od_jie\":\"0\",\"od_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u841d\\u5c97\\u533a\",\"od_tel\":\"15875872796\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":\" \\u9009\\u62e9\\u5feb\\u9012\",\"od_dealremark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_virtualstock\":\"0\",\"od_fugou\":\"0\",\"od_expressfee\":\"0.00\",\"od_untotall\":\"0.00\",\"od_dltype\":\"3\",\"od_fhdlid\":null}', '1');
INSERT INTO `fw_log` VALUES ('55', '10', '15875872120', '3183', '代理商注册', '1539760632', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872120\",\"dl_pwd\":\"40568f31812fc7424fbc204e321637db\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a120\",\"dl_contact\":\"\\u949f\\u742a120\",\"dl_tel\":\"15875872120\",\"dl_idcard\":\"440804199606160120\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539760632,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u6d77\\u73e0\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440105\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u6d77\\u73e0\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872120\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('56', '10', '15875872120', '3183', '经销商账号登录', '1539760799', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('57', '11', '15875872799', '3183', '代理商注册', '1539762884', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872799\",\"dl_pwd\":\"2523aa43222f38f037ea7a2ace4c3d75\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a9\",\"dl_contact\":\"\\u949f\\u742a9\",\"dl_tel\":\"15875872799\",\"dl_idcard\":\"440804199606160579\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539762884,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872799\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('58', '11', '15875872799', '3183', '经销商账号登录', '1539762929', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('59', '12', '15875872710', '3183', '代理商注册', '1539763552', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872710\",\"dl_pwd\":\"8a0169f893d8c1f53ad7bde696494a28\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a10\",\"dl_contact\":\"\\u949f\\u742a10\",\"dl_tel\":\"15875872710\",\"dl_idcard\":\"440804199606160580\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539763552,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u756a\\u79ba\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440113\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u756a\\u79ba\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872710\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('60', '12', '15875872710', '3183', '经销商账号登录', '1539763661', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('61', '13', '15875872711', '3183', '代理商注册', '1539764272', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872711\",\"dl_pwd\":\"470d5be97f78fb1799f1edd175d8c8e1\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a11\",\"dl_contact\":\"\\u949f\\u742a11\",\"dl_tel\":\"15875872711\",\"dl_idcard\":\"440804199606160511\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539764272,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872711\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('62', '13', '15875872711', '3183', '经销商账号登录', '1539764301', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('63', '14', '15875872712', '3183', '代理商注册', '1539764383', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872712\",\"dl_pwd\":\"fa3a9f8aa0f46ef21f5e4bb51925e4ac\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a12\",\"dl_contact\":\"\\u949f\\u742a12\",\"dl_tel\":\"15875872712\",\"dl_idcard\":\"440804199606160512\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539764383,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440104\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872712\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('64', '14', '15875872712', '3183', '经销商账号登录', '1539764410', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('65', '15', '15875872713', '3183', '代理商注册', '1539764544', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872713\",\"dl_pwd\":\"f81f98fdc503ae38685e929111f6b564\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a13\",\"dl_contact\":\"\\u949f\\u742a13\",\"dl_tel\":\"15875872713\",\"dl_idcard\":\"440804199606160513\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539764544,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872713\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('66', '15', '15875872713', '3183', '经销商账号登录', '1539764573', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('67', '16', '15875872714', '3183', '代理商注册', '1539764744', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872714\",\"dl_pwd\":\"2254af9d862c8450c2071cfdb01cc5e5\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a14\",\"dl_contact\":\"\\u949f\\u742a14\",\"dl_tel\":\"15875872714\",\"dl_idcard\":\"440804199606160514\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539764744,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u767d\\u4e91\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440111\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u767d\\u4e91\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872714\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('68', '16', '15875872714', '3183', '经销商账号登录', '1539764778', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('69', '17', '15875872715', '3183', '代理商注册', '1539764878', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872715\",\"dl_pwd\":\"2a24d103d753b79472ce107ba9d829fb\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a\",\"dl_contact\":\"\\u949f\\u742a\",\"dl_tel\":\"15875872715\",\"dl_idcard\":\"440804199606160515\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539764878,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u767d\\u4e91\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440111\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u767d\\u4e91\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872715\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('70', '17', '15875872715', '3183', '经销商账号登录', '1539764913', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('71', '18', '15875872716', '3183', '代理商注册', '1539766315', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872716\",\"dl_pwd\":\"c18f049e8a08cd7e2d78462546a040d2\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a16\",\"dl_contact\":\"\\u949f\\u742a16\",\"dl_tel\":\"15875872716\",\"dl_idcard\":\"440804199606160516\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539766315,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872716\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('72', '18', '15875872716', '3183', '经销商账号登录', '1539766388', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('73', '1', 'famaotang', '3183', '经销商账号登录', '1539767905', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('74', '1146', 'famaotang', '3183', '企业登录', '1539825252', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('75', '1146', 'famaotang', '3183', '修改经销商级别', '1539825504', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"1\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0\",\"tfl_fanli2\":\"0\"},{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0\",\"tfl_fanli2\":\"0\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"606.00\",\"dlt_fanli2\":\"202.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0\",\"tfl_fanli2\":\"0\"},{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":3,\"tfl_tjdltype\":\"4\",\"tfl_fanli1\":\"0\",\"tfl_fanli2\":\"0\"},{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":3,\"tfl_tjdltype\":\"5\",\"tfl_fanli1\":\"0\",\"tfl_fanli2\":\"0\"}]}', '1');
INSERT INTO `fw_log` VALUES ('76', '1', 'famaotang', '3183', '经销商账号登录', '1539825915', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('77', '6', '15875872794', '3183', '经销商账号登录', '1539829740', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('78', '7', '15875872795', '3183', '经销商账号登录', '1539829908', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('79', '5', '15875872793', '3183', '经销商账号登录', '1539830994', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('80', '7', '15875872795', '3183', '经销商账号登录', '1539831105', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('81', '1', 'famaotang', '3183', '经销商账号登录', '1539831815', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('82', '6', '15875872794', '3183', '经销商账号登录', '1539831870', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('83', '4', '15875872792', '3183', '经销商账号登录', '1539831956', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('84', '11', '15875872799', '3183', '经销商账号登录', '1539832050', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('85', '1', 'famaotang', '3183', '经销商账号登录', '1539832081', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('86', '19', '15875872717', '3183', '代理商注册', '1539832664', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872717\",\"dl_pwd\":\"faa6efc72ee03d3663a24d1a665ae57d\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a17\",\"dl_contact\":\"\\u949f\\u742a17\",\"dl_tel\":\"15875872717\",\"dl_idcard\":\"440804199606160517\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539832664,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u82b1\\u90fd\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440114\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u82b1\\u90fd\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872717\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('87', '20', '15875872718', '3183', '代理商注册', '1539832807', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872718\",\"dl_pwd\":\"538bc20b38439a2dfbf9e051cd2e7552\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a18\",\"dl_contact\":\"\\u949f\\u742a18\",\"dl_tel\":\"15875872718\",\"dl_idcard\":\"440804199606160518\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539832807,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u82b1\\u90fd\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440114\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u82b1\\u90fd\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872718\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('88', '20', '15875872718', '3183', '经销商账号登录', '1539832847', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('89', '19', '15875872717', '3183', '经销商账号登录', '1539833090', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('90', '19', '15875872717', '3183', '经销商账号登录', '1539841558', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('91', '1', 'famaotang', '3183', '经销商账号登录', '1539843782', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('92', '1', 'famaotang', '3183', '经销商账号登录', '1539846793', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('93', '18', '15875872716', '3183', '经销商账号登录', '1539853445', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('94', '1', 'famaotang', '3183', '经销商账号登录', '1539853654', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('95', '1', 'famaotang', '3183', '经销商账号登录', '1539855599', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('96', '1146', 'famaotang', '3183', '企业登录', '1539861698', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('97', '1146', 'famaotang', '3183', '企业登录', '1539913674', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('98', '1146', 'famaotang', '3183', '产品返利设置', '1539914417', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"10000\",\"pfl_fanli2\":\"1000\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"9999\",\"pfl_fanli2\":\"999\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"9998\",\"pfl_fanli2\":\"998\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"4\",\"pfl_fanli1\":\"9997\",\"pfl_fanli2\":\"997\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"1\",\"pfl_tjdltype\":\"5\",\"pfl_fanli1\":\"9996\",\"pfl_fanli2\":\"996\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"8000\",\"pfl_fanli2\":\"800\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"7999\",\"pfl_fanli2\":\"799\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"7998\",\"pfl_fanli2\":\"798\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"4\",\"pfl_fanli1\":\"7997\",\"pfl_fanli2\":\"797\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"2\",\"pfl_tjdltype\":\"5\",\"pfl_fanli1\":\"7996\",\"pfl_fanli2\":\"796\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"6000\",\"pfl_fanli2\":\"600\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"5999\",\"pfl_fanli2\":\"599\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"5998\",\"pfl_fanli2\":\"598\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"4\",\"pfl_fanli1\":\"5997\",\"pfl_fanli2\":\"597\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"3\",\"pfl_tjdltype\":\"5\",\"pfl_fanli1\":\"5996\",\"pfl_fanli2\":\"596\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"4\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"4000\",\"pfl_fanli2\":\"400\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"4\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"3999\",\"pfl_fanli2\":\"399\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"4\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"3998\",\"pfl_fanli2\":\"398\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"4\",\"pfl_tjdltype\":\"4\",\"pfl_fanli1\":\"3997\",\"pfl_fanli2\":\"397\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"4\",\"pfl_tjdltype\":\"5\",\"pfl_fanli1\":\"3996\",\"pfl_fanli2\":\"396\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"5\",\"pfl_tjdltype\":\"1\",\"pfl_fanli1\":\"2000\",\"pfl_fanli2\":\"200\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"5\",\"pfl_tjdltype\":\"2\",\"pfl_fanli1\":\"1999\",\"pfl_fanli2\":\"199\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"5\",\"pfl_tjdltype\":\"3\",\"pfl_fanli1\":\"1998\",\"pfl_fanli2\":\"198\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"5\",\"pfl_tjdltype\":\"4\",\"pfl_fanli1\":\"1997\",\"pfl_fanli2\":\"197\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"5\",\"pfl_tjdltype\":\"5\",\"pfl_fanli1\":\"1996\",\"pfl_fanli2\":\"196\"}]', '1');
INSERT INTO `fw_log` VALUES ('99', '1146', 'famaotang', '3183', '修改产品', '1539914513', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"\\u6d4b\\u8bd52\",\"pro_number\":\"2\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('100', '1146', 'famaotang', '3183', '修改产品', '1539914525', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":1,\"pro_name\":\"\\u6d4b\\u8bd51\",\"pro_number\":\"1\",\"pro_order\":435,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"345.00\",\"pro_stock\":0,\"pro_units\":\"345\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u9ec4\\u8272\",\"2\":\"\\u767d\\u8272\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"1\",\"7\":\"2\",\"8\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('101', '21', '15875872200', '3183', '代理商注册', '1539917062', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872200\",\"dl_pwd\":\"af33a430814cdcd938616fc6550982ef\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a200\",\"dl_contact\":\"\\u949f\\u742a200\",\"dl_tel\":\"15875872200\",\"dl_idcard\":\"440804199606160200\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539917061,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\\u5b98\\u65b9\\u7684\\u98ce\\u683c\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872200\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('102', '21', '15875872200', '3183', '经销商账号登录', '1539917102', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('103', '22', '15875872201', '3183', '代理商注册', '1539917225', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872201\",\"dl_pwd\":\"9e1345f32adaa827c91a205f72f309f9\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a201\",\"dl_contact\":\"\\u949f\\u742a201\",\"dl_tel\":\"15875872201\",\"dl_idcard\":\"440804199606160201\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539917225,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":21,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872201\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('104', '22', '15875872201', '3183', '经销商账号登录', '1539917269', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('105', '1', 'famaotang', '3183', '经销商账号登录', '1539917438', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('106', '22', '15875872201', '3183', '经销商账号登录', '1539920696', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('107', '1', 'famaotang', '3183', '经销商账号登录', '1539927582', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('108', '23', '15875872300', '3183', '代理商注册', '1539928573', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872300\",\"dl_pwd\":\"cdd86f922f23bafa7702089cf23c7258\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a300\",\"dl_contact\":\"\\u949f\\u742a300\",\"dl_tel\":\"15875872300\",\"dl_idcard\":\"440804199606160300\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539928573,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872300\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('109', '23', '15875872300', '3183', '经销商账号登录', '1539928629', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('110', '7', '15875872795', '3183', '经销商账号登录', '1539928692', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('111', '1', 'famaotang', '3183', '经销商账号登录', '1539929383', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('112', '7', '15875872795', '3183', '经销商账号登录', '1539930817', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('113', '1', 'famaotang', '3183', '经销商账号登录', '1539930862', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('114', '1', 'famaotang', '3183', '经销商账号登录', '1539931591', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('115', '24', '15875872202', '3183', '代理商注册', '1539934167', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872202\",\"dl_pwd\":\"aafb1f86998f1a60c0880f05e220e7d5\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a202\",\"dl_contact\":\"\\u949f\\u742a202\",\"dl_tel\":\"15875872202\",\"dl_idcard\":\"440804199606160202\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539934167,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872202\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('116', '24', '15875872202', '3183', '经销商账号登录', '1539934194', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('117', '1', 'famaotang', '3183', '经销商账号登录', '1539934246', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('118', '25', '15875872203', '3183', '经销商账号登录', '1539934626', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('119', '1', 'famaotang', '3183', '经销商账号登录', '1539934721', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('120', '1', 'famaotang', '3183', '经销商账号登录', '1539934972', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('121', '13', '15875872711', '3183', '经销商账号登录', '1539935265', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('122', '1', 'famaotang', '3183', '经销商账号登录', '1539935321', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('123', '6', '15875872794', '3183', '经销商账号登录', '1539936245', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('124', '1', 'famaotang', '3183', '经销商账号登录', '1539936334', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('125', '4', '15875872792', '3183', '经销商账号登录', '1539936747', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('126', '22', '15875872201', '3183', '经销商账号登录', '1539936829', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('127', '5', '15875872793', '3183', '经销商账号登录', '1539936964', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('128', '6', '15875872794', '3183', '经销商账号登录', '1539938707', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('129', '13', '15875872711', '3183', '经销商账号登录', '1539938810', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('130', '7', '15875872795', '3183', '经销商账号登录', '1539939022', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('131', '11', '15875872799', '3183', '经销商账号登录', '1539939094', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('132', '26', '15875872720', '3183', '代理商注册', '1539939216', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872720\",\"dl_pwd\":\"3de4f6c8cb025649b9abc148743ff61a\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a20\",\"dl_contact\":\"\\u949f\\u742a20\",\"dl_tel\":\"15875872720\",\"dl_idcard\":\"440804199606160520\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539939216,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":4,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872720\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('133', '26', '15875872720', '3183', '经销商账号登录', '1539939239', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('134', '27', '15875872721', '3183', '代理商注册', '1539939486', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872721\",\"dl_pwd\":\"1bfa105f719e29cb6e2a7cc8ad52d8d0\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a21\",\"dl_contact\":\"\\u949f\\u742a21\",\"dl_tel\":\"15875872721\",\"dl_idcard\":\"440804199606160521\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539939486,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872721\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('135', '27', '15875872721', '3183', '经销商账号登录', '1539939515', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('136', '7', '15875872795', '3183', '经销商账号登录', '1539939627', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('137', '8', '15875872100', '3183', '经销商账号登录', '1539939873', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('138', '28', '15875872101', '3183', '代理商注册', '1539939992', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872101\",\"dl_pwd\":\"3c65542de12d8d967ca3b6fe78a768c9\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a101\",\"dl_contact\":\"\\u949f\\u742a101\",\"dl_tel\":\"15875872101\",\"dl_idcard\":\"440804199606160101\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539939992,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u4ece\\u5316\\u5e02\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440184\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u4ece\\u5316\\u5e02\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872101\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('139', '28', '15875872101', '3183', '经销商账号登录', '1539940028', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('140', '28', '15875872101', '3183', '经销商账号登录', '1539940288', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('141', '1', 'famaotang', '3183', '经销商账号登录', '1539940333', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('142', '29', '15875872102', '3183', '代理商注册', '1539940630', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872102\",\"dl_pwd\":\"6877fa35f90b3cf62e23d466f493262e\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a102\",\"dl_contact\":\"\\u949f\\u742a102\",\"dl_tel\":\"15875872102\",\"dl_idcard\":\"440804199606160102\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539940630,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u4ece\\u5316\\u5e02\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440184\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u4ece\\u5316\\u5e02\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872102\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('143', '29', '15875872102', '3183', '经销商账号登录', '1539940665', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('144', '28', '15875872101', '3183', '经销商账号登录', '1539940718', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('145', '1', 'famaotang', '3183', '经销商账号登录', '1539940767', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('146', '30', '15875872103', '3183', '代理商注册', '1539940937', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872103\",\"dl_pwd\":\"aab6a6233d3f7dca8f1d4b6061d1a47c\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a103\",\"dl_contact\":\"\\u949f\\u742a103\",\"dl_tel\":\"15875872103\",\"dl_idcard\":\"440804199606160103\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539940937,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u756a\\u79ba\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440113\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u756a\\u79ba\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872103\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('147', '31', '15875872104', '3183', '代理商注册', '1539941062', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872104\",\"dl_pwd\":\"9729e231c21dd2ec6baa2e94b5e48122\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a104\",\"dl_contact\":\"\\u949f\\u742a104\",\"dl_tel\":\"15875872104\",\"dl_idcard\":\"440804199606160104\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539941062,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u9ec4\\u57d4\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440112\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u9ec4\\u57d4\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872104\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('148', '30', '15875872103', '3183', '经销商账号登录', '1539941090', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('149', '30', '15875872103', '3183', '经销商账号登录', '1539941149', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('150', '31', '15875872104', '3183', '经销商账号登录', '1539941213', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('151', '30', '15875872103', '3183', '经销商账号登录', '1539941264', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('152', '30', '15875872103', '3183', '经销商账号登录', '1539941742', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('153', '28', '15875872101', '3183', '经销商账号登录', '1539941784', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('154', '32', '15875872500', '3183', '代理商注册', '1539942243', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872500\",\"dl_pwd\":\"bdd6a59ad26d0cc7f48c6ae2f2980334\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a500\",\"dl_contact\":\"\\u949f\\u742a500\",\"dl_tel\":\"15875872500\",\"dl_idcard\":\"440804199606160500\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539942243,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872500\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('155', '32', '15875872500', '3183', '经销商账号登录', '1539942283', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('156', '33', '15875872501', '3183', '代理商注册', '1539942378', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872501\",\"dl_pwd\":\"136ef300758bfe420d7524fd9c1da965\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a501\",\"dl_contact\":\"\\u949f\\u742a501\",\"dl_tel\":\"15875872501\",\"dl_idcard\":\"440804199606160501\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539942378,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":1,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":32,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872501\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('157', '7', '15875872795', '3183', '经销商账号登录', '1539942984', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('158', '34', '15875872504', '3183', '代理商注册', '1539943081', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872504\",\"dl_pwd\":\"303c3088cb1484f5a7078acb26ada022\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a504\",\"dl_contact\":\"\\u949f\\u742a504\",\"dl_tel\":\"15875872504\",\"dl_idcard\":\"440804199606160504\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539943081,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872504\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('159', '34', '15875872504', '3183', '经销商账号登录', '1539943106', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('160', '1', 'famaotang', '3183', '经销商账号登录', '1539943511', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('161', '7', '15875872795', '3183', '经销商账号登录', '1539944010', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('162', '35', '15875872505', '3183', '代理商注册', '1539944091', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872505\",\"dl_pwd\":\"712470139e45e7764770db4b85071b76\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a505\",\"dl_contact\":\"\\u949f\\u742a505\",\"dl_tel\":\"15875872505\",\"dl_idcard\":\"440804199606160505\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539944091,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872505\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('163', '35', '15875872505', '3183', '经销商账号登录', '1539944114', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('164', '1', 'famaotang', '3183', '经销商账号登录', '1539944202', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('165', '7', '15875872795', '3183', '经销商账号登录', '1539944967', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('166', '36', '15875872506', '3183', '代理商注册', '1539945032', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872506\",\"dl_pwd\":\"2ac364a83b18983de2e7f28ad319e5a1\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a506\",\"dl_contact\":\"\\u949f\\u742a506\",\"dl_tel\":\"15875872506\",\"dl_idcard\":\"440804199606160506\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539945032,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872506\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('167', '1', 'famaotang', '3183', '经销商账号登录', '1539945071', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('168', '36', '15875872506', '3183', '经销商账号登录', '1539945155', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('169', '1', 'famaotang', '3183', '经销商账号登录', '1539945607', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('170', '37', '15875872507', '3183', '代理商注册', '1539949664', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872507\",\"dl_pwd\":\"dada332b2776ebd7492b96f706e79b5a\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a507\",\"dl_contact\":\"\\u949f\\u742a507\",\"dl_tel\":\"15875872507\",\"dl_idcard\":\"440804199606160507\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539949664,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872507\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('171', '37', '15875872507', '3183', '经销商账号登录', '1539949724', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('172', '1146', 'famaotang', '3183', '企业登录', '1539949758', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('173', '6', '15875872794', '3183', '经销商账号登录', '1539952393', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('174', '1146', 'famaotang', '3183', '企业登录', '1539998791', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('175', '38', '15875872508', '3183', '代理商注册', '1539999411', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872508\",\"dl_pwd\":\"c5d6e9ebc0aeb8e11b9816c99e45dfcc\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a508\",\"dl_contact\":\"\\u949f\\u742a508\",\"dl_tel\":\"15875872508\",\"dl_idcard\":\"440804199606160508\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1539999411,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872508\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('176', '38', '15875872508', '3183', '经销商账号登录', '1539999446', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('177', '1', 'famaotang', '3183', '经销商账号登录', '1539999476', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('178', '7', '15875872795', '3183', '经销商账号登录', '1540001880', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('179', '1', 'famaotang', '3183', '经销商账号登录', '1540002270', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('180', '22', '15875872201', '3183', '经销商账号登录', '1540002362', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('181', '37', '15875872507', '3183', '经销商账号登录', '1540002546', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('182', '7', '15875872795', '3183', '经销商账号登录', '1540002614', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('183', '39', '15875872600', '3183', '代理商注册', '1540003206', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872600\",\"dl_pwd\":\"971e164e8cfd2a949c283e65258e291c\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a600\",\"dl_contact\":\"\\u949f\\u742a600\",\"dl_tel\":\"15875872600\",\"dl_idcard\":\"440804199606160600\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540003206,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440106\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5929\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872600\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('184', '39', '15875872600', '3183', '经销商账号登录', '1540003246', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('185', '7', '15875872795', '3183', '经销商账号登录', '1540003326', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('186', '15', '15875872713', '3183', '经销商账号登录', '1540003418', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('187', '7', '15875872795', '3183', '经销商账号登录', '1540003475', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('188', '1146', 'famaotang', '3183', '企业登录', '1540003533', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('189', '22', '15875872201', '3183', '经销商账号登录', '1540004020', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('190', '1', 'famaotang', '3183', '经销商账号登录', '1540004044', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('191', '14', '15875872712', '3183', '经销商账号登录', '1540005001', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('192', '1', 'famaotang', '3183', '经销商账号登录', '1540007315', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('193', '1146', 'famaotang', '3183', '修改产品价格体系', '1540013472', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('194', '22', '15875872201', '3183', '经销商账号登录', '1540013570', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('195', '5', '15875872793', '3183', '经销商账号登录', '1540013648', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('196', '13', '15875872711', '3183', '经销商账号登录', '1540013731', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('197', '1', 'famaotang', '3183', '经销商账号登录', '1540013822', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('198', '7', '15875872795', '3183', '经销商账号登录', '1540013882', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('199', '15', '15875872713', '3183', '经销商账号登录', '1540013950', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('200', '7', '15875872795', '3183', '经销商账号登录', '1540014185', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('201', '40', '15875872730', '3183', '代理商注册', '1540014728', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872730\",\"dl_pwd\":\"7cf8c29f52fec3feeb6ca55041cae5ab\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a30\",\"dl_contact\":\"\\u949f\\u742a30\",\"dl_tel\":\"15875872730\",\"dl_idcard\":\"440804199606160530\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540014728,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":7,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440115\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872730\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('202', '40', '15875872730', '3183', '经销商账号登录', '1540014756', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('203', '41', '15875872731', '3183', '代理商注册', '1540014825', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872731\",\"dl_pwd\":\"84e17fdc1377aaefa4f03670be3ee2cb\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a31\",\"dl_contact\":\"\\u949f\\u742a31\",\"dl_tel\":\"15875872731\",\"dl_idcard\":\"440804199606160531\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540014825,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":8,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440115\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872731\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('204', '41', '15875872731', '3183', '经销商账号登录', '1540014852', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('205', '42', '15875872732', '3183', '代理商注册', '1540015018', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872732\",\"dl_pwd\":\"3e7f1e2fd75dc6abb880b504eb1b81a3\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a32\",\"dl_contact\":\"\\u949f\\u742a32\",\"dl_tel\":\"15875872732\",\"dl_idcard\":\"440804199606160532\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540015018,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":9,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":7,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440115\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u5357\\u6c99\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872732\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('206', '42', '15875872732', '3183', '经销商账号登录', '1540015055', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('207', '40', '15875872730', '3183', '经销商账号登录', '1540015205', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('208', '41', '15875872731', '3183', '经销商账号登录', '1540015395', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('209', '1', 'famaotang', '3183', '经销商账号登录', '1540016025', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('210', '5', '15875872793', '3183', '经销商账号登录', '1540023724', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('211', '1', 'famaotang', '3183', '经销商账号登录', '1540023775', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('212', '6', '15875872794', '3183', '经销商账号登录', '1540025288', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('213', '1', 'famaotang', '3183', '经销商账号登录', '1540258237', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('214', '1146', 'famaotang', '3183', '企业登录', '1540439029', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('215', '1', 'famaotang', '3183', '经销商账号登录', '1540439588', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('216', '1146', 'famaotang', '3183', '修改产品价格体系', '1540440425', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500.00\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('217', '1146', 'famaotang', '3183', '修改产品价格体系', '1540440619', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500.00\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('218', '1146', 'famaotang', '3183', '修改产品价格体系', '1540443769', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500.00\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('219', '1146', 'famaotang', '3183', '修改产品价格体系', '1540443881', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"200.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"300.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"400.00\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"500.00\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('220', '1146', 'famaotang', '3183', '修改产品价格体系', '1540450167', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"10\",\"pro_id\":\"1\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"20\",\"pro_id\":\"1\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"30\",\"pro_id\":\"1\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"40\",\"pro_id\":\"1\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"50\",\"pro_id\":\"1\"}]', '1');
INSERT INTO `fw_log` VALUES ('221', '40', '15875872730', '3183', '经销商账号登录', '1540451440', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('222', '41', '15875872731', '3183', '经销商账号登录', '1540451469', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('223', '1146', 'famaotang', '3183', '修改经销商级别', '1540451544', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0\",\"dlt_minnum\":\"0\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":8,\"tfl_tjdltype\":\"7\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"29376.00\",\"dlt_minnum\":\"14688.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":8,\"tfl_tjdltype\":\"8\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":8,\"tfl_tjdltype\":\"9\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":8,\"tfl_tjdltype\":\"10\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":8,\"tfl_tjdltype\":\"11\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"}]}', '1');
INSERT INTO `fw_log` VALUES ('224', '1', 'test', '3183', '经销商账号登录', '1540452058', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('225', '1146', 'famaotang', '3183', '修改产品', '1540452272', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":1,\"pro_name\":\"\\u6d4b\\u8bd51\",\"pro_number\":\"1\",\"pro_order\":0,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"345.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u9ec4\\u8272\",\"2\":\"\\u767d\\u8272\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"1\",\"7\":\"2\",\"8\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('226', '43', '15875872792', '3183', '代理商注册', '1540454937', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872792\",\"dl_pwd\":\"1bde2478115e4e64b4f71e030dc33710\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a2\",\"dl_contact\":\"\\u949f\\u742a2\",\"dl_tel\":\"15875872792\",\"dl_idcard\":\"440804199606160572\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540454937,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":7,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":1,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872792\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('227', '43', '15875872792', '3183', '经销商账号登录', '1540455023', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('228', '1146', 'famaotang', '3183', '产品返利设置', '1540455720', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"200\",\"pfl_fanli2\":\"20\"}]', '1');
INSERT INTO `fw_log` VALUES ('229', '1146', 'famaotang', '3183', '产品返利设置', '1540455733', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"100\",\"pfl_fanli2\":\"10\"}]', '1');
INSERT INTO `fw_log` VALUES ('230', '1146', 'famaotang', '3183', '修改经销商级别', '1540457801', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":7,\"tfl_tjdltype\":\"7\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":7,\"tfl_tjdltype\":\"8\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":7,\"tfl_tjdltype\":\"9\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":7,\"tfl_tjdltype\":\"10\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_unitcode\":\"3183\",\"tfl_dltype\":7,\"tfl_tjdltype\":\"11\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"}]}', '1');
INSERT INTO `fw_log` VALUES ('231', '1146', 'famaotang', '3183', '企业登录', '1540467520', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('232', '43', '15875872792', '3183', '经销商账号登录', '1540467695', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('233', '44', '15875872793', '3183', '代理商注册', '1540469282', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872793\",\"dl_pwd\":\"ad2a523b032e8cb63f6a217150d94385\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a3\",\"dl_contact\":\"\\u949f\\u742a3\",\"dl_tel\":\"15875872793\",\"dl_idcard\":\"440804199606160573\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540469282,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":7,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":43,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872793\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('234', '44', '15875872793', '3183', '经销商账号登录', '1540469400', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('235', '1', 'test', '3183', '经销商账号登录', '1540470885', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('236', '43', '15875872792', '3183', '经销商账号登录', '1540471042', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('237', '1146', 'famaotang', '3183', '企业登录', '1540516155', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('238', '44', '15875872793', '3183', '经销商账号登录', '1540519133', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('239', '1146', 'famaotang', '3183', '企业登录', '1540520412', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('240', '45', '15875872794', '3183', '代理商注册', '1540522670', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872794\",\"dl_pwd\":\"8fa2bfbeed9dc739761683298301a3b4\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a4\",\"dl_contact\":\"\\u949f\\u742a4\",\"dl_tel\":\"15875872794\",\"dl_idcard\":\"440804199606160574\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540522670,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":8,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":44,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440104\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872794\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('241', '45', '15875872794', '3183', '经销商账号登录', '1540522704', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('242', '1146', 'famaotang', '3183', '产品返利设置', '1540522856', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"200.00\",\"pfl_fanli2\":\"20.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"8\",\"pfl_fanli1\":\"100\",\"pfl_fanli2\":\"10\"}]', '1');
INSERT INTO `fw_log` VALUES ('243', '1146', 'famaotang', '3183', '产品返利设置', '1540522989', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '[{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"100.00\",\"pfl_fanli2\":\"10.00\"},{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"8\",\"pfl_fanli1\":\"100\",\"pfl_fanli2\":\"10\"}]', '1');
INSERT INTO `fw_log` VALUES ('244', '1146', 'famaotang', '3183', '修改产品价格体系', '1540523275', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"178\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"278\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"378\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"478\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"578\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('245', '1146', 'famaotang', '3183', '修改产品价格体系', '1540523313', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"178\",\"pro_id\":\"1\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"278\",\"pro_id\":\"1\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"378\",\"pro_id\":\"1\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"478\",\"pro_id\":\"1\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"578\",\"pro_id\":\"1\"}]', '1');
INSERT INTO `fw_log` VALUES ('246', '1146', 'famaotang', '3183', '企业登录', '1540523451', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('247', '44', '15875872793', '3183', '经销商账号登录', '1540523505', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('248', '1', 'test', '3183', '经销商账号登录', '1540524339', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('249', '44', '15875872793', '3183', '经销商账号登录', '1540524899', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('250', '1', 'test', '3183', '经销商账号登录', '1540525663', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('251', '44', '15875872793', '3183', '经销商账号登录', '1540526047', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('252', '45', '15875872794', '3183', '经销商账号登录', '1540526288', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('253', '1', 'test', '3183', '经销商账号登录', '1540526557', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('254', '45', '15875872794', '3183', '经销商账号登录', '1540534124', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('255', '46', '15875872795', '3183', '代理商注册', '1540534187', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872795\",\"dl_pwd\":\"6299c582af7ba53fda8c1b769c6cb129\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a5\",\"dl_contact\":\"\\u949f\\u742a5\",\"dl_tel\":\"15875872795\",\"dl_idcard\":\"440804199606160575\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540534187,\"dl_status\":0,\"dl_level\":\"4\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":45,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872795\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('256', '1146', 'famaotang', '3183', '产品返利设置', '1540534251', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '{\"0\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"200.00\",\"pfl_fanli2\":\"20.00\"},\"1\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"8\",\"pfl_fanli1\":\"100.00\",\"pfl_fanli2\":\"10.00\"},\"3\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"10\",\"pfl_fanli1\":\"50\",\"pfl_fanli2\":\"5\"},\"8\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"2\",\"pfl_dltype\":\"8\",\"pfl_tjdltype\":\"10\",\"pfl_fanli1\":\"60\",\"pfl_fanli2\":\"6\"}}', '1');
INSERT INTO `fw_log` VALUES ('257', '1146', 'famaotang', '3183', '产品返利设置', '1540534277', '0.0.0.0', '/famaotang/Mp/Product/profanli_save', '{\"0\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"7\",\"pfl_fanli1\":\"100.00\",\"pfl_fanli2\":\"10.00\"},\"1\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"8\",\"pfl_fanli1\":\"100.00\",\"pfl_fanli2\":\"10.00\"},\"3\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"7\",\"pfl_tjdltype\":\"10\",\"pfl_fanli1\":\"40\",\"pfl_fanli2\":\"4\"},\"8\":{\"pfl_unitcode\":\"3183\",\"pfl_proid\":\"1\",\"pfl_dltype\":\"8\",\"pfl_tjdltype\":\"10\",\"pfl_fanli1\":\"30\",\"pfl_fanli2\":\"3\"}}', '1');
INSERT INTO `fw_log` VALUES ('258', '46', '15875872795', '3183', '经销商账号登录', '1540534414', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('259', '1', 'test', '3183', '经销商账号登录', '1540534759', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('260', '1146', 'famaotang', '3183', '修改经销商级别', '1540534880', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"100.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"}]}', '1');
INSERT INTO `fw_log` VALUES ('261', '44', '15875872793', '3183', '经销商账号登录', '1540534930', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('262', '44', '15875872793', '3183', '经销商账号登录', '1540535193', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('263', '1', 'test', '3183', '经销商账号登录', '1540535357', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('264', '43', '15875872792', '3183', '经销商账号登录', '1540535447', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('265', '1', 'test', '3183', '经销商账号登录', '1540535786', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('266', '1146', 'famaotang', '3183', '修改产品价格体系', '1540539062', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"10\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"11\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"12\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"13\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"14\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('267', '1146', 'famaotang', '3183', '修改产品价格体系', '1540539080', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"100\",\"pro_id\":\"1\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"110\",\"pro_id\":\"1\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"120\",\"pro_id\":\"1\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"130\",\"pro_id\":\"1\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"140\",\"pro_id\":\"1\"}]', '1');
INSERT INTO `fw_log` VALUES ('268', '1146', 'test', '3183', '企业登录', '1540548976', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('269', '44', '15875872793', '3183', '经销商账号登录', '1540549136', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('270', '1146', 'test', '3183', '修改经销商级别', '1540549249', '0.0.0.0', '/famaotang/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"100.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"}]}', '1');
INSERT INTO `fw_log` VALUES ('271', '1146', 'test', '3183', '修改产品价格体系', '1540549443', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"178\",\"pro_id\":\"2\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"188\",\"pro_id\":\"2\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"198\",\"pro_id\":\"2\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"208\",\"pro_id\":\"2\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"218\",\"pro_id\":\"2\"}]', '1');
INSERT INTO `fw_log` VALUES ('272', '1146', 'test', '3183', '修改产品价格体系', '1540549465', '0.0.0.0', '/famaotang/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u65d7\\u8230\\u5e97\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"2000.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"178\",\"pro_id\":\"1\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u4f53\\u9a8c\\u5e97\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"188\",\"pro_id\":\"1\"},{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5de5\\u4f5c\\u5ba4\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"2448.00\",\"dlt_minnum\":\"2448.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"198\",\"pro_id\":\"1\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"\\u5408\\u4f19\\u4eba\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"208\",\"pro_id\":\"1\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3183\",\"dlt_name\":\"VIP\\u5ba2\\u6237\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0.00\",\"dlt_butie\":\"0.00\",\"priprice\":\"218\",\"pro_id\":\"1\"}]', '1');
INSERT INTO `fw_log` VALUES ('273', '1146', 'test', '3183', '企业登录', '1540603063', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('274', '1', 'test', '3183', '经销商账号登录', '1540628767', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('275', '1146', 'test', '3183', '企业登录', '1540630002', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('276', '1146', 'test', '3183', '企业登录', '1540631672', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('277', '1146', 'test', '3183', '修改产品', '1540631689', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"\\u6d4b\\u8bd52\",\"pro_number\":\"1\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('278', '1146', 'test', '3183', '修改产品', '1540631695', '0.0.0.0', '/famaotang/Mp/Product/edit_save', '{\"pro_id\":2,\"pro_name\":\"\\u6d4b\\u8bd52\",\"pro_number\":\"2\",\"pro_order\":34,\"pro_typeid\":1,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"sdfsdfs\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"34.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"0\":\"\\u9ed1\\u8272\",\"1\":\"\\u7ea2\\u8272\",\"2\":\"\",\"3\":\"\",\"4\":\"4\",\"5\":\"5\"}', '1');
INSERT INTO `fw_log` VALUES ('279', '1146', 'test', '3183', '企业登录', '1540632128', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('280', '1146', 'test', '3183', '企业登录', '1540801903', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('281', '1146', 'test', '3183', '企业登录', '1540804824', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('282', '1146', 'test', '3183', '企业登录', '1541123268', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('283', '1', 'test', '3183', '经销商账号登录', '1541123274', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('284', '44', '15875872793', '3183', '经销商账号登录', '1541123358', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('285', '1146', 'test', '3183', '企业登录', '1541131092', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('286', '1146', 'test', '3183', '企业登录', '1541139191', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('287', '46', '15875872795', '3183', '经销商账号登录', '1541139637', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('288', '47', '15875872796', '3183', '代理商注册', '1541139709', '0.0.0.0', '/famaotang/Famaotang/Dealer/apply', '{\"dl_username\":\"15875872796\",\"dl_pwd\":\"531440891208d2c680f05d04aa42a247\",\"dl_number\":\"\",\"dl_unitcode\":\"3183\",\"dl_name\":\"\\u949f\\u742a6\",\"dl_contact\":\"\\u949f\\u742a6\",\"dl_tel\":\"15875872796\",\"dl_idcard\":\"440804199606160576\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1541139709,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":7,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":46,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872796\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_bank\":\"\",\"dl_bankcard\":\"\",\"dl_stockpic\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('289', '1', 'test', '3183', '经销商账号登录', '1541140421', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('290', '1', 'test', '3183', '经销商账号登录', '1541140433', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('291', '44', '15875872793', '3183', '经销商账号登录', '1541145484', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('292', '1146', 'test', '3183', '企业登录', '1541145806', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('293', '1', 'test', '3183', '经销商账号登录', '1541396271', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('294', '1146', 'test', '3183', '企业登录', '1541396296', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('295', '1', 'test', '3183', '经销商账号登录', '1541473874', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('296', '1146', 'test', '3183', '企业登录', '1541481917', '0.0.0.0', '/famaotang/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('297', '1', 'test', '3183', '经销商账号登录', '1541557712', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('298', '1', 'test', '3183', '经销商账号登录', '1541563853', '0.0.0.0', '/famaotang/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('299', '1146', 'test', '3183', '企业登录', '1541661900', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('300', '1146', 'test', '3183', '企业登录', '1541662682', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('301', '1146', 'test', '3183', '企业登录', '1541730931', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('302', '1', 'test', '3183', '经销商账号登录', '1541816338', '127.0.0.1', '/Famaotang/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('303', '1146', 'test', '3183', '企业登录', '1541838274', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('304', '1146', 'test', '3183', '企业登录', '1541838899', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('305', '1146', 'test', '3183', '企业登录', '1541838957', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('306', '1146', 'test', '3183', '企业登录', '1541839115', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('307', '1146', 'test', '3183', '添加代理礼品', '1541839169', '127.0.0.1', '/Mp/Dljf/dljfgift_save', '{\"gif_name\":\"we\",\"gif_unitcode\":\"3183\",\"gif_jf\":\"34\",\"gif_type\":1,\"gif_qty\":\"123\",\"gif_des\":\"ertert\",\"gif_addtime\":1541839169,\"gif_active\":1,\"gif_pic\":\"3183\\/1541839169_4961.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('308', '1146', 'test', '3183', '企业登录', '1541839231', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('309', '1146', 'test', '3183', '出货扫描', '1541839670', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3183\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":1,\"ship_pro\":1,\"ship_whid\":2,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000001\",\"ship_date\":1541520000,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1146\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('310', '1146', 'test', '3183', '企业登录', '1541839743', '127.0.0.1', '/Mp/Login/logining', '', '1');

-- ----------------------------
-- Table structure for fw_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_orderdetail`;
CREATE TABLE `fw_orderdetail` (
  `oddt_id` int(11) NOT NULL AUTO_INCREMENT,
  `oddt_unitcode` int(11) DEFAULT '0',
  `oddt_odid` int(11) DEFAULT '0' COMMENT '对应订单id',
  `oddt_orderid` varchar(32) DEFAULT NULL,
  `oddt_odblid` int(11) DEFAULT '0' COMMENT '订单关系的id',
  `oddt_proid` int(11) DEFAULT '0' COMMENT '产品id',
  `oddt_proname` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `oddt_pronumber` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `oddt_prounits` varchar(32) DEFAULT NULL COMMENT '产品单位',
  `oddt_prodbiao` int(11) DEFAULT '0' COMMENT '产品包装比例大标',
  `oddt_prozbiao` int(11) DEFAULT '0' COMMENT '产品包装比例中标',
  `oddt_proxbiao` int(11) DEFAULT '0' COMMENT '产品包装比例小标',
  `oddt_price` decimal(10,2) DEFAULT '0.00' COMMENT '原零售价格',
  `oddt_dlprice` decimal(10,2) DEFAULT '0.00' COMMENT '成交价格',
  `oddt_qty` int(11) DEFAULT '0' COMMENT '下单数量',
  `oddt_attrid` int(11) DEFAULT '0',
  `oddt_color` varchar(16) DEFAULT NULL,
  `oddt_size` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`oddt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COMMENT='订单详细表';

-- ----------------------------
-- Records of fw_orderdetail
-- ----------------------------
INSERT INTO `fw_orderdetail` VALUES ('1', '3183', '1', '201810161803406453', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '10.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('2', '3183', '2', '201810161809433488', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '10.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('3', '3183', '3', '201810161811064689', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '30.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('4', '3183', '4', '201810161813147905', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('5', '3183', '5', '201810161814123849', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('6', '3183', '6', '201810161815011372', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('8', '3183', '8', '201810171520188518', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('9', '3183', '9', '201810171555481374', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('10', '3183', '10', '201810171607594276', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('11', '3183', '11', '201810171618408518', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('12', '3183', '12', '201810171620301174', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('13', '3183', '13', '201810171623117807', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('14', '3183', '14', '201810171626342263', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('15', '3183', '15', '201810171628534600', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('16', '3183', '16', '201810171653302913', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('17', '3183', '17', '201810181121049425', '0', '2', '测试1', '1', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('18', '3183', '18', '201810191145127561', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('19', '3183', '19', '201810191357331576', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('20', '3183', '20', '201810191530144646', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('21', '3183', '22', '201810191538197717', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10001', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('22', '3183', '23', '201810191542069975', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('23', '3183', '24', '201810191546339088', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('24', '3183', '25', '201810191548113146', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('25', '3183', '26', '201810191604209897', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('26', '3183', '27', '201810191611137591', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('27', '3183', '28', '201810191612425788', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('28', '3183', '29', '201810191614076305', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('29', '3183', '30', '201810191616208352', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('30', '3183', '31', '201810191645276200', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('31', '3183', '32', '201810191647051609', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('32', '3183', '33', '201810191650383660', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('33', '3183', '34', '201810191651536106', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('34', '3183', '35', '201810191654179981', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('35', '3183', '36', '201810191658506314', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('36', '3183', '37', '201810191704534417', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('37', '3183', '38', '201810191707479866', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('38', '3183', '39', '201810191718016151', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('39', '3183', '40', '201810191725083584', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('40', '3183', '41', '201810191727116729', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '30.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('41', '3183', '42', '201810191746577617', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('42', '3183', '43', '201810191804262547', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('43', '3183', '44', '201810191815354284', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('44', '3183', '45', '201810191832589970', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('45', '3183', '46', '201810191949063237', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('46', '3183', '47', '201810191953156327', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('47', '3183', '48', '201810192015077431', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('48', '3183', '49', '201810192018242076', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('49', '3183', '50', '201810192019323463', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '1111', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('50', '3183', '51', '201810192021506817', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('51', '3183', '52', '201810192033306654', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('52', '3183', '53', '201810192035297588', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('53', '3183', '54', '201810192037347061', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('54', '3183', '55', '201810192039591529', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('55', '3183', '56', '201810200938268113', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('56', '3183', '57', '201810200941462454', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('57', '3183', '58', '201810201018165117', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('58', '3183', '59', '201810201026199665', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('59', '3183', '60', '201810201027425879', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('60', '3183', '61', '201810201029229288', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('61', '3183', '62', '201810201041011224', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '20.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('62', '3183', '63', '201810201043558653', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '40.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('63', '3183', '64', '201810201248044898', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '100000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('64', '3183', '65', '201810201253495233', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('65', '3183', '66', '201810201331305899', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('66', '3183', '67', '201810201333116338', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('67', '3183', '68', '201810201334225799', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('68', '3183', '69', '201810201335481447', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '300.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('69', '3183', '70', '201810201337176785', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('70', '3183', '71', '201810201338213818', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('71', '3183', '72', '201810201339244377', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '400.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('72', '3183', '73', '201810201343204179', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('73', '3183', '74', '201810201352508294', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('74', '3183', '75', '201810201354272989', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('75', '3183', '76', '201810201357509237', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '300.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('76', '3183', '77', '201810201622191813', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('77', '3183', '78', '201810201623091763', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1001', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('78', '3183', '79', '201810201648236087', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '100000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('79', '3183', '80', '201810251207379207', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('80', '3183', '81', '201810251305021868', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('81', '3183', '82', '201810251410455081', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('82', '3183', '83', '201810251523035480', '0', '1', '测试1', '1', '345', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('83', '3183', '83', '201810251523035480', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('84', '3183', '84', '201810251525085618', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('85', '3183', '84', '201810251525085618', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('86', '3183', '85', '201810251612334578', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('87', '3183', '85', '201810251612334578', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('88', '3183', '86', '201810251628405380', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('89', '3183', '86', '201810251628405380', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('90', '3183', '87', '201810251702112789', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('91', '3183', '87', '201810251702112789', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('92', '3183', '88', '201810251844317990', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('93', '3183', '88', '201810251844317990', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('94', '3183', '89', '201810251900182858', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('95', '3183', '89', '201810251900182858', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('96', '3183', '90', '201810251942181682', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '10', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('97', '3183', '90', '201810251942181682', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('98', '3183', '91', '201810251945177192', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('99', '3183', '91', '201810251945177192', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '1', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('100', '3183', '92', '201810251947495139', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('101', '3183', '92', '201810251947495139', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('102', '3183', '93', '201810252010597901', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('103', '3183', '93', '201810252010597901', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('104', '3183', '94', '201810252013133895', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('105', '3183', '94', '201810252013133895', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('106', '3183', '95', '201810252035177053', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('107', '3183', '95', '201810252035177053', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '1000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('108', '3183', '96', '201810252037468464', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('109', '3183', '96', '201810252037468464', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '10000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('110', '3183', '97', '201810252055307285', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('111', '3183', '97', '201810252055307285', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('112', '3183', '98', '201810260942571534', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('113', '3183', '98', '201810260942571534', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '100', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('114', '3183', '99', '201810260944231275', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('115', '3183', '99', '201810260944231275', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('116', '3183', '100', '201810260945226298', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('117', '3183', '100', '201810260945226298', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '10000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('118', '3183', '101', '201810260949472594', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '1', '4', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('119', '3183', '101', '201810260949472594', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '1', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('120', '3183', '101', '201810260949472594', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '1', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('121', '3183', '101', '201810260949472594', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '1000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('122', '3183', '102', '201810260954531442', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '10', '4', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('123', '3183', '102', '201810260954531442', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '5', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('124', '3183', '102', '201810260954531442', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '100', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('125', '3183', '103', '201810260959224889', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('126', '3183', '103', '201810260959224889', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('127', '3183', '104', '201810261000371809', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('128', '3183', '104', '201810261000371809', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('129', '3183', '105', '201810261007436871', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('130', '3183', '105', '201810261007436871', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('131', '3183', '106', '201810261015515376', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('132', '3183', '106', '201810261015515376', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('133', '3183', '107', '201810261049511620', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '100.00', '30', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('134', '3183', '107', '201810261049511620', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '10.00', '40', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('135', '3183', '108', '201810261058442455', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '10000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('136', '3183', '108', '201810261058442455', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '20.00', '111', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('137', '3183', '109', '201810261059336434', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('138', '3183', '109', '201810261059336434', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '20.00', '100', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('139', '3183', '110', '201810261101267069', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '1000', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('140', '3183', '110', '201810261101267069', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '20.00', '1000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('141', '3183', '111', '201810261103341084', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '200.00', '100', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('142', '3183', '111', '201810261103341084', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '20.00', '100', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('143', '3183', '112', '201810261112299385', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('144', '3183', '112', '201810261112299385', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('145', '3183', '112', '201810261112299385', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('146', '3183', '112', '201810261112299385', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('147', '3183', '113', '201810261118526705', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '10', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('148', '3183', '113', '201810261118526705', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('149', '3183', '113', '201810261118526705', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('150', '3183', '113', '201810261118526705', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '9', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('151', '3183', '114', '201810261125035765', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('152', '3183', '114', '201810261125035765', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('153', '3183', '114', '201810261125035765', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('154', '3183', '114', '201810261125035765', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('155', '3183', '115', '201810261135412880', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('156', '3183', '115', '201810261135412880', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('157', '3183', '115', '201810261135412880', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('158', '3183', '115', '201810261135412880', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('159', '3183', '116', '201810261147182324', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('160', '3183', '116', '201810261147182324', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('161', '3183', '116', '201810261147182324', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('162', '3183', '116', '201810261147182324', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('163', '3183', '117', '201810261153032829', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('164', '3183', '117', '201810261153032829', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('165', '3183', '117', '201810261153032829', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('166', '3183', '117', '201810261153032829', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('167', '3183', '118', '201810261154519650', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('168', '3183', '118', '201810261154519650', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('169', '3183', '118', '201810261154519650', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('170', '3183', '118', '201810261154519650', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '6', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('171', '3183', '119', '201810261158571492', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '278.00', '10', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('172', '3183', '119', '201810261158571492', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '2', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('173', '3183', '119', '201810261158571492', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '6', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('174', '3183', '119', '201810261158571492', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '9', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('175', '3183', '120', '201810261202179495', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '278.00', '9', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('176', '3183', '120', '201810261202179495', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '10', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('177', '3183', '120', '201810261202179495', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '2', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('178', '3183', '120', '201810261202179495', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '278.00', '6', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('179', '3183', '121', '201810261414454437', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '478.00', '5', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('180', '3183', '121', '201810261414454437', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '6', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('181', '3183', '121', '201810261414454437', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '1', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('182', '3183', '121', '201810261414454437', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '1', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('183', '3183', '122', '201810261416218868', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '478.00', '10', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('184', '3183', '122', '201810261416218868', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '9', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('185', '3183', '122', '201810261416218868', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '5', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('186', '3183', '122', '201810261416218868', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '1', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('187', '3183', '123', '201810261418525470', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '478.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('188', '3183', '123', '201810261418525470', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '1', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('189', '3183', '123', '201810261418525470', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '1', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('190', '3183', '123', '201810261418525470', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '478.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('191', '3183', '124', '201810261423015070', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '14', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('192', '3183', '124', '201810261423015070', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '1', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('193', '3183', '124', '201810261423015070', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '1', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('194', '3183', '124', '201810261423015070', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '1', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('195', '3183', '125', '201810261427332678', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '6', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('196', '3183', '125', '201810261427332678', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '5', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('197', '3183', '125', '201810261427332678', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '10', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('198', '3183', '126', '201810261819212416', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '100.00', '1000', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('199', '3183', '127', '201810261820579761', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '10.00', '10', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('200', '3183', '127', '201810261820579761', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '100.00', '9', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('201', '3183', '127', '201810261820579761', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '100.00', '8', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('202', '3183', '127', '201810261820579761', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '100.00', '6', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('203', '3183', '128', '201810261825107310', '0', '2', '测试2', '2', '箱', '0', '0', '0', '34.00', '178.00', '1', '5', '红色', '');
INSERT INTO `fw_orderdetail` VALUES ('204', '3183', '128', '201810261825107310', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '5', '1', '黑色', '');
INSERT INTO `fw_orderdetail` VALUES ('205', '3183', '128', '201810261825107310', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '7', '2', '黄色', '');
INSERT INTO `fw_orderdetail` VALUES ('206', '3183', '128', '201810261825107310', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '3', '3', '白色', '');
INSERT INTO `fw_orderdetail` VALUES ('207', '3183', '129', '201811020958525902', '0', '1', '测试1', '1', '箱', '0', '0', '0', '345.00', '178.00', '1000', '3', '白色', '');

-- ----------------------------
-- Table structure for fw_orderlogs
-- ----------------------------
DROP TABLE IF EXISTS `fw_orderlogs`;
CREATE TABLE `fw_orderlogs` (
  `odlg_id` int(11) NOT NULL AUTO_INCREMENT,
  `odlg_unitcode` varchar(32) DEFAULT NULL,
  `odlg_odid` int(11) DEFAULT '0' COMMENT '对应订单id',
  `odlg_orderid` varchar(32) DEFAULT NULL COMMENT '对应订单号',
  `odlg_type` int(11) DEFAULT '0' COMMENT '0-公司操作 1-代理操作',
  `odlg_dlid` int(11) DEFAULT NULL COMMENT '操作id',
  `odlg_dlusername` varchar(32) DEFAULT NULL COMMENT '操作用户名',
  `odlg_dlname` varchar(32) DEFAULT NULL COMMENT '操作人',
  `odlg_action` varchar(64) DEFAULT NULL COMMENT '动作',
  `odlg_addtime` int(11) DEFAULT '0' COMMENT '操作时间',
  `odlg_link` varchar(256) DEFAULT NULL COMMENT '操作链接',
  `odlg_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`odlg_id`),
  KEY `odlg_unitcode` (`odlg_unitcode`)
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COMMENT='订单操作日志';

-- ----------------------------
-- Records of fw_orderlogs
-- ----------------------------
INSERT INTO `fw_orderlogs` VALUES ('1', '3183', '1', '201810161803406453', '1', '1', 'famaotang', '钟琪', '创建订单', '1539684220', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('2', '3183', '2', '201810161809433488', '1', '4', '15875872792', '钟琪2', '创建订单', '1539684583', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('3', '3183', '3', '201810161811064689', '1', '8', '15875872100', '钟琪100', '创建订单', '1539684666', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('4', '3183', '4', '201810161813147905', '1', '5', '15875872793', '钟琪3', '创建订单', '1539684794', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('5', '3183', '5', '201810161814123849', '1', '6', '15875872794', '钟琪4', '创建订单', '1539684852', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('6', '3183', '6', '201810161815011372', '1', '7', '15875872795', '钟琪5', '创建订单', '1539684901', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('7', '3183', '1', '201810161803406453', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1539739306', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('8', '3183', '6', '201810161815011372', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1539739943', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/6', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('14', '3183', '10', '201810171607594276', '1', '12', '15875872710', '钟琪10', '创建订单', '1539763679', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('13', '3183', '9', '201810171555481374', '1', '11', '15875872799', '钟琪9', '创建订单', '1539762948', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('12', '3183', '8', '201810171520188518', '1', '10', '15875872120', '钟琪120', '创建订单', '1539760818', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('15', '3183', '11', '201810171618408518', '1', '13', '15875872711', '钟琪11', '创建订单', '1539764320', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('16', '3183', '12', '201810171620301174', '1', '14', '15875872712', '钟琪12', '创建订单', '1539764430', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('17', '3183', '13', '201810171623117807', '1', '15', '15875872713', '钟琪13', '创建订单', '1539764591', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('18', '3183', '14', '201810171626342263', '1', '16', '15875872714', '钟琪14', '创建订单', '1539764794', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('19', '3183', '15', '201810171628534600', '1', '17', '15875872715', '钟琪', '创建订单', '1539764934', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('20', '3183', '15', '201810171628534600', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1539765058', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/15', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('21', '3183', '16', '201810171653302913', '1', '18', '15875872716', '钟琪16', '创建订单', '1539766410', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('22', '3183', '14', '201810171626342263', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1539827143', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/14', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('23', '3183', '14', '201810171626342263', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1539827297', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('24', '3183', '17', '201810181121049425', '1', '20', '15875872718', '钟琪18', '创建订单', '1539832864', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('25', '3183', '17', '201810181121049425', '1', '19', '15875872717', '钟琪17', '确认订单', '1539834098', '/famaotang/Famaotang/Orders/canceldlorder/od_id/17/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('26', '3183', '17', '201810181121049425', '1', '19', '15875872717', '钟琪17', '完成发货', '1539835062', '/famaotang/Famaotang/Orders/odfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('27', '3183', '16', '201810171653302913', '1', '1', 'famaotang', '钟琪', '确认订单', '1539849668', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/16/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('28', '3183', '11', '201810171618408518', '1', '1', 'famaotang', '钟琪', '确认订单', '1539849672', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/11/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('29', '3183', '5', '201810161814123849', '1', '1', 'famaotang', '钟琪', '确认订单', '1539851595', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/5/state/1/od_state/0', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('30', '3183', '16', '201810171653302913', '1', '18', '15875872716', '钟琪16', '确认收货', '1539853559', '/famaotang/Famaotang/Orders/confirmreceipt/od_id/16', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('31', '3183', '18', '201810191145127561', '1', '22', '15875872201', '钟琪201', '创建订单', '1539920713', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('32', '3183', '19', '201810191357331576', '1', '23', '15875872300', '钟琪300', '创建订单', '1539928653', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('33', '3183', '18', '201810191145127561', '1', '1', 'famaotang', '钟琪', '确认订单', '1539933612', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/18/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('34', '3183', '18', '201810191145127561', '1', '1', 'famaotang', '钟琪', '取消订单', '1539933720', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/18/state/9', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('35', '3183', '4', '201810161813147905', '1', '1', 'famaotang', '钟琪', '取消订单', '1539933740', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/4/state/9', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('36', '3183', '1', '201810161803406453', '1', '1', 'famaotang', '钟琪', '取消订单', '1539933804', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/1/state/9', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('37', '3183', '20', '201810191530144646', '1', '24', '15875872202', '钟琪202', '创建订单', '1539934214', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('38', '3183', '22', '201810191538197717', '1', '25', '15875872203', '钟琪203', '创建订单', '1539934699', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('39', '3183', '23', '201810191542069975', '1', '1', 'famaotang', '钟琪', '创建订单', '1539934926', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('40', '3183', '24', '201810191546339088', '1', '1', 'famaotang', '钟琪', '创建订单', '1539935193', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('41', '3183', '25', '201810191548113146', '1', '13', '15875872711', '钟琪11', '创建订单', '1539935291', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('42', '3183', '26', '201810191604209897', '1', '6', '15875872794', '钟琪4', '创建订单', '1539936260', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('43', '3183', '27', '201810191611137591', '1', '1', 'famaotang', '钟琪', '创建订单', '1539936673', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('44', '3183', '28', '201810191612425788', '1', '4', '15875872792', '钟琪2', '创建订单', '1539936763', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('45', '3183', '29', '201810191614076305', '1', '22', '15875872201', '钟琪201', '创建订单', '1539936847', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('46', '3183', '30', '201810191616208352', '1', '5', '15875872793', '钟琪3', '创建订单', '1539936980', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('47', '3183', '31', '201810191645276200', '1', '6', '15875872794', '钟琪4', '创建订单', '1539938728', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('48', '3183', '32', '201810191647051609', '1', '13', '15875872711', '钟琪11', '创建订单', '1539938825', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('49', '3183', '32', '201810191647051609', '1', '1', 'famaotang', '钟琪', '确认订单', '1539938850', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/32/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('50', '3183', '32', '201810191647051609', '1', '1', 'famaotang', '钟琪', '完成发货', '1539938876', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('51', '3183', '33', '201810191650383660', '1', '7', '15875872795', '钟琪5', '创建订单', '1539939038', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('52', '3183', '34', '201810191651536106', '1', '11', '15875872799', '钟琪9', '创建订单', '1539939113', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('53', '3183', '35', '201810191654179981', '1', '26', '15875872720', '钟琪20', '创建订单', '1539939257', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('54', '3183', '36', '201810191658506314', '1', '27', '15875872721', '钟琪21', '创建订单', '1539939530', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('55', '3183', '37', '201810191704534417', '1', '8', '15875872100', '钟琪100', '创建订单', '1539939893', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('56', '3183', '38', '201810191707479866', '1', '28', '15875872101', '钟琪101', '创建订单', '1539940067', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('57', '3183', '39', '201810191718016151', '1', '29', '15875872102', '钟琪102', '创建订单', '1539940681', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('58', '3183', '40', '201810191725083584', '1', '30', '15875872103', '钟琪103', '创建订单', '1539941108', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('59', '3183', '41', '201810191727116729', '1', '31', '15875872104', '钟琪104', '创建订单', '1539941231', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('60', '3183', '42', '201810191746577617', '1', '32', '15875872500', '钟琪500', '创建订单', '1539942417', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('61', '3183', '42', '201810191746577617', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1539942666', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/42', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('62', '3183', '42', '201810191746577617', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1539942685', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('63', '3183', '43', '201810191804262547', '1', '34', '15875872504', '钟琪504', '创建订单', '1539943466', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('64', '3183', '43', '201810191804262547', '1', '1', 'famaotang', '钟琪', '确认订单', '1539943523', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/43/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('65', '3183', '43', '201810191804262547', '1', '1', 'famaotang', '钟琪', '完成发货', '1539943734', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('66', '3183', '44', '201810191815354284', '1', '35', '15875872505', '钟琪505', '创建订单', '1539944135', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('67', '3183', '44', '201810191815354284', '1', '1', 'famaotang', '钟琪', '确认订单', '1539944210', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/44/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('68', '3183', '44', '201810191815354284', '1', '1', 'famaotang', '钟琪', '完成发货', '1539944237', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('69', '3183', '45', '201810191832589970', '1', '36', '15875872506', '钟琪506', '创建订单', '1539945178', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('70', '3183', '45', '201810191832589970', '1', '1', 'famaotang', '钟琪', '确认订单', '1539945189', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/45/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('71', '3183', '45', '201810191832589970', '1', '1', 'famaotang', '钟琪', '完成发货', '1539946557', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('72', '3183', '31', '201810191645276200', '1', '1', 'famaotang', '钟琪', '确认订单', '1539946731', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/31/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('73', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947122', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('74', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947246', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('75', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947251', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('76', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947300', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('77', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947611', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('78', '3183', '30', '201810191616208352', '1', '1', 'famaotang', '钟琪', '确认订单', '1539947678', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/30/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('79', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947689', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('80', null, '31', '201810191645276200', '0', null, null, null, '完成发货', '1539947803', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('81', null, '30', '201810191616208352', '0', null, null, null, '完成发货', '1539948235', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('82', '3183', '31', '201810191645276200', '0', null, null, null, '完成发货', '1539948501', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('83', '3183', '46', '201810191949063237', '1', '37', '15875872507', '钟琪507', '创建订单', '1539949746', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('84', '3183', '46', '201810191949063237', '1', '1', 'famaotang', '钟琪', '确认订单', '1539949790', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/46/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('85', '3183', '46', '201810191949063237', '0', null, null, null, '完成发货', '1539949825', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('86', '3183', '47', '201810191953156327', '1', '37', '15875872507', '钟琪507', '创建订单', '1539949996', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('87', '3183', '47', '201810191953156327', '1', '1', 'famaotang', '钟琪', '确认订单', '1539950011', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/47/state/1/od_state/0', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('88', '3183', '47', '201810191953156327', '0', null, null, null, '完成发货', '1539950032', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('89', '3183', '48', '201810192015077431', '1', '37', '15875872507', '钟琪507', '创建订单', '1539951307', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('90', '3183', '48', '201810192015077431', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951316', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/48/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('91', '3183', '48', '201810192015077431', '0', null, null, null, '完成发货', '1539951353', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('92', '3183', '49', '201810192018242076', '1', '37', '15875872507', '钟琪507', '创建订单', '1539951504', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('93', '3183', '49', '201810192018242076', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951516', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/49/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('94', '3183', '49', '201810192018242076', '0', null, null, null, '完成发货', '1539951525', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('95', '3183', '50', '201810192019323463', '1', '37', '15875872507', '钟琪507', '创建订单', '1539951572', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('96', '3183', '50', '201810192019323463', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951577', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/50/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('97', '3183', '51', '201810192021506817', '1', '37', '15875872507', '钟琪507', '创建订单', '1539951710', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('98', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951714', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('99', '3183', '51', '201810192021506817', '0', null, null, null, '完成发货', '1539951724', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('100', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951837', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('101', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951871', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('102', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951950', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('103', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539951999', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('104', '3183', '52', '201810192033306654', '1', '6', '15875872794', '钟琪4', '创建订单', '1539952410', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('105', '3183', '52', '201810192033306654', '1', '1', 'famaotang', '钟琪', '确认订单', '1539952414', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/52/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('106', '3183', '52', '201810192033306654', '0', null, null, null, '完成发货', '1539952424', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('107', '3183', '53', '201810192035297588', '1', '6', '15875872794', '钟琪4', '创建订单', '1539952529', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('108', '3183', '53', '201810192035297588', '1', '1', 'famaotang', '钟琪', '确认订单', '1539952533', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/53/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('109', '3183', '53', '201810192035297588', '0', null, null, null, '完成发货', '1539952542', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('110', '3183', '54', '201810192037347061', '1', '6', '15875872794', '钟琪4', '创建订单', '1539952654', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('111', '3183', '54', '201810192037347061', '1', '1', 'famaotang', '钟琪', '确认订单', '1539952661', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/54/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('112', '3183', '54', '201810192037347061', '0', null, null, null, '完成发货', '1539952670', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('113', '3183', '55', '201810192039591529', '1', '6', '15875872794', '钟琪4', '创建订单', '1539952799', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('114', '3183', '55', '201810192039591529', '1', '1', 'famaotang', '钟琪', '确认订单', '1539952804', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/55/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('115', '3183', '55', '201810192039591529', '0', null, null, null, '完成发货', '1539952813', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('116', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539953088', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('117', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539953392', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('118', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539953765', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('119', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539953849', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('120', '3183', '51', '201810192021506817', '0', null, null, null, '完成发货', '1539954157', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('121', '3183', '51', '201810192021506817', '0', null, null, null, '完成发货', '1539954530', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('122', '3183', '51', '201810192021506817', '1', '1', 'famaotang', '钟琪', '确认订单', '1539955702', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/51/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('123', '3183', '51', '201810192021506817', '0', null, null, null, '完成发货', '1539955715', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('124', '3183', '51', '201810192021506817', '0', null, null, null, '完成发货', '1539999028', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('125', '3183', '56', '201810200938268113', '1', '38', '15875872508', '钟琪508', '创建订单', '1539999507', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('126', '3183', '56', '201810200938268113', '1', '1', 'famaotang', '钟琪', '确认订单', '1539999521', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/56/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('127', '3183', '56', '201810200938268113', '0', null, null, null, '完成发货', '1539999571', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('128', '3183', '57', '201810200941462454', '1', '38', '15875872508', '钟琪508', '创建订单', '1539999707', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('129', '3183', '57', '201810200941462454', '1', '1', 'famaotang', '钟琪', '确认订单', '1539999713', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/57/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('130', '3183', '57', '201810200941462454', '0', null, null, null, '完成发货', '1539999729', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('131', '3183', '58', '201810201018165117', '1', '7', '15875872795', '钟琪5', '创建订单', '1540001897', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('132', '3183', '59', '201810201026199665', '1', '22', '15875872201', '钟琪201', '创建订单', '1540002379', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('133', '3183', '60', '201810201027425879', '1', '1', 'famaotang', '钟琪', '创建订单', '1540002462', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('134', '3183', '61', '201810201029229288', '1', '37', '15875872507', '钟琪507', '创建订单', '1540002562', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('135', '3183', '62', '201810201041011224', '1', '39', '15875872600', '钟琪600', '创建订单', '1540003261', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('136', '3183', '63', '201810201043558653', '1', '15', '15875872713', '钟琪13', '创建订单', '1540003435', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('137', '3183', '64', '201810201248044898', '1', '1', 'famaotang', '钟琪', '创建订单', '1540010884', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('138', '3183', '65', '201810201253495233', '1', '1', 'famaotang', '钟琪', '创建订单', '1540011229', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('139', '3183', '66', '201810201331305899', '1', '1', 'famaotang', '钟琪', '创建订单', '1540013490', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('140', '3183', '67', '201810201333116338', '1', '22', '15875872201', '钟琪201', '创建订单', '1540013591', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('141', '3183', '68', '201810201334225799', '1', '5', '15875872793', '钟琪3', '创建订单', '1540013662', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('142', '3183', '69', '201810201335481447', '1', '13', '15875872711', '钟琪11', '创建订单', '1540013749', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('143', '3183', '70', '201810201337176785', '1', '1', 'famaotang', '钟琪', '创建订单', '1540013837', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('144', '3183', '71', '201810201338213818', '1', '7', '15875872795', '钟琪5', '创建订单', '1540013901', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('145', '3183', '72', '201810201339244377', '1', '15', '15875872713', '钟琪13', '创建订单', '1540013964', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('146', '3183', '73', '201810201343204179', '1', '7', '15875872795', '钟琪5', '创建订单', '1540014200', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('147', '3183', '74', '201810201352508294', '1', '40', '15875872730', '钟琪30', '创建订单', '1540014770', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('148', '3183', '75', '201810201354272989', '1', '41', '15875872731', '钟琪31', '创建订单', '1540014867', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('149', '3183', '76', '201810201357509237', '1', '42', '15875872732', '钟琪32', '创建订单', '1540015071', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('150', '3183', '77', '201810201622191813', '1', '5', '15875872793', '钟琪3', '创建订单', '1540023739', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('151', '3183', '78', '201810201623091763', '1', '1', 'famaotang', '钟琪', '创建订单', '1540023789', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('152', '3183', '79', '201810201648236087', '1', '6', '15875872794', '钟琪4', '创建订单', '1540025303', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('153', '3183', '78', '201810201623091763', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540439874', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/78', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('154', '3183', '80', '201810251207379207', '1', '1', 'famaotang', '钟琪', '创建订单', '1540440457', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('155', '3183', '81', '201810251305021868', '1', '1', 'famaotang', '钟琪', '创建订单', '1540443902', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('156', '3183', '82', '201810251410455081', '1', '1', 'famaotang', '钟琪', '创建订单', '1540447846', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('157', '3183', '83', '201810251523035480', '1', '1', 'test', '钟琪', '创建订单', '1540452183', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('158', '3183', '84', '201810251525085618', '1', '1', 'test', '钟琪', '创建订单', '1540452308', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('159', '3183', '84', '201810251525085618', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540452420', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/84', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('160', '3183', '85', '201810251612334578', '1', '43', '15875872792', '钟琪2', '创建订单', '1540455153', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('161', '3183', '85', '201810251612334578', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540455240', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/85', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('162', '3183', '85', '201810251612334578', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540455487', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('163', '3183', '86', '201810251628405380', '1', '43', '15875872792', '钟琪2', '创建订单', '1540456120', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('164', '3183', '86', '201810251628405380', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540456131', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/86', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('165', '3183', '86', '201810251628405380', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540456142', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('166', '3183', '87', '201810251702112789', '1', '43', '15875872792', '钟琪2', '创建订单', '1540458131', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('167', '3183', '87', '201810251702112789', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540458148', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/87', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('168', '3183', '87', '201810251702112789', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540463949', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('169', '3183', '88', '201810251844317990', '1', '43', '15875872792', '钟琪2', '创建订单', '1540464271', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('170', '3183', '88', '201810251844317990', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540464278', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/88', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('171', '3183', '88', '201810251844317990', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540464293', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('172', '3183', '88', '201810251844317990', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540464487', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('173', '3183', '88', '201810251844317990', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540464916', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('174', '3183', '89', '201810251900182858', '1', '43', '15875872792', '钟琪2', '创建订单', '1540465218', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('175', '3183', '89', '201810251900182858', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540465224', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/89', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('176', '3183', '89', '201810251900182858', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540465235', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('177', '3183', '89', '201810251900182858', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540466753', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('178', '3183', '90', '201810251942181682', '1', '43', '15875872792', '钟琪2', '创建订单', '1540467738', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('179', '3183', '90', '201810251942181682', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540467745', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/90', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('180', '3183', '90', '201810251942181682', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540467756', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('181', '3183', '91', '201810251945177192', '1', '43', '15875872792', '钟琪2', '创建订单', '1540467917', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('182', '3183', '91', '201810251945177192', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540467922', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/91', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('183', '3183', '91', '201810251945177192', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540467931', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('184', '3183', '92', '201810251947495139', '1', '43', '15875872792', '钟琪2', '创建订单', '1540468069', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('185', '3183', '92', '201810251947495139', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540468074', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/92', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('186', '3183', '92', '201810251947495139', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540468088', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('187', '3183', '93', '201810252010597901', '1', '44', '15875872793', '钟琪3', '创建订单', '1540469459', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('188', '3183', '93', '201810252010597901', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540469472', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/93', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('189', '3183', '93', '201810252010597901', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540469503', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('190', '3183', '94', '201810252013133895', '1', '44', '15875872793', '钟琪3', '创建订单', '1540469594', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('191', '3183', '94', '201810252013133895', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540469600', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/94', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('192', '3183', '94', '201810252013133895', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540469611', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('193', '3183', '95', '201810252035177053', '1', '1', 'test', '钟琪1', '创建订单', '1540470917', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('194', '3183', '95', '201810252035177053', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540470929', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/95', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('195', '3183', '95', '201810252035177053', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540470943', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('196', '3183', '96', '201810252037468464', '1', '43', '15875872792', '钟琪2', '创建订单', '1540471066', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('197', '3183', '96', '201810252037468464', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540471073', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/96', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('198', '3183', '96', '201810252037468464', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540471083', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('199', '3183', '97', '201810252055307285', '1', '43', '15875872792', '钟琪2', '创建订单', '1540472130', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('200', '3183', '97', '201810252055307285', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540472136', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/97', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('201', '3183', '97', '201810252055307285', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540472146', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('202', '3183', '98', '201810260942571534', '1', '43', '15875872792', '钟琪2', '创建订单', '1540518177', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('203', '3183', '98', '201810260942571534', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540518190', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/98', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('204', '3183', '98', '201810260942571534', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540518200', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('205', '3183', '99', '201810260944231275', '1', '43', '15875872792', '钟琪2', '创建订单', '1540518263', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('206', '3183', '99', '201810260944231275', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540518269', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/99', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('207', '3183', '99', '201810260944231275', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540518280', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('208', '3183', '100', '201810260945226298', '1', '43', '15875872792', '钟琪2', '创建订单', '1540518322', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('209', '3183', '100', '201810260945226298', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540518330', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/100', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('210', '3183', '100', '201810260945226298', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540518344', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('211', '3183', '101', '201810260949472594', '1', '43', '15875872792', '钟琪2', '创建订单', '1540518588', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('212', '3183', '101', '201810260949472594', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540518596', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/101', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('213', '3183', '101', '201810260949472594', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540518641', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('214', '3183', '102', '201810260954531442', '1', '43', '15875872792', '钟琪2', '创建订单', '1540518893', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('215', '3183', '102', '201810260954531442', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540518903', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/102', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('216', '3183', '102', '201810260954531442', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540518914', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('217', '3183', '103', '201810260959224889', '1', '44', '15875872793', '钟琪3', '创建订单', '1540519163', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('218', '3183', '103', '201810260959224889', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540519167', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/103', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('219', '3183', '103', '201810260959224889', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540519182', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('220', '3183', '104', '201810261000371809', '1', '44', '15875872793', '钟琪3', '创建订单', '1540519238', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('221', '3183', '104', '201810261000371809', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540519242', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/104', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('222', '3183', '104', '201810261000371809', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540519265', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('223', '3183', '105', '201810261007436871', '1', '44', '15875872793', '钟琪3', '创建订单', '1540519663', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('224', '3183', '105', '201810261007436871', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540519668', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/105', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('225', '3183', '105', '201810261007436871', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540519679', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('226', '3183', '106', '201810261015515376', '1', '44', '15875872793', '钟琪3', '创建订单', '1540520151', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('227', '3183', '106', '201810261015515376', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540520156', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/106', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('228', '3183', '106', '201810261015515376', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540520425', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('229', '3183', '107', '201810261049511620', '1', '44', '15875872793', '钟琪3', '创建订单', '1540522191', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('230', '3183', '107', '201810261049511620', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540522196', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/107', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('231', '3183', '107', '201810261049511620', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540522212', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('232', '3183', '108', '201810261058442455', '1', '45', '15875872794', '钟琪4', '创建订单', '1540522724', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('233', '3183', '108', '201810261058442455', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540522731', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/108', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('234', '3183', '108', '201810261058442455', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540522742', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('235', '3183', '109', '201810261059336434', '1', '45', '15875872794', '钟琪4', '创建订单', '1540522773', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('236', '3183', '109', '201810261059336434', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540522781', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/109', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('237', '3183', '109', '201810261059336434', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540522793', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('238', '3183', '110', '201810261101267069', '1', '45', '15875872794', '钟琪4', '创建订单', '1540522886', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('239', '3183', '110', '201810261101267069', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540522895', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/110', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('240', '3183', '110', '201810261101267069', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540522908', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('241', '3183', '111', '201810261103341084', '1', '45', '15875872794', '钟琪4', '创建订单', '1540523015', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('242', '3183', '111', '201810261103341084', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540523020', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/111', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('243', '3183', '111', '201810261103341084', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540523033', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('244', '3183', '112', '201810261112299385', '1', '44', '15875872793', '钟琪3', '创建订单', '1540523549', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('245', '3183', '112', '201810261112299385', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540523555', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/112', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('246', '3183', '112', '201810261112299385', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540523788', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('247', '3183', '113', '201810261118526705', '1', '44', '15875872793', '钟琪3', '创建订单', '1540523932', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('248', '3183', '113', '201810261118526705', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540523938', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/113', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('249', '3183', '113', '201810261118526705', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540523956', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('250', '3183', '114', '201810261125035765', '1', '44', '15875872793', '钟琪3', '创建订单', '1540524303', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('251', '3183', '114', '201810261125035765', '1', '1', 'test', '钟琪', '确认订单', '1540524345', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/114/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('252', '3183', '114', '201810261125035765', '0', null, null, null, '完成发货', '1540524717', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('253', '3183', '115', '201810261135412880', '1', '44', '15875872793', '钟琪3', '创建订单', '1540524941', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('254', '3183', '115', '201810261135412880', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540524948', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/115', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('255', '3183', '115', '201810261135412880', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540524958', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('256', '3183', '116', '201810261147182324', '1', '44', '15875872793', '钟琪3', '创建订单', '1540525638', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('257', '3183', '116', '201810261147182324', '1', '1', 'test', '钟琪', '确认订单', '1540525670', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/116/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('258', '3183', '116', '201810261147182324', '0', null, null, null, '完成发货', '1540525681', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('259', '3183', '117', '201810261153032829', '1', '1', 'test', '钟琪', '创建订单', '1540525984', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('260', '3183', '117', '201810261153032829', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540525988', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/117', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('261', '3183', '117', '201810261153032829', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540525999', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('262', '3183', '118', '201810261154519650', '1', '44', '15875872793', '钟琪3', '创建订单', '1540526091', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('263', '3183', '118', '201810261154519650', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540526098', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/118', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('264', '3183', '118', '201810261154519650', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540526109', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('265', '3183', '119', '201810261158571492', '1', '45', '15875872794', '钟琪4', '创建订单', '1540526337', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('266', '3183', '119', '201810261158571492', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540526342', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/119', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('267', '3183', '119', '201810261158571492', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540526366', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('268', '3183', '120', '201810261202179495', '1', '45', '15875872794', '钟琪4', '创建订单', '1540526537', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('269', '3183', '120', '201810261202179495', '1', '1', 'test', '钟琪', '确认订单', '1540526563', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/120/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('270', '3183', '120', '201810261202179495', '0', null, null, null, '完成发货', '1540526569', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('271', '3183', '121', '201810261414454437', '1', '46', '15875872795', '钟琪5', '创建订单', '1540534485', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('272', '3183', '121', '201810261414454437', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540534515', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/121', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('273', '3183', '121', '201810261414454437', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540534534', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('274', '3183', '122', '201810261416218868', '1', '46', '15875872795', '钟琪5', '创建订单', '1540534581', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('275', '3183', '122', '201810261416218868', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540534587', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/122', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('276', '3183', '122', '201810261416218868', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540534598', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('277', '3183', '123', '201810261418525470', '1', '46', '15875872795', '钟琪5', '创建订单', '1540534732', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('278', '3183', '123', '201810261418525470', '1', '1', 'test', '钟琪', '确认订单', '1540534772', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/123/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('279', '3183', '123', '201810261418525470', '0', null, null, null, '完成发货', '1540534780', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('280', '3183', '124', '201810261423015070', '1', '44', '15875872793', '钟琪3', '创建订单', '1540534982', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('281', '3183', '124', '201810261423015070', '0', '1146', 'famaotang', 'famaotang', '确认订单', '1540534989', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/124', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('282', '3183', '124', '201810261423015070', '0', '1146', 'famaotang', 'famaotang', '完成发货', '1540535000', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('283', '3183', '125', '201810261427332678', '1', '44', '15875872793', '钟琪3', '创建订单', '1540535253', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('284', '3183', '125', '201810261427332678', '1', '1', 'test', '钟琪', '确认订单', '1540535362', '/famaotang/Famaotang/Orders/cancelquyorder/od_id/125/state/1', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('285', '3183', '125', '201810261427332678', '0', null, null, null, '完成发货', '1540535370', '/famaotang/Famaotang/Orders/quyodfinishship', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('286', '3183', '126', '201810261819212416', '1', '44', '15875872793', '钟琪3', '创建订单', '1540549161', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('287', '3183', '126', '201810261819212416', '0', '1146', 'test', 'test', '确认订单', '1540549180', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/126', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('288', '3183', '126', '201810261819212416', '0', '1146', 'test', 'test', '完成发货', '1540549193', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('289', '3183', '127', '201810261820579761', '1', '44', '15875872793', '钟琪3', '创建订单', '1540549257', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('290', '3183', '127', '201810261820579761', '0', '1146', 'test', 'test', '确认订单', '1540549263', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/127', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('291', '3183', '127', '201810261820579761', '0', '1146', 'test', 'test', '完成发货', '1540549275', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('292', '3183', '128', '201810261825107310', '1', '44', '15875872793', '钟琪3', '创建订单', '1540549510', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('293', '3183', '128', '201810261825107310', '0', '1146', 'test', 'test', '确认订单', '1540549513', '/famaotang/Mp/Orders/cancelorder/state/1/od_id/128', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('294', '3183', '128', '201810261825107310', '0', '1146', 'test', 'test', '完成发货', '1540549665', '/famaotang/Mp/Orders/odfinishship_save', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('295', '3183', '128', '201810261825107310', '1', '44', '15875872793', '钟琪3', '确认收货', '1541123409', '/famaotang/Famaotang/Orders/confirmreceipt/od_id/128', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('296', '3183', '129', '201811020958525902', '1', '44', '15875872793', '钟琪3', '创建订单', '1541123932', '/famaotang/Famaotang/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('297', '3183', '126', '201810261819212416', '0', '0', '', '', '系统确认收货', '1541661900', '/Mp/Index/index', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('298', '3183', '127', '201810261820579761', '0', '0', '', '', '系统确认收货', '1541661900', '/Mp/Index/index', '127.0.0.1');

-- ----------------------------
-- Table structure for fw_orders
-- ----------------------------
DROP TABLE IF EXISTS `fw_orders`;
CREATE TABLE `fw_orders` (
  `od_id` int(11) NOT NULL AUTO_INCREMENT,
  `od_unitcode` int(11) DEFAULT '0' COMMENT '企业码',
  `od_orderid` varchar(32) DEFAULT NULL COMMENT '订单号',
  `od_total` decimal(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `od_addtime` int(11) DEFAULT '0' COMMENT '下单时间',
  `od_oddlid` int(11) DEFAULT '0' COMMENT '下单的代理',
  `od_rcdlid` int(11) NOT NULL DEFAULT '0' COMMENT '上级接单代理',
  `od_belongship` int(4) DEFAULT '0' COMMENT '是否转为上家',
  `od_paypic` varchar(32) NOT NULL COMMENT '支付凭证',
  `od_contact` varchar(32) DEFAULT NULL COMMENT '收件人',
  `od_addressid` int(11) DEFAULT '0' COMMENT '地址ID',
  `od_sheng` int(11) DEFAULT '0' COMMENT '省id',
  `od_shi` int(11) DEFAULT '0' COMMENT '市id',
  `od_qu` int(11) DEFAULT '0' COMMENT '区id',
  `od_jie` int(11) DEFAULT '0' COMMENT '街id',
  `od_address` varchar(64) DEFAULT NULL COMMENT '详细地址',
  `od_tel` varchar(32) DEFAULT NULL COMMENT '电话',
  `od_express` int(11) DEFAULT '0' COMMENT '快递id',
  `od_expressnum` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `od_expressdate` int(11) DEFAULT '0' COMMENT '发货时间',
  `od_remark` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `od_dealremark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `od_state` int(11) DEFAULT '0' COMMENT '订单状态',
  `od_stead` int(11) DEFAULT '0' COMMENT '是否代客户下单',
  `od_virtualstock` int(4) NOT NULL DEFAULT '0' COMMENT '是否虚拟库存   0：不是   1：是',
  `od_fugou` int(4) NOT NULL DEFAULT '0' COMMENT '是否复购默认为1',
  `od_expressfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '快递运费',
  `od_untotall` decimal(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `od_dltype` int(11) DEFAULT '0' COMMENT '下单时的级别',
  `od_fhdlid` int(11) DEFAULT NULL,
  PRIMARY KEY (`od_id`),
  KEY `od_unitcode` (`od_unitcode`),
  KEY `od_oddlid` (`od_oddlid`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('126', '3183', '201810261819212416', '100000.00', '1540549161', '44', '0', '0', '', '钟琪3', '44', '44', '4401', '440103', '0', '广东广州荔湾区', '15875872793', '6', '464366', '1540549193', ' 选择快递', 'rtyrty', '8', '0', '0', '0', '0.00', '0.00', '7', '1');
INSERT INTO `fw_orders` VALUES ('127', '3183', '201810261820579761', '2400.00', '1540549257', '44', '0', '0', '', '钟琪3', '44', '44', '4401', '440103', '0', '广东广州荔湾区', '15875872793', '21', '26345', '1540549274', ' 选择快递', '567456', '8', '0', '0', '0', '0.00', '0.00', '7', '0');
INSERT INTO `fw_orders` VALUES ('128', '3183', '201810261825107310', '2848.00', '1540549510', '44', '0', '0', '', '钟琪3', '44', '44', '4401', '440103', '0', '广东广州荔湾区', '15875872793', '10', '343245', '1540549665', ' 选择快递', 'wertr', '8', '0', '0', '0', '0.00', '0.00', '7', '0');
INSERT INTO `fw_orders` VALUES ('129', '3183', '201811020958525902', '178000.00', '1541123932', '44', '0', '0', '3183/5bdbbc7494764735.jpeg', '钟琪3', '44', '44', '4401', '440103', '0', '广东广州荔湾区', '15875872793', '0', '', '0', ' 选择快递', null, '0', '0', '0', '0', '0.00', '0.00', '7', '0');

-- ----------------------------
-- Table structure for fw_overdue
-- ----------------------------
DROP TABLE IF EXISTS `fw_overdue`;
CREATE TABLE `fw_overdue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `offbegin` int(11) DEFAULT NULL,
  `offend` int(11) DEFAULT NULL,
  `reason` varchar(256) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='防伪码分段作废 ';

-- ----------------------------
-- Records of fw_overdue
-- ----------------------------

-- ----------------------------
-- Table structure for fw_overduecode
-- ----------------------------
DROP TABLE IF EXISTS `fw_overduecode`;
CREATE TABLE `fw_overduecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `fwcode` varchar(32) DEFAULT NULL,
  `addtime` int(11) DEFAULT '0',
  `operator` varchar(32) DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='防伪码作废';

-- ----------------------------
-- Records of fw_overduecode
-- ----------------------------

-- ----------------------------
-- Table structure for fw_payin
-- ----------------------------
DROP TABLE IF EXISTS `fw_payin`;
CREATE TABLE `fw_payin` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_unitcode` varchar(32) DEFAULT NULL,
  `pi_dlid` int(11) DEFAULT '0' COMMENT '充值代理',
  `pi_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `pi_addtime` int(11) DEFAULT '0' COMMENT '充值时间',
  `pi_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `pi_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  `pi_pic2` varchar(64) DEFAULT NULL,
  `pi_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `pi_dealremark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `pi_state` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`pi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值记录';

-- ----------------------------
-- Records of fw_payin
-- ----------------------------

-- ----------------------------
-- Table structure for fw_product
-- ----------------------------
DROP TABLE IF EXISTS `fw_product`;
CREATE TABLE `fw_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unitcode` varchar(32) DEFAULT NULL,
  `pro_typeid` int(11) DEFAULT NULL,
  `pro_name` varchar(254) DEFAULT NULL,
  `pro_number` varchar(32) DEFAULT NULL,
  `pro_barcode` varchar(64) DEFAULT NULL,
  `pro_jftype` int(4) DEFAULT '0',
  `pro_jifen` int(11) DEFAULT '0',
  `pro_jfmax` int(11) DEFAULT '0',
  `pro_dljf` int(11) DEFAULT '0' COMMENT '代理获得积分',
  `pro_pic` varchar(64) DEFAULT NULL,
  `pro_pic2` varchar(64) DEFAULT NULL,
  `pro_pic3` varchar(64) DEFAULT NULL,
  `pro_pic4` varchar(64) DEFAULT NULL,
  `pro_pic5` varchar(64) DEFAULT NULL,
  `pro_price` decimal(10,2) DEFAULT NULL,
  `pro_stock` int(11) DEFAULT '0' COMMENT '库存',
  `pro_units` varchar(32) DEFAULT NULL COMMENT '产品单位',
  `pro_dbiao` int(11) DEFAULT '0' COMMENT '产品包装比例大标',
  `pro_zbiao` int(11) DEFAULT '0' COMMENT '产品包装比例中标',
  `pro_xbiao` int(11) DEFAULT '0' COMMENT '产品包装比例小标',
  `pro_desc` text,
  `pro_link` varchar(512) DEFAULT NULL,
  `pro_expirydate` varchar(32) DEFAULT NULL COMMENT '产品有效期',
  `pro_remark` varchar(512) DEFAULT NULL,
  `pro_order` int(11) NOT NULL COMMENT '产品排序编号',
  `pro_active` int(4) DEFAULT NULL,
  `pro_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_product
-- ----------------------------
INSERT INTO `fw_product` VALUES ('1', '3183', '1', '测试1', '1', '', '1', '0', '0', '0', '3183/1539684049_9569.jpg', '3183/15248890162_4568.jpg', null, null, null, '345.00', '0', '箱', '0', '0', '0', 'sdfsdfs', '', null, '', '0', '1', '1524889016');
INSERT INTO `fw_product` VALUES ('2', '3183', '1', '测试2', '2', '', '1', '0', '0', '0', '3183/1539684035_5376.jpg', null, null, null, null, '34.00', '0', '箱', '0', '0', '0', 'sdfsdfs', '', null, '', '34', '1', '1524889608');

-- ----------------------------
-- Table structure for fw_profanli
-- ----------------------------
DROP TABLE IF EXISTS `fw_profanli`;
CREATE TABLE `fw_profanli` (
  `pfl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pfl_unitcode` varchar(32) DEFAULT NULL,
  `pfl_proid` int(11) DEFAULT '0',
  `pfl_dltype` int(11) DEFAULT '0' COMMENT '推荐级别',
  `pfl_tjdltype` int(11) DEFAULT '0' COMMENT '被推荐级别',
  `pfl_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '直推返利',
  `pfl_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '间推返利',
  `pfl_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '第三间推返利',
  `pfl_fanli4` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利4',
  `pfl_fanli5` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利5',
  `pfl_fanli6` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利6',
  `pfl_fanli7` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利7',
  `pfl_fanli8` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利8',
  `pfl_fanli9` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利9',
  `pfl_fanli10` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利10',
  `pfl_maiduan` decimal(10,2) DEFAULT '0.00' COMMENT '买断返利',
  PRIMARY KEY (`pfl_id`),
  KEY `pri_unitcode` (`pfl_unitcode`),
  KEY `pfl_unitcode` (`pfl_unitcode`),
  KEY `pfl_proid` (`pfl_proid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='产品返利设置';

-- ----------------------------
-- Records of fw_profanli
-- ----------------------------
INSERT INTO `fw_profanli` VALUES ('27', '3183', '2', '7', '7', '200.00', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('28', '3183', '1', '7', '7', '100.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('29', '3183', '2', '7', '8', '100.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('30', '3183', '1', '7', '8', '100.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('31', '3183', '2', '7', '10', '50.00', '5.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('32', '3183', '2', '8', '10', '60.00', '6.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('33', '3183', '1', '7', '10', '40.00', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `fw_profanli` VALUES ('34', '3183', '1', '8', '10', '30.00', '3.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for fw_proprice
-- ----------------------------
DROP TABLE IF EXISTS `fw_proprice`;
CREATE TABLE `fw_proprice` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_unitcode` varchar(32) DEFAULT NULL,
  `pri_proid` int(11) DEFAULT '0',
  `pri_dltype` int(11) DEFAULT '0',
  `pri_price` decimal(10,2) DEFAULT '0.00',
  `pri_minimum` int(11) DEFAULT '0' COMMENT '最低补货量',
  `pri_jifen` int(11) DEFAULT '0' COMMENT '产品积分',
  PRIMARY KEY (`pri_id`),
  KEY `pri_unitcode` (`pri_unitcode`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='产品价格体系';

-- ----------------------------
-- Records of fw_proprice
-- ----------------------------
INSERT INTO `fw_proprice` VALUES ('21', '3183', '2', '7', '178.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('22', '3183', '2', '8', '188.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('23', '3183', '2', '9', '198.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('24', '3183', '2', '10', '208.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('25', '3183', '2', '11', '218.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('26', '3183', '1', '7', '178.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('27', '3183', '1', '8', '188.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('28', '3183', '1', '9', '198.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('29', '3183', '1', '10', '208.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('30', '3183', '1', '11', '218.00', '0', '0');

-- ----------------------------
-- Table structure for fw_protype
-- ----------------------------
DROP TABLE IF EXISTS `fw_protype`;
CREATE TABLE `fw_protype` (
  `protype_id` int(11) NOT NULL AUTO_INCREMENT,
  `protype_unitcode` varchar(32) DEFAULT NULL,
  `protype_name` varchar(128) DEFAULT NULL,
  `protype_iswho` int(11) DEFAULT '0',
  `protype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`protype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_protype
-- ----------------------------
INSERT INTO `fw_protype` VALUES ('1', '3183', '护发', '0', '1');

-- ----------------------------
-- Table structure for fw_qyinfo
-- ----------------------------
DROP TABLE IF EXISTS `fw_qyinfo`;
CREATE TABLE `fw_qyinfo` (
  `qy_id` int(11) NOT NULL AUTO_INCREMENT,
  `qy_username` varchar(64) DEFAULT NULL,
  `qy_pwd` varchar(64) DEFAULT NULL,
  `qy_code` varchar(32) DEFAULT NULL,
  `qy_name` varchar(64) DEFAULT NULL,
  `qy_address` varchar(64) DEFAULT NULL,
  `qy_tel` varchar(32) DEFAULT NULL,
  `qy_fax` varchar(32) DEFAULT NULL,
  `qy_email` varchar(64) DEFAULT NULL,
  `qy_contact` varchar(32) DEFAULT NULL,
  `qy_addtime` int(11) DEFAULT NULL,
  `qy_active` int(4) DEFAULT '0',
  `qy_purview` text,
  `qy_fwkey` varchar(128) DEFAULT NULL,
  `qy_fwsecret` varchar(128) DEFAULT NULL,
  `qy_querytimes` int(11) DEFAULT '0',
  `qy_relation` varchar(64) DEFAULT NULL,
  `qy_remark` text,
  `qy_pic` varchar(64) DEFAULT NULL,
  `qy_folder` varchar(64) DEFAULT NULL,
  `qy_logintime` int(11) DEFAULT '0',
  `qy_errtimes` int(4) DEFAULT '0',
  `qy_fchpwd` varchar(64) DEFAULT NULL COMMENT '防窜货查询密码',
  `qy_admindir` int(11) DEFAULT '0' COMMENT '选择管理目录',
  PRIMARY KEY (`qy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1147 DEFAULT CHARSET=utf8 COMMENT='企业基本信息';

-- ----------------------------
-- Records of fw_qyinfo
-- ----------------------------
INSERT INTO `fw_qyinfo` VALUES ('1146', 'test', '66730c784751efc66db25382bd59bbbb', '3183', '发茂堂', '', '-', '', '', '微商L', '1524825685', '1', '10000,10001,10003,10004,10005,10008,10009,10013,10014,90000,90001,90003,90004,90005,11000,11001,11002,20000,20001,20002,20003,20004,20005,20006,30000,30001,30005,30007,30008,13000,13001,13002,13003,13004,13005,14000,14001,14002,14003,14005,70000,70001,70010,70011,70006,70007,70009,70013,70015,70018,70020,19000,80000,80001,80003,80004,80002,17000,17001,17002,20013,70016,18000,18001,18002,18004,18007,15000,15001,15002,15003,30002,30003,30004,30006', '6a70uc9YcBW1zNngxMWo1xHy8ntKzj1nLmedJSERnMr5', '62d1f298d7219c2f2c72e1b74613092e703e93ddfb2a0d7f0f96f6987bccf445', '600', '', '微商 famaotang.baibangma.com  放在康利服务器', '', 'famaotang', '1541839743', '0', null, '1');

-- ----------------------------
-- Table structure for fw_qysubuser
-- ----------------------------
DROP TABLE IF EXISTS `fw_qysubuser`;
CREATE TABLE `fw_qysubuser` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
  `su_unitcode` varchar(32) DEFAULT NULL,
  `su_username` varchar(64) DEFAULT NULL,
  `su_pwd` varchar(64) DEFAULT NULL,
  `su_openid` varchar(64) DEFAULT NULL,
  `su_wxnickname` varchar(128) DEFAULT NULL,
  `su_wxsex` int(4) DEFAULT '0',
  `su_wxprovince` varchar(32) DEFAULT NULL,
  `su_wxcity` varchar(32) DEFAULT NULL,
  `su_wxcountry` varchar(32) DEFAULT NULL,
  `su_wxheadimg` varchar(512) DEFAULT NULL,
  `su_weixin` varchar(32) DEFAULT NULL,
  `su_name` varchar(64) DEFAULT NULL,
  `su_logintime` int(11) DEFAULT NULL,
  `su_errlogintime` int(11) DEFAULT NULL,
  `su_errtimes` int(4) DEFAULT NULL COMMENT '登录错误次数 连续5次错误 锁20分钟钟',
  `su_remark` varchar(512) DEFAULT NULL,
  `su_status` int(4) DEFAULT NULL,
  `su_belong` int(11) NOT NULL DEFAULT '0' COMMENT '子用户所属 0-公司 大于0代理id',
  `su_purview` varchar(512) DEFAULT NULL COMMENT ' 权限',
  PRIMARY KEY (`su_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='企业子管理用户表 子用户发货 app发货';

-- ----------------------------
-- Records of fw_qysubuser
-- ----------------------------

-- ----------------------------
-- Table structure for fw_recash
-- ----------------------------
DROP TABLE IF EXISTS `fw_recash`;
CREATE TABLE `fw_recash` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_unitcode` varchar(32) DEFAULT NULL COMMENT '企业号',
  `rc_dlid` int(11) DEFAULT '0' COMMENT '提现代理id',
  `rc_sdlid` int(11) DEFAULT '0' COMMENT '发佣金的id 默认为公司',
  `rc_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `rc_shouxufei` decimal(10,2) DEFAULT '0.00' COMMENT '提现手续费',
  `rc_bank` int(11) DEFAULT '0' COMMENT '提现方式',
  `rc_bankcard` varchar(64) DEFAULT NULL COMMENT '提现账号 加密',
  `rc_name` varchar(32) DEFAULT NULL COMMENT '账号对应名称',
  `rc_bankname` varchar(64) DEFAULT NULL COMMENT '开户支行',
  `rc_addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `rc_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `rc_state` int(11) DEFAULT '0' COMMENT '处理状态',
  `rc_verify` varchar(64) DEFAULT NULL COMMENT '验证串',
  `rc_remark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `rc_remark2` varchar(256) DEFAULT NULL COMMENT '处理备注(仅内部看)',
  `rc_ip` varchar(64) DEFAULT NULL,
  `rc_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  PRIMARY KEY (`rc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='返利提现记录';

-- ----------------------------
-- Records of fw_recash
-- ----------------------------

-- ----------------------------
-- Table structure for fw_retchaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_retchaibox`;
CREATE TABLE `fw_retchaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_deliver` int(11) DEFAULT '0' COMMENT '退货者',
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`),
  KEY `chai_unitcode_2` (`chai_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退换拆箱记录';

-- ----------------------------
-- Records of fw_retchaibox
-- ----------------------------

-- ----------------------------
-- Table structure for fw_returnable
-- ----------------------------
DROP TABLE IF EXISTS `fw_returnable`;
CREATE TABLE `fw_returnable` (
  `ret_id` int(11) NOT NULL AUTO_INCREMENT,
  `ret_unitcode` varchar(32) DEFAULT NULL,
  `ret_number` varchar(32) DEFAULT NULL,
  `ret_deliver` int(11) DEFAULT '0' COMMENT '退货者',
  `ret_dealer` int(11) DEFAULT '0' COMMENT '退货接收者',
  `ret_pro` int(11) DEFAULT NULL,
  `ret_odid` int(11) DEFAULT '0' COMMENT '对应订单ID',
  `ret_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `ret_proqty` int(11) DEFAULT NULL,
  `ret_barcode` varchar(32) DEFAULT NULL,
  `ret_ucode` varchar(32) DEFAULT NULL,
  `ret_tcode` varchar(32) DEFAULT NULL,
  `ret_date` int(11) DEFAULT NULL,
  `ret_remark` varchar(256) DEFAULT NULL COMMENT '申请退换备注',
  `ret_type` int(4) DEFAULT '0' COMMENT '退换货类型 1-换货 2-退货',
  `ret_dealremark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `ret_status` int(11) DEFAULT '0' COMMENT '状态 默认0-新 1-同意退换 2-不同意',
  PRIMARY KEY (`ret_id`),
  KEY `ship_unitcode` (`ret_unitcode`),
  KEY `ship_barcode` (`ret_barcode`),
  KEY `ret_unitcode` (`ret_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退换货处理';

-- ----------------------------
-- Records of fw_returnable
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salemonfanlirate
-- ----------------------------
DROP TABLE IF EXISTS `fw_salemonfanlirate`;
CREATE TABLE `fw_salemonfanlirate` (
  `smfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `smfr_unitcode` varchar(32) DEFAULT NULL,
  `smfr_dltype` int(11) DEFAULT '0' COMMENT '代理级别',
  `smfr_minsale` decimal(10,2) DEFAULT '0.00' COMMENT '最小业绩',
  `smfr_maxsale` decimal(10,2) DEFAULT '0.00' COMMENT '最大业绩',
  `smfr_saleunit` int(11) DEFAULT '0' COMMENT '业绩计算单位',
  `smfr_fanlirate` decimal(10,2) DEFAULT '0.00' COMMENT '返利',
  `smfr_fanlieval` int(11) DEFAULT '0' COMMENT '奖金计算方式',
  `smfr_countdate` int(11) DEFAULT '0' COMMENT '业绩计算时间',
  `smfr_remark` varchar(265) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`smfr_id`),
  KEY `smfr_unitcode` (`smfr_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='按业绩销售奖设置';

-- ----------------------------
-- Records of fw_salemonfanlirate
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salemonthly
-- ----------------------------
DROP TABLE IF EXISTS `fw_salemonthly`;
CREATE TABLE `fw_salemonthly` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_unitcode` varchar(32) DEFAULT NULL,
  `sm_dlid` int(11) DEFAULT '0' COMMENT '收方代理',
  `sm_senddlid` int(11) DEFAULT '0' COMMENT '发方代理',
  `sm_mysale` decimal(10,2) DEFAULT '0.00' COMMENT '我的业绩',
  `sm_teamsale` decimal(10,2) DEFAULT '0.00' COMMENT '团队业绩',
  `sm_reward` decimal(10,2) DEFAULT '0.00' COMMENT '奖金',
  `sm_date` int(11) DEFAULT '0' COMMENT '计算月份',
  `sm_flid` int(11) DEFAULT '0' COMMENT '对应返利表id',
  `sm_addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `sm_state` int(11) DEFAULT '0' COMMENT '状态备用',
  `sm_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `sm_type` int(4) NOT NULL DEFAULT '0' COMMENT '团队类型',
  `sm_yjtype` int(4) NOT NULL DEFAULT '0' COMMENT '业绩类型0月1年2总',
  PRIMARY KEY (`sm_id`),
  KEY `sm_unitcode` (`sm_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='按月销量奖励返利(如：卡一西)';

-- ----------------------------
-- Records of fw_salemonthly
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salesreward
-- ----------------------------
DROP TABLE IF EXISTS `fw_salesreward`;
CREATE TABLE `fw_salesreward` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_unitcode` varchar(32) DEFAULT NULL,
  `sr_salesvolume` int(11) DEFAULT NULL COMMENT '销量',
  `sr_unitreward` decimal(10,2) DEFAULT '0.00' COMMENT '每1销量单位奖励多少',
  `sr_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `sr_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `sr_dlid` int(11) NOT NULL DEFAULT '0' COMMENT '接受奖励的代理id',
  `sr_senddlid` int(11) DEFAULT '0' COMMENT '发放奖励id 0-公司',
  `sr_flid` int(11) DEFAULT '0' COMMENT '对应返利详细里面的id',
  `sr_state` int(11) DEFAULT '1' COMMENT '状态，默认1-有效- 0-无效 与返利乡详细里状态相关',
  PRIMARY KEY (`sr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='销售累计奖励(瑧善)';

-- ----------------------------
-- Records of fw_salesreward
-- ----------------------------

-- ----------------------------
-- Table structure for fw_sellrecord
-- ----------------------------
DROP TABLE IF EXISTS `fw_sellrecord`;
CREATE TABLE `fw_sellrecord` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `sellcount` int(11) DEFAULT NULL COMMENT '理论发行数',
  `mybegin` int(11) DEFAULT NULL,
  `txttype` tinyint(4) DEFAULT NULL,
  `selldatetime` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `endflag` varchar(10) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `snyn` tinyint(4) DEFAULT NULL,
  `snbegin` varchar(30) DEFAULT NULL,
  `snend` varchar(30) DEFAULT NULL,
  `upyn` varchar(1) DEFAULT NULL,
  `voice01` varchar(250) DEFAULT NULL,
  `renote` varchar(200) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `lot_no` varchar(50) DEFAULT NULL,
  `pr_date` datetime DEFAULT NULL,
  `ex_date` datetime DEFAULT NULL,
  `exdays` int(11) DEFAULT NULL,
  `mqty` decimal(18,0) DEFAULT NULL COMMENT '实际发行数',
  `packtype` varchar(50) DEFAULT NULL,
  `pdqty` int(11) DEFAULT NULL,
  `pzqty` int(11) DEFAULT NULL,
  `pxqty` int(11) DEFAULT NULL,
  `sntype` varchar(50) DEFAULT NULL,
  `dsnf` varchar(50) DEFAULT NULL,
  `dsnt` varchar(50) DEFAULT NULL,
  `zsnf` varchar(50) DEFAULT NULL,
  `zsnt` varchar(50) DEFAULT NULL,
  `sbqty` decimal(18,0) DEFAULT NULL,
  `sxqty` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4364 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生码发行记录';

-- ----------------------------
-- Records of fw_sellrecord
-- ----------------------------
INSERT INTO `fw_sellrecord` VALUES ('4362', '3183', '50400', '1', '0', '2018-07-03 00:00:00', '', '', '', '0', '10000001', '10002520', 'N', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '50400', '2-大小包装', '1', '0', '20', '4-双码流水号2', '', '', '', '', '0', '20');
INSERT INTO `fw_sellrecord` VALUES ('4363', '3183', '53280', '50401', '0', '2018-07-03 00:00:00', '', '', '', '0', '10002521', '10004000', 'N', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '53280', '2-大小包装', '1', '0', '36', '4-双码流水号2', '', '', '', '', '0', '36');

-- ----------------------------
-- Table structure for fw_session
-- ----------------------------
DROP TABLE IF EXISTS `fw_session`;
CREATE TABLE `fw_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_session
-- ----------------------------
INSERT INTO `fw_session` VALUES ('fbd8kp3vfab5b8v0akb5iinbu7', '1542200015', 0x717969647C733A343A2231313436223B7179757365727C733A343A2274657374223B756E6974636F64657C733A343A2233313833223B71796E616D657C733A393A22E58F91E88C82E5A082223B716979655F636865636B7C733A33323A226139353035653233663338373334393765323031333036643466613164393464223B71795F707572766965777C613A37363A7B693A31303030303B733A353A223130303030223B693A31303030313B733A353A223130303031223B693A31303030333B733A353A223130303033223B693A31303030343B733A353A223130303034223B693A31303030353B733A353A223130303035223B693A31303030383B733A353A223130303038223B693A31303030393B733A353A223130303039223B693A31303031333B733A353A223130303133223B693A31303031343B733A353A223130303134223B693A39303030303B733A353A223930303030223B693A39303030313B733A353A223930303031223B693A39303030333B733A353A223930303033223B693A39303030343B733A353A223930303034223B693A39303030353B733A353A223930303035223B693A31313030303B733A353A223131303030223B693A31313030313B733A353A223131303031223B693A31313030323B733A353A223131303032223B693A32303030303B733A353A223230303030223B693A32303030313B733A353A223230303031223B693A32303030323B733A353A223230303032223B693A32303030333B733A353A223230303033223B693A32303030343B733A353A223230303034223B693A32303030353B733A353A223230303035223B693A32303030363B733A353A223230303036223B693A33303030303B733A353A223330303030223B693A33303030313B733A353A223330303031223B693A33303030353B733A353A223330303035223B693A33303030373B733A353A223330303037223B693A33303030383B733A353A223330303038223B693A31333030303B733A353A223133303030223B693A31333030313B733A353A223133303031223B693A31333030323B733A353A223133303032223B693A31333030333B733A353A223133303033223B693A31333030343B733A353A223133303034223B693A31333030353B733A353A223133303035223B693A31343030303B733A353A223134303030223B693A31343030313B733A353A223134303031223B693A31343030323B733A353A223134303032223B693A31343030333B733A353A223134303033223B693A31343030353B733A353A223134303035223B693A37303030303B733A353A223730303030223B693A37303030313B733A353A223730303031223B693A37303031303B733A353A223730303130223B693A37303031313B733A353A223730303131223B693A37303030363B733A353A223730303036223B693A37303030373B733A353A223730303037223B693A37303030393B733A353A223730303039223B693A37303031333B733A353A223730303133223B693A37303031353B733A353A223730303135223B693A37303031383B733A353A223730303138223B693A37303032303B733A353A223730303230223B693A31393030303B733A353A223139303030223B693A38303030303B733A353A223830303030223B693A38303030313B733A353A223830303031223B693A38303030333B733A353A223830303033223B693A38303030343B733A353A223830303034223B693A38303030323B733A353A223830303032223B693A31373030303B733A353A223137303030223B693A31373030313B733A353A223137303031223B693A31373030323B733A353A223137303032223B693A32303031333B733A353A223230303133223B693A37303031363B733A353A223730303136223B693A31383030303B733A353A223138303030223B693A31383030313B733A353A223138303031223B693A31383030323B733A353A223138303032223B693A31383030343B733A353A223138303034223B693A31383030373B733A353A223138303037223B693A31353030303B733A353A223135303030223B693A31353030313B733A353A223135303031223B693A31353030323B733A353A223135303032223B693A31353030333B733A353A223135303033223B693A33303030323B733A353A223330303032223B693A33303030333B733A353A223330303033223B693A33303030343B733A353A223330303034223B693A33303030363B733A353A223330303036223B693A39393939393B693A39393939393B7D);
INSERT INTO `fw_session` VALUES ('f11tlqj68qihig9ck2otnn76p0', '1542176348', 0x6A78757365725F74696D657C693A313534313831363333383B6A78757365725F69647C733A313A2231223B6A78757365725F756E6974636F64657C733A343A2233313833223B6A78757365725F757365726E616D657C733A343A2274657374223B6A78757365725F646C6E616D657C733A363A22E9929FE790AA223B);
INSERT INTO `fw_session` VALUES ('u5s41meiaqb7jv1h0efkh94ic3', '1541848308', 0x6A78757365725F74696D657C693A313534313437333837343B6A78757365725F69647C733A313A2231223B6A78757365725F756E6974636F64657C733A343A2233313833223B6A78757365725F757365726E616D657C733A343A2274657374223B6A78757365725F646C6E616D657C733A363A22E9929FE790AA223B717969647C733A343A2231313436223B7179757365727C733A343A2274657374223B756E6974636F64657C733A343A2233313833223B71796E616D657C733A393A22E58F91E88C82E5A082223B716979655F636865636B7C733A33323A226164343566316132656163643332306665303431336539303961393137633163223B71795F707572766965777C613A36333A7B693A31303030303B733A353A223130303030223B693A31303030313B733A353A223130303031223B693A31303030333B733A353A223130303033223B693A31303030343B733A353A223130303034223B693A31303030353B733A353A223130303035223B693A31303030383B733A353A223130303038223B693A31303030393B733A353A223130303039223B693A31303031333B733A353A223130303133223B693A31303031343B733A353A223130303134223B693A39303030303B733A353A223930303030223B693A39303030313B733A353A223930303031223B693A39303030333B733A353A223930303033223B693A39303030343B733A353A223930303034223B693A39303030353B733A353A223930303035223B693A31313030303B733A353A223131303030223B693A31313030313B733A353A223131303031223B693A31313030323B733A353A223131303032223B693A32303030303B733A353A223230303030223B693A32303030313B733A353A223230303031223B693A32303030323B733A353A223230303032223B693A32303030333B733A353A223230303033223B693A32303030343B733A353A223230303034223B693A32303030353B733A353A223230303035223B693A32303030363B733A353A223230303036223B693A33303030303B733A353A223330303030223B693A33303030313B733A353A223330303031223B693A33303030353B733A353A223330303035223B693A33303030373B733A353A223330303037223B693A33303030383B733A353A223330303038223B693A31333030303B733A353A223133303030223B693A31333030313B733A353A223133303031223B693A31333030323B733A353A223133303032223B693A31333030333B733A353A223133303033223B693A31333030343B733A353A223133303034223B693A31333030353B733A353A223133303035223B693A31343030303B733A353A223134303030223B693A31343030313B733A353A223134303031223B693A31343030323B733A353A223134303032223B693A31343030333B733A353A223134303033223B693A31343030353B733A353A223134303035223B693A37303030303B733A353A223730303030223B693A37303030313B733A353A223730303031223B693A37303031303B733A353A223730303130223B693A37303031313B733A353A223730303131223B693A37303030363B733A353A223730303036223B693A37303030373B733A353A223730303037223B693A37303030393B733A353A223730303039223B693A37303031333B733A353A223730303133223B693A37303031353B733A353A223730303135223B693A37303031383B733A353A223730303138223B693A37303032303B733A353A223730303230223B693A31393030303B733A353A223139303030223B693A38303030303B733A353A223830303030223B693A38303030313B733A353A223830303031223B693A38303030333B733A353A223830303033223B693A38303030343B733A353A223830303034223B693A38303030323B733A353A223830303032223B693A31373030303B733A353A223137303030223B693A31373030313B733A353A223137303031223B693A31373030323B733A353A223137303032223B693A32303031333B733A353A223230303133223B693A37303031363B733A353A223730303136223B693A39393939393B693A39393939393B7D);
INSERT INTO `fw_session` VALUES ('p4b7a7tj14086rerh6vqrj1d52', '1541923859', 0x6A78757365725F74696D657C693A313534313536333835333B6A78757365725F69647C733A313A2231223B6A78757365725F756E6974636F64657C733A343A2233313833223B6A78757365725F757365726E616D657C733A343A2274657374223B6A78757365725F646C6E616D657C733A363A22E9929FE790AA223B);
INSERT INTO `fw_session` VALUES ('992rb9md6s7nf4jiss9aspr1p2', '1542022479', 0x717969647C733A343A2231313436223B7179757365727C733A343A2274657374223B756E6974636F64657C733A343A2233313833223B71796E616D657C733A393A22E58F91E88C82E5A082223B716979655F636865636B7C733A33323A223336373831636337386562336532633734303964613930336230323739343766223B71795F707572766965777C613A36333A7B693A31303030303B733A353A223130303030223B693A31303030313B733A353A223130303031223B693A31303030333B733A353A223130303033223B693A31303030343B733A353A223130303034223B693A31303030353B733A353A223130303035223B693A31303030383B733A353A223130303038223B693A31303030393B733A353A223130303039223B693A31303031333B733A353A223130303133223B693A31303031343B733A353A223130303134223B693A39303030303B733A353A223930303030223B693A39303030313B733A353A223930303031223B693A39303030333B733A353A223930303033223B693A39303030343B733A353A223930303034223B693A39303030353B733A353A223930303035223B693A31313030303B733A353A223131303030223B693A31313030313B733A353A223131303031223B693A31313030323B733A353A223131303032223B693A32303030303B733A353A223230303030223B693A32303030313B733A353A223230303031223B693A32303030323B733A353A223230303032223B693A32303030333B733A353A223230303033223B693A32303030343B733A353A223230303034223B693A32303030353B733A353A223230303035223B693A32303030363B733A353A223230303036223B693A33303030303B733A353A223330303030223B693A33303030313B733A353A223330303031223B693A33303030353B733A353A223330303035223B693A33303030373B733A353A223330303037223B693A33303030383B733A353A223330303038223B693A31333030303B733A353A223133303030223B693A31333030313B733A353A223133303031223B693A31333030323B733A353A223133303032223B693A31333030333B733A353A223133303033223B693A31333030343B733A353A223133303034223B693A31333030353B733A353A223133303035223B693A31343030303B733A353A223134303030223B693A31343030313B733A353A223134303031223B693A31343030323B733A353A223134303032223B693A31343030333B733A353A223134303033223B693A31343030353B733A353A223134303035223B693A37303030303B733A353A223730303030223B693A37303030313B733A353A223730303031223B693A37303031303B733A353A223730303130223B693A37303031313B733A353A223730303131223B693A37303030363B733A353A223730303036223B693A37303030373B733A353A223730303037223B693A37303030393B733A353A223730303039223B693A37303031333B733A353A223730303133223B693A37303031353B733A353A223730303135223B693A37303031383B733A353A223730303138223B693A37303032303B733A353A223730303230223B693A31393030303B733A353A223139303030223B693A38303030303B733A353A223830303030223B693A38303030313B733A353A223830303031223B693A38303030333B733A353A223830303033223B693A38303030343B733A353A223830303034223B693A38303030323B733A353A223830303032223B693A31373030303B733A353A223137303030223B693A31373030313B733A353A223137303031223B693A31373030323B733A353A223137303032223B693A32303031333B733A353A223230303133223B693A37303031363B733A353A223730303136223B693A39393939393B693A39393939393B7D);

-- ----------------------------
-- Table structure for fw_sharelinks
-- ----------------------------
DROP TABLE IF EXISTS `fw_sharelinks`;
CREATE TABLE `fw_sharelinks` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_unitcode` varchar(32) DEFAULT NULL,
  `sl_brid` int(11) DEFAULT NULL,
  `sl_dealerid` int(11) DEFAULT NULL,
  `sl_level` int(11) DEFAULT '0',
  `sl_endtime` int(11) DEFAULT NULL,
  `sl_views` int(11) DEFAULT NULL,
  `sl_applynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='代理邀请链接';

-- ----------------------------
-- Records of fw_sharelinks
-- ----------------------------
INSERT INTO `fw_sharelinks` VALUES ('1', '3183', '0', '1', '0', '1542185363', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('2', '3183', '0', '1', '0', '1542186166', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('3', '3183', '0', '1', '0', '1542186527', '35', '29');
INSERT INTO `fw_sharelinks` VALUES ('4', '3183', '0', '1', '0', '1542264737', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('5', '3183', '0', '21', '0', '1542509109', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('6', '3183', '0', '32', '0', '1542534289', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('7', '3183', '0', '7', '0', '1542534989', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('8', '3183', '0', '7', '0', '1542536024', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('9', '3183', '0', '7', '0', '1542536027', '9', '8');
INSERT INTO `fw_sharelinks` VALUES ('10', '3183', '0', '7', '0', '1542536971', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('11', '3183', '0', '7', '0', '1542536973', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('12', '3183', '0', '7', '0', '1542536974', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('13', '3183', '0', '1', '0', '1543046856', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('14', '3183', '0', '43', '0', '1543061224', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('15', '3183', '0', '44', '0', '1543114618', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('16', '3183', '0', '45', '0', '1543126131', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('17', '3183', '0', '46', '0', '1543731642', '1', '1');

-- ----------------------------
-- Table structure for fw_shipment
-- ----------------------------
DROP TABLE IF EXISTS `fw_shipment`;
CREATE TABLE `fw_shipment` (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_unitcode` varchar(32) DEFAULT NULL,
  `ship_number` varchar(32) DEFAULT NULL,
  `ship_deliver` int(11) DEFAULT '0' COMMENT '出货提供者',
  `ship_dealer` int(11) DEFAULT '0' COMMENT '出货接收者',
  `ship_pro` int(11) DEFAULT NULL,
  `ship_odid` int(11) DEFAULT '0' COMMENT '对应订单ID',
  `ship_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `ship_oddtid` int(11) DEFAULT '0' COMMENT '订单详细id',
  `ship_whid` int(11) DEFAULT NULL COMMENT '出货仓库',
  `ship_proqty` int(11) DEFAULT NULL,
  `ship_barcode` varchar(32) DEFAULT NULL,
  `ship_ucode` varchar(32) DEFAULT NULL,
  `ship_tcode` varchar(32) DEFAULT NULL,
  `ship_date` int(11) DEFAULT NULL,
  `ship_remark` text,
  `ship_cztype` int(4) DEFAULT '0' COMMENT '操作者类型 0-企业主主账户  1-企业子管理用户 2-经销商',
  `ship_czid` int(11) DEFAULT '0' COMMENT '操作者ID',
  `ship_czuser` varchar(64) DEFAULT NULL,
  `ship_prodate` varchar(32) DEFAULT NULL COMMENT '产品生产日期',
  `ship_batchnum` varchar(32) DEFAULT NULL COMMENT '生产批号',
  `ship_status` int(11) DEFAULT '0' COMMENT '出货状态 默认0-正常 2-禁用',
  PRIMARY KEY (`ship_id`),
  KEY `ship_unitcode` (`ship_unitcode`),
  KEY `ship_barcode` (`ship_barcode`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_shipment
-- ----------------------------
INSERT INTO `fw_shipment` VALUES ('1', '3183', '201810301543135387', '0', '1', '1', '0', '0', '0', '2', '20', '10000001', '', '', '1541520000', '', '0', '1146', 'test', null, null, '0');

-- ----------------------------
-- Table structure for fw_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `fw_shopcart`;
CREATE TABLE `fw_shopcart` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_unitcode` varchar(32) DEFAULT NULL,
  `sc_dlid` int(11) DEFAULT '0',
  `sc_proid` int(11) DEFAULT '0',
  `sc_attrid` int(11) DEFAULT '0',
  `sc_color` varchar(16) DEFAULT NULL,
  `sc_size` varchar(16) DEFAULT NULL,
  `sc_qty` int(11) DEFAULT '0',
  `sc_addtime` int(11) DEFAULT '0',
  `sc_status` int(11) NOT NULL DEFAULT '0' COMMENT '购物车的状态',
  `sc_istrail` int(4) DEFAULT '0' COMMENT '是否是测试产品',
  `sc_virtualstock` int(4) NOT NULL DEFAULT '0' COMMENT '是否是虚库存',
  PRIMARY KEY (`sc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of fw_shopcart
-- ----------------------------
INSERT INTO `fw_shopcart` VALUES ('85', '3183', '41', '2', '5', '红色', '', '1', '1540451476', '0', '0', '0');

-- ----------------------------
-- Table structure for fw_sip
-- ----------------------------
DROP TABLE IF EXISTS `fw_sip`;
CREATE TABLE `fw_sip` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_ip` varchar(64) DEFAULT NULL,
  `s_maxfid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_sip
-- ----------------------------

-- ----------------------------
-- Table structure for fw_smsvalidate
-- ----------------------------
DROP TABLE IF EXISTS `fw_smsvalidate`;
CREATE TABLE `fw_smsvalidate` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_unitcode` varchar(32) DEFAULT NULL,
  `sms_tel` varchar(32) DEFAULT NULL,
  `sms_code` varchar(16) DEFAULT NULL,
  `sms_addtime` int(11) NOT NULL DEFAULT '0',
  `sms_sturestr` varchar(64) NOT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信验证表';

-- ----------------------------
-- Records of fw_smsvalidate
-- ----------------------------

-- ----------------------------
-- Table structure for fw_snmm
-- ----------------------------
DROP TABLE IF EXISTS `fw_snmm`;
CREATE TABLE `fw_snmm` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `codea` varchar(32) DEFAULT NULL,
  `codeb` varchar(32) DEFAULT NULL,
  `codec` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_snmm
-- ----------------------------

-- ----------------------------
-- Table structure for fw_storage
-- ----------------------------
DROP TABLE IF EXISTS `fw_storage`;
CREATE TABLE `fw_storage` (
  `stor_id` int(11) NOT NULL AUTO_INCREMENT,
  `stor_unitcode` varchar(32) DEFAULT NULL,
  `stor_number` varchar(32) DEFAULT NULL COMMENT '入库单号',
  `stor_pro` int(11) DEFAULT '0' COMMENT '入库产品id',
  `stor_whid` int(11) DEFAULT NULL COMMENT '入库仓库',
  `stor_proqty` int(11) DEFAULT '0' COMMENT '入库产品数量',
  `stor_barcode` varchar(32) DEFAULT NULL COMMENT '条码',
  `stor_ucode` varchar(32) DEFAULT NULL COMMENT '大标',
  `stor_tcode` varchar(32) DEFAULT NULL COMMENT '中标',
  `stor_date` int(11) DEFAULT NULL COMMENT '入库时间',
  `stor_remark` text,
  `stor_cztype` int(4) DEFAULT '0' COMMENT '操作者类型 0-企业主主账户  1-企业子管理用户 2-经销商',
  `stor_czid` int(11) DEFAULT '0' COMMENT '操作者ID',
  `stor_czuser` varchar(64) DEFAULT NULL,
  `stor_prodate` varchar(32) DEFAULT NULL COMMENT '产品生产日期',
  `stor_batchnum` varchar(32) DEFAULT NULL COMMENT '生产批号',
  `stor_isship` int(11) NOT NULL DEFAULT '0' COMMENT '是否已出货',
  `stor_attrid` int(11) NOT NULL COMMENT '产品颜色尺码ID',
  `stor_color` varchar(32) NOT NULL COMMENT '产品颜色',
  `stor_size` varchar(32) NOT NULL COMMENT '产品尺码',
  PRIMARY KEY (`stor_id`),
  KEY `ship_unitcode` (`stor_unitcode`),
  KEY `ship_barcode` (`stor_barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品入库';

-- ----------------------------
-- Records of fw_storage
-- ----------------------------

-- ----------------------------
-- Table structure for fw_storchaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_storchaibox`;
CREATE TABLE `fw_storchaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品入库拆箱记录';

-- ----------------------------
-- Records of fw_storchaibox
-- ----------------------------

-- ----------------------------
-- Table structure for fw_sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `fw_sysadmin`;
CREATE TABLE `fw_sysadmin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(30) DEFAULT NULL,
  `admin_pwd` varchar(64) DEFAULT NULL,
  `admin_truename` varchar(20) DEFAULT NULL,
  `admin_email` varchar(64) DEFAULT NULL,
  `admin_tel` varchar(64) DEFAULT NULL,
  `admin_des` varchar(250) DEFAULT NULL,
  `admin_purview` text,
  `admin_addtime` int(11) DEFAULT NULL,
  `admin_logintime` int(11) DEFAULT '0',
  `admin_errtimes` int(4) DEFAULT '0',
  `admin_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_sysadmin
-- ----------------------------

-- ----------------------------
-- Table structure for fw_tellist
-- ----------------------------
DROP TABLE IF EXISTS `fw_tellist`;
CREATE TABLE `fw_tellist` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0',
  `unitcode` varchar(10) DEFAULT NULL,
  `fwcode` varchar(200) DEFAULT NULL,
  `querystatu` varchar(10) DEFAULT NULL,
  `querydate` datetime DEFAULT NULL,
  `callerid` varchar(64) DEFAULT NULL,
  `calltime` int(11) DEFAULT '0',
  `remark` varchar(64) DEFAULT NULL,
  `chid` varchar(10) DEFAULT NULL,
  `upyn` varchar(10) DEFAULT NULL,
  `qutype` varchar(1) DEFAULT NULL,
  `remess` varchar(150) DEFAULT NULL,
  `k` decimal(18,0) DEFAULT '0',
  `jfqty` decimal(18,2) DEFAULT '0.00',
  `cu_name` varchar(50) DEFAULT NULL,
  `loca` varchar(30) DEFAULT NULL,
  `man_no` varchar(20) DEFAULT NULL,
  `snno` varchar(30) DEFAULT NULL,
  `sloca` varchar(30) DEFAULT NULL,
  `fcresult` varchar(50) DEFAULT NULL,
  `yun` int(4) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `unitcode` (`unitcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_tellist
-- ----------------------------

-- ----------------------------
-- Table structure for fw_templist
-- ----------------------------
DROP TABLE IF EXISTS `fw_templist`;
CREATE TABLE `fw_templist` (
  `tmp_fid` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_unitcode` varchar(32) DEFAULT NULL,
  `tmp_code` varchar(32) DEFAULT NULL,
  `tmp_state` int(4) DEFAULT '0',
  `tmp_ip` varchar(32) DEFAULT NULL,
  `tmp_addtime` int(11) DEFAULT NULL,
  `tmp_remark` varchar(512) DEFAULT NULL,
  `tmp_referer` varchar(512) DEFAULT NULL,
  `tmp_clr` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`tmp_fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_templist
-- ----------------------------

-- ----------------------------
-- Table structure for fw_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `fw_warehouse`;
CREATE TABLE `fw_warehouse` (
  `wh_id` int(11) NOT NULL AUTO_INCREMENT,
  `wh_unitcode` varchar(32) DEFAULT NULL,
  `wh_munber` varchar(64) DEFAULT NULL COMMENT '仓库编号',
  `wh_name` varchar(64) DEFAULT NULL COMMENT '仓库名称',
  `wh_address` varchar(64) DEFAULT NULL COMMENT '仓库场所地址',
  `wh_director` varchar(64) DEFAULT NULL COMMENT '仓库管理员',
  `wh_remark` text COMMENT '备注',
  PRIMARY KEY (`wh_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='仓库管理';

-- ----------------------------
-- Records of fw_warehouse
-- ----------------------------
INSERT INTO `fw_warehouse` VALUES ('2', '3183', '243', 'dfg', 'fdg', 'fdg', 'dfgh');

-- ----------------------------
-- Table structure for fw_yifuattr
-- ----------------------------
DROP TABLE IF EXISTS `fw_yifuattr`;
CREATE TABLE `fw_yifuattr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_unitcode` varchar(32) DEFAULT NULL,
  `attr_proid` int(11) DEFAULT '0',
  `attr_color` varchar(16) DEFAULT NULL,
  `attr_size` varchar(16) NOT NULL,
  `attr_stock` int(11) NOT NULL DEFAULT '0',
  `attr_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='产品服装属性';

-- ----------------------------
-- Records of fw_yifuattr
-- ----------------------------
INSERT INTO `fw_yifuattr` VALUES ('1', '3183', '1', '黑色', '', '0', '0.00');
INSERT INTO `fw_yifuattr` VALUES ('2', '3183', '1', '黄色', '', '0', '0.00');
INSERT INTO `fw_yifuattr` VALUES ('3', '3183', '1', '白色', '', '0', '0.00');
INSERT INTO `fw_yifuattr` VALUES ('4', '3183', '2', '黑色', '', '0', '0.00');
INSERT INTO `fw_yifuattr` VALUES ('5', '3183', '2', '红色', '', '0', '0.00');

-- ----------------------------
-- Table structure for fw_yufukuan
-- ----------------------------
DROP TABLE IF EXISTS `fw_yufukuan`;
CREATE TABLE `fw_yufukuan` (
  `yfk_id` int(11) NOT NULL AUTO_INCREMENT,
  `yfk_unitcode` varchar(32) DEFAULT NULL COMMENT '企业码',
  `yfk_type` int(11) DEFAULT '0' COMMENT '预付款类型',
  `yfk_sendid` int(11) DEFAULT '0' COMMENT '发款方id',
  `yfk_receiveid` int(11) DEFAULT '0' COMMENT '收款方id',
  `yfk_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `yfk_refedlid` int(11) DEFAULT '0' COMMENT '推荐返利时被推荐人的id',
  `yfk_oddlid` int(11) DEFAULT '0' COMMENT '订单返利中下单人id',
  `yfk_odid` int(11) DEFAULT '0' COMMENT '订单返利中订单id',
  `yfk_orderid` varchar(32) DEFAULT NULL COMMENT '订单返利中订单号',
  `yfk_odblid` int(11) DEFAULT '0' COMMENT '订单返利中订单关系id',
  `yfk_proid` int(11) DEFAULT '0' COMMENT '订单返利中产品id',
  `yfk_qty` int(11) DEFAULT '0' COMMENT '订单返利中产品数量',
  `yfk_level` int(11) DEFAULT '0' COMMENT '返利中的层次',
  `yfk_addtime` int(11) DEFAULT '0' COMMENT '时间',
  `yfk_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `yfk_state` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`yfk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预付款明细表';

-- ----------------------------
-- Records of fw_yufukuan
-- ----------------------------
