-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: RODRIGUEZ_VALENTINO_DEVA1A_SONDEHYDRO_164_2025

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS RODRIGUEZ_VALENTINO_DEVA1A_SONDEHYDRO_164_2025;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS RODRIGUEZ_VALENTINO_DEVA1A_SONDEHYDRO_164_2025;

-- Utilisation de cette base de donnée

USE RODRIGUEZ_VALENTINO_DEVA1A_SONDEHYDRO_164_2025;
-- --------------------------------------------------------

--
-- Table structure for table `t_arrosages`
--

CREATE TABLE `t_arrosages` (
  `id_arrosage` int NOT NULL,
  `arrosages_date` datetime DEFAULT NULL,
  `arrosage_quant` int DEFAULT NULL,
  `arrosage_duree` double DEFAULT NULL,
  `arrosage_iteration` tinyint DEFAULT NULL,
  `arrosage_position` point DEFAULT NULL,
  `arrosage_methode` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_culture`
--

CREATE TABLE `t_culture` (
  `id_culture` int NOT NULL,
  `culture_cultivar` varchar(40) DEFAULT NULL,
  `culture_rotation` tinyint DEFAULT NULL,
  `culture_ligne` int DEFAULT NULL,
  `culture_plantage` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_donnee_sonde`
--

CREATE TABLE `t_donnee_sonde` (
  `id_don_sonde` int NOT NULL,
  `don_sond_temps` datetime DEFAULT NULL,
  `don_sond_num_sonde` int DEFAULT NULL,
  `don_sond_position` point DEFAULT NULL,
  `don_sond_data` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_meteo`
--

CREATE TABLE `t_meteo` (
  `id_meteo` int NOT NULL,
  `meteo_position` point DEFAULT NULL,
  `meteo_date` datetime DEFAULT NULL,
  `meteo_temp` tinyint DEFAULT NULL,
  `meteo_vent` tinyint DEFAULT NULL,
  `meteo_hydro` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_parcel`
--

CREATE TABLE `t_parcel` (
  `id_parcel` int NOT NULL,
  `parcel_numero` int DEFAULT NULL,
  `parcel_type_sol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parcel_traitement` varchar(48) DEFAULT NULL,
  `parcel_hydro` tinyint DEFAULT NULL,
  `parcel_arrosage` int DEFAULT NULL,
  `parcel_plantation` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_sonde`
--

CREATE TABLE `t_sonde` (
  `id_sonde` int NOT NULL,
  `sonde_numero` tinyint DEFAULT NULL,
  `sonde_position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_arrosages`
--
ALTER TABLE `t_arrosages`
  ADD PRIMARY KEY (`id_arrosage`);

--
-- Indexes for table `t_culture`
--
ALTER TABLE `t_culture`
  ADD PRIMARY KEY (`id_culture`);

--
-- Indexes for table `t_donnee_sonde`
--
ALTER TABLE `t_donnee_sonde`
  ADD PRIMARY KEY (`id_don_sonde`);

--
-- Indexes for table `t_meteo`
--
ALTER TABLE `t_meteo`
  ADD PRIMARY KEY (`id_meteo`);

--
-- Indexes for table `t_parcel`
--
ALTER TABLE `t_parcel`
  ADD PRIMARY KEY (`id_parcel`);

--
-- Indexes for table `t_sonde`
--
ALTER TABLE `t_sonde`
  ADD PRIMARY KEY (`id_sonde`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_arrosages`
--
ALTER TABLE `t_arrosages`
  MODIFY `id_arrosage` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_culture`
--
ALTER TABLE `t_culture`
  MODIFY `id_culture` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_donnee_sonde`
--
ALTER TABLE `t_donnee_sonde`
  MODIFY `id_don_sonde` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_meteo`
--
ALTER TABLE `t_meteo`
  MODIFY `id_meteo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parcel`
--
ALTER TABLE `t_parcel`
  MODIFY `id_parcel` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_sonde`
--
ALTER TABLE `t_sonde`
  MODIFY `id_sonde` int NOT NULL AUTO_INCREMENT;
COMMIT;