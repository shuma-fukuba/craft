DROP SCHEMA IF EXISTS shukatsu;

CREATE SCHEMA shukatsu;

USE shukatsu;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  tel VARChAR(255) NOT NULL,
  univercity VARCHAR(255) NOT NULL,
  undergraduage VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  school_year INT(10) NOT NULL,
  graduation_year INT(10) NOT NULL,
  gender BOOLEAN NOT NULL,
  address VARCHAR(255) NOT NULL,
  address_num VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- INSERT INTO
--   users
-- SET
--   email = 'test@posse-ap.com',
--   password = sha1('password');

DROP TABLE IF EXISTS agencies;

CREATE TABLE agencies (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email_for_notification VARCHAR(255) NOT NULL,
  tel VARCHAR(255) NOT NULL,
  url TEXT NOT NULL,
  representative VARCHAR(255) NOT NULL,
  contactor VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  address_num VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS agency_articles;
CREATE TABLE agency_articles (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  agency_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  sentenses VARCHAR(255) NOT NULL,
  eyecatch_url VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY fk_agency_id(agency_id)
  REFERENCES agencies(id)
);

DROP TABLE IF EXISTS users_agencies; -- ユーザーとエージェンシーの中間テーブル

CREATE TABLE users_agencies (
  user_id INT,
  agency_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY fk_user_id(user_id) REFERENCES users(id),
  FOREIGN KEY fk_agency_id(agency_id) REFERENCES agencies(id)
);

DROP TABLE IF EXISTS industries;

CREATE TABLE industries (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  industry VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS agency_type;

CREATE TABLE agency_type (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  agency_type VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS agencies_industories;

CREATE TABLE agencies_industories (
  agency_id INT,
  industory_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY fk_agency_id(agency_id) REFERENCES agencies(id),
  FOREIGN KEY fk_industory_id(industory_id) REFERENCES industries(id)
);

DROP TABLE IF EXISTS agencies_types; -- 中間テーブル

CREATE TABLE agencies_types (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  agency_id INT,
  type_id INT,
  FOREIGN KEY fk_agency_id(agency_id) REFERENCES agencies(id),
  FOREIGN KEY fk_type_id(type_id) REFERENCES agency_type(id)
);

DROP TABLE IF EXISTS managers;

CREATE TABLE managers (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  is_representative BOOLEAN NOT NULL,
  agency_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY fk_agency_id(agency_id) REFERENCES agencies(id)
);

DROP TABLE IF EXISTS contracts;

CREATE TABLE contracts ( -- 契約情報のテーブル v
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 契約id
  agency_id INT NOT NULL, -- エージェンシーid 外部キー成約
  contract_year_month INT NOT NUll, -- 契約年月
  claim_year_month INT NOT NULL, -- 請求年月
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY fk_agency_id(agency_id) REFERENCES agencies(id)
);

DROP TABLE IF EXISTS administorators;

CREATE TABLE administorators (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO administorators
SET
name = 'サンプル太郎',
email = 'test@posse-ap.com',
password = sha1('password');
