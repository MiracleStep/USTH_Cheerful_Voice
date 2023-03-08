/*
 Navicat Premium Data Transfer

 Source Server         : txcloud_mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 124.222.253.151:3306
 Source Schema         : usth

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 16/05/2022 09:03:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `authority` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (3, '123456', '123456', NULL);
INSERT INTO `admin` VALUES (1, 'Mirac', '123456', NULL);
INSERT INTO `admin` VALUES (2, 'qqqqqq', '123456', NULL);

-- ----------------------------
-- Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count`  (
  `msgid` int(11) NOT NULL,
  `accessCount` int(11) NOT NULL,
  `replyCount` int(11) NOT NULL,
  INDEX `msg_count`(`msgid`) USING BTREE,
  CONSTRAINT `msg_count` FOREIGN KEY (`msgid`) REFERENCES `message` (`msgid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of count
-- ----------------------------
INSERT INTO `count` VALUES (23, 0, 0);
INSERT INTO `count` VALUES (24, 2, 0);
INSERT INTO `count` VALUES (25, 0, 0);
INSERT INTO `count` VALUES (26, 1, 0);
INSERT INTO `count` VALUES (27, 0, 0);
INSERT INTO `count` VALUES (28, 4, 0);
INSERT INTO `count` VALUES (29, 3, 2);
INSERT INTO `count` VALUES (30, 38, 2);
INSERT INTO `count` VALUES (31, 12, 2);
INSERT INTO `count` VALUES (32, 0, 0);
INSERT INTO `count` VALUES (33, 13, 1);
INSERT INTO `count` VALUES (34, 5, 0);
INSERT INTO `count` VALUES (35, 0, 0);
INSERT INTO `count` VALUES (36, 9, 1);
INSERT INTO `count` VALUES (37, 1, 0);
INSERT INTO `count` VALUES (39, 4, 0);
INSERT INTO `count` VALUES (40, 1, 0);
INSERT INTO `count` VALUES (41, 2, 0);
INSERT INTO `count` VALUES (42, 5, 0);
INSERT INTO `count` VALUES (43, 5, 0);
INSERT INTO `count` VALUES (44, 17, 1);
INSERT INTO `count` VALUES (45, 4, 0);
INSERT INTO `count` VALUES (46, 5, 0);
INSERT INTO `count` VALUES (47, 19, 2);
INSERT INTO `count` VALUES (48, 7, 0);
INSERT INTO `count` VALUES (49, 20, 0);
INSERT INTO `count` VALUES (50, 33, 4);
INSERT INTO `count` VALUES (51, 17, 0);
INSERT INTO `count` VALUES (52, 0, 0);
INSERT INTO `count` VALUES (53, 0, 0);
INSERT INTO `count` VALUES (54, 0, 0);
INSERT INTO `count` VALUES (55, 17, 0);
INSERT INTO `count` VALUES (56, 34, 1);
INSERT INTO `count` VALUES (57, 20, 6);

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `infoid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `infotime` datetime NULL DEFAULT NULL,
  `targeturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `infoip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(255) NULL DEFAULT NULL,
  `adminId` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`infoid`) USING BTREE,
  INDEX `user_info`(`userid`) USING BTREE,
  INDEX `admin_info`(`adminId`) USING BTREE,
  CONSTRAINT `user_info` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_info` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (41, 13, '计算机学院求实创新谋发展 齐心协力聚人才', '为贯彻落实学校“高层次人才引进工作部署会”会议精神，打破制约学院发展的关键瓶颈，解决好学院师资队伍结构严重失衡的问题，计算机学院坚持全员发力，竭尽全力；立足全院，着眼全局；深挖资源，精准对接的工作原则，全面启动2022年高层次人才引进工作。', '2022-05-03 07:45:06', 'http://www.usth.edu.cn/info/1151/9194.htm', NULL, NULL, NULL, 3);
INSERT INTO `info` VALUES (42, 13, '草树知春不久归 百般红紫斗芳菲', '春来了\n\n花骨朵儿缀上枝头\n\n干枯的树又一次冒出绿意尽情舒展。\n\n寒气悄然消散\n\n取而代之的\n\n是初春的暖阳\n\n是娇嫩的花，是盎然的绿', '2022-05-15 14:11:08', 'http://www.usth.edu.cn/info/1150/9207.htm', NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `msgtopic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msgcontents` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msgtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msgip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `theid` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT 0 COMMENT '0:正常 1:置顶 2:加精',
  PRIMARY KEY (`msgid`) USING BTREE,
  INDEX `theme_msg`(`theid`) USING BTREE,
  INDEX `user_msg`(`userid`) USING BTREE,
  CONSTRAINT `theme_msg` FOREIGN KEY (`theid`) REFERENCES `theme` (`theid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_msg` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (23, 13, '大家是如何准备高等数学的？', '感觉高等数学好难啊，该怎么准备呢？', '2021-12-20 18:23:53', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (24, 13, 'JavaWeb推荐那本书拿来自学？', '最近想学JavaWeb了，推荐几本好的书呗。。。', '2022-05-15 18:25:37', '0:0:0:0:0:0:0:1', 2, 0);
INSERT INTO `message` VALUES (25, 13, '学习使我快乐', '好好学习，天天向上，我爱学习。', '2021-12-20 18:26:09', '0:0:0:0:0:0:0:1', 18, -1);
INSERT INTO `message` VALUES (26, 13, '计算机学院明天接种加强针吗？', '计算机学院明天接种加强针吗？', '2021-12-20 18:26:48', '0:0:0:0:0:0:0:1', 2, -1);
INSERT INTO `message` VALUES (27, 2, '这个平台真方便啊', '这个平台好用，给个好评，会推荐朋友使用的', '2021-12-20 18:29:12', '0:0:0:0:0:0:0:1', 20, 0);
INSERT INTO `message` VALUES (28, 2, '关于JavaWeb问题', '当访问一个Servlet时，以下Servlet中的哪个方法先被执行？(&nbsp;)<br/>(A)&nbsp;destroy()&nbsp;(B)&nbsp;doGet()&nbsp;©&nbsp;service()&nbsp;(D)&nbsp;init0', '2022-05-12 18:30:09', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (29, 2, '宿舍可以养宠物吗？', '学校让不让养宠物呢？', '2021-12-20 18:30:43', '0:0:0:0:0:0:0:1', 2, 0);
INSERT INTO `message` VALUES (30, 2, '你们是怎么学习的呢？', '你们是怎么学习的呢？', '2021-12-20 18:31:09', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (31, 2, '出一个二手的华为Mate40', '二手华为Mate40&nbsp;pro&nbsp;128gb+8GB&nbsp;4000块钱99新，要的同学回复一下。', '2021-12-20 18:32:28', '0:0:0:0:0:0:0:1', 8, 0);
INSERT INTO `message` VALUES (32, 9, '请问想要提问老师，是在教师咨询专题下提问吗？', '请问想要提问老师，是在教师咨询专题下提问吗？', '2021-12-20 18:34:20', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (33, 9, '谁见到一食堂附近的小白猫了吗？', '好久没见那只小猫了。挺想它的', '2021-12-20 18:35:07', '0:0:0:0:0:0:0:1', 18, 0);
INSERT INTO `message` VALUES (34, 9, '今天，下雪了！！', '这雪下的真的猛啊！！', '2021-12-20 18:35:38', '0:0:0:0:0:0:0:1', 17, 0);
INSERT INTO `message` VALUES (35, 9, '再过几天就放假了，想带点特产回去。', '有推荐的特产需要带回去的吗？', '2021-12-20 18:36:21', '0:0:0:0:0:0:0:1', 2, 0);
INSERT INTO `message` VALUES (36, 9, '老师，核算检测几点开始？', '老师，核算检测几点开始？', '2021-12-20 18:36:52', '0:0:0:0:0:0:0:1', 2, 0);
INSERT INTO `message` VALUES (37, 9, '不说了，我要开始学习了', '学习了学习了学习了', '2021-12-20 18:37:38', '0:0:0:0:0:0:0:1', 1, -1);
INSERT INTO `message` VALUES (39, 13, '大家如何准备六级的?', '六级好难啊，大家如何准备六级的?', '2021-12-20 18:47:55', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (40, 2, 'JavaWeb有推荐拿来自学的视频吗？', 'JavaWeb有推荐拿来自学的视频吗？', '2022-05-14 18:48:51', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (41, 9, '大家是如何准备高等数学的？', '大家是如何准备高等数学的？', '2021-12-21 09:00:43', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (42, 9, '大家都用什么浏览器？', '大家都用什么浏览器呢？', '2021-12-21 09:01:11', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (43, 9, '百度百科好用吗？', '百度百科好用吗？', '2021-12-21 09:01:26', '0:0:0:0:0:0:0:1', 20, 0);
INSERT INTO `message` VALUES (44, 9, '有一起去太阳岛玩的同学吗？', '有一起去太阳岛玩的同学吗？', '2021-12-21 09:01:58', '0:0:0:0:0:0:0:1', 22, 0);
INSERT INTO `message` VALUES (45, 9, '学校图书馆开了吗？', '学校图书馆几号开？', '2022-04-10 21:38:59', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (46, 9, 'JavaEE该如何学习？', 'JavaEE该如何准备呢？大家有什么建议？', '2022-05-13 07:49:56', '1.189.41.215', 1, 0);
INSERT INTO `message` VALUES (47, 9, '今天做核酸吗？', '几点开始做核酸啊？', '2022-04-11 07:50:27', '1.189.41.215', 1, 0);
INSERT INTO `message` VALUES (48, 17, '五一放假吗？', '五一到底放假吗', '2022-04-11 23:18:27', '111.42.240.119', 1, 0);
INSERT INTO `message` VALUES (49, 13, '老师，几号放假？', '老师，几号放假？', '2022-04-26 14:55:01', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (50, 13, '这个平台有BUG但我又说不出是什么BUG', '哈哈哈哈哈哈', '2022-04-26 15:46:59', '0:0:0:0:0:0:0:1', 6, -1);
INSERT INTO `message` VALUES (51, 13, '大家是如何准备高等数学的？', '大家是如何准备高等数学的？', '2022-04-29 23:10:44', '0:0:0:0:0:0:0:1', 1, 0);
INSERT INTO `message` VALUES (52, 13, '大家是如何准备高等数学的？', '大家是如何准备高等数学的？', '2022-04-29 23:20:23', '0:0:0:0:0:0:0:1', 2, -1);
INSERT INTO `message` VALUES (53, 13, '大家是如何准备高等数学的？', '大家是如何准备高等数学的？', '2022-04-29 23:25:27', '0:0:0:0:0:0:0:1', 2, -1);
INSERT INTO `message` VALUES (54, 13, '大家是如何准备高等数学的？', 'window.location.href&nbsp;=&nbsp;&quot;&gt;%=basePath%&lt;user/mymsg.jsp&quot;;', '2022-04-29 23:28:08', '0:0:0:0:0:0:0:1', 6, -1);
INSERT INTO `message` VALUES (55, 13, '疫情当下，出门注意安全！', '疫情当下，出门注意安全！疫情当下，出门注意安全！疫情当下，出门注意安全！', '2022-04-30 08:13:17', '0:0:0:0:0:0:0:1', 4, 0);
INSERT INTO `message` VALUES (56, 13, '注意！今天全校停课做核酸。', '做好个人防护，注意保持间距。', '2022-05-02 20:30:41', '0:0:0:0:0:0:0:1', 24, 0);
INSERT INTO `message` VALUES (57, 13, '同时间赛跑、与病魔较量，坚决遏制疫情蔓延势头，坚决打赢疫情防控阻击战', '在疫情防控这场没有硝烟的战斗中，有人冲在最前线联防联控，有人在后方默默作奉献。其中有这么一群人，他们每天做着大量繁杂的工作，这些工作也许不耀眼，但为我市坚决打赢疫情防控阻击战歼灭战起到了功不可没的作用，他们就是南宁市新冠肺炎疫情防控指挥部的工作人员。', '2022-05-15 10:34:43', '0:0:0:0:0:0:0:1', 24, 0);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `msgid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `replycontents` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replyip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`replyid`) USING BTREE,
  INDEX `msg_reply`(`msgid`) USING BTREE,
  INDEX `user_reply`(`userid`) USING BTREE,
  CONSTRAINT `msg_reply` FOREIGN KEY (`msgid`) REFERENCES `message` (`msgid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_reply` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (27, 29, 9, '不可以', '2021-12-20 18:41:03', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (28, 29, 9, '不可以', '2021-12-20 18:41:12', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (29, 31, 9, '50包邮解君忧', '2021-12-20 18:43:34', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (30, 33, 9, '被收养了吧', '2021-12-20 22:38:52', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (32, 44, 9, '没有', '2021-12-21 09:20:15', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (33, 36, 2, '12月21号上午9点-下午11点', '2021-12-21 09:56:48', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (34, 47, 13, '下午一点开始', '2022-04-11 07:55:32', '1.189.41.215');
INSERT INTO `reply` VALUES (35, 47, 16, '挺好的', '2022-04-11 12:57:26', '43.225.208.89');
INSERT INTO `reply` VALUES (37, 30, 13, '看书', '2022-04-26 15:45:53', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (38, 30, 13, '看视频', '2022-04-26 15:46:15', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (40, 56, 13, '收到！', '2022-05-02 20:31:57', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (43, 50, 16, '什么BUG？', '2022-05-07 11:17:01', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (44, 50, 13, '不知道', '2022-05-07 11:17:48', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (45, 50, 13, '啊这', '2022-05-07 11:19:44', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (46, 50, 13, 'BUG', '2022-05-07 11:31:32', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (47, 31, 13, '多少钱？', '2022-05-07 11:32:37', '0:0:0:0:0:0:0:1');
INSERT INTO `reply` VALUES (48, 57, 13, '加油！', '2022-05-15 15:08:06', '192.168.3.6');
INSERT INTO `reply` VALUES (49, 57, 16, '必胜！', '2022-05-15 15:08:45', '192.168.3.6');
INSERT INTO `reply` VALUES (50, 57, 32, '胜利就在眼前。', '2022-05-15 15:10:15', '192.168.3.6');
INSERT INTO `reply` VALUES (51, 57, 32, '向医务工作者致敬！', '2022-05-15 15:10:32', '192.168.3.6');
INSERT INTO `reply` VALUES (52, 57, 32, '我们要做好防疫措施', '2022-05-15 15:11:05', '192.168.3.6');
INSERT INTO `reply` VALUES (53, 57, 32, '66666', '2022-05-15 15:11:20', '192.168.3.6');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `theid` int(11) NOT NULL AUTO_INCREMENT,
  `thename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`theid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '问题咨询', 0);
INSERT INTO `theme` VALUES (2, '教师咨询', 0);
INSERT INTO `theme` VALUES (4, '重要通知', 0);
INSERT INTO `theme` VALUES (6, 'BUG反馈', 0);
INSERT INTO `theme` VALUES (8, '二手买卖', 0);
INSERT INTO `theme` VALUES (17, '今日科大', 0);
INSERT INTO `theme` VALUES (18, '生活分享', 0);
INSERT INTO `theme` VALUES (20, '趣事见闻', 0);
INSERT INTO `theme` VALUES (22, '开黑交友', 0);
INSERT INTO `theme` VALUES (24, '防疫专栏', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hobbys` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0: 正常 -1:禁用',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zuidaima', 'e98626e1aeba9f40ac19a414100e1e4b', 'Alone Walk', '男', '音乐', '2021-12-17', '哈尔滨', '2585546823@qq.com', '2585546823', '2021-12-28 15:36:00', 0);
INSERT INTO `user` VALUES (2, 'qqqqqq', '42c875343777d8454219d9648f044d3e', '王海英', '女', '音乐', '2017-09-12', '石家庄', 'a@qq.com', '124', '2021-12-20 08:32:37', 0);
INSERT INTO `user` VALUES (7, 'qwerty', '086e1b7e1c12ba37cd473670b3a15214', 'sa', '女', '音乐', '2000-01-01', '济南', '1@qq.com', '6542', '2021-12-20 09:37:05', -1);
INSERT INTO `user` VALUES (8, 'nkdhfd', '2ea1f5c2bea63f6b0982fb36535a2546', 'gt', '女', '音乐', '2000-01-01', '大庆', '1@qq.com', '534', '2021-12-20 09:49:25', 0);
INSERT INTO `user` VALUES (9, 'miracmirac', 'cbcb9dc1c10119b95d8674ad22ae5e98', 'Mirac', '男', '游戏', '2021-12-17', '哈尔滨', '25823@qq.com', '2585546823', '2021-12-20 09:55:02', 0);
INSERT INTO `user` VALUES (10, 'dsertgf', 'e001280969d490df0fe6692c7be033de', 'ew', '女', '音乐', '2000-01-01', '北京', '2@163.com', '432', '2021-12-20 09:56:14', 0);
INSERT INTO `user` VALUES (13, '123456', 'ea48576f30be1669971699c09ad05c94', 'Mirac', '男', '游戏,电影', '2000-01-01', '哈尔滨', '2585546823@qq.com', '2585546823', '2021-12-20 11:00:50', 0);
INSERT INTO `user` VALUES (16, 'wdgwdg', 'b2989d30ec2001616da375b0725d4bef', '大灰', '男', '音乐', '2000-01-01', '哈尔滨', '1404991807@qq.com', '2843987', '2022-04-11 07:47:33', 0);
INSERT INTO `user` VALUES (17, '2019024124', 'a7d127109bf4e8591d92c5b63e959708', '张平中', '男', '游戏', '2000-01-01', '哈尔滨', '16456456@qq.com', '1dasdas', '2022-04-11 23:17:44', 0);
INSERT INTO `user` VALUES (18, '1234567', 'cc435cc61e91b0c2c12cdc9eb8071eb6', '苏祥', '男', '音乐', '2000-01-01', '济南', '25823@qq.com', '2843987', '2022-04-26 13:16:12', -1);
INSERT INTO `user` VALUES (24, 'adminadmin', 'ac3308b31764fc2774d1df8d3ba92f0d', '辛静姚', '女', '游戏', '2000-01-01', '哈尔滨', '2585546823@qq.com', '2585546823', '2022-05-02 11:22:38', 0);
INSERT INTO `user` VALUES (32, 'xuesheng', '137cc380a8e57544b23db7eee9cff89d', '学生用户3', '男', '游戏', '2000-01-01', '哈尔滨', '1404991807@qq.com', '2585546823', '2022-05-15 15:09:46', 0);

-- ----------------------------
-- Triggers structure for table message
-- ----------------------------
DROP TRIGGER IF EXISTS `ic`;
delimiter ;;
CREATE TRIGGER `ic` AFTER INSERT ON `message` FOR EACH ROW BEGIN
	INSERT INTO count VALUES(new.msgid, 0, 0);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table reply
-- ----------------------------
DROP TRIGGER IF EXISTS `ttt`;
delimiter ;;
CREATE TRIGGER `ttt` AFTER INSERT ON `reply` FOR EACH ROW BEGIN
              update count set replyCount=replyCount+1 where msgid=new.msgid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
