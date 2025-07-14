CREATE TABLE users
(
    user_id    VARCHAR2(50) PRIMARY KEY,
    user_name  VARCHAR2(50)         NOT NULL,
    user_email VARCHAR2(100) UNIQUE NOT NULL,
    user_pw    VARCHAR2(100)        NOT NULL
);

INSERT ALL
    INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user011', '김민지', 'minji.kim@example.com', 'password111')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user012', '이서연', 'seoyeon.lee@example.com', 'password222')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user013', '박현우', 'hyunwoo.park@example.com', 'password333')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user014', '최지훈', 'jihoon.choi@example.com', 'password444')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user015', '정은채', 'eunchae.jung@example.com', 'password555')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user016', '강유나', 'yuna.kang@example.com', 'password666')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user017', '조성민', 'sungmin.cho@example.com', 'password777')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user018', '윤하늘', 'haneul.yoon@example.com', 'password888')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user019', '임시우', 'siwoo.im@example.com', 'password999')
INTO users (user_id, user_name, user_email, user_pw)
VALUES ('user020', '한예준', 'yejun.han@example.com', 'password000')
SELECT 1
FROM DUAL;

select *
from users;


CREATE TABLE destination
(
    destination_number  NUMBER(10) PRIMARY KEY,
    destination_name    VARCHAR2(255) NOT NULL,
    VARCHAR2(4),                   -- ENFP, INFP 이런 식으로 고유하게
    destination_address VARCHAR2(500),
    location_number     NUMBER(10) -- FK, location 테이블을 참조
);
-- 1: 도쿄 타워 (도쿄도 → location_number = 1)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (1, '도쿄 타워', 'ENFP', '일본 도쿄도 미나토구 시바코엔 4-2-8', 1);

-- 2: 후지산 (시즈오카현 → 2)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (2, '후지산', 'INTJ', '일본 시즈오카현 후지노미야시 기타야마', 2);

-- 3: 아라시야마 대나무숲 (교토부 → 3)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (3, '아라시야마 대나무숲', 'INFP', '일본 교토부 교토시 우쿄구 사가오구라야마 타부치야마초 1', 3);

-- 4: 오사카성 (오사카부 → 4)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (4, '오사카성', 'ESFJ', '일본 오사카부 오사카시 주오구 오사카조 1-1', 4);

-- 5: 히메지성 (효고현 → 5)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (5, '히메지성', 'ISTJ', '일본 효고현 히메지시 혼마치 68', 5);

-- 6: 후시미 이나리 타이샤 (교토부 → 3)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (6, '후시미 이나리 타이샤', 'INTP', '일본 교토부 교토시 후시미구 후카쿠사 야부노우치초 68', 3);

-- 7: 삿포로 시계탑 (홋카이도 → 6)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (7, '삿포로 시계탑', 'ISFP', '일본 홋카이도 삿포로시 주오구 기타1조 니시2초메', 6);

-- 8: 오타루 운하 (홋카이도 → 6)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (8, '오타루 운하', 'ESFP', '일본 홋카이도 오타루시 미나토마치', 6);

-- 9: 히로시마 평화기념공원 (히로시마현 → 7)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (9, '히로시마 평화기념공원', 'INFJ', '일본 히로시마현 히로시마시 나카구 나카지마초 1-2', 7);

-- 10: 슈리성 (오키나와현 → 8)
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, location_number)
VALUES (10, '슈리성', 'ENFJ', '일본 오키나와현 나하시 슈리킨조초 1-2-3', 8);

select *
from destination;

delete
from LOCATION;

drop table LOCATION;

CREATE TABLE location
(
    location_number NUMBER(10) PRIMARY KEY, -- 지역 번호 (PK)
    location_name   VARCHAR2(100) NOT NULL, -- 지역 이름 (예: 간토, 간사이 등)
    mascot_number   NUMBER(10)              -- 마스코트 번호 (FK로 쓸 수 있음)
);
INSERT INTO location (location_number, location_name, mascot_number)
VALUES (1, '도쿄도', 1);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (2, '시즈오카현', 2);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (3, '교토부', 3);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (4, '오사카부', 4);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (5, '효고현', 5);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (6, '홋카이도', 6);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (7, '히로시마현', 7);

INSERT INTO location (location_number, location_name, mascot_number)
VALUES (8, '오키나와현', 8);

CREATE TABLE mascot
(
    mascot_number   NUMBER(10) PRIMARY KEY, -- 마스코트 번호 (PK)
    mascot_name     VARCHAR2(100) NOT NULL, -- 마스코트 이름
    location_number NUMBER(10),             -- 지역 번호 (location 테이블 FK)

    CONSTRAINT fk_location
        FOREIGN KEY (location_number)
            REFERENCES location (location_number)
);
INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (1, '도쿄돔쿤', 1);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (2, '후지피', 2);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (3, '마유마로', 3);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (4, '모즈얀', 4);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (5, '시오로마루히메', 5);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (6, '멜론쿠마', 6);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (7, '히로쿠마', 7);

INSERT INTO mascot (mascot_number, mascot_name, location_number)
VALUES (8, '난지', 8);

CREATE TABLE tag_mbti
(
    mbti_category    VARCHAR2(4) PRIMARY KEY, -- ENFP, INTJ 등
    mbti_description VARCHAR2(100) NOT NULL   -- 성격 설명
);
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ENFP', '열정적이고 창의적인 활동가');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('INFP', '이상주의적이며 감성적인 중재자');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ENFJ', '타인을 이끄는 따뜻한 지도자');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('INFJ', '통찰력 있고 이상적인 조언자');

INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ENTP', '호기심 많고 논쟁을 즐기는 발명가');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('INTP', '논리적이고 호기심 많은 사색가');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ENTJ', '결단력 있고 리더십 있는 통솔자');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('INTJ', '전략적이고 분석적인 전략가');

INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ESFP', '자유롭고 에너지 넘치는 연예인');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ISFP', '유연하고 조용한 예술가');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ESFJ', '사교적이고 책임감 있는 집정관');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ISFJ', '헌신적이고 인내심 강한 수호자');

INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ESTP', '모험심 있고 활동적인 도전자');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ISTP', '냉철하고 현실적인 장인');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ESTJ', '체계적이고 지도력 있는 관리자');
INSERT INTO tag_mbti (mbti_category, mbti_description)
VALUES ('ISTJ', '현실적이고 책임감 있는 관리자');

COMMIT;

SELECT *
from tag_mbti;
SELECT *
from location;