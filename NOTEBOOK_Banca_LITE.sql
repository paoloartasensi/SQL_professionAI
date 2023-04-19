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

SELECT id_cliente, nome, cognome, ROUND(DATEDIFF(CURRENT_DATE(), STR_TO_DATE(data_nascita, '%d/%m/%Y'))/365) as eta
FROM cliente;

/*markdown
- eta
- Numero totale di conti posseduti
- Numero di conti posseduti per tipologia (un indicatore per tipo)
- Numero di transazioni in uscita per tipologia (un indicatore per tipo)
- Numero di transazioni in entrata per tipologia (un indicatore per tipo)
- Importo transato in uscita per tipologia di conto (un indicatore per tipo)
- Importo transato in entrata per tipologia di conto (un indicatore per tipo)
*/

SELECT * FROM cliente cl 
INNER JOIN conto cnt 
ON cl.id_cliente = cnt.id_cliente;