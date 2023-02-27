CREATE USER 'asm01'@'localhost' IDENTIFIED BY 'asm01';

GRANT ALL PRIVILEGES ON * . * TO 'asm01'@'localhost';

ALTER USER 'asm01'@'localhost' IDENTIFIED WITH mysql_native_password BY 'asm01';
