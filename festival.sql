drop table if exists Worker cascade;
drop table if exists Band cascade;
drop table if exists Member cascade;
drop table if exists Stage cascade;
drop table if exists Gig cascade;
drop table if exists security cascade;

create table Worker (
  personid    varchar(10),
  name        varchar(30),
  address     varchar(30),
  primary key (personid)
);

create table Band (
  name        varchar(20),
  country     varchar(20),
  contact     varchar(10),
  primary key (name),
  foreign key (contact) references Worker(personid)
);

create table Member (
  id      serial ,
  name    varchar (40),
  band    varchar(20),
  role    varchar(20),
  primary key(id),
  foreign key (band) references Band(name)
);

create table Stage (
  name    varchar(30),
  primary key (name)
);

create table Gig (
  band    varchar(20),
  stage   varchar(30),
  start_time timestamp,
  end_time timestamp,
  primary key (band,stage),
  foreign key (band) references Band(name),
  foreign key (Stage) references Stage(name)
);

create table Security(
  worker  varchar(10),
  stage varchar(30),
  start_time timestamp,
  end_time timestamp
);

insert into Worker values
('9208163113', 'Erik Eriksson','Musikgatan 17'),
('9408154523', 'Emma Paulsson','Regementsgatan 33');

insert into Band (name,country) values
('Iron Maiden','United Kingdom'),
('Judas Priest','United Kingdom');

insert into Member (name,band,role) values
('Steve Harris','Iron Maiden','Bass'),
('Dave Murray','Iron Maiden','Guitar'),
('Adrian Smith','Iron Maiden','Guitar'),
('Bruce Dickinsson','Iron Maiden','Vocals'),
('Nicko McBrain','Iron Maiden','Drums'),
('Jack Gers','Iron Maiden','Guitar'),
('Ian Hill','Judas Priest','Guitarbass'),
('Rob Halford','Judas Priest','Vocals'),
('Glenn Tipton','Judas Priest','Guitar'),
('Scott Davis','Judas Priest','Drums'),
('Richie Faulkner','Judas Priest','Guitar');

insert into stage values
  ('Stora Scenen'),
  ('Lilla Scenen'),
  ('Forumscenen');

insert into Gig values
  ('Judas Priest','Stora Scenen','2018-06-28 20:00:00-00','2018-06-28 23:00:00-00'),
  ('Iron Maiden','Forumscenen','2018-06-28 20:00:00-00','2018-06-28 23:00:00-00');

select * from Worker;
select * from Band;
select * from Member;
select * from Stage;
select * from Gig;
select * from Security;
