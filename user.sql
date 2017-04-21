/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : AJAXTest

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 03/29/2017 19:59:13 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'sam199510', '123456', '海宁'), ('2', 'james1986', '123344', '上海'), ('4', 'john1999', 'Qwe', '广州'), ('5', 'love1988', '123456', '克利夫兰'), ('6', 'irving1992', '12345', '克利夫兰'), ('7', 'smith1985', '1234', '克利夫兰'), ('8', 'durant1988', '1123', '金州'), ('9', 'thompson1990', '2132', '金州'), ('10', 'curry1988', '1212', '金州'), ('11', 'aldridge1985', '2345', '圣安东尼奥'), ('12', 'leonard1991', '3456', '圣安东尼奥'), ('13', 'parker1982', '686876', '圣安东尼奥'), ('14', 'harden1989', '899777789', '休斯顿'), ('15', 'anderson1988', '909098', '休斯顿'), ('16', 'gordon1988', '69079', '休斯顿'), ('17', 'ariza1985', '787654', '休斯顿'), ('18', 'williams1986', '89989899', '休斯顿'), ('19', 'beverley1988', '232332323', '休斯顿'), ('20', 'nene1982', '323443', '休斯顿'), ('21', 'dekker1994', '324234', '休斯顿'), ('22', 'capela1994', '544332', '休斯顿'), ('24', 'conley1987', '4567', '孟菲斯'), ('25', 'george1990', '456543', '印第安纳'), ('26', 'embiid1994', '987890', '费城'), ('27', 'westbrook1988', '8989899', '俄克拉荷马');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
