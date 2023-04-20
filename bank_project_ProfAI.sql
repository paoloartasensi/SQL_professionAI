/*

###
README: 
Seguendo la consegna del progetto, ho dapprima esplorato il db
notando qualche difficoltà con il formato della "data_nascita".
Successivamente ho suddiviso il problema in parti più piccole,
cercando di vedere se dalle singole query uscisse il risultato sperato.
Infine ho utilizzato il metodo dell CTE con WITH AS per includere contemporaneamente
più subqueries.

###

USE banca_full;
SHOW TABLES;

UPDATE cliente
SET data_nascita = STR_TO_DATE(data_nascita, '%d/%m/%Y');

SELECT * from cliente;

SELECT * FROM conto;

SELECT * FROM tipo_conto;
SELECT * FROM tipo_transazione;
SELECT * FROM transazioni;

-- 1) Seleziona età
SELECT id_cliente, FLOOR(DATEDIFF(CURRENT_DATE(), data_nascita)/365) AS eta
FROM cliente;

-- 2) Considera il numero di transazioni in ENTRATA
SELECT c.id_cliente, COUNT(t.id_tipo_trans) AS Num_trans_IN
FROM cliente c
JOIN transazioni t 
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (0,1,2)
GROUP BY c.id_cliente;

-- 3) Considera gli importi in ENTRATA

SELECT c.id_cliente, SUM(t.importo) AS Income
FROM cliente c
JOIN transazioni t
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (0, 1, 2)
GROUP BY c.id_cliente;

-- 4) Considera il numero di transazioni in USCITA
SELECT c.id_cliente, COUNT(t.id_tipo_trans) AS Num_trans_out
FROM cliente c
JOIN transazioni t 
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (3,4,5,6,7)
GROUP BY c.id_cliente;

-- 5) Considera gli importi in uscita
SELECT c.id_cliente, SUM(t.importo) AS Outcome
FROM cliente c
JOIN transazioni t
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (3, 4, 5, 6, 7)
GROUP BY c.id_cliente;

-- 6) Numero di conti per cliente
SELECT id_cliente, COUNT(id_conto) AS Num_tot_conti
FROM conto 
GROUP BY id_cliente;

-- PARE CHE IL CLIENTE con ID 0 non sia REGISTRATO NELLA TABELLA "CONTO"

-- 7) Numero di conti posseduti per tipologia (un indicatore per tipo)

SELECT id_cliente,
       SUM(CASE WHEN id_tipo_conto = 0 THEN 1 ELSE 0 END) AS Base,
       SUM(CASE WHEN id_tipo_conto = 1 THEN 1 ELSE 0 END) AS Business,
       SUM(CASE WHEN id_tipo_conto = 2 THEN 1 ELSE 0 END) AS Privati,
       SUM(CASE WHEN id_tipo_conto = 3 THEN 1 ELSE 0 END) AS Famiglie
FROM conto
GROUP BY id_cliente;

-- 8) Numero di transazioni in uscita per tipologia (un indicatore per tipo)
SELECT c.id_cliente,
       t.id_conto,
       COUNT(CASE WHEN t.id_tipo_trans = 3 THEN 1 END) AS num_Out_Amazon,
       COUNT(CASE WHEN t.id_tipo_trans = 4 THEN 1 END) AS num_Out_Mutuo,
       COUNT(CASE WHEN t.id_tipo_trans = 5 THEN 1 END) AS num_Out_Hotel,
       COUNT(CASE WHEN t.id_tipo_trans = 6 THEN 1 END) AS num_Out_Biglietto_A,
       COUNT(CASE WHEN t.id_tipo_trans = 7 THEN 1 END) AS num_Out_Supermercato
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente, t.id_conto;

-- 9) Numero di transazioni in entrata per tipologia (un indicatore per tipo)

SELECT c.id_cliente,
       t.id_conto,
       COUNT(CASE WHEN t.id_tipo_trans = 0 THEN 1 END) AS num_IN_stipendio,
       COUNT(CASE WHEN t.id_tipo_trans = 1 THEN 1 END) AS num_IN_pensione,
       COUNT(CASE WHEN t.id_tipo_trans = 2 THEN 1 END) AS num_IN_dividendi
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente, t.id_conto;

-- 10) Importo transato in uscita per tipologia di conto (un indicatore per tipo)
SELECT c.id_cliente,
       SUM(CASE WHEN t.id_tipo_trans = 3 THEN t.importo ELSE 0 END) AS Out_Amazon,
       SUM(CASE WHEN t.id_tipo_trans = 4 THEN t.importo ELSE 0 END) AS Out_Mutuo,
       SUM(CASE WHEN t.id_tipo_trans = 5 THEN t.importo ELSE 0 END) AS Out_Hotel,
       SUM(CASE WHEN t.id_tipo_trans = 6 THEN t.importo ELSE 0 END) AS Out_Biglietto_A,
       SUM(CASE WHEN t.id_tipo_trans = 7 THEN t.importo ELSE 0 END) AS Out_Supermercato
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente;

-- 11) Importo transato in entrata per tipologia di conto (un indicatore per tipo)
SELECT c.id_cliente,
       SUM(CASE WHEN t.id_tipo_trans = 0 THEN t.importo ELSE 0 END) AS IN_stipendio,
       SUM(CASE WHEN t.id_tipo_trans = 1 THEN t.importo ELSE 0 END) AS IN_pensione,
       SUM(CASE WHEN t.id_tipo_trans = 2 THEN t.importo ELSE 0 END) AS IN_divendi
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente;
*/

-- START HERE

USE banca;

WITH 
cte1 AS (
SELECT id_cliente, FLOOR(DATEDIFF(CURRENT_DATE(), data_nascita)/365) AS eta
FROM cliente
), 

cte2 AS (
SELECT c.id_cliente, COUNT(t.id_tipo_trans) AS Num_tran_in
FROM cliente c
JOIN transazioni t 
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (0,1,2)
GROUP BY c.id_cliente
), 

cte3 AS (
SELECT c.id_cliente, SUM(t.importo) AS Income
FROM cliente c
JOIN transazioni t
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (0, 1, 2)
GROUP BY c.id_cliente
),

cte4 AS (
SELECT c.id_cliente, COUNT(t.id_tipo_trans) AS Num_trans_out
FROM cliente c
JOIN transazioni t 
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (3,4,5,6,7)
GROUP BY c.id_cliente
),


cte5 AS (
SELECT c.id_cliente, SUM(t.importo) AS Outcome
FROM cliente c
JOIN transazioni t
ON c.id_cliente = t.id_conto
WHERE t.id_tipo_trans IN (3, 4, 5, 6, 7)
GROUP BY c.id_cliente
),

cte6 AS (
SELECT id_cliente, COUNT(id_conto) AS Num_tot_conti
FROM conto
GROUP BY id_cliente
),

cte7 AS (
SELECT id_cliente,
       SUM(CASE WHEN id_tipo_conto = 0 THEN 1 ELSE 0 END) AS Base,
       SUM(CASE WHEN id_tipo_conto = 1 THEN 1 ELSE 0 END) AS Business,
       SUM(CASE WHEN id_tipo_conto = 2 THEN 1 ELSE 0 END) AS Privati,
       SUM(CASE WHEN id_tipo_conto = 3 THEN 1 ELSE 0 END) AS Famiglie
FROM conto
GROUP BY id_cliente
),


cte8 AS (
SELECT c.id_cliente,
       COUNT(CASE WHEN t.id_tipo_trans = 3 THEN 1 END) AS num_Out_Amazon,
       COUNT(CASE WHEN t.id_tipo_trans = 4 THEN 1 END) AS num_Out_Mutuo,
       COUNT(CASE WHEN t.id_tipo_trans = 5 THEN 1 END) AS num_Out_Hotel,
       COUNT(CASE WHEN t.id_tipo_trans = 6 THEN 1 END) AS num_Out_Biglietto_A,
       COUNT(CASE WHEN t.id_tipo_trans = 7 THEN 1 END) AS num_Out_Supermercato
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente
),

cte9 AS (
SELECT c.id_cliente,
       COUNT(CASE WHEN t.id_tipo_trans = 0 THEN 1 END) AS num_IN_stipendio,
       COUNT(CASE WHEN t.id_tipo_trans = 1 THEN 1 END) AS num_IN_pensione,
       COUNT(CASE WHEN t.id_tipo_trans = 2 THEN 1 END) AS num_IN_dividendi
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente
),


cte10 AS (
SELECT c.id_cliente,
       SUM(CASE WHEN t.id_tipo_trans = 3 THEN t.importo ELSE 0 END) AS Out_Amazon,
       SUM(CASE WHEN t.id_tipo_trans = 4 THEN t.importo ELSE 0 END) AS Out_Mutuo,
       SUM(CASE WHEN t.id_tipo_trans = 5 THEN t.importo ELSE 0 END) AS Out_Hotel,
       SUM(CASE WHEN t.id_tipo_trans = 6 THEN t.importo ELSE 0 END) AS Out_Biglietto_A,
       SUM(CASE WHEN t.id_tipo_trans = 7 THEN t.importo ELSE 0 END) AS Out_Supermercato
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente
),


cte11 AS (
SELECT c.id_cliente,
       SUM(CASE WHEN t.id_tipo_trans = 0 THEN t.importo ELSE 0 END) AS IN_stipendio,
       SUM(CASE WHEN t.id_tipo_trans = 1 THEN t.importo ELSE 0 END) AS IN_pensione,
       SUM(CASE WHEN t.id_tipo_trans = 2 THEN t.importo ELSE 0 END) AS IN_divendi
FROM conto c
INNER JOIN transazioni t ON c.id_conto = t.id_conto
GROUP BY c.id_cliente
)

SELECT *

FROM cte1 
JOIN cte2 ON cte1.id_cliente = cte2.id_cliente 
JOIN cte3 ON cte1.id_cliente = cte3.id_cliente
JOIN cte4 ON cte1.id_cliente = cte4.id_cliente
JOIN cte5 ON cte1.id_cliente = cte5.id_cliente
JOIN cte6 ON cte1.id_cliente = cte6.id_cliente
JOIN cte7 ON cte1.id_cliente = cte7.id_cliente
JOIN cte8 ON cte1.id_cliente = cte8.id_cliente
JOIN cte9 ON cte1.id_cliente = cte9.id_cliente
JOIN cte10 ON cte1.id_cliente = cte10.id_cliente
JOIN cte11 ON cte1.id_cliente = cte11.id_cliente
;