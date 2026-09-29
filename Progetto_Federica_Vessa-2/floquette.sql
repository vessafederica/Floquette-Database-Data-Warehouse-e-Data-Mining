-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 21, 2024 alle 10:58
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `floquette`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Colore`
--

CREATE TABLE `Colore` (
  `Idc` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Colore`
--

INSERT INTO `Colore` (`Idc`, `Nome`) VALUES
(1, 'Rosso'),
(2, 'Verde smeraldo'),
(3, 'Nero'),
(4, 'Blu marino'),
(5, 'Beige'),
(6, 'Rosa maialino');

-- --------------------------------------------------------

--
-- Struttura della tabella `Comprende`
--

CREATE TABLE `Comprende` (
  `Chiave` int(11) NOT NULL,
  `ID_ordine` int(11) NOT NULL,
  `ID_prodotto` int(11) NOT NULL,
  `Quantità` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Comprende`
--

INSERT INTO `Comprende` (`Chiave`, `ID_ordine`, `ID_prodotto`, `Quantità`) VALUES
(1, 1, 1, 1),
(2, 2, 4, 1),
(3, 3, 2, 1),
(4, 3, 4, 1),
(5, 4, 3, 1),
(6, 5, 6, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `Ordine`
--

CREATE TABLE `Ordine` (
  `IDo` int(11) NOT NULL,
  `Data_ordine` date NOT NULL,
  `Stato` enum('In preparazione','Spedito','Consegnato','') NOT NULL,
  `Via` varchar(100) NOT NULL,
  `Numero_civ` int(11) NOT NULL,
  `Cap` int(5) NOT NULL,
  `Città` varchar(100) NOT NULL,
  `ID_utente` int(11) NOT NULL,
  `ID_pagamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Ordine`
--

INSERT INTO `Ordine` (`IDo`, `Data_ordine`, `Stato`, `Via`, `Numero_civ`, `Cap`, `Città`, `ID_utente`, `ID_pagamento`) VALUES
(1, '2023-08-05', 'Consegnato', 'Via Roma', 12, 20121, 'Milano', 3, 1),
(2, '2023-07-10', 'Consegnato', 'Corso Vittorio Emanuele II', 45, 10123, 'Torino', 4, 2),
(3, '2023-08-31', 'Consegnato', ' Via Garibaldi\r\n', 78, 80134, 'Napoli', 5, 3),
(4, '2023-06-20', 'Consegnato', 'Viale della Libertà', 32, 90143, 'Palermo', 1, 4),
(5, '2023-05-02', 'Consegnato', 'Piazza San Marco', 5, 30124, 'Venezia', 2, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Pagamento`
--

CREATE TABLE `Pagamento` (
  `IDp` int(11) NOT NULL,
  `Tipo` enum('Carta di Credito','Carta di Debito','Prepagata','Satispay') NOT NULL,
  `Data_pagamento` date NOT NULL,
  `Importo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Pagamento`
--

INSERT INTO `Pagamento` (`IDp`, `Tipo`, `Data_pagamento`, `Importo`) VALUES
(1, 'Carta di Credito', '2023-08-05', 40),
(2, 'Carta di Debito', '2023-07-10', 15),
(3, 'Prepagata', '2023-08-31', 55),
(4, 'Satispay', '2023-06-20', 30),
(5, 'Carta di Debito', '2023-05-02', 100);

-- --------------------------------------------------------

--
-- Struttura della tabella `Prodotto`
--

CREATE TABLE `Prodotto` (
  `IDp` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Disponibilità` int(11) NOT NULL,
  `Descrizione` text NOT NULL,
  `Prezzo` int(11) NOT NULL,
  `Tipologia` enum('Borsa','Porta telefono') NOT NULL,
  `ID_colore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Prodotto`
--

INSERT INTO `Prodotto` (`IDp`, `Nome`, `Disponibilità`, `Descrizione`, `Prezzo`, `Tipologia`, `ID_colore`) VALUES
(1, 'Alba', 10, 'Borsa con chiusura a molla da portare sotto braccio.', 40, 'Borsa', 1),
(2, 'Luna', 10, 'Borsa con chiusura a molla con comodo manico per essere portata a mano o sottobraccio.', 40, 'Borsa', 2),
(3, 'Zoe', 10, 'Borsetta con tracolla regolabile da portare o semplicemente a tracolla oppure con una tracolla più corta, sotto braccio. ', 30, 'Borsa', 3),
(4, 'Jimmy', 5, 'Porta telefono comodo per uscire senza grandi borse e rimanere alla moda.', 15, 'Porta telefono', 4),
(5, 'Isa', 10, 'Borsa capiente comoda per il giorno e per la sera; è possibile scegliere la catena della lunghezza preferita.', 45, 'Borsa', 5),
(6, 'Stella', 10, 'Borsa perfetta per le serate in discoteca. Tempestata di paillettes ma comoda e spaziosa.', 50, 'Borsa', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `Recensione`
--

CREATE TABLE `Recensione` (
  `IDr` int(11) NOT NULL,
  `Voto` int(1) NOT NULL,
  `Testo` text NOT NULL,
  `Data_rec` date NOT NULL,
  `ID_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Recensione`
--

INSERT INTO `Recensione` (`IDr`, `Voto`, `Testo`, `Data_rec`, `ID_utente`) VALUES
(1, 5, 'Ottima qualità e design elegante. La borsa che ho comprato ha superato le aspettative, e il servizio clienti è stato impeccabile. Consigliatissimo!', '2023-08-15', 2),
(2, 4, 'Bellissima selezione di borse e materiali molto buoni. L’unica pecca è stata la consegna, che ha impiegato un po\' più del previsto.', '2023-07-20', 4),
(3, 3, 'Il sito è facile da navigare e le borse sono carine, ma il prezzo è un po\' elevato per la qualità ricevuta. Mi aspettavo di più.', '2023-09-05', 5),
(4, 4, 'La borsa è bellissima ma è un po\' scomoda, forse ho sbagliato modello.', '2023-06-30', 1),
(5, 5, 'Ho fatto un affare! Ho comprato le borse più virali del momento a prezzi super accessibili rispetto ad altri negozi. Consigliatissimo', '2023-05-12', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `IDu` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Data_nascita` date NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `PW` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Utente`
--

INSERT INTO `Utente` (`IDu`, `Nome`, `Cognome`, `Data_nascita`, `E-mail`, `PW`) VALUES
(1, 'Giulia', 'Rossi', '1998-03-03', 'giuliarossi@gmail.com', 'Giulia98'),
(2, 'Alessia', 'Conti', '1992-07-15', 'alessia.conti92@email.com', 'Alessia92!*'),
(3, 'Martina', 'Moretti', '1988-04-27', 'martina.moretti88@email.com', 'M0r3tti$88'),
(4, 'Sofia', 'Rinaldi', '1995-11-08', 'sofia.rinaldi95@email.com', 'Sofi@Rinaldi95\r\n'),
(5, 'Chiara', 'Romano', '1990-03-19', 'chiara.romano90@email.com', 'Chi@r4Rom90');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Colore`
--
ALTER TABLE `Colore`
  ADD PRIMARY KEY (`Idc`);

--
-- Indici per le tabelle `Comprende`
--
ALTER TABLE `Comprende`
  ADD PRIMARY KEY (`Chiave`),
  ADD KEY `ID_ordine` (`ID_ordine`),
  ADD KEY `ID_prodotto` (`ID_prodotto`);

--
-- Indici per le tabelle `Ordine`
--
ALTER TABLE `Ordine`
  ADD PRIMARY KEY (`IDo`),
  ADD KEY `ID_utente` (`ID_utente`),
  ADD KEY `ID_pagamento` (`ID_pagamento`);

--
-- Indici per le tabelle `Pagamento`
--
ALTER TABLE `Pagamento`
  ADD PRIMARY KEY (`IDp`);

--
-- Indici per le tabelle `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD PRIMARY KEY (`IDp`),
  ADD KEY `ID_colore` (`ID_colore`);

--
-- Indici per le tabelle `Recensione`
--
ALTER TABLE `Recensione`
  ADD PRIMARY KEY (`IDr`),
  ADD KEY `ID_utente` (`ID_utente`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`IDu`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Colore`
--
ALTER TABLE `Colore`
  MODIFY `Idc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Comprende`
--
ALTER TABLE `Comprende`
  MODIFY `Chiave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Ordine`
--
ALTER TABLE `Ordine`
  MODIFY `IDo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `Pagamento`
--
ALTER TABLE `Pagamento`
  MODIFY `IDp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  MODIFY `IDp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Recensione`
--
ALTER TABLE `Recensione`
  MODIFY `IDr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `Utente`
--
ALTER TABLE `Utente`
  MODIFY `IDu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Comprende`
--
ALTER TABLE `Comprende`
  ADD CONSTRAINT `comprende_ibfk_1` FOREIGN KEY (`ID_ordine`) REFERENCES `Ordine` (`IDo`),
  ADD CONSTRAINT `comprende_ibfk_2` FOREIGN KEY (`ID_prodotto`) REFERENCES `Prodotto` (`IDp`);

--
-- Limiti per la tabella `Ordine`
--
ALTER TABLE `Ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`ID_utente`) REFERENCES `Utente` (`IDu`),
  ADD CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`ID_pagamento`) REFERENCES `Pagamento` (`IDp`);

--
-- Limiti per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`ID_colore`) REFERENCES `Colore` (`Idc`);

--
-- Limiti per la tabella `Recensione`
--
ALTER TABLE `Recensione`
  ADD CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`ID_utente`) REFERENCES `Utente` (`IDu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
