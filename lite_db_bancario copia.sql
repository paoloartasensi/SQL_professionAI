create database banca;
use banca;
CREATE TABLE cliente (
id_cliente INTEGER,
  nome TEXT,
  cognome TEXT,
  data_nascita date
);

insert into cliente (id_cliente,nome,cognome,data_nascita) values ('0','Giada','Romano','1958-07-12');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('1','Stefano','Rossi','1967-09-30');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('2','Giada','Bruno','1972-03-01');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('3','Simone','Russo','1963-07-19');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('4','Maria','Gallo','1986-09-16');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('5','Simona','Mancini','1988-11-02');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('6','Stefano','Barbieri','1966-02-11');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('7','Luigi','Conti','1986-11-01');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('8','Stefania','Ferrari','1998-02-06');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('9','Stefania','Lombardi','1960-05-30');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('10','Mario','Barbieri','1962-07-03');




CREATE TABLE conto (
id_conto INTEGER,
  id_cliente INTEGER,
  id_tipo_conto INTEGER
);
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('0','197','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('1','124','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('2','100','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('3','129','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('4','157','1');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('5','133','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('6','168','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('7','150','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('8','30','0');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('9','19','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('10','4','3');





CREATE TABLE tipo_conto (
id_tipo_conto INTEGER,
  desc_tipo_conto TEXT
);
insert into tipo_conto (id_tipo_conto,desc_tipo_conto) values ('0','Conto Base');
insert into tipo_conto (id_tipo_conto,desc_tipo_conto) values ('1','Conto Business');
insert into tipo_conto (id_tipo_conto,desc_tipo_conto) values ('2','Conto Privati');
insert into tipo_conto (id_tipo_conto,desc_tipo_conto) values ('3','Conto Famiglie');

CREATE TABLE tipo_transazione (
id_tipo_transazione INTEGER,
  desc_tipo_trans TEXT,
  segno TEXT
);
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('0','Stipendio','+');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('1','Pensione','+');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('2','Dividendi','+');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('3','Acquisto su Amazon','-');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('4','Rata mutuo','-');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('5','Hotel','-');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('6','Biglietto aereo','-');
insert into tipo_transazione (id_tipo_transazione,desc_tipo_trans,segno) values ('7','Supermercato','-');






CREATE TABLE transazioni (
data date,
  id_tipo_trans INTEGER,
  importo REAL,
  id_conto INTEGER
);
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-09-10','0','31.436119476258334','238');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-06-17','2','216.32071020628084','81');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-02-06','1','108.18661266757807','92');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-09-24','1','7.926222489197406','61');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-07-22','0','20.360208734873257','141');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-10-01','0','29.66752848999167','205');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-01','0','46.064941863725345','153');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-03-23','1','52.26537117412802','34');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-08-30','1','53.807599184966776','13');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-10-10','2','205.0004593195482','218');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-09-24','0','49.57748487596333','33');
