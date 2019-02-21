set names utf8;
drop database if exists xiaofeiniu;
create database xiaofeiniu charset=utf8;
use xiaofeiniu;


/*管理员*/
create table xfn_admin(
    aid int primary key auto_increment,
    aname varchar(32) unique,
    apwd varchar(64)
);
insert into xfn_admin values
(null,"admin",password("123456")),
(null,"boss",password("999999"));
 
 /*全局设置*/
 create table xfn_settings(
    sid int primary key auto_increment,
    appName varchar(32),
    apiUrl varchar(64),
    admiUrl varchar(64),
    appUrl varchar(64),
    icp varchar(64),
    copyright varchar(128)
);
insert into xfn_settings values
(null,"小肥牛",'http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092',
'京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有'
);
/*桌台表*/
create table xfn_table(
    tid int primary key auto_increment,
    tname varchar(32),
    type varchar(32),
    status int
);
insert into xfn_table values
(null,'福满堂','6-8人桌',1),
(null,'金镶玉','4人桌',2),
(null,'寿齐天','10人桌',3),
(null,'全家福','2人桌',0);
/*卓台的预定信息*/
create table xfn_reservation(
    rid int primary key auto_increment,
    contactName varchar(32),
    phone varchar(16),
    contactTime bigint,
    dinnerTime bigint
);
insert into xfn_reservation values
(null,'丁丁','12584218511',1550651914449,1547546400000),
(null,'当当','12584218511',1550651925589,1547546400000),
(null,'丫丫','12584218511',1550651938959,1547546400000),
(null,'豆豆','12584218511',1550651945649,1547546400000);
/*菜品类别表*/
create table xfn_category(
    cid int primary key auto_increment,
    cname varchar(32)
    
);
insert into xfn_category values
(null,'肉类'),
(null,'丸子'),
(null,'蔬菜豆制品'),
(null,'海鲜河鲜'),
(null,'菌菇');
/*菜品*/
CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categoryId INT,
  FOREIGN KEY(categoryId) REFERENCES xfn_category(cid)
);
insert into xfn_dish values
(100000,'草鱼片','CE7I7004_dx.jpg',35,'将活虾冷冻而成。肉质脆嫩，锅开后再煮4分钟左右即可食用。',1),
(null,'鱼豆腐','CE7I9538_ydg.jpg',25,'选用优质鱼肉，配以佐料，搅打、蒸制而成。细嫩鲜滑，鱼香味浓。锅开后再煮2分钟左右即可食用。',1);

 /*订单*/
 CREATE TABLE xfn_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
insert into xfn_order values
(1,1550651914449,1550651918549,3,1);
/*订单详情*/
CREATE TABLE xfn_order_detail(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT,       /*菜品编号*/
  dishCount INT,    /*份数*/
  customerName VARCHAR(32),    /*顾客名称*/
  orderId INT,      /*订单编号*/
  FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
  FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
insert into xfn_order_detail values
(null,100001,1,'丁丁',1);