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
    mbti_category VARCHAR2(4),                   -- ENFP, INFP 이런 식으로 고유하게
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

-- 11 ~ 48번까지 번호 순서대로 INSERT
INSERT INTO destination VALUES (11, '나카메구로 벚꽃길', 'INFP', '일본 도쿄도 메구로구 나카메구로', 1);
INSERT INTO destination VALUES (12, '하라주쿠', 'INFP', '일본 도쿄도 시부야구 진구마에', 1);
INSERT INTO destination VALUES (13, '고베 하버랜드', 'ENFP', '일본 효고현 고베시 주오구', 5);
INSERT INTO destination VALUES (14, '시모키타자와 거리', 'ENFP', '일본 도쿄도 세타가야구', 1);
INSERT INTO destination VALUES (15, '다카야마 구시가지', 'INTJ', '일본 기후현 다카야마시', 9);
INSERT INTO destination VALUES (16, '요코하마 붉은 벽돌 창고', 'INTJ', '일본 가나가와현 요코하마시 나카구', 10);
INSERT INTO destination VALUES (17, '가마쿠라 대불', 'ISTJ', '일본 가나가와현 가마쿠라시 하세', 10);
INSERT INTO destination VALUES (18, '나라 공원', 'ISTJ', '일본 나라현 나라시', 11);
INSERT INTO destination VALUES (19, '하코네 온천마을', 'ISFP', '일본 가나가와현 아시가라시모군 하코네마치', 10);
INSERT INTO destination VALUES (20, '구마모토성', 'ISFP', '일본 구마모토현 구마모토시 주오구', 12);
INSERT INTO destination VALUES (21, '도톤보리', 'ESFP', '일본 오사카부 오사카시 주오구 도톤보리', 4);
INSERT INTO destination VALUES (22, '오이타 벳푸 지옥온천', 'ESFP', '일본 오이타현 벳푸시', 13);
INSERT INTO destination VALUES (23, '가라쓰성', 'ESFJ', '일본 사가현 가라쓰시 히가시조나이', 14);
INSERT INTO destination VALUES (24, '우에노 동물원', 'ESFJ', '일본 도쿄도 다이토구 우에노 공원', 1);
INSERT INTO destination VALUES (25, '야마구치 츠노시마 대교', 'ISFJ', '일본 야마구치현 시모노세키시', 15);
INSERT INTO destination VALUES (26, '마쓰야마성', 'ISFJ', '일본 에히메현 마쓰야마시', 16);
INSERT INTO destination VALUES (27, '도야마 만', 'ISFJ', '일본 도야마현 도야마시', 17);
INSERT INTO destination VALUES (28, '기온 거리', 'INFJ', '일본 교토부 교토시 히가시야마구', 3);
INSERT INTO destination VALUES (29, '나가사키 평화공원', 'INFJ', '일본 나가사키현 나가사키시', 18);
INSERT INTO destination VALUES (30, '하코다테 야경', 'ENFJ', '일본 홋카이도 하코다테시', 6);
INSERT INTO destination VALUES (31, '나고야 성', 'ENFJ', '일본 아이치현 나고야시', 19);
INSERT INTO destination VALUES (32, '요요기 공원', 'INTP', '일본 도쿄도 시부야구', 1);
INSERT INTO destination VALUES (33, '고레카와 유적', 'INTP', '일본 아오모리현 하치노헤시', 20);
INSERT INTO destination VALUES (34, '다테야마 쿠로베 알펜루트', 'INTP', '일본 도야마현', 17);
INSERT INTO destination VALUES (35, '센다이 아오바성', 'ISTP', '일본 미야기현 센다이시', 21);
INSERT INTO destination VALUES (36, '니가타 마린피아 수족관', 'ISTP', '일본 니가타현 니가타시', 22);
INSERT INTO destination VALUES (37, '아키하바라 전자상가', 'ISTP', '일본 도쿄도 치요다구', 1);
INSERT INTO destination VALUES (38, '나라야마산 전망대', 'ISFJ', '일본 나라현 나라시', 11);
INSERT INTO destination VALUES (39, '오키나와 츄라우미 수족관', 'ISFP', '일본 오키나와현 모토부정', 8);
INSERT INTO destination VALUES (40, '오사카 유니버설 스튜디오', 'ESFP', '일본 오사카부 오사카시 고노하나구', 4);
INSERT INTO destination VALUES (41, '기후 고마키 성', 'ISTJ', '일본 기후현 고마키시', 9);
INSERT INTO destination VALUES (42, '다카마쓰 리쓰린 공원', 'INFJ', '일본 가가와현 다카마쓰시', 23);
INSERT INTO destination VALUES (43, '미에 이세 신궁', 'ISFJ', '일본 미에현 이세시', 24);
INSERT INTO destination VALUES (44, '도쿠시마 아와오도리 회관', 'ESTP', '일본 도쿠시마현 도쿠시마시', 25);
INSERT INTO destination VALUES (45, '가고시마 사쿠라지마', 'ESTP', '일본 가고시마현 가고시마시', 26);
INSERT INTO destination VALUES (46, '이바라키 히타치 해변공원', 'ESTP', '일본 이바라키현 히타치나카시', 27);
INSERT INTO destination VALUES (47, '시즈오카 오마에자키 등대', 'ESTJ', '일본 시즈오카현 오마에자키시', 2);
INSERT INTO destination VALUES (48, '치바 마쿠하리 멧세', 'ESTJ', '일본 치바현 지바시 미하마구', 28);


select *
from destination, location;

select  * from destination;
select  * from location;
select  * from mascot;

SELECT * FROM destination ORDER BY destination_number ASC;

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

create table Food(
                     food_number number(2) primary key ,
                     food_name varchar2(50) not null,
                    food_details varchar2(2000) not null
);

drop table FOOD;

insert into FOOD values (1, '초밥', '밥 위에 생선이나 해산물 톡 얹은 일본 대표 음식! 종류도 엄청 다양해!');
insert into FOOD values (2, '야끼토리', '닭고기를 꼬치에 꽂아서 노릇하게 구운 간편한 길거리 간식!');
insert into FOOD values (3, '우동', '굵고 쫄깃한 면발에 뜨끈한 국물! 추울 때 딱 생각나는 맛!');
insert into FOOD values (4, '소바', '시원하게도, 따뜻하게도 즐기는 메밀국수! 깔끔한 맛이 매력!');
insert into FOOD values (5, '스키야키', '얇게 썬 소고기랑 채소를 달달한 간장 육수에 졸여서 먹는 전골!');
insert into FOOD values (6, '라멘', '국물 진~하고 면발 쫄깃쫄깃한 일본식 국수! 간장, 된장, 소금 맛도 다양해!');
insert into FOOD values (7, '돈카츠', '두툼한 돼지고기에 바삭한 튀김옷! 겉바속촉 그 자체!');
insert into FOOD values (8, '오므라이스', '케첩 볶음밥을 부드러운 달걀로 감싼 귀엽고 맛있는 한 그릇!');
insert into FOOD values (9, '규동', '얇은 소고기랑 양파를 간장 양념에 졸여서 밥 위에 착! 든든한 덮밥!');
insert into FOOD values (10, '가라아게', '간장에 살짝 재운 닭고기를 바삭하게 튀긴 일본식 치킨!');
insert into FOOD values (11, '타코야키', '문어 들어간 반죽을 동글동글하게 구워낸 간식! 겉은 바삭, 속은 부드러워!');
insert into FOOD values (12, '오뎅', '어묵, 무, 계란 넣고 끓인 따끈한 국물 요리! 겨울에 생각나는 맛!');
insert into FOOD values (13, '텐동', '바삭한 튀김을 밥 위에 올리고 달콤한 소스 뿌려서 먹는 덮밥!');
insert into FOOD values (14, '나베', '채소랑 고기, 두부 듬뿍 넣고 끓여서 다 같이 먹는 따뜻한 전골!');
insert into FOOD values (15, '모찌', '쫀득쫀득한 찹쌀떡! 단팥 넣거나 구워 먹으면 더 맛있어!');


select *
from FOOD;

CREATE TABLE likes
(
    like_number        NUMBER(10) PRIMARY KEY,
    user_id            VARCHAR2(50) NOT NULL,
    destination_number NUMBER(10)   NOT NULL,

    CONSTRAINT fk_like_user
        FOREIGN KEY (user_id)
            REFERENCES users (user_id),

    CONSTRAINT fk_like_destination
        FOREIGN KEY (destination_number)
            REFERENCES destination (destination_number),

    CONSTRAINT uq_like_unique
        UNIQUE (user_id, destination_number) -- 중복 찜 방지
);
CREATE SEQUENCE likes_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

select * from likes;


SELECT d.destination_number, d.destination_name, d.mbti_category, d.destination_address, d.location_number
                        FROM destination d, likes l
                        where d.destination_number = l.destination_number and
                        l.user_id = 'asdf';

insert into likes values (likes_seq.nextval, 'asdf', 11);
insert into likes values (likes_seq.nextval, 'asdf', 12);
insert into likes values (likes_seq.nextval, 'asdf', 14);
insert into likes values (likes_seq.nextval, 'asdf', 15);
insert into likes values (likes_seq.nextval, 'asdf', 16);
insert into likes values (likes_seq.nextval, 'asdf', 17);
insert into likes values (likes_seq.nextval, 'asdf', 18);
insert into likes values (likes_seq.nextval, 'asdf', 19);