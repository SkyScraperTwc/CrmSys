use crmsys;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  serialnumber varchar(20) UNIQUE NOT NULL COMMENT '编号',
  username varchar(20) NOT NULL COMMENT '姓名',
  password varchar(64) NOT NULL COMMENT '密码',
  phone varchar(64) NOT NULL COMMENT '手机',
  sex varchar(10) NOT NULL COMMENT '性别 1男 2女 3保密',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user VALUES ('1', 'US85426987','twc', '123456', '13555588888', '1', current_date() , current_date());
INSERT INTO user VALUES ('2', 'US78541238','twc2', '123456', '13555588888', '2', current_date(), current_date());
INSERT INTO user VALUES ('3', 'US54456238', 'twc3', '123456', '13555588888', '3', current_date(), current_date());
INSERT INTO user VALUES ('4', 'US48484138', 'twc4', '123456', '13555588888', '1', current_date(), current_date());
INSERT INTO user VALUES ('5', 'US98556238', 'twc5', '123456', '13555588888', '2', current_date(), current_date());

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  id INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  serialnumber varchar(20) UNIQUE NOT NULL COMMENT '编号',
  name varchar(20) NOT NULL COMMENT '姓名',
  zipcode varchar(32) NOT NULL COMMENT '邮政编码',
  phone varchar (64) NOT NULL COMMENT '手机号码',
  address varchar(64) NOT NULL COMMENT '地址',
  level varchar(16) NOT NULL COMMENT '客户级别 1,普通客户 2,VIP客户',
  source varchar(16) NOT NULL COMMENT '客户来源 1，电话营销 2，网络营销 3,媒体推广',
  industry varchar(16) NOT NULL COMMENT '客户行业 1，教育培训 2，电子商务 3，对外贸易 4，酒店旅游 5，互联网',
  annualTurnover varchar(16) NOT NULL COMMENT '年营业额 1，1-10万 2，10-20万 3，20-50万 4，50-100万 5，100-500万 6，500-1000万',
  nature varchar(16) NOT NULL COMMENT '公司性质 1，民企 2，合资 3，国企',
  opportunity varchar(16) NOT NULL COMMENT '商机状态 1,意向客户 2,初步沟通 3,深度沟通 4,签订合同',
  userId varchar(64) NOT NULL COMMENT '用户ID',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE NOT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `contract`;

CREATE TABLE contract (
  id INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  serialnumber varchar(20) UNIQUE NOT NULL COMMENT '编号',
  name varchar(64) NOT NULL COMMENT '合同名字',
  type varchar(16) NOT NULL COMMENT '合同类型 1买卖合同 2租赁合同 3技术合同',
  state varchar(16) NOT NULL COMMENT '合同状态 1执行中 2结束 3意外中止',
  money DECIMAL NOT NULL COMMENT '合同金额',
  customerId varchar(32) NOT NULL COMMENT '客户ID',
  createTime DATE NOT NULL COMMENT '创建时间',
  editTime DATE NOT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

