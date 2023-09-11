-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2023 at 11:14 AM
-- Server version: 5.7.43
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alrahma1_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_details`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'MOMINUR RAHMAN', 'HAND CASH', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 0, NULL, 2, 1, NULL, '2023-07-18 12:15:27', '2023-07-18 12:24:53'),
(2, 2, 'MARUF', 'HAND CASH', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 0, NULL, 2, 0, NULL, '2023-07-18 12:29:53', '2023-07-19 12:45:02'),
(3, 2, 'BABUL MIA', 'CASH IN HAND', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 0, NULL, 2, 0, NULL, '2023-07-18 12:38:31', '2023-07-19 11:43:14'),
(4, 2, 'AL RAHMAN TRADERS', '34529010', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 0, NULL, 4, 0, NULL, '2023-07-20 10:13:44', '2023-07-20 10:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'credit', 'deposit', 3700.0000, NULL, '2023-05-08 18:16:00', 2, NULL, NULL, 2, NULL, NULL, '2023-07-18 12:16:49', '2023-07-18 12:16:49'),
(2, 1, 'debit', 'deposit', 3700.0000, NULL, '2023-05-08 18:16:00', 2, NULL, NULL, 1, NULL, NULL, '2023-07-18 12:16:49', '2023-07-18 12:16:49'),
(3, 2, 'credit', 'opening_balance', 0.0000, NULL, '2023-07-18 18:29:53', 2, NULL, NULL, NULL, NULL, NULL, '2023-07-18 12:29:53', '2023-07-18 12:29:53'),
(4, 2, 'credit', NULL, 2200.0000, NULL, '2023-05-01 18:00:00', 2, 31, 2, NULL, NULL, NULL, '2023-07-18 12:31:17', '2023-07-18 12:31:17'),
(5, 2, 'credit', NULL, 2200.0000, NULL, '2023-05-08 18:06:00', 2, 32, 3, NULL, NULL, NULL, '2023-07-18 12:31:31', '2023-07-20 12:51:49'),
(6, 3, 'credit', NULL, 1600.0000, NULL, '2023-05-07 19:21:00', 4, 33, 4, NULL, NULL, NULL, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(7, 3, 'credit', NULL, 640.0000, NULL, '2023-05-07 16:07:00', 4, 35, 5, NULL, NULL, NULL, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(8, 3, 'credit', NULL, 2855.0000, NULL, '2023-05-15 16:23:00', 4, 36, 6, NULL, NULL, NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(9, 3, 'credit', NULL, 2400.0000, NULL, '2023-05-25 16:34:00', 4, 37, 7, NULL, NULL, NULL, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(10, 3, 'credit', NULL, 3000.0000, NULL, '2023-05-25 16:38:00', 4, 38, 8, NULL, NULL, NULL, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(11, 3, 'credit', NULL, 3480.0000, NULL, '2023-05-27 17:35:00', 4, 39, 9, NULL, NULL, NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(12, 3, 'credit', NULL, 2300.0000, NULL, '2023-05-29 15:39:00', 4, 40, 11, NULL, NULL, NULL, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(13, 3, 'credit', NULL, 6300.0000, NULL, '2023-06-07 15:41:00', 4, 41, 12, NULL, NULL, NULL, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(14, 3, 'credit', NULL, 1270.0000, NULL, '2023-06-07 15:44:00', 4, 42, 13, NULL, NULL, NULL, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(15, 3, 'credit', NULL, 2520.0000, NULL, '2023-06-07 15:48:00', 4, 43, 14, NULL, NULL, NULL, '2023-07-20 09:50:24', '2023-07-20 12:07:30'),
(16, 3, 'credit', NULL, 1550.0000, NULL, '2023-06-17 15:52:00', 4, 44, 15, NULL, NULL, NULL, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(17, 3, 'credit', NULL, 900.0000, NULL, '2023-06-08 15:54:00', 4, 45, 16, NULL, NULL, NULL, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(18, 3, 'credit', NULL, 2300.0000, NULL, '2023-06-11 15:56:00', 4, 46, 17, NULL, NULL, NULL, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(19, 3, 'credit', NULL, 2250.0000, NULL, '2023-06-12 15:59:00', 4, 47, 18, NULL, NULL, NULL, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(20, 4, 'credit', NULL, 17880.0000, NULL, '2023-06-17 16:14:00', 4, 48, 19, NULL, NULL, NULL, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(21, 3, 'credit', NULL, 3000.0000, NULL, '2023-06-20 16:18:00', 4, 49, 20, NULL, NULL, NULL, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(22, 3, 'debit', NULL, 18400.0000, NULL, '2023-06-17 16:23:00', 4, 30, 21, NULL, NULL, NULL, '2023-07-20 10:23:14', '2023-07-20 10:24:05'),
(23, 3, 'credit', NULL, 500.0000, NULL, '2023-06-20 17:11:00', 4, 50, 22, NULL, NULL, NULL, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(24, 3, 'credit', NULL, 900.0000, NULL, '2023-06-22 17:14:00', 4, 51, 23, NULL, NULL, NULL, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(25, 3, 'credit', NULL, 1500.0000, NULL, '2023-06-27 17:55:00', 4, 53, 24, NULL, NULL, NULL, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(26, 3, 'credit', NULL, 2150.0000, NULL, '2023-07-09 17:57:00', 4, 54, 25, NULL, NULL, NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(27, 3, 'credit', NULL, 1050.0000, NULL, '2023-07-10 18:03:00', 4, 55, 26, NULL, NULL, NULL, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(28, 3, 'credit', NULL, 600.0000, NULL, '2023-07-11 18:05:00', 4, 56, 27, NULL, NULL, NULL, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(29, 3, 'credit', NULL, 3500.0000, NULL, '2023-07-13 18:08:00', 4, 57, 28, NULL, NULL, NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(30, 3, 'credit', NULL, 3300.0000, NULL, '2023-07-15 18:21:00', 4, 59, 29, NULL, NULL, NULL, '2023-07-20 12:22:52', '2023-07-20 12:52:59'),
(31, 3, 'credit', NULL, 800.0000, NULL, '2023-07-17 19:18:00', 4, 60, 30, NULL, NULL, NULL, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(32, 3, 'credit', NULL, 700.0000, NULL, '2023-07-18 19:22:00', 4, 61, 31, NULL, NULL, NULL, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(33, 3, 'credit', NULL, 1700.0000, NULL, '2023-07-18 19:25:00', 4, 62, 32, NULL, NULL, NULL, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(34, 3, 'credit', NULL, 2500.0000, NULL, '2023-07-19 19:26:00', 4, 63, 33, NULL, NULL, NULL, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(35, 3, 'debit', 'fund_transfer', 2030.0000, NULL, '2023-06-20 19:38:00', 4, NULL, NULL, 36, 'COURIER=1500/\r\nCOURIER=530/', NULL, '2023-07-20 13:38:07', '2023-07-20 13:38:07'),
(36, 2, 'credit', 'fund_transfer', 2030.0000, NULL, '2023-06-20 19:38:00', 4, NULL, NULL, 35, 'COURIER=1500/\r\nCOURIER=530/', NULL, '2023-07-20 13:38:07', '2023-07-20 13:38:07'),
(37, 2, 'debit', NULL, 39000.0000, NULL, '2023-06-17 18:48:00', 4, 34, 10, NULL, NULL, NULL, '2023-07-20 13:49:14', '2023-07-20 13:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 08:12:52', '2023-04-08 08:12:52'),
(2, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 08:57:43', '2023-04-08 08:57:43'),
(3, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 14:40:22', '2023-04-08 14:40:22'),
(4, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:13:16', '2023-04-08 15:13:16'),
(5, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:13:28', '2023-04-08 15:13:28'),
(6, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:15:10', '2023-04-08 15:15:10'),
(7, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:16:32', '2023-04-08 15:16:32'),
(8, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:19:17', '2023-04-08 15:19:17'),
(9, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 14:49:39', '2023-04-08 14:49:39'),
(10, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 14:50:11', '2023-04-08 14:50:11'),
(11, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:20:19', '2023-04-08 15:20:19'),
(12, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:20:44', '2023-04-08 15:20:44'),
(13, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 14:51:07', '2023-04-08 14:51:07'),
(14, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2023-04-08 14:51:50', '2023-04-08 14:51:50'),
(15, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:21:59', '2023-04-08 15:21:59'),
(16, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:24:44', '2023-04-08 15:24:44'),
(17, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:25:27', '2023-04-08 15:25:27'),
(18, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:25:34', '2023-04-08 15:25:34'),
(19, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:31:07', '2023-04-08 15:31:07'),
(20, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-08 15:49:45', '2023-04-08 15:49:45'),
(21, 'default', 'added', 2, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2500}}', NULL, '2023-04-08 16:20:05', '2023-04-08 16:20:05'),
(22, 'default', 'added', 3, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2200}}', NULL, '2023-04-08 16:26:48', '2023-04-08 16:26:48'),
(23, 'default', 'added', 4, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2200}}', NULL, '2023-04-08 16:27:34', '2023-04-08 16:27:34'),
(24, 'default', 'added', 7, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5000}}', NULL, '2023-04-08 16:57:10', '2023-04-08 16:57:10'),
(25, 'default', 'added', 8, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":0}}', NULL, '2023-04-08 17:02:04', '2023-04-08 17:02:04'),
(26, 'default', 'sell_deleted', 4, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":4,\"invoice_no\":\"0003\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-08 17:04:25', '2023-04-08 17:04:25'),
(27, 'default', 'sell_deleted', 3, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":3,\"invoice_no\":\"0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-08 17:04:31', '2023-04-08 17:04:31'),
(28, 'default', 'sell_deleted', 2, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":2,\"invoice_no\":\"0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2500.0000\"}}', NULL, '2023-04-08 17:04:38', '2023-04-08 17:04:38'),
(29, 'default', 'sell_deleted', 7, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":7,\"invoice_no\":\"0004\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"5000.0000\"}}', NULL, '2023-04-08 17:08:31', '2023-04-08 17:08:31'),
(30, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 03:07:29', '2023-04-09 03:07:29'),
(31, 'default', 'added', 3, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 03:11:36', '2023-04-09 03:11:36'),
(32, 'default', 'added', 9, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":2800}}', NULL, '2023-04-09 03:13:29', '2023-04-09 03:13:29'),
(33, 'default', 'added', 4, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 03:14:22', '2023-04-09 03:14:22'),
(34, 'default', 'added', 10, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":2200}}', NULL, '2023-04-09 03:15:30', '2023-04-09 03:15:30'),
(35, 'default', 'added', 11, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', NULL, '2023-04-09 03:31:45', '2023-04-09 03:31:45'),
(36, 'default', 'added', 12, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5000}}', NULL, '2023-04-09 03:59:11', '2023-04-09 03:59:11'),
(37, 'default', 'added', 15, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1200}}', NULL, '2023-04-09 04:17:55', '2023-04-09 04:17:55'),
(38, 'default', 'payment_edited', 15, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 04:22:08', '2023-04-09 04:22:08'),
(39, 'default', 'imported', 5, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 04:30:38', '2023-04-09 04:30:38'),
(40, 'default', 'added', 6, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 05:16:02', '2023-04-09 05:16:02'),
(41, 'default', 'added', 16, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-09 05:16:52', '2023-04-09 05:16:52'),
(42, 'default', 'payment_edited', 16, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 05:21:43', '2023-04-09 05:21:43'),
(43, 'default', 'added', 7, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 05:24:57', '2023-04-09 05:24:57'),
(44, 'default', 'added', 17, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1200}}', NULL, '2023-04-09 05:25:54', '2023-04-09 05:25:54'),
(45, 'default', 'added', 18, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":1200}}', NULL, '2023-04-09 05:28:23', '2023-04-09 05:28:23'),
(46, 'default', 'edited', 18, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 05:34:17', '2023-04-09 05:34:17'),
(47, 'default', 'payment_edited', 18, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 05:35:31', '2023-04-09 05:35:31'),
(48, 'default', 'added', 19, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-09 05:38:47', '2023-04-09 05:38:47'),
(49, 'default', 'payment_edited', 19, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 05:42:39', '2023-04-09 05:42:39'),
(50, 'default', 'added', 20, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":2200}}', NULL, '2023-04-09 05:44:41', '2023-04-09 05:44:41'),
(51, 'default', 'payment_edited', 20, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-09 05:47:17', '2023-04-09 05:47:17'),
(52, 'default', 'added', 21, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":2200}}', NULL, '2023-04-09 07:31:22', '2023-04-09 07:31:22'),
(53, 'default', 'edited', 21, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"payment_status\":\"due\",\"final_total\":2200},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-09 07:33:51', '2023-04-09 07:33:51'),
(54, 'default', 'edited', 21, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"payment_status\":\"due\",\"final_total\":\"2200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"payment_status\":\"due\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-09 07:35:43', '2023-04-09 07:35:43'),
(55, 'default', 'edited', 21, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2200},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"payment_status\":\"due\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-09 07:38:26', '2023-04-09 07:38:26'),
(56, 'default', 'added', 8, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 07:40:50', '2023-04-09 07:40:50'),
(57, 'default', 'edited', 8, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 07:43:43', '2023-04-09 07:43:43'),
(58, 'default', 'edited', 8, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 07:48:34', '2023-04-09 07:48:34'),
(59, 'default', 'added', 23, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-09 07:49:39', '2023-04-09 07:49:39'),
(60, 'default', 'sell_deleted', 21, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":21,\"invoice_no\":\"2023\\/0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2200.0000\"}}', NULL, '2023-04-09 08:12:35', '2023-04-09 08:12:35'),
(61, 'default', 'added', 24, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":2200}}', NULL, '2023-04-09 09:25:21', '2023-04-09 09:25:21'),
(62, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 13:05:16', '2023-04-09 13:05:16'),
(63, 'default', 'added', 25, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":2200}}', NULL, '2023-04-09 13:15:31', '2023-04-09 13:15:31'),
(64, 'default', 'added', 9, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 13:37:33', '2023-04-09 13:37:33'),
(65, 'default', 'added', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-09 13:39:13', '2023-04-09 13:39:13'),
(66, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 14:50:22', '2023-04-09 14:50:22'),
(67, 'default', 'added', 27, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-09 14:58:20', '2023-04-09 14:58:20'),
(68, 'default', 'added', 28, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":1200}}', NULL, '2023-04-09 15:04:08', '2023-04-09 15:04:08'),
(69, 'default', 'sell_deleted', 27, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":27,\"invoice_no\":\"0019\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-09 15:09:41', '2023-04-09 15:09:41'),
(70, 'default', 'edited', 9, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:11:44', '2023-04-09 16:11:44'),
(71, 'default', 'edited', 8, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:12:02', '2023-04-09 16:12:02'),
(72, 'default', 'edited', 7, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:12:13', '2023-04-09 16:12:13'),
(73, 'default', 'edited', 6, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:12:23', '2023-04-09 16:12:23'),
(74, 'default', 'edited', 5, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:12:35', '2023-04-09 16:12:35'),
(75, 'default', 'edited', 2, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:12:57', '2023-04-09 16:12:57'),
(76, 'default', 'edited', 3, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:13:10', '2023-04-09 16:13:10'),
(77, 'default', 'edited', 4, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 16:14:36', '2023-04-09 16:14:36'),
(78, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 17:44:25', '2023-04-09 17:44:25'),
(79, 'default', 'added', 27, 'App\\Transaction', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 17:48:27', '2023-04-09 17:48:27'),
(80, 'default', 'added', 28, 'App\\Transaction', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-09 17:49:56', '2023-04-09 17:49:56'),
(81, 'default', 'added', 29, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1200}}', NULL, '2023-04-09 17:52:02', '2023-04-09 17:52:02'),
(82, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:27:50', '2023-04-10 03:27:50'),
(83, 'default', 'added', 3, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\" Shobuz \"}', NULL, '2023-04-10 03:32:28', '2023-04-10 03:32:28'),
(84, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:32:38', '2023-04-10 03:32:38'),
(85, 'default', 'login', 3, 'App\\User', NULL, 2, 3, 'App\\User', '[]', NULL, '2023-04-10 03:32:49', '2023-04-10 03:32:49'),
(86, 'default', 'logout', 3, 'App\\User', NULL, 2, 3, 'App\\User', '[]', NULL, '2023-04-10 03:33:21', '2023-04-10 03:33:21'),
(87, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:33:29', '2023-04-10 03:33:29'),
(88, 'default', 'edited', 3, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\" Shobuz \"}', NULL, '2023-04-10 03:34:10', '2023-04-10 03:34:10'),
(89, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:38:06', '2023-04-10 03:38:06'),
(90, 'default', 'login', 3, 'App\\User', NULL, 2, 3, 'App\\User', '[]', NULL, '2023-04-10 03:38:16', '2023-04-10 03:38:16'),
(91, 'default', 'logout', 3, 'App\\User', NULL, 2, 3, 'App\\User', '[]', NULL, '2023-04-10 03:45:51', '2023-04-10 03:45:51'),
(92, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:45:59', '2023-04-10 03:45:59'),
(93, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 03:48:37', '2023-04-10 03:48:37'),
(94, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 04:32:33', '2023-04-10 04:32:33'),
(95, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 04:32:53', '2023-04-10 04:32:53'),
(96, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 04:34:29', '2023-04-10 04:34:29'),
(97, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 04:34:44', '2023-04-10 04:34:44'),
(98, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 04:37:52', '2023-04-10 04:37:52'),
(99, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 09:48:43', '2023-04-10 09:48:43'),
(100, 'default', 'added', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-10 09:52:03', '2023-04-10 09:52:03'),
(101, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 09:54:30', '2023-04-10 09:54:30'),
(102, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 10:00:36', '2023-04-10 10:00:36'),
(103, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 13:08:30', '2023-04-10 13:08:30'),
(104, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 13:10:01', '2023-04-10 13:10:01'),
(105, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 13:10:34', '2023-04-10 13:10:34'),
(106, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 13:10:34', '2023-04-10 13:10:34'),
(107, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 13:11:00', '2023-04-10 13:11:00'),
(108, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 14:54:56', '2023-04-10 14:54:56'),
(109, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 15:37:59', '2023-04-10 15:37:59'),
(110, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-10 16:43:02', '2023-04-10 16:43:02'),
(111, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-11 05:28:27', '2023-04-11 05:28:27'),
(112, 'default', 'added', 31, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1200}}', NULL, '2023-04-11 05:32:31', '2023-04-11 05:32:31'),
(113, 'default', 'payment_edited', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 05:33:53', '2023-04-11 05:33:53'),
(114, 'default', 'added', 32, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1200}}', NULL, '2023-04-11 05:37:45', '2023-04-11 05:37:45'),
(115, 'default', 'payment_edited', 23, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 05:38:56', '2023-04-11 05:38:56'),
(116, 'default', 'payment_edited', 32, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 05:38:56', '2023-04-11 05:38:56'),
(117, 'default', 'added', 33, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-11 05:40:11', '2023-04-11 05:40:11'),
(118, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-11 06:33:37', '2023-04-11 06:33:37'),
(119, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-11 10:41:25', '2023-04-11 10:41:25'),
(120, 'default', 'added', 34, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1200}}', NULL, '2023-04-11 10:42:34', '2023-04-11 10:42:34'),
(121, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-11 10:44:07', '2023-04-11 10:44:07'),
(122, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-11 13:14:17', '2023-04-11 13:14:17'),
(123, 'default', 'payment_edited', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 15:35:33', '2023-04-11 15:35:33'),
(124, 'default', 'payment_deleted', 31, 'App\\TransactionPayment', NULL, 2, 2, 'App\\User', '{\"id\":31,\"ref_no\":\"SP2023\\/0032\"}', NULL, '2023-04-11 15:35:33', '2023-04-11 15:35:33'),
(125, 'default', 'payment_edited', 33, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 15:50:14', '2023-04-11 15:50:14'),
(126, 'default', 'payment_edited', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-11 15:51:03', '2023-04-11 15:51:03'),
(127, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-12 03:12:58', '2023-04-12 03:12:58'),
(128, 'default', 'added', 35, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-12 03:15:35', '2023-04-12 03:15:35'),
(129, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-12 09:38:29', '2023-04-12 09:38:29'),
(130, 'default', 'added', 36, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-12 09:40:14', '2023-04-12 09:40:14'),
(131, 'default', 'added', 37, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-12 09:43:42', '2023-04-12 09:43:42'),
(132, 'default', 'payment_edited', 32, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(133, 'default', 'payment_edited', 33, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(134, 'default', 'payment_edited', 34, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(135, 'default', 'payment_edited', 35, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(136, 'default', 'payment_edited', 36, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(137, 'default', 'payment_edited', 37, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-12 09:45:41', '2023-04-12 09:45:41'),
(138, 'default', 'added', 38, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-12 09:49:28', '2023-04-12 09:49:28'),
(139, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-12 16:22:18', '2023-04-12 16:22:18'),
(140, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-12 16:23:55', '2023-04-12 16:23:55'),
(141, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-14 04:41:24', '2023-04-14 04:41:24'),
(142, 'default', 'payment_edited', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 06:46:25', '2023-04-14 06:46:25'),
(143, 'default', 'payment_edited', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 06:48:07', '2023-04-14 06:48:07'),
(144, 'default', 'payment_edited', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 06:53:12', '2023-04-14 06:53:12'),
(145, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-04-14 07:58:24', '2023-04-14 07:58:24'),
(146, 'default', 'added', 39, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1200}}', NULL, '2023-04-14 08:00:24', '2023-04-14 08:00:24'),
(147, 'default', 'payment_edited', 31, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:02:37', '2023-04-14 08:02:37'),
(148, 'default', 'payment_edited', 38, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:02:37', '2023-04-14 08:02:37'),
(149, 'default', 'payment_edited', 39, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:02:37', '2023-04-14 08:02:37'),
(150, 'default', 'added', 40, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-14 08:05:08', '2023-04-14 08:05:08'),
(151, 'default', 'payment_edited', 40, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:06:24', '2023-04-14 08:06:24'),
(152, 'default', 'added', 41, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-14 08:07:46', '2023-04-14 08:07:46'),
(153, 'default', 'added', 42, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-14 08:10:27', '2023-04-14 08:10:27'),
(154, 'default', 'payment_edited', 41, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:12:41', '2023-04-14 08:12:41'),
(155, 'default', 'payment_edited', 42, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:12:41', '2023-04-14 08:12:41'),
(156, 'default', 'added', 43, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":1200}}', NULL, '2023-04-14 08:15:51', '2023-04-14 08:15:51'),
(157, 'default', 'payment_edited', 43, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-04-14 08:16:43', '2023-04-14 08:16:43'),
(158, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-03 15:37:18', '2023-06-03 15:37:18'),
(159, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-03 15:37:29', '2023-06-03 15:37:29'),
(160, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-03 16:25:31', '2023-06-03 16:25:31'),
(161, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-04 07:47:01', '2023-06-04 07:47:01'),
(162, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-04 15:32:58', '2023-06-04 15:32:58'),
(163, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-06-04 16:52:54', '2023-06-04 16:52:54'),
(164, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-09 12:29:28', '2023-07-09 12:29:28'),
(165, 'default', 'edited', 3, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-10 10:11:25', '2023-07-10 10:11:25'),
(166, 'default', 'edited', 3, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-10 10:13:57', '2023-07-10 10:13:57'),
(167, 'default', 'edited', 2, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"Mr Mominur Rahman\"}', NULL, '2023-07-10 10:15:00', '2023-07-10 10:15:00'),
(168, 'default', 'deleted', 3, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\",\"id\":3}', NULL, '2023-07-10 10:15:43', '2023-07-10 10:15:43'),
(169, 'default', 'added', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":0}}', NULL, '2023-07-10 10:32:11', '2023-07-10 10:32:11'),
(170, 'default', 'added', 45, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":0}}', NULL, '2023-07-10 10:33:05', '2023-07-10 10:33:05'),
(171, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:33:35', '2023-07-10 10:33:35'),
(172, 'default', 'added', 46, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":0}}', NULL, '2023-07-10 10:34:06', '2023-07-10 10:34:06'),
(173, 'default', 'added', 47, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":0}}', NULL, '2023-07-10 10:34:38', '2023-07-10 10:34:38'),
(174, 'default', 'edited', 47, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:34:56', '2023-07-10 10:34:56'),
(175, 'default', 'edited', 45, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:35:54', '2023-07-10 10:35:54'),
(176, 'default', 'edited', 46, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:37:58', '2023-07-10 10:37:58'),
(177, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:39:57', '2023-07-10 10:39:57'),
(178, 'default', 'added', 48, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":2800}}', NULL, '2023-07-10 10:40:49', '2023-07-10 10:40:49'),
(179, 'default', 'added', 49, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":1200}}', NULL, '2023-07-10 10:41:23', '2023-07-10 10:41:23'),
(180, 'default', 'edited', 49, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:42:19', '2023-07-10 10:42:19'),
(181, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:45:32', '2023-07-10 10:45:32'),
(182, 'default', 'sell_deleted', 42, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":42,\"invoice_no\":\"0033\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:46:09', '2023-07-10 10:46:09'),
(183, 'default', 'sell_deleted', 39, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":39,\"invoice_no\":\"0030\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:46:21', '2023-07-10 10:46:21'),
(184, 'default', 'sell_deleted', 38, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":38,\"invoice_no\":\"0029\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:46:45', '2023-07-10 10:46:45'),
(185, 'default', 'sell_deleted', 36, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":36,\"invoice_no\":\"0027\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:46:52', '2023-07-10 10:46:52'),
(186, 'default', 'sell_deleted', 20, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":20,\"invoice_no\":\"0013\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2200.0000\"}}', NULL, '2023-07-10 10:47:11', '2023-07-10 10:47:11'),
(187, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:47:35', '2023-07-10 10:47:35'),
(188, 'default', 'sell_deleted', 37, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":37,\"invoice_no\":\"0028\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:47:47', '2023-07-10 10:47:47'),
(189, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:48:01', '2023-07-10 10:48:01'),
(190, 'default', 'sell_deleted', 35, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":35,\"invoice_no\":\"0026\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:48:12', '2023-07-10 10:48:12'),
(191, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:48:26', '2023-07-10 10:48:26'),
(192, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:48:50', '2023-07-10 10:48:50'),
(193, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:49:33', '2023-07-10 10:49:33'),
(194, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:50:24', '2023-07-10 10:50:24'),
(195, 'default', 'sell_deleted', 10, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":10,\"invoice_no\":\"0006\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"2200.0000\"}}', NULL, '2023-07-10 10:50:55', '2023-07-10 10:50:55'),
(196, 'default', 'sell_deleted', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":30,\"invoice_no\":\"0021\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:51:05', '2023-07-10 10:51:05'),
(197, 'default', 'sell_deleted', 31, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":31,\"invoice_no\":\"0022\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:51:11', '2023-07-10 10:51:11'),
(198, 'default', 'sell_deleted', 29, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":29,\"invoice_no\":\"0020\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:51:16', '2023-07-10 10:51:16'),
(199, 'default', 'sell_deleted', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":26,\"invoice_no\":\"0018\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:51:20', '2023-07-10 10:51:20'),
(200, 'default', 'sell_deleted', 25, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":25,\"invoice_no\":\"0017\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"2200.0000\"}}', NULL, '2023-07-10 10:51:26', '2023-07-10 10:51:26'),
(201, 'default', 'sell_deleted', 24, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":24,\"invoice_no\":\"0016\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"2200.0000\"}}', NULL, '2023-07-10 10:51:32', '2023-07-10 10:51:32'),
(202, 'default', 'sell_deleted', 12, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":12,\"invoice_no\":\"0007\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"5000.0000\"}}', NULL, '2023-07-10 10:51:42', '2023-07-10 10:51:42'),
(203, 'default', 'sell_deleted', 34, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":34,\"invoice_no\":\"0025\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:51:55', '2023-07-10 10:51:55'),
(204, 'default', 'sell_deleted', 15, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":15,\"invoice_no\":\"0008\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:52:50', '2023-07-10 10:52:50'),
(205, 'default', 'sell_deleted', 33, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":33,\"invoice_no\":\"0024\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:53:07', '2023-07-10 10:53:07'),
(206, 'default', 'sell_deleted', 23, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":23,\"invoice_no\":\"0015\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:53:14', '2023-07-10 10:53:14'),
(207, 'default', 'sell_deleted', 18, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":18,\"invoice_no\":\"2023\\/0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:53:35', '2023-07-10 10:53:35'),
(208, 'default', 'sell_deleted', 32, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":32,\"invoice_no\":\"0023\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:53:46', '2023-07-10 10:53:46'),
(209, 'default', 'sell_deleted', 17, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":17,\"invoice_no\":\"0010\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:53:55', '2023-07-10 10:53:55'),
(210, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:54:15', '2023-07-10 10:54:15'),
(211, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":1200},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:54:47', '2023-07-10 10:54:47'),
(212, 'default', 'edited', 48, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"2800.0000\"}}', NULL, '2023-07-10 10:55:25', '2023-07-10 10:55:25'),
(213, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 10:56:02', '2023-07-10 10:56:02'),
(214, 'default', 'edited', 44, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":0},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', NULL, '2023-07-10 10:57:56', '2023-07-10 10:57:56'),
(215, 'default', 'sell_deleted', 43, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":43,\"invoice_no\":\"0034\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 11:05:19', '2023-07-10 11:05:19'),
(216, 'default', 'sell_deleted', 41, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":41,\"invoice_no\":\"0032\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 11:05:25', '2023-07-10 11:05:25'),
(217, 'default', 'sell_deleted', 40, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":40,\"invoice_no\":\"0031\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 11:05:31', '2023-07-10 11:05:31'),
(218, 'default', 'sell_deleted', 9, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":9,\"invoice_no\":\"0005\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"2800.0000\"}}', NULL, '2023-07-10 11:05:35', '2023-07-10 11:05:35'),
(219, 'default', 'sell_deleted', 19, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":19,\"invoice_no\":\"0012\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 11:05:40', '2023-07-10 11:05:40'),
(220, 'default', 'sell_deleted', 16, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"id\":16,\"invoice_no\":\"0009\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', NULL, '2023-07-10 11:05:45', '2023-07-10 11:05:45'),
(221, 'default', 'contact_deleted', 9, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:06:10', '2023-07-10 11:06:10'),
(222, 'default', 'contact_deleted', 4, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:06:44', '2023-07-10 11:06:44'),
(223, 'default', 'contact_deleted', 5, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:06:54', '2023-07-10 11:06:54'),
(224, 'default', 'contact_deleted', 6, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:06:59', '2023-07-10 11:06:59'),
(225, 'default', 'contact_deleted', 7, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:07:09', '2023-07-10 11:07:09'),
(226, 'default', 'contact_deleted', 3, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 11:07:16', '2023-07-10 11:07:16'),
(227, 'default', 'edited', 2, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"Mr Mominur Rahman\"}', NULL, '2023-07-10 12:31:42', '2023-07-10 12:31:42'),
(228, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-10 12:55:55', '2023-07-10 12:55:55'),
(229, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-11 06:28:03', '2023-07-11 06:28:03'),
(230, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-11 09:07:00', '2023-07-11 09:07:00'),
(231, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-12 19:30:14', '2023-07-12 19:30:14'),
(232, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-13 10:42:02', '2023-07-13 10:42:02');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(233, 'default', 'contact_deleted', 8, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-13 12:28:18', '2023-07-13 12:28:18'),
(234, 'default', 'added', 4, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-13 12:34:29', '2023-07-13 12:34:29'),
(235, 'default', 'edited', 4, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-13 12:38:24', '2023-07-13 12:38:24'),
(236, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-14 11:03:13', '2023-07-14 11:03:13'),
(237, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-14 11:47:54', '2023-07-14 11:47:54'),
(238, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-15 14:04:38', '2023-07-15 14:04:38'),
(239, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-16 16:11:24', '2023-07-16 16:11:24'),
(240, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-16 16:11:33', '2023-07-16 16:11:33'),
(241, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-17 03:48:57', '2023-07-17 03:48:57'),
(242, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-17 06:44:20', '2023-07-17 06:44:20'),
(243, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-17 09:21:19', '2023-07-17 09:21:19'),
(244, 'default', 'edited', 4, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-17 09:22:37', '2023-07-17 09:22:37'),
(245, 'default', 'edited', 4, 'App\\User', NULL, 2, 2, 'App\\User', '{\"name\":\"MR BABUL MIA\"}', NULL, '2023-07-17 09:23:36', '2023-07-17 09:23:36'),
(246, 'default', 'added', 10, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-17 10:19:21', '2023-07-17 10:19:21'),
(247, 'default', 'added', 25, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":77000}}', NULL, '2023-07-17 10:30:00', '2023-07-17 10:30:00'),
(248, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-17 10:43:41', '2023-07-17 10:43:41'),
(249, 'default', 'added', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":17500}}', NULL, '2023-07-17 10:51:39', '2023-07-17 10:51:39'),
(250, 'default', 'purchase_deleted', 26, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"17500.0000\"}}', NULL, '2023-07-17 11:28:55', '2023-07-17 11:28:55'),
(251, 'default', 'added', 27, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":92500}}', NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(252, 'default', 'added', 28, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":65455}}', NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(253, 'default', 'login', 4, 'App\\User', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-17 13:51:44', '2023-07-17 13:51:44'),
(254, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 08:12:36', '2023-07-18 08:12:36'),
(255, 'default', 'added', 29, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":15840}}', NULL, '2023-07-18 10:27:10', '2023-07-18 10:27:10'),
(256, 'default', 'added', 11, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 10:35:53', '2023-07-18 10:35:53'),
(257, 'default', 'edited', 11, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 10:37:29', '2023-07-18 10:37:29'),
(258, 'default', 'added', 12, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 10:52:38', '2023-07-18 10:52:38'),
(259, 'default', 'added', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":18400}}', NULL, '2023-07-18 10:57:06', '2023-07-18 10:57:06'),
(260, 'default', 'payment_edited', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"18400.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"18400.0000\"}}', NULL, '2023-07-18 10:58:06', '2023-07-18 10:58:06'),
(261, 'default', 'payment_edited', 30, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"18400.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"18400.0000\"}}', NULL, '2023-07-18 11:36:54', '2023-07-18 11:36:54'),
(262, 'default', 'payment_deleted', 1, 'App\\TransactionPayment', NULL, 2, 2, 'App\\User', '{\"id\":1,\"ref_no\":\"PP2023\\/0001\"}', NULL, '2023-07-18 11:36:54', '2023-07-18 11:36:54'),
(263, 'default', 'added', 13, 'App\\Contact', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 12:01:25', '2023-07-18 12:01:25'),
(264, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 12:03:22', '2023-07-18 12:03:22'),
(265, 'default', 'added', 31, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2200}}', NULL, '2023-07-18 12:05:37', '2023-07-18 12:05:37'),
(266, 'default', 'added', 32, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1500}}', NULL, '2023-07-18 12:09:02', '2023-07-18 12:09:02'),
(267, 'default', 'logout', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 12:46:51', '2023-07-18 12:46:51'),
(268, 'default', 'login', 4, 'App\\User', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 12:47:28', '2023-07-18 12:47:28'),
(269, 'default', 'added', 14, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 13:22:04', '2023-07-18 13:22:04'),
(270, 'default', 'added', 33, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1600}}', NULL, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(271, 'default', 'added', 15, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 13:36:20', '2023-07-18 13:36:20'),
(272, 'default', 'edited', 15, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 13:37:29', '2023-07-18 13:37:29'),
(273, 'default', 'edited', 15, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 13:37:42', '2023-07-18 13:37:42'),
(274, 'default', 'edited', 15, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-18 13:40:01', '2023-07-18 13:40:01'),
(275, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-18 16:00:39', '2023-07-18 16:00:39'),
(276, 'default', 'added', 34, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":39000}}', NULL, '2023-07-19 10:05:35', '2023-07-19 10:05:35'),
(277, 'default', 'added', 35, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":640}}', NULL, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(278, 'default', 'added', 36, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2855}}', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(279, 'default', 'added', 37, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2400}}', NULL, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(280, 'default', 'added', 38, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":5910}}', NULL, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(281, 'default', 'edited', 15, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-19 10:50:51', '2023-07-19 10:50:51'),
(282, 'default', 'added', 16, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-19 11:37:50', '2023-07-19 11:37:50'),
(283, 'default', 'added', 39, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3480}}', NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(284, 'default', 'payment_edited', 34, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"39000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"39000.0000\"}}', NULL, '2023-07-19 12:49:23', '2023-07-19 12:49:23'),
(285, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-19 15:30:59', '2023-07-19 15:30:59'),
(286, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-20 04:38:38', '2023-07-20 04:38:38'),
(287, 'default', 'added', 17, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:37:32', '2023-07-20 09:37:32'),
(288, 'default', 'edited', 17, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:38:39', '2023-07-20 09:38:39'),
(289, 'default', 'added', 40, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', NULL, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(290, 'default', 'added', 18, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:42:42', '2023-07-20 09:42:42'),
(291, 'default', 'added', 41, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300}}', NULL, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(292, 'default', 'added', 19, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:45:26', '2023-07-20 09:45:26'),
(293, 'default', 'added', 42, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1270}}', NULL, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(294, 'default', 'added', 43, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2520}}', NULL, '2023-07-20 09:50:24', '2023-07-20 09:50:24'),
(295, 'default', 'added', 20, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:52:49', '2023-07-20 09:52:49'),
(296, 'default', 'added', 44, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1550}}', NULL, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(297, 'default', 'added', 45, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":900}}', NULL, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(298, 'default', 'added', 21, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:57:04', '2023-07-20 09:57:04'),
(299, 'default', 'added', 46, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', NULL, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(300, 'default', 'added', 22, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 09:59:24', '2023-07-20 09:59:24'),
(301, 'default', 'added', 47, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2250}}', NULL, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(302, 'default', 'added', 23, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 10:03:26', '2023-07-20 10:03:26'),
(303, 'default', 'added', 48, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":17880}}', NULL, '2023-07-20 10:11:29', '2023-07-20 10:11:29'),
(304, 'default', 'edited', 48, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":17880},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"17880.0000\"}}', NULL, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(305, 'default', 'added', 24, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 10:20:38', '2023-07-20 10:20:38'),
(306, 'default', 'added', 49, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3000}}', NULL, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(307, 'default', 'payment_edited', 30, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"18400.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"18400.0000\"}}', NULL, '2023-07-20 10:23:14', '2023-07-20 10:23:14'),
(308, 'default', 'payment_edited', 30, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"18400.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"18400.0000\"}}', NULL, '2023-07-20 10:24:05', '2023-07-20 10:24:05'),
(309, 'default', 'added', 25, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 11:12:30', '2023-07-20 11:12:30'),
(310, 'default', 'added', 50, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":500}}', NULL, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(311, 'default', 'added', 51, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":900}}', NULL, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(312, 'default', 'added', 26, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 11:17:28', '2023-07-20 11:17:28'),
(313, 'default', 'added', 52, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":2490}}', NULL, '2023-07-20 11:23:00', '2023-07-20 11:23:00'),
(314, 'default', 'added', 27, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 11:55:44', '2023-07-20 11:55:44'),
(315, 'default', 'added', 53, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1500}}', NULL, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(316, 'default', 'added', 28, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 11:58:21', '2023-07-20 11:58:21'),
(317, 'default', 'added', 54, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2150}}', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(318, 'default', 'added', 29, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 12:03:54', '2023-07-20 12:03:54'),
(319, 'default', 'added', 55, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1050}}', NULL, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(320, 'default', 'added', 56, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":600}}', NULL, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(321, 'default', 'edited', 43, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2520},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2520.0000\"}}', NULL, '2023-07-20 12:07:30', '2023-07-20 12:07:30'),
(322, 'default', 'added', 57, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(323, 'default', 'added', 30, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 12:16:05', '2023-07-20 12:16:05'),
(324, 'default', 'added', 58, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":7250}}', NULL, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(325, 'default', 'added', 59, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1650}}', NULL, '2023-07-20 12:22:52', '2023-07-20 12:22:52'),
(326, 'default', 'edited', 32, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2200},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1500.0000\"}}', NULL, '2023-07-20 12:51:49', '2023-07-20 12:51:49'),
(327, 'default', 'edited', 59, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3300},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1650.0000\"}}', NULL, '2023-07-20 12:52:59', '2023-07-20 12:52:59'),
(328, 'default', 'added', 60, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":800}}', NULL, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(329, 'default', 'added', 31, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 13:23:55', '2023-07-20 13:23:55'),
(330, 'default', 'added', 61, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":700}}', NULL, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(331, 'default', 'added', 32, 'App\\Contact', NULL, 2, 4, 'App\\User', '[]', NULL, '2023-07-20 13:25:43', '2023-07-20 13:25:43'),
(332, 'default', 'added', 62, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1700}}', NULL, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(333, 'default', 'added', 63, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2500}}', NULL, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(334, 'default', 'payment_edited', 34, 'App\\Transaction', NULL, 2, 4, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"39000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"39000.0000\"}}', NULL, '2023-07-20 13:49:14', '2023-07-20 13:49:14'),
(335, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-20 15:56:53', '2023-07-20 15:56:53'),
(336, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-21 04:32:07', '2023-07-21 04:32:07'),
(337, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-22 05:42:53', '2023-07-22 05:42:53'),
(338, 'default', 'added', 64, 'App\\Transaction', NULL, 2, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":118.75}}', NULL, '2023-07-22 05:48:57', '2023-07-22 05:48:57'),
(339, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-22 16:41:03', '2023-07-22 16:41:03'),
(340, 'default', 'login', 2, 'App\\User', NULL, 2, 2, 'App\\User', '[]', NULL, '2023-07-22 16:44:00', '2023-07-22 16:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 00:13:44', '2017-12-18 00:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 00:04:39', '2017-12-18 00:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-17 23:55:40', '2017-12-17 23:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-17 23:58:40', '2017-12-17 23:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-17 23:51:10', '2017-12-17 23:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-17 23:51:10', '2017-12-17 23:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'BD-PON', 'ONU', 2, NULL, '2023-04-08 16:15:16', '2023-07-17 09:58:14'),
(2, 2, 'DAHUA', 'CC CAMERA', 2, NULL, '2023-04-09 04:08:11', '2023-07-17 12:44:12'),
(3, 2, 'HUAWEI', 'ONU', 2, NULL, '2023-04-09 04:14:53', '2023-07-17 09:58:00'),
(4, 2, 'i ball Batton', 'Switch', 2, NULL, '2023-07-16 10:22:11', '2023-07-16 10:22:11'),
(5, 2, 'Networking Tools', 'Network Tools', 2, NULL, '2023-07-16 11:20:38', '2023-07-16 11:20:38'),
(6, 2, 'TENDA', 'WI FI ROUTER', 2, NULL, '2023-07-17 09:57:32', '2023-07-17 09:57:32'),
(7, 2, 'TP-LINK', 'WI FI ROUTER', 2, NULL, '2023-07-18 10:21:26', '2023-07-18 10:21:26'),
(8, 2, 'MI', 'WI FI ROUTER', 2, NULL, '2023-07-18 10:25:07', '2023-07-18 10:25:07'),
(9, 2, 'POLI CABLE', 'CABLE', 2, NULL, '2023-07-18 10:44:56', '2023-07-18 10:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT '2',
  `quantity_precision` tinyint(4) NOT NULL DEFAULT '2',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `currency_precision`, `quantity_precision`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'accounts', 134, '2023-04-08', 'ff', 'dd', 'ff', 'ff', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Kolkata', 1, 'fifo', 0.00, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"tables\",\"modifiers\",\"service_staff\",\"booking\",\"kitchen\",\"subscription\",\"types_of_service\"]', 'm/d/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2023-04-08 08:12:40', '2023-04-08 08:25:39'),
(2, 'AL RAHMAN TRADERS', 134, '2023-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 'Asia/Dhaka', 1, 'fifo', 0.00, 'includes', NULL, NULL, 1, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 90, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"tables\",\"modifiers\",\"service_staff\",\"booking\",\"kitchen\",\"subscription\",\"types_of_service\"]', 'd-m-Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2023-04-08 14:08:20', '2023-07-20 10:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'accounts', 'ddd', 'Bangladesh', 'Dhaka', 'Narayanganj', '1208', 1, 1, 1, NULL, 1, 'browser', NULL, '01720920148', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 2, 'BL0001', 'AL RAHMAN TRADERS', 'https://alrahmantraders.com/', 'Bangladesh', 'Munshiganj', 'Gazaria', '1510', 2, 2, 2, NULL, 1, 'browser', NULL, '01941799799', '01824464846', 'alrahmantraders2022@gmail.com', NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-04-08 14:08:20', '2023-07-19 10:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `cash_denominations`
--

CREATE TABLE `cash_denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `denominations` text COLLATE utf8mb4_unicode_ci,
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, 'close', '2023-04-09 10:04:22', 5000.0000, 0, 0, NULL, NULL, '2023-04-08 16:25:00', '2023-04-09 04:04:22'),
(2, 2, 2, 2, 'close', '2023-04-09 10:32:54', 0.0000, 0, 0, NULL, NULL, '2023-04-09 04:04:00', '2023-04-09 04:32:54'),
(3, 2, 2, 3, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2023-04-10 03:33:00', '2023-04-10 03:33:06'),
(4, 2, 2, 2, 'close', '2023-07-10 18:20:27', 1500.0000, 0, 0, NULL, NULL, '2023-04-12 16:24:00', '2023-07-10 12:20:27'),
(5, 2, 2, 2, 'close', '2023-07-10 18:23:14', 500.0000, 0, 0, NULL, NULL, '2023-07-10 12:21:00', '2023-07-10 12:23:14'),
(6, 2, 2, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2023-07-18 11:54:00', '2023-07-18 11:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(5, 4, 1500.0000, 'cash', 'credit', 'initial', NULL, '2023-04-12 16:24:33', '2023-04-12 16:24:33'),
(6, 5, 500.0000, 'cash', 'credit', 'initial', NULL, '2023-07-10 12:21:37', '2023-07-10 12:21:37'),
(7, 6, 118.7500, 'cash', 'credit', 'sell', 64, '2023-07-22 05:48:57', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Computer', 2, NULL, 0, 2, 'product', NULL, NULL, '2023-07-10 11:46:51', '2023-04-08 16:15:16', '2023-07-10 11:46:51'),
(2, 'BD-PON', 2, 'ONU 1 PORT', 0, 2, 'product', NULL, NULL, '2023-07-15 09:58:33', '2023-04-08 16:40:02', '2023-07-15 09:58:33'),
(3, 'TJ BOX 4 PORT', 2, '002', 2, 2, 'product', NULL, NULL, '2023-07-15 09:58:28', '2023-07-15 09:46:04', '2023-07-15 09:58:28'),
(4, 'TJ BOX 4 PORT', 2, '002', 0, 2, 'product', NULL, NULL, '2023-07-15 10:22:33', '2023-07-15 09:59:28', '2023-07-15 10:22:33'),
(5, 'TJ BOX 2 PORT', 2, '001', 4, 2, 'product', NULL, NULL, '2023-07-15 10:22:36', '2023-07-15 10:10:21', '2023-07-15 10:22:36'),
(6, 'TJ BOX 8 PORT', 2, '003', 4, 2, 'product', NULL, NULL, '2023-07-15 10:22:30', '2023-07-15 10:10:48', '2023-07-15 10:22:30'),
(7, 'TJ BOX', 2, '001', 0, 2, 'product', NULL, NULL, '2023-07-15 10:30:55', '2023-07-15 10:23:07', '2023-07-15 10:30:55'),
(8, 'TJ BOX', 2, '002', 7, 2, 'product', NULL, NULL, '2023-07-15 10:30:36', '2023-07-15 10:23:51', '2023-07-15 10:30:36'),
(9, 'TJ BOX', 2, '003', 7, 2, 'product', NULL, NULL, '2023-07-15 10:30:32', '2023-07-15 10:24:06', '2023-07-15 10:30:32'),
(10, 'TJ BOX', 2, '001', 0, 2, 'product', 'TJ BOX 2PORT,4PORT,8PORT', NULL, NULL, '2023-07-15 10:31:46', '2023-07-15 10:31:46'),
(11, 'SPLITTER', 2, '002', 0, 2, 'product', '1*2,1*4,1*6,1*8,1*16', NULL, NULL, '2023-07-15 10:43:30', '2023-07-15 10:46:28'),
(12, 'SWITCH', 2, '003', 0, 2, 'product', '5 PORT, 8 PORT', NULL, NULL, '2023-07-15 11:58:17', '2023-07-15 11:58:17'),
(13, 'Connectors', 2, '004', 0, 2, 'product', 'All Cable Connectors', NULL, NULL, '2023-07-16 10:32:30', '2023-07-16 10:32:56'),
(14, 'Networking Tools', 2, '005', 0, 2, 'product', 'Plug Crimper,Cable Tester', NULL, NULL, '2023-07-16 10:52:38', '2023-07-16 11:24:36'),
(15, 'CABLE', 2, '006', 0, 2, 'product', 'AL CABLE', NULL, NULL, '2023-07-17 09:29:42', '2023-07-17 09:29:42'),
(16, 'ROUTER', 2, '007', 0, 2, 'product', 'ALL WI FI ROUTER', NULL, NULL, '2023-07-17 09:54:15', '2023-07-17 09:54:15'),
(17, 'ONU', 2, '008', 0, 2, 'product', 'ALL ONU', NULL, NULL, '2023-07-17 10:05:59', '2023-07-17 10:05:59'),
(18, 'MONITOR', 2, '009', 0, 2, 'product', 'ALL CCTV MONITOR', NULL, NULL, '2023-07-17 12:50:34', '2023-07-17 12:50:34'),
(19, 'CAMERA', 2, '010', 0, 2, 'product', 'ALL CC CAMERA', NULL, NULL, '2023-07-18 05:53:41', '2023-07-18 05:53:41'),
(20, 'HARD DISK', 2, '011', 0, 2, 'product', 'AL HARD DISK', NULL, NULL, '2023-07-18 10:11:38', '2023-07-18 10:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 2, 'customer', NULL, 'Reazul', NULL, 'Reazul', NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, 0.0000, 2, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 14:08:20', '2023-04-09 16:12:57'),
(3, 2, 'customer', NULL, 'Razu Laila', NULL, 'Razu', 'Laila', NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:07:16', '2023-04-09 03:11:36', '2023-07-10 11:07:16'),
(4, 2, 'customer', NULL, 'lima laila', NULL, 'lima', 'laila', NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:06:44', '2023-04-09 03:14:22', '2023-07-10 11:06:44'),
(5, 2, 'customer', NULL, 'shohel', NULL, 'shohel', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:06:54', '2023-04-09 04:30:38', '2023-07-10 11:06:54'),
(6, 2, 'customer', NULL, 'Mikdada', NULL, 'Mikdada', NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:06:59', '2023-04-09 05:16:02', '2023-07-10 11:06:59'),
(7, 2, 'customer', NULL, 'Mousi', NULL, 'Mousi', NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:07:09', '2023-04-09 05:24:57', '2023-07-10 11:07:09'),
(8, 2, 'customer', NULL, 'Jamal', NULL, 'Jamal', NULL, NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-13 12:28:18', '2023-04-09 07:40:50', '2023-07-13 12:28:18'),
(9, 2, 'customer', NULL, 'mim', NULL, 'mim', NULL, NULL, NULL, 'CO0008', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01616771455', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:06:10', '2023-04-09 13:37:33', '2023-07-10 11:06:10'),
(10, 2, 'supplier', 'AKRAM ENTERPRICE', '', NULL, NULL, NULL, NULL, 'akramhossain1985@gmail.com', 'AKRAM', 'active', NULL, 'Dhaka', 'Dhaka', 'Bangladesh', '111/Bangabandhu National Stadium Market', NULL, '1000', NULL, '01811015389', NULL, '01958480035', NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 10:19:21', '2023-07-17 10:19:21'),
(11, 2, 'supplier', 'POLI CABLE IND LTD', '', NULL, NULL, NULL, NULL, NULL, 'CO0010', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01894922628', '+882-48311856', NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 10:35:53', '2023-07-18 10:37:29'),
(12, 2, 'supplier', 'ONLINE COURIER', '', NULL, NULL, NULL, NULL, NULL, 'CO0011', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01824464846', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 10:52:38', '2023-07-18 10:52:38'),
(13, 2, 'customer', NULL, 'MR SKYLINK', NULL, 'MR SKYLINK', NULL, NULL, NULL, 'CO0012', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01894922628', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 12:01:25', '2023-07-18 12:01:25'),
(14, 2, 'customer', NULL, 'NILL', NULL, 'NILL', NULL, NULL, NULL, 'CO0013', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01894922628', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 13:22:04', '2023-07-18 13:22:04'),
(15, 2, 'customer', 'BK WIFI NETWORK', 'Mr Jannat Mia', 'Mr', 'Jannat', 'Mia', NULL, NULL, 'CO0014', 'active', NULL, 'Gazaria', 'Munshiganj', 'Bangladesh', 'Baghaia Kandi Sorker Bari', NULL, '1510', NULL, '01713297734', NULL, NULL, NULL, NULL, 5000.0000, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 13:36:20', '2023-07-19 10:50:51'),
(16, 2, 'customer', 'BAJLUR RAHMAN', '', NULL, NULL, NULL, NULL, NULL, 'CO0015', 'active', NULL, 'Gazaria', 'Munshiganj', 'Bangladesh', 'Dowlatpur', NULL, NULL, NULL, '01811793988', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 11:37:50', '2023-07-19 11:37:50'),
(17, 2, 'customer', NULL, 'Mr Habib mia', 'Mr', 'Habib', 'mia', NULL, NULL, 'CO0016', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01849588365', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:37:32', '2023-07-20 09:38:39'),
(18, 2, 'customer', 'FRIENDS NET WORK', '', NULL, NULL, NULL, NULL, NULL, 'CO0017', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:42:42', '2023-07-20 09:42:42'),
(19, 2, 'customer', NULL, 'Mr ROBIN', 'Mr', 'ROBIN', NULL, NULL, NULL, 'CO0018', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '016', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:45:26', '2023-07-20 09:45:26'),
(20, 2, 'customer', NULL, 'Mr Rasel hossen', 'Mr', 'Rasel', 'hossen', NULL, NULL, 'CO0019', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '017', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:52:49', '2023-07-20 09:52:49'),
(21, 2, 'customer', NULL, 'Mr SOHEL', 'Mr', 'SOHEL', NULL, NULL, NULL, 'CO0020', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0164', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:57:04', '2023-07-20 09:57:04'),
(22, 2, 'customer', NULL, 'Mr JOBYER', 'Mr', 'JOBYER', NULL, NULL, NULL, 'CO0021', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0172', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:59:24', '2023-07-20 09:59:24'),
(23, 2, 'customer', 'SOFIUL STOR', '', NULL, NULL, NULL, NULL, NULL, 'CO0022', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01711', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 10:03:26', '2023-07-20 10:03:26'),
(24, 2, 'customer', NULL, 'Mr NIRUL AMIN SHARKER', 'Mr', 'NIRUL', 'AMIN', 'SHARKER', NULL, 'CO0023', 'active', NULL, 'Gazaria', 'Munshiganj', 'Bangladesh', 'LUXMIPUR', NULL, '1510', NULL, '01711166023', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 10:20:38', '2023-07-20 10:20:38'),
(25, 2, 'customer', NULL, 'Mr SHAKE SHADI', 'Mr', 'SHAKE', 'SHADI', NULL, NULL, 'CO0024', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0181', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:12:30', '2023-07-20 11:12:30'),
(26, 2, 'customer', NULL, 'Mr ABDULLA', 'Mr', 'ABDULLA', NULL, NULL, NULL, 'CO0025', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01818833276', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:17:28', '2023-07-20 11:17:28'),
(27, 2, 'customer', NULL, 'Mr SADEK CHOWDORI', 'Mr', 'SADEK', 'CHOWDORI', NULL, NULL, 'CO0026', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '019', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:55:44', '2023-07-20 11:55:44'),
(28, 2, 'customer', 'SAHAJALAL', '', NULL, NULL, NULL, NULL, NULL, 'CO0027', 'active', NULL, 'Gazaria', 'Munshiganj', 'Bangladesh', 'Hoglakani', NULL, '1510', NULL, '0191', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:58:21', '2023-07-20 11:58:21'),
(29, 2, 'customer', NULL, 'Mr ABDUR RAHIM', 'Mr', 'ABDUR', 'RAHIM', NULL, NULL, 'CO0028', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0192', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:03:54', '2023-07-20 12:03:54'),
(30, 2, 'customer', 'SKY LINK NET', '', NULL, NULL, NULL, NULL, NULL, 'CO0029', 'active', NULL, 'Gazaria', 'Munshiganj', 'Bangladesh', 'Bhaber Char', NULL, '1510', NULL, '01977696181', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:16:05', '2023-07-20 12:16:05'),
(31, 2, 'customer', NULL, 'Mr SOMUN', 'Mr', 'SOMUN', NULL, NULL, NULL, 'CO0030', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01815585056', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:23:55', '2023-07-20 13:23:55'),
(32, 2, 'customer', NULL, 'Mr RIDOY', 'Mr', 'RIDOY', NULL, NULL, NULL, 'CO0031', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01838197086', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:25:43', '2023-07-20 13:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `spg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `parent_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SOFTWER', 2, '001', NULL, NULL, '2023-07-20 13:51:23', '2023-07-20 13:51:23'),
(2, 'WEB HOSTING CHARGE', 2, '002', NULL, NULL, '2023-07-20 13:52:11', '2023-07-20 13:52:38'),
(3, 'ELECTRICITY BILL', 2, '003', NULL, NULL, '2023-07-20 13:54:26', '2023-07-20 13:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT '0',
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT '0',
  `letter_head` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT '0',
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_letter_head`, `letter_head`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 1, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 2, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-08 14:08:20', '2023-04-08 14:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 0, 4, 1, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 2, 'Default', 'blank', NULL, 1, 38, 4, 1, '2023-04-08 14:08:20', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1),
(278, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1),
(279, '2022_04_21_083327_create_cash_denominations_table', 1),
(280, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1),
(281, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1),
(282, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1),
(283, '2022_07_13_114307_create_purchase_requisition_related_columns', 1),
(284, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1),
(285, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1),
(286, '2023_02_11_161510_add_event_column_to_activity_log_table', 1),
(287, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1),
(288, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(80, 'App\\User', 3),
(80, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 2),
(4, 'App\\User', 3),
(3, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(11, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(12, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(13, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(14, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(15, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(16, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(17, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(18, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(19, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(20, 2, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2023-04-08 05:13:03', NULL),
(2, 'direct_sell.access', 'web', '2023-04-08 05:13:03', NULL),
(3, 'product.opening_stock', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(4, 'crud_all_bookings', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(5, 'crud_own_bookings', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(6, 'access_default_selling_price', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(7, 'purchase.payments', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(8, 'sell.payments', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(9, 'edit_product_price_from_sale_screen', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(11, 'roles.view', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(12, 'roles.create', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(13, 'roles.update', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(14, 'roles.delete', 'web', '2023-04-08 05:13:04', '2023-04-08 05:13:04'),
(15, 'account.access', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(16, 'discount.access', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(17, 'view_purchase_price', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(18, 'view_own_sell_only', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(20, 'edit_product_price_from_pos_screen', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(21, 'access_shipping', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(22, 'purchase.update_status', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(23, 'list_drafts', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(24, 'list_quotations', 'web', '2023-04-08 05:13:05', '2023-04-08 05:13:05'),
(25, 'view_cash_register', 'web', '2023-04-08 05:13:06', '2023-04-08 05:13:06'),
(26, 'close_cash_register', 'web', '2023-04-08 05:13:06', '2023-04-08 05:13:06'),
(27, 'print_invoice', 'web', '2023-04-08 05:13:06', '2023-04-08 05:13:06'),
(28, 'user.view', 'web', '2023-04-08 05:13:07', NULL),
(29, 'user.create', 'web', '2023-04-08 05:13:07', NULL),
(30, 'user.update', 'web', '2023-04-08 05:13:07', NULL),
(31, 'user.delete', 'web', '2023-04-08 05:13:07', NULL),
(32, 'supplier.view', 'web', '2023-04-08 05:13:07', NULL),
(33, 'supplier.create', 'web', '2023-04-08 05:13:07', NULL),
(34, 'supplier.update', 'web', '2023-04-08 05:13:07', NULL),
(35, 'supplier.delete', 'web', '2023-04-08 05:13:07', NULL),
(36, 'customer.view', 'web', '2023-04-08 05:13:07', NULL),
(37, 'customer.create', 'web', '2023-04-08 05:13:07', NULL),
(38, 'customer.update', 'web', '2023-04-08 05:13:07', NULL),
(39, 'customer.delete', 'web', '2023-04-08 05:13:07', NULL),
(40, 'product.view', 'web', '2023-04-08 05:13:07', NULL),
(41, 'product.create', 'web', '2023-04-08 05:13:07', NULL),
(42, 'product.update', 'web', '2023-04-08 05:13:07', NULL),
(43, 'product.delete', 'web', '2023-04-08 05:13:07', NULL),
(44, 'purchase.view', 'web', '2023-04-08 05:13:07', NULL),
(45, 'purchase.create', 'web', '2023-04-08 05:13:07', NULL),
(46, 'purchase.update', 'web', '2023-04-08 05:13:07', NULL),
(47, 'purchase.delete', 'web', '2023-04-08 05:13:07', NULL),
(48, 'sell.view', 'web', '2023-04-08 05:13:07', NULL),
(49, 'sell.create', 'web', '2023-04-08 05:13:07', NULL),
(50, 'sell.update', 'web', '2023-04-08 05:13:07', NULL),
(51, 'sell.delete', 'web', '2023-04-08 05:13:07', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2023-04-08 05:13:07', NULL),
(53, 'contacts_report.view', 'web', '2023-04-08 05:13:07', NULL),
(54, 'stock_report.view', 'web', '2023-04-08 05:13:07', NULL),
(55, 'tax_report.view', 'web', '2023-04-08 05:13:07', NULL),
(56, 'trending_product_report.view', 'web', '2023-04-08 05:13:07', NULL),
(57, 'register_report.view', 'web', '2023-04-08 05:13:07', NULL),
(58, 'sales_representative.view', 'web', '2023-04-08 05:13:07', NULL),
(59, 'expense_report.view', 'web', '2023-04-08 05:13:07', NULL),
(60, 'business_settings.access', 'web', '2023-04-08 05:13:07', NULL),
(61, 'barcode_settings.access', 'web', '2023-04-08 05:13:07', NULL),
(62, 'invoice_settings.access', 'web', '2023-04-08 05:13:07', NULL),
(63, 'brand.view', 'web', '2023-04-08 05:13:07', NULL),
(64, 'brand.create', 'web', '2023-04-08 05:13:07', NULL),
(65, 'brand.update', 'web', '2023-04-08 05:13:07', NULL),
(66, 'brand.delete', 'web', '2023-04-08 05:13:07', NULL),
(67, 'tax_rate.view', 'web', '2023-04-08 05:13:07', NULL),
(68, 'tax_rate.create', 'web', '2023-04-08 05:13:07', NULL),
(69, 'tax_rate.update', 'web', '2023-04-08 05:13:07', NULL),
(70, 'tax_rate.delete', 'web', '2023-04-08 05:13:07', NULL),
(71, 'unit.view', 'web', '2023-04-08 05:13:07', NULL),
(72, 'unit.create', 'web', '2023-04-08 05:13:07', NULL),
(73, 'unit.update', 'web', '2023-04-08 05:13:07', NULL),
(74, 'unit.delete', 'web', '2023-04-08 05:13:07', NULL),
(75, 'category.view', 'web', '2023-04-08 05:13:07', NULL),
(76, 'category.create', 'web', '2023-04-08 05:13:07', NULL),
(77, 'category.update', 'web', '2023-04-08 05:13:07', NULL),
(78, 'category.delete', 'web', '2023-04-08 05:13:07', NULL),
(79, 'expense.access', 'web', '2023-04-08 05:13:07', NULL),
(80, 'access_all_locations', 'web', '2023-04-08 05:13:07', NULL),
(81, 'dashboard.data', 'web', '2023-04-08 05:13:07', NULL),
(82, 'location.1', 'web', '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(83, 'location.2', 'web', '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(84, 'direct_sell.update', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(85, 'edit_sell_payment', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(86, 'view_product_stock_value', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(87, 'expense.add', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(88, 'expense.edit', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(89, 'customer_irrespective_of_sell', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(90, 'direct_sell.view', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(91, 'all_expense.access', 'web', '2023-04-10 03:37:56', '2023-04-10 03:37:56'),
(92, 'view_export_buttons', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(93, 'edit_purchase_payment', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(94, 'delete_purchase_payment', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(95, 'edit_pos_payment', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(96, 'view_paid_sells_only', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(97, 'view_due_sells_only', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(98, 'view_partial_sells_only', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(99, 'view_overdue_sells_only', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(100, 'direct_sell.delete', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(101, 'view_commission_agent_sell', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(102, 'delete_sell_payment', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(103, 'access_types_of_service', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(104, 'access_sell_return', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(105, 'access_own_sell_return', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(106, 'edit_invoice_number', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(107, 'draft.update', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(108, 'draft.delete', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(109, 'quotation.update', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(110, 'quotation.delete', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(111, 'access_pending_shipments_only', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(112, 'access_commission_agent_shipping', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(113, 'access_printers', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(114, 'expense.delete', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(115, 'edit_account_transaction', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(116, 'delete_account_transaction', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(117, 'access_tables', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(118, 'supplier.view_own', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(119, 'customer.view_own', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(120, 'view_own_purchase', 'web', '2023-07-10 10:19:13', '2023-07-10 10:19:13'),
(121, 'draft.view_own', 'web', '2023-07-10 10:19:14', '2023-07-10 10:19:14'),
(122, 'quotation.view_own', 'web', '2023-07-10 10:19:14', '2023-07-10 10:19:14'),
(123, 'access_own_shipping', 'web', '2023-07-10 10:19:14', '2023-07-10 10:19:14'),
(124, 'view_own_expense', 'web', '2023-07-10 10:19:14', '2023-07-10 10:19:14'),
(125, 'draft.view_all', 'web', '2023-07-10 10:23:07', '2023-07-10 10:23:07'),
(126, 'quotation.view_all', 'web', '2023-07-10 10:23:07', '2023-07-10 10:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'TJ BOX 4 PORT', 2, 'single', 2, NULL, NULL, 1, 10, NULL, NULL, 'exclusive', 1, 5.0000, '0001', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689416978_download.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 09:56:25', '2023-07-15 10:38:21'),
(2, 'TJ BOX 8 PORT', 2, 'single', 2, NULL, NULL, 1, 10, NULL, NULL, 'exclusive', 1, NULL, '0002', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689417273_download.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 10:34:33', '2023-07-15 10:34:33'),
(3, 'TJ BOX 2 PORT', 2, 'single', 2, NULL, NULL, 1, 10, NULL, NULL, 'exclusive', 1, NULL, '0003', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689417378_download.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 10:36:18', '2023-07-15 10:36:18'),
(4, 'SPLITTER 1*2', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0004', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689418411_SPLITTER.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 10:53:31', '2023-07-15 11:25:38'),
(5, 'SPLITTER 1*4', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0005', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689420019_SPLITTER.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 11:19:11', '2023-07-15 11:26:21'),
(6, 'SPLITTER 1*8', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0006', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689420295_SPLITTER.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 11:24:55', '2023-07-15 11:24:55'),
(7, 'SPLITTER 1*16', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0007', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689420628_SPLITTER.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 11:30:28', '2023-07-15 11:30:28'),
(8, 'SPLITTER With Connectors', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0008', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689420911_download (1).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 11:35:11', '2023-07-15 11:36:23'),
(9, 'Splitter Coupler Dish 1*2', 2, 'single', 2, NULL, NULL, 1, 11, NULL, NULL, 'exclusive', 1, NULL, '0009', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689509552_download (2).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 11:46:36', '2023-07-16 12:12:32'),
(10, 'SWITCH 8 PORT', 2, 'single', 2, NULL, NULL, 4, 12, NULL, NULL, 'exclusive', 1, NULL, '0010', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689422433_download (3).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 12:00:33', '2023-07-16 10:23:36'),
(11, 'SWITCH 5 PORT', 2, 'single', 2, NULL, NULL, 4, 12, NULL, NULL, 'exclusive', 1, NULL, '0011', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689423155_tenda-s105-5-port-500x500-1.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-15 12:12:35', '2023-07-16 10:22:55'),
(12, 'Connectors Rj45', 2, 'single', 2, NULL, NULL, 1, 13, NULL, NULL, 'exclusive', 1, NULL, '0012', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689503672_3.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 10:31:04', '2023-07-16 10:34:32'),
(13, 'Modular Plug Crimper', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0013', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689504873_4.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 10:49:25', '2023-07-16 11:21:14'),
(14, 'Cable Tester', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0014', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689506599_5.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 11:23:19', '2023-07-16 11:23:19'),
(15, 'TV JACK', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0015', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689508352_6.jpeg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 11:44:35', '2023-07-16 11:52:32'),
(16, 'Tv Splitter 1*3', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0016', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689509854_download (4).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 11:49:25', '2023-07-16 12:21:23'),
(18, 'Tv Splitter 1*2', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0018', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689509666_download (4).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 12:14:26', '2023-07-16 12:22:00'),
(19, 'Tv Splitter 1*4', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0019', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689510034_download (4).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 12:20:34', '2023-07-16 12:20:34'),
(20, 'Hybrid Cable Amplifier 12dBm', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0017', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689510852_download (5).jpg', '<p>Working up to -12 dBm</p>', 2, NULL, NULL, 0, 0, '2023-07-16 12:34:12', '2023-07-16 12:35:38'),
(21, 'Hybrid Cable Amplifier 16dBm', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0021', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689511096_download (5).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 12:38:16', '2023-07-16 12:38:16'),
(22, '12v Adapter', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0022', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689511463_7.jpeg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 12:44:23', '2023-07-16 12:44:23'),
(23, 'Patch Core', 2, 'single', 2, NULL, NULL, 5, 13, NULL, NULL, 'exclusive', 1, NULL, '0023', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689511815_download (6).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-16 12:50:15', '2023-07-16 12:50:15'),
(24, 'CABLE CAT 5E', 2, 'single', 3, NULL, NULL, 1, 15, NULL, NULL, 'exclusive', 1, NULL, '0024', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689586606_download (7).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 09:36:46', '2023-07-17 09:36:46'),
(25, 'PROTECTION SLEEVES', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0025', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689587042_download (8).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 09:44:02', '2023-07-17 10:00:29'),
(26, 'TENDA F6', 2, 'single', 2, NULL, NULL, 6, 16, NULL, NULL, 'exclusive', 1, NULL, '0026', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689587984_download (9).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 09:56:36', '2023-07-18 12:44:48'),
(27, 'TENDA N301', 2, 'single', 2, NULL, NULL, 6, 16, NULL, NULL, 'exclusive', 1, NULL, '0027', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689588129_download (10).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:02:09', '2023-07-18 12:45:33'),
(28, 'HUAWEI XPON ONU 1 OUT', 2, 'single', 2, NULL, NULL, 3, 17, NULL, NULL, 'exclusive', 1, NULL, '0028', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689588457_download (11).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:05:13', '2023-07-17 10:07:37'),
(29, 'HUAWEI XPON ONU 2 OUT', 2, 'single', 2, NULL, NULL, 3, 17, NULL, NULL, 'exclusive', 1, NULL, '0029', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689588528_download (12).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:08:48', '2023-07-17 10:08:48'),
(30, 'HUAWEI XPON ONU 4 OUT', 2, 'single', 2, NULL, NULL, 3, 17, NULL, NULL, 'exclusive', 1, NULL, '0030', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689588617_images.jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:10:17', '2023-07-17 10:10:17'),
(31, 'BD-PON EPON ONU 1G', 2, 'single', 2, NULL, NULL, 1, 17, NULL, NULL, 'exclusive', 1, NULL, '0031', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689588807_download (13).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:13:27', '2023-07-17 10:13:27'),
(32, 'POWER METAR MINE', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0032', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674043_download (23).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:46:55', '2023-07-18 09:54:03'),
(33, 'POWER METAR BD-PON', 2, 'single', 2, NULL, NULL, 1, 14, NULL, NULL, 'exclusive', 1, NULL, '0033', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673958_download (22).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:48:48', '2023-07-18 09:52:38'),
(34, 'TOOLS CFS-3', 2, 'single', 2, NULL, NULL, 5, 14, NULL, NULL, 'exclusive', 1, NULL, '0034', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674303_download (26).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 10:50:45', '2023-07-18 09:58:23'),
(35, 'OPTIC STRIPPER Z03', 2, 'single', 2, NULL, NULL, 1, 14, NULL, NULL, 'exclusive', 1, NULL, '0035', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673829_download (21).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 11:39:00', '2023-07-18 09:50:29'),
(36, 'TP-LINK WR841N', 2, 'single', 2, NULL, NULL, 7, 16, NULL, NULL, 'exclusive', 1, NULL, '0036', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674513_download (28).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 11:44:53', '2023-07-18 10:23:14'),
(37, 'TP-LINK C60', 2, 'single', 2, NULL, NULL, 7, 16, NULL, NULL, 'exclusive', 1, NULL, '0037', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674410_download (27).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 11:46:02', '2023-07-18 10:22:42'),
(38, 'FIVER CABLE 2F COR', 2, 'single', 3, NULL, NULL, 1, 15, NULL, NULL, 'exclusive', 1, NULL, '0038', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674125_download (24).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 11:48:25', '2023-07-18 09:55:25'),
(39, 'CAT 6 COPPER OUTDOOR', 2, 'single', 3, NULL, NULL, 1, 15, NULL, NULL, 'exclusive', 1, NULL, '0039', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689597926_download (14).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 11:52:20', '2023-07-17 12:45:26'),
(40, 'DAHUA B1A21P', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0040', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689659784_download (17).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:01:11', '2023-07-18 06:01:06'),
(41, 'DAHUA T1A21P', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0041', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689660150_download (19).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:02:42', '2023-07-18 06:02:30'),
(42, 'DAHUA-1209CP-LED', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0042', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673670_download (17).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:05:31', '2023-07-18 09:47:50'),
(43, 'DAHUA-1209CP-A-LED', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0043', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673632_download (17).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:06:35', '2023-07-18 09:47:12'),
(44, 'DAHUA-1209CLQP-LED', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0044', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673532_download (20).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:08:41', '2023-07-18 09:45:32'),
(45, 'DAHUA-1209CLQP-A-LED', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0045', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673568_download (17).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:09:47', '2023-07-18 09:46:08'),
(46, 'DAHUA-4CH-1B04-I', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0046', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689673763_download (18).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:18:27', '2023-07-18 09:49:23'),
(47, 'DAHUA 8CH 1B08-I', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0047', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689659881_download (18).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:19:58', '2023-07-18 05:58:01'),
(48, 'RANGER 2', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0048', 'C128', 12.00, 'months', 0, NULL, '8LFE63PAZAAD2E', NULL, NULL, NULL, '1689674209_download (25).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:21:20', '2023-07-18 09:56:49'),
(49, 'V380 3 ANTINA', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0049', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674591_download (29).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:22:43', '2023-07-18 10:03:11'),
(50, 'V380 E-27', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0050', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674670_download (30).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:23:33', '2023-07-18 10:04:30'),
(51, 'WD-1TB', 2, 'single', 2, NULL, NULL, 2, 20, NULL, NULL, 'exclusive', 1, NULL, '0051', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689675250_download (32).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:24:46', '2023-07-18 10:14:10'),
(52, 'WD-2TB', 2, 'single', 2, NULL, NULL, 2, 20, NULL, NULL, 'exclusive', 1, NULL, '0052', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689675322_download (33).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:25:28', '2023-07-18 10:15:22'),
(53, 'APTECH 19\'\' MONITOR', 2, 'single', 2, NULL, NULL, 2, 18, NULL, NULL, 'exclusive', 1, NULL, '0053', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689598345_download (16).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:26:41', '2023-07-17 12:52:25'),
(54, 'APTECH 22\'\' MONITOR', 2, 'single', 2, NULL, NULL, 2, 18, NULL, NULL, 'exclusive', 1, NULL, '0054', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689598379_download (16).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:27:39', '2023-07-17 12:52:59'),
(55, 'WD-500GB', 2, 'single', 2, NULL, NULL, 2, 20, NULL, NULL, 'exclusive', 1, NULL, '0055', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689675848_download (32).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:28:37', '2023-07-18 10:24:08'),
(56, 'VIDEO BALUN-8MP', 2, 'single', 2, NULL, NULL, 2, 19, NULL, NULL, 'exclusive', 1, NULL, '0056', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689674728_download (31).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:30:40', '2023-07-18 10:05:28'),
(57, 'ADAPTER 12V-2A BOX', 2, 'single', 2, NULL, NULL, 2, 13, NULL, NULL, 'exclusive', 1, NULL, '0057', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689598103_download (15).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:32:21', '2023-07-17 12:48:23'),
(58, 'ADAPTER 12V-2A', 2, 'single', 2, NULL, NULL, 2, 13, NULL, NULL, 'exclusive', 1, NULL, '0058', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689598141_7.jpeg', NULL, 2, NULL, NULL, 0, 0, '2023-07-17 12:33:36', '2023-07-17 12:49:01'),
(59, 'TP-LINK C20', 2, 'single', 2, NULL, NULL, 7, 16, NULL, NULL, 'exclusive', 1, NULL, '0059', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689675597_download (27).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-18 10:19:57', '2023-07-18 10:22:15'),
(60, '4 CORE OFC', 2, 'single', 3, NULL, NULL, 9, 15, NULL, NULL, 'exclusive', 1, NULL, '0060', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1689677153_download (14).jpg', NULL, 2, NULL, NULL, 0, 0, '2023-07-18 10:41:27', '2023-07-18 10:45:53'),
(61, 'MI', 2, 'single', 2, NULL, NULL, 8, 16, NULL, NULL, 'exclusive', 1, NULL, '0061', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, '2023-07-18 10:56:49', '2023-07-18 10:56:49'),
(62, 'PiNODE', 2, 'single', 2, NULL, NULL, 2, 18, NULL, NULL, 'exclusive', 1, NULL, '123', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, '2023-07-22 05:46:26', '2023-07-22 05:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(6, 2),
(4, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2023-07-15 09:56:25', '2023-07-15 09:56:25'),
(2, NULL, 'DUMMY', 2, 1, '2023-07-15 10:34:33', '2023-07-15 10:34:33'),
(3, NULL, 'DUMMY', 3, 1, '2023-07-15 10:36:18', '2023-07-15 10:36:18'),
(4, NULL, 'DUMMY', 4, 1, '2023-07-15 10:53:31', '2023-07-15 10:53:31'),
(5, NULL, 'DUMMY', 5, 1, '2023-07-15 11:19:11', '2023-07-15 11:19:11'),
(6, NULL, 'DUMMY', 6, 1, '2023-07-15 11:24:55', '2023-07-15 11:24:55'),
(7, NULL, 'DUMMY', 7, 1, '2023-07-15 11:30:28', '2023-07-15 11:30:28'),
(8, NULL, 'DUMMY', 8, 1, '2023-07-15 11:35:11', '2023-07-15 11:35:11'),
(9, NULL, 'DUMMY', 9, 1, '2023-07-15 11:46:36', '2023-07-15 11:46:36'),
(10, NULL, 'DUMMY', 10, 1, '2023-07-15 12:00:33', '2023-07-15 12:00:33'),
(11, NULL, 'DUMMY', 11, 1, '2023-07-15 12:12:35', '2023-07-15 12:12:35'),
(12, NULL, 'DUMMY', 12, 1, '2023-07-16 10:31:04', '2023-07-16 10:31:04'),
(13, NULL, 'DUMMY', 13, 1, '2023-07-16 10:49:25', '2023-07-16 10:49:25'),
(14, NULL, 'DUMMY', 14, 1, '2023-07-16 11:23:19', '2023-07-16 11:23:19'),
(15, NULL, 'DUMMY', 15, 1, '2023-07-16 11:44:35', '2023-07-16 11:44:35'),
(16, NULL, 'DUMMY', 16, 1, '2023-07-16 11:49:25', '2023-07-16 11:49:25'),
(18, NULL, 'DUMMY', 18, 1, '2023-07-16 12:14:26', '2023-07-16 12:14:26'),
(19, NULL, 'DUMMY', 19, 1, '2023-07-16 12:20:34', '2023-07-16 12:20:34'),
(20, NULL, 'DUMMY', 20, 1, '2023-07-16 12:34:12', '2023-07-16 12:34:12'),
(21, NULL, 'DUMMY', 21, 1, '2023-07-16 12:38:16', '2023-07-16 12:38:16'),
(22, NULL, 'DUMMY', 22, 1, '2023-07-16 12:44:23', '2023-07-16 12:44:23'),
(23, NULL, 'DUMMY', 23, 1, '2023-07-16 12:50:15', '2023-07-16 12:50:15'),
(24, NULL, 'DUMMY', 24, 1, '2023-07-17 09:36:46', '2023-07-17 09:36:46'),
(25, NULL, 'DUMMY', 25, 1, '2023-07-17 09:44:02', '2023-07-17 09:44:02'),
(26, NULL, 'DUMMY', 26, 1, '2023-07-17 09:56:36', '2023-07-17 09:56:36'),
(27, NULL, 'DUMMY', 27, 1, '2023-07-17 10:02:09', '2023-07-17 10:02:09'),
(28, NULL, 'DUMMY', 28, 1, '2023-07-17 10:05:13', '2023-07-17 10:05:13'),
(29, NULL, 'DUMMY', 29, 1, '2023-07-17 10:08:48', '2023-07-17 10:08:48'),
(30, NULL, 'DUMMY', 30, 1, '2023-07-17 10:10:17', '2023-07-17 10:10:17'),
(31, NULL, 'DUMMY', 31, 1, '2023-07-17 10:13:27', '2023-07-17 10:13:27'),
(32, NULL, 'DUMMY', 32, 1, '2023-07-17 10:46:55', '2023-07-17 10:46:55'),
(33, NULL, 'DUMMY', 33, 1, '2023-07-17 10:48:48', '2023-07-17 10:48:48'),
(34, NULL, 'DUMMY', 34, 1, '2023-07-17 10:50:45', '2023-07-17 10:50:45'),
(35, NULL, 'DUMMY', 35, 1, '2023-07-17 11:39:00', '2023-07-17 11:39:00'),
(36, NULL, 'DUMMY', 36, 1, '2023-07-17 11:44:53', '2023-07-17 11:44:53'),
(37, NULL, 'DUMMY', 37, 1, '2023-07-17 11:46:02', '2023-07-17 11:46:02'),
(38, NULL, 'DUMMY', 38, 1, '2023-07-17 11:48:25', '2023-07-17 11:48:25'),
(39, NULL, 'DUMMY', 39, 1, '2023-07-17 11:52:20', '2023-07-17 11:52:20'),
(40, NULL, 'DUMMY', 40, 1, '2023-07-17 12:01:11', '2023-07-17 12:01:11'),
(41, NULL, 'DUMMY', 41, 1, '2023-07-17 12:02:42', '2023-07-17 12:02:42'),
(42, NULL, 'DUMMY', 42, 1, '2023-07-17 12:05:31', '2023-07-17 12:05:31'),
(43, NULL, 'DUMMY', 43, 1, '2023-07-17 12:06:35', '2023-07-17 12:06:35'),
(44, NULL, 'DUMMY', 44, 1, '2023-07-17 12:08:41', '2023-07-17 12:08:41'),
(45, NULL, 'DUMMY', 45, 1, '2023-07-17 12:09:47', '2023-07-17 12:09:47'),
(46, NULL, 'DUMMY', 46, 1, '2023-07-17 12:18:27', '2023-07-17 12:18:27'),
(47, NULL, 'DUMMY', 47, 1, '2023-07-17 12:19:58', '2023-07-17 12:19:58'),
(48, NULL, 'DUMMY', 48, 1, '2023-07-17 12:21:20', '2023-07-17 12:21:20'),
(49, NULL, 'DUMMY', 49, 1, '2023-07-17 12:22:43', '2023-07-17 12:22:43'),
(50, NULL, 'DUMMY', 50, 1, '2023-07-17 12:23:33', '2023-07-17 12:23:33'),
(51, NULL, 'DUMMY', 51, 1, '2023-07-17 12:24:46', '2023-07-17 12:24:46'),
(52, NULL, 'DUMMY', 52, 1, '2023-07-17 12:25:28', '2023-07-17 12:25:28'),
(53, NULL, 'DUMMY', 53, 1, '2023-07-17 12:26:41', '2023-07-17 12:26:41'),
(54, NULL, 'DUMMY', 54, 1, '2023-07-17 12:27:39', '2023-07-17 12:27:39'),
(55, NULL, 'DUMMY', 55, 1, '2023-07-17 12:28:37', '2023-07-17 12:28:37'),
(56, NULL, 'DUMMY', 56, 1, '2023-07-17 12:30:40', '2023-07-17 12:30:40'),
(57, NULL, 'DUMMY', 57, 1, '2023-07-17 12:32:21', '2023-07-17 12:32:21'),
(58, NULL, 'DUMMY', 58, 1, '2023-07-17 12:33:36', '2023-07-17 12:33:36'),
(59, NULL, 'DUMMY', 59, 1, '2023-07-18 10:19:57', '2023-07-18 10:19:57'),
(60, NULL, 'DUMMY', 60, 1, '2023-07-18 10:41:27', '2023-07-18 10:41:27'),
(61, NULL, 'DUMMY', 61, 1, '2023-07-18 10:56:49', '2023-07-18 10:56:49'),
(62, NULL, 'DUMMY', 62, 1, '2023-07-22 05:46:26', '2023-07-22 05:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_requisition_line_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 14.0000, 0.0000, 25.0000, 0.00, 25.0000, 25.0000, 0.0000, NULL, NULL, NULL, 4.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 10:02:24', '2023-07-20 13:20:23'),
(2, 2, 2, 2, 54.0000, 0.0000, 85.0000, 0.00, 85.0000, 85.0000, 0.0000, NULL, NULL, NULL, 9.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 10:34:50', '2023-07-20 11:13:52'),
(3, 3, 3, 3, 18.0000, 0.0000, 25.0000, 0.00, 25.0000, 25.0000, 0.0000, NULL, NULL, NULL, 18.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 10:37:39', '2023-07-20 10:16:11'),
(4, 4, 4, 4, 6.0000, 0.0000, 170.0000, 0.00, 170.0000, 170.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 10:54:05', '2023-07-20 12:13:13'),
(5, 5, 5, 5, 8.0000, 0.0000, 200.0000, 0.00, 200.0000, 200.0000, 0.0000, NULL, NULL, NULL, 8.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 11:19:39', '2023-07-20 12:03:05'),
(6, 6, 6, 6, 13.0000, 0.0000, 200.0000, 0.00, 200.0000, 200.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 11:25:14', '2023-07-20 12:13:13'),
(7, 7, 7, 7, 9.0000, 0.0000, 500.0000, 0.00, 500.0000, 500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 11:30:44', '2023-07-15 11:30:44'),
(8, 8, 8, 8, 2.0000, 0.0000, 950.0000, 0.00, 950.0000, 950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 11:35:26', '2023-07-15 11:36:29'),
(9, 9, 9, 9, 78.0000, 0.0000, 500.0000, 0.00, 500.0000, 500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 11:55:10', '2023-07-16 12:06:42'),
(10, 10, 10, 10, 14.0000, 0.0000, 500.0000, 0.00, 500.0000, 500.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 12:00:53', '2023-07-19 11:41:56'),
(11, 11, 11, 11, 4.0000, 0.0000, 450.0000, 0.00, 450.0000, 450.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-15 12:12:50', '2023-07-15 12:12:50'),
(12, 12, 12, 12, 1000.0000, 0.0000, 2.4000, 0.00, 2.4000, 2.4000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 10:31:16', '2023-07-16 10:31:16'),
(13, 13, 13, 13, 3.0000, 0.0000, 680.0000, 0.00, 680.0000, 680.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 10:49:35', '2023-07-16 10:49:35'),
(14, 14, 14, 14, 2.0000, 0.0000, 280.0000, 0.00, 280.0000, 280.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 11:23:34', '2023-07-16 11:23:34'),
(15, 15, 15, 15, 200.0000, 0.0000, 0.2000, 0.00, 0.2000, 0.2000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 11:45:47', '2023-07-16 11:50:40'),
(16, 16, 18, 18, 20.0000, 0.0000, 25.0000, 0.00, 25.0000, 25.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:14:46', '2023-07-16 12:14:46'),
(17, 17, 16, 16, 20.0000, 0.0000, 28.0000, 0.00, 28.0000, 28.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:17:52', '2023-07-16 12:17:52'),
(18, 18, 19, 19, 20.0000, 0.0000, 28.0000, 0.00, 28.0000, 28.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:20:49', '2023-07-16 12:20:49'),
(19, 19, 20, 20, 2.0000, 0.0000, 1300.0000, 0.00, 1300.0000, 1300.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:34:25', '2023-07-16 12:34:25'),
(20, 20, 21, 21, 1.0000, 0.0000, 1280.0000, 0.00, 1280.0000, 1280.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:38:28', '2023-07-16 12:38:28'),
(21, 21, 22, 22, 110.0000, 0.0000, 95.0000, 0.00, 95.0000, 95.0000, 0.0000, NULL, NULL, NULL, 6.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:44:42', '2023-07-22 05:48:57'),
(22, 22, 23, 23, 159.0000, 0.0000, 65.0000, 0.00, 65.0000, 65.0000, 0.0000, NULL, NULL, NULL, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-16 12:50:31', '2023-07-20 10:16:11'),
(23, 23, 24, 24, 1525.0000, 0.0000, 8.3700, 0.00, 8.3700, 8.3700, 0.0000, NULL, NULL, NULL, 915.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 09:37:23', '2023-07-20 12:20:21'),
(24, 24, 25, 25, 600.0000, 0.0000, 0.8500, 0.00, 0.8500, 0.8500, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 09:44:15', '2023-07-17 09:44:15'),
(25, 25, 26, 26, 10.0000, 0.0000, 1220.0000, 0.00, 1220.0000, 1220.0000, 0.0000, NULL, NULL, NULL, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-20 12:52:59'),
(26, 25, 27, 27, 10.0000, 0.0000, 880.0000, 0.00, 880.0000, 880.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-20 12:04:49'),
(27, 25, 28, 28, 40.0000, 0.0000, 630.0000, 0.00, 630.0000, 630.0000, 0.0000, NULL, NULL, NULL, 9.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-20 13:20:23'),
(28, 25, 29, 29, 10.0000, 0.0000, 630.0000, 0.00, 630.0000, 630.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-20 13:24:52'),
(29, 25, 30, 30, 10.0000, 0.0000, 850.0000, 0.00, 850.0000, 850.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-17 10:30:00'),
(30, 25, 31, 31, 20.0000, 0.0000, 800.0000, 0.00, 800.0000, 800.0000, 0.0000, NULL, NULL, NULL, 7.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-20 12:13:13'),
(36, 27, 25, 25, 2400.0000, 0.0000, 1.0000, 0.00, 1.0000, 1.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(37, 27, 14, 14, 5.0000, 0.0000, 300.0000, 0.00, 300.0000, 300.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(38, 27, 32, 32, 2.0000, 0.0000, 2600.0000, 0.00, 2600.0000, 2600.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(39, 27, 33, 33, 2.0000, 0.0000, 3500.0000, 0.00, 3500.0000, 3500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(40, 27, 34, 34, 2.0000, 0.0000, 700.0000, 0.00, 700.0000, 700.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(41, 27, 35, 35, 2.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-20 12:20:21'),
(42, 27, 11, 11, 10.0000, 0.0000, 560.0000, 0.00, 560.0000, 560.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(43, 27, 3, 3, 100.0000, 0.0000, 25.0000, 0.00, 25.0000, 25.0000, 0.0000, NULL, NULL, NULL, 14.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-20 12:13:13'),
(44, 27, 36, 36, 10.0000, 0.0000, 1450.0000, 0.00, 1450.0000, 1450.0000, 0.0000, NULL, NULL, NULL, 3.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-20 13:26:29'),
(45, 27, 37, 37, 5.0000, 0.0000, 2900.0000, 0.00, 2900.0000, 2900.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-20 10:22:19'),
(46, 27, 38, 38, 2000.0000, 0.0000, 9.7000, 0.00, 9.7000, 9.7000, 0.0000, NULL, NULL, NULL, 300.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-20 12:13:13'),
(47, 27, 12, 12, 1000.0000, 0.0000, 2.5000, 0.00, 2.5000, 2.5000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(48, 27, 39, 39, 305.0000, 0.0000, 45.9100, 0.00, 45.9100, 45.9100, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(49, 28, 40, 40, 4.0000, 0.0000, 1260.0000, 0.00, 1260.0000, 1260.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(50, 28, 41, 41, 2.0000, 0.0000, 1200.0000, 0.00, 1200.0000, 1200.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(51, 28, 42, 42, 2.0000, 0.0000, 1800.0000, 0.00, 1800.0000, 1800.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(52, 28, 43, 43, 2.0000, 0.0000, 1930.0000, 0.00, 1930.0000, 1930.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(53, 28, 44, 44, 2.0000, 0.0000, 1800.0000, 0.00, 1800.0000, 1800.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(54, 28, 45, 45, 2.0000, 0.0000, 1900.0000, 0.00, 1900.0000, 1900.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(55, 28, 46, 46, 1.0000, 0.0000, 3030.0000, 0.00, 3030.0000, 3030.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(56, 28, 47, 47, 1.0000, 0.0000, 3800.0000, 0.00, 3800.0000, 3800.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(57, 28, 48, 48, 1.0000, 0.0000, 2750.0000, 0.00, 2750.0000, 2750.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(58, 28, 49, 49, 1.0000, 0.0000, 1300.0000, 0.00, 1300.0000, 1300.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(59, 28, 50, 50, 2.0000, 0.0000, 1100.0000, 0.00, 1100.0000, 1100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(60, 28, 51, 51, 1.0000, 0.0000, 2400.0000, 0.00, 2400.0000, 2400.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(61, 28, 52, 52, 1.0000, 0.0000, 3450.0000, 0.00, 3450.0000, 3450.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(62, 28, 53, 53, 1.0000, 0.0000, 4950.0000, 0.00, 4950.0000, 4950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(63, 28, 54, 54, 1.0000, 0.0000, 7700.0000, 0.00, 7700.0000, 7700.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(64, 28, 55, 55, 2.0000, 0.0000, 980.0000, 0.00, 980.0000, 980.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(65, 28, 56, 56, 35.0000, 0.0000, 85.0000, 0.00, 85.0000, 85.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-20 09:48:06'),
(66, 28, 57, 57, 20.0000, 0.0000, 170.0000, 0.00, 170.0000, 170.0000, 0.0000, NULL, NULL, NULL, 6.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-20 09:48:06'),
(67, 28, 58, 58, 30.0000, 0.0000, 108.0000, 0.00, 108.0000, 108.0000, 0.0000, NULL, NULL, NULL, 6.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-20 10:16:11'),
(68, 29, 59, 59, 8.0000, 0.0000, 1980.0000, 0.00, 1980.0000, 1980.0000, 0.0000, NULL, NULL, NULL, 7.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-18 10:27:10', '2023-07-20 12:51:49'),
(69, 30, 61, 61, 25.0000, 0.0000, 736.0000, 0.00, 736.0000, 736.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-18 10:57:06', '2023-07-18 10:57:06'),
(70, 34, 60, 60, 3000.0000, 0.0000, 13.0000, 0.00, 13.0000, 13.0000, 0.0000, NULL, NULL, NULL, 1180.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2023-07-19 10:05:35', '2023-07-20 13:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 1, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 'business_location', 1, 1, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(3, 'contacts', 31, 2, '2023-04-08 14:08:20', '2023-07-20 13:25:43'),
(4, 'business_location', 1, 2, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(5, 'sell_payment', 98, 2, '2023-04-08 16:20:05', '2023-07-22 05:48:57'),
(6, 'sell_return', 8, 2, '2023-04-08 17:02:04', '2023-07-10 10:41:23'),
(7, 'expense', 1, 2, '2023-04-09 03:31:45', '2023-04-09 03:31:45'),
(8, 'draft', 2, 2, '2023-04-09 05:28:23', '2023-04-09 07:31:22'),
(9, 'opening_balance', 1, 2, '2023-04-09 07:43:43', '2023-04-09 07:43:43'),
(10, 'stock_adjustment', 2, 2, '2023-04-09 17:48:27', '2023-04-09 17:49:56'),
(11, 'purchase', 7, 2, '2023-07-17 10:30:00', '2023-07-19 10:05:35'),
(12, 'purchase_payment', 3, 2, '2023-07-18 10:58:06', '2023-07-20 10:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(3, 'Admin#2', 'web', 2, 1, 0, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(4, 'Cashier#2', 'web', 2, 0, 1, '2023-04-08 14:08:20', '2023-07-10 10:23:07'),
(5, 'SubAdmin#2', 'web', 2, 0, 1, '2023-07-10 10:19:13', '2023-07-10 10:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(80, 2),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(6, 4),
(7, 4),
(11, 4),
(15, 4),
(17, 4),
(21, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(33, 4),
(36, 4),
(37, 4),
(40, 4),
(41, 4),
(42, 4),
(44, 4),
(48, 4),
(49, 4),
(50, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(81, 4),
(84, 4),
(85, 4),
(86, 4),
(87, 4),
(88, 4),
(89, 4),
(90, 4),
(91, 4),
(95, 4),
(113, 4),
(117, 4),
(118, 4),
(125, 4),
(126, 4),
(1, 5),
(2, 5),
(3, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(22, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(33, 5),
(34, 5),
(35, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(43, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(67, 5),
(68, 5),
(69, 5),
(70, 5),
(71, 5),
(72, 5),
(73, 5),
(74, 5),
(75, 5),
(76, 5),
(77, 5),
(78, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(88, 5),
(89, 5),
(92, 5),
(93, 5),
(94, 5),
(95, 5),
(96, 5),
(97, 5),
(98, 5),
(99, 5),
(100, 5),
(101, 5),
(102, 5),
(103, 5),
(104, 5),
(105, 5),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(110, 5),
(111, 5),
(112, 5),
(113, 5),
(114, 5),
(117, 5),
(118, 5),
(119, 5),
(120, 5),
(121, 5),
(122, 5),
(123, 5),
(124, 5);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '5.0'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `for_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `purchase_requisition_ids` text COLLATE utf8mb4_unicode_ci,
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:02:24', 25.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 10:02:24', '2023-07-15 10:02:24'),
(2, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:34:50', 85.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4590.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 10:34:50', '2023-07-15 10:34:50'),
(3, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:37:00', 25.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 450.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 10:37:39', '2023-07-15 10:37:39'),
(4, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:54:00', 170.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1020.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 10:54:05', '2023-07-15 10:54:05'),
(5, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:19:00', 200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 11:19:39', '2023-07-15 11:19:39'),
(6, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:25:00', 200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 11:25:14', '2023-07-15 11:25:14'),
(7, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:31:00', 500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 11:30:44', '2023-07-15 11:30:44'),
(8, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:35:00', 1900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1900.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 11:35:26', '2023-07-15 11:36:29'),
(9, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:55:00', 39000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 39000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 11:55:10', '2023-07-16 12:06:42'),
(10, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:01:00', 7000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 12:00:53', '2023-07-15 12:07:59'),
(11, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:13:00', 450.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1800.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 11, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 12:12:50', '2023-07-15 12:12:50'),
(12, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:31:00', 2.4000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2400.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 10:31:16', '2023-07-16 10:31:16'),
(13, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 16:49:00', 680.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2040.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 10:49:35', '2023-07-16 10:49:35'),
(14, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:23:00', 280.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 560.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 11:23:34', '2023-07-16 11:23:34'),
(15, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 17:45:00', 40.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 40.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 15, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 11:45:47', '2023-07-16 11:50:40'),
(16, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:14:00', 25.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 18, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:14:46', '2023-07-16 12:14:46'),
(17, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:17:00', 28.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 560.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 16, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:17:52', '2023-07-16 12:17:52'),
(18, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:20:00', 28.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 560.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:20:49', '2023-07-16 12:20:49'),
(19, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:34:00', 1300.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:34:25', '2023-07-16 12:34:25'),
(20, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:38:00', 1280.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1280.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:38:28', '2023-07-16 12:38:28'),
(21, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:44:00', 95.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10450.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 22, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:44:42', '2023-07-16 12:44:42'),
(22, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:50:00', 65.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10335.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 12:50:31', '2023-07-16 12:50:31'),
(23, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:37:00', 8.3700, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 12764.2500, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 24, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 09:37:23', '2023-07-17 09:37:23'),
(24, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:44:00', 0.8500, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 510.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 25, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 09:44:15', '2023-07-17 09:44:15'),
(25, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 10, NULL, NULL, 'C00103', NULL, NULL, NULL, '2023-04-03 16:13:00', 77000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 77000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 10:30:00', '2023-07-17 10:30:00'),
(27, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 10, NULL, NULL, '230103385', NULL, NULL, NULL, '2023-03-26 17:29:00', 92502.5500, NULL, 0.0000, 'fixed', 2.5500, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 92500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(28, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 10, NULL, NULL, '230103384', NULL, NULL, NULL, '2023-03-26 17:57:00', 65455.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 65455.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(29, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 10, NULL, NULL, '230103804', NULL, NULL, NULL, '2023-04-05 16:25:00', 15840.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 15840.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 10:27:10', '2023-07-18 10:27:10'),
(30, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2023/0006', NULL, NULL, NULL, '2023-06-14 16:50:00', 18400.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 18400.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 10:57:06', '2023-07-20 10:23:14'),
(31, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 13, NULL, 'NILL-001', '', NULL, NULL, NULL, '2023-05-01 18:00:00', 2475.0000, NULL, 0.0000, 'fixed', 275.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2200.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 12:05:37', '2023-07-18 12:05:37'),
(32, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, 'NILL-002', '', NULL, NULL, NULL, '2023-05-08 18:06:00', 2200.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2200.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 12:09:02', '2023-07-20 12:51:49'),
(33, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 14, NULL, 'NILL-003', '', NULL, NULL, NULL, '2023-05-07 19:21:00', 1600.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1600.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(34, 2, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 11, NULL, NULL, '17062023', NULL, NULL, NULL, '2023-06-17 16:04:00', 39000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 39000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 10:05:35', '2023-07-19 12:49:23'),
(35, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, 'NILL-004', '', NULL, NULL, NULL, '2023-05-07 16:07:00', 640.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 640.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(36, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 15, 1, 'NILL-005', '', NULL, NULL, NULL, '2023-05-15 16:23:00', 2910.0000, NULL, 0.0000, 'fixed', 55.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2855.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '732105c0bf0646e6f6a63221bb05b0e5', NULL, NULL, NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(37, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 13, NULL, 'NILL-006', '', NULL, NULL, NULL, '2023-05-25 16:34:00', 2475.0000, NULL, 0.0000, 'fixed', 75.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2400.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(38, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'partial', NULL, 15, 1, '0035', '', NULL, NULL, NULL, '2023-05-25 16:38:00', 5910.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5910.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '8cb0227f185de457209ba4d64ea9b7e0', NULL, NULL, NULL, '2023-07-19 10:44:24', '2023-07-19 10:46:14'),
(39, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 16, NULL, 'M-101', '', NULL, NULL, NULL, '2023-05-27 17:35:00', 3480.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3480.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(40, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 17, NULL, 'M-102', '', NULL, NULL, NULL, '2023-05-29 15:39:00', 2300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2300.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(41, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 18, NULL, 'M-103', '', NULL, NULL, NULL, '2023-06-07 15:41:00', 6300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6300.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(42, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 19, NULL, '0036', '', NULL, NULL, NULL, '2023-06-07 15:44:00', 1270.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1270.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(43, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 19, NULL, 'M-105', '', NULL, NULL, NULL, '2023-06-07 15:48:00', 2520.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2520.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:50:24', '2023-07-20 12:07:30'),
(44, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 20, NULL, 'M-106', '', NULL, NULL, NULL, '2023-06-17 15:52:00', 1550.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1550.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(45, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 16, NULL, 'M-107', '', NULL, NULL, NULL, '2023-06-08 15:54:00', 900.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 900.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(46, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 21, NULL, 'M-110', '', NULL, NULL, NULL, '2023-06-11 15:56:00', 2300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2300.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(47, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 22, NULL, 'M-111', '', NULL, NULL, NULL, '2023-06-12 15:59:00', 2250.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2250.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(48, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 23, NULL, 'M-112', '', NULL, NULL, NULL, '2023-06-17 16:02:00', 17881.1000, NULL, 0.0000, 'fixed', 1.1000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 17880.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:11'),
(49, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 24, NULL, 'M-114', '', NULL, NULL, NULL, '2023-06-20 16:18:00', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(50, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 25, NULL, 'M-115', '', NULL, NULL, NULL, '2023-06-20 17:11:00', 500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 500.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(51, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 16, NULL, 'M-116', '', NULL, NULL, NULL, '2023-06-22 17:14:00', 900.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 900.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(52, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 26, NULL, 'M-117', '', NULL, NULL, NULL, '2023-06-24 17:16:00', 2490.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2490.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:23:00', '2023-07-20 11:23:00'),
(53, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 27, NULL, 'M-118', '', NULL, NULL, NULL, '2023-06-27 17:55:00', 1500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1500.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(54, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 28, NULL, 'M-119', '', NULL, NULL, NULL, '2023-07-09 17:57:00', 2150.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2150.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(55, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 29, NULL, 'M-120', '', NULL, NULL, NULL, '2023-07-10 18:03:00', 1050.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1050.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(56, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 15, NULL, 'M-121', '', NULL, NULL, NULL, '2023-07-11 18:05:00', 600.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 600.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(57, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 28, NULL, 'M-122', '', NULL, NULL, NULL, '2023-07-13 18:08:00', 3540.0000, NULL, 0.0000, 'fixed', 40.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(58, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 30, NULL, 'M-123', '', NULL, NULL, NULL, '2023-07-14 18:14:00', 7350.0000, NULL, 0.0000, 'fixed', 100.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7250.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(59, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 30, NULL, 'M-124', '', NULL, NULL, NULL, '2023-07-15 18:21:00', 3300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3300.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 12:22:52', '2023-07-20 12:52:59'),
(60, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 16, NULL, 'M-125', '', NULL, NULL, NULL, '2023-07-17 19:18:00', 800.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 800.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(61, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 31, NULL, 'M-126', '', NULL, NULL, NULL, '2023-07-18 19:22:00', 700.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 700.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(62, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 32, NULL, 'M-127', '', NULL, NULL, NULL, '2023-07-18 19:25:00', 1700.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(63, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 31, NULL, 'M-128', '', NULL, NULL, NULL, '2023-07-19 19:26:00', 2520.0000, NULL, 0.0000, 'fixed', 20.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(64, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, '0038', '', NULL, NULL, NULL, '2023-07-22 11:48:57', 118.7500, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 118.7500, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-07-22 05:48:57', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT '0',
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '0',
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `payment_type`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(2, 31, 2, 0, 2200.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-01 18:00:00', 2, 0, NULL, 0, 13, NULL, 'MARUF BY HAND CASH', NULL, 'SP2023/0068', 2, '2023-07-18 12:05:37', '2023-07-18 12:31:17'),
(3, 32, 2, 0, 2200.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 18:06:00', 2, 0, NULL, 0, 2, NULL, 'MARUF HAND CASH', NULL, 'SP2023/0069', 2, '2023-07-18 12:09:02', '2023-07-20 12:51:49'),
(4, 33, 2, 0, 1600.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-07 19:21:00', 4, 0, NULL, 0, 14, NULL, NULL, NULL, 'SP2023/0070', 3, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(5, 35, 2, 0, 640.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-07 16:07:00', 4, 0, NULL, 0, 2, NULL, NULL, NULL, 'SP2023/0071', 3, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(6, 36, 2, 0, 2855.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-15 16:23:00', 4, 0, NULL, 0, 15, NULL, NULL, NULL, 'SP2023/0072', 3, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(7, 37, 2, 0, 2400.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:34:00', 4, 0, NULL, 0, 13, NULL, NULL, NULL, 'SP2023/0073', 3, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(8, 38, 2, 0, 3000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:38:00', 4, 0, NULL, 0, 15, NULL, NULL, NULL, 'SP2023/0074', 3, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(9, 39, 2, 0, 3480.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-27 17:35:00', 4, 0, NULL, 0, 16, NULL, NULL, NULL, 'SP2023/0075', 3, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(10, 34, 2, 0, 39000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 18:48:00', 4, 0, NULL, 0, 11, NULL, NULL, NULL, 'PP2023/0002', 2, '2023-07-19 12:49:23', '2023-07-20 13:49:14'),
(11, 40, 2, 0, 2300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-29 15:39:00', 4, 0, NULL, 0, 17, NULL, NULL, NULL, 'SP2023/0076', 3, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(12, 41, 2, 0, 6300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 15:41:00', 4, 0, NULL, 0, 18, NULL, NULL, NULL, 'SP2023/0077', 3, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(13, 42, 2, 0, 1270.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 15:44:00', 4, 0, NULL, 0, 19, NULL, NULL, NULL, 'SP2023/0078', 3, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(14, 43, 2, 0, 2520.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 15:48:00', 4, 0, NULL, 0, 19, NULL, NULL, NULL, 'SP2023/0079', 3, '2023-07-20 09:50:24', '2023-07-20 12:07:30'),
(15, 44, 2, 0, 1550.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 15:52:00', 4, 0, NULL, 0, 20, NULL, NULL, NULL, 'SP2023/0080', 3, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(16, 45, 2, 0, 900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 15:54:00', 4, 0, NULL, 0, 16, NULL, NULL, NULL, 'SP2023/0081', 3, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(17, 46, 2, 0, 2300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 15:56:00', 4, 0, NULL, 0, 21, NULL, NULL, NULL, 'SP2023/0082', 3, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(18, 47, 2, 0, 2250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-12 15:59:00', 4, 0, NULL, 0, 22, NULL, NULL, NULL, 'SP2023/0083', 3, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(19, 48, 2, 0, 17880.0000, 'bank_transfer', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, '34', '2023-06-17 16:14:00', 4, 0, NULL, 0, 23, NULL, NULL, NULL, 'SP2023/0084', 4, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(20, 49, 2, 0, 3000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-20 16:18:00', 4, 0, NULL, 0, 24, NULL, NULL, NULL, 'SP2023/0085', 3, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(21, 30, 2, 0, 18400.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 16:23:00', 4, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2023/0003', 3, '2023-07-20 10:23:14', '2023-07-20 10:24:05'),
(22, 50, 2, 0, 500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-20 17:11:00', 4, 0, NULL, 0, 25, NULL, NULL, NULL, 'SP2023/0086', 3, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(23, 51, 2, 0, 900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-22 17:14:00', 4, 0, NULL, 0, 16, NULL, NULL, NULL, 'SP2023/0087', 3, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(24, 53, 2, 0, 1500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-27 17:55:00', 4, 0, NULL, 0, 27, NULL, NULL, NULL, 'SP2023/0088', 3, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(25, 54, 2, 0, 2150.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-09 17:57:00', 4, 0, NULL, 0, 28, NULL, NULL, NULL, 'SP2023/0089', 3, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(26, 55, 2, 0, 1050.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 18:03:00', 4, 0, NULL, 0, 29, NULL, NULL, NULL, 'SP2023/0090', 3, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(27, 56, 2, 0, 600.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-11 18:05:00', 4, 0, NULL, 0, 15, NULL, NULL, NULL, 'SP2023/0091', 3, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(28, 57, 2, 0, 3500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-13 18:08:00', 4, 0, NULL, 0, 28, NULL, NULL, NULL, 'SP2023/0092', 3, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(29, 59, 2, 0, 3300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 18:21:00', 4, 0, NULL, 0, 30, NULL, NULL, NULL, 'SP2023/0093', 3, '2023-07-20 12:22:52', '2023-07-20 12:52:59'),
(30, 60, 2, 0, 800.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 19:18:00', 4, 0, NULL, 0, 16, NULL, NULL, NULL, 'SP2023/0094', 3, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(31, 61, 2, 0, 700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 19:22:00', 4, 0, NULL, 0, 31, NULL, NULL, NULL, 'SP2023/0095', 3, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(32, 62, 2, 0, 1700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 19:25:00', 4, 0, NULL, 0, 32, NULL, NULL, NULL, 'SP2023/0096', 3, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(33, 63, 2, 0, 2500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-19 19:26:00', 4, 0, NULL, 0, 31, NULL, NULL, NULL, 'SP2023/0097', 3, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(34, 64, 2, 0, 118.7500, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-22 11:48:57', 2, 0, NULL, 0, 2, NULL, NULL, NULL, 'SP2023/0098', NULL, '2023-07-22 05:48:57', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 31, 59, 59, 1.0000, 0.0000, 0.0000, 2475.0000, 2475.0000, 'fixed', 0.0000, 2475.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-18 12:05:37', '2023-07-18 12:05:37'),
(3, 33, 36, 36, 1.0000, 0.0000, 0.0000, 1812.5000, 1600.0000, 'fixed', 212.5000, 1600.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(4, 35, 5, 5, 4.0000, 0.0000, 0.0000, 225.0000, 160.0000, 'fixed', 65.0000, 160.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(5, 36, 31, 31, 2.0000, 0.0000, 0.0000, 1100.0000, 900.0000, 'fixed', 200.0000, 900.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(6, 36, 3, 3, 5.0000, 0.0000, 0.0000, 40.0000, 40.0000, 'fixed', 0.0000, 40.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(7, 36, 2, 2, 4.0000, 0.0000, 0.0000, 120.0000, 120.0000, 'fixed', 0.0000, 120.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(8, 36, 4, 4, 1.0000, 0.0000, 0.0000, 206.2500, 200.0000, 'fixed', 6.2500, 200.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(9, 36, 5, 5, 1.0000, 0.0000, 0.0000, 247.5000, 230.0000, 'fixed', 17.5000, 230.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(10, 37, 59, 59, 1.0000, 0.0000, 0.0000, 2475.0000, 2475.0000, 'fixed', 0.0000, 2475.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(11, 38, 3, 3, 5.0000, 0.0000, 0.0000, 40.0000, 40.0000, 'fixed', 0.0000, 40.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(12, 38, 28, 28, 7.0000, 0.0000, 0.0000, 750.0000, 750.0000, 'fixed', 0.0000, 750.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(13, 38, 5, 5, 2.0000, 0.0000, 0.0000, 230.0000, 230.0000, 'fixed', 0.0000, 230.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(14, 39, 31, 31, 2.0000, 0.0000, 0.0000, 930.0000, 930.0000, 'fixed', 0.0000, 930.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(15, 39, 10, 10, 1.0000, 0.0000, 0.0000, 620.0000, 620.0000, 'fixed', 0.0000, 620.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(16, 39, 27, 27, 1.0000, 0.0000, 0.0000, 1000.0000, 1000.0000, 'fixed', 0.0000, 1000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(17, 40, 59, 59, 1.0000, 0.0000, 0.0000, 2300.0000, 2300.0000, 'fixed', 0.0000, 2300.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(18, 41, 26, 26, 5.0000, 0.0000, 0.0000, 1260.0000, 1260.0000, 'fixed', 0.0000, 1260.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(19, 42, 57, 57, 6.0000, 0.0000, 0.0000, 180.0000, 180.0000, 'fixed', 0.0000, 180.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(20, 42, 56, 56, 2.0000, 0.0000, 0.0000, 95.0000, 95.0000, 'fixed', 0.0000, 95.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(21, 43, 26, 26, 2.0000, 0.0000, 0.0000, 1260.0000, 1260.0000, 'fixed', 0.0000, 1260.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:50:24', '2023-07-20 12:07:30'),
(22, 44, 36, 36, 1.0000, 0.0000, 0.0000, 1550.0000, 1550.0000, 'fixed', 0.0000, 1550.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(23, 45, 31, 31, 1.0000, 0.0000, 0.0000, 900.0000, 900.0000, 'fixed', 0.0000, 900.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(24, 46, 59, 59, 1.0000, 0.0000, 0.0000, 2300.0000, 2300.0000, 'fixed', 0.0000, 2300.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(25, 47, 59, 59, 1.0000, 0.0000, 0.0000, 2250.0000, 2250.0000, 'fixed', 0.0000, 2250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(26, 48, 58, 58, 6.0000, 0.0000, 0.0000, 140.0000, 140.0000, 'fixed', 0.0000, 140.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:10'),
(27, 48, 3, 3, 20.0000, 0.0000, 0.0000, 27.0000, 27.0000, 'fixed', 0.0000, 27.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:10'),
(28, 48, 23, 23, 10.0000, 0.0000, 0.0000, 65.0000, 65.0000, 'fixed', 0.0000, 65.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:10'),
(29, 48, 24, 24, 305.0000, 0.0000, 0.0000, 9.0200, 9.0200, 'fixed', 0.0000, 9.0200, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:10'),
(30, 48, 60, 60, 1000.0000, 0.0000, 0.0000, 13.1000, 13.1000, 'fixed', 0.0000, 13.1000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:11:29', '2023-07-20 10:16:10'),
(31, 49, 37, 37, 1.0000, 0.0000, 0.0000, 3000.0000, 3000.0000, 'fixed', 0.0000, 3000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(32, 50, 2, 2, 5.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(33, 51, 31, 31, 1.0000, 0.0000, 0.0000, 900.0000, 900.0000, 'fixed', 0.0000, 900.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(34, 52, 59, 59, 1.0000, 0.0000, 0.0000, 2490.0000, 2490.0000, 'fixed', 0.0000, 2490.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 11:23:00', '2023-07-20 11:23:00'),
(35, 53, 26, 26, 1.0000, 0.0000, 0.0000, 1500.0000, 1500.0000, 'fixed', 0.0000, 1500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(36, 54, 28, 28, 1.0000, 0.0000, 0.0000, 700.0000, 700.0000, 'fixed', 0.0000, 700.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(37, 54, 3, 3, 1.0000, 0.0000, 0.0000, 30.0000, 30.0000, 'fixed', 0.0000, 30.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(38, 54, 1, 1, 2.0000, 0.0000, 0.0000, 50.0000, 50.0000, 'fixed', 0.0000, 50.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(39, 54, 5, 5, 1.0000, 0.0000, 0.0000, 220.0000, 220.0000, 'fixed', 0.0000, 220.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(40, 54, 38, 38, 100.0000, 0.0000, 0.0000, 11.0000, 11.0000, 'fixed', 0.0000, 11.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(41, 55, 27, 27, 1.0000, 0.0000, 0.0000, 1050.0000, 1050.0000, 'fixed', 0.0000, 1050.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(42, 56, 22, 22, 5.0000, 0.0000, 0.0000, 120.0000, 120.0000, 'fixed', 0.0000, 120.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(43, 57, 31, 31, 1.0000, 0.0000, 0.0000, 900.0000, 900.0000, 'fixed', 0.0000, 900.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(44, 57, 4, 4, 1.0000, 0.0000, 0.0000, 190.0000, 190.0000, 'fixed', 0.0000, 190.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(45, 57, 6, 6, 1.0000, 0.0000, 0.0000, 220.0000, 220.0000, 'fixed', 0.0000, 220.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(46, 57, 3, 3, 1.0000, 0.0000, 0.0000, 30.0000, 30.0000, 'fixed', 0.0000, 30.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(47, 57, 38, 38, 200.0000, 0.0000, 0.0000, 11.0000, 11.0000, 'fixed', 0.0000, 11.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(48, 58, 35, 35, 1.0000, 0.0000, 0.0000, 1250.0000, 1250.0000, 'fixed', 0.0000, 1250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(49, 58, 24, 24, 610.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(50, 59, 26, 26, 2.0000, 0.0000, 0.0000, 1650.0000, 1650.0000, 'fixed', 0.0000, 1650.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:22:52', '2023-07-20 12:52:59'),
(51, 32, 59, 59, 1.0000, 0.0000, 0.0000, 2200.0000, 2200.0000, 'fixed', 0.0000, 2200.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 12:51:49', '2023-07-20 12:51:49'),
(52, 60, 28, 28, 1.0000, 0.0000, 0.0000, 700.0000, 700.0000, 'fixed', 0.0000, 700.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(53, 60, 1, 1, 2.0000, 0.0000, 0.0000, 50.0000, 50.0000, 'fixed', 0.0000, 50.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(54, 61, 29, 29, 1.0000, 0.0000, 0.0000, 700.0000, 700.0000, 'fixed', 0.0000, 700.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(55, 62, 36, 36, 1.0000, 0.0000, 0.0000, 1700.0000, 1700.0000, 'fixed', 0.0000, 1700.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(56, 63, 60, 60, 180.0000, 0.0000, 0.0000, 14.0000, 14.0000, 'fixed', 0.0000, 14.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(57, 64, 22, 22, 1.0000, 0.0000, 0.0000, 118.7500, 118.7500, 'fixed', 0.0000, 118.7500, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2023-07-22 05:48:57', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 68, 1.0000, 0.0000, '2023-07-18 12:05:37', '2023-07-18 12:05:37'),
(3, 3, NULL, 44, 1.0000, 0.0000, '2023-07-18 13:25:38', '2023-07-18 13:25:38'),
(4, 4, NULL, 5, 4.0000, 0.0000, '2023-07-19 10:14:32', '2023-07-19 10:14:32'),
(5, 5, NULL, 30, 2.0000, 0.0000, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(6, 6, NULL, 3, 5.0000, 0.0000, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(7, 7, NULL, 2, 4.0000, 0.0000, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(8, 8, NULL, 4, 1.0000, 0.0000, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(9, 9, NULL, 5, 1.0000, 0.0000, '2023-07-19 10:32:04', '2023-07-19 10:32:04'),
(10, 10, NULL, 68, 1.0000, 0.0000, '2023-07-19 10:36:46', '2023-07-19 10:36:46'),
(11, 11, NULL, 3, 5.0000, 0.0000, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(12, 12, NULL, 27, 7.0000, 0.0000, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(13, 13, NULL, 5, 2.0000, 0.0000, '2023-07-19 10:44:24', '2023-07-19 10:44:24'),
(14, 14, NULL, 30, 2.0000, 0.0000, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(15, 15, NULL, 10, 1.0000, 0.0000, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(16, 16, NULL, 26, 1.0000, 0.0000, '2023-07-19 11:41:56', '2023-07-19 11:41:56'),
(17, 17, NULL, 68, 1.0000, 0.0000, '2023-07-20 09:41:19', '2023-07-20 09:41:19'),
(18, 18, NULL, 25, 5.0000, 0.0000, '2023-07-20 09:44:22', '2023-07-20 09:44:22'),
(19, 19, NULL, 66, 6.0000, 0.0000, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(20, 20, NULL, 65, 2.0000, 0.0000, '2023-07-20 09:48:06', '2023-07-20 09:48:06'),
(21, 21, NULL, 25, 2.0000, 0.0000, '2023-07-20 09:50:24', '2023-07-20 09:50:24'),
(22, 22, NULL, 44, 1.0000, 0.0000, '2023-07-20 09:54:01', '2023-07-20 09:54:01'),
(23, 23, NULL, 30, 1.0000, 0.0000, '2023-07-20 09:55:57', '2023-07-20 09:55:57'),
(24, 24, NULL, 68, 1.0000, 0.0000, '2023-07-20 09:58:09', '2023-07-20 09:58:09'),
(25, 25, NULL, 68, 1.0000, 0.0000, '2023-07-20 10:02:27', '2023-07-20 10:02:27'),
(26, 26, NULL, 67, 6.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(27, 27, NULL, 3, 8.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(28, 27, NULL, 43, 12.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(29, 28, NULL, 22, 10.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(30, 29, NULL, 23, 305.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(31, 30, NULL, 70, 1000.0000, 0.0000, '2023-07-20 10:16:11', '2023-07-20 10:16:11'),
(32, 31, NULL, 45, 1.0000, 0.0000, '2023-07-20 10:22:19', '2023-07-20 10:22:19'),
(33, 32, NULL, 2, 5.0000, 0.0000, '2023-07-20 11:13:52', '2023-07-20 11:13:52'),
(34, 33, NULL, 30, 1.0000, 0.0000, '2023-07-20 11:15:52', '2023-07-20 11:15:52'),
(35, 34, NULL, 68, 1.0000, 0.0000, '2023-07-20 11:23:00', '2023-07-20 11:23:00'),
(36, 35, NULL, 25, 1.0000, 0.0000, '2023-07-20 11:56:49', '2023-07-20 11:56:49'),
(37, 36, NULL, 27, 1.0000, 0.0000, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(38, 37, NULL, 43, 1.0000, 0.0000, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(39, 38, NULL, 1, 2.0000, 0.0000, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(40, 39, NULL, 5, 1.0000, 0.0000, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(41, 40, NULL, 46, 100.0000, 0.0000, '2023-07-20 12:03:05', '2023-07-20 12:03:05'),
(42, 41, NULL, 26, 1.0000, 0.0000, '2023-07-20 12:04:49', '2023-07-20 12:04:49'),
(43, 42, NULL, 21, 5.0000, 0.0000, '2023-07-20 12:06:24', '2023-07-20 12:06:24'),
(44, 43, NULL, 30, 1.0000, 0.0000, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(45, 44, NULL, 4, 1.0000, 0.0000, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(46, 45, NULL, 6, 1.0000, 0.0000, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(47, 46, NULL, 43, 1.0000, 0.0000, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(48, 47, NULL, 46, 200.0000, 0.0000, '2023-07-20 12:13:13', '2023-07-20 12:13:13'),
(49, 48, NULL, 41, 1.0000, 0.0000, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(50, 49, NULL, 23, 610.0000, 0.0000, '2023-07-20 12:20:21', '2023-07-20 12:20:21'),
(51, 50, NULL, 25, 1.0000, 0.0000, '2023-07-20 12:22:52', '2023-07-20 12:22:52'),
(52, 51, NULL, 68, 1.0000, 0.0000, '2023-07-20 12:51:49', '2023-07-20 12:51:49'),
(53, 50, NULL, 25, 1.0000, 0.0000, '2023-07-20 12:52:59', '2023-07-20 12:52:59'),
(54, 52, NULL, 27, 1.0000, 0.0000, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(55, 53, NULL, 1, 2.0000, 0.0000, '2023-07-20 13:20:23', '2023-07-20 13:20:23'),
(56, 54, NULL, 28, 1.0000, 0.0000, '2023-07-20 13:24:52', '2023-07-20 13:24:52'),
(57, 55, NULL, 44, 1.0000, 0.0000, '2023-07-20 13:26:29', '2023-07-20 13:26:29'),
(58, 56, NULL, 70, 180.0000, 0.0000, '2023-07-20 13:28:18', '2023-07-20 13:28:18'),
(59, 57, NULL, 21, 1.0000, 0.0000, '2023-07-22 05:48:57', '2023-07-22 05:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 2, NULL, '2023-04-08 14:08:20', '2023-04-08 14:08:20'),
(3, 2, 'Metre', 'mt', 1, NULL, NULL, 2, NULL, '2023-07-10 11:46:10', '2023-07-10 11:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `available_at`, `paused_at`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'hasan', 'khan', 'sobuj', 'admin', 'admin@gmail.com', '$2y$10$RxHKMYFaEU5y30w/6InfruNcqXOceeuIAHs9iFSJNEpehDBMMY/WW', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 08:12:40', '2023-04-08 08:12:40'),
(2, 'user', 'Mr', 'Mominur', 'Rahman', 'superadmin', 'superadmin@gmail.com', '$2y$10$8QFFHtnW9XxbfsvmJm4UneD5Q8fiw5SHpDsF/a7K8MKo1elQ1lAWq', 'en', NULL, NULL, '0uhDUmUBBRjsjhCfo2ylDS2fF0OuvtYhJWsUbCq1gc4f25dP7lYcblpxPoxM', 2, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, 'male', 'married', 'A+', '01941799799', '01824464846', NULL, NULL, NULL, NULL, NULL, 'Somity market, bhaberchar bus stnad, Bangladesh', 'Somity market, bhaberchar bus stnad, Bangladesh', NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-04-08 14:08:20', '2023-07-10 12:31:42'),
(3, 'user', 'MR', 'BABUL', 'MIA', 'aaaaa', 'babulmia55@gmail.com', '$2y$10$xkH24fBdGHFukv08vmSQZ.hCGjvvRpUmEfdwmV60yeEMcJNNpOzaG', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2023-07-10 10:15:43', '2023-04-10 03:32:28', '2023-07-10 10:15:43'),
(4, 'user', 'MD', 'BABUL', 'MIA', 'subAdmin', 'babulmia55@gmail.com', '$2y$10$UPIqJ.pUrPwjjoAZ6kDCcOrn1NB9HJNFB3YLsO6EzOKddHn0mOx2C', 'en', NULL, NULL, 'vXfiDyRc3fd2US52JqkwqiNLJnUR204oDJ8QFV91AaVpbQkyT53pJlIxb0Wr', 2, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 1, '1981-11-21', 'male', 'married', 'B+', '01977758666', '01975993366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-07-13 12:34:28', '2023-07-18 13:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, 45.0000, 45.0000, 25.0000, 56.2500, 56.2500, '2023-07-15 09:56:25', '2023-07-15 10:38:21', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, 85.0000, 85.0000, 25.0000, 106.2500, 106.2500, '2023-07-15 10:34:33', '2023-07-15 10:34:33', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, 25.0000, 25.0000, 25.0000, 31.2500, 31.2500, '2023-07-15 10:36:18', '2023-07-15 10:36:18', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, 150.0000, 150.0000, 25.0000, 187.5000, 187.5000, '2023-07-15 10:53:31', '2023-07-15 11:25:38', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, 180.0000, 180.0000, 25.0000, 225.0000, 225.0000, '2023-07-15 11:19:11', '2023-07-15 11:26:21', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, 200.0000, 200.0000, 25.0000, 250.0000, 250.0000, '2023-07-15 11:24:55', '2023-07-15 11:24:55', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, 500.0000, 500.0000, 25.0000, 625.0000, 625.0000, '2023-07-15 11:30:28', '2023-07-15 11:30:28', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, 950.0000, 950.0000, 25.0000, 1187.5000, 1187.5000, '2023-07-15 11:35:11', '2023-07-15 11:36:23', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, 500.0000, 500.0000, 25.0000, 625.0000, 625.0000, '2023-07-15 11:46:36', '2023-07-16 12:12:32', NULL, '[]'),
(10, 'DUMMY', 10, '0010', 10, NULL, 500.0000, 500.0000, 25.0000, 625.0000, 625.0000, '2023-07-15 12:00:33', '2023-07-16 10:23:36', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, 560.0000, 560.0000, 25.0000, 700.0000, 700.0000, '2023-07-15 12:12:35', '2023-07-17 11:54:19', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, 2.5000, 2.5000, 25.2000, 3.1300, 3.1300, '2023-07-16 10:31:04', '2023-07-17 11:54:19', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, 550.0000, 550.0000, 25.0000, 687.5000, 687.5000, '2023-07-16 10:49:25', '2023-07-16 11:21:14', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, 300.0000, 300.0000, 25.0000, 375.0000, 375.0000, '2023-07-16 11:23:19', '2023-07-17 10:51:39', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, 3.2000, 3.2000, 212.5000, 10.0000, 10.0000, '2023-07-16 11:44:35', '2023-07-16 11:52:32', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, 28.0000, 28.0000, 25.0000, 35.0000, 35.0000, '2023-07-16 11:49:25', '2023-07-16 12:21:23', NULL, '[]'),
(18, 'DUMMY', 18, '0018', 18, NULL, 28.0000, 28.0000, 25.0000, 35.0000, 35.0000, '2023-07-16 12:14:26', '2023-07-16 12:22:00', NULL, '[]'),
(19, 'DUMMY', 19, '0019', 19, NULL, 28.0000, 28.0000, 25.0000, 35.0000, 35.0000, '2023-07-16 12:20:34', '2023-07-16 12:20:34', NULL, '[]'),
(20, 'DUMMY', 20, '0017', 20, NULL, 1300.0000, 1300.0000, 25.0000, 1625.0000, 1625.0000, '2023-07-16 12:34:12', '2023-07-16 12:35:38', NULL, '[]'),
(21, 'DUMMY', 21, '0021', 21, NULL, 1280.0000, 1280.0000, 25.0000, 1600.0000, 1600.0000, '2023-07-16 12:38:16', '2023-07-16 12:38:16', NULL, '[]'),
(22, 'DUMMY', 22, '0022', 22, NULL, 95.0000, 95.0000, 25.0000, 118.7500, 118.7500, '2023-07-16 12:44:23', '2023-07-16 12:44:23', NULL, '[]'),
(23, 'DUMMY', 23, '0023', 23, NULL, 65.0000, 65.0000, 25.0000, 81.2500, 81.2500, '2023-07-16 12:50:15', '2023-07-16 12:50:15', NULL, '[]'),
(24, 'DUMMY', 24, '0024', 24, NULL, 8.3700, 8.3700, 25.0000, 10.4600, 10.4600, '2023-07-17 09:36:46', '2023-07-17 09:36:46', NULL, '[]'),
(25, 'DUMMY', 25, '0025', 25, NULL, 1.0000, 1.0000, 25.0000, 1.2500, 1.2500, '2023-07-17 09:44:02', '2023-07-17 10:51:39', NULL, '[]'),
(26, 'DUMMY', 26, '0026', 26, NULL, 1220.0000, 1220.0000, 35.0000, 1647.0000, 1647.0000, '2023-07-17 09:56:36', '2023-07-18 12:44:48', NULL, '[]'),
(27, 'DUMMY', 27, '0027', 27, NULL, 880.0000, 880.0000, 30.0000, 1144.0000, 1144.0000, '2023-07-17 10:02:09', '2023-07-18 12:45:33', NULL, '[]'),
(28, 'DUMMY', 28, '0028', 28, NULL, 630.0000, 630.0000, 25.0000, 787.5000, 787.5000, '2023-07-17 10:05:13', '2023-07-17 10:07:37', NULL, '[]'),
(29, 'DUMMY', 29, '0029', 29, NULL, 630.0000, 630.0000, 25.0000, 787.5000, 787.5000, '2023-07-17 10:08:48', '2023-07-17 10:08:48', NULL, '[]'),
(30, 'DUMMY', 30, '0030', 30, NULL, 850.0000, 850.0000, 25.0000, 1062.5000, 1062.5000, '2023-07-17 10:10:17', '2023-07-17 10:10:17', NULL, '[]'),
(31, 'DUMMY', 31, '0031', 31, NULL, 800.0000, 800.0000, 25.0000, 1000.0000, 1000.0000, '2023-07-17 10:13:27', '2023-07-17 10:13:27', NULL, '[]'),
(32, 'DUMMY', 32, '0032', 32, NULL, 2600.0000, 2600.0000, 25.0000, 3250.0000, 3250.0000, '2023-07-17 10:46:55', '2023-07-18 09:54:03', NULL, '[]'),
(33, 'DUMMY', 33, '0033', 33, NULL, 3500.0000, 3500.0000, 25.0000, 4375.0000, 4375.0000, '2023-07-17 10:48:48', '2023-07-18 09:52:38', NULL, '[]'),
(34, 'DUMMY', 34, '0034', 34, NULL, 700.0000, 700.0000, 25.0000, 875.0000, 875.0000, '2023-07-17 10:50:45', '2023-07-18 09:58:23', NULL, '[]'),
(35, 'DUMMY', 35, '0035', 35, NULL, 1000.0000, 1000.0000, 25.0000, 1250.0000, 1250.0000, '2023-07-17 11:39:00', '2023-07-18 09:50:29', NULL, '[]'),
(36, 'DUMMY', 36, '0036', 36, NULL, 1450.0000, 1450.0000, 25.0000, 1812.5000, 1812.5000, '2023-07-17 11:44:53', '2023-07-18 10:23:14', NULL, '[]'),
(37, 'DUMMY', 37, '0037', 37, NULL, 2900.0000, 2900.0000, 20.0000, 3480.0000, 3480.0000, '2023-07-17 11:46:02', '2023-07-18 10:22:42', NULL, '[]'),
(38, 'DUMMY', 38, '0038', 38, NULL, 9.7000, 9.7000, 25.0000, 12.1300, 12.1300, '2023-07-17 11:48:25', '2023-07-18 09:55:25', NULL, '[]'),
(39, 'DUMMY', 39, '0039', 39, NULL, 45.9100, 45.9100, 25.0000, 57.3900, 57.3900, '2023-07-17 11:52:20', '2023-07-17 12:45:26', NULL, '[]'),
(40, 'DUMMY', 40, '0040', 40, NULL, 1260.0000, 1260.0000, 25.0000, 1575.0000, 1575.0000, '2023-07-17 12:01:11', '2023-07-18 06:01:06', NULL, '[]'),
(41, 'DUMMY', 41, '0041', 41, NULL, 1200.0000, 1200.0000, 25.0000, 1500.0000, 1500.0000, '2023-07-17 12:02:42', '2023-07-18 06:02:30', NULL, '[]'),
(42, 'DUMMY', 42, '0042', 42, NULL, 1800.0000, 1800.0000, 25.0000, 2250.0000, 2250.0000, '2023-07-17 12:05:31', '2023-07-18 09:47:50', NULL, '[]'),
(43, 'DUMMY', 43, '0043', 43, NULL, 1930.0000, 1930.0000, 25.0000, 2412.5000, 2412.5000, '2023-07-17 12:06:35', '2023-07-18 09:47:12', NULL, '[]'),
(44, 'DUMMY', 44, '0044', 44, NULL, 1800.0000, 1800.0000, 25.0000, 2250.0000, 2250.0000, '2023-07-17 12:08:41', '2023-07-18 09:45:32', NULL, '[]'),
(45, 'DUMMY', 45, '0045', 45, NULL, 1900.0000, 1900.0000, 25.0000, 2375.0000, 2375.0000, '2023-07-17 12:09:47', '2023-07-18 09:46:08', NULL, '[]'),
(46, 'DUMMY', 46, '0046', 46, NULL, 3030.0000, 3030.0000, 25.0000, 3787.5000, 3787.5000, '2023-07-17 12:18:27', '2023-07-18 09:49:23', NULL, '[]'),
(47, 'DUMMY', 47, '0047', 47, NULL, 3800.0000, 3800.0000, 25.0000, 4750.0000, 4750.0000, '2023-07-17 12:19:58', '2023-07-18 05:58:01', NULL, '[]'),
(48, 'DUMMY', 48, '0048', 48, NULL, 2750.0000, 2750.0000, 25.0000, 3437.5000, 3437.5000, '2023-07-17 12:21:20', '2023-07-18 09:56:50', NULL, '[]'),
(49, 'DUMMY', 49, '0049', 49, NULL, 1300.0000, 1300.0000, 25.0000, 1625.0000, 1625.0000, '2023-07-17 12:22:43', '2023-07-18 10:03:11', NULL, '[]'),
(50, 'DUMMY', 50, '0050', 50, NULL, 1100.0000, 1100.0000, 25.0000, 1375.0000, 1375.0000, '2023-07-17 12:23:33', '2023-07-18 10:04:30', NULL, '[]'),
(51, 'DUMMY', 51, '0051', 51, NULL, 2400.0000, 2400.0000, 25.0000, 3000.0000, 3000.0000, '2023-07-17 12:24:46', '2023-07-18 10:14:10', NULL, '[]'),
(52, 'DUMMY', 52, '0052', 52, NULL, 3450.0000, 3450.0000, 25.0000, 4312.5000, 4312.5000, '2023-07-17 12:25:28', '2023-07-18 10:15:22', NULL, '[]'),
(53, 'DUMMY', 53, '0053', 53, NULL, 4950.0000, 4950.0000, 25.0000, 6187.5000, 6187.5000, '2023-07-17 12:26:41', '2023-07-17 12:52:25', NULL, '[]'),
(54, 'DUMMY', 54, '0054', 54, NULL, 7700.0000, 7700.0000, 25.0000, 9625.0000, 9625.0000, '2023-07-17 12:27:39', '2023-07-17 12:52:59', NULL, '[]'),
(55, 'DUMMY', 55, '0055', 55, NULL, 980.0000, 980.0000, 25.0000, 1225.0000, 1225.0000, '2023-07-17 12:28:37', '2023-07-18 10:24:08', NULL, '[]'),
(56, 'DUMMY', 56, '0056', 56, NULL, 85.0000, 85.0000, 25.0000, 106.2500, 106.2500, '2023-07-17 12:30:40', '2023-07-18 10:05:28', NULL, '[]'),
(57, 'DUMMY', 57, '0057', 57, NULL, 170.0000, 170.0000, 25.0000, 212.5000, 212.5000, '2023-07-17 12:32:21', '2023-07-17 12:48:23', NULL, '[]'),
(58, 'DUMMY', 58, '0058', 58, NULL, 108.0000, 108.0000, 25.0000, 135.0000, 135.0000, '2023-07-17 12:33:36', '2023-07-17 12:49:01', NULL, '[]'),
(59, 'DUMMY', 59, '0059', 59, NULL, 1980.0000, 1980.0000, 25.0000, 2475.0000, 2475.0000, '2023-07-18 10:19:57', '2023-07-18 10:22:15', NULL, '[]'),
(60, 'DUMMY', 60, '0060', 60, NULL, 13.0000, 13.0000, 25.0000, 16.2500, 16.2500, '2023-07-18 10:41:27', '2023-07-18 10:45:53', NULL, '[]'),
(61, 'DUMMY', 61, '0061', 61, NULL, 736.0000, 736.0000, 25.0000, 920.0000, 920.0000, '2023-07-18 10:56:49', '2023-07-18 10:56:49', NULL, '[]'),
(62, 'DUMMY', 62, '123', 62, NULL, 23.0000, 23.0000, 25.0000, 28.7500, 28.7500, '2023-07-22 05:46:26', '2023-07-22 05:46:26', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 10.0000, '2023-07-15 10:02:24', '2023-07-20 13:20:23'),
(2, 2, 2, 2, 2, 45.0000, '2023-07-15 10:34:50', '2023-07-20 11:13:52'),
(3, 3, 3, 3, 2, 86.0000, '2023-07-15 10:37:39', '2023-07-20 12:13:13'),
(4, 4, 4, 4, 2, 4.0000, '2023-07-15 10:54:05', '2023-07-20 12:13:13'),
(5, 5, 5, 5, 2, 0.0000, '2023-07-15 11:19:39', '2023-07-20 12:03:05'),
(6, 6, 6, 6, 2, 12.0000, '2023-07-15 11:25:14', '2023-07-20 12:13:13'),
(7, 7, 7, 7, 2, 9.0000, '2023-07-15 11:30:44', '2023-07-15 11:30:44'),
(8, 8, 8, 8, 2, 2.0000, '2023-07-15 11:35:26', '2023-07-15 11:36:29'),
(9, 9, 9, 9, 2, 78.0000, '2023-07-15 11:55:10', '2023-07-15 11:55:10'),
(10, 10, 10, 10, 2, 13.0000, '2023-07-15 12:00:53', '2023-07-19 11:41:56'),
(11, 11, 11, 11, 2, 14.0000, '2023-07-15 12:12:50', '2023-07-17 11:54:19'),
(12, 12, 12, 12, 2, 2000.0000, '2023-07-16 10:31:16', '2023-07-17 11:54:19'),
(13, 13, 13, 13, 2, 3.0000, '2023-07-16 10:49:35', '2023-07-16 10:49:35'),
(14, 14, 14, 14, 2, 7.0000, '2023-07-16 11:23:34', '2023-07-17 11:54:19'),
(15, 15, 15, 15, 2, 200.0000, '2023-07-16 11:45:47', '2023-07-16 11:45:47'),
(16, 18, 18, 18, 2, 20.0000, '2023-07-16 12:14:46', '2023-07-16 12:14:46'),
(17, 16, 16, 16, 2, 20.0000, '2023-07-16 12:17:52', '2023-07-16 12:17:52'),
(18, 19, 19, 19, 2, 20.0000, '2023-07-16 12:20:49', '2023-07-16 12:20:49'),
(19, 20, 20, 20, 2, 2.0000, '2023-07-16 12:34:25', '2023-07-16 12:34:25'),
(20, 21, 21, 21, 2, 1.0000, '2023-07-16 12:38:28', '2023-07-16 12:38:28'),
(21, 22, 22, 22, 2, 104.0000, '2023-07-16 12:44:42', '2023-07-22 05:48:57'),
(22, 23, 23, 23, 2, 149.0000, '2023-07-16 12:50:31', '2023-07-20 10:16:11'),
(23, 24, 24, 24, 2, 610.0000, '2023-07-17 09:37:23', '2023-07-20 12:20:21'),
(24, 25, 25, 25, 2, 3000.0000, '2023-07-17 09:44:15', '2023-07-17 11:54:19'),
(25, 26, 26, 26, 2, 0.0000, '2023-07-17 10:30:00', '2023-07-20 12:52:59'),
(26, 27, 27, 27, 2, 8.0000, '2023-07-17 10:30:00', '2023-07-20 12:04:49'),
(27, 28, 28, 28, 2, 31.0000, '2023-07-17 10:30:00', '2023-07-20 13:20:23'),
(28, 29, 29, 29, 2, 9.0000, '2023-07-17 10:30:00', '2023-07-20 13:24:52'),
(29, 30, 30, 30, 2, 10.0000, '2023-07-17 10:30:00', '2023-07-17 10:30:00'),
(30, 31, 31, 31, 2, 13.0000, '2023-07-17 10:30:00', '2023-07-20 12:13:13'),
(31, 32, 32, 32, 2, 2.0000, '2023-07-17 10:51:39', '2023-07-17 11:54:19'),
(32, 33, 33, 33, 2, 2.0000, '2023-07-17 10:51:39', '2023-07-17 11:54:19'),
(33, 34, 34, 34, 2, 2.0000, '2023-07-17 10:51:39', '2023-07-17 11:54:19'),
(34, 35, 35, 35, 2, 1.0000, '2023-07-17 11:54:19', '2023-07-20 12:20:21'),
(35, 36, 36, 36, 2, 7.0000, '2023-07-17 11:54:19', '2023-07-20 13:26:29'),
(36, 37, 37, 37, 2, 4.0000, '2023-07-17 11:54:19', '2023-07-20 10:22:19'),
(37, 38, 38, 38, 2, 1700.0000, '2023-07-17 11:54:19', '2023-07-20 12:13:13'),
(38, 39, 39, 39, 2, 305.0000, '2023-07-17 11:54:19', '2023-07-17 11:54:19'),
(39, 40, 40, 40, 2, 4.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(40, 41, 41, 41, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(41, 42, 42, 42, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(42, 43, 43, 43, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(43, 44, 44, 44, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(44, 45, 45, 45, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(45, 46, 46, 46, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(46, 47, 47, 47, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(47, 48, 48, 48, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(48, 49, 49, 49, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(49, 50, 50, 50, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(50, 51, 51, 51, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(51, 52, 52, 52, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(52, 53, 53, 53, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(53, 54, 54, 54, 2, 1.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(54, 55, 55, 55, 2, 2.0000, '2023-07-17 12:39:55', '2023-07-17 12:39:55'),
(55, 56, 56, 56, 2, 33.0000, '2023-07-17 12:39:55', '2023-07-20 09:48:06'),
(56, 57, 57, 57, 2, 14.0000, '2023-07-17 12:39:55', '2023-07-20 09:48:06'),
(57, 58, 58, 58, 2, 24.0000, '2023-07-17 12:39:55', '2023-07-20 10:16:11'),
(58, 59, 59, 59, 2, 1.0000, '2023-07-18 10:27:10', '2023-07-20 12:51:49'),
(59, 61, 61, 61, 2, 25.0000, '2023-07-18 10:57:06', '2023-07-18 10:57:06'),
(60, 60, 60, 60, 2, 1820.0000, '2023-07-19 10:05:35', '2023-07-20 13:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_secondary_unit_id_index` (`secondary_unit_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `transactions_delivery_date_index` (`delivery_date`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `transaction_payments_payment_type_index` (`payment_type`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
