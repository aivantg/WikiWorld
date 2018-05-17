use wikiworld;

drop table if exists request;
drop table if exists link;
drop table if exists page;


CREATE TABLE IF NOT EXISTS page (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  title varchar(255),
  PRIMARY KEY (title)
);

CREATE TABLE IF NOT EXISTS link (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  srcID int,
  destID int,
  PRIMARY KEY (srcID, destID),
  FOREIGN KEY fk_src_ref(srcID) REFERENCES page(id) ON UPDATE cascade ON DELETE restrict,
  FOREIGN KEY fk_dest_ref(destID) REFERENCES page(id) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS request (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  linkID int,
  month date,
  type varchar(30),
  count int,
  PRIMARY KEY (linkID, month, type),
  FOREIGN KEY fk_link_ref(linkID) REFERENCES link(id) ON UPDATE cascade ON DELETE restrict
);
