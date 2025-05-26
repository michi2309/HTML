-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mag 26, 2025 alle 19:03
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
(1, 1),
(2, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(4, 2),
(11, 3),
(1, 4),
(2, 4),
(4, 4),
(7, 4),
(9, 4),
(11, 4),
(8, 5),
(10, 6);

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
  `nome` varchar(30) NOT NULL DEFAULT 'Michele Carrer' COMMENT 'nome veicolo',
  `dati` varchar(50) NOT NULL COMMENT 'produttore e scala',
  `descrizione` varchar(2000) NOT NULL,
  `immagine1` varchar(100) NOT NULL COMMENT 'immagine modello',
  `immagine2` varchar(100) NOT NULL COMMENT 'immagine vera',
  `user` varchar(15) NOT NULL COMMENT 'aggiunto da:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabella principale con i dati del veicolo';

--
-- Dump dei dati per la tabella `modello`
--

INSERT INTO `modello` (`id`, `nome`, `dati`, `descrizione`, `immagine1`, `immagine2`, `user`) VALUES
(1, 'Puma sd.kfz 234/2', 'DRAGON MODELS 1/35', 'Riproduzione del leggendario blindato tedesco, in configurazione da pattugliamento e ricognizione, con cannone da 50mm. Il kit è uno dei più complicati che mi sia mai finito tra le mani, ma l\'ottima fattura ha permesso una realizzazione relativamente veloce; di fatto il kit ammontava a più di 700 pezzi, un numero raramente pareggiato da gommati simili.\r\nLa presenza degli interni è interessante ma per la maggior parte nascosta, forse avrei preferito una versione senza di essi a un prezzo ridotto', 'IMG_4092.JPEG', 'puma.jpg', 'Michele Carrer'),
(2, 'M36B2', 'AIRFIX 1/35', 'Riproduzione del semovente M36B2 in servizio con le forze francesi durante la guerra d’Indocina. Il kit, firmato Airfix, è una base solida ma mostra la sua età in diversi punti: dettagli un po’ morbidi e qualche imprecisione nei pezzi principali, la presenza degli interni si apprezza grazie alla natura open-top del mezzo. Tuttavia, con un po’ di lavoro extra e qualche aggiunta aftermarket, si riesce a tirare fuori un modello interessante e poco visto, soprattutto in questo teatro operativo. Colorazione e invecchiamento sono stati fondamentali per dargli carattere, visto il periodo storico in cui ho ambientato il kit.', 'IMG_1963.JPEG', 'm36dow.jpg', 'Michele Carrer'),
(4, 'USA Navy LSM', 'REVELL 1/144', 'Riproduzione di una nave da sbarco media (Landing Ship Medium – LSM) della US Navy, usata intensamente nel Pacifico durante la Seconda Guerra Mondiale. Il kit ha un’impostazione semplice ma permette di ottenere un modello d’effetto grazie alle dimensioni generose e alla linea inconfondibile. Le stampate non sono recentissime, ma con qualche dettaglio aggiuntivo e un buon lavoro di verniciatura riesce a trasmettere bene l’atmosfera delle operazioni anfibie nel teatro del Pacifico. Realizzato in configurazione statica, senza interni, ma con particolare cura per le strutture di ponte e il weathering salmastro.', 'IMG_4089.JPEG', 'lsmdow.jpg', 'Michele Carrer'),
(7, 'Jagdpanzer 38(t) Etzer', 'AIRFIX 1/35', ' Riproduzione dell’Hetzer in servizio sul fronte orientale, versione gialla ispirata alle fasi finali del conflitto. Il kit Airfix è semplice e diretto, senza troppi fronzoli, ma con buone proporzioni. Verniciato in giallo scuro con pesante weathering per simulare il fango e la polvere della campagna di Russia, il modello guadagna carattere nonostante la base modesta. I dettagli sono stati valorizzati con lavaggi e pigmenti, soprattutto attorno ai carrelli e alle piastre frontali. Lavoro rapido ma d’impatto, perfetto per chi vuole un Hetzer sporco e cattivo senza impazzire con troppe parti.', 'IMG_4082.JPEG', 'Gl36TCu.jpeg', 'Michele Carrer'),
(8, 'M1A1 Abrams', 'TAMIYA 1/35', 'Riproduzione del carro armato M1A1 Abrams equipaggiato con sistema antimina \"mineplow\", in configurazione operativa da Guerra del Golfo. Il kit è Tamiya, quindi montaggio fluido e dettagli ben definiti già da scatola. La lama antimina è il pezzo forte: massiccia, aggressiva, e dà subito l’idea del mezzo pronto a farsi strada nei campi minati. Verniciatura in sabbia con leggere variazioni tonali e invecchiamento a secco per simulare polvere e abrasioni. Ho aggiunto diversi effetti personali dei carristi, caratteristica comune e visivamente interessante nei grandi carri moderni. Un kit divertente e ben bilanciato, visivamente potente.', 'IMG_4087.JPEG', 'IMG_2222.JPEG', 'Michele Carrer'),
(9, 'Panzer 3L', 'TAMIYA 1/35', 'Riproduzione del Panzer III Ausf. L in servizio in Nord Africa, con colorazione sabbia molto usurata e segni evidenti di operazioni prolungate nel deserto. Il kit è stato lavorato pesantemente con tecniche di chipping, lavaggi a olio e pigmenti per simulare polvere, sabbia e usura meccanica. Il colore originale appare scolorito e graffiato in più punti, con i bordi vivi esposti e i pannelli superiori opacizzati dal sole. Cingoli impolverati, marmitta arrugginita e schizzi di sabbia secca completano il look da mezzo esausto ma ancora operativo. Kit semplice ma perfetto da spingere al limite col weathering.', 'IMG_4084.JPEG', 'vrm7EoN.jpg', 'Michele Carrer'),
(10, 'B1 Centauro (3)', 'TRUMPETER 1/35', 'Riproduzione del Centauro Serie 3, in configurazione verde NATO dell’Esercito Italiano, con leggera sporcatura da ambiente montano. Il kit Trumpeter è solido e ben dettagliato: assemblaggio fluido, ruote in gomma, fotoincisioni essenziali e una torretta ben proporzionata. Il verde è stato applicato con leggere variazioni tonali per evitare l’effetto piatto, mentre il weathering è stato calibrato per simulare polvere e fango asciutto tipici dei terreni rocciosi e sterrati. Nessuna modifica importante, ma un buon lavoro di lavaggi e pigmenti ha dato vita a un mezzo realistico e credibile.', 'IMG_4085.JPEG', 'AA1zKR6E.jpg', 'Michele Carrer'),
(11, 'P-38J Lightning', 'ACADEMY 1/48', 'Riproduzione del Lockheed P-38J “Droop Snoot” in scala 1/48 su base Academy, variante poco comune con prua trasparente per missioni di bombardamento. Il kit è ben fatto ma richiede attenzione nella zona anteriore e aggiunta di peso nel muso per evitare che si ribalti. Verniciatura in metallo naturale e decal buone, ma migliorabili con aftermarket. Una scelta interessante per chi cerca qualcosa di diverso dal solito Lightning.', 'p38.jpg', 'p38dow.jpg', 'Olivier Markaj');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id_modello`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `catalogo`
--
ALTER TABLE `catalogo`
  ADD CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catalogo_ibfk_2` FOREIGN KEY (`id_modello`) REFERENCES `modello` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
