-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mag 22, 2025 alle 17:59
-- Versione del server: 5.7.24
-- Versione PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modellismo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `catalogo`
--

CREATE TABLE `catalogo` (
  `id_modello` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `catalogo`
--

INSERT INTO `catalogo` (`id_modello`, `id_categoria`) VALUES
(2, 1),
(2, 4),
(1, 1),
(1, 4),
(4, 4),
(4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL COMMENT 'nome della categoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'AFV'),
(2, 'Navi'),
(3, 'Aerei'),
(4, 'WW2'),
(5, 'Guerra Fredda'),
(6, 'Contemporaneo');

-- --------------------------------------------------------

--
-- Struttura della tabella `modello`
--

CREATE TABLE `modello` (
  `id` int(100) NOT NULL,
  `nome` varchar(30) NOT NULL COMMENT 'nome veicolo',
  `dati` varchar(50) NOT NULL COMMENT 'produttore e scala',
  `descrizione` varchar(2000) NOT NULL,
  `immagine1` varchar(100) NOT NULL COMMENT 'immagine modello',
  `immagine2` varchar(100) NOT NULL COMMENT 'immagine vera'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabella principale con i dati del veicolo';

--
-- Dump dei dati per la tabella `modello`
--

INSERT INTO `modello` (`id`, `nome`, `dati`, `descrizione`, `immagine1`, `immagine2`) VALUES
(1, 'Puma sd.kfz 234/2', 'DRAGON MODELS 1/35', 'Riproduzione del leggendario blindato tedesco, in configurazione da pattugliamento e ricognizione, con cannone da 50mm. Il kit è uno dei più complicati che mi sia mai finito tra le mani, ma l\'ottima fattura ha permesso una realizzazione relativamente veloce; di fatto il kit ammontava a più di 700 pezzi, un numero raramente pareggiato da gommati simili.\r\nLa presenza degli interni è interessante ma per la maggior parte nascosta, forse avrei preferito una versione senza di essi a un prezzo ridotto', 'IMG_3971.JPEG', 'puma.jpg'),
(2, 'M36B2', 'AIRFIX 1/35', 'Riproduzione del semovente M36B2 in servizio con le forze francesi durante la guerra d’Indocina. Il kit, firmato Airfix, è una base solida ma mostra la sua età in diversi punti: dettagli un po’ morbidi e qualche imprecisione nei pezzi principali, la presenza degli interni si apprezza grazie alla natura open-top del mezzo. Tuttavia, con un po’ di lavoro extra e qualche aggiunta aftermarket, si riesce a tirare fuori un modello interessante e poco visto, soprattutto in questo teatro operativo. Colorazione e invecchiamento sono stati fondamentali per dargli carattere, visto il periodo storico in cui ho ambientato il kit.', 'IMG_1963.JPEG', 'm36dow.jpg'),
(4, 'USA Navy LSM', 'REVELL 1/144', 'Riproduzione di una nave da sbarco media (Landing Ship Medium – LSM) della US Navy, usata intensamente nel Pacifico durante la Seconda Guerra Mondiale. Il kit ha un’impostazione semplice ma permette di ottenere un modello d’effetto grazie alle dimensioni generose e alla linea inconfondibile. Le stampate non sono recentissime, ma con qualche dettaglio aggiuntivo e un buon lavoro di verniciatura riesce a trasmettere bene l’atmosfera delle operazioni anfibie nel teatro del Pacifico. Realizzato in configurazione statica, senza interni, ma con particolare cura per le strutture di ponte e il weathering salmastro.', 'lsmmio.jpg', 'lsmdow.jpg');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `catalogo`
--
ALTER TABLE `catalogo`
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_modello` (`id_modello`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `modello`
--
ALTER TABLE `modello`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `catalogo`
--
ALTER TABLE `catalogo`
  ADD CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalogo_ibfk_2` FOREIGN KEY (`id_modello`) REFERENCES `modello` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
