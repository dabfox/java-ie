-- phpMyAdmin SQL Dump
-- version 4.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Sep 11, 2017 at 02:05 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ufugoBora`
--

-- --------------------------------------------------------

--
-- Table structure for table `anamnese`
--

CREATE TABLE `anamnese` (
  `idAnamnese` varchar(10) NOT NULL,
  `dateAnamnese` date NOT NULL,
  `signeAnamnese` text NOT NULL,
  `observationAnamnese` text NOT NULL,
  `intervenantAnamnese` varchar(30) NOT NULL,
  `idBerger` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berger`
--

CREATE TABLE `berger` (
  `idBerger` varchar(10) NOT NULL,
  `nomBerger` varchar(30) NOT NULL,
  `imageBerger` varchar(50) NOT NULL,
  `idTroupeau` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bovins`
--

CREATE TABLE `bovins` (
  `idBovin` varchar(10) NOT NULL,
  `nomBovin` varchar(30) DEFAULT NULL,
  `robeBovin` varchar(30) DEFAULT NULL,
  `raceBovin` varchar(45) DEFAULT NULL,
  `numBoucle` varchar(10) DEFAULT NULL,
  `sexeBovin` varchar(10) DEFAULT NULL,
  `poidBovin` decimal(3,2) DEFAULT NULL,
  `tourPoitrine` decimal(3,2) DEFAULT NULL,
  `nomMere` varchar(30) DEFAULT NULL,
  `nomPere` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `carnetsanitaire`
--

CREATE TABLE `carnetsanitaire` (
  `idCarnet` varchar(10) NOT NULL,
  `idBovin` varchar(10) DEFAULT NULL,
  `idAnamnese` varchar(10) DEFAULT NULL,
  `idExamen` varchar(10) DEFAULT NULL,
  `idTraitement` varchar(10) DEFAULT NULL,
  `idDiagnostique` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoriebovin`
--

CREATE TABLE `categoriebovin` (
  `idcategorie` int(2) NOT NULL,
  `categorie` varchar(30) NOT NULL,
  `dateChangementCat` date NOT NULL,
  `imageBovin` text NOT NULL,
  `idBovin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostique`
--

CREATE TABLE `diagnostique` (
  `idDiagnostique` varchar(10) NOT NULL,
  `dateDiagnostique` date NOT NULL,
  `diagnostique` text NOT NULL,
  `observationDiagnostique` text NOT NULL,
  `intervenantDiagno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `examenlabo`
--

CREATE TABLE `examenlabo` (
  `idExamen` varchar(10) NOT NULL,
  `dateExamen` date NOT NULL,
  `symptomeExamen` text NOT NULL,
  `observationExamen` text NOT NULL,
  `intervenantExamen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicament`
--

CREATE TABLE `medicament` (
  `idMedicament` varchar(10) NOT NULL,
  `nomMedicament` varchar(30) NOT NULL,
  `principeActive` varchar(30) NOT NULL,
  `conditionnement` varchar(30) NOT NULL,
  `quantiteApplique` decimal(4,2) NOT NULL,
  `posologie` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productionlaitviande`
--

CREATE TABLE `productionlaitviande` (
  `idProduction` int(10) NOT NULL,
  `typeProduction` varchar(30) NOT NULL,
  `quantiteProduit` decimal(4,2) NOT NULL,
  `dateProduction` date NOT NULL,
  `idBovin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sortiebovin`
--

CREATE TABLE `sortiebovin` (
  `idSortie` int(10) NOT NULL,
  `dateSortie` date NOT NULL,
  `causeSortie` varchar(30) NOT NULL,
  `idBovin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `traitementbovin`
--

CREATE TABLE `traitementbovin` (
  `idTraitement` varchar(10) NOT NULL,
  `protocoleSoin` varchar(30) NOT NULL,
  `dateDebutTraitement` date NOT NULL,
  `dateFinTraitement` date NOT NULL,
  `voieAdministration` varchar(30) NOT NULL,
  `administrationMed` varchar(30) NOT NULL,
  `observationTraitement` text NOT NULL,
  `intervenantTraitement` varchar(30) NOT NULL,
  `idMedicament` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `troupeaubovin`
--

CREATE TABLE `troupeaubovin` (
  `idTroupeau` varchar(10) NOT NULL,
  `nomTroupeau` varchar(30) NOT NULL,
  `dateEntree` date NOT NULL,
  `dateSortie` date NOT NULL,
  `idBovin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `velage`
--

CREATE TABLE `velage` (
  `idvelage` int(10) NOT NULL,
  `dateVelage` date NOT NULL,
  `avortement` tinyint(4) NOT NULL,
  `transplantation` tinyint(4) NOT NULL,
  `mortNee` tinyint(4) NOT NULL,
  `conditionNaissance` varchar(30) NOT NULL,
  `observationVelage` varchar(100) NOT NULL,
  `idBovin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anamnese`
--
ALTER TABLE `anamnese`
  ADD PRIMARY KEY (`idAnamnese`),
  ADD KEY `idBerger` (`idBerger`),
  ADD KEY `idAnamnese` (`idAnamnese`),
  ADD KEY `idAnamnese_2` (`idAnamnese`);

--
-- Indexes for table `berger`
--
ALTER TABLE `berger`
  ADD PRIMARY KEY (`idBerger`),
  ADD KEY `idTroupeau` (`idTroupeau`);

--
-- Indexes for table `bovins`
--
ALTER TABLE `bovins`
  ADD PRIMARY KEY (`idBovin`);

--
-- Indexes for table `carnetsanitaire`
--
ALTER TABLE `carnetsanitaire`
  ADD PRIMARY KEY (`idCarnet`),
  ADD KEY `idBovin` (`idBovin`),
  ADD KEY `idAnamnese` (`idAnamnese`),
  ADD KEY `idExamen` (`idExamen`),
  ADD KEY `idTraitement` (`idTraitement`),
  ADD KEY `idDiagnostique` (`idDiagnostique`);

--
-- Indexes for table `categoriebovin`
--
ALTER TABLE `categoriebovin`
  ADD PRIMARY KEY (`idcategorie`),
  ADD UNIQUE KEY `idBovin` (`idBovin`);

--
-- Indexes for table `diagnostique`
--
ALTER TABLE `diagnostique`
  ADD PRIMARY KEY (`idDiagnostique`);

--
-- Indexes for table `examenlabo`
--
ALTER TABLE `examenlabo`
  ADD PRIMARY KEY (`idExamen`);

--
-- Indexes for table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedicament`);

--
-- Indexes for table `productionlaitviande`
--
ALTER TABLE `productionlaitviande`
  ADD PRIMARY KEY (`idProduction`),
  ADD KEY `idBovin` (`idBovin`),
  ADD KEY `idBovin_2` (`idBovin`);

--
-- Indexes for table `sortiebovin`
--
ALTER TABLE `sortiebovin`
  ADD PRIMARY KEY (`idSortie`),
  ADD KEY `idBovin` (`idBovin`);

--
-- Indexes for table `traitementbovin`
--
ALTER TABLE `traitementbovin`
  ADD PRIMARY KEY (`idTraitement`),
  ADD KEY `idMedicament` (`idMedicament`);

--
-- Indexes for table `troupeaubovin`
--
ALTER TABLE `troupeaubovin`
  ADD PRIMARY KEY (`idTroupeau`),
  ADD KEY `idBovin` (`idBovin`);

--
-- Indexes for table `velage`
--
ALTER TABLE `velage`
  ADD PRIMARY KEY (`idvelage`),
  ADD KEY `idBovin` (`idBovin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoriebovin`
--
ALTER TABLE `categoriebovin`
  MODIFY `idcategorie` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productionlaitviande`
--
ALTER TABLE `productionlaitviande`
  MODIFY `idProduction` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sortiebovin`
--
ALTER TABLE `sortiebovin`
  MODIFY `idSortie` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `velage`
--
ALTER TABLE `velage`
  MODIFY `idvelage` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `anamnese`
--
ALTER TABLE `anamnese`
  ADD CONSTRAINT `fk_berger_anamnese` FOREIGN KEY (`idBerger`) REFERENCES `berger` (`idBerger`);

--
-- Constraints for table `berger`
--
ALTER TABLE `berger`
  ADD CONSTRAINT `fk_troupeau_berger` FOREIGN KEY (`idTroupeau`) REFERENCES `troupeaubovin` (`idTroupeau`);

--
-- Constraints for table `carnetsanitaire`
--
ALTER TABLE `carnetsanitaire`
  ADD CONSTRAINT `fk_anamnese_carnet` FOREIGN KEY (`idAnamnese`) REFERENCES `anamnese` (`idAnamnese`),
  ADD CONSTRAINT `fk_bovin_carnet` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`),
  ADD CONSTRAINT `fk_diagostique_carnet` FOREIGN KEY (`idDiagnostique`) REFERENCES `diagnostique` (`idDiagnostique`),
  ADD CONSTRAINT `fk_examen_carnet` FOREIGN KEY (`idExamen`) REFERENCES `examenlabo` (`idExamen`),
  ADD CONSTRAINT `fk_traitement_carnet` FOREIGN KEY (`idTraitement`) REFERENCES `traitementbovin` (`idTraitement`);

--
-- Constraints for table `categoriebovin`
--
ALTER TABLE `categoriebovin`
  ADD CONSTRAINT `fk_bovin_categorie` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`);

--
-- Constraints for table `productionlaitviande`
--
ALTER TABLE `productionlaitviande`
  ADD CONSTRAINT `fk_bovin_production` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`);

--
-- Constraints for table `sortiebovin`
--
ALTER TABLE `sortiebovin`
  ADD CONSTRAINT `fk_bovin_sortie` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`);

--
-- Constraints for table `traitementbovin`
--
ALTER TABLE `traitementbovin`
  ADD CONSTRAINT `fk_medicament_traitement` FOREIGN KEY (`idMedicament`) REFERENCES `medicament` (`idMedicament`);

--
-- Constraints for table `troupeaubovin`
--
ALTER TABLE `troupeaubovin`
  ADD CONSTRAINT `fk_bovin_troupeau` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`);

--
-- Constraints for table `velage`
--
ALTER TABLE `velage`
  ADD CONSTRAINT `fk_bovin_velage` FOREIGN KEY (`idBovin`) REFERENCES `bovins` (`idBovin`);
