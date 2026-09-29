-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 28, 2024 alle 12:24
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
-- Database: `floquette_dw`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Anno`
--

CREATE TABLE `Anno` (
  `IDa` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Anno`
--

INSERT INTO `Anno` (`IDa`, `Nome`) VALUES
(1, '2023'),
(2, '2024'),
(3, '2025');

-- --------------------------------------------------------

--
-- Struttura della tabella `Citta`
--

CREATE TABLE `Citta` (
  `IDc` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Id_regione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Citta`
--

INSERT INTO `Citta` (`IDc`, `Nome`, `Id_regione`) VALUES
(1, 'Roma', 1),
(2, 'Milano', 2),
(3, 'Parigi', 3),
(4, 'Marsiglia', 4),
(5, 'Berlino', 5),
(6, 'Monaco', 6),
(7, 'Madrid', 7),
(8, 'Barcellona', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `Età`
--

CREATE TABLE `Età` (
  `IDe` int(11) NOT NULL,
  `Eta` int(11) NOT NULL,
  `Id_fasciaeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Età`
--

INSERT INTO `Età` (`IDe`, `Eta`, `Id_fasciaeta`) VALUES
(1, 14, 1),
(2, 22, 2),
(3, 27, 3),
(4, 50, 4),
(5, 56, 5),
(6, 17, 1),
(7, 24, 2),
(8, 26, 3),
(9, 53, 4),
(10, 60, 5),
(11, 16, 1),
(12, 19, 2),
(13, 34, 3),
(14, 40, 4),
(15, 58, 5),
(16, 17, 1),
(17, 20, 2),
(18, 27, 3),
(19, 39, 4),
(20, 57, 5),
(21, 14, 1),
(22, 22, 2),
(23, 30, 3),
(24, 45, 4),
(25, 63, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Fascia_eta`
--

CREATE TABLE `Fascia_eta` (
  `IDfe` int(11) NOT NULL,
  `fascia_eta` enum('>18','18-25','26-35','36-55','< 55') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Fascia_eta`
--

INSERT INTO `Fascia_eta` (`IDfe`, `fascia_eta`) VALUES
(1, '>18'),
(2, '18-25'),
(3, '26-35'),
(4, '36-55'),
(5, '< 55');

-- --------------------------------------------------------

--
-- Struttura della tabella `Mese`
--

CREATE TABLE `Mese` (
  `IDm` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Id_anno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Mese`
--

INSERT INTO `Mese` (`IDm`, `Nome`, `Id_anno`) VALUES
(1, 'Gennaio', 1),
(2, 'Febbraio', 1),
(3, 'Marzo', 1),
(4, 'Aprile', 1),
(5, 'Maggio', 1),
(6, 'Giugno', 1),
(7, 'Luglio', 1),
(8, 'Agosto', 1),
(9, 'Settembre', 1),
(10, 'Ottobre', 1),
(11, 'Novembre', 1),
(12, 'Dicembre', 1),
(13, 'Gennaio', 2),
(14, 'Febbraio', 2),
(15, 'Marzo', 2),
(16, 'Aprile', 2),
(17, 'Maggio', 2),
(18, 'Giugno', 2),
(19, 'Luglio', 2),
(20, 'Agosto', 2),
(21, 'Settembre', 2),
(22, 'Ottobre', 2),
(23, 'Novembre', 2),
(24, 'Dicembre', 2),
(25, 'Gennaio', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Prodotto`
--

CREATE TABLE `Prodotto` (
  `IDp` int(11) NOT NULL,
  `Nome` enum('Alba','Luna','Isa','Stella','Jimmy') NOT NULL,
  `Colore` varchar(25) NOT NULL,
  `Id_tipologia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Prodotto`
--

INSERT INTO `Prodotto` (`IDp`, `Nome`, `Colore`, `Id_tipologia`) VALUES
(1, 'Alba', 'Rosso', 1),
(2, 'Jimmy', 'Blu', 2),
(3, 'Luna', 'Verde', 1),
(4, 'Jimmy', 'Giallo', 2),
(5, 'Isa', 'Nero', 1),
(6, 'Jimmy', 'Rosso', 2),
(7, 'Stella', 'Blu', 1),
(8, 'Jimmy', 'Verde', 2),
(9, 'Alba', 'Giallo', 1),
(10, 'Jimmy', 'Nero', 2),
(11, 'Luna', 'Rosso', 1),
(12, 'Jimmy', 'Blu', 2),
(13, 'Isa', 'Verde', 1),
(14, 'Jimmy', 'Giallo', 2),
(15, 'Stella', 'Nero', 1),
(16, 'Jimmy', 'Rosso', 2),
(17, 'Alba', 'Blu', 1),
(18, 'Jimmy', 'Verde', 2),
(19, 'Luna', 'Giallo', 1),
(20, 'Jimmy', 'Nero', 2),
(21, 'Isa', 'Rosso', 1),
(22, 'Jimmy', 'Blu', 2),
(23, 'Stella', 'Verde', 1),
(24, 'Jimmy', 'Giallo', 2),
(25, 'Alba', 'Nero', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Regione`
--

CREATE TABLE `Regione` (
  `IDr` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Id_stato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Regione`
--

INSERT INTO `Regione` (`IDr`, `Nome`, `Id_stato`) VALUES
(1, 'Lazio', 1),
(2, 'Lombardia', 1),
(3, 'Île-de-France', 2),
(4, 'Provenza', 2),
(5, 'Brandeburgo', 3),
(6, 'Baviera', 3),
(7, 'Comunità di Madrid', 4),
(8, 'Catalogna', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sesso`
--

CREATE TABLE `Sesso` (
  `IDses` int(11) NOT NULL,
  `Sesso` enum('Donna','Uomo','No gender') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Sesso`
--

INSERT INTO `Sesso` (`IDses`, `Sesso`) VALUES
(1, 'Donna'),
(2, 'No gender'),
(3, 'Uomo');

-- --------------------------------------------------------

--
-- Struttura della tabella `Stato`
--

CREATE TABLE `Stato` (
  `IDst` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Stato`
--

INSERT INTO `Stato` (`IDst`, `Nome`) VALUES
(1, 'Italia'),
(2, 'Francia'),
(3, 'Germania'),
(4, 'Spagna');

-- --------------------------------------------------------

--
-- Struttura della tabella `Tipologia`
--

CREATE TABLE `Tipologia` (
  `IDt` int(11) NOT NULL,
  `Tipo` enum('Borsa','Porta telefono') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Tipologia`
--

INSERT INTO `Tipologia` (`IDt`, `Tipo`) VALUES
(1, 'Borsa'),
(2, 'Porta telefono');

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `IDu` int(11) NOT NULL,
  `Cognome` varchar(25) NOT NULL,
  `Id_citta` int(11) NOT NULL,
  `Id_eta` int(11) NOT NULL,
  `Id_ses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Utente`
--

INSERT INTO `Utente` (`IDu`, `Cognome`, `Id_citta`, `Id_eta`, `Id_ses`) VALUES
(1, 'Rossi', 1, 1, 1),
(2, 'Bianchi', 2, 2, 2),
(3, 'Verdi', 3, 3, 3),
(4, 'Neri', 4, 4, 1),
(5, 'Gialli', 5, 5, 1),
(6, 'Marroni', 6, 6, 1),
(7, 'Viola', 7, 7, 1),
(8, 'Rosa', 8, 8, 1),
(9, 'Blu', 8, 9, 1),
(10, 'Azzurri', 8, 10, 1),
(11, 'Celesti', 5, 11, 1),
(12, 'Grigi', 5, 12, 1),
(13, 'Neri', 6, 13, 1),
(14, 'Arancioni', 6, 14, 2),
(15, 'Turchesi', 1, 15, 2),
(16, 'Dorati', 1, 16, 3),
(17, 'Argentati', 2, 17, 3),
(18, 'Corallo', 2, 18, 3),
(19, 'Perla', 7, 19, 3),
(20, 'Smeraldi', 4, 20, 3),
(21, 'Rubini', 3, 21, 2),
(22, 'Diamanti', 3, 22, 1),
(23, 'Cristalli', 4, 23, 2),
(24, 'Ambra', 3, 24, 1),
(25, 'Zaffiri', 7, 25, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Vendita`
--

CREATE TABLE `Vendita` (
  `IDv` int(11) NOT NULL,
  `Id_utente` int(11) NOT NULL,
  `Id_prodotto` int(11) NOT NULL,
  `Id_mese` int(11) NOT NULL,
  `Quantità` int(11) NOT NULL,
  `Incasso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Vendita`
--

INSERT INTO `Vendita` (`IDv`, `Id_utente`, `Id_prodotto`, `Id_mese`, `Quantità`, `Incasso`) VALUES
(1, 1, 1, 1, 2, 60),
(2, 2, 2, 2, 1, 30),
(3, 3, 3, 3, 3, 90),
(4, 4, 4, 4, 2, 100),
(5, 5, 5, 5, 1, 50),
(6, 6, 6, 6, 3, 150),
(7, 7, 7, 7, 2, 80),
(8, 8, 8, 8, 1, 40),
(9, 9, 9, 9, 3, 135),
(10, 10, 10, 10, 2, 100),
(11, 11, 11, 11, 1, 45),
(12, 12, 12, 12, 3, 150),
(13, 13, 13, 13, 2, 100),
(14, 14, 14, 14, 1, 50),
(15, 15, 15, 15, 3, 90),
(16, 16, 16, 16, 2, 60),
(17, 17, 17, 17, 1, 40),
(18, 18, 18, 18, 3, 120),
(19, 19, 19, 19, 2, 120),
(20, 20, 20, 20, 1, 40),
(21, 21, 21, 21, 3, 105),
(22, 22, 22, 22, 2, 80),
(23, 23, 23, 23, 1, 40),
(24, 24, 24, 24, 3, 150),
(25, 25, 25, 25, 2, 90),
(26, 1, 2, 3, 1, 50),
(27, 2, 3, 4, 3, 90),
(28, 3, 4, 5, 2, 100),
(29, 4, 5, 6, 1, 30),
(30, 5, 6, 7, 3, 120),
(31, 6, 7, 8, 2, 60),
(32, 7, 8, 9, 1, 30),
(33, 8, 9, 10, 3, 90),
(34, 9, 10, 11, 2, 80),
(35, 10, 11, 12, 1, 45),
(36, 11, 12, 13, 3, 150),
(37, 12, 13, 14, 2, 60),
(38, 13, 14, 15, 1, 50),
(39, 14, 15, 16, 3, 120),
(40, 15, 16, 17, 2, 100),
(41, 16, 17, 18, 1, 40),
(42, 17, 18, 19, 3, 90),
(43, 18, 19, 20, 2, 100),
(44, 19, 20, 21, 1, 50),
(45, 20, 21, 22, 3, 90),
(46, 21, 22, 23, 2, 100),
(47, 22, 23, 24, 1, 30),
(48, 23, 24, 25, 3, 120),
(49, 24, 25, 1, 2, 60),
(50, 25, 1, 2, 1, 50);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Anno`
--
ALTER TABLE `Anno`
  ADD PRIMARY KEY (`IDa`);

--
-- Indici per le tabelle `Citta`
--
ALTER TABLE `Citta`
  ADD PRIMARY KEY (`IDc`),
  ADD KEY `Id_regione` (`Id_regione`);

--
-- Indici per le tabelle `Età`
--
ALTER TABLE `Età`
  ADD PRIMARY KEY (`IDe`),
  ADD KEY `Id_fasciaeta` (`Id_fasciaeta`);

--
-- Indici per le tabelle `Fascia_eta`
--
ALTER TABLE `Fascia_eta`
  ADD PRIMARY KEY (`IDfe`);

--
-- Indici per le tabelle `Mese`
--
ALTER TABLE `Mese`
  ADD PRIMARY KEY (`IDm`),
  ADD KEY `mese_ibfk_1` (`Id_anno`);

--
-- Indici per le tabelle `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD PRIMARY KEY (`IDp`),
  ADD KEY `Id_tipologia` (`Id_tipologia`);

--
-- Indici per le tabelle `Regione`
--
ALTER TABLE `Regione`
  ADD PRIMARY KEY (`IDr`),
  ADD KEY `Id_stato` (`Id_stato`);

--
-- Indici per le tabelle `Sesso`
--
ALTER TABLE `Sesso`
  ADD PRIMARY KEY (`IDses`);

--
-- Indici per le tabelle `Stato`
--
ALTER TABLE `Stato`
  ADD PRIMARY KEY (`IDst`);

--
-- Indici per le tabelle `Tipologia`
--
ALTER TABLE `Tipologia`
  ADD PRIMARY KEY (`IDt`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`IDu`),
  ADD KEY `Id_citta` (`Id_citta`),
  ADD KEY `Id_ses` (`Id_ses`),
  ADD KEY `Id_eta` (`Id_eta`);

--
-- Indici per le tabelle `Vendita`
--
ALTER TABLE `Vendita`
  ADD PRIMARY KEY (`IDv`),
  ADD KEY `Id_utente` (`Id_utente`),
  ADD KEY `Id_prodotto` (`Id_prodotto`),
  ADD KEY `Id_mese` (`Id_mese`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Anno`
--
ALTER TABLE `Anno`
  MODIFY `IDa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Citta`
--
ALTER TABLE `Citta`
  MODIFY `IDc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `Età`
--
ALTER TABLE `Età`
  MODIFY `IDe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `Fascia_eta`
--
ALTER TABLE `Fascia_eta`
  MODIFY `IDfe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `Mese`
--
ALTER TABLE `Mese`
  MODIFY `IDm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  MODIFY `IDp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `Regione`
--
ALTER TABLE `Regione`
  MODIFY `IDr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `Sesso`
--
ALTER TABLE `Sesso`
  MODIFY `IDses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `Stato`
--
ALTER TABLE `Stato`
  MODIFY `IDst` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `Tipologia`
--
ALTER TABLE `Tipologia`
  MODIFY `IDt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `Utente`
--
ALTER TABLE `Utente`
  MODIFY `IDu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `Vendita`
--
ALTER TABLE `Vendita`
  MODIFY `IDv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Citta`
--
ALTER TABLE `Citta`
  ADD CONSTRAINT `citta_ibfk_1` FOREIGN KEY (`Id_regione`) REFERENCES `Regione` (`IDr`);

--
-- Limiti per la tabella `Età`
--
ALTER TABLE `Età`
  ADD CONSTRAINT `età_ibfk_1` FOREIGN KEY (`Id_fasciaeta`) REFERENCES `Fascia_eta` (`IDfe`);

--
-- Limiti per la tabella `Mese`
--
ALTER TABLE `Mese`
  ADD CONSTRAINT `mese_ibfk_1` FOREIGN KEY (`Id_anno`) REFERENCES `Anno` (`IDa`);

--
-- Limiti per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`Id_tipologia`) REFERENCES `Tipologia` (`IDt`);

--
-- Limiti per la tabella `Regione`
--
ALTER TABLE `Regione`
  ADD CONSTRAINT `regione_ibfk_1` FOREIGN KEY (`Id_stato`) REFERENCES `Stato` (`IDst`);

--
-- Limiti per la tabella `Utente`
--
ALTER TABLE `Utente`
  ADD CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`Id_citta`) REFERENCES `Citta` (`IDc`),
  ADD CONSTRAINT `utente_ibfk_3` FOREIGN KEY (`Id_ses`) REFERENCES `Sesso` (`IDses`),
  ADD CONSTRAINT `utente_ibfk_4` FOREIGN KEY (`Id_eta`) REFERENCES `Età` (`IDe`);

--
-- Limiti per la tabella `Vendita`
--
ALTER TABLE `Vendita`
  ADD CONSTRAINT `vendita_ibfk_1` FOREIGN KEY (`Id_utente`) REFERENCES `Utente` (`IDu`),
  ADD CONSTRAINT `vendita_ibfk_2` FOREIGN KEY (`Id_prodotto`) REFERENCES `Prodotto` (`IDp`),
  ADD CONSTRAINT `vendita_ibfk_3` FOREIGN KEY (`Id_mese`) REFERENCES `Mese` (`IDm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
