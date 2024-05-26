-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : sam. 25 mai 2024 à 09:13
-- Version du serveur :  8.4.0
-- Version de PHP : 7.4.15

-- SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `tree`
--

DROP TABLE IF EXISTS `tree`;
CREATE TABLE `tree` (
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='describe trees';

--
-- Déchargement des données de la table `tree`
--

-- SET FOREIGN_KEY_CHECKS=1;
COMMIT;
