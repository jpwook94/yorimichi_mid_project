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

select * from users;