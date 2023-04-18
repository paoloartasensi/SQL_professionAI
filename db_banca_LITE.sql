create database banca_lite;
use banca_lite;
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
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('11','Luigi','Bianchi','1994-02-01');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('12','Stefano','Martinelli','1995-11-01');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('13','Stefano','Conti','1958-09-13');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('14','Stefania','Colombo','1995-05-20');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('15','Mario','Romano','1966-10-17');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('16','Simone','Barbieri','1989-12-01');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('17','Stefania','Bianchi','1966-02-07');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('18','Simona','Fontana','1969-04-10');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('19','Giada','Bianchi','1979-02-04');
insert into cliente (id_cliente,nome,cognome,data_nascita) values ('20','Alberto','Giordano','1995-11-14');



CREATE TABLE conto (
id_conto INTEGER,
  id_cliente INTEGER,
  id_tipo_conto INTEGER
);
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('0','20','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('1','19','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('2','18','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('3','17','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('4','16','1');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('5','15','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('6','14','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('7','13','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('8','12','0');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('9','11','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('10','10','3');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('11','9','0');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('12','8','1');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('13','7','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('14','6','0');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('15','5','0');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('16','4','1');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('17','3','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('18','2','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('19','1','2');
insert into conto (id_conto,id_cliente,id_tipo_conto) values ('20','0','1');







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
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-09-10','0','31.436119476258334','1');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-06-17','2','216.32071020628084','2');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-02-06','1','108.18661266757807','3');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-09-24','1','7.926222489197406','4');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-07-22','0','20.360208734873257','5');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-10-01','0','29.66752848999167','6');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-01','0','46.064941863725345','6');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-03-23','1','52.26537117412802','8');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-08-30','1','53.807599184966776','9');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-10-10','2','205.0004593195482','10');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-09-24','0','49.57748487596333','11');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-09-15','0','83.9090851884074','12');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-08-25','0','24.64535977219945','13');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-08-29','1','104.2032122927109','0');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-11-27','2','159.05120563143154','15');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-04-04','2','27.208640385294093','16');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-07-04','0','42.95778557652508','17');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-11-21','1','82.43749561999576','18');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-11-22','0','23.724526041905136','19');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-05-24','0','33.17005496796301','20');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-09-20','0','114.8797733783575','1');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-12-07','2','138.2615781076372','2');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-01-01','2','9.405604419737184','3');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-03-24','0','4.962262163059117','4');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-06-20','2','83.0216692188781','5');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-04-05','1','73.04467109021854','6');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-04-12','2','30.25077831152747','7');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-27','0','43.06516926826799','8');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-06-05','1','37.02639212588964','8');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-10-29','0','54.5761297967339','4');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-12-21','2','130.30684566639417','4');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-08-11','1','69.21228472043539','20');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-10-18','0','50.026699971131805','19');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-10-31','2','261.2048365499957','18');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-12-07','0','51.44516334845758','15');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-12-29','2','52.28976446333137','16');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-09-13','1','22.874280977723757','16');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-11-27','2','155.92072799762468','1');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-08-17','1','116.78788390114782','2');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-10-17','0','12.276929386143218','2');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-06-02','1','64.29902383231682','3');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-10-02','0','16.769848098804868','0');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-07-31','2','176.38751971036584','4');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-25','2','8.511261738187558','5');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-05-06','1','139.75654231361023','6');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-10-02','2','17.635610155365203','7');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-04-23','0','56.3172545764133','8');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-04-18','2','38.97961224212774','8');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-12-02','2','87.26861248387628','9');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-03-05','0','185.25312547952132','10');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-08-17','1','632.9480347202117','10');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-09-20','2','231.15039522289862','11');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-01-04','2','223.92142087727615','12');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-04-24','2','320.34541686952997','13');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-22','2','118.55041538253865','14');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-01-02','2','37.86868870239551','15');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-03-13','1','167.29711226755092','15');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-01-22','1','35.088872486281254','16');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-11-17','0','10.03215283958879','17');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-12-03','1','192.86062816761958','18');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2022-02-27','0','4.0595081640082125','18');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2021-12-10','1','299.74352714421946','19');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2020-06-19','0','38.21796057014361','19');
insert into transazioni (data,id_tipo_trans,importo,id_conto) values ('2019-12-30','0','19.37922486928454','20');