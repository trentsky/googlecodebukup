create table DATABASECHANGELOG
(
  id            VARCHAR2(63) not null,
  author        VARCHAR2(63) not null,
  filename      VARCHAR2(200) not null,
  dateexecuted  TIMESTAMP(6) not null,
  orderexecuted INTEGER not null,
  exectype      VARCHAR2(10) not null,
  md5sum        VARCHAR2(35),
  description   VARCHAR2(255),
  comments      VARCHAR2(255),
  tag           VARCHAR2(255),
  liquibase     VARCHAR2(20)
);
alter table DATABASECHANGELOG
  add constraint PK_DATABASECHANGELOG primary key (ID, AUTHOR, FILENAME);

create table DATABASECHANGELOGLOCK
(
  id          INTEGER not null,
  locked      NUMBER(1) not null,
  lockgranted TIMESTAMP(6),
  lockedby    VARCHAR2(255)
);
alter table DATABASECHANGELOGLOCK
  add constraint PK_DATABASECHANGELOGLOCK primary key (ID);

insert into DATABASECHANGELOG (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase)
values ('1288866003498-1', 'Administrator (generated)', 'src/main/db/changelog.xml', to_timestamp('13-01-2012 14:02:08.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 'EXECUTED', '3:4ef163315a73e608a7bf7937adad1a12', 'SQL From File', null, null, '2.0.1');
insert into DATABASECHANGELOG (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase)
values ('20120113-1', 'trent', 'src/main/db/changelog.xml', to_timestamp('13-01-2012 14:02:08.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 'EXECUTED', '3:b850fabd5dbd59ee5d78c112a0d36aa8', 'Custom SQL', null, null, '2.0.1');
commit;

insert into DATABASECHANGELOGLOCK (id, locked, lockgranted, lockedby)
values (1, 0, null, null);
commit;
