SET LINESIZE 200
SET PAGESIZE 300
DROP TABLE TEAM;
DROP TABLE  WICKET_KEEPER;
DROP TABLE  PLAYER;
DROP TABLE COACH;
DROP TABLE CAPTAIN;
DROP TABLE MATCHES;
DROP TABLE PLAYS;
DROP TABLE UMPIRE;
DROP TABLE UMPIRED_BY;
create table TEAM(
 team_id varchar(30) primary key,
 team_rank number(3),
 team_name varchar(20) not null,
 country_name varchar(20),
 no_of_wins number(3),
 no_of_loses number(3),
 no_of_draws number(3),
 no_of_bowlers number(2),
 no_of_batsmans number(2)
);
create table WICKET_KEEPER(
 team_id references TEAM,
 wk_name varchar(30)
);
create table PLAYER(
 player_id varchar(30) primary key,
 team_id references TEAM,
 no_of_worldcups number(2),
 number_of_matches number(3),
 batting_average number(3),
 no_of_sixes number(3),
 no_of_fours number(3),
 no_of_totalruns number(4),
 no_of_t20 number(3),
 no_of_odi number(3),
 no_of_test number(3),
 no_of_wickets number(2),
 type_of_bowler varchar(30),
 economy number(3)
);
create table COACH(
 coach_id varchar(30) primary key,
 team_id references TEAM,
 coach_name varchar(30)
);
create table CAPTAIN(
 captain_id varchar(30) primary key,
 captain_name varchar(30),
 team_id references TEAM,
 player_id varchar(30),
 year_of_captaincy number(2),
 no_of_wins number(4)
);
create table MATCHES(
 match_id varchar(20) primary key,
 match_date date,
 match_time timestamp(0),
 team_1_name varchar(30),
 team_2_name varchar(30),
 loser varchar(30),
 winner varchar(30),
 stadium varchar(30)
);
create table PLAYS(
 team_id references TEAM,
 match_id references MATCHES
);
insert into team values(
 'IND1221', 1, 'MEN IN BLUE','INDIA', 5, 1, 0, 6, 7
);
Insert into team values(
 'AUS2174', 4, 'KANGAROO','AUSTRAILA', 3, 3, 0, 5, 6
);
Insert into team values(
 'SA5412', 3, 'PROTEA','SOUTH AFRICA', 3, 2, 1, 8, 5
);
Insert into team values(
 'NZ5687', 2, 'BLACK CAPS','NEW ZEALAND', 4, 2, 0, 6, 7
);
Insert into team values(
 'BAN9852', 5, 'TIGERS','BANGLADESH', 2, 4 , 0, 7, 7
);
insert into team values('Nl342',9,'DARKHORSES','NETHERLANDS',0,7,0,7,7);
insert into team values('sl342',9,'lIONS','SRI LANKA',0,6,0,7,7);
insert into team values('pak342',8,'MEN IN GREEN','PAKISTAN',0,6,1,7,7);
insert into team values('Eng342',7,'lions','England',1,5,0,7,7);
insert into team values('AFG342',6,'Blue tigers','Afghanistan',2,4,0,7,7);

INSERT INTO COACH VALUES ('CH417', 'IND1221', 'RAVI SHASTRI');
INSERT INTO COACH VALUES ('CH140', 'AUS2174', 'JUSTIN LANGER');
INSERT INTO COACH VALUES ('CH223', 'SA5412', 'OTTIS GIBSON');
INSERT INTO COACH VALUES ('CH398', 'NZ5687', 'GARY STEAD');
INSERT INTO COACH VALUES ('CH748', 'BAN9852', 'RUSSEL DOMINGO');

INSERT INTO COACH VALUES ('CH567', 'Nl342', 'CHRIS SILVERWOOD');
INSERT INTO COACH VALUES ('CH890', 'sl342', 'MISBAH-UL-HAQ');
INSERT INTO COACH VALUES ('CH345', 'pak342', 'PHIL SIMMONS');
INSERT INTO COACH VALUES ('CH612', 'Eng342', 'MICKEY ARTHUR');
INSERT INTO COACH VALUES ('CH932', 'AFG342', 'LANCE KLUSENER');

insert into captain values(
 'CAP11452', 'MS DHONI', 'IND1221','PLR44567', 4,56
);
insert into captain values(
 'CAP21478', 'DALE STEYN', 'SA5412','PLR10235', 7,74
);
insert into captain values(
 'CAP30214', 'MICHAEL CLARKE', 'AUS2174','PLR74138', 9,100
);
insert into captain values(
 'CAP14789', 'TAMIM IQBAL', 'BAN9852','PLR89562',2,20
);
insert into captain values(
 'CAP36957', 'ROSS TAYLOR', 'NZ5687','PLR957417', 5,85
);
drop table umpire;
create table UMPIRE(
 umpire_id varchar(30) primary key,
 umpire_name varchar(30),
 no_of_matches number(4),
 country varchar(20)
);
create table UMPIRED_BY(
 match_id references MATCHES,
 umpire_id references UMPIRE
);
alter table matches add umpire_id varchar(30);

insert into UMPIRE values (
 'UMP41002', 'Kumar Dharmasena', 103, 'Sri Lanka'
);
insert into UMPIRE values (
 'UMP74101', 'Aleem Dar', 207, 'Pakistan'
);
insert into UMPIRE values (
 'Ump52410', 'Anil Chaudhary', 19, 'India'
);
insert into UMPIRE values (
 'UMP85201', 'Ian Gould', 140, 'England'
);
insert into UMPIRE values (
 'UMP55200', 'Tony Hill', 96, 'New Zealand'
);

insert into MATCHES values(
 'MAT101',to_date('12-03-2011','dd-mmyyyy'),to_timestamp('15:30','hh24:mi'),'India','Bangladesh','Bangladesh','India','Feroz Shah 
Kotla','UMP55200'
);
insert into MATCHES values(
 'MAT201',to_date('15-03-2011','dd-mmyyyy'),to_timestamp('9:30','hh24:mi'),'England','Australia','England','Australia','Eden 
Gardens','UMP41002'
);
insert into MATCHES values(
 'MAT301',to_date('21-03-2011','dd-mm-yyyy'),to_timestamp('11:30','hh24:mi'),'Sri 
Lanka','Bangladesh','Bangladesh','Sri Lanka','M.A. Chidambaram','UMP74101'
);
insert into MATCHES values(
 'MAT401',to_date('23-03-2011','dd-mm-yyyy'),to_timestamp('15:30','hh24:mi'),'New 
Zealand','South Africa','South Africa','New Zealand','Sardar Patel','UMP85201'
);
insert into MATCHES values(
 'MAT501',to_date('26-03-2011','dd-mmyyyy'),to_timestamp('8:30','hh24:mi'),'England','India','England','India','Wankhede','Ump524
10'
);

insert into PLAYER values (
 'PLR17410', 'IND1221', 2, 13, 58,7,24,800,74,120,20,1,'medium',3.2
);
insert into PLAYER values (
 'PLR74203', 'AUS2174', 1, 6, 67, 10,39,463,41,210,140 ,1,'slow',8.5
);
insert into PLAYER values (
 'PLR45987', 'SA5412', 3, 4, 99, 4, 47,985, 24,63,65,1,'medium-slow',11.2
);
insert into PLAYER values (
 'PLR20147', 'NZ5687', 1, 12, 12, 1, 3,85, 52 ,10,74,1,'legspin',18.3
);
insert into PLAYER values (
 'PLR65200', 'BAN9852', 2, 9, 4, 0,1 ,21,77, 30,2,1,'fast',17.3
);
insert into Umpired_by values(
 'MAT501','UMP55200'
);
insert into Umpired_by values(
 'MAT301','Ump52410'
);
insert into Umpired_by values(
 'MAT101','UMP41002'
);
insert into Umpired_by values(
 'MAT401','UMP74101'
);
insert into Umpired_by values(
 'MAT201','Ump52410'
);
insert into Plays values(
 'IND1221','MAT101'
);
insert into Plays values(
 'AUS2174','MAT201'
);
insert into Plays values(
 'BAN9852','MAT301'
);
insert into Plays values(
 'NZ5687','MAT401'
);
insert into Plays values(
 'IND1221','MAT501'
);
insert into WICKET_KEEPER values(
 'IND1221','MS Dhoni'
);
insert into WICKET_KEEPER values(
 'IND1221','Dinesh Kartik'
);
insert into WICKET_KEEPER values(
 'AUS2174','Tim Lee'
);
insert into WICKET_KEEPER values(
 'AUS2174','Peter Hegward'
);
insert into WICKET_KEEPER values(
 'AUS2174','Hefer Kingsly'
);