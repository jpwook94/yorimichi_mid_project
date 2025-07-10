create table tag(
    tag_id number(3) primary key,
    tag_name varchar2(20) not null
);

create sequence tag_sequence;
drop table tag;
drop sequence tag_sequence;


insert into tag values (tag_sequence.nextval, '식도락');
insert into tag values (tag_sequence.nextval, '사진스팟');
insert into tag values (tag_sequence.nextval, '쇼핑');
insert into tag values (tag_sequence.nextval, '바다');
insert into tag values (tag_sequence.nextval, '공원');
insert into tag values (tag_sequence.nextval, '신사');
insert into tag values (tag_sequence.nextval, '친구랑');
insert into tag values (tag_sequence.nextval, '가족이랑');
insert into tag values (tag_sequence.nextval, '연인이랑');

select * from tag;

-------------------------------------------------

create table tag_category(
                    tag_category_id number(3) primary key,
                    tag_category_name varchar2(20) not null,
                    tag_category_tag_id number(3) not null
);

create sequence tag_category_sequence;


insert into tag_category values (tag_category_sequence.nextval, '목적', 1);
insert into tag_category values (tag_category_sequence.nextval, '목적', 2);
insert into tag_category values (tag_category_sequence.nextval, '목적', 3);
insert into tag_category values (tag_category_sequence.nextval, '카테고리', 4);
insert into tag_category values (tag_category_sequence.nextval, '카테고리', 5);
insert into tag_category values (tag_category_sequence.nextval, '카테고리', 6);
insert into tag_category values (tag_category_sequence.nextval, '동행자 관계', 7);
insert into tag_category values (tag_category_sequence.nextval, '동행자 관계', 8);
insert into tag_category values (tag_category_sequence.nextval, '동행자 관계', 9);


select * from tag_category;

----------------------------------------------

create table location(
    location_number number(3) primary key ,
    location_name varchar2(20) not null ,
    location_mascot_id number(3) not null
);

create sequence location_sequence;

insert into location values (location_sequence.nextval, '오사카', 1);
insert into location values (location_sequence.nextval, '도쿄', 1);
insert into location values (location_sequence.nextval, '교토', 1);
insert into location values (location_sequence.nextval, '후쿠오카', 1);

select * from location;


---------------------------------

drop table destination_tag;
drop sequence destination_tag_sequence;

create table destination_tag(
    destination_tag_id number(3) primary key ,
    destination_tag_destination_number number(3) not null ,
    destination_tag_tag_id number(3) not null
);

create sequence destination_tag_sequence;

insert into destination_tag values (destination_tag_sequence.nextval, 1, 1);
insert into destination_tag values (destination_tag_sequence.nextval, 1, 2);
insert into destination_tag values (destination_tag_sequence.nextval, 2, 2);
insert into destination_tag values (destination_tag_sequence.nextval, 3, 3);
insert into destination_tag values (destination_tag_sequence.nextval, 4, 4);
insert into destination_tag values (destination_tag_sequence.nextval, 5, 5);
insert into destination_tag values (destination_tag_sequence.nextval, 6, 6);
insert into destination_tag values (destination_tag_sequence.nextval, 7, 7);
insert into destination_tag values (destination_tag_sequence.nextval, 8, 8);
insert into destination_tag values (destination_tag_sequence.nextval, 9, 9);
insert into destination_tag values (destination_tag_sequence.nextval, 10, 10);


select * from destination_tag;