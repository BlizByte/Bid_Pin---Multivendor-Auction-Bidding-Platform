-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2023 at 05:01 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bid_pin_empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@example.com', 'admin', NULL, '6524141aa186f1696863258.png', '$2y$10$/bWmLchcFLuttKVZNXqstuyBvKU54uBt8y06EnyGbh9Wg1.UnEPlG', 'NQ0BWH6GzcUFvOfjV7gTKwWj0Qvy740c3cWljwtIzD6Rmkx3PGpCAaYtgUdJ', NULL, '2023-10-11 19:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `bidder_id` bigint(20) UNSIGNED NOT NULL,
  `product_creator_id` bigint(20) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `icon` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Live Chat(Tawk.to)', 'Key location is shown bellow', 'chat-png.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"55\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2023-03-22 06:04:56'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha2.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2022-05-08 04:01:36'),
(7, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'ganalytics.png', 0, NULL, '2019-10-18 23:16:05', '2023-09-14 05:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(2, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_22\":{\"name\":\"NID Number 22\",\"label\":\"nid_number_22\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"sadfg\":{\"name\":\"sadfg\",\"label\":\"sadfg\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"asdf\":{\"name\":\"asdf\",\"label\":\"asdf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test2\",\"Test3\"],\"type\":\"select\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test 2\",\"Test 3\"],\"type\":\"checkbox\"},\"nid_number_3333\":{\"name\":\"NID Number 3333\",\"label\":\"nid_number_3333\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"asdf\"],\"type\":\"radio\"},\"nid_number_3333587\":{\"name\":\"NID Number 3333587\",\"label\":\"nid_number_3333587\",\"is_required\":\"optional\",\"extensions\":\"jpg,bmp,png,pdf\",\"options\":[],\"type\":\"file\"}}', '2022-03-16 01:09:49', '2022-03-17 00:02:54'),
(3, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-16 04:32:29', '2022-03-16 04:35:32'),
(5, 'withdraw_method', '{\"nid_number_33\":{\"name\":\"NID Number 33\",\"label\":\"nid_number_33\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:45:35', '2022-03-17 00:53:17'),
(6, 'withdraw_method', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:47:04', '2022-03-17 00:47:04'),
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"},\"account_no\":{\"name\":\"Account No\",\"label\":\"account_no\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png,pdf,doc,docx\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2023-10-23 18:59:23'),
(8, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:53:25', '2022-03-21 07:53:25'),
(9, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:54:15', '2022-03-21 07:54:15'),
(10, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-21 07:55:15', '2022-03-21 07:55:22'),
(11, 'withdraw_method', '{\"nid_number_2658\":{\"name\":\"NID Number 2658\",\"label\":\"nid_number_2658\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"asdf\"],\"type\":\"checkbox\"}}', '2022-03-22 00:14:09', '2022-03-22 00:14:18'),
(12, 'withdraw_method', '[]', '2022-03-30 09:03:12', '2022-03-30 09:03:12'),
(13, 'withdraw_method', '{\"bank_name\":{\"name\":\"Bank Name\",\"label\":\"bank_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_name\":{\"name\":\"Account Name\",\"label\":\"account_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_number\":{\"name\":\"Account Number\",\"label\":\"account_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:09:11', '2022-09-28 04:05:20'),
(14, 'withdraw_method', '{\"mobile_number\":{\"name\":\"Mobile Number\",\"label\":\"mobile_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:10:12', '2022-09-29 09:55:20'),
(15, 'manual_deposit', '{\"send_from_number\":{\"name\":\"Send From Number\",\"label\":\"send_from_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:15:27', '2022-03-30 09:15:27'),
(16, 'manual_deposit', '{\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,pdf,docx\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:16:43', '2022-04-11 03:19:54'),
(17, 'manual_deposit', '[]', '2022-03-30 09:21:19', '2022-03-30 09:21:19'),
(18, 'manual_deposit', '{\"asdfasddf\":{\"name\":\"asdfasddf\",\"label\":\"asdfasddf\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-09-28 04:50:55', '2022-09-28 04:50:55'),
(19, 'manual_deposit', '{\"sadf\":{\"name\":\"sadf\",\"label\":\"sadf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"}}', '2022-09-28 05:13:04', '2022-09-28 05:13:59'),
(20, 'manual_deposit', '{\"transaction_id\":{\"name\":\"Transaction ID\",\"label\":\"transaction_id\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-05-27 02:50:43', '2023-05-27 02:50:43'),
(21, 'withdraw_method', '{\"name\":{\"name\":\"Name\",\"label\":\"name\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"email\":{\"name\":\"Email\",\"label\":\"email\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"account_no\":{\"name\":\"Account No\",\"label\":\"account_no\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-17 22:06:31', '2023-10-17 22:06:31'),
(22, 'manual_deposit', '{\"name\":{\"name\":\"Name\",\"label\":\"name\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"email\":{\"name\":\"Email\",\"label\":\"email\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"mobile\":{\"name\":\"Mobile\",\"label\":\"mobile\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-18 20:10:35', '2023-10-18 20:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"BiddPIn\",\"Time Auction\",\"Auction\",\"Bidding\",\"Online Bidding\",\"Competitive Bidding\",\"Real-time auctions\",\"Auction Marketplace\",\"Auction Website\"],\"description\":\"Experience the thrill of real-time bidding with BiddPin. Join our online auction platform for exciting timed auctions. Bid on a wide range of products and win amazing deals. Start bidding today!\",\"social_title\":\"Bid_Pin: Where Time Auction Bidding Gets Exciting!\",\"social_description\":\"Join us at BiddPin for thrilling timed auctions. Bid, compete, and win incredible deals on a variety of products. Your next winning bid is just a click away!\",\"image\":\"65254e1c689bc1696943644.png\"}', '2020-07-04 23:42:52', '2023-11-02 00:27:40'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Know About Us\",\"subheading\":\"Here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by inject humour, or randomised words which don\'t look even slight believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden  fugit dignissimos facilis suscipit voluptatibus error consectetur amet sed necessitatibus in dolor, ut non. Temporibus, maiores? Reprehenderit quae inventore obcaecati!\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=EQOarcurXfY\",\"about_image\":\"65279888876831697093768.png\"}', '2020-10-28 00:51:20', '2023-10-11 20:08:40'),
(25, 'blog.content', '{\"heading\":\"Our Latest Blog\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2020-10-28 00:51:34', '2023-10-11 04:58:46'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Mastering the Art of Winning: Tips for Successful Bidding\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<br \\/>\\u00a0<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<br \\/>\\u00a0<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<br \\/>\\u00a0<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e0f067a61698577935.png\"}', '2020-10-28 00:57:19', '2023-11-04 23:19:24'),
(27, 'contact_us.content', '{\"greeting\":\"Get connect to Us\",\"email\":\"biddpininfo@gmail.com\",\"address\":\"PO Box 16122 Collins Street West Victoria 8007 Australia\",\"contact_number\":\"9876897689698\",\"support_email\":\"support@bidpin.com\",\"latitude\":\"51.50318717588754\",\"longitude\":\"-0.11951699865425312\",\"website_footer\":\"<p>Copyright 2022. All rights reserved.<\\/p>\",\"website_descripton\":\"<p>Amet minim mollit non deseruullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit.<\\/p>\"}', '2020-10-28 00:59:19', '2023-10-30 02:43:58'),
(28, 'counter.content', '{\"heading\":\"Clients\",\"subheading\":\"Auctor gravida vestibulu\"}', '2020-10-28 01:04:02', '2022-09-28 14:02:14'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2023-10-11 05:32:18'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', '2021-03-06 01:27:34', '2022-03-30 08:07:06'),
(39, 'banner.content', '{\"heading\":\"Latest News\",\"subheading\":\"Lorem, Ipsum Dolor Sit Amet Consectetur Adipisicing Elit. Quod, Minus?\"}', '2021-05-02 06:09:30', '2023-03-21 08:44:46'),
(41, 'cookie.data', '{\"short_desc\":\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept\\\", you consent to our use of cookies.\",\"description\":\"<h4>What Are Cookies?<\\/h4><p>Cookies are small text files that are placed on your device when you visit a website. They help the site recognize your device and remember your preferences and actions over time.<\\/p><p>&nbsp;<\\/p><h4>Why We Use Cookies?<\\/h4><p>We use cookies for several purposes, including:<\\/p><ul><li><i><strong>Improving Website Functionality<\\/strong><\\/i><strong>:<\\/strong> Cookies help us enhance the functionality of our website, such as remembering your language preferences.<\\/li><li><i><strong>Analyzing Website Traffic<\\/strong><\\/i><strong>:<\\/strong> We use cookies to analyze how users interact with our site, helping us improve its performance and content.<\\/li><li><i><strong>Personalizing Your Experience<\\/strong><\\/i><strong>:<\\/strong> Cookies allow us to tailor your experience by remembering your login status and preferences.<\\/li><\\/ul><h4>Cookies We Use<\\/h4><p>Here are some examples of the specific cookies we may use:<\\/p><ul><li><i><strong>Essential Cookies<\\/strong><\\/i><strong>: <\\/strong>These cookies are necessary for the basic functionality of our website, such as session management and security.<\\/li><li><i><strong>Analytical Cookies<\\/strong><\\/i><strong>:<\\/strong> We use these cookies to collect data on user behavior and website performance, helping us make improvements.<\\/li><li><i><strong>Functional Cookies<\\/strong><\\/i><strong>:<\\/strong> These cookies enhance your experience by remembering your preferences, such as language settings.<\\/li><li><i><strong>Marketing Cookies<\\/strong><\\/i><strong>:<\\/strong> We may use marketing cookies to deliver targeted advertisements based on your interests.<\\/li><\\/ul><h4>Cookie Choices<\\/h4><p>You have the option to manage your cookie preferences. You can either accept all cookies, adjust your settings, or decline cookies, although this might affect certain aspects of the website\'s functionality. You have the option to manage your cookie preferences. You can either accept all cookies, adjust your settings, or decline cookies, although this might affect certain aspects of the website\'s functionality.<\\/p><p>&nbsp;<\\/p><h4>Contact Us<\\/h4><p>If you have any questions or concerns about our Cookie Usage Policy, please don\'t hesitate to contact us at BidPin. We may update our Cookie Usage Policy from time to time to reflect changes in the cookies we use or in response to regulatory requirements. When we make changes, we will update the \\\"Last updated\\\" date at the top of this page.<\\/p><p>&nbsp;<\\/p>\",\"status\":1}', '2020-07-04 23:42:52', '2023-11-03 23:20:08'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h3><strong>Data controller<\\/strong><\\/h3><p>nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus<\\/p><ul><li>Usage Information<\\/li><li>Social Media Information<\\/li><li>Survey Information<\\/li><li>Analytic Information<\\/li><li>Inference Data<\\/li><\\/ul><h3><strong>Data Security<\\/strong><\\/h3><p>Elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. Nullam sagittis. Suspendisse pulvinar, augue ac venenatis\\u00a0<\\/p><ul><li><strong>Usage Info<\\/strong>: commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit\\u00a0<\\/li><li><strong>Security<\\/strong>:<strong> <\\/strong>In enim justo,condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus<\\/li><li><strong>Purposes<\\/strong>: Tree planting is the act of planting young trees, shrubs, or other woody plants into the ground to establish new forests or enhance existing ones. It is a crucial component of environmental<\\/li><li><strong>Information<\\/strong>:<strong> <\\/strong>commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit\\u00a0<\\/li><\\/ul>\"}', '2021-06-09 08:50:42', '2023-11-03 22:48:11'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h3><strong>Data controller<\\/strong><\\/h3><p>nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus<\\/p><ul><li>Usage Information<\\/li><li>Social Media Information<\\/li><li>Survey Information<\\/li><li>Analytic Information<\\/li><li>Inference Data<\\/li><\\/ul><h3><strong>Data Security<\\/strong><\\/h3><p>Elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. Nullam sagittis. Suspendisse pulvinar, augue ac venenatis\\u00a0<\\/p><ul><li><strong>Usage Info<\\/strong>: commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit\\u00a0<\\/li><li><strong>Security<\\/strong>:<strong> <\\/strong>In enim justo,condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus<\\/li><li><strong>Purposes<\\/strong>: Tree planting is the act of planting young trees, shrubs, or other woody plants into the ground to establish new forests or enhance existing ones. It is a crucial component of environmental<\\/li><li><strong>Information<\\/strong>:<strong> <\\/strong>commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit\\u00a0<\\/li><\\/ul>\"}', '2021-06-09 08:51:18', '2023-11-03 22:48:22'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(51, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Behind the Gavel: Exploring the World of Online Auctions\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e26b89e81698577958.png\"}', '2023-03-21 08:45:08', '2023-11-04 23:12:13'),
(52, 'homeone.content', '{\"has_image\":\"1\",\"heading\":\"Multivendor Auction Bidding Platform\",\"subheading\":\"Revolutionizing Bidding Excellence - Where Every Precious Second Matters\",\"banner_image\":\"6526a9411912c1697032513.png\",\"right_shape_image\":\"652673cdc1d391697018829.png\",\"left_shape_image\":\"652673cdc4b8b1697018829.png\"}', '2023-10-11 04:07:09', '2023-10-11 02:55:13'),
(53, 'hometwo.content', '{\"has_image\":\"1\",\"heading\":\"Multivendor Auction Bidding Platform\",\"subheading\":\"Revolutionizing Bidding Excellence - Where Every Precious Second Matters\",\"banner_image\":\"6526a52a2be971697031466.png\"}', '2023-10-11 04:10:59', '2023-10-11 02:37:46'),
(54, 'homethree.content', '{\"has_image\":\"1\",\"heading\":\"Multivendor Auction Bidding Platform\",\"subheading\":\"Revolutionizing Bidding Excellence - Where Every Precious Second Matters\",\"left_top_image\":\"6526750b885841697019147.png\",\"right_top_image\":\"6526750b8c5781697019147.png\",\"left_bottom_image\":\"6526750b8e1261697019147.png\",\"right_bottom_image\":\"6526750b90c891697019147.png\"}', '2023-10-11 04:12:27', '2023-10-11 04:12:27'),
(55, 'category.content', '{\"heading\":\"Auction Categories\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:23:35', '2023-10-11 04:23:35'),
(56, 'liveauction.content', '{\"heading\":\"Live Auction\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:24:06', '2023-10-11 04:24:06'),
(57, 'howwork.content', '{\"heading\":\"How To Work\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:24:31', '2023-10-11 04:24:31'),
(60, 'howwork.element', '{\"count\":\"03\",\"heading\":\"Win Your Bid\",\"subheading\":\"It\\u2019s very easy to open an account and start your journey.\"}', '2023-10-11 04:27:35', '2023-10-11 04:27:35'),
(61, 'winner.content', '{\"heading\":\"Our Latest Winners\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:28:36', '2023-10-11 04:28:36'),
(62, 'upcoming.content', '{\"heading\":\"Upcoming Auctions\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:28:56', '2023-10-11 04:28:56'),
(63, 'testimonial.content', '{\"heading\":\"Love From Our Users\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\"}', '2023-10-11 04:29:17', '2023-10-11 04:29:17'),
(64, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Leslie Alexander\",\"designation\":\"Chief Financial Officer (CFO)\",\"review\":\"<p><i>Lorem Ipsum is very simply dummy text of the printing and typesetting industr Ipsum hasbeen<\\/i><\\/p>\",\"image\":\"6526794442ced1697020228.png\"}', '2023-10-11 04:30:28', '2023-10-28 20:08:37'),
(65, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Marvin McKinney\",\"designation\":\"Marketing Manager\",\"review\":\"<p><i>Lorem Ipsum is very simply dummy text of the printing and typesetting industr Ipsum hasbeen<\\/i><\\/p>\",\"image\":\"65267963cdef41697020259.png\"}', '2023-10-11 04:30:59', '2023-10-28 20:08:53'),
(66, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Courtney Henry\",\"designation\":\"Human Resources Director\",\"review\":\"<p><i>Lorem Ipsum is very simply dummy text of the printing and typesetting industr Ipsum hasbeen<\\/i><\\/p>\",\"image\":\"6526797e39c4d1697020286.png\"}', '2023-10-11 04:31:26', '2023-10-28 20:09:08'),
(67, 'faq.content', '{\"has_image\":\"1\",\"heading\":\"Frequently Asked Questions\",\"subheading\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industr Ipsum hasbeen the industry\'s\",\"image\":\"652679cc418871697020364.png\"}', '2023-10-11 04:32:44', '2023-10-11 04:32:44'),
(68, 'faq.element', '{\"question\":\"What can I use to build my website?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:34:52', '2023-10-11 04:53:31'),
(69, 'faq.element', '{\"question\":\"How long does it take to develop software?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:35:20', '2023-10-11 04:53:38'),
(70, 'faq.element', '{\"question\":\"How much does it cost to develop software?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:35:41', '2023-10-11 04:53:45'),
(71, 'faq.element', '{\"question\":\"What kind of industries do you work with?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:36:01', '2023-10-11 04:53:53'),
(72, 'faq.element', '{\"question\":\"What kind of product do you work with?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:37:02', '2023-10-11 04:53:59'),
(73, 'faq.element', '{\"question\":\"What kind of auctions do you work with?\",\"answer\":\"It is essential to actively manage and engage with them to build a positive brand reputation and maintain customer satisfaction.heets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem I\"}', '2023-10-11 04:37:22', '2023-10-11 04:54:06'),
(74, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Power of Timed Bidding: How to Gain the Upper Hand\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e514cd071698578001.png\"}', '2023-10-11 05:02:21', '2023-11-04 23:12:26'),
(75, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"From Bidder to Winner: Strategies for Auction Success\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e608aee21698578016.png\"}', '2023-10-11 05:02:43', '2023-11-04 23:13:05'),
(76, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Unlocking Hidden Treasures: The Thrill of Online Bidding\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e6ed26bd1698578030.png\"}', '2023-10-11 05:03:00', '2023-11-04 23:13:16'),
(77, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Auction Adventures: Stories of Remarkable Bidding Triumphs\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e7f87d941698578047.png\"}', '2023-10-11 05:03:24', '2023-11-04 23:13:23'),
(78, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Ultimate Guide to Navigating Auctions in the Digital Age\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e8c8a43e1698578060.png\"}', '2023-10-11 05:03:45', '2023-11-04 23:13:31'),
(79, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Bid with Confidence: Insider Tips for Novice Bidders\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3e9a803421698578074.png\"}', '2023-10-11 05:04:04', '2023-11-04 23:13:38'),
(80, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Countdown Begins: Making Every Second Count in Bidding\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3ea7aa54b1698578087.png\"}', '2023-10-11 05:04:24', '2023-11-04 23:13:45');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(81, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Bidding Wars Unleashed: Strategies for Outbidding the Competition\",\"description\":\"<h4>Choosing Your Destination<\\/h4><p>Planning a vacation can be an exciting yet overwhelming task. One of the first and most crucial steps is selecting the perfect destination. Consider these factors:<\\/p><ul><li><strong>Budget<\\/strong>: Determine how much you can afford to spend on your vacation.<\\/li><li><strong>Interests<\\/strong>: Consider your interests and hobbies. Are you a beach lover, a history enthusiast, or an adventure seeker?<\\/li><li><strong>Climate<\\/strong>: Research the weather conditions in your chosen destination during your travel dates.<\\/li><li><strong>Duration<\\/strong>: Decide how long you can stay at your destination and how many activities you can fit in.<\\/li><li><strong>Travel Companions<\\/strong>: Take into account the preferences and interests of your fellow travelers.<\\/li><\\/ul><h4>Accommodation and Transportation<\\/h4><p>Now that you\'ve settled your destination and logistics, it\'s time to create your itinerary. Once you\'ve chosen your destination, the next steps involve arranging your accommodation and transportation:<\\/p><ul><li><strong>Accommodation<\\/strong>: Look for hotels, vacation rentals, or hostels that fit your budget and offer the amenities you desire.<\\/li><li><strong>Transportation<\\/strong>: Decide on the most suitable mode of transportation, such as flying, driving, or taking a train or bus.<\\/li><li><strong>Booking Early<\\/strong>: It\'s usually more cost-effective to book accommodation and transportation in advance.<\\/li><li><strong>Must-See Attractions<\\/strong>: List the must-see attractions and activities in your destination.<\\/li><li><strong>Flexible Schedule<\\/strong>: Allow room for flexibility in your itinerary. Unexpected discoveries can make your trip more memorable.<\\/li><li><strong>Rest and Relaxation<\\/strong>: Don\'t over pack your schedule. Remember to include downtime for relaxation.<\\/li><li><strong>Local Cuisine<\\/strong>: Plan to try the local cuisine at least once or twice during your trip.<\\/li><\\/ul><h4>Packing Essentials<\\/h4><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway. Preparing the right items for your trip is essential for a hassle-free vacation:<\\/p><ul><li><strong>Travel Documents<\\/strong>: Ensure you have your passport, visa, ID, and any necessary travel documents.<\\/li><li><strong>Clothing<\\/strong>: Pack appropriate clothing for the destination\'s climate and any special activities you have planned.<\\/li><li><strong>Medications and First-Aid<\\/strong>: Bring any necessary medications and a basic first-aid kit.<\\/li><li><strong>Technology and Entertainment<\\/strong>: Don\'t forget your charger, travel adapters, and entertainment devices.<\\/li><\\/ul><p>Remember, successful vacation planning is all about thorough research, careful consideration, and flexibility. By following these steps and key points, you\'ll be well-prepared for an unforgettable and stress-free getaway.<\\/p>\",\"blog_image\":\"653e3ebd8583d1698578109.png\"}', '2023-10-11 05:04:44', '2023-11-04 23:13:52'),
(82, 'counter.element', '{\"counter_digit\":\"200000\",\"sub_title\":\"Satisfied Client\"}', '2023-10-11 05:05:58', '2023-10-11 05:25:10'),
(83, 'counter.element', '{\"counter_digit\":\"820000\",\"sub_title\":\"Total Bid\"}', '2023-10-11 05:06:13', '2023-10-11 05:06:13'),
(84, 'counter.element', '{\"counter_digit\":\"4000000\",\"sub_title\":\"Total Active Users\"}', '2023-10-11 05:06:32', '2023-10-11 05:06:32'),
(85, 'counter.element', '{\"counter_digit\":\"5000\",\"sub_title\":\"Total Review\"}', '2023-10-11 05:06:47', '2023-10-11 20:11:53'),
(86, 'social_icon.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/www.twitter.com\"}', '2023-10-11 05:29:01', '2023-10-11 05:32:37'),
(87, 'social_icon.element', '{\"title\":\"Linked\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', '2023-10-11 05:29:55', '2023-10-11 05:29:55'),
(88, 'social_icon.element', '{\"title\":\"Reddit\",\"social_icon\":\"<i class=\\\"fab fa-reddit\\\"><\\/i>\",\"url\":\"https:\\/\\/www.reddit.com\"}', '2023-10-11 05:31:12', '2023-10-11 05:31:12'),
(89, 'social_icon.element', '{\"title\":\"Pinterest\",\"social_icon\":\"<i class=\\\"fab fa-pinterest\\\"><\\/i>\",\"url\":\"https:\\/\\/www.pinterest.com\"}', '2023-10-11 05:31:45', '2023-10-11 05:31:45'),
(90, 'howwork.element', '{\"count\":\"02\",\"heading\":\"Make Bid Product\",\"subheading\":\"It\\u2019s very easy to open an account and start your journey.\"}', '2023-10-11 03:55:54', '2023-10-11 03:55:54'),
(91, 'howwork.element', '{\"count\":\"01\",\"heading\":\"Choose Products\",\"subheading\":\"It\\u2019s very easy to open an account and start your journey.\"}', '2023-10-11 03:56:24', '2023-10-11 03:56:24'),
(92, 'footer_company_links.element', '{\"title\":\"About Us\",\"url\":\"\\/about\"}', '2023-10-11 19:05:11', '2023-10-11 19:05:11'),
(93, 'footer_company_links.element', '{\"title\":\"Cookie Policy\",\"url\":\"\\/cookie\"}', '2023-10-11 19:05:29', '2023-10-11 19:05:29'),
(94, 'footer_important_links.element', '{\"title\":\"Products\",\"url\":\"\\/product\"}', '2023-10-11 19:05:57', '2023-10-11 19:05:57'),
(95, 'footer_important_links.element', '{\"title\":\"Blog\",\"url\":\"\\/blog\"}', '2023-10-11 19:06:07', '2023-10-11 19:06:07'),
(96, 'footer_important_links.element', '{\"title\":\"Contact\",\"url\":\"\\/contact\"}', '2023-10-11 19:06:19', '2023-10-11 19:06:19'),
(97, 'breadcumb.content', '{\"has_image\":\"1\",\"shape_image_light\":\"6527c21b7e5321697104411.png\",\"shape_image\":\"6527c21c080d41697104412.png\"}', '2023-10-11 22:53:31', '2023-10-11 22:53:32'),
(100, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"David Williams\",\"designation\":\"Product Manager\",\"review\":\"<p>Lorem Ipsum is very simply dummy text of the printing and typesetting industr Ipsum hasbeen<\\/p>\",\"image\":\"653e058332ee91698563459.png\"}', '2023-10-28 20:10:59', '2023-10-28 20:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-58ira22618401@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:03:45'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:01'),
(3, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"-----------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"example.com\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:10:37'),
(4, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2022-11-26 07:49:18'),
(5, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"-------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:14'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(8, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"---------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:00:15'),
(9, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:51'),
(10, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:48'),
(11, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"-----------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(12, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51M8Ks2CL65BWuH7eCBcWsLP2yPfWaLtfJVxG3zfii7cCWJE1izM4jkhucmBSm6izmVtSGZyp0JDYYCVmx9E4WmQY004gfnctzD\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51M8Ks2CL65BWuH7eju6khGxJMpeeFuw2Rwrjr8UYCz6ZnQ3PiFxb1gVu1i1dBto9MQrnjkBimHkFJgNcqsrJHTak0010kCY41h\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"abcd\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-18 08:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homesection` tinyint(1) NOT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialite_credentials` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `homesection`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `system_info`, `socialite_credentials`, `created_at`, `updated_at`) VALUES
(1, 'Bid_Pin', 1, 'USD', '$', 'notify@wstacks.com', '<p>Hi {{fullname}} ({{username}}),&nbsp;</p><p>{{message}}</p>', 'Hi {{fullname}} ({{username}}), \r\n{{message}}', 'Minstack', '009f78', 'f2ba17', '{\"name\":\"php\"}', '{\"name\":\"messageBird\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'default', '[]', '{\"google\":{\"client_id\":\"409421141076-jg96dp8t6takduj3b3j46it82t1l4tp7.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":1},\"facebook\":{\"client_id\":\"---------\",\"client_secret\":\"---------\",\"status\":0},\"linkedin\":{\"client_id\":\"772t1ej48e6ezg\",\"client_secret\":\"FbeN3gb6RI6eqisG\",\"status\":0}}', NULL, '2023-11-04 02:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `path` varchar(60) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2022-09-29 10:36:14'),
(16, 'French', 'fr', NULL, 0, 0, '2023-11-02 02:56:01', '2023-11-02 02:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-09-21 13:04:13'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'AUCTION_ENDED_OWNER_NOTIFICATION', 'Auction - Ended - Owner - Notification', 'Auction Ended - Winning Bid for Your Product', '<p>Dear {{auction_owner}},</p><p>&nbsp;</p><p>We are writing to inform you that the auction for your product has successfully concluded, and we have a winning bid to share with you.</p><p>&nbsp;</p><p>**Auction Details:**<br>- Product Name: <a href=\"{{link}}\">{{auction_product_name}}</a><br>- Winning Bid: {{site_currency}}{{winner_bid_price}}<br>- Winner: {{winner_name}}<br>- Auction Expiration Date: {{auction_concluded_date}}<br>- Total Bidders: {{total_bids}}</p><p><br>We hope that this successful auction brings you a satisfying outcome. Thank you for choosing our platform to list your product, and we wish you a smooth and pleasant transaction with the winning bidder.</p><p>Best regards,</p><p>&nbsp;</p><p>{{site_name}}<br>&nbsp;</p>', 'Dear {{auction_owner}},\r\n\r\n\r\n\r\nWe are writing to inform you that the auction for your product has successfully concluded, and we have a winning bid to share with you.\r\n\r\n\r\n\r\n**Auction Details:**\r\n- Product Name: {{auction_product_name}}\r\n- Winning Bid: {{site_currency}}{{winner_bid_price}}\r\n- Winner: {{winner_name}}\r\n- Auction Expiration Date: {{auction_concluded_date}}\r\n- Total Bidders: {{total_bids}}\r\n\r\n\r\nWe hope that this successful auction brings you a satisfying outcome. Thank you for choosing our platform to list your product, and we wish you a smooth and pleasant transaction with the winning bidder.\r\n\r\nBest regards,\r\n\r\n\r\n\r\n{{site_name}}', '{\"auction_owner\":\"Auction owner name\",\"auction_product_name\":\"Auction product name\",\"winner_bid_price\":\"Winner\'s bidding price\",\"winner_name\":\"Auction winner name\",\"auction_concluded_date\":\"Auction Concluded Date\",\"total_bids\":\"Number of bidder in this auction\",\"link\":\"Link of the auction product\"}', 1, 1, '2023-10-24 13:41:03', '2023-10-24 03:03:43'),
(17, 'AUCTION_WINNER_NOTIFICATION', 'Auction - Winner - Notification', 'Congratulations! You\'re the Winner of the Auction', '<p>Dear {{winner_name}},</p><p>&nbsp;</p><p>We are thrilled to inform you that you are the successful winner of our recent auction! Your determination and winning bid set you apart from the competition.</p><p>&nbsp;</p><p>**Auction Details:**<br>- Item: <a href=\"{{link}}\">{{auction_product_name}}</a><br>- Winning Bid: {{currency_symbol}} {{winner_bid_price}}<br>- Auction Expiration Date: {{auction_concluded_date}}<br>- Total Bidders: {{total_bids}}</p><p><br>We want to congratulate you once again on your successful bid and express our appreciation for your participation. We hope you enjoy your new item!</p><p>&nbsp;</p><p>&nbsp;</p><p>Best regards,</p><p>&nbsp;</p><p>{{site_name}}</p>', 'Dear {{winner_name}},\r\n\r\nWe are thrilled to inform you that you are the successful winner of our recent auction! Your determination and winning bid set you apart from the competition.\r\n\r\n**Auction Details:**\r\n- Item: {{auction_product_name}}\r\n- Winning Bid: {{currency_symbol}} {{winner_bid_price}}\r\n- Auction Expiration Date: {{auction_concluded_date}}\r\n- Total Bidders: {{total_bids}}\r\n\r\n\r\nWe want to congratulate you once again on your successful bid and express our appreciation for your participation. We hope you enjoy your new item!\r\n\r\nBest regards,\r\n\r\n{{site_name}}', '{\"auction_product_name\":\"Auction product name\",\"winner_bid_price\":\"Winner\'s bidding price\",\"winner_name\":\"Auction winner name\",\"auction_concluded_date\":\"Auction Concluded Date\",\"total_bids\":\"Number of bidder in this auction\",\"link\":\"Link of the auction product\"}', 1, 1, '2023-10-24 14:04:20', '2023-10-24 03:13:03'),
(18, 'NON_WINNER_AUCTION_NOTIFICATION', 'Non - Winner - Auction - Notification', 'Auction Update - Your Recent Bid', '<p>Dear {{participant_name}},</p><p>&nbsp;</p><p>We wanted to update you on the recent auction for <a href=\"{{link}}\">{{auction_product_name}}</a>. While your participation and bid were greatly appreciated, we regret to inform you that you were not the successful winner of the auction.</p><p>**Auction Details:**<br>- Item: <a href=\"{{link}}\">{{auction_product_name}}</a><br>- Winning Bid: {{site_currency}}{{winner_bid_price}}<br>- Winner: {{winner_name}}<br>- Auction Expiration Date: {{auction_concluded_date}}<br>- Total Bidders: {{total_bids}}</p><p>&nbsp;</p><p>We understand that not winning can be disappointing, but please know that your participation is important to us. There will be more opportunities in the future, and we encourage you to keep an eye out for upcoming auctions and events.</p><p>&nbsp;</p><p>Thank you for your involvement, and we look forward to having you participate in future auctions.</p><p>Best regards,</p><p>&nbsp;</p><p>{{site_name}}</p>', 'Dear {{participant_name}},\r\n\r\n\r\n\r\nWe wanted to update you on the recent auction for {{auction_product_name}}. While your participation and bid were greatly appreciated, we regret to inform you that you were not the successful winner of the auction.\r\n\r\n**Auction Details:**\r\n- Item: {{auction_product_name}}\r\n- Winning Bid: {{site_currency}}{{winner_bid_price}}\r\n- Winner: {{winner_name}}\r\n- Auction Expiration Date: {{auction_concluded_date}}\r\n- Total Bidders: {{total_bids}}\r\n\r\n\r\n\r\nWe understand that not winning can be disappointing, but please know that your participation is important to us. There will be more opportunities in the future, and we encourage you to keep an eye out for upcoming auctions and events.\r\n\r\n\r\n\r\nThank you for your involvement, and we look forward to having you participate in future auctions.\r\n\r\nBest regards,\r\n\r\n\r\n\r\n{{site_name}}', '{\"auction_product_name\":\"Auction product name\",\"winner_bid_price\":\"Winner\'s bidding price\",\"participant_name\":\"Auction participant name\",\"auction_concluded_date\":\"Auction Concluded Date\",\"total_bids\":\"Number of bidder in this auction\",\"link\":\"Link of the auction product\",\"winner_name\":\"Auction winner name\"}', 1, 1, '2023-10-24 14:19:11', '2023-10-24 03:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'presets.default.', '[\"category\",\"liveauction\",\"howwork\",\"winner\",\"upcoming\",\"testimonial\",\"faq\",\"blog\",\"counter\"]', 1, '2020-07-11 06:23:58', '2023-11-03 23:48:17'),
(2, 'About', 'about', 'presets.default.', '[\"about\",\"howwork\",\"faq\",\"testimonial\",\"counter\"]', 1, '2023-10-11 18:42:23', '2023-10-27 19:53:45'),
(3, 'Browse', 'auctions', 'presets.default.', NULL, 1, '2023-10-11 18:42:39', '2023-10-11 18:42:39'),
(4, 'Blog', 'blog', 'presets.default.', NULL, 1, '2023-10-11 18:42:47', '2023-10-11 18:42:47'),
(5, 'Contact', 'contact', 'presets.default.', NULL, 1, '2023-10-11 18:42:58', '2023-10-11 18:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `price` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `bid_complete` tinyint(1) NOT NULL COMMENT '1 => Yes, 0 => No',
  `bid_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `started_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `specification` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => pending, 1 => approved, 2 => expired, 3 => cancel, 4 => delivered\r\n',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified	',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avg_review` decimal(3,2) NOT NULL DEFAULT 0.00,
  `review_count` int(14) NOT NULL DEFAULT 0,
  `myself` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `winners`
--

CREATE TABLE `winners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_owner_id` bigint(20) NOT NULL DEFAULT 0,
  `bid_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 => delivered, 0 => Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `winners`
--
ALTER TABLE `winners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `winners`
--
ALTER TABLE `winners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
