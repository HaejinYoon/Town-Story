CREATE DATABASE team;
USE team;
CREATE TABLE tb_user(
	id INT NOT NULL AUTO_INCREMENT,
    location VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pw VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    signupday DATETIME NOT NULL DEFAULT NOW(),
    profileurl VARCHAR(100) NOT NULL,
    introduce VARCHAR(2000) NOT NULL,
	PRIMARY KEY(id)
);

SELECT * FROM tb_user;
