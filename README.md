# Floquette-Database-Data-Warehouse-e-Data-Mining
Progetto d'esame Elementi di Basi di Dati e Data Mining, Università degli Studi di Torino, 2024. Progetto individuale
Il progetto segue l'intero percorso di analisi dei dati di un e-commerce di borse e accessori (Floquette): dal database operazionale al data warehouse, fino all'analisi con tecniche di data mining.

> **Nota:** tutti i dati sono fittizi e creati a scopo didattico.

## Contenuto

### 1. Database relazionale (`floquette.sql`)
Database MariaDB con 7 tabelle: `Utente`, `Prodotto`, `Colore`, `Ordine`, `Comprende` (relazione N:M tra ordini e prodotti), `Pagamento`, `Recensione`. Integrità referenziale garantita da chiavi primarie ed esterne.

### 2. Data warehouse (`floquette_dw.sql`)
Schema a fiocco di neve (snowflake):
- **Tabella dei fatti:** `Vendita` (misure: `Quantità`, `Incasso`)
- **Dimensioni:** `Utente` (città → regione → stato; età → fascia d'età; sesso), `Prodotto` (→ tipologia), tempo (`Mese` → `Anno`)
- 50 vendite, 25 clienti, 25 prodotti, periodo 2023–2025

## Analisi OLAP con tabelle pivot in Excel (`floquette.xlsm`): operazioni di *slice* e *drill-down* dell'incasso per anno, mese e sesso.

Esempi di query:
```sql
--Incasso totale per anno e tipologia di prodotto
SELECT a.Nome AS Anno, t.Tipo, SUM(v.Incasso) AS Incasso_totale
FROM Vendita v
JOIN Mese m ON v.Id_mese = m.IDm
JOIN Anno a ON m.Id_anno = a.IDa
JOIN Prodotto p ON v.Id_prodotto = p.IDp
JOIN Tipologia t ON p.Id_tipologia = t.IDt
GROUP BY a.Nome, t.Tipo;

-- Incasso totale per stato
SELECT s.Nome AS Stato, SUM(v.Incasso) AS Incasso_totale
FROM Vendita v
JOIN Utente u ON v.Id_utente = u.IDu
JOIN Citta c ON u.Id_citta = c.IDc
JOIN Regione r ON c.Id_regione = r.IDr
JOIN Stato s ON r.Id_stato = s.IDst
GROUP BY s.Nome;
```

### 3. Data mining con Weka (`floquette.csv`, cartella `data_mining/`)
```

Dataset di 50 istanze estratto dal data warehouse.

| Tecnica | Attributi | Risultato |
|---|---|---|
| Albero di decisione (J48) | Età, sesso, tipologia → prodotto | 84% classificate correttamente (kappa 0,77) |
| Naive Bayes | Età, sesso, tipologia → prodotto | 70% (kappa 0,57) |
| Clustering | Età, incasso | Metodo del gomito: l'errore scende da 10 a 2 e si stabilizza tra 3 e 4 cluster |

**Limiti:** i modelli sono stati valutati sul training set, quindi l'accuratezza è ottimistica. Il prodotto "Jimmy" (48% dei dati) è l'unico porta telefono e viene classificato perfettamente per costruzione; sulle altre borse i risultati sono più deboli (es. recall della classe Isa: 0,17). Il dataset è piccolo e sintetico: i risultati hanno valore dimostrativo, non predittivo.

## Struttura del repository
```
├── database/          floquette.sql
├── data_warehouse/    floquette_dw.sql, floquette.xlsm
└── data_mining/       floquette.csv, output_j48.txt, output_naivebayes.txt,
                       albero_j48.png, matrice_confusione.png, grafico_gomito.png
```

## Come riprodurlo
1. Importa `floquette.sql` e `floquette_dw.sql` in MariaDB/MySQL.
2. Apri `floquette.csv` in Weka ed esegui i classificatori J48 e Naive Bayes.
3. Esegui il clustering e riproduci il grafico del gomito.

## Strumenti
SQL · MariaDB · phpMyAdmin · Excel (tabelle pivot) · Weka
