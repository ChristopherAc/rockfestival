drop table if exists Worker;
drop table if exists Band;
drop table if exists Members;
drop table if exists Stage;
drop table if exists Gig;

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
  id      integer,
  name    varchar (40),
  band    varchar(20),
  role    varchar(20)
);

create table Stage (
  name    varchar(30),
  primary key (name)
);

create table Gig (
  band    varchar(20),
  stage   varchar(30),
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

select * from Worker;
select * from Band;
select * from Member;
select * from Stage;
select * from Gig;
select * from Security;

insert into Worker values
('9208163113', 'Erik Eriksson','Musikgatan 17'),
('9408154523', 'Emma Paulsson','Regementsgatan 33')
