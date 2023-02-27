CREATE DATABASE  IF NOT EXISTS `asm01_tables`;

USE `asm01_tables`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE user (
  id int NOT null auto_increment primary key,
  address varchar(255),
  email varchar(255),
  full_name varchar(255),
  phone_number varchar(255),
  status int,
  user_name varchar(255),
  role varchar(255),
  password varchar(255)
);

Insert into user (address, email, full_name, phone_number, status, user_name, role ) values
("Hà Nội", "0@gmail.com", "Quản trị", "000", 0, "admin", "Admin"),
("Hồ Chí Minh", "1@gmail.com", "Hitotsu", "001", 0, "ichi", "User"),
("Đà Nẵng", "2@gmail.com", "Futatsu", "010", 0, "ni", "User"),
("Bình Dương", "3@gmail.com", "Mittsu", "011", 0, "san", "User"),
("Bắc Ninh", "4@gmail.com", "Yottsu", "100", 0, "yon", "User"),
("Thái Nguyên", "5@gmail.com", "Itsutsu", "101", 0, "go", "User"),
("Đồng Nai", "6@gmail.com", "Muttsu", "110", 0, "roku", "User"),
("Quảng Ninh", "7@gmail.com", "Nanatsu", "111", 0, "nana", "User");

DROP TABLE IF EXISTS `donation` ;

CREATE TABLE donation(
  id int NOT null auto_increment primary key,
  code varchar(255),
  description varchar(255),
  start_date varchar(255),
  end_date varchar(255),
  money int default 0,
  name varchar(255),
  organization_name varchar(255),
  phone_number varchar(255),
  status int default 0
);

Insert into donation (code, description, start_date, end_date, name, organization_name, phone_number, status) values
("01", "Trao tặng 10 ca phẫu thuật", "02/01/2022", "02/28/2022", "Trao tặng 10 ca phẫu thuật", "Hội chữ thập đỏ", "000", 0),
("02", "Tặng 30 suất học bổng", "02/01/2022", "02/28/2022", "Tặng 30 suất học bổng", "Hội chữ thập đỏ", "001", 0),
("03", "Gây quỹ đoàn viên", "02/01/2022", "02/28/2022", "Gây quỹ đoàn viên", "Hội chữ thập đỏ", "010", 0),
("04", "Mang 10 thư viện đến trẻ em", "02/01/2022", "02/28/2022", "Mang 10 thư viện đến trẻ em", "Hội chữ thập đỏ", "011", 0),
("05", "Chung tay quỹ xây nhà", "02/01/2022", "02/28/2022", "Chung tay quỹ xây nhà", "Hội chữ thập đỏ", "100", 0),
("06", "Đem nước sạch về xóm", "02/01/2022", "02/28/2022", "Đem nước sạch về xóm", "Hội chữ thập đỏ", "101", 0),
("07", "Chung tay gây quỹ trồng cây", "02/01/2022", "02/28/2022", "Chung tay gây quỹ trồng cây", "Hội chữ thập đỏ", "110", 0),
("08", "Cùng xây dựng điểm trường", "02/01/2022", "02/28/2022", "Cùng xây dựng điểm trường", "Hội chữ thập đỏ", "111", 0);

DROP TABLE IF EXISTS `userdonation`;

CREATE TABLE userdonation(
  id int NOT Null auto_increment primary key,
  name varchar(255),
  money int default 0,
  status int default 0,
  text varchar(255),
  created varchar(255),
  donation_id int
);

Insert into userdonation (name, money, status, text, donation_id) values
("Haru", 100000, 0, "Saluton", 1),
("Haru", 100000, 1, "Saluton", 1),
("Haru", 100000, 2, "Saluton", 1),
("Natsu", 200000, 0, "Saluton", 2),
("Natsu", 200000, 1, "Saluton", 2),
("Natsu", 200000, 2, "Saluton", 2),
("Aki", 300000, 0, "Saluton", 3),
("Aki", 300000, 1, "Saluton", 3),
("Aki", 300000, 2, "Saluton", 3),
("Fuyu", 400000, 0, "Saluton", 4),
("Fuyu", 400000, 1, "Saluton", 4),
("Fuyu", 400000, 2, "Saluton", 4);
