## springboot-mybatis-blog

#### Main 화면
![메인화면](https://user-images.githubusercontent.com/55569886/70209661-37eac780-1774-11ea-80ce-5aea64ecb8de.png)

#### My sql 사용자 생성, 데이터베이스 생성 및 테이블 생성
1. 사용자 생성 및 데이터베이스 생성
```sql
create user 'blogmybatis'@'%' identified by 'bitc5600';
GRANT ALL PRIVILEGES ON *.* TO 'blogmybatis'@'%';
create database blogmybatis;
use blogmybatis;
show tables;
```
2. 테이블 생성
```sql
CREATE TABLE user(
    id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    userProfile varchar(20000),
    createDate timestamp
) engine=InnoDB default charset=utf8;
```

```sql
CREATE TABLE board(
    id int auto_increment primary key,
    userId int,
    title varchar(100) not null,
    content longtext,
    createDate timestamp,
    foreign key (userId) references user (id) on delete cascade
) engine=InnoDB default charset=utf8;
```
