-- 데이터베이스가 없으면 새로 생성
CREATE DATABASE IF NOT EXISTS umc_db;

-- 데이터베이스 선택
USE umc_db;

-- member 테이블 생성 (존재하지 않으면 생성)
CREATE TABLE IF NOT EXISTS member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    gender ENUM('M', 'F'),
    birth DATE,
    nickname VARCHAR(50),
    address VARCHAR(50),
    phone_number VARCHAR(50),
    email VARCHAR(50),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50)
);

-- point 테이블 생성
CREATE TABLE IF NOT EXISTS point (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    point_total INT,
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id)
);

-- mission 테이블 생성
CREATE TABLE IF NOT EXISTS mission (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    mission_point INT,
    mission_detail VARCHAR(100),
    mission_number INT,
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id)
);

-- my_mission 테이블 생성
CREATE TABLE IF NOT EXISTS my_mission (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k22 BIGINT,
    k222 BIGINT,
    status VARCHAR(50),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (k22) REFERENCES member(id),
    FOREIGN KEY (k222) REFERENCES mission(id)
);

-- restaurant 테이블 생성
CREATE TABLE IF NOT EXISTS restaurant (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    k3 BIGINT,
    restaurant_name VARCHAR(50),
    restaurant_address VARCHAR(50),
    restaurant_category VARCHAR(50),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id)
);

-- inquiry 테이블 생성
CREATE TABLE IF NOT EXISTS inquiry (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    inquiry_title VARCHAR(50),
    inquiry_category VARCHAR(50),
    inquiry_content VARCHAR(500),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id)
);

-- inquiry_photo 테이블 생성
CREATE TABLE IF NOT EXISTS inquiry_photo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    k22 BIGINT,
    inquiry_photo_url VARCHAR(100),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id),
    FOREIGN KEY (k22) REFERENCES inquiry(id)
);

-- review 테이블 생성
CREATE TABLE IF NOT EXISTS review (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    review_rating DOUBLE,
    review_content VARCHAR(500),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id)
);

-- review_photo 테이블 생성
CREATE TABLE IF NOT EXISTS review_photo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    k22 BIGINT,
    review_photo_url VARCHAR(100),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id),
    FOREIGN KEY (k22) REFERENCES review(id)
);

-- food 테이블 생성
CREATE TABLE IF NOT EXISTS food (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50)
);

-- food_preference 테이블 생성
CREATE TABLE IF NOT EXISTS food_preference (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    k2 BIGINT,
    k3 BIGINT,
    food_preference VARCHAR(50),
    created_at DATETIME,
    deleted_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (k2) REFERENCES member(id),
    FOREIGN KEY (k3) REFERENCES food(id)
);
