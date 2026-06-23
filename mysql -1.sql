show databases;
create database Student;
use Student;
show tables;
create table Details (s_no int,Name varchar(40),Department varchar(30),Reg_no varchar(15),year varchar(10));
select * from Details;
describe Details;
insert into details values (1,"kavya","CSE-DS","24hr1a3226","2024-2028"),
(2,"navya","CSE-DS","24hr1a3236","2024-2028"),
(3,"roopa","CSE-DS","24hr1a3223","2024-2028"),
(4,"hari","CSE-DS","24hr1a3261","2024-2028"),
(5,"upesh","CSE-DS","24hr1a3263","2024-2028"),
(6,"vidhya","CSE","24hr1a3200","2024-2028");
select  Name,Reg_no from details order by Reg_no desc;
select name from Details where Department = "CSE-DS";

