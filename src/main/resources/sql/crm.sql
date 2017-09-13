use crmsys;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  username varchar(20) NOT NULL COMMENT '姓名',
  password varchar(64) NOT NULL COMMENT '密码',
  phone varchar(64) NOT NULL COMMENT '手机',
  sex varchar(10) NOT NULL COMMENT '性别 1男 2女 3保密',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user VALUES ('1', 'twc', '123456', '13555588888', '1', current_date() , current_date());
INSERT INTO user VALUES ('2', 'twc2', '123456', '13555588888', '2', current_date(), current_date());
INSERT INTO user VALUES ('3', 'twc3', '123456', '13555588888', '2', current_date(), current_date());

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  id INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(20) NOT NULL COMMENT '姓名',
  zipcode varchar(32) NOT NULL COMMENT '邮政编码',
  phone varchar (64) NOT NULL COMMENT '手机号码',
  address varchar(64) NOT NULL COMMENT '地址',
  level varchar(16) NOT NULL COMMENT '客户级别 1,普通客户 2,VIP客户',
  source varchar(16) NOT NULL COMMENT '客户来源 1，电话营销 2，网络营销 3,媒体推广',
  industry varchar(16) NOT NULL COMMENT '客户行业 1，教育培训 2，电子商务 3，对外贸易 4，酒店旅游 5，互联网',
  annualTurnover varchar(16) NOT NULL COMMENT '年营业额 1，1-10万 2，10-20万 3，20-50万 4，50-100万 5，100-500万 6，500-1000万',
  nature varchar(16) NOT NULL COMMENT '公司性质 1，民企 2，合资 3，国企',
  status varchar(16) NOT NULL COMMENT '客户状态 1，基础客户 2，潜在客户 3，成功客户 4，无效客户',
  opportunity varchar(16) NOT NULL COMMENT '商机状态 1,意向客户 2,初步沟通 3,深度沟通 4,签订合同',
  userId varchar(64) NOT NULL COMMENT '用户ID',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE NOT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','200-500万','民企','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','500-1000万','国企','基础客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','200-500万','合资','成功客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','500-1000万','民企','潜在客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','50-200万','国企','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','电子商务','1-50万','合资','潜在客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','500-1000万','民企','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','500-1000万','合资','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','1-50万','民企','潜在客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','50-200万','国企','无效客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','50-200万','合资','潜在客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','500-1000万','民企','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','500-1000万','国企','无效客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1-50万','国企','无效客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','50-200万','国企','基础客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','电子商务','500-1000万','民企','无效客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','1000万以上','民企','无效客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','1-50万','国企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','1000万以上','合资','成功客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','酒店旅游','200-500万','民企','潜在客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','1-50万','民企','潜在客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','酒店旅游','200-500万','民企','成功客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','500-1000万','民企','成功客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','1000万以上','民企','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','1000万以上','合资','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','1-50万','国企','基础客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','500-1000万','合资','基础客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','50-200万','合资','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','教育培训','1000万以上','合资','成功客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','1000万以上','民企','潜在客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','50-200万','合资','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1-50万','民企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','50-200万','合资','无效客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1000万以上','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','200-500万','国企','潜在客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','200-500万','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1000万以上','民企','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','50-200万','合资','成功客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','1-50万','合资','基础客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','教育培训','50-200万','合资','潜在客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','50-200万','合资','成功客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','200-500万','合资','基础客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','教育培训','1000万以上','合资','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','1-50万','民企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','50-200万','国企','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','1000万以上','国企','无效客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','500-1000万','民企','成功客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','200-500万','合资','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','200-500万','合资','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','1-50万','国企','潜在客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','50-200万','国企','成功客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','200-500万','国企','潜在客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','1000万以上','民企','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','1-50万','合资','潜在客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','1-50万','国企','无效客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','200-500万','合资','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','教育培训','1000万以上','国企','无效客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','50-200万','民企','成功客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','500-1000万','国企','潜在客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1-50万','国企','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','酒店旅游','500-1000万','国企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','500-1000万','合资','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','50-200万','合资','基础客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','教育培训','1000万以上','国企','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','酒店旅游','200-500万','合资','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','1-50万','合资','无效客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','教育培训','1-50万','国企','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','500-1000万','民企','基础客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','500-1000万','合资','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','200-500万','民企','成功客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','500-1000万','民企','无效客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','500-1000万','国企','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','50-200万','国企','潜在客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','200-500万','合资','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1000万以上','合资','成功客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1-50万','国企','基础客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','200-500万','民企','潜在客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','1-50万','合资','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','酒店旅游','1000万以上','民企','基础客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','电子商务','200-500万','合资','无效客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','200-500万','民企','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','50-200万','民企','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','教育培训','500-1000万','民企','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','200-500万','合资','基础客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','500-1000万','国企','潜在客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','1000万以上','国企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','50-200万','国企','成功客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','教育培训','50-200万','民企','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','电子商务','50-200万','合资','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','1-50万','民企','无效客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','200-500万','合资','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','教育培训','500-1000万','合资','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','500-1000万','国企','基础客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','互联网','50-200万','国企','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','50-200万','民企','基础客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','50-200万','合资','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','50-200万','民企','潜在客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','200-500万','国企','成功客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','50-200万','国企','潜在客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','1-50万','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','1000万以上','国企','成功客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','1-50万','合资','潜在客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','1000万以上','国企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','50-200万','国企','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','电子商务','500-1000万','国企','无效客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','200-500万','民企','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','1000万以上','合资','基础客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','1000万以上','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','500-1000万','合资','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','500-1000万','民企','潜在客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','50-200万','民企','潜在客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','电子商务','200-500万','国企','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','教育培训','50-200万','民企','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1-50万','合资','成功客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','200-500万','合资','基础客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','500-1000万','国企','成功客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','1000万以上','合资','潜在客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','500-1000万','国企','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','1-50万','民企','无效客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','500-1000万','民企','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','1-50万','国企','无效客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','500-1000万','民企','无效客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','500-1000万','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','互联网','1000万以上','国企','无效客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1-50万','国企','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','电子商务','1000万以上','民企','基础客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','教育培训','200-500万','国企','基础客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','200-500万','民企','成功客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','酒店旅游','1000万以上','合资','基础客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','200-500万','民企','无效客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','50-200万','合资','成功客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','1000万以上','国企','成功客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','酒店旅游','50-200万','合资','潜在客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','500-1000万','民企','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','1000万以上','合资','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','电子商务','50-200万','国企','成功客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','1000万以上','合资','潜在客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','酒店旅游','200-500万','民企','无效客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','1-50万','民企','成功客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','1000万以上','合资','成功客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','50-200万','民企','基础客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','200-500万','国企','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','500-1000万','民企','潜在客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','1000万以上','合资','成功客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','50-200万','国企','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','500-1000万','民企','基础客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','200-500万','民企','成功客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','酒店旅游','1-50万','国企','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','50-200万','国企','潜在客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','酒店旅游','200-500万','国企','成功客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','1000万以上','民企','成功客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','200-500万','国企','潜在客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','1000万以上','国企','成功客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','50-200万','国企','潜在客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','200-500万','国企','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','教育培训','200-500万','国企','无效客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','200-500万','合资','基础客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','酒店旅游','1000万以上','国企','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','200-500万','国企','成功客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','对外贸易','50-200万','合资','基础客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','教育培训','50-200万','合资','基础客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','酒店旅游','200-500万','合资','无效客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','1000万以上','民企','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','教育培训','1000万以上','民企','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','500-1000万','国企','潜在客户','初步沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','1-50万','民企','基础客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','对外贸易','1000万以上','国企','成功客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','1-50万','合资','潜在客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','50-200万','国企','基础客户','深度沟通','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','1000万以上','国企','成功客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','200-500万','合资','基础客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','1000万以上','民企','无效客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','1000万以上','民企','无效客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','200-500万','合资','基础客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','50-200万','民企','基础客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','电子商务','50-200万','合资','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','500-1000万','国企','无效客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','对外贸易','50-200万','合资','基础客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','网络营销','互联网','500-1000万','合资','基础客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','互联网','500-1000万','民企','基础客户','初步沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','50-200万','国企','无效客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','教育培训','1000万以上','合资','成功客户','深度沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','对外贸易','500-1000万','合资','潜在客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','对外贸易','1-50万','合资','无效客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1-50万','民企','基础客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','1000万以上','国企','潜在客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','酒店旅游','50-200万','民企','成功客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','电子商务','1-50万','国企','基础客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','1000万以上','国企','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','1000万以上','民企','潜在客户','意向客户','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','教育培训','200-500万','国企','基础客户','签订合同','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','互联网','1-50万','合资','基础客户','意向客户','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','网络营销','电子商务','1-50万','国企','基础客户','意向客户','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','50-200万','合资','无效客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', '普通客户','网络营销','酒店旅游','1-50万','民企','基础客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', 'VIP客户','媒体推广','互联网','500-1000万','合资','无效客户','深度沟通','1',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','媒体推广','电子商务','1000万以上','民企','成功客户','初步沟通','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马化腾','200200', '13888888888', '北京三里桥', '普通客户','电话营销','对外贸易','200-500万','国企','基础客户','签订合同','3',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '马云','200200', '13888888888', '北京三里桥', 'VIP客户','电话营销','电子商务','1-50万','合资','潜在客户','签订合同','2',current_date(),current_date());
INSERT INTO `customer` VALUES ('0', '李彦宏','200200', '13888888888', '北京三里桥', '普通客户','电话营销','互联网','1-50万','民企','潜在客户','深度沟通','2',current_date(),current_date());


DROP TABLE IF EXISTS `contract`;

CREATE TABLE contract (
  id INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  name varchar(64) NOT NULL COMMENT '合同名字',
  type varchar(16) NOT NULL COMMENT '合同类型 1买卖合同 2租赁合同 3技术合同',
  state varchar(16) NOT NULL COMMENT '合同状态 1执行中 2结束 3意外中止',
  money DECIMAL NOT NULL COMMENT '合同金额',
  customerId varchar(32) NOT NULL COMMENT '客户ID',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE NOT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO contract VALUES ('1', '离婚协议', '1', '1', 2000,'1',current_date(),current_date());
INSERT INTO contract VALUES ('2', '遗赠抚养协议', '2', '2', 2000,'2',current_date(),current_date());
INSERT INTO contract VALUES ('3', '人事代理协议', '3', '3', 2000,'3',current_date(),current_date());
INSERT INTO contract VALUES ('4', '商品房买卖合同', '1', '1', 2000,'4',current_date(),current_date());
INSERT INTO contract VALUES ('5', '竟业禁止协议', '2', '2', 2000,'1',current_date(),current_date());
INSERT INTO contract VALUES ('6', '土地使用权出让转让合同', '3', '3',2000, '5',current_date(),current_date());
INSERT INTO contract VALUES ('7', '抵押合同', '1', '1', 2000,'6',current_date(),current_date());
INSERT INTO contract VALUES ('8', '贷款合同', '2', '2', 2000,'7',current_date(),current_date());
INSERT INTO contract VALUES ('9', '物业管理合同', '3', '3', 2000,'8',current_date(),current_date());
INSERT INTO contract VALUES ('10', '建筑工程建设安装承包合同', '1', '1',2000, '9',current_date(),current_date());
INSERT INTO contract VALUES ('11', '采购合同', '2', '2', 2000,'10',current_date(),current_date());
INSERT INTO contract VALUES ('12', '运输合同', '3', '3', 2000,'11',current_date(),current_date());
INSERT INTO contract VALUES ('13', '进出口合同', '1', '1', 2000,'12',current_date(),current_date());
INSERT INTO contract VALUES ('14', '补偿贸易合同', '2', '2', 2000,'13',current_date(),current_date());
INSERT INTO contract VALUES ('15', '供应合同', '3', '3', 2000,'14',current_date(),current_date());
INSERT INTO contract VALUES ('16', '技术服务合同', '1', '1', 2000,'15',current_date(),current_date());
INSERT INTO contract VALUES ('17', '技术咨询协议', '2', '2', 2000,'16',current_date(),current_date());
INSERT INTO contract VALUES ('18', '技术开发协议', '3', '3', 2000,'17',current_date(),current_date());
INSERT INTO contract VALUES ('19', '技术转让协议', '1', '1', 2000,'18',current_date(),current_date());
INSERT INTO contract VALUES ('20', '许可协议', '2', '2', 2000,'19',current_date(),current_date());
INSERT INTO contract VALUES ('21', '保险合同', '3', '3', 2000,'20',current_date(),current_date());
INSERT INTO contract VALUES ('22', '提存协议', '1', '1', 2000,'21',current_date(),current_date());
INSERT INTO contract VALUES ('23', '服务合同', '2', '2', 2000,'22',current_date(),current_date());
INSERT INTO contract VALUES ('24', '风险投资管理协议', '3', '3',2000, '23',current_date(),current_date());