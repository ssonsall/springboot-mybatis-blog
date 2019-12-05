### springboot-mybatis-blog

## My sql 사용자 생성, 데이터베이스 생성 및 테이블 생성
1. 사용자 생성 및 데이터베이스 생성
``CREATE TABLE user(
    id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    userProfile varchar(20000),
    createDate timestamp
) engine=InnoDB default charset=utf8;

``CREATE TABLE board(
    id int auto_increment primary key,
    userId int,
    title varchar(100) not null,
    content longtext,
    createDate timestamp,
    foreign key (userId) references user (id) on delete cascade
) engine=InnoDB default charset=utf8;
