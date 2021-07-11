-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 09 2021 г., 15:36
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mgmgroup`
--

-- --------------------------------------------------------

--
-- Структура таблицы `about_data`
--

CREATE TABLE `about_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `about_data`
--

INSERT INTO `about_data` (`id`, `title`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Biz kimik?', 'Digər Müəssisələr, Müəssisələr və Strukturların işini asanlaşdıracaq Həllər təklif edirik', NULL, '2021-07-09 04:40:19', '2021-07-09 04:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `brends`
--

CREATE TABLE `brends` (
  `id` int(10) UNSIGNED NOT NULL,
  `brend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brends`
--

INSERT INTO `brends` (`id`, `brend`, `created_at`, `updated_at`, `order`) VALUES
(1, 'Milesight', '2021-07-09 08:59:32', '2021-07-09 08:59:32', NULL),
(2, 'IDIS', '2021-07-09 08:59:40', '2021-07-09 08:59:40', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-07-09 02:35:29', '2021-07-09 02:35:29');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'menu', 'text', 'Menu', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'widget', 'text', 'Widget', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(60, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 8, 'slug_belongsto_widget_relationship', 'relationship', 'widget', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Widget\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"widget\",\"key\":\"widget\",\"label\":\"widget\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(62, 8, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"menu\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:slugs,slug\"}}', 6),
(63, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 9, 'widget', 'text', 'Widget', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(66, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(67, 8, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 7),
(68, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 10, 'category', 'text', 'Category', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 10, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"category\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:product_categories,slug\"}}', 3),
(71, 10, 'parent_id', 'text', 'Parent Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(72, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 5),
(73, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(74, 10, 'product_category_belongsto_product_category_relationship', 'relationship', 'product_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"category\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(75, 10, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 7),
(83, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(84, 12, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 12, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(86, 12, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 12, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 5),
(88, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 6),
(89, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(90, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(91, 13, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(92, 13, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(93, 13, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 4),
(94, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 5),
(95, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(96, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
(97, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 14, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(99, 14, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(100, 14, 'icon', 'image', 'Icon', 0, 1, 1, 1, 1, 1, '{\"allowed\":[]}', 4),
(101, 14, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(102, 14, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 6),
(103, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 7),
(104, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(105, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(106, 15, 'video', 'file', 'Video', 0, 1, 1, 1, 1, 1, '{}', 2),
(107, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 3),
(108, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(109, 15, 'featured', 'checkbox', 'Featured', 0, 1, 1, 1, 1, 1, '{}', 5),
(110, 15, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(111, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(112, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(113, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 3),
(114, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(115, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(116, 17, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(117, 17, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(118, 17, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(119, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 5),
(120, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(121, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 8),
(122, 10, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 9),
(123, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(124, 18, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(125, 18, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(126, 18, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(127, 18, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(128, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 6),
(129, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(130, 18, 'product_slide_belongsto_product_category_relationship', 'relationship', 'product_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"category\",\"pivot_table\":\"about_data\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(131, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 19, 'brend', 'text', 'Brend', 0, 1, 1, 1, 1, 1, '{}', 2),
(133, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(134, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(135, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 20, 'format', 'text', 'Format', 0, 1, 1, 1, 1, 1, '{}', 2),
(137, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 3),
(138, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(139, 19, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 5),
(140, 20, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 1, '{}', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(7, 'widget', 'widget', 'Widget', 'Widgets', NULL, 'App\\Models\\Widget', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(8, 'slugs', 'slugs', 'Slug', 'Slugs', NULL, 'App\\Models\\Slug', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"menu\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 02:43:19', '2021-07-09 03:10:05'),
(9, 'widgets', 'widgets', 'Widget', 'Widgets', NULL, 'App\\Models\\Widget', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(10, 'product_categories', 'product-categories', 'Product Category', 'Product Categories', NULL, 'App\\Models\\ProductCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"category\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 03:17:44', '2021-07-09 07:28:08'),
(12, 'slides', 'slides', 'Slide', 'Slides', NULL, 'App\\Models\\Slide', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 04:04:28', '2021-07-09 04:15:25'),
(13, 'about_data', 'about-data', 'About Datum', 'About Data', NULL, 'App\\Models\\AboutDatum', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 04:38:09', '2021-07-09 04:39:08'),
(14, 'services', 'services', 'Service', 'Services', NULL, 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 04:55:41', '2021-07-09 06:16:28'),
(15, 'video_galleries', 'video-galleries', 'Video Gallery', 'Video Galleries', NULL, 'App\\Models\\VideoGallery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 06:23:46', '2021-07-09 06:37:43'),
(16, 'partners', 'partners', 'Partner', 'Partners', NULL, 'App\\Models\\Partner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(17, 'home_data', 'home-data', 'Home Datum', 'Home Data', NULL, 'App\\Models\\HomeDatum', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(18, 'product_slides', 'product-slides', 'Product Slide', 'Product Slides', NULL, 'App\\Models\\ProductSlide', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 07:29:37', '2021-07-09 08:42:13'),
(19, 'brends', 'brends', 'Brend', 'Brends', NULL, 'App\\Models\\Brend', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"brend\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 08:55:49', '2021-07-09 08:57:58'),
(20, 'formats', 'formats', 'Format', 'Formats', NULL, 'App\\Models\\Format', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"format\",\"order_display_column\":\"format\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-09 08:56:21', '2021-07-09 08:57:47');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `formats`
--

CREATE TABLE `formats` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `formats`
--

INSERT INTO `formats` (`id`, `format`, `created_at`, `updated_at`, `order`) VALUES
(1, '1080p', '2021-07-09 09:03:22', '2021-07-09 09:03:22', NULL),
(2, '4k', '2021-07-09 09:03:27', '2021-07-09 09:03:27', NULL),
(3, '4K-2160p', '2021-07-09 09:03:42', '2021-07-09 09:03:42', NULL),
(4, '4K-UHD', '2021-07-09 09:03:50', '2021-07-09 09:03:50', NULL),
(5, '720P', '2021-07-09 09:03:58', '2021-07-09 09:03:58', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `home_data`
--

CREATE TABLE `home_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `home_data`
--

INSERT INTO `home_data` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'məhsullarımızı tanıyaq', 'məhsullarımızı tanıyaq', 'home-data\\July2021\\cXe3Zmxl5bwwEdjArBQO.png', '2021-07-09 06:57:01', '2021-07-09 06:57:01');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-07-09 02:35:28', '2021-07-09 02:35:28');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-07-09 02:35:28', '2021-07-09 02:35:28', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-07-09 02:35:28', '2021-07-09 02:35:28', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-07-09 02:35:29', '2021-07-09 02:35:29', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-07-09 02:35:29', '2021-07-09 02:35:29', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-07-09 02:35:29', '2021-07-09 02:35:29', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-07-09 02:35:29', '2021-07-09 02:35:29', 'voyager.hooks', NULL),
(16, 1, 'Slugs', '', '_self', NULL, NULL, NULL, 16, '2021-07-09 02:43:19', '2021-07-09 02:43:19', 'voyager.slugs.index', NULL),
(17, 1, 'Widgets', '', '_self', NULL, NULL, NULL, 17, '2021-07-09 02:56:15', '2021-07-09 02:56:15', 'voyager.widgets.index', NULL),
(18, 1, 'Product Categories', '', '_self', NULL, NULL, NULL, 18, '2021-07-09 03:17:44', '2021-07-09 03:17:44', 'voyager.product-categories.index', NULL),
(20, 1, 'Slides', '', '_self', NULL, NULL, NULL, 19, '2021-07-09 04:04:28', '2021-07-09 04:04:28', 'voyager.slides.index', NULL),
(21, 1, 'About Data', '', '_self', NULL, NULL, NULL, 20, '2021-07-09 04:38:09', '2021-07-09 04:38:09', 'voyager.about-data.index', NULL),
(22, 1, 'Services', '', '_self', NULL, NULL, NULL, 21, '2021-07-09 04:55:41', '2021-07-09 04:55:41', 'voyager.services.index', NULL),
(23, 1, 'Video Galleries', '', '_self', NULL, NULL, NULL, 22, '2021-07-09 06:23:46', '2021-07-09 06:23:46', 'voyager.video-galleries.index', NULL),
(24, 1, 'Partners', '', '_self', NULL, NULL, NULL, 23, '2021-07-09 06:44:32', '2021-07-09 06:44:32', 'voyager.partners.index', NULL),
(25, 1, 'Home Data', '', '_self', NULL, NULL, NULL, 24, '2021-07-09 06:50:00', '2021-07-09 06:50:00', 'voyager.home-data.index', NULL),
(26, 1, 'Product Slides', '', '_self', NULL, NULL, NULL, 25, '2021-07-09 07:29:38', '2021-07-09 07:29:38', 'voyager.product-slides.index', NULL),
(27, 1, 'Brends', '', '_self', NULL, NULL, NULL, 26, '2021-07-09 08:55:49', '2021-07-09 08:55:49', 'voyager.brends.index', NULL),
(28, 1, 'Formats', '', '_self', NULL, NULL, NULL, 27, '2021-07-09 08:56:22', '2021-07-09 08:56:22', 'voyager.formats.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-07-09 02:35:29', '2021-07-09 02:35:29');

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'partners\\July2021\\2pXITVVxQBYD29Z1Fvsy.png', '2021-07-09 06:44:57', '2021-07-09 06:44:57');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(2, 'browse_bread', NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(3, 'browse_database', NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(4, 'browse_media', NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(5, 'browse_compass', NULL, '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(6, 'browse_menus', 'menus', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(7, 'read_menus', 'menus', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(8, 'edit_menus', 'menus', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(9, 'add_menus', 'menus', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(10, 'delete_menus', 'menus', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(11, 'browse_roles', 'roles', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(12, 'read_roles', 'roles', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(13, 'edit_roles', 'roles', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(14, 'add_roles', 'roles', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(15, 'delete_roles', 'roles', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(16, 'browse_users', 'users', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(17, 'read_users', 'users', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(18, 'edit_users', 'users', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(19, 'add_users', 'users', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(20, 'delete_users', 'users', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(21, 'browse_settings', 'settings', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(22, 'read_settings', 'settings', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(23, 'edit_settings', 'settings', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(24, 'add_settings', 'settings', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(25, 'delete_settings', 'settings', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(26, 'browse_categories', 'categories', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(27, 'read_categories', 'categories', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(28, 'edit_categories', 'categories', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(29, 'add_categories', 'categories', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(30, 'delete_categories', 'categories', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(31, 'browse_posts', 'posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(32, 'read_posts', 'posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(33, 'edit_posts', 'posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(34, 'add_posts', 'posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(35, 'delete_posts', 'posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(36, 'browse_pages', 'pages', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(37, 'read_pages', 'pages', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(38, 'edit_pages', 'pages', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(39, 'add_pages', 'pages', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(40, 'delete_pages', 'pages', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(41, 'browse_hooks', NULL, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(42, 'browse_widget', 'widget', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(43, 'read_widget', 'widget', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(44, 'edit_widget', 'widget', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(45, 'add_widget', 'widget', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(46, 'delete_widget', 'widget', '2021-07-09 02:43:03', '2021-07-09 02:43:03'),
(47, 'browse_slugs', 'slugs', '2021-07-09 02:43:19', '2021-07-09 02:43:19'),
(48, 'read_slugs', 'slugs', '2021-07-09 02:43:19', '2021-07-09 02:43:19'),
(49, 'edit_slugs', 'slugs', '2021-07-09 02:43:19', '2021-07-09 02:43:19'),
(50, 'add_slugs', 'slugs', '2021-07-09 02:43:19', '2021-07-09 02:43:19'),
(51, 'delete_slugs', 'slugs', '2021-07-09 02:43:19', '2021-07-09 02:43:19'),
(52, 'browse_widgets', 'widgets', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(53, 'read_widgets', 'widgets', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(54, 'edit_widgets', 'widgets', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(55, 'add_widgets', 'widgets', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(56, 'delete_widgets', 'widgets', '2021-07-09 02:56:15', '2021-07-09 02:56:15'),
(57, 'browse_product_categories', 'product_categories', '2021-07-09 03:17:44', '2021-07-09 03:17:44'),
(58, 'read_product_categories', 'product_categories', '2021-07-09 03:17:44', '2021-07-09 03:17:44'),
(59, 'edit_product_categories', 'product_categories', '2021-07-09 03:17:44', '2021-07-09 03:17:44'),
(60, 'add_product_categories', 'product_categories', '2021-07-09 03:17:44', '2021-07-09 03:17:44'),
(61, 'delete_product_categories', 'product_categories', '2021-07-09 03:17:44', '2021-07-09 03:17:44'),
(67, 'browse_slides', 'slides', '2021-07-09 04:04:28', '2021-07-09 04:04:28'),
(68, 'read_slides', 'slides', '2021-07-09 04:04:28', '2021-07-09 04:04:28'),
(69, 'edit_slides', 'slides', '2021-07-09 04:04:28', '2021-07-09 04:04:28'),
(70, 'add_slides', 'slides', '2021-07-09 04:04:28', '2021-07-09 04:04:28'),
(71, 'delete_slides', 'slides', '2021-07-09 04:04:28', '2021-07-09 04:04:28'),
(72, 'browse_about_data', 'about_data', '2021-07-09 04:38:09', '2021-07-09 04:38:09'),
(73, 'read_about_data', 'about_data', '2021-07-09 04:38:09', '2021-07-09 04:38:09'),
(74, 'edit_about_data', 'about_data', '2021-07-09 04:38:09', '2021-07-09 04:38:09'),
(75, 'add_about_data', 'about_data', '2021-07-09 04:38:09', '2021-07-09 04:38:09'),
(76, 'delete_about_data', 'about_data', '2021-07-09 04:38:09', '2021-07-09 04:38:09'),
(77, 'browse_services', 'services', '2021-07-09 04:55:41', '2021-07-09 04:55:41'),
(78, 'read_services', 'services', '2021-07-09 04:55:41', '2021-07-09 04:55:41'),
(79, 'edit_services', 'services', '2021-07-09 04:55:41', '2021-07-09 04:55:41'),
(80, 'add_services', 'services', '2021-07-09 04:55:41', '2021-07-09 04:55:41'),
(81, 'delete_services', 'services', '2021-07-09 04:55:41', '2021-07-09 04:55:41'),
(82, 'browse_video_galleries', 'video_galleries', '2021-07-09 06:23:46', '2021-07-09 06:23:46'),
(83, 'read_video_galleries', 'video_galleries', '2021-07-09 06:23:46', '2021-07-09 06:23:46'),
(84, 'edit_video_galleries', 'video_galleries', '2021-07-09 06:23:46', '2021-07-09 06:23:46'),
(85, 'add_video_galleries', 'video_galleries', '2021-07-09 06:23:46', '2021-07-09 06:23:46'),
(86, 'delete_video_galleries', 'video_galleries', '2021-07-09 06:23:46', '2021-07-09 06:23:46'),
(87, 'browse_partners', 'partners', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(88, 'read_partners', 'partners', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(89, 'edit_partners', 'partners', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(90, 'add_partners', 'partners', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(91, 'delete_partners', 'partners', '2021-07-09 06:44:32', '2021-07-09 06:44:32'),
(92, 'browse_home_data', 'home_data', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(93, 'read_home_data', 'home_data', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(94, 'edit_home_data', 'home_data', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(95, 'add_home_data', 'home_data', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(96, 'delete_home_data', 'home_data', '2021-07-09 06:50:00', '2021-07-09 06:50:00'),
(97, 'browse_product_slides', 'product_slides', '2021-07-09 07:29:38', '2021-07-09 07:29:38'),
(98, 'read_product_slides', 'product_slides', '2021-07-09 07:29:38', '2021-07-09 07:29:38'),
(99, 'edit_product_slides', 'product_slides', '2021-07-09 07:29:38', '2021-07-09 07:29:38'),
(100, 'add_product_slides', 'product_slides', '2021-07-09 07:29:38', '2021-07-09 07:29:38'),
(101, 'delete_product_slides', 'product_slides', '2021-07-09 07:29:38', '2021-07-09 07:29:38'),
(102, 'browse_brends', 'brends', '2021-07-09 08:55:49', '2021-07-09 08:55:49'),
(103, 'read_brends', 'brends', '2021-07-09 08:55:49', '2021-07-09 08:55:49'),
(104, 'edit_brends', 'brends', '2021-07-09 08:55:49', '2021-07-09 08:55:49'),
(105, 'add_brends', 'brends', '2021-07-09 08:55:49', '2021-07-09 08:55:49'),
(106, 'delete_brends', 'brends', '2021-07-09 08:55:49', '2021-07-09 08:55:49'),
(107, 'browse_formats', 'formats', '2021-07-09 08:56:22', '2021-07-09 08:56:22'),
(108, 'read_formats', 'formats', '2021-07-09 08:56:22', '2021-07-09 08:56:22'),
(109, 'edit_formats', 'formats', '2021-07-09 08:56:22', '2021-07-09 08:56:22'),
(110, 'add_formats', 'formats', '2021-07-09 08:56:22', '2021-07-09 08:56:22'),
(111, 'delete_formats', 'formats', '2021-07-09 08:56:22', '2021-07-09 08:56:22');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-07-09 02:35:29', '2021-07-09 02:35:29');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matris` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lens` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videos` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brend_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_categories`
--

INSERT INTO `product_categories` (`id`, `category`, `slug`, `parent_id`, `created_at`, `updated_at`, `order`, `image`, `description`) VALUES
(1, 'Şəbəkə kameraları', 's-b-k-kameralari', NULL, '2021-07-09 03:23:16', '2021-07-09 07:28:21', NULL, 'product-categories\\July2021\\1J7BgRkPGTUGH3QQ7Gtc.png', 'Şəbəkə kameralarıŞəbəkə kameralarıŞəbəkə kameralarıŞəbəkə kameralarıŞəbəkə kameralarıŞəbəkə kameraları');

-- --------------------------------------------------------

--
-- Структура таблицы `product_slides`
--

CREATE TABLE `product_slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_slides`
--

INSERT INTO `product_slides` (`id`, `title`, `description`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'KATALOQ', 'Məqsəd - real vaxt rejimində video nəzarət, qeydiyyat və hadisə qeyd edilməsi, siqnal hadisələrinin göstərilməsi və bildirilməsi', 'product-slides\\July2021\\qLfS3HHSGvj9HWYbPbuU.png', NULL, '2021-07-09 07:36:20', '2021-07-09 08:42:27'),
(2, 'Video nəzarət sistemləri (CCTV və IPTV)', 'Məqsəd - real vaxtda video nəzarət, hadisələrin qeydiyyatı və qeydiyyatı, həyəcan təbili hadisələrinin göstərilməsi və bildirilməsi', 'product-slides\\July2021\\xgX6WgVn5MILru8Hqpqh.png', 1, '2021-07-09 08:46:19', '2021-07-09 08:46:19');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-07-09 02:35:28', '2021-07-09 02:35:28'),
(2, 'user', 'Normal User', '2021-07-09 02:35:28', '2021-07-09 02:35:28');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `icon`, `image`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Quraşdırma', 'Fərdi şəxslərdən və kiçik müəssisələrdən tutmuş dövlət qurumlarına və böyük şirkətlərə qədər geniş müştərilərlə işləyirik.', 'services\\July2021\\v0vzi7HfrCu7PMoZ2Ip8.png', 'services\\July2021\\ION1R6VZRZJWk8jc97XU.png', NULL, '2021-07-09 06:18:46', '2021-07-09 06:18:46');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.read_more_en', 'read_more_en', 'More details', NULL, 'text', 6, 'Site'),
(12, 'site.read_more_az', 'read_more_az', 'Daha ətraflı', NULL, 'text', 7, 'Site'),
(13, 'site.read_more_ru', 'read_more_ru', 'Подробнее', NULL, 'text', 8, 'Site'),
(14, 'site.about_us_en', 'about_us_en', 'About us', NULL, 'text', 9, 'Site'),
(15, 'site.about_us_az', 'about_us_az', 'Bizim haqqımızda', NULL, 'text', 10, 'Site'),
(16, 'site.about_us_ru', 'about_us_ru', 'О Нас', NULL, 'text', 11, 'Site');

-- --------------------------------------------------------

--
-- Структура таблицы `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `slides`
--

INSERT INTO `slides` (`id`, `title`, `description`, `image`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Eviniz yaxşı əllərdədir', 'Digər Müəssisələr, Müəssisələr və Strukturların işini asanlaşdıracaq Həllər təklif edirik', 'slides\\July2021\\Ms4wv7IyhI1Qm1LNbDAs.png', NULL, '2021-07-09 04:11:38', '2021-07-09 04:17:23');

-- --------------------------------------------------------

--
-- Структура таблицы `slugs`
--

CREATE TABLE `slugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `slugs`
--

INSERT INTO `slugs` (`id`, `menu`, `widget`, `created_at`, `updated_at`, `slug`, `order`) VALUES
(1, 'Ana Səhifə', 'index', '2021-07-09 02:58:00', '2021-07-09 03:47:20', 'ana-sehife', NULL),
(2, 'Məhsullar', 'product', '2021-07-09 03:00:47', '2021-07-09 03:00:47', 'mehsullar', NULL),
(3, 'Şirkət', 'company', '2021-07-09 03:01:50', '2021-07-09 03:01:50', 'sirket', NULL),
(4, 'Servis', 'services', '2021-07-09 03:02:36', '2021-07-09 03:02:36', 'servis', NULL),
(5, 'Əlaqə', 'contact', '2021-07-09 03:03:27', '2021-07-09 03:03:27', 'elaqe', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-07-09 02:35:29', '2021-07-09 02:35:29'),
(31, 'slugs', 'menu', 1, 'en', 'Home', '2021-07-09 02:58:07', '2021-07-09 02:58:07'),
(32, 'slugs', 'menu', 1, 'ru', 'Главная страница', '2021-07-09 02:58:07', '2021-07-09 02:58:07'),
(33, 'slugs', 'slug', 1, 'en', 'en', '2021-07-09 02:58:07', '2021-07-09 03:47:20'),
(34, 'slugs', 'slug', 1, 'ru', 'ru', '2021-07-09 02:58:07', '2021-07-09 03:47:20'),
(35, 'data_rows', 'display_name', 56, 'en', 'Id', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(36, 'data_rows', 'display_name', 57, 'en', 'Menu', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(37, 'data_rows', 'display_name', 58, 'en', 'Widget', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(38, 'data_rows', 'display_name', 59, 'en', 'Created At', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(39, 'data_rows', 'display_name', 60, 'en', 'Updated At', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(40, 'data_rows', 'display_name', 62, 'en', 'Slug', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(41, 'data_rows', 'display_name', 61, 'en', 'widget', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(42, 'data_types', 'display_name_singular', 8, 'en', 'Slug', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(43, 'data_types', 'display_name_plural', 8, 'en', 'Slugs', '2021-07-09 02:59:46', '2021-07-09 02:59:46'),
(44, 'slugs', 'menu', 2, 'en', 'Products', '2021-07-09 03:00:47', '2021-07-09 03:00:47'),
(45, 'slugs', 'menu', 2, 'ru', 'Продукты                         ', '2021-07-09 03:00:47', '2021-07-09 03:00:47'),
(46, 'slugs', 'slug', 2, 'en', 'products', '2021-07-09 03:00:47', '2021-07-09 03:00:47'),
(47, 'slugs', 'slug', 2, 'ru', 'produkty', '2021-07-09 03:00:47', '2021-07-09 03:00:47'),
(48, 'slugs', 'menu', 3, 'en', 'Company', '2021-07-09 03:01:50', '2021-07-09 03:01:50'),
(49, 'slugs', 'menu', 3, 'ru', 'О компании ', '2021-07-09 03:01:50', '2021-07-09 03:01:50'),
(50, 'slugs', 'slug', 3, 'en', 'company', '2021-07-09 03:01:50', '2021-07-09 03:01:50'),
(51, 'slugs', 'slug', 3, 'ru', 'o-kompanii', '2021-07-09 03:01:50', '2021-07-09 03:01:50'),
(52, 'slugs', 'menu', 4, 'en', 'Services', '2021-07-09 03:02:36', '2021-07-09 03:02:36'),
(53, 'slugs', 'menu', 4, 'ru', 'сервис и Услуги', '2021-07-09 03:02:36', '2021-07-09 03:02:36'),
(54, 'slugs', 'slug', 4, 'en', 'services', '2021-07-09 03:02:36', '2021-07-09 03:02:36'),
(55, 'slugs', 'slug', 4, 'ru', 'servis-i-uslugi', '2021-07-09 03:02:36', '2021-07-09 03:02:36'),
(56, 'slugs', 'menu', 5, 'en', 'Contact', '2021-07-09 03:03:27', '2021-07-09 03:03:27'),
(57, 'slugs', 'menu', 5, 'ru', 'Контакты', '2021-07-09 03:03:27', '2021-07-09 03:03:27'),
(58, 'slugs', 'slug', 5, 'en', 'contact', '2021-07-09 03:03:27', '2021-07-09 03:03:27'),
(59, 'slugs', 'slug', 5, 'ru', 'kontakty', '2021-07-09 03:03:27', '2021-07-09 03:03:27'),
(60, 'data_rows', 'display_name', 56, 'ru', 'Id', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(61, 'data_rows', 'display_name', 57, 'ru', 'Menu', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(62, 'data_rows', 'display_name', 58, 'ru', 'Widget', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(63, 'data_rows', 'display_name', 59, 'ru', 'Created At', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(64, 'data_rows', 'display_name', 60, 'ru', 'Updated At', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(65, 'data_rows', 'display_name', 62, 'ru', 'Slug', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(66, 'data_rows', 'display_name', 67, 'en', 'Order', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(67, 'data_rows', 'display_name', 61, 'ru', 'widget', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(68, 'data_types', 'display_name_singular', 8, 'ru', 'Slug', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(69, 'data_types', 'display_name_plural', 8, 'ru', 'Slugs', '2021-07-09 03:10:05', '2021-07-09 03:10:05'),
(70, 'data_rows', 'display_name', 68, 'en', 'Id', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(71, 'data_rows', 'display_name', 69, 'en', 'Category', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(72, 'data_rows', 'display_name', 70, 'en', 'Slug', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(73, 'data_rows', 'display_name', 71, 'en', 'Parent Id', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(74, 'data_rows', 'display_name', 72, 'en', 'Created At', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(75, 'data_rows', 'display_name', 73, 'en', 'Updated At', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(76, 'data_types', 'display_name_singular', 10, 'en', 'Product Category', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(77, 'data_types', 'display_name_plural', 10, 'en', 'Product Categories', '2021-07-09 03:18:38', '2021-07-09 03:18:38'),
(78, 'data_rows', 'display_name', 68, 'ru', 'Id', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(79, 'data_rows', 'display_name', 69, 'ru', 'Category', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(80, 'data_rows', 'display_name', 70, 'ru', 'Slug', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(81, 'data_rows', 'display_name', 71, 'ru', 'Parent Id', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(82, 'data_rows', 'display_name', 72, 'ru', 'Created At', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(83, 'data_rows', 'display_name', 73, 'ru', 'Updated At', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(84, 'data_rows', 'display_name', 74, 'en', 'product_categories', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(85, 'data_types', 'display_name_singular', 10, 'ru', 'Product Category', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(86, 'data_types', 'display_name_plural', 10, 'ru', 'Product Categories', '2021-07-09 03:19:12', '2021-07-09 03:19:12'),
(87, 'data_rows', 'display_name', 74, 'ru', 'product_categories', '2021-07-09 03:19:46', '2021-07-09 03:19:46'),
(88, 'data_rows', 'display_name', 75, 'en', 'Order', '2021-07-09 03:20:10', '2021-07-09 03:20:10'),
(89, 'product_categories', 'category', 1, 'en', 'Network cameras', '2021-07-09 03:23:16', '2021-07-09 03:23:16'),
(90, 'product_categories', 'category', 1, 'ru', 'Сетевые камеры', '2021-07-09 03:23:16', '2021-07-09 03:23:16'),
(91, 'product_categories', 'slug', 1, 'en', 'network-cameras', '2021-07-09 03:23:16', '2021-07-09 03:23:16'),
(92, 'product_categories', 'slug', 1, 'ru', 'setevye-kamery', '2021-07-09 03:23:16', '2021-07-09 03:23:16'),
(93, 'data_rows', 'display_name', 76, 'en', 'Id', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(94, 'data_rows', 'display_name', 77, 'en', 'Title', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(95, 'data_rows', 'display_name', 78, 'en', 'Description', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(96, 'data_rows', 'display_name', 79, 'en', 'Image', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(97, 'data_rows', 'display_name', 80, 'en', 'Created At', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(98, 'data_rows', 'display_name', 81, 'en', 'Updated At', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(99, 'data_rows', 'display_name', 82, 'en', 'Order', '2021-07-09 04:00:36', '2021-07-09 04:00:36'),
(102, 'data_rows', 'display_name', 83, 'en', 'Id', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(103, 'data_rows', 'display_name', 84, 'en', 'Title', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(104, 'data_rows', 'display_name', 85, 'en', 'Description', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(105, 'data_rows', 'display_name', 86, 'en', 'Image', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(106, 'data_rows', 'display_name', 87, 'en', 'Order', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(107, 'data_rows', 'display_name', 88, 'en', 'Created At', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(108, 'data_rows', 'display_name', 89, 'en', 'Updated At', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(109, 'data_types', 'display_name_singular', 12, 'en', 'Slide', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(110, 'data_types', 'display_name_plural', 12, 'en', 'Slides', '2021-07-09 04:06:12', '2021-07-09 04:06:12'),
(111, 'data_rows', 'display_name', 83, 'ru', 'Id', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(112, 'data_rows', 'display_name', 84, 'ru', 'Title', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(113, 'data_rows', 'display_name', 85, 'ru', 'Description', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(114, 'data_rows', 'display_name', 86, 'ru', 'Image', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(115, 'data_rows', 'display_name', 87, 'ru', 'Order', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(116, 'data_rows', 'display_name', 88, 'ru', 'Created At', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(117, 'data_rows', 'display_name', 89, 'ru', 'Updated At', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(118, 'data_types', 'display_name_singular', 12, 'ru', 'Slide', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(119, 'data_types', 'display_name_plural', 12, 'ru', 'Slides', '2021-07-09 04:14:47', '2021-07-09 04:14:47'),
(120, 'slides', 'title', 1, 'en', 'Your home is in good hands', '2021-07-09 04:16:41', '2021-07-09 04:16:41'),
(121, 'slides', 'title', 1, 'ru', 'Ваш дом в надёжных руках                            ', '2021-07-09 04:16:41', '2021-07-09 04:16:41'),
(122, 'slides', 'description', 1, 'en', 'We offer Solutions that will simplify the work of other Enterprises, Institutions and Structures', '2021-07-09 04:16:41', '2021-07-09 04:16:41'),
(123, 'slides', 'description', 1, 'ru', 'Мы предлагаем Решения которые упростят работу других Предприятий , Учреждений  и Структур\n                            ', '2021-07-09 04:16:41', '2021-07-09 04:16:41'),
(124, 'data_rows', 'display_name', 90, 'en', 'Id', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(125, 'data_rows', 'display_name', 91, 'en', 'Title', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(126, 'data_rows', 'display_name', 92, 'en', 'Description', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(127, 'data_rows', 'display_name', 93, 'en', 'Order', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(128, 'data_rows', 'display_name', 94, 'en', 'Created At', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(129, 'data_rows', 'display_name', 95, 'en', 'Updated At', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(130, 'data_types', 'display_name_singular', 13, 'en', 'About Datum', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(131, 'data_types', 'display_name_plural', 13, 'en', 'About Data', '2021-07-09 04:39:08', '2021-07-09 04:39:08'),
(132, 'about_data', 'title', 1, 'en', 'Who are we?', '2021-07-09 04:40:19', '2021-07-09 04:40:19'),
(133, 'about_data', 'title', 1, 'ru', 'Кто мы?', '2021-07-09 04:40:19', '2021-07-09 04:40:19'),
(134, 'about_data', 'description', 1, 'en', 'We offer Solutions that will simplify the work of other Enterprises, Institutions and Structures', '2021-07-09 04:40:19', '2021-07-09 04:40:19'),
(135, 'about_data', 'description', 1, 'ru', 'Мы предлагаем Решения которые упростят работу других Предприятий , Учреждений и Структур', '2021-07-09 04:40:19', '2021-07-09 04:40:19'),
(136, 'data_rows', 'display_name', 97, 'en', 'Id', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(137, 'data_rows', 'display_name', 98, 'en', 'Title', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(138, 'data_rows', 'display_name', 99, 'en', 'Description', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(139, 'data_rows', 'display_name', 100, 'en', 'Icon', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(140, 'data_rows', 'display_name', 101, 'en', 'Image', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(141, 'data_rows', 'display_name', 102, 'en', 'Order', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(142, 'data_rows', 'display_name', 103, 'en', 'Created At', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(143, 'data_rows', 'display_name', 104, 'en', 'Updated At', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(144, 'data_types', 'display_name_singular', 14, 'en', 'Service', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(145, 'data_types', 'display_name_plural', 14, 'en', 'Services', '2021-07-09 06:06:21', '2021-07-09 06:06:21'),
(146, 'data_rows', 'display_name', 97, 'ru', 'Id', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(147, 'data_rows', 'display_name', 98, 'ru', 'Title', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(148, 'data_rows', 'display_name', 99, 'ru', 'Description', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(149, 'data_rows', 'display_name', 100, 'ru', 'Icon', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(150, 'data_rows', 'display_name', 101, 'ru', 'Image', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(151, 'data_rows', 'display_name', 102, 'ru', 'Order', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(152, 'data_rows', 'display_name', 103, 'ru', 'Created At', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(153, 'data_rows', 'display_name', 104, 'ru', 'Updated At', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(154, 'data_types', 'display_name_singular', 14, 'ru', 'Service', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(155, 'data_types', 'display_name_plural', 14, 'ru', 'Services', '2021-07-09 06:08:57', '2021-07-09 06:08:57'),
(156, 'services', 'title', 1, 'en', 'Installation', '2021-07-09 06:18:46', '2021-07-09 06:18:46'),
(157, 'services', 'title', 1, 'ru', 'Установка', '2021-07-09 06:18:46', '2021-07-09 06:18:46'),
(158, 'services', 'description', 1, 'en', 'We work with a wide range of clients - from individuals and small businesses to government agencies and large corporations.', '2021-07-09 06:18:46', '2021-07-09 06:18:46'),
(159, 'services', 'description', 1, 'ru', 'Мы работаем с широким кругом клиентов - от физических лиц и малых предприятий до государственны учреждений и крупных корпораций. ', '2021-07-09 06:18:46', '2021-07-09 06:18:46'),
(160, 'data_rows', 'display_name', 105, 'en', 'Id', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(161, 'data_rows', 'display_name', 106, 'en', 'Video', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(162, 'data_rows', 'display_name', 107, 'en', 'Created At', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(163, 'data_rows', 'display_name', 108, 'en', 'Updated At', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(164, 'data_types', 'display_name_singular', 15, 'en', 'Video Gallery', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(165, 'data_types', 'display_name_plural', 15, 'en', 'Video Galleries', '2021-07-09 06:34:09', '2021-07-09 06:34:09'),
(166, 'data_rows', 'display_name', 105, 'ru', 'Id', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(167, 'data_rows', 'display_name', 106, 'ru', 'Video', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(168, 'data_rows', 'display_name', 107, 'ru', 'Created At', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(169, 'data_rows', 'display_name', 108, 'ru', 'Updated At', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(170, 'data_rows', 'display_name', 109, 'en', 'Featured', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(171, 'data_types', 'display_name_singular', 15, 'ru', 'Video Gallery', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(172, 'data_types', 'display_name_plural', 15, 'ru', 'Video Galleries', '2021-07-09 06:37:43', '2021-07-09 06:37:43'),
(173, 'home_data', 'title', 1, 'en', 'get to know our products', '2021-07-09 06:57:01', '2021-07-09 06:57:01'),
(174, 'home_data', 'title', 1, 'ru', 'познакомьтесь с нашими товарами', '2021-07-09 06:57:01', '2021-07-09 06:57:01'),
(175, 'home_data', 'description', 1, 'en', 'get to know our products', '2021-07-09 06:57:01', '2021-07-09 06:57:01'),
(176, 'home_data', 'description', 1, 'ru', 'познакомьтесь с нашими товарами', '2021-07-09 06:57:01', '2021-07-09 06:57:01'),
(177, 'data_rows', 'display_name', 75, 'ru', 'Order', '2021-07-09 07:03:08', '2021-07-09 07:03:08'),
(178, 'data_rows', 'display_name', 121, 'en', 'Image', '2021-07-09 07:28:08', '2021-07-09 07:28:08'),
(179, 'product_categories', 'description', 1, 'en', 'Network camerasNetwork camerasNetwork cameras', '2021-07-09 07:29:16', '2021-07-09 07:29:16'),
(180, 'product_categories', 'description', 1, 'ru', 'Сетевые камерыСетевые камерыСетевые камеры', '2021-07-09 07:29:16', '2021-07-09 07:29:16'),
(181, 'data_rows', 'display_name', 123, 'en', 'Id', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(182, 'data_rows', 'display_name', 124, 'en', 'Title', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(183, 'data_rows', 'display_name', 125, 'en', 'Description', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(184, 'data_rows', 'display_name', 126, 'en', 'Image', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(185, 'data_rows', 'display_name', 127, 'en', 'Category Id', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(186, 'data_rows', 'display_name', 128, 'en', 'Created At', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(187, 'data_rows', 'display_name', 129, 'en', 'Updated At', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(188, 'data_rows', 'display_name', 130, 'en', 'product_categories', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(189, 'data_types', 'display_name_singular', 18, 'en', 'Product Slide', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(190, 'data_types', 'display_name_plural', 18, 'en', 'Product Slides', '2021-07-09 07:30:14', '2021-07-09 07:30:14'),
(191, 'data_rows', 'display_name', 123, 'ru', 'Id', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(192, 'data_rows', 'display_name', 124, 'ru', 'Title', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(193, 'data_rows', 'display_name', 125, 'ru', 'Description', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(194, 'data_rows', 'display_name', 126, 'ru', 'Image', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(195, 'data_rows', 'display_name', 127, 'ru', 'Category Id', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(196, 'data_rows', 'display_name', 128, 'ru', 'Created At', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(197, 'data_rows', 'display_name', 129, 'ru', 'Updated At', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(198, 'data_rows', 'display_name', 130, 'ru', 'product_categories', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(199, 'data_types', 'display_name_singular', 18, 'ru', 'Product Slide', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(200, 'data_types', 'display_name_plural', 18, 'ru', 'Product Slides', '2021-07-09 07:31:11', '2021-07-09 07:31:11'),
(201, 'product_slides', 'title', 1, 'en', 'OUR CATALOG', '2021-07-09 07:36:20', '2021-07-09 07:36:20'),
(202, 'product_slides', 'title', 1, 'ru', 'HАШ КАТАЛОГ', '2021-07-09 07:36:20', '2021-07-09 07:36:20'),
(203, 'product_slides', 'description', 1, 'en', 'Purpose - real-time video surveillance, registration and event recording, indication and notification of alarm events', '2021-07-09 07:36:20', '2021-07-09 07:36:20'),
(204, 'product_slides', 'description', 1, 'ru', 'Цель – видеонаблюдение в реальном времени, регистрация и запись событий, индикация и уведомление о тревожных событиях', '2021-07-09 07:36:20', '2021-07-09 07:36:20'),
(205, 'product_slides', 'title', 2, 'en', 'Video surveillance systems (CCTV and IPTV)', '2021-07-09 08:46:19', '2021-07-09 08:46:19'),
(206, 'product_slides', 'title', 2, 'ru', 'Системы видеонаблюдения (ССTV и IPTV)', '2021-07-09 08:46:19', '2021-07-09 08:46:19'),
(207, 'product_slides', 'description', 2, 'en', 'Purpose - video surveillance in real time, registration and recording of events, indication and notification of alarm events', '2021-07-09 08:46:19', '2021-07-09 08:46:19'),
(208, 'product_slides', 'description', 2, 'ru', 'Цель – видеонаблюдение в реальном времени, регистрация и запись событий, индикация и уведомление о тревожных событиях', '2021-07-09 08:46:19', '2021-07-09 08:46:19'),
(209, 'data_rows', 'display_name', 131, 'en', 'Id', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(210, 'data_rows', 'display_name', 132, 'en', 'Brend', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(211, 'data_rows', 'display_name', 133, 'en', 'Created At', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(212, 'data_rows', 'display_name', 134, 'en', 'Updated At', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(213, 'data_types', 'display_name_singular', 19, 'en', 'Brend', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(214, 'data_types', 'display_name_plural', 19, 'en', 'Brends', '2021-07-09 08:57:10', '2021-07-09 08:57:10'),
(215, 'data_rows', 'display_name', 135, 'en', 'Id', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(216, 'data_rows', 'display_name', 136, 'en', 'Format', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(217, 'data_rows', 'display_name', 137, 'en', 'Created At', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(218, 'data_rows', 'display_name', 138, 'en', 'Updated At', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(219, 'data_types', 'display_name_singular', 20, 'en', 'Format', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(220, 'data_types', 'display_name_plural', 20, 'en', 'Formats', '2021-07-09 08:57:47', '2021-07-09 08:57:47'),
(221, 'data_rows', 'display_name', 131, 'ru', 'Id', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(222, 'data_rows', 'display_name', 132, 'ru', 'Brend', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(223, 'data_rows', 'display_name', 133, 'ru', 'Created At', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(224, 'data_rows', 'display_name', 134, 'ru', 'Updated At', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(225, 'data_rows', 'display_name', 139, 'en', 'Order', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(226, 'data_types', 'display_name_singular', 19, 'ru', 'Brend', '2021-07-09 08:57:58', '2021-07-09 08:57:58'),
(227, 'data_types', 'display_name_plural', 19, 'ru', 'Brends', '2021-07-09 08:57:58', '2021-07-09 08:57:58');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Inr4BPV0pZR6jnpsinCaUOVo2Uj5YVpSB7s1saC2Bb.QaGtCIKkhy', 'Dm44q1HTqiHaA0t9cQiV5T4HaZKLAek360bVJFzb2fKyO260UgjRgj4RHucd', NULL, '2021-07-09 02:35:29', '2021-07-09 02:35:29');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `video_galleries`
--

CREATE TABLE `video_galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `video_galleries`
--

INSERT INTO `video_galleries` (`id`, `video`, `created_at`, `updated_at`, `featured`, `image`) VALUES
(1, '[{\"download_link\":\"video-galleries\\\\July2021\\\\zWuTCgoUcTffQfmh9Eu5.mp4\",\"original_name\":\"Milesight at Secutech Taiwan 2019.mp4\"}]', '2021-07-09 06:27:17', '2021-07-09 06:38:18', 1, 'video-galleries\\July2021\\rM17l0ZdoPwv9VTZxnnz.png');

-- --------------------------------------------------------

--
-- Структура таблицы `widgets`
--

CREATE TABLE `widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `widget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `widgets`
--

INSERT INTO `widgets` (`id`, `widget`, `created_at`, `updated_at`) VALUES
(1, 'index', '2021-07-09 02:56:51', '2021-07-09 02:56:51'),
(2, 'product', '2021-07-09 02:58:29', '2021-07-09 02:58:29'),
(3, 'company', '2021-07-09 02:58:35', '2021-07-09 02:58:35'),
(4, 'projects', '2021-07-09 02:58:53', '2021-07-09 02:58:53'),
(5, 'services', '2021-07-09 02:59:01', '2021-07-09 02:59:01'),
(6, 'contact', '2021-07-09 02:59:09', '2021-07-09 02:59:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about_data`
--
ALTER TABLE `about_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `brends`
--
ALTER TABLE `brends`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `home_data`
--
ALTER TABLE `home_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_slides`
--
ALTER TABLE `product_slides`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Индексы таблицы `video_galleries`
--
ALTER TABLE `video_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about_data`
--
ALTER TABLE `about_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `brends`
--
ALTER TABLE `brends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `formats`
--
ALTER TABLE `formats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `home_data`
--
ALTER TABLE `home_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product_slides`
--
ALTER TABLE `product_slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `video_galleries`
--
ALTER TABLE `video_galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
