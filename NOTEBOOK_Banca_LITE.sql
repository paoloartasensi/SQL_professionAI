/*markdown
## ESERCITAZIONE BANCA LITE
Indicatori da creare
Ogni indicatore va riferito al singolo id_cliente.

- Età
- Numero di transazioni in uscita su tutti i conti
- Numero di transazioni in entrata su tutti i conti
- Importo transato in uscita su tutti i conti
- Importo transato in entrata su tutti i conti
- Numero totale di conti posseduti
- Numero di conti posseduti per tipologia (un indicatore per tipo)
- Numero di transazioni in uscita per tipologia (un indicatore per tipo)
- Numero di transazioni in entrata per tipologia (un indicatore per tipo)
- Importo transato in uscita per tipologia di conto (un indicatore per tipo)
- Importo transato in entrata per tipologia di conto (un indicatore per tipo)
*/

USE banca_lite;
SHOW TABLES;

SELECT * FROM cliente;
SELECT * FROM conto;
SELECT * FROM tipo_conto;
SELECT * FROM tipo_transazione;
SELECT * FROM transazioni;

/*markdown
Numero totale di conti posseduti
- Numero di conti posseduti per tipologia (un indicatore per tipo)
- Numero di transazioni in uscita per tipologia (un indicatore per tipo)
- Numero di transazioni in entrata per tipologia (un indicatore per tipo)
- Importo transato in uscita per tipologia di conto (un indicatore per tipo)
- Importo transato in entrata per tipologia di conto (un indicatore per tipo)
*/

CREATE TABLE aggregata (
  id_cliente INTEGER, 
  eta INTEGER, 
  trans_in INTEGER, 
  trans_out INTEGER,
  importo_in FLOAT, 
  importo_out FLOAT, 
  qt_conti_tot INTEGER,
  qt_conti_base INTEGER,
  qt_conti_business INTEGER,
  qt_conti_privati INTEGER,
  qt_conti_famiglie INTEGER,
  importo_in_base FLOAT,
  importo_in_business FLOAT,
  importo_in_privati FLOAT,
  importo_in_famiglie FLOAT,
  importo_out_base FLOAT,
  importo_out_business FLOAT,
  importo_out_privati FLOAT,
  importo_out_famiglie FLOAT
  
);



SELECT * FROM aggregata;


--DROP Table aggregata

CREATE TABLE banca_lite.tabella_nuova (
    campo1 TEXT, 
    campo2 INTEGER
);

INSERT INTO banca_lite.aggregata SELECT * FROM cliente