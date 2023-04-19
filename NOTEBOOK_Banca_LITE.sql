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


--DROP Table aggregata

/*markdown
CTE (Common Table Expressions) in SQL consente di definire una o più espressioni di tabella temporanee all'interno di una query SELECT, INSERT, UPDATE o DELETE.

In pratica, una CTE fornisce un modo per creare una query complessa suddividendo il lavoro in passaggi logici separati.

La sintassi generale di una CTE è la seguente:

WITH nome_cte (colonna1, colonna2, colonna3, ...) AS ( SELECT colonna1, colonna2, colonna3, ... FROM nomi_tabelle WHERE condizioni )

Segue una SELECT statement che si riferisce al nome della CTE specificato nella parte superiore della query.

Ad esempio, ecco come potresti utilizzare una CTE per ottenere il conteggio dei clienti che hanno effettuato acquisti in un certo periodo di tempo:

WITH clienti_ordini AS ( SELECT DISTINCT customer_id FROM orders WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31' ) SELECT COUNT(*) as num_clienti FROM clienti_ordini;

In questo codice, abbiamo creato una CTE chiamata "clienti_ordini" che seleziona tutti i customer_id distinti degli ordini effettuati nel 2020. La query principale quindi conta il numero di righe nella CTE, che rappresenta il numero di clienti distinti che hanno effettuato acquisti in tale periodo.

Le CTE possono semplificare le query complesse e migliorare la leggibilità e la manutenzione del codice, anche se è importante notare che ogni volta che viene utilizzata una CTE, il DBMS deve valutarla come una subquery separata.
*/

