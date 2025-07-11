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
    mbti_category       VARCHAR2(4),
    destination_address VARCHAR2(500),
    destination_image   VARCHAR2(500),
    location_number     NUMBER(10) -- FK, location 테이블을 참조
);

INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (1, '도쿄 타워', 'ESTJ', '도쿄도 미나토구 시바코엔 4초메 2-8', '/images/tokyo_tower.jpg', 1);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (2, '후시미 이나리 신사', 'INFJ', '교토시 후시미구 후카쿠사 야부노우치초 68', '/images/fushimi_inari.jpg', 2);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (3, '도톤보리', 'ESFP', '오사카시 주오구 도톤보리', '/images/dotonbori.jpg', 3);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (4, '삿포로 눈 축제', 'ENFP', '홋카이도 삿포로시 주오구 오도리니시', '/images/sapporo_snow_festival.jpg', 4);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (5, '오키나와 츄라우미 수족관', 'INFP', '오키나와현 구니가미군 모토부초 이시카와 424', '/images/churaumi_aquarium.jpg', 5);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (6, '히메지성', 'ISTJ', '효고현 히메지시 혼마치 68', '/images/himeji_castle.jpg', 6);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (7, '아라시야마 대나무 숲', 'ISFP', '교토시 우쿄구 사가텐류지 스스키노바바초', '/images/arashiyama.jpg', 2);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (8, '지코쿠다니 원숭이 공원', 'ISTP', '나가노현 시모타카이군 야마노우치마치 히라오 6845', '/images/jigokudani_monkey_park.jpg', 7);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (9, '하코네 조각의 숲 미술관', 'INTP', '가나가와현 아시가라시모군 하코네마치 니노타이라 1121', '/images/hakone_open_air_museum.jpg', 8);
INSERT INTO destination (destination_number, destination_name, mbti_category, destination_address, destination_image,
                         location_number)
VALUES (10, '시라카와고 합장촌', 'ISFJ', '기후현 오노군 시라카와무라 오기마치', '/images/shirakawago.jpg', 9);

select *
from destination;

select * from LOCATION;

update LOCATION set LOCATION_MASCOT_ID=4 where LOCATION_NUMBER=4;