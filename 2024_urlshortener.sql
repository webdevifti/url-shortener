-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 11:52 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2024_urlshortener`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_02_01_070735_create_url_shorteners_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_shorteners`
--

CREATE TABLE `url_shorteners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `long_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicks` bigint(20) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url_shorteners`
--

INSERT INTO `url_shorteners` (`id`, `user_id`, `long_url`, `short_url`, `short_params`, `clicks`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/cmmv3tit', 'cmmv3tit', 2, 0, '2024-02-01 02:59:20', '2024-02-01 02:59:49'),
(2, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/j8b8dfqs', 'j8b8dfqs', 1, 1, '2024-02-01 03:01:06', '2024-02-01 03:01:08'),
(3, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/dzmlnrv9', 'dzmlnrv9', 1, 1, '2024-02-01 03:03:03', '2024-02-01 03:03:07'),
(4, 1, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/as7vadtz', 'as7vadtz', 1, 1, '2024-02-01 03:07:33', '2024-02-01 03:07:40'),
(5, 1, 'http://localhost/phpmyadmin/index.php?route=/sql&db=2024_urlshortener&table=url_shorteners&pos=0', 'http://127.0.0.1:8000/l/8i06bhg2', '8i06bhg2', 0, 1, '2024-02-01 03:08:30', '2024-02-01 03:08:30'),
(6, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/fkq3e6ik', 'fkq3e6ik', 0, 1, '2024-02-01 03:22:32', '2024-02-01 03:22:32'),
(7, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/tl2hssqb', 'tl2hssqb', 0, 1, '2024-02-01 03:23:39', '2024-02-01 03:23:39'),
(8, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/2q3if72c', '2q3if72c', 1, 1, '2024-02-01 03:26:05', '2024-02-01 03:26:12'),
(9, 1, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/uk3puf32', 'uk3puf32', 1, 1, '2024-02-01 03:32:52', '2024-02-01 03:32:58'),
(10, 1, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/neu36tmo', 'neu36tmo', 0, 1, '2024-02-01 04:00:50', '2024-02-01 04:00:50'),
(11, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/aha9lu1i', 'aha9lu1i', 0, 1, '2024-02-01 04:17:56', '2024-02-01 04:17:56'),
(12, NULL, 'https://getbootstrap.com/docs/5.0/getting-started/introduction/', 'http://127.0.0.1:8000/l/aq0mlsv4', 'aq0mlsv4', 0, 1, '2024-02-01 04:28:51', '2024-02-01 04:28:51'),
(13, NULL, 'http://localhost/phpmyadmin/index.php?route=/sql&db=2024_urlshortener&table=url_shorteners&pos=0', 'http://127.0.0.1:8000/l/uuf11884', 'uuf11884', 0, 1, '2024-02-01 04:31:01', '2024-02-01 04:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Eftekhar Alam', 'webdevifti@gmail.com', NULL, '$2y$12$VhztWIfSbzE5jW7wLDy14OEf.e9yZOVqFj/9UJJ05wKzihVbXzjpK', '4jdMBLiD5dqK99CGl2FksIBIgPIdphEzlhOKDl2UIJOepjbK3xx9WAMTfy3T', '2024-02-01 00:46:09', '2024-02-01 00:46:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `url_shorteners`
--
ALTER TABLE `url_shorteners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url_shorteners_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `url_shorteners`
--
ALTER TABLE `url_shorteners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `url_shorteners`
--
ALTER TABLE `url_shorteners`
  ADD CONSTRAINT `url_shorteners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
