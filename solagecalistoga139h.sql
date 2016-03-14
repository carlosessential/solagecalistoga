-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 14, 2016 at 07:23 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `solagecalistoga139h`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE `address_book` (
`address_book_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_company` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `entry_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `entry_postcode` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_city` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `entry_state` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `address_book`
--

INSERT INTO `address_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES
(1, 1, 'm', 'JustaDemo', 'Bill', 'Smith', '123 Any Avenue', '', '12345', 'Here', '', 223, 12),
(2, 2, 'm', '', 'Carlos', 'Artavia', 'Resid. Las Flores E1', '', '0000', 'San Pablo', '', 223, 18),
(3, 3, 'm', 'Ian Bowers', 'Hiram', 'Mckenzie', 'Asperiores natus fuga Qui cillum dolor inventore quos sed quia', 'Esse doloremque quod ut eveniet', '66608', 'Officia amet quam dicta aut qua', '', 223, 2);

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

CREATE TABLE `address_format` (
`address_format_id` int(11) NOT NULL,
  `address_format` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `address_summary` varchar(48) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country'),
(6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
`admin_id` int(11) NOT NULL,
  `admin_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `admin_email` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `admin_pass` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `admin_level` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_level`) VALUES
(1, 'admin', 'carlos@essentialinc.co', '1c8b8d89c926dfb7c1c3a14e5c344d61:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE `admin_activity_log` (
`log_id` int(15) NOT NULL,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `page_parameters` text COLLATE latin1_general_ci,
  `ip_address` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2317 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`) VALUES
(1, '2016-03-02 13:04:54', 0, 'alert_page.php ', '', '::1'),
(2, '2016-03-02 13:08:22', 0, 'login.php ', '', '::1'),
(3, '2016-03-02 13:08:25', 0, 'login.php admin', '', '::1'),
(4, '2016-03-02 13:08:31', 0, 'login.php admin', '', '::1'),
(5, '2016-03-02 13:08:34', 1, 'modules.php', 'set=payment&', '::1'),
(6, '2016-03-02 13:09:26', 1, 'modules.php', 'set=payment&', '::1'),
(7, '2016-03-02 13:09:28', 1, 'modules.php', 'set=payment&', '::1'),
(8, '2016-03-02 13:09:47', 1, 'modules.php', 'set=payment&', '::1'),
(9, '2016-03-02 13:09:50', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(10, '2016-03-02 13:09:53', 1, 'modules.php', 'set=payment&module=shift4&action=install&', '::1'),
(11, '2016-03-02 13:09:55', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(12, '2016-03-02 13:09:59', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(13, '2016-03-02 13:09:59', 1, 'modules.php', 'set=payment&module=paypalwpp&', '::1'),
(14, '2016-03-02 13:10:01', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(15, '2016-03-02 13:10:04', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(16, '2016-03-02 13:10:38', 1, 'modules.php', 'set=payment&module=paypalwpp&', '::1'),
(17, '2016-03-02 13:10:41', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(18, '2016-03-02 13:10:49', 1, 'modules.php', 'set=payment&module=paypalwpp&', '::1'),
(19, '2016-03-02 13:10:51', 1, 'modules.php', 'set=payment&module=moneyorder&', '::1'),
(20, '2016-03-02 13:10:53', 1, 'modules.php', 'set=payment&module=moneyorder&action=edit&', '::1'),
(21, '2016-03-02 13:12:01', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(22, '2016-03-02 13:15:13', 1, 'modules.php', 'set=payment&', '::1'),
(23, '2016-03-02 13:15:16', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(24, '2016-03-02 13:15:19', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(25, '2016-03-02 13:34:59', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(26, '2016-03-02 13:42:20', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(27, '2016-03-02 13:43:23', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(28, '2016-03-02 13:43:23', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(29, '2016-03-02 13:44:33', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(30, '2016-03-02 13:44:40', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(31, '2016-03-02 13:44:40', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(32, '2016-03-02 13:44:43', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(33, '2016-03-02 13:44:46', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(34, '2016-03-02 13:44:46', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(35, '2016-03-02 13:44:49', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(36, '2016-03-02 13:44:58', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(37, '2016-03-02 13:44:58', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(38, '2016-03-02 13:45:01', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(39, '2016-03-02 13:45:04', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(40, '2016-03-02 13:45:04', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(41, '2016-03-02 13:45:05', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(42, '2016-03-02 13:45:10', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(43, '2016-03-02 13:45:10', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(44, '2016-03-02 13:45:48', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(45, '2016-03-02 13:45:51', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(46, '2016-03-02 13:45:51', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(47, '2016-03-02 13:47:16', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(48, '2016-03-02 13:47:27', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(49, '2016-03-02 13:47:27', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(50, '2016-03-02 13:47:55', 1, 'modules.php', 'set=payment&module=shift4&action=remove&', '::1'),
(51, '2016-03-02 13:47:56', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(52, '2016-03-02 13:48:24', 1, 'modules.php', 'set=payment&module=shift4&action=install&', '::1'),
(53, '2016-03-02 13:48:24', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(54, '2016-03-02 13:48:32', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(55, '2016-03-02 13:48:32', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(56, '2016-03-02 13:48:35', 1, 'modules.php', 'set=payment&module=shift4&vcheck=yes&', '::1'),
(57, '2016-03-02 13:48:41', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(58, '2016-03-02 13:49:18', 1, 'modules.php', 'set=payment&', '::1'),
(59, '2016-03-02 13:51:32', 1, 'modules.php', 'set=payment&', '::1'),
(60, '2016-03-02 13:51:33', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(61, '2016-03-02 13:51:35', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(62, '2016-03-02 13:51:37', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(63, '2016-03-02 13:54:18', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(64, '2016-03-02 14:00:35', 1, 'template_select.php', '', '::1'),
(65, '2016-03-02 14:00:55', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(66, '2016-03-02 14:01:04', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(67, '2016-03-02 14:01:39', 1, 'layout_controller.php', '', '::1'),
(68, '2016-03-02 14:02:02', 1, 'layout_controller.php', '', '::1'),
(69, '2016-03-02 14:02:04', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(70, '2016-03-02 14:02:06', 1, 'template_select.php', '', '::1'),
(71, '2016-03-02 14:02:06', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(72, '2016-03-02 14:02:07', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(73, '2016-03-02 14:03:06', 1, 'template_select.php', '', '::1'),
(74, '2016-03-02 14:08:15', 1, 'template_select.php', '', '::1'),
(75, '2016-03-02 14:08:20', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(76, '2016-03-02 14:08:22', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(77, '2016-03-02 14:08:30', 1, 'layout_controller.php', '', '::1'),
(78, '2016-03-02 14:08:33', 1, 'layout_controller.php', 'page=&cID=71&action=reset_defaults&', '::1'),
(79, '2016-03-02 14:08:33', 1, 'layout_controller.php', 'page=&', '::1'),
(80, '2016-03-02 14:13:43', 1, 'alt_nav.php', '', '::1'),
(81, '2016-03-02 14:13:49', 1, 'modules.php', 'set=payment&', '::1'),
(82, '2016-03-02 14:13:52', 1, 'template_select.php', '', '::1'),
(83, '2016-03-02 14:14:00', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(84, '2016-03-02 14:14:03', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(85, '2016-03-02 14:14:14', 1, 'template_select.php', '', '::1'),
(86, '2016-03-02 14:14:17', 1, 'template_select.php', '', '::1'),
(87, '2016-03-02 14:14:34', 1, 'template_select.php', '', '::1'),
(88, '2016-03-02 14:14:36', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(89, '2016-03-02 14:14:38', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(90, '2016-03-02 14:21:21', 1, 'template_select.php', '', '::1'),
(91, '2016-03-02 14:45:52', 1, 'template_select.php', '', '::1'),
(92, '2016-03-02 14:45:54', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(93, '2016-03-02 14:45:58', 1, 'template_select.php', 'page=1&tID=1&', '::1'),
(94, '2016-03-02 14:46:51', 1, 'template_select.php', '', '::1'),
(95, '2016-03-02 14:47:03', 1, 'template_select.php', '', '::1'),
(96, '2016-03-02 14:47:20', 1, 'template_select.php', '', '::1'),
(97, '2016-03-02 14:47:37', 1, 'template_select.php', '', '::1'),
(98, '2016-03-02 14:48:41', 1, 'template_select.php', 'vcheck=yes&', '::1'),
(99, '2016-03-02 14:56:35', 1, 'template_select.php', '', '::1'),
(100, '2016-03-02 14:56:42', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(101, '2016-03-02 14:56:44', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(102, '2016-03-02 14:56:55', 1, 'template_select.php', '', '::1'),
(103, '2016-03-02 14:57:10', 1, 'template_select.php', '', '::1'),
(104, '2016-03-02 14:57:11', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(105, '2016-03-02 14:57:13', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(106, '2016-03-02 14:57:45', 1, 'template_select.php', '', '::1'),
(107, '2016-03-02 14:57:48', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(108, '2016-03-02 14:57:50', 1, 'template_select.php', 'page=1&tID=1&action=save&', '::1'),
(109, '2016-03-02 14:57:53', 1, 'template_select.php', '', '::1'),
(110, '2016-03-02 14:59:30', 1, 'template_select.php', '', '::1'),
(111, '2016-03-02 14:59:49', 1, 'template_select.php', '', '::1'),
(112, '2016-03-02 15:01:57', 1, 'template_select.php', '', '::1'),
(113, '2016-03-02 15:06:01', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(114, '2016-03-02 15:06:03', 1, 'template_select.php', 'page=1&tID=1&', '::1'),
(115, '2016-03-02 15:06:05', 1, 'configuration.php', 'gID=1&', '::1'),
(116, '2016-03-02 15:06:13', 1, 'configuration.php', 'gID=1&cID=1&action=edit&', '::1'),
(117, '2016-03-02 15:06:15', 1, 'configuration.php', 'gID=1&cID=1&', '::1'),
(118, '2016-03-02 15:06:42', 1, 'categories.php', '', '::1'),
(119, '2016-03-02 15:06:52', 1, 'modules.php', 'set=payment&', '::1'),
(120, '2016-03-02 15:06:53', 1, 'modules.php', 'set=shipping&', '::1'),
(121, '2016-03-02 15:07:00', 1, 'configuration.php', 'gID=1&', '::1'),
(122, '2016-03-02 15:07:34', 1, 'configuration.php', 'gID=1&cID=12&action=edit&', '::1'),
(123, '2016-03-02 15:07:48', 1, 'modules.php', 'set=shipping&', '::1'),
(124, '2016-03-02 15:08:07', 1, 'configuration.php', 'gID=47&', '::1'),
(125, '2016-03-02 15:08:13', 1, 'configuration.php', 'gID=7&', '::1'),
(126, '2016-03-02 15:08:24', 1, 'configuration.php', 'gID=47&cID=602&action=edit&', '::1'),
(127, '2016-03-02 15:08:27', 1, 'configuration.php', 'gID=47&cID=603&action=edit&', '::1'),
(128, '2016-03-02 15:08:46', 1, 'configuration.php', 'gID=47&cID=604&action=edit&', '::1'),
(129, '2016-03-02 15:08:55', 1, 'configuration.php', 'gID=7&cID=197&action=edit&', '::1'),
(130, '2016-03-02 15:08:57', 1, 'configuration.php', 'gID=7&cID=197&action=save&', '::1'),
(131, '2016-03-02 15:08:57', 1, 'configuration.php', 'gID=7&cID=197&', '::1'),
(132, '2016-03-02 15:08:59', 1, 'modules.php', 'set=shipping&', '::1'),
(133, '2016-03-02 15:09:05', 1, 'orders.php', '', '::1'),
(134, '2016-03-02 15:09:13', 1, 'stats_products_viewed.php', '', '::1'),
(135, '2016-03-02 15:09:16', 1, 'stats_products_purchased.php', '', '::1'),
(136, '2016-03-02 15:09:20', 1, 'whos_online.php', '', '::1'),
(137, '2016-03-02 15:11:14', 1, 'configuration.php', 'gID=1&', '::1'),
(138, '2016-03-02 15:11:16', 1, 'configuration.php', 'gID=1&cID=1&action=edit&', '::1'),
(139, '2016-03-02 15:11:22', 1, 'configuration.php', 'gID=1&cID=1&action=save&', '::1'),
(140, '2016-03-02 15:11:22', 1, 'configuration.php', 'gID=1&cID=1&', '::1'),
(141, '2016-03-02 15:36:20', 1, 'configuration.php', 'gID=1&cID=1&vcheck=yes&', '::1'),
(142, '2016-03-06 15:34:57', 0, 'login.php ', '', '::1'),
(143, '2016-03-06 15:34:59', 0, 'login.php admin', '', '::1'),
(144, '2016-03-07 15:07:09', 0, 'login.php ', '', '::1'),
(145, '2016-03-07 15:07:11', 0, 'login.php admin', '', '::1'),
(146, '2016-03-07 15:11:59', 1, 'layout_controller.php', '', '::1'),
(147, '2016-03-07 15:33:32', 1, 'configuration.php', 'gID=7&', '::1'),
(148, '2016-03-07 16:11:22', 1, 'alt_nav.php', '', '::1'),
(149, '2016-03-07 16:11:24', 1, 'configuration.php', 'gID=1&', '::1'),
(150, '2016-03-07 16:27:02', 0, 'login.php ', '', '::1'),
(151, '2016-03-07 16:27:04', 0, 'login.php admin', '', '::1'),
(152, '2016-03-07 16:27:14', 1, 'configuration.php', 'gID=1&', '::1'),
(153, '2016-03-07 16:27:16', 1, 'configuration.php', 'gID=1&cID=12&', '::1'),
(154, '2016-03-07 16:27:18', 1, 'configuration.php', 'gID=1&cID=12&action=edit&', '::1'),
(155, '2016-03-07 16:28:01', 1, 'configuration.php', 'gID=1&cID=12&action=save&', '::1'),
(156, '2016-03-07 16:28:01', 1, 'configuration.php', 'gID=1&cID=12&', '::1'),
(157, '2016-03-07 16:30:28', 1, 'configuration.php', 'gID=4&', '::1'),
(158, '2016-03-07 16:30:33', 1, 'configuration.php', 'gID=5&', '::1'),
(159, '2016-03-07 16:30:39', 1, 'configuration.php', 'gID=8&', '::1'),
(160, '2016-03-07 16:30:48', 1, 'configuration.php', 'gID=12&', '::1'),
(161, '2016-03-07 16:31:04', 1, 'configuration.php', 'gID=13&', '::1'),
(162, '2016-03-07 16:31:10', 1, 'configuration.php', 'gID=18&', '::1'),
(163, '2016-03-07 16:31:15', 1, 'alt_nav.php', '', '::1'),
(164, '2016-03-07 16:31:19', 1, 'categories.php', '', '::1'),
(165, '2016-03-07 16:31:22', 1, 'product_types.php', '', '::1'),
(166, '2016-03-07 16:31:24', 1, 'products_price_manager.php', '', '::1'),
(167, '2016-03-07 16:31:28', 1, 'categories.php', '', '::1'),
(168, '2016-03-07 16:32:00', 1, 'email_welcome.php', '', '::1'),
(169, '2016-03-07 16:32:12', 1, 'admin.php', '', '::1'),
(170, '2016-03-07 16:32:18', 1, 'template_select.php', '', '::1'),
(171, '2016-03-07 16:34:18', 1, 'banner_manager.php', '', '::1'),
(172, '2016-03-07 16:57:31', 1, 'store_manager.php', '', '::1'),
(173, '2016-03-07 16:57:32', 1, 'developers_tool_kit.php', '', '::1'),
(174, '2016-03-07 16:57:37', 1, 'ezpages.php', '', '::1'),
(175, '2016-03-07 16:57:43', 1, 'ezpages.php', 'page=1&ezID=1&', '::1'),
(176, '2016-03-07 16:57:45', 1, 'ezpages.php', 'page=1&ezID=1&action=new&', '::1'),
(177, '2016-03-07 16:58:18', 1, 'ezpages.php', '', '::1'),
(178, '2016-03-07 16:58:31', 1, 'define_pages_editor.php', '', '::1'),
(179, '2016-03-07 16:58:37', 1, 'define_pages_editor.php', '', '::1'),
(180, '2016-03-07 16:58:42', 1, 'store_manager.php', '', '::1'),
(181, '2016-03-07 16:58:56', 1, 'layout_controller.php', '', '::1'),
(182, '2016-03-07 16:59:37', 1, 'layout_controller.php', '', '::1'),
(183, '2016-03-07 16:59:46', 1, 'layout_controller.php', 'page=&cID=117&', '::1'),
(184, '2016-03-07 17:01:37', 1, 'layout_controller.php', 'page=&cID=117&action=edit&', '::1'),
(185, '2016-03-07 17:01:43', 1, 'layout_controller.php', 'page=&cID=117&layout_box_name=specials.php&', '::1'),
(186, '2016-03-07 22:16:35', 0, 'login.php ', '', '::1'),
(187, '2016-03-07 22:16:36', 0, 'login.php admin', '', '::1'),
(188, '2016-03-07 22:16:44', 1, 'layout_controller.php', '', '::1'),
(189, '2016-03-07 22:16:58', 1, 'admin.php', '', '::1'),
(190, '2016-03-07 23:52:02', 0, 'login.php ', '', '::1'),
(191, '2016-03-07 23:52:03', 0, 'login.php admin', '', '::1'),
(192, '2016-03-07 23:52:06', 1, 'template_select.php', '', '::1'),
(193, '2016-03-07 23:52:08', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(194, '2016-03-07 23:52:13', 1, 'layout_controller.php', '', '::1'),
(195, '2016-03-07 23:52:16', 1, 'layout_controller.php', 'page=&cID=94&action=edit&', '::1'),
(196, '2016-03-07 23:52:24', 1, 'layout_controller.php', 'page=&cID=94&layout_box_name=banner_box.php&', '::1'),
(197, '2016-03-08 00:25:38', 1, 'categories.php', '', '::1'),
(198, '2016-03-08 23:56:47', 0, 'login.php ', '', '::1'),
(199, '2016-03-08 23:56:48', 0, 'login.php admin', '', '::1'),
(200, '2016-03-08 23:56:55', 1, 'define_pages_editor.php', '', '::1'),
(201, '2016-03-08 23:57:07', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(202, '2016-03-08 23:57:41', 1, 'define_pages_editor.php', 'lngdir=english&filename=define_main_page.php&action=save&', '::1'),
(203, '2016-03-08 23:57:41', 1, 'define_pages_editor.php', '', '::1'),
(204, '2016-03-08 23:57:57', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(205, '2016-03-09 00:02:15', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(206, '2016-03-09 00:02:35', 1, 'configuration.php', 'gID=4&', '::1'),
(207, '2016-03-09 00:03:25', 1, 'categories.php', '', '::1'),
(208, '2016-03-09 00:03:29', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(209, '2016-03-09 00:03:34', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(210, '2016-03-09 00:03:34', 1, 'categories.php', 'cPath=&cID=65&', '::1'),
(211, '2016-03-09 00:03:37', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=65&cPath=&', '::1'),
(212, '2016-03-09 00:03:39', 1, 'categories.php', 'action=update_category_status&cPath=&cID=65&', '::1'),
(213, '2016-03-09 00:03:39', 1, 'categories.php', 'cPath=&cID=65&', '::1'),
(214, '2016-03-09 00:03:53', 1, 'categories.php', 'cPath=65&', '::1'),
(215, '2016-03-09 00:04:04', 1, 'categories.php', 'cID=65&', '::1'),
(216, '2016-03-09 00:06:05', 1, 'categories.php', 'cPath=&cID=65&action=edit_category&', '::1'),
(217, '2016-03-09 00:06:52', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(218, '2016-03-09 00:06:52', 1, 'categories.php', 'cPath=&cID=65&', '::1'),
(219, '2016-03-09 00:06:59', 1, 'define_pages_editor.php', '', '::1'),
(220, '2016-03-09 00:07:02', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(221, '2016-03-09 00:07:20', 1, 'define_pages_editor.php', 'lngdir=english&filename=define_main_page.php&action=save&', '::1'),
(222, '2016-03-09 00:07:20', 1, 'define_pages_editor.php', '', '::1'),
(223, '2016-03-09 00:09:17', 1, 'admin.php', '', '::1'),
(224, '2016-03-09 00:09:30', 1, 'admin.php', 'page=1&adminID=1&action=edit&', '::1'),
(225, '2016-03-09 00:09:32', 1, 'admin.php', 'page=1&adminID=1&', '::1'),
(226, '2016-03-09 00:09:47', 1, 'define_pages_editor.php', '', '::1'),
(227, '2016-03-09 00:09:52', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(228, '2016-03-09 00:09:54', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&reset_editor=2&action=set_editor&', '::1'),
(229, '2016-03-09 00:09:54', 1, 'define_pages_editor.php', '', '::1'),
(230, '2016-03-09 00:09:57', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&reset_editor=1&action=set_editor&', '::1'),
(231, '2016-03-09 00:09:57', 1, 'define_pages_editor.php', '', '::1'),
(232, '2016-03-09 00:10:01', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(233, '2016-03-09 00:10:03', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&reset_editor=2&action=set_editor&', '::1'),
(234, '2016-03-09 00:10:03', 1, 'define_pages_editor.php', '', '::1'),
(235, '2016-03-09 00:10:06', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(236, '2016-03-09 00:10:10', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&reset_editor=1&action=set_editor&', '::1'),
(237, '2016-03-09 00:10:10', 1, 'define_pages_editor.php', '', '::1'),
(238, '2016-03-09 00:11:02', 1, 'layout_controller.php', '', '::1'),
(239, '2016-03-09 00:11:35', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(240, '2016-03-09 00:11:36', 1, 'layout_controller.php', 'page=&cID=98&action=edit&', '::1'),
(241, '2016-03-09 00:11:43', 1, 'layout_controller.php', 'page=&cID=98&action=save&layout_box_name=categories.php&', '::1'),
(242, '2016-03-09 00:11:43', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(243, '2016-03-09 00:17:18', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(244, '2016-03-09 00:17:20', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(245, '2016-03-09 00:17:24', 1, 'layout_controller.php', 'page=&cID=114&action=save&layout_box_name=search.php&', '::1'),
(246, '2016-03-09 00:17:24', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(247, '2016-03-09 00:17:35', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(248, '2016-03-09 00:17:38', 1, 'layout_controller.php', 'page=&cID=98&action=edit&', '::1'),
(249, '2016-03-09 00:17:44', 1, 'layout_controller.php', 'page=&cID=98&action=save&layout_box_name=categories.php&', '::1'),
(250, '2016-03-09 00:17:45', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(251, '2016-03-09 00:19:29', 1, 'define_pages_editor.php', '', '::1'),
(252, '2016-03-09 00:19:36', 1, 'layout_controller.php', '', '::1'),
(253, '2016-03-09 00:19:38', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(254, '2016-03-09 00:19:40', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(255, '2016-03-09 00:19:44', 1, 'layout_controller.php', 'page=&cID=114&action=save&layout_box_name=search.php&', '::1'),
(256, '2016-03-09 00:19:44', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(257, '2016-03-09 00:20:07', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(258, '2016-03-09 00:20:12', 1, 'layout_controller.php', 'page=&cID=114&action=save&layout_box_name=search.php&', '::1'),
(259, '2016-03-09 00:20:12', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(260, '2016-03-09 00:20:14', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(261, '2016-03-09 00:22:05', 1, 'store_manager.php', '', '::1'),
(262, '2016-03-09 00:22:23', 1, 'stats_products_lowstock.php', '', '::1'),
(263, '2016-03-09 00:22:33', 1, 'categories.php', '', '::1'),
(264, '2016-03-09 00:22:43', 1, 'categories.php', 'cPath=3&', '::1'),
(265, '2016-03-09 00:22:44', 1, 'categories.php', 'cPath=3_10&', '::1'),
(266, '2016-03-09 00:22:49', 1, 'product.php', 'page=1&product_type=1&cPath=3_10&pID=12&action=new_product&', '::1'),
(267, '2016-03-09 00:23:24', 1, 'layout_controller.php', '', '::1'),
(268, '2016-03-09 00:23:48', 1, 'configuration.php', 'gID=18&', '::1'),
(269, '2016-03-09 00:24:03', 1, 'configuration.php', 'gID=30&', '::1'),
(270, '2016-03-09 00:24:16', 1, 'ezpages.php', '', '::1'),
(271, '2016-03-09 00:33:19', 1, 'define_pages_editor.php', '', '::1'),
(272, '2016-03-09 00:33:30', 1, 'define_pages_editor.php', 'securityToken=0ca8c44d557693da5ffe0e94816f7167&define_it=5&action=new_page&', '::1'),
(273, '2016-03-09 00:36:51', 1, 'configuration.php', 'gID=19&', '::1'),
(274, '2016-03-09 00:52:15', 1, 'configuration.php', 'gID=19&cID=404&action=edit&', '::1'),
(275, '2016-03-09 00:52:18', 1, 'configuration.php', 'gID=19&cID=404&action=save&', '::1'),
(276, '2016-03-09 00:52:18', 1, 'configuration.php', 'gID=19&cID=404&', '::1'),
(277, '2016-03-09 00:52:33', 1, 'configuration.php', 'gID=19&cID=404&action=edit&', '::1'),
(278, '2016-03-09 00:52:35', 1, 'configuration.php', 'gID=19&cID=404&action=save&', '::1'),
(279, '2016-03-09 00:52:35', 1, 'configuration.php', 'gID=19&cID=404&', '::1'),
(280, '2016-03-09 00:52:37', 1, 'configuration.php', 'gID=19&cID=405&', '::1'),
(281, '2016-03-09 00:52:38', 1, 'configuration.php', 'gID=19&cID=405&action=edit&', '::1'),
(282, '2016-03-09 00:52:43', 1, 'configuration.php', 'gID=19&cID=405&action=save&', '::1'),
(283, '2016-03-09 00:52:43', 1, 'configuration.php', 'gID=19&cID=405&', '::1'),
(284, '2016-03-09 00:54:06', 1, 'configuration.php', 'gID=19&', '::1'),
(285, '2016-03-09 00:54:49', 1, 'configuration.php', 'gID=19&cID=405&action=edit&', '::1'),
(286, '2016-03-09 00:54:51', 1, 'configuration.php', 'gID=19&cID=405&action=save&', '::1'),
(287, '2016-03-09 00:54:51', 1, 'configuration.php', 'gID=19&cID=405&', '::1'),
(288, '2016-03-09 00:56:01', 1, 'layout_controller.php', '', '::1'),
(289, '2016-03-09 00:56:10', 1, 'configuration.php', 'gID=19&cID=399&action=edit&', '::1'),
(290, '2016-03-09 00:56:27', 1, 'configuration.php', 'gID=19&cID=402&action=edit&', '::1'),
(291, '2016-03-09 00:56:30', 1, 'configuration.php', 'gID=19&cID=402&action=save&', '::1'),
(292, '2016-03-09 00:56:30', 1, 'configuration.php', 'gID=19&cID=402&', '::1'),
(293, '2016-03-09 00:56:41', 1, 'configuration.php', 'gID=19&cID=402&action=edit&', '::1'),
(294, '2016-03-09 00:56:43', 1, 'configuration.php', 'gID=19&cID=402&action=save&', '::1'),
(295, '2016-03-09 00:56:43', 1, 'configuration.php', 'gID=19&cID=402&', '::1'),
(296, '2016-03-09 17:45:47', 0, 'login.php ', '', '::1'),
(297, '2016-03-09 17:45:49', 0, 'login.php admin', '', '::1'),
(298, '2016-03-09 17:45:57', 1, 'define_pages_editor.php', '', '::1'),
(299, '2016-03-09 17:46:00', 1, 'define_pages_editor.php', 'securityToken=6b111ff16ecf7a37f0829c4e07d67790&define_it=5&action=new_page&', '::1'),
(300, '2016-03-09 17:46:11', 1, 'define_pages_editor.php', 'lngdir=english&filename=define_main_page.php&action=save&', '::1'),
(301, '2016-03-09 17:46:11', 1, 'define_pages_editor.php', '', '::1'),
(302, '2016-03-09 23:54:45', 0, 'login.php ', '', '::1'),
(303, '2016-03-09 23:54:47', 0, 'login.php admin', '', '::1'),
(304, '2016-03-09 23:54:56', 1, 'define_pages_editor.php', '', '::1'),
(305, '2016-03-09 23:55:00', 1, 'define_pages_editor.php', 'securityToken=826943ec16e918a16504d06fefac6dc4&define_it=5&action=new_page&', '::1'),
(306, '2016-03-10 00:38:31', 1, 'layout_controller.php', '', '::1'),
(307, '2016-03-10 00:38:38', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(308, '2016-03-10 00:38:41', 1, 'layout_controller.php', 'page=&cID=98&action=edit&', '::1'),
(309, '2016-03-10 00:38:43', 1, 'layout_controller.php', 'page=&cID=98&layout_box_name=categories.php&', '::1'),
(310, '2016-03-10 00:38:51', 1, 'specials.php', '', '::1'),
(311, '2016-03-10 01:07:08', 1, 'banner_manager.php', '', '::1'),
(312, '2016-03-10 01:07:42', 1, 'banner_manager.php', '', '::1'),
(313, '2016-03-10 01:07:46', 1, 'banner_manager.php', 'page=1&bID=6&action=setflag&flag=0&', '::1'),
(314, '2016-03-10 01:07:46', 1, 'banner_manager.php', 'page=1&bID=6&', '::1'),
(315, '2016-03-10 01:36:56', 1, 'login.php', '', '::1'),
(316, '2016-03-10 01:36:57', 1, 'login.php', '', '::1'),
(317, '2016-03-10 01:37:01', 1, 'define_pages_editor.php', '', '::1'),
(318, '2016-03-10 02:03:02', 1, 'login.php', '', '::1'),
(319, '2016-03-10 02:03:03', 1, 'login.php', '', '::1'),
(320, '2016-03-10 02:03:07', 1, 'layout_controller.php', '', '::1'),
(321, '2016-03-10 02:03:18', 1, 'alt_nav.php', '', '::1'),
(322, '2016-03-10 02:03:22', 1, 'coupon_admin.php', '', '::1'),
(323, '2016-03-10 02:31:48', 1, 'login.php', '', '::1'),
(324, '2016-03-10 02:31:49', 1, 'login.php', '', '::1'),
(325, '2016-03-10 02:33:41', 1, 'modules.php', 'set=payment&', '::1'),
(326, '2016-03-10 02:33:44', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(327, '2016-03-10 02:33:46', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(328, '2016-03-10 02:35:13', 1, 'modules.php', 'set=payment&module=shift4&action=save&', '::1'),
(329, '2016-03-10 02:35:13', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(330, '2016-03-10 02:36:00', 1, 'modules.php', 'set=payment&module=moneyorder&', '::1'),
(331, '2016-03-10 02:36:03', 1, 'modules.php', 'set=payment&module=moneyorder&action=edit&', '::1'),
(332, '2016-03-10 02:36:10', 1, 'modules.php', 'set=payment&module=moneyorder&action=save&', '::1'),
(333, '2016-03-10 02:36:10', 1, 'modules.php', 'set=payment&module=moneyorder&', '::1'),
(334, '2016-03-10 02:36:13', 1, 'modules.php', 'set=payment&module=freecharger&', '::1'),
(335, '2016-03-10 02:36:16', 1, 'modules.php', 'set=payment&module=freecharger&action=edit&', '::1'),
(336, '2016-03-10 02:36:19', 1, 'modules.php', 'set=payment&module=freecharger&action=save&', '::1'),
(337, '2016-03-10 02:36:19', 1, 'modules.php', 'set=payment&module=freecharger&', '::1'),
(338, '2016-03-10 02:36:43', 1, 'modules.php', 'set=payment&module=freecharger&', '::1'),
(339, '2016-03-10 02:41:56', 1, 'template_select.php', '', '::1'),
(340, '2016-03-10 02:41:59', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '::1'),
(341, '2016-03-10 02:42:01', 1, 'layout_controller.php', '', '::1'),
(342, '2016-03-10 02:42:14', 1, 'define_pages_editor.php', '', '::1'),
(343, '2016-03-10 02:46:47', 1, 'ezpages.php', '', '::1'),
(344, '2016-03-10 02:47:12', 1, 'configuration.php', 'gID=19&', '::1'),
(345, '2016-03-10 02:47:20', 1, 'configuration.php', 'gID=19&cID=424&action=edit&', '::1'),
(346, '2016-03-10 03:01:47', 1, 'login.php', '', '::1'),
(347, '2016-03-10 03:01:47', 1, 'login.php', '', '::1'),
(348, '2016-03-10 03:01:53', 1, 'categories.php', '', '::1'),
(349, '2016-03-10 03:01:55', 1, 'categories.php', 'cPath=65&', '::1'),
(350, '2016-03-10 03:02:00', 1, 'categories.php', 'cPath=65&action=new_category&', '::1'),
(351, '2016-03-10 03:02:05', 1, 'categories.php', 'action=insert_category&cPath=65&', '::1'),
(352, '2016-03-10 03:02:06', 1, 'categories.php', 'cPath=65&cID=66&', '::1'),
(353, '2016-03-10 03:02:13', 1, 'categories.php', '', '::1'),
(354, '2016-03-10 03:02:23', 1, 'categories.php', 'cPath=65&', '::1'),
(355, '2016-03-10 03:02:26', 1, 'categories.php', 'cPath=65&cID=66&action=delete_category&', '::1'),
(356, '2016-03-10 03:02:27', 1, 'categories.php', 'action=delete_category_confirm&cPath=65&', '::1'),
(357, '2016-03-10 03:02:27', 1, 'categories.php', 'cPath=65&', '::1'),
(358, '2016-03-10 03:02:29', 1, 'categories.php', '', '::1'),
(359, '2016-03-10 03:02:33', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(360, '2016-03-10 03:02:36', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(361, '2016-03-10 03:02:36', 1, 'categories.php', 'cPath=&cID=67&', '::1'),
(362, '2016-03-10 03:02:39', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=67&cPath=&', '::1'),
(363, '2016-03-10 03:02:40', 1, 'categories.php', 'action=update_category_status&cPath=&cID=67&', '::1'),
(364, '2016-03-10 03:02:40', 1, 'categories.php', 'cPath=&cID=67&', '::1'),
(365, '2016-03-10 03:02:42', 1, 'categories.php', 'cPath=67&', '::1'),
(366, '2016-03-10 03:02:45', 1, 'categories.php', 'cPath=&cID=67&', '::1'),
(367, '2016-03-10 03:02:48', 1, 'categories.php', 'cPath=&cID=67&action=edit_category&', '::1'),
(368, '2016-03-10 03:03:14', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(369, '2016-03-10 03:03:14', 1, 'categories.php', 'cPath=&cID=67&', '::1'),
(370, '2016-03-10 03:13:05', 1, 'login.php', '', '::1'),
(371, '2016-03-10 03:13:06', 1, 'login.php', '', '::1'),
(372, '2016-03-10 03:13:09', 1, 'categories.php', '', '::1'),
(373, '2016-03-10 03:13:13', 1, 'categories.php', 'cPath=&cID=67&action=edit_category&', '::1'),
(374, '2016-03-10 03:13:16', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(375, '2016-03-10 03:13:16', 1, 'categories.php', 'cPath=&cID=67&', '::1'),
(376, '2016-03-10 03:13:24', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(377, '2016-03-10 03:13:31', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(378, '2016-03-10 03:13:31', 1, 'categories.php', 'cPath=&cID=68&', '::1'),
(379, '2016-03-10 03:13:34', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=68&cPath=&', '::1'),
(380, '2016-03-10 03:13:38', 1, 'categories.php', 'action=update_category_status&cPath=&cID=68&', '::1'),
(381, '2016-03-10 03:13:38', 1, 'categories.php', 'cPath=&cID=68&', '::1'),
(382, '2016-03-10 03:13:40', 1, 'categories.php', 'cPath=&cID=68&action=edit_category&', '::1'),
(383, '2016-03-10 03:13:47', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(384, '2016-03-10 03:13:47', 1, 'categories.php', 'cPath=&cID=68&', '::1'),
(385, '2016-03-10 03:27:46', 1, 'login.php', '', '::1'),
(386, '2016-03-10 03:27:47', 1, 'login.php', '', '::1'),
(387, '2016-03-10 03:27:51', 1, 'categories.php', '', '::1'),
(388, '2016-03-10 03:27:54', 1, 'categories.php', 'cPath=&cID=68&action=edit_category&', '::1'),
(389, '2016-03-10 03:35:56', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(390, '2016-03-10 03:35:56', 1, 'categories.php', 'cPath=&cID=68&', '::1'),
(391, '2016-03-10 03:36:02', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(392, '2016-03-10 03:36:20', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(393, '2016-03-10 03:36:20', 1, 'categories.php', 'cPath=&cID=69&', '::1'),
(394, '2016-03-10 03:36:23', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=69&cPath=&', '::1'),
(395, '2016-03-10 03:36:25', 1, 'categories.php', 'action=update_category_status&cPath=&cID=69&', '::1'),
(396, '2016-03-10 03:36:25', 1, 'categories.php', 'cPath=&cID=69&', '::1'),
(397, '2016-03-10 03:36:28', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(398, '2016-03-10 03:36:45', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(399, '2016-03-10 03:36:45', 1, 'categories.php', 'cPath=&cID=70&', '::1'),
(400, '2016-03-10 03:36:49', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=70&cPath=&', '::1'),
(401, '2016-03-10 03:36:50', 1, 'categories.php', 'action=update_category_status&cPath=&cID=70&', '::1'),
(402, '2016-03-10 03:36:50', 1, 'categories.php', 'cPath=&cID=70&', '::1'),
(403, '2016-03-10 03:36:53', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(404, '2016-03-10 03:37:05', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(405, '2016-03-10 03:37:05', 1, 'categories.php', 'cPath=&cID=71&', '::1'),
(406, '2016-03-10 03:37:07', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=71&cPath=&', '::1'),
(407, '2016-03-10 03:37:09', 1, 'categories.php', 'action=update_category_status&cPath=&cID=71&', '::1'),
(408, '2016-03-10 03:37:09', 1, 'categories.php', 'cPath=&cID=71&', '::1'),
(409, '2016-03-10 03:37:11', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(410, '2016-03-10 03:37:24', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(411, '2016-03-10 03:37:24', 1, 'categories.php', 'cPath=&cID=72&', '::1'),
(412, '2016-03-10 03:37:27', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=72&cPath=&', '::1'),
(413, '2016-03-10 03:37:28', 1, 'categories.php', 'action=update_category_status&cPath=&cID=72&', '::1'),
(414, '2016-03-10 03:37:28', 1, 'categories.php', 'cPath=&cID=72&', '::1'),
(415, '2016-03-10 03:37:30', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(416, '2016-03-10 03:37:52', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(417, '2016-03-10 03:37:52', 1, 'categories.php', 'cPath=&cID=73&', '::1'),
(418, '2016-03-10 03:37:54', 1, 'categories.php', 'cPath=73&', '::1'),
(419, '2016-03-10 03:37:56', 1, 'categories.php', 'cPath=&cID=73&', '::1'),
(420, '2016-03-10 03:37:58', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=73&cPath=&', '::1'),
(421, '2016-03-10 03:37:59', 1, 'categories.php', 'action=update_category_status&cPath=&cID=73&', '::1'),
(422, '2016-03-10 03:37:59', 1, 'categories.php', 'cPath=&cID=73&', '::1'),
(423, '2016-03-10 03:38:01', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(424, '2016-03-10 03:38:17', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(425, '2016-03-10 03:38:17', 1, 'categories.php', 'cPath=&cID=74&', '::1'),
(426, '2016-03-10 03:38:19', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=74&cPath=&', '::1'),
(427, '2016-03-10 03:38:20', 1, 'categories.php', 'action=update_category_status&cPath=&cID=74&', '::1'),
(428, '2016-03-10 03:38:21', 1, 'categories.php', 'cPath=&cID=74&', '::1'),
(429, '2016-03-10 03:38:22', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(430, '2016-03-10 03:38:36', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(431, '2016-03-10 03:38:36', 1, 'categories.php', 'cPath=&cID=75&', '::1'),
(432, '2016-03-10 03:38:38', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=75&cPath=&', '::1'),
(433, '2016-03-10 03:38:42', 1, 'categories.php', 'action=update_category_status&cPath=&cID=75&', '::1'),
(434, '2016-03-10 03:38:42', 1, 'categories.php', 'cPath=&cID=75&', '::1'),
(435, '2016-03-10 03:42:03', 1, 'categories.php', 'cPath=69&', '::1'),
(436, '2016-03-10 03:42:08', 1, 'categories.php', 'cID=69&', '::1'),
(437, '2016-03-10 03:42:12', 1, 'categories.php', 'cPath=&cID=69&action=edit_category&', '::1'),
(438, '2016-03-10 03:42:19', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(439, '2016-03-10 03:42:19', 1, 'categories.php', 'cPath=&cID=69&', '::1'),
(440, '2016-03-10 03:42:28', 1, 'categories.php', 'cPath=&cID=69&action=edit_category&', '::1'),
(441, '2016-03-10 03:42:36', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(442, '2016-03-10 03:42:36', 1, 'categories.php', 'cPath=&cID=69&', '::1'),
(443, '2016-03-10 03:42:40', 1, 'categories.php', 'cPath=&cID=69&action=edit_category&', '::1'),
(444, '2016-03-10 03:42:45', 1, 'categories.php', 'cPath=&cID=69&', '::1'),
(445, '2016-03-10 03:42:48', 1, 'categories.php', 'cPath=&cID=68&action=edit_category&', '::1'),
(446, '2016-03-10 03:43:12', 1, 'categories.php', '', '::1'),
(447, '2016-03-10 03:43:28', 1, 'categories.php', 'cPath=&cID=72&action=delete_category&', '::1'),
(448, '2016-03-10 03:43:30', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(449, '2016-03-10 03:43:30', 1, 'categories.php', 'cPath=&', '::1'),
(450, '2016-03-10 03:43:34', 1, 'categories.php', 'cPath=&cID=74&action=delete_category&', '::1'),
(451, '2016-03-10 03:43:36', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(452, '2016-03-10 03:43:36', 1, 'categories.php', 'cPath=&', '::1'),
(453, '2016-03-10 03:43:46', 1, 'categories.php', 'cPath=&cID=73&action=delete_category&', '::1'),
(454, '2016-03-10 03:43:48', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(455, '2016-03-10 03:43:48', 1, 'categories.php', 'cPath=&', '::1'),
(456, '2016-03-10 03:43:50', 1, 'categories.php', 'cPath=&cID=70&action=delete_category&', '::1'),
(457, '2016-03-10 03:43:51', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(458, '2016-03-10 03:43:51', 1, 'categories.php', 'cPath=&', '::1'),
(459, '2016-03-10 03:43:55', 1, 'categories.php', 'cPath=&cID=75&action=delete_category&', '::1'),
(460, '2016-03-10 03:43:56', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(461, '2016-03-10 03:43:56', 1, 'categories.php', 'cPath=&', '::1'),
(462, '2016-03-10 03:43:58', 1, 'categories.php', 'cPath=&cID=71&action=delete_category&', '::1'),
(463, '2016-03-10 03:43:59', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(464, '2016-03-10 03:44:00', 1, 'categories.php', 'cPath=&', '::1'),
(465, '2016-03-10 03:44:03', 1, 'categories.php', 'cPath=&cID=69&action=delete_category&', '::1'),
(466, '2016-03-10 03:44:05', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(467, '2016-03-10 03:44:05', 1, 'categories.php', 'cPath=&', '::1'),
(468, '2016-03-10 03:44:13', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(469, '2016-03-10 03:44:19', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(470, '2016-03-10 03:44:19', 1, 'categories.php', 'cPath=&cID=76&', '::1'),
(471, '2016-03-10 03:44:22', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=76&cPath=&', '::1'),
(472, '2016-03-10 03:44:24', 1, 'categories.php', 'action=update_category_status&cPath=&cID=76&', '::1'),
(473, '2016-03-10 03:44:24', 1, 'categories.php', 'cPath=&cID=76&', '::1'),
(474, '2016-03-10 03:44:26', 1, 'categories.php', 'cPath=&cID=76&action=edit_category&', '::1'),
(475, '2016-03-10 03:44:32', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(476, '2016-03-10 03:44:33', 1, 'categories.php', 'cPath=&cID=76&', '::1'),
(477, '2016-03-10 03:44:46', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(478, '2016-03-10 03:44:53', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(479, '2016-03-10 03:44:53', 1, 'categories.php', 'cPath=&cID=77&', '::1'),
(480, '2016-03-10 03:44:56', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=77&cPath=&', '::1'),
(481, '2016-03-10 03:44:57', 1, 'categories.php', 'action=update_category_status&cPath=&cID=77&', '::1'),
(482, '2016-03-10 03:44:58', 1, 'categories.php', 'cPath=&cID=77&', '::1'),
(483, '2016-03-10 03:45:00', 1, 'categories.php', 'cPath=&cID=77&action=edit_category&', '::1'),
(484, '2016-03-10 03:45:07', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(485, '2016-03-10 03:45:07', 1, 'categories.php', 'cPath=&cID=77&', '::1'),
(486, '2016-03-10 03:45:15', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(487, '2016-03-10 03:45:29', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(488, '2016-03-10 03:45:29', 1, 'categories.php', 'cPath=&cID=78&', '::1'),
(489, '2016-03-10 03:45:32', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=78&cPath=&', '::1'),
(490, '2016-03-10 03:45:33', 1, 'categories.php', 'action=update_category_status&cPath=&cID=78&', '::1'),
(491, '2016-03-10 03:45:33', 1, 'categories.php', 'cPath=&cID=78&', '::1'),
(492, '2016-03-10 03:45:37', 1, 'categories.php', 'cPath=&cID=78&action=edit_category&', '::1'),
(493, '2016-03-10 03:45:43', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(494, '2016-03-10 03:45:43', 1, 'categories.php', 'cPath=&cID=78&', '::1'),
(495, '2016-03-10 03:45:58', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(496, '2016-03-10 03:46:04', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(497, '2016-03-10 03:46:04', 1, 'categories.php', 'cPath=&cID=79&', '::1'),
(498, '2016-03-10 03:46:06', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=79&cPath=&', '::1'),
(499, '2016-03-10 03:46:08', 1, 'categories.php', 'action=update_category_status&cPath=&cID=79&', '::1'),
(500, '2016-03-10 03:46:08', 1, 'categories.php', 'cPath=&cID=79&', '::1'),
(501, '2016-03-10 03:46:11', 1, 'categories.php', 'cPath=&cID=79&action=edit_category&', '::1'),
(502, '2016-03-10 03:46:18', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(503, '2016-03-10 03:46:18', 1, 'categories.php', 'cPath=&cID=79&', '::1'),
(504, '2016-03-10 03:46:25', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(505, '2016-03-10 03:46:34', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(506, '2016-03-10 03:46:34', 1, 'categories.php', 'cPath=&cID=80&', '::1'),
(507, '2016-03-10 03:46:36', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=80&cPath=&', '::1'),
(508, '2016-03-10 03:46:37', 1, 'categories.php', 'action=update_category_status&cPath=&cID=80&', '::1'),
(509, '2016-03-10 03:46:37', 1, 'categories.php', 'cPath=&cID=80&', '::1'),
(510, '2016-03-10 03:46:40', 1, 'categories.php', 'cPath=&cID=80&action=edit_category&', '::1'),
(511, '2016-03-10 03:46:47', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(512, '2016-03-10 03:46:47', 1, 'categories.php', 'cPath=&cID=80&', '::1'),
(513, '2016-03-10 03:46:55', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(514, '2016-03-10 03:47:02', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(515, '2016-03-10 03:47:02', 1, 'categories.php', 'cPath=&cID=81&', '::1'),
(516, '2016-03-10 03:47:05', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=81&cPath=&', '::1'),
(517, '2016-03-10 03:47:06', 1, 'categories.php', 'action=update_category_status&cPath=&cID=81&', '::1'),
(518, '2016-03-10 03:47:06', 1, 'categories.php', 'cPath=&cID=81&', '::1'),
(519, '2016-03-10 03:47:08', 1, 'categories.php', 'cPath=&cID=81&action=edit_category&', '::1'),
(520, '2016-03-10 03:47:15', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(521, '2016-03-10 03:47:15', 1, 'categories.php', 'cPath=&cID=81&', '::1'),
(522, '2016-03-10 03:47:18', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(523, '2016-03-10 03:47:22', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(524, '2016-03-10 03:47:22', 1, 'categories.php', 'cPath=&cID=82&', '::1'),
(525, '2016-03-10 03:47:24', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=82&cPath=&', '::1'),
(526, '2016-03-10 03:47:25', 1, 'categories.php', 'action=update_category_status&cPath=&cID=82&', '::1'),
(527, '2016-03-10 03:47:25', 1, 'categories.php', 'cPath=&cID=82&', '::1'),
(528, '2016-03-10 03:47:28', 1, 'categories.php', 'cPath=&cID=82&action=edit_category&', '::1'),
(529, '2016-03-10 03:47:35', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(530, '2016-03-10 03:47:35', 1, 'categories.php', 'cPath=&cID=82&', '::1'),
(531, '2016-03-10 21:51:28', 0, 'login.php ', '', '::1'),
(532, '2016-03-10 21:51:29', 0, 'login.php admin', '', '::1'),
(533, '2016-03-10 21:51:34', 1, 'define_pages_editor.php', '', '::1'),
(534, '2016-03-10 21:52:27', 1, 'define_pages_editor.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&define_it=3&action=new_page&', '::1'),
(535, '2016-03-10 21:53:59', 1, 'define_pages_editor.php', 'lngdir=english&filename=define_contact_us.php&action=save&', '::1'),
(536, '2016-03-10 21:53:59', 1, 'define_pages_editor.php', '', '::1'),
(537, '2016-03-10 21:54:09', 1, 'define_pages_editor.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&define_it=3&action=new_page&', '::1'),
(538, '2016-03-10 21:54:15', 1, 'define_pages_editor.php', 'lngdir=english&filename=define_contact_us.php&action=save&', '::1'),
(539, '2016-03-10 21:54:15', 1, 'define_pages_editor.php', '', '::1'),
(540, '2016-03-10 22:16:14', 1, 'define_pages_editor.php', '', '::1'),
(541, '2016-03-10 22:16:40', 1, 'categories.php', '', '::1'),
(542, '2016-03-10 22:17:44', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&search=hardware&', '::1'),
(543, '2016-03-10 22:17:46', 1, 'categories.php', 'cPath=1&', '::1'),
(544, '2016-03-10 22:17:53', 1, 'categories.php', 'cPath=1_9&', '::1'),
(545, '2016-03-10 22:17:58', 1, 'categories.php', 'cPath=1&cID=9&', '::1'),
(546, '2016-03-10 22:18:01', 1, 'categories.php', 'cID=1&', '::1'),
(547, '2016-03-10 22:18:06', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&search=hardware&', '::1'),
(548, '2016-03-10 22:18:08', 1, 'categories.php', 'cPath=0&cID=1&action=edit_category&search=hardware&', '::1'),
(549, '2016-03-10 22:18:10', 1, 'categories.php', 'cPath=0&cID=1&search=hardware&', '::1'),
(550, '2016-03-10 22:23:39', 1, 'categories.php', 'cID=0&', '::1'),
(551, '2016-03-10 22:23:54', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(552, '2016-03-10 22:24:07', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(553, '2016-03-10 22:24:07', 1, 'categories.php', 'cPath=&cID=83&', '::1'),
(554, '2016-03-10 22:24:18', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&search=hardware&', '::1'),
(555, '2016-03-10 22:24:20', 1, 'categories.php', 'cPath=1&', '::1'),
(556, '2016-03-10 22:24:22', 1, 'categories.php', 'cID=1&', '::1'),
(557, '2016-03-10 22:24:28', 1, 'categories.php', 'cPath=&cID=1&action=edit_category&', '::1'),
(558, '2016-03-10 22:24:37', 1, 'categories.php', 'cPath=&cID=1&', '::1'),
(559, '2016-03-10 22:24:51', 1, 'categories.php', 'cPath=83&', '::1'),
(560, '2016-03-10 22:24:52', 1, 'categories.php', 'cPath=&cID=83&action=edit_category&', '::1'),
(561, '2016-03-10 22:24:54', 1, 'categories.php', 'cID=83&', '::1'),
(562, '2016-03-10 22:24:57', 1, 'categories.php', 'cPath=&cID=83&action=edit_category&', '::1'),
(563, '2016-03-10 22:25:02', 1, 'categories.php', 'cPath=&cID=1&action=edit_category&', '::1'),
(564, '2016-03-10 22:25:27', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(565, '2016-03-10 22:25:27', 1, 'categories.php', 'cPath=&cID=83&', '::1'),
(566, '2016-03-10 22:25:38', 1, 'categories.php', 'cPath=&cID=83&action=edit_category&', '::1'),
(567, '2016-03-10 22:26:06', 1, 'categories.php', 'cPath=&cID=1&', '::1'),
(568, '2016-03-10 22:26:06', 1, 'categories.php', 'cPath=&cID=83&', '::1'),
(569, '2016-03-10 22:26:36', 1, 'categories.php', 'cPath=&cID=83&action=delete_category&', '::1'),
(570, '2016-03-10 22:26:39', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(571, '2016-03-10 22:26:39', 1, 'categories.php', 'cPath=&', '::1'),
(572, '2016-03-10 22:26:57', 1, 'categories.php', 'cPath=&cID=1&', '::1'),
(573, '2016-03-10 22:27:00', 1, 'categories.php', 'cPath=1&', '::1'),
(574, '2016-03-10 22:27:06', 1, 'categories.php', 'cID=1&', '::1'),
(575, '2016-03-10 22:27:08', 1, 'categories.php', 'cID=1&', '::1'),
(576, '2016-03-10 22:27:11', 1, 'categories.php', 'cPath=1&', '::1'),
(577, '2016-03-10 22:27:22', 1, 'categories.php', 'cID=1&', '::1'),
(578, '2016-03-10 22:27:27', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(579, '2016-03-10 22:27:36', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(580, '2016-03-10 22:27:36', 1, 'categories.php', 'cPath=&cID=84&', '::1'),
(581, '2016-03-10 22:28:12', 1, 'categories.php', 'cPath=84&', '::1'),
(582, '2016-03-10 22:28:20', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(583, '2016-03-10 22:28:27', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(584, '2016-03-10 22:28:27', 1, 'categories.php', 'cPath=84&cID=85&', '::1'),
(585, '2016-03-10 22:28:43', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(586, '2016-03-10 22:28:47', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(587, '2016-03-10 22:28:47', 1, 'categories.php', 'cPath=84&cID=86&', '::1'),
(588, '2016-03-10 22:28:49', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(589, '2016-03-10 22:28:55', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(590, '2016-03-10 22:28:55', 1, 'categories.php', 'cPath=84&cID=87&', '::1'),
(591, '2016-03-10 22:28:58', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(592, '2016-03-10 22:29:00', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(593, '2016-03-10 22:29:00', 1, 'categories.php', 'cPath=84&cID=88&', '::1'),
(594, '2016-03-10 22:29:04', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(595, '2016-03-10 22:29:07', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(596, '2016-03-10 22:29:07', 1, 'categories.php', 'cPath=84&cID=89&', '::1'),
(597, '2016-03-10 22:29:09', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(598, '2016-03-10 22:29:12', 1, 'categories.php', 'action=insert_category&cPath=84&', '::1'),
(599, '2016-03-10 22:29:13', 1, 'categories.php', 'cPath=84&cID=90&', '::1'),
(600, '2016-03-10 22:29:41', 1, 'categories.php', 'cID=84&', '::1'),
(601, '2016-03-10 22:29:45', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(602, '2016-03-10 22:29:51', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(603, '2016-03-10 22:29:51', 1, 'categories.php', 'cPath=&cID=91&', '::1'),
(604, '2016-03-10 22:30:01', 1, 'categories.php', 'cPath=84&', '::1');
INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`) VALUES
(605, '2016-03-10 22:30:05', 1, 'categories.php', 'cPath=84_85&', '::1'),
(606, '2016-03-10 22:30:07', 1, 'categories.php', 'cPath=84&cID=85&', '::1'),
(607, '2016-03-10 22:30:09', 1, 'categories.php', 'cPath=84&cID=85&action=edit_category&', '::1'),
(608, '2016-03-10 22:30:12', 1, 'categories.php', 'cPath=84&cID=85&', '::1'),
(609, '2016-03-10 22:30:15', 1, 'categories.php', 'cPath=84&cID=86&action=edit_category&', '::1'),
(610, '2016-03-10 22:30:20', 1, 'categories.php', 'action=update_category&cPath=84&', '::1'),
(611, '2016-03-10 22:30:20', 1, 'categories.php', 'cPath=84&cID=86&', '::1'),
(612, '2016-03-10 22:30:32', 1, 'categories.php', 'cPath=84&cID=87&action=edit_category&', '::1'),
(613, '2016-03-10 22:30:33', 1, 'categories.php', 'action=update_category&cPath=84&', '::1'),
(614, '2016-03-10 22:30:33', 1, 'categories.php', 'cPath=84&cID=87&', '::1'),
(615, '2016-03-10 22:30:38', 1, 'categories.php', 'cPath=84&cID=88&action=edit_category&', '::1'),
(616, '2016-03-10 22:30:41', 1, 'categories.php', 'action=update_category&cPath=84&', '::1'),
(617, '2016-03-10 22:30:41', 1, 'categories.php', 'cPath=84&cID=88&', '::1'),
(618, '2016-03-10 22:30:44', 1, 'categories.php', 'cPath=84&cID=89&action=edit_category&', '::1'),
(619, '2016-03-10 22:30:48', 1, 'categories.php', 'action=update_category&cPath=84&', '::1'),
(620, '2016-03-10 22:30:48', 1, 'categories.php', 'cPath=84&cID=89&', '::1'),
(621, '2016-03-10 22:30:51', 1, 'categories.php', 'cPath=84&cID=90&action=edit_category&', '::1'),
(622, '2016-03-10 22:30:56', 1, 'categories.php', 'action=update_category&cPath=84&', '::1'),
(623, '2016-03-10 22:30:56', 1, 'categories.php', 'cPath=84&cID=90&', '::1'),
(624, '2016-03-10 22:31:23', 1, 'categories.php', 'cID=84&', '::1'),
(625, '2016-03-10 22:31:30', 1, 'categories.php', 'cPath=91&', '::1'),
(626, '2016-03-10 22:31:34', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(627, '2016-03-10 22:31:40', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(628, '2016-03-10 22:31:40', 1, 'categories.php', 'cPath=91&cID=92&', '::1'),
(629, '2016-03-10 22:31:43', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(630, '2016-03-10 22:31:50', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(631, '2016-03-10 22:31:50', 1, 'categories.php', 'cPath=91&cID=93&', '::1'),
(632, '2016-03-10 22:31:56', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(633, '2016-03-10 22:32:00', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(634, '2016-03-10 22:32:00', 1, 'categories.php', 'cPath=91&cID=94&', '::1'),
(635, '2016-03-10 22:32:03', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(636, '2016-03-10 22:32:08', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(637, '2016-03-10 22:32:08', 1, 'categories.php', 'cPath=91&cID=95&', '::1'),
(638, '2016-03-10 22:32:10', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(639, '2016-03-10 22:32:28', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(640, '2016-03-10 22:32:28', 1, 'categories.php', 'cPath=91&cID=96&', '::1'),
(641, '2016-03-10 22:32:31', 1, 'categories.php', 'cPath=91&action=new_category&', '::1'),
(642, '2016-03-10 22:32:35', 1, 'categories.php', 'action=insert_category&cPath=91&', '::1'),
(643, '2016-03-10 22:32:36', 1, 'categories.php', 'cPath=91&cID=97&', '::1'),
(644, '2016-03-10 22:32:44', 1, 'categories.php', 'cID=91&', '::1'),
(645, '2016-03-10 22:33:06', 1, 'categories.php', 'cPath=&cID=91&action=edit_category&', '::1'),
(646, '2016-03-10 22:33:10', 1, 'categories.php', 'action=update_category&cPath=&', '::1'),
(647, '2016-03-10 22:33:10', 1, 'categories.php', 'cPath=&cID=91&', '::1'),
(648, '2016-03-10 22:33:36', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(649, '2016-03-10 22:33:44', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(650, '2016-03-10 22:33:44', 1, 'categories.php', 'cPath=&cID=98&', '::1'),
(651, '2016-03-10 22:34:05', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(652, '2016-03-10 22:34:17', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(653, '2016-03-10 22:34:17', 1, 'categories.php', 'cPath=&cID=99&', '::1'),
(654, '2016-03-10 22:34:23', 1, 'categories.php', 'cPath=99&', '::1'),
(655, '2016-03-10 22:34:25', 1, 'categories.php', 'cPath=99&action=new_category&', '::1'),
(656, '2016-03-10 22:34:33', 1, 'categories.php', 'action=insert_category&cPath=99&', '::1'),
(657, '2016-03-10 22:34:33', 1, 'categories.php', 'cPath=99&cID=100&', '::1'),
(658, '2016-03-10 22:34:35', 1, 'categories.php', 'cPath=99&action=new_category&', '::1'),
(659, '2016-03-10 22:34:41', 1, 'categories.php', 'action=insert_category&cPath=99&', '::1'),
(660, '2016-03-10 22:34:41', 1, 'categories.php', 'cPath=99&cID=101&', '::1'),
(661, '2016-03-10 22:34:43', 1, 'categories.php', 'cID=99&', '::1'),
(662, '2016-03-10 22:35:05', 1, 'categories.php', 'cPath=&action=new_category&', '::1'),
(663, '2016-03-10 22:35:11', 1, 'categories.php', 'action=insert_category&cPath=&', '::1'),
(664, '2016-03-10 22:35:11', 1, 'categories.php', 'cPath=&cID=102&', '::1'),
(665, '2016-03-10 22:36:37', 1, 'categories.php', 'cPath=&cID=1&action=delete_category&', '::1'),
(666, '2016-03-10 22:36:56', 1, 'categories.php', 'cPath=&cID=1&', '::1'),
(667, '2016-03-10 22:37:04', 1, 'categories.php', '', '::1'),
(668, '2016-03-10 22:37:12', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&reset_categories_products_sort_order=1&cID=&cPath=&pID=&page=&action=set_categories_products_sort_order&', '::1'),
(669, '2016-03-10 22:37:12', 1, 'categories.php', 'cPath=&', '::1'),
(670, '2016-03-10 22:37:15', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&reset_categories_products_sort_order=0&cID=&cPath=&pID=&page=&action=set_categories_products_sort_order&', '::1'),
(671, '2016-03-10 22:37:15', 1, 'categories.php', 'cPath=&', '::1'),
(672, '2016-03-10 22:37:22', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&cPath=1&', '::1'),
(673, '2016-03-10 22:37:52', 1, 'categories.php', 'cPath=1_4&', '::1'),
(674, '2016-03-10 22:37:59', 1, 'product.php', 'page=1&product_type=1&cPath=1_4&pID=1&action=new_product&', '::1'),
(675, '2016-03-10 22:38:08', 1, 'categories.php', 'cPath=1_4&pID=1&page=1&', '::1'),
(676, '2016-03-10 22:38:17', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&cPath=1&', '::1'),
(677, '2016-03-10 22:38:23', 1, 'categories.php', 'securityToken=c8f26900235c48f68f50f9b133f5264a&cPath=0&', '::1'),
(678, '2016-03-10 22:38:33', 1, 'categories.php', 'cPath=0&cID=1&action=delete_category&', '::1'),
(679, '2016-03-10 22:38:34', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(680, '2016-03-10 22:38:34', 1, 'categories.php', 'cPath=0&', '::1'),
(681, '2016-03-10 22:38:58', 1, 'categories.php', 'cPath=0&cID=2&action=delete_category&', '::1'),
(682, '2016-03-10 22:39:06', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(683, '2016-03-10 22:39:06', 1, 'categories.php', 'cPath=0&', '::1'),
(684, '2016-03-10 22:39:17', 1, 'categories.php', 'cPath=0&cID=3&action=delete_category&', '::1'),
(685, '2016-03-10 22:39:18', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(686, '2016-03-10 22:39:19', 1, 'categories.php', 'cPath=0&', '::1'),
(687, '2016-03-10 22:39:23', 1, 'categories.php', 'cPath=0&cID=21&action=delete_category&', '::1'),
(688, '2016-03-10 22:39:26', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(689, '2016-03-10 22:39:26', 1, 'categories.php', 'cPath=0&', '::1'),
(690, '2016-03-10 22:39:44', 1, 'categories.php', 'cPath=0&cID=64&action=delete_category&', '::1'),
(691, '2016-03-10 22:39:46', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(692, '2016-03-10 22:39:46', 1, 'categories.php', 'cPath=0&', '::1'),
(693, '2016-03-10 22:39:51', 1, 'categories.php', 'cPath=0&cID=63&action=delete_category&', '::1'),
(694, '2016-03-10 22:39:53', 1, 'categories.php', 'action=delete_category_confirm&cPath=0&', '::1'),
(695, '2016-03-10 22:39:54', 1, 'categories.php', 'cPath=0&', '::1'),
(696, '2016-03-10 22:39:56', 1, 'categories.php', 'cID=0&', '::1'),
(697, '2016-03-10 22:40:01', 1, 'categories.php', 'cPath=&cID=62&action=delete_category&', '::1'),
(698, '2016-03-10 22:40:03', 1, 'categories.php', 'cPath=&cID=62&', '::1'),
(699, '2016-03-10 22:40:08', 1, 'categories.php', 'cPath=62&', '::1'),
(700, '2016-03-10 22:40:10', 1, 'product_music.php', 'page=1&product_type=2&cPath=62&pID=166&action=new_product&', '::1'),
(701, '2016-03-10 22:40:18', 1, 'categories.php', 'cPath=62&pID=166&page=1&', '::1'),
(702, '2016-03-10 22:40:20', 1, 'categories.php', 'cID=62&', '::1'),
(703, '2016-03-10 22:40:22', 1, 'categories.php', 'cPath=&cID=62&action=delete_category&', '::1'),
(704, '2016-03-10 22:40:24', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(705, '2016-03-10 22:40:24', 1, 'categories.php', 'cPath=&', '::1'),
(706, '2016-03-10 22:40:27', 1, 'categories.php', 'cPath=&cID=54&action=delete_category&', '::1'),
(707, '2016-03-10 22:40:28', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(708, '2016-03-10 22:40:29', 1, 'categories.php', 'cPath=&', '::1'),
(709, '2016-03-10 22:40:31', 1, 'categories.php', 'cPath=&cID=53&action=delete_category&', '::1'),
(710, '2016-03-10 22:40:32', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(711, '2016-03-10 22:40:32', 1, 'categories.php', 'cPath=&', '::1'),
(712, '2016-03-10 22:40:34', 1, 'categories.php', 'cPath=&cID=50&action=delete_category&', '::1'),
(713, '2016-03-10 22:40:35', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(714, '2016-03-10 22:40:35', 1, 'categories.php', 'cPath=&', '::1'),
(715, '2016-03-10 22:40:38', 1, 'categories.php', 'cPath=&cID=49&action=delete_category&', '::1'),
(716, '2016-03-10 22:40:39', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(717, '2016-03-10 22:40:39', 1, 'categories.php', 'cPath=&', '::1'),
(718, '2016-03-10 22:40:41', 1, 'categories.php', 'cPath=&cID=48&action=delete_category&', '::1'),
(719, '2016-03-10 22:40:42', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(720, '2016-03-10 22:40:43', 1, 'categories.php', 'cPath=&', '::1'),
(721, '2016-03-10 22:40:45', 1, 'categories.php', 'cPath=&cID=33&action=delete_category&', '::1'),
(722, '2016-03-10 22:40:46', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(723, '2016-03-10 22:40:46', 1, 'categories.php', 'cPath=&', '::1'),
(724, '2016-03-10 22:40:48', 1, 'categories.php', 'cPath=&cID=24&action=delete_category&', '::1'),
(725, '2016-03-10 22:40:49', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(726, '2016-03-10 22:40:49', 1, 'categories.php', 'cPath=&', '::1'),
(727, '2016-03-10 22:40:51', 1, 'categories.php', 'cPath=&cID=25&action=delete_category&', '::1'),
(728, '2016-03-10 22:40:52', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(729, '2016-03-10 22:40:52', 1, 'categories.php', 'cPath=&', '::1'),
(730, '2016-03-10 22:40:54', 1, 'categories.php', 'cPath=&cID=28&action=delete_category&', '::1'),
(731, '2016-03-10 22:40:55', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(732, '2016-03-10 22:40:56', 1, 'categories.php', 'cPath=&', '::1'),
(733, '2016-03-10 22:40:57', 1, 'categories.php', 'cPath=&cID=23&action=delete_category&', '::1'),
(734, '2016-03-10 22:40:59', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(735, '2016-03-10 22:40:59', 1, 'categories.php', 'cPath=&', '::1'),
(736, '2016-03-10 22:41:05', 1, 'categories.php', 'cPath=&cID=22&action=delete_category&', '::1'),
(737, '2016-03-10 22:41:06', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '::1'),
(738, '2016-03-10 22:41:07', 1, 'categories.php', 'cPath=&', '::1'),
(739, '2016-03-10 23:41:33', 1, 'categories.php', 'cPath=&', '::1'),
(740, '2016-03-11 00:06:39', 0, 'login.php ', '', '::1'),
(741, '2016-03-11 00:06:40', 0, 'login.php admin', '', '::1'),
(742, '2016-03-11 00:06:45', 1, 'categories.php', '', '::1'),
(743, '2016-03-11 00:06:55', 1, 'configuration.php', 'gID=1&', '::1'),
(744, '2016-03-11 00:07:11', 1, 'configuration.php', 'gID=5&', '::1'),
(745, '2016-03-11 00:07:23', 1, 'configuration.php', 'gID=1&', '::1'),
(746, '2016-03-11 00:07:28', 1, 'configuration.php', 'gID=8&', '::1'),
(747, '2016-03-11 00:08:01', 1, 'configuration.php', 'gID=13&', '::1'),
(748, '2016-03-11 00:08:09', 1, 'configuration.php', 'gID=18&', '::1'),
(749, '2016-03-11 00:08:17', 1, 'configuration.php', 'gID=19&', '::1'),
(750, '2016-03-11 00:08:34', 1, 'configuration.php', 'gID=19&cID=418&action=edit&', '::1'),
(751, '2016-03-11 00:08:36', 1, 'configuration.php', 'gID=19&cID=418&action=save&', '::1'),
(752, '2016-03-11 00:08:36', 1, 'configuration.php', 'gID=19&cID=418&', '::1'),
(753, '2016-03-11 00:08:48', 1, 'configuration.php', 'gID=19&cID=418&action=edit&', '::1'),
(754, '2016-03-11 00:08:50', 1, 'configuration.php', 'gID=19&cID=418&action=save&', '::1'),
(755, '2016-03-11 00:08:51', 1, 'configuration.php', 'gID=19&cID=418&', '::1'),
(756, '2016-03-11 00:09:52', 1, 'configuration.php', 'gID=19&cID=420&action=edit&', '::1'),
(757, '2016-03-11 00:10:00', 1, 'configuration.php', 'gID=19&cID=420&action=save&', '::1'),
(758, '2016-03-11 00:10:00', 1, 'configuration.php', 'gID=19&cID=420&', '::1'),
(759, '2016-03-11 00:10:07', 1, 'configuration.php', 'gID=19&cID=420&action=edit&', '::1'),
(760, '2016-03-11 00:10:09', 1, 'configuration.php', 'gID=19&cID=420&action=save&', '::1'),
(761, '2016-03-11 00:10:09', 1, 'configuration.php', 'gID=19&cID=420&', '::1'),
(762, '2016-03-11 00:10:22', 1, 'template_select.php', '', '::1'),
(763, '2016-03-11 00:10:25', 1, 'layout_controller.php', '', '::1'),
(764, '2016-03-11 00:10:41', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(765, '2016-03-11 00:10:44', 1, 'layout_controller.php', 'page=&cID=98&action=edit&', '::1'),
(766, '2016-03-11 00:10:52', 1, 'layout_controller.php', 'page=&cID=98&layout_box_name=categories.php&', '::1'),
(767, '2016-03-11 00:11:04', 1, 'admin.php', '', '::1'),
(768, '2016-03-11 00:11:07', 1, 'store_manager.php', '', '::1'),
(769, '2016-03-11 00:11:14', 1, 'store_manager.php', 'action=update_all_master_categories_id&', '::1'),
(770, '2016-03-11 00:11:14', 1, 'store_manager.php', '', '::1'),
(771, '2016-03-11 00:11:23', 1, 'categories.php', '', '::1'),
(772, '2016-03-11 00:13:17', 1, 'configuration.php', 'gID=19&', '::1'),
(773, '2016-03-11 00:13:33', 1, 'configuration.php', 'gID=19&cID=420&action=edit&', '::1'),
(774, '2016-03-11 00:14:19', 1, 'configuration.php', 'gID=19&cID=414&action=edit&', '::1'),
(775, '2016-03-11 00:14:23', 1, 'configuration.php', 'gID=19&cID=414&action=save&', '::1'),
(776, '2016-03-11 00:14:23', 1, 'configuration.php', 'gID=19&cID=414&', '::1'),
(777, '2016-03-11 00:14:36', 1, 'configuration.php', 'gID=19&cID=414&action=edit&', '::1'),
(778, '2016-03-11 00:14:38', 1, 'configuration.php', 'gID=19&cID=414&action=save&', '::1'),
(779, '2016-03-11 00:14:38', 1, 'configuration.php', 'gID=19&cID=414&', '::1'),
(780, '2016-03-11 00:14:51', 1, 'configuration.php', 'gID=19&cID=419&action=edit&', '::1'),
(781, '2016-03-11 00:15:47', 1, 'configuration.php', 'gID=19&cID=417&action=edit&', '::1'),
(782, '2016-03-11 00:15:49', 1, 'configuration.php', 'gID=19&cID=417&action=save&', '::1'),
(783, '2016-03-11 00:15:49', 1, 'configuration.php', 'gID=19&cID=417&', '::1'),
(784, '2016-03-11 00:16:31', 1, 'configuration.php', 'gID=19&cID=417&action=edit&', '::1'),
(785, '2016-03-11 00:16:33', 1, 'configuration.php', 'gID=19&cID=417&action=save&', '::1'),
(786, '2016-03-11 00:16:33', 1, 'configuration.php', 'gID=19&cID=417&', '::1'),
(787, '2016-03-11 00:17:02', 1, 'configuration.php', 'gID=19&cID=438&action=edit&', '::1'),
(788, '2016-03-11 00:17:12', 1, 'configuration.php', 'gID=19&cID=438&action=save&', '::1'),
(789, '2016-03-11 00:17:12', 1, 'configuration.php', 'gID=19&cID=438&', '::1'),
(790, '2016-03-11 00:17:52', 1, 'configuration.php', 'gID=19&cID=418&action=edit&', '::1'),
(791, '2016-03-11 00:17:54', 1, 'configuration.php', 'gID=19&cID=418&action=save&', '::1'),
(792, '2016-03-11 00:17:54', 1, 'configuration.php', 'gID=19&cID=418&', '::1'),
(793, '2016-03-11 00:18:23', 1, 'configuration.php', 'gID=19&cID=435&action=edit&', '::1'),
(794, '2016-03-11 00:18:31', 1, 'configuration.php', 'gID=19&cID=435&action=save&', '::1'),
(795, '2016-03-11 00:18:31', 1, 'configuration.php', 'gID=19&cID=435&', '::1'),
(796, '2016-03-11 00:18:43', 1, 'configuration.php', 'gID=19&cID=435&action=edit&', '::1'),
(797, '2016-03-11 00:18:46', 1, 'configuration.php', 'gID=19&cID=435&action=save&', '::1'),
(798, '2016-03-11 00:18:46', 1, 'configuration.php', 'gID=19&cID=435&', '::1'),
(799, '2016-03-11 00:18:55', 1, 'configuration.php', 'gID=19&cID=433&action=edit&', '::1'),
(800, '2016-03-11 00:18:58', 1, 'configuration.php', 'gID=19&cID=433&', '::1'),
(801, '2016-03-11 00:20:04', 1, 'configuration.php', 'gID=19&cID=415&action=edit&', '::1'),
(802, '2016-03-11 00:20:06', 1, 'configuration.php', 'gID=19&cID=415&action=save&', '::1'),
(803, '2016-03-11 00:20:07', 1, 'configuration.php', 'gID=19&cID=415&', '::1'),
(804, '2016-03-11 00:20:19', 1, 'configuration.php', 'gID=19&cID=415&action=edit&', '::1'),
(805, '2016-03-11 00:20:22', 1, 'configuration.php', 'gID=19&cID=415&action=save&', '::1'),
(806, '2016-03-11 00:20:22', 1, 'configuration.php', 'gID=19&cID=415&', '::1'),
(807, '2016-03-11 00:20:52', 1, 'configuration.php', 'gID=19&cID=403&action=edit&', '::1'),
(808, '2016-03-11 00:20:56', 1, 'configuration.php', 'gID=19&cID=403&action=save&', '::1'),
(809, '2016-03-11 00:20:56', 1, 'configuration.php', 'gID=19&cID=403&', '::1'),
(810, '2016-03-11 00:21:17', 1, 'configuration.php', 'gID=19&cID=403&action=edit&', '::1'),
(811, '2016-03-11 00:21:19', 1, 'configuration.php', 'gID=19&cID=403&action=save&', '::1'),
(812, '2016-03-11 00:21:19', 1, 'configuration.php', 'gID=19&cID=403&', '::1'),
(813, '2016-03-11 00:21:22', 1, 'configuration.php', 'gID=19&cID=401&action=edit&', '::1'),
(814, '2016-03-11 00:21:41', 1, 'configuration.php', 'gID=19&cID=395&action=edit&', '::1'),
(815, '2016-03-11 00:21:57', 1, 'configuration.php', 'gID=19&cID=395&action=save&', '::1'),
(816, '2016-03-11 00:21:57', 1, 'configuration.php', 'gID=19&cID=395&', '::1'),
(817, '2016-03-11 00:22:08', 1, 'configuration.php', 'gID=19&cID=395&action=edit&', '::1'),
(818, '2016-03-11 00:22:11', 1, 'configuration.php', 'gID=19&cID=395&action=save&', '::1'),
(819, '2016-03-11 00:22:11', 1, 'configuration.php', 'gID=19&cID=395&', '::1'),
(820, '2016-03-11 00:24:33', 1, 'categories.php', '', '::1'),
(821, '2016-03-11 00:37:45', 1, 'categories.php', 'cPath=91&', '::1'),
(822, '2016-03-11 00:37:53', 1, 'categories.php', 'cID=91&', '::1'),
(823, '2016-03-11 00:37:59', 1, 'categories.php', 'cPath=84&', '::1'),
(824, '2016-03-11 00:38:00', 1, 'categories.php', 'cPath=84_85&', '::1'),
(825, '2016-03-11 00:38:10', 1, 'categories.php', 'x=41&y=10&product_type=1&cPath=84_85&action=new_product&', '::1'),
(826, '2016-03-11 00:38:10', 1, 'product.php', 'x=41&y=10&product_type=1&cPath=84_85&action=new_product&', '::1'),
(827, '2016-03-11 00:43:54', 1, 'product.php', 'cPath=84_85&product_type=1&action=new_product_preview&', '::1'),
(828, '2016-03-11 00:44:15', 1, 'categories.php', '', '::1'),
(829, '2016-03-11 00:44:18', 1, 'categories.php', 'cPath=84&', '::1'),
(830, '2016-03-11 00:44:19', 1, 'categories.php', 'cPath=84_85&', '::1'),
(831, '2016-03-11 00:44:26', 1, 'categories.php', 'x=40&y=13&product_type=1&cPath=84_85&action=new_product&', '::1'),
(832, '2016-03-11 00:44:26', 1, 'product.php', 'x=40&y=13&product_type=1&cPath=84_85&action=new_product&', '::1'),
(833, '2016-03-11 00:45:29', 1, 'categories.php', 'cPath=84_85&', '::1'),
(834, '2016-03-11 00:45:32', 1, 'categories.php', 'cPath=84&cID=85&', '::1'),
(835, '2016-03-11 00:45:35', 1, 'categories.php', 'cID=84&', '::1'),
(836, '2016-03-11 00:45:43', 1, 'product_types.php', '', '::1'),
(837, '2016-03-11 00:45:48', 1, 'categories.php', '', '::1'),
(838, '2016-03-11 00:45:52', 1, 'categories.php', 'cPath=84&', '::1'),
(839, '2016-03-11 00:45:56', 1, 'categories.php', 'cPath=84_85&', '::1'),
(840, '2016-03-11 00:46:03', 1, 'categories.php', 'x=4&y=10&product_type=1&cPath=84_85&action=new_product&', '::1'),
(841, '2016-03-11 00:46:04', 1, 'product.php', 'x=4&y=10&product_type=1&cPath=84_85&action=new_product&', '::1'),
(842, '2016-03-11 00:47:28', 1, 'configuration.php', 'gID=1&', '::1'),
(843, '2016-03-11 00:47:43', 1, 'configuration.php', 'gID=1&cID=24&action=edit&', '::1'),
(844, '2016-03-11 00:47:47', 1, 'configuration.php', 'gID=1&cID=24&', '::1'),
(845, '2016-03-11 00:48:06', 1, 'categories.php', '', '::1'),
(846, '2016-03-11 00:48:15', 1, 'categories.php', 'cPath=&cID=84&action=edit_category&', '::1'),
(847, '2016-03-11 00:48:30', 1, 'categories.php', 'cPath=&cID=84&', '::1'),
(848, '2016-03-11 00:49:13', 1, 'categories.php', 'cPath=84&', '::1'),
(849, '2016-03-11 00:49:15', 1, 'categories.php', 'cPath=84_85&', '::1'),
(850, '2016-03-11 00:49:16', 1, 'categories.php', 'x=35&y=4&product_type=1&cPath=84_85&action=new_product&', '::1'),
(851, '2016-03-11 00:49:16', 1, 'product.php', 'x=35&y=4&product_type=1&cPath=84_85&action=new_product&', '::1'),
(852, '2016-03-11 00:49:51', 1, 'product.php', 'cPath=84_85&product_type=1&action=new_product_preview&', '::1'),
(853, '2016-03-11 00:49:56', 1, 'product.php', 'cPath=84_85&product_type=1&action=insert_product&', '::1'),
(854, '2016-03-11 00:49:56', 1, 'categories.php', 'cPath=84_85&pID=180&', '::1'),
(855, '2016-03-11 00:50:20', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=180&action=new_product&', '::1'),
(856, '2016-03-11 00:51:51', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=new_product_preview&page=1&', '::1'),
(857, '2016-03-11 00:51:54', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=update_product&page=1&', '::1'),
(858, '2016-03-11 00:51:54', 1, 'categories.php', 'cPath=84_85&pID=180&page=1&', '::1'),
(859, '2016-03-11 00:52:43', 1, 'options_values_manager.php', '', '::1'),
(860, '2016-03-11 00:52:43', 1, 'attributes_controller.php', '', '::1'),
(861, '2016-03-11 00:52:52', 1, 'configuration.php', 'gID=19&', '::1'),
(862, '2016-03-11 00:53:31', 1, 'options_values_manager.php', 'value_page=2&', '::1'),
(863, '2016-03-11 00:53:35', 1, 'options_values_manager.php', 'value_page=3&', '::1'),
(864, '2016-03-11 00:53:38', 1, 'options_values_manager.php', 'value_page=4&', '::1'),
(865, '2016-03-11 00:53:39', 1, 'options_values_manager.php', 'value_page=5&', '::1'),
(866, '2016-03-11 00:53:40', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(867, '2016-03-11 00:53:44', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(868, '2016-03-11 00:53:55', 1, 'attributes_controller.php', 'securityToken=74b20e3495f1b17f527b1622baa20a16&current_category_id=85&products_filter=&action=new_cat&', '::1'),
(869, '2016-03-11 00:53:55', 1, 'attributes_controller.php', 'products_filter=180&current_category_id=85&', '::1'),
(870, '2016-03-11 00:54:33', 1, 'configuration.php', 'gID=19&cID=435&action=edit&', '::1'),
(871, '2016-03-11 00:54:43', 1, 'configuration.php', 'gID=19&cID=435&', '::1'),
(872, '2016-03-11 00:55:52', 1, 'banner_manager.php', '', '::1'),
(873, '2016-03-11 00:55:56', 1, 'banner_manager.php', 'page=1&bID=14&action=setflag&flag=0&', '::1'),
(874, '2016-03-11 00:55:56', 1, 'banner_manager.php', 'page=1&bID=14&', '::1'),
(875, '2016-03-11 00:58:50', 1, 'configuration.php', 'gID=1&', '::1'),
(876, '2016-03-11 00:59:10', 1, 'configuration.php', 'gID=9&', '::1'),
(877, '2016-03-11 00:59:14', 1, 'configuration.php', 'gID=9&cID=226&action=edit&', '::1'),
(878, '2016-03-11 00:59:17', 1, 'configuration.php', 'gID=9&cID=226&action=save&', '::1'),
(879, '2016-03-11 00:59:17', 1, 'configuration.php', 'gID=9&cID=226&', '::1'),
(880, '2016-03-11 00:59:24', 1, 'configuration.php', 'gID=9&cID=226&action=edit&', '::1'),
(881, '2016-03-11 00:59:26', 1, 'configuration.php', 'gID=9&cID=226&action=save&', '::1'),
(882, '2016-03-11 00:59:26', 1, 'configuration.php', 'gID=9&cID=226&', '::1'),
(883, '2016-03-11 00:59:33', 1, 'configuration.php', 'gID=9&cID=232&action=edit&', '::1'),
(884, '2016-03-11 00:59:35', 1, 'configuration.php', 'gID=9&cID=232&action=save&', '::1'),
(885, '2016-03-11 00:59:35', 1, 'configuration.php', 'gID=9&cID=232&', '::1'),
(886, '2016-03-11 00:59:56', 1, 'configuration.php', 'gID=9&cID=226&action=edit&', '::1'),
(887, '2016-03-11 00:59:58', 1, 'configuration.php', 'gID=9&cID=226&action=save&', '::1'),
(888, '2016-03-11 00:59:58', 1, 'configuration.php', 'gID=9&cID=226&', '::1'),
(889, '2016-03-11 01:01:02', 1, 'configuration.php', 'gID=19&', '::1'),
(890, '2016-03-11 01:01:19', 1, 'configuration.php', 'gID=1&', '::1'),
(891, '2016-03-11 01:02:01', 1, 'store_manager.php', '', '::1'),
(892, '2016-03-11 01:03:32', 1, 'configuration.php', 'gID=21&', '::1'),
(893, '2016-03-11 01:03:40', 1, 'configuration.php', 'gID=21&cID=463&action=edit&', '::1'),
(894, '2016-03-11 01:04:04', 1, 'configuration.php', 'gID=21&cID=463&action=save&', '::1'),
(895, '2016-03-11 01:04:04', 1, 'configuration.php', 'gID=21&cID=463&', '::1'),
(896, '2016-03-11 01:04:39', 1, 'product_types.php', '', '::1'),
(897, '2016-03-11 01:04:42', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(898, '2016-03-11 01:04:45', 1, 'product_types.php', 'ptID=1&cID=10&action=layout_edit&', '::1'),
(899, '2016-03-11 01:04:48', 1, 'product_types.php', 'ptID=1&cID=10&action=layout_save&', '::1'),
(900, '2016-03-11 01:04:48', 1, 'product_types.php', 'gID=&cID=10&ptID=1&action=layout&', '::1'),
(901, '2016-03-11 01:05:30', 1, 'categories.php', '', '::1'),
(902, '2016-03-11 01:06:06', 1, 'categories.php', 'cPath=84&', '::1'),
(903, '2016-03-11 01:06:08', 1, 'categories.php', 'cPath=84_85&', '::1'),
(904, '2016-03-11 01:06:17', 1, 'categories.php', 'x=53&y=14&product_type=1&cPath=84_85&action=new_product&', '::1'),
(905, '2016-03-11 01:06:17', 1, 'product.php', 'x=53&y=14&product_type=1&cPath=84_85&action=new_product&', '::1'),
(906, '2016-03-11 01:07:34', 1, 'product.php', 'cPath=84_85&product_type=1&action=new_product_preview&', '::1'),
(907, '2016-03-11 01:07:36', 1, 'product.php', 'cPath=84_85&product_type=1&action=insert_product&', '::1'),
(908, '2016-03-11 01:07:36', 1, 'categories.php', 'cPath=84_85&pID=181&', '::1'),
(909, '2016-03-11 01:08:50', 1, 'store_manager.php', '', '::1'),
(910, '2016-03-11 01:08:53', 1, 'configuration.php', 'gID=1&', '::1'),
(911, '2016-03-11 01:08:58', 1, 'configuration.php', 'gID=19&', '::1'),
(912, '2016-03-11 01:10:00', 1, 'product_types.php', '', '::1'),
(913, '2016-03-11 01:10:05', 1, 'product_types.php', 'page=1&ptID=1&action=edit&', '::1'),
(914, '2016-03-11 01:10:12', 1, 'product_types.php', 'page=1&ptID=1&', '::1'),
(915, '2016-03-11 01:10:14', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(916, '2016-03-11 01:11:18', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(917, '2016-03-11 01:11:40', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=new_product_preview&page=1&', '::1'),
(918, '2016-03-11 01:11:43', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=update_product&page=1&', '::1'),
(919, '2016-03-11 01:11:43', 1, 'categories.php', 'cPath=84_85&pID=181&page=1&', '::1'),
(920, '2016-03-11 01:11:52', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(921, '2016-03-11 01:12:04', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=new_product_preview&page=1&', '::1'),
(922, '2016-03-11 01:12:05', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=update_product&page=1&', '::1'),
(923, '2016-03-11 01:12:05', 1, 'categories.php', 'cPath=84_85&pID=181&page=1&', '::1'),
(924, '2016-03-11 01:13:04', 1, 'product_types.php', '', '::1'),
(925, '2016-03-11 01:13:07', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(926, '2016-03-11 01:13:18', 1, 'configuration.php', 'gID=1&', '::1'),
(927, '2016-03-11 01:13:30', 1, 'configuration.php', 'gID=18&', '::1'),
(928, '2016-03-11 01:13:47', 1, 'configuration.php', 'gID=47&', '::1'),
(929, '2016-03-11 01:13:54', 1, 'configuration.php', 'gID=47&cID=603&action=edit&', '::1'),
(930, '2016-03-11 01:13:57', 1, 'configuration.php', 'gID=47&cID=603&', '::1'),
(931, '2016-03-11 01:14:02', 1, 'store_manager.php', '', '::1'),
(932, '2016-03-11 01:23:10', 1, 'configuration.php', 'gID=8&', '::1'),
(933, '2016-03-11 01:23:15', 1, 'configuration.php', 'gID=8&cID=210&action=edit&', '::1'),
(934, '2016-03-11 01:23:25', 1, 'configuration.php', 'gID=8&cID=217&action=edit&', '::1'),
(935, '2016-03-11 01:23:33', 1, 'configuration.php', 'gID=8&cID=217&action=save&', '::1'),
(936, '2016-03-11 01:23:33', 1, 'configuration.php', 'gID=8&cID=217&', '::1'),
(937, '2016-03-11 01:23:41', 1, 'configuration.php', 'gID=8&cID=217&action=edit&', '::1'),
(938, '2016-03-11 01:23:43', 1, 'configuration.php', 'gID=8&cID=217&action=save&', '::1'),
(939, '2016-03-11 01:23:43', 1, 'configuration.php', 'gID=8&cID=217&', '::1'),
(940, '2016-03-11 01:23:49', 1, 'configuration.php', 'gID=8&cID=217&action=edit&', '::1'),
(941, '2016-03-11 01:23:52', 1, 'configuration.php', 'gID=8&cID=217&action=save&', '::1'),
(942, '2016-03-11 01:23:52', 1, 'configuration.php', 'gID=8&cID=217&', '::1'),
(943, '2016-03-11 01:24:42', 1, 'store_manager.php', '', '::1'),
(944, '2016-03-11 01:24:55', 1, 'configuration.php', 'gID=19&', '::1'),
(945, '2016-03-11 01:25:04', 1, 'configuration.php', 'gID=1&', '::1'),
(946, '2016-03-11 01:25:09', 1, 'configuration.php', 'gID=1&cID=10&action=edit&', '::1'),
(947, '2016-03-11 01:25:11', 1, 'configuration.php', 'gID=1&cID=10&action=save&', '::1'),
(948, '2016-03-11 01:25:11', 1, 'configuration.php', 'gID=1&cID=10&', '::1'),
(949, '2016-03-11 01:26:15', 1, 'attributes_controller.php', '', '::1'),
(950, '2016-03-11 01:26:20', 1, 'attributes_controller.php', 'securityToken=74b20e3495f1b17f527b1622baa20a16&current_category_id=85&products_filter=&action=new_cat&', '::1'),
(951, '2016-03-11 01:26:20', 1, 'attributes_controller.php', 'products_filter=181&current_category_id=85&', '::1'),
(952, '2016-03-11 01:26:26', 1, 'product_types.php', '', '::1'),
(953, '2016-03-11 01:26:27', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(954, '2016-03-11 01:26:44', 1, 'product_types.php', 'ptID=1&cID=104&action=layout_edit&', '::1'),
(955, '2016-03-11 01:27:02', 1, 'configuration.php', 'gID=8&', '::1'),
(956, '2016-03-11 01:27:26', 1, 'configuration.php', 'gID=13&', '::1'),
(957, '2016-03-11 01:27:43', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=180&action=new_product&', '::1'),
(958, '2016-03-11 01:28:12', 1, 'options_name_manager.php', '', '::1'),
(959, '2016-03-11 01:28:22', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(960, '2016-03-11 01:28:58', 1, 'options_values_manager.php', '', '::1'),
(961, '2016-03-11 01:29:03', 1, 'options_values_manager.php', 'value_page=2&', '::1'),
(962, '2016-03-11 01:29:07', 1, 'options_values_manager.php', 'value_page=3&', '::1'),
(963, '2016-03-11 01:29:09', 1, 'options_values_manager.php', 'value_page=4&', '::1'),
(964, '2016-03-11 01:29:10', 1, 'options_values_manager.php', 'value_page=5&', '::1'),
(965, '2016-03-11 01:29:11', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(966, '2016-03-11 01:29:12', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(967, '2016-03-11 01:29:28', 1, 'categories.php', '', '::1'),
(968, '2016-03-11 01:29:29', 1, 'product_types.php', '', '::1'),
(969, '2016-03-11 01:29:31', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(970, '2016-03-11 01:29:35', 1, 'product_types.php', 'ptID=1&cID=1&action=layout_edit&', '::1'),
(971, '2016-03-11 01:29:39', 1, 'configuration.php', 'gID=1&', '::1'),
(972, '2016-03-11 01:29:49', 1, 'configuration.php', 'gID=8&', '::1'),
(973, '2016-03-11 01:29:53', 1, 'configuration.php', 'gID=8&cID=209&action=edit&', '::1'),
(974, '2016-03-11 01:29:56', 1, 'configuration.php', 'gID=8&cID=209&', '::1'),
(975, '2016-03-11 01:30:11', 1, 'configuration.php', 'gID=8&cID=219&action=edit&', '::1'),
(976, '2016-03-11 01:31:09', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=180&action=new_product&', '::1'),
(977, '2016-03-11 01:31:12', 1, 'categories.php', '', '::1'),
(978, '2016-03-11 01:31:16', 1, 'categories.php', 'securityToken=74b20e3495f1b17f527b1622baa20a16&cPath=85&', '::1'),
(979, '2016-03-11 01:31:18', 1, 'categories.php', 'x=85&y=8&product_type=1&cPath=85&action=new_product&', '::1'),
(980, '2016-03-11 01:31:18', 1, 'product.php', 'x=85&y=8&product_type=1&cPath=85&action=new_product&', '::1'),
(981, '2016-03-11 01:33:59', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(982, '2016-03-11 01:34:01', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(983, '2016-03-11 01:34:01', 1, 'categories.php', 'cPath=85&pID=182&', '::1'),
(984, '2016-03-11 01:34:23', 1, 'product.php', 'cPath=85&product_type=1&pID=181&action=copy_to&', '::1'),
(985, '2016-03-11 01:34:31', 1, 'categories.php', 'cPath=85&pID=181&page=1&', '::1'),
(986, '2016-03-11 01:34:35', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=182&action=new_product&', '::1'),
(987, '2016-03-11 01:34:54', 1, 'categories.php', 'cPath=85&pID=182&page=1&', '::1'),
(988, '2016-03-11 01:35:08', 1, 'categories.php', 'x=67&y=5&product_type=1&cPath=85&action=new_product&', '::1'),
(989, '2016-03-11 01:35:08', 1, 'product.php', 'x=67&y=5&product_type=1&cPath=85&action=new_product&', '::1'),
(990, '2016-03-11 01:36:32', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(991, '2016-03-11 01:36:33', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(992, '2016-03-11 01:36:33', 1, 'categories.php', 'cPath=85&pID=183&', '::1'),
(993, '2016-03-11 01:37:45', 1, 'categories.php', 'x=35&y=13&product_type=1&cPath=85&action=new_product&', '::1'),
(994, '2016-03-11 01:37:45', 1, 'product.php', 'x=35&y=13&product_type=1&cPath=85&action=new_product&', '::1'),
(995, '2016-03-11 01:38:38', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(996, '2016-03-11 01:38:40', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(997, '2016-03-11 01:38:40', 1, 'categories.php', 'cPath=85&pID=184&', '::1'),
(998, '2016-03-11 01:40:39', 1, 'categories.php', 'x=52&y=6&product_type=1&cPath=85&action=new_product&', '::1'),
(999, '2016-03-11 01:40:39', 1, 'product.php', 'x=52&y=6&product_type=1&cPath=85&action=new_product&', '::1'),
(1000, '2016-03-11 01:42:09', 1, 'categories.php', 'cPath=85&', '::1'),
(1001, '2016-03-11 01:42:11', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1002, '2016-03-11 01:42:16', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1003, '2016-03-11 01:42:17', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1004, '2016-03-11 01:42:17', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1005, '2016-03-11 01:42:30', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1006, '2016-03-11 01:42:49', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1007, '2016-03-11 01:42:51', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1008, '2016-03-11 01:42:52', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1009, '2016-03-11 01:43:05', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1010, '2016-03-11 01:43:44', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1011, '2016-03-11 01:44:12', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1012, '2016-03-11 01:44:12', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1013, '2016-03-11 01:44:21', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1014, '2016-03-11 01:44:37', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1015, '2016-03-11 01:44:38', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1016, '2016-03-11 01:44:38', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1017, '2016-03-11 01:44:48', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=183&action=new_product&', '::1'),
(1018, '2016-03-11 01:44:56', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=new_product_preview&page=1&', '::1'),
(1019, '2016-03-11 01:44:57', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=update_product&page=1&', '::1'),
(1020, '2016-03-11 01:44:57', 1, 'categories.php', 'cPath=85&pID=183&page=1&', '::1'),
(1021, '2016-03-11 01:45:21', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1022, '2016-03-11 01:45:34', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1023, '2016-03-11 01:45:35', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1024, '2016-03-11 01:45:35', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1025, '2016-03-11 01:45:56', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=183&action=new_product&', '::1'),
(1026, '2016-03-11 01:46:00', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=new_product_preview&page=1&', '::1'),
(1027, '2016-03-11 01:46:02', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=update_product&page=1&', '::1'),
(1028, '2016-03-11 01:46:02', 1, 'categories.php', 'cPath=85&pID=183&page=1&', '::1'),
(1029, '2016-03-11 01:46:13', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=183&action=new_product&', '::1'),
(1030, '2016-03-11 01:46:59', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=new_product_preview&page=1&', '::1'),
(1031, '2016-03-11 01:47:00', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=update_product&page=1&', '::1'),
(1032, '2016-03-11 01:47:00', 1, 'categories.php', 'cPath=85&pID=183&page=1&', '::1'),
(1033, '2016-03-11 01:47:06', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1034, '2016-03-11 01:47:36', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1035, '2016-03-11 01:47:37', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1036, '2016-03-11 01:47:37', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1037, '2016-03-11 01:47:43', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1038, '2016-03-11 01:47:50', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1039, '2016-03-11 01:47:51', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1040, '2016-03-11 01:47:51', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1041, '2016-03-11 01:47:58', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1042, '2016-03-11 01:48:17', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1043, '2016-03-11 01:48:18', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1044, '2016-03-11 01:48:18', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1045, '2016-03-11 01:48:31', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=184&action=new_product&', '::1'),
(1046, '2016-03-11 01:49:10', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=new_product_preview&page=1&', '::1'),
(1047, '2016-03-11 01:49:13', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=update_product&page=1&', '::1'),
(1048, '2016-03-11 01:49:13', 1, 'categories.php', 'cPath=85&pID=184&page=1&', '::1'),
(1049, '2016-03-11 01:49:49', 1, 'categories.php', 'x=30&y=6&product_type=1&cPath=85&action=new_product&', '::1'),
(1050, '2016-03-11 01:49:49', 1, 'product.php', 'x=30&y=6&product_type=1&cPath=85&action=new_product&', '::1'),
(1051, '2016-03-11 01:51:15', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1052, '2016-03-11 01:51:16', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1053, '2016-03-11 01:51:16', 1, 'categories.php', 'cPath=85&pID=185&', '::1'),
(1054, '2016-03-11 01:52:08', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=185&action=new_product&', '::1'),
(1055, '2016-03-11 01:52:27', 1, 'product.php', 'cPath=85&product_type=1&pID=185&action=new_product_preview&page=1&', '::1'),
(1056, '2016-03-11 01:52:28', 1, 'product.php', 'cPath=85&product_type=1&pID=185&action=update_product&page=1&', '::1'),
(1057, '2016-03-11 01:52:28', 1, 'categories.php', 'cPath=85&pID=185&page=1&', '::1'),
(1058, '2016-03-11 01:52:52', 1, 'categories.php', 'x=65&y=9&product_type=1&cPath=85&action=new_product&', '::1'),
(1059, '2016-03-11 01:52:52', 1, 'product.php', 'x=65&y=9&product_type=1&cPath=85&action=new_product&', '::1'),
(1060, '2016-03-11 01:54:17', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1061, '2016-03-11 01:54:18', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1062, '2016-03-11 01:54:18', 1, 'categories.php', 'cPath=85&pID=186&', '::1'),
(1063, '2016-03-11 01:58:59', 1, 'categories.php', 'x=65&y=14&product_type=1&cPath=85&action=new_product&', '::1'),
(1064, '2016-03-11 01:58:59', 1, 'product.php', 'x=65&y=14&product_type=1&cPath=85&action=new_product&', '::1'),
(1065, '2016-03-11 02:01:44', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1066, '2016-03-11 02:01:45', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1067, '2016-03-11 02:01:45', 1, 'categories.php', 'cPath=85&pID=187&', '::1'),
(1068, '2016-03-11 02:02:26', 1, 'categories.php', 'x=50&y=12&product_type=1&cPath=85&action=new_product&', '::1'),
(1069, '2016-03-11 02:02:26', 1, 'product.php', 'x=50&y=12&product_type=1&cPath=85&action=new_product&', '::1'),
(1070, '2016-03-11 02:02:41', 1, 'categories.php', '', '::1'),
(1071, '2016-03-11 02:02:45', 1, 'categories.php', 'securityToken=74b20e3495f1b17f527b1622baa20a16&cPath=85&', '::1'),
(1072, '2016-03-11 02:02:53', 1, 'categories.php', 'x=53&y=21&product_type=1&cPath=85&action=new_product&', '::1'),
(1073, '2016-03-11 02:02:53', 1, 'product.php', 'x=53&y=21&product_type=1&cPath=85&action=new_product&', '::1'),
(1074, '2016-03-11 02:04:05', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1075, '2016-03-11 02:04:07', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1076, '2016-03-11 02:04:07', 1, 'categories.php', 'cPath=85&pID=188&', '::1'),
(1077, '2016-03-11 02:06:45', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=187&action=new_product&', '::1'),
(1078, '2016-03-11 02:07:01', 1, 'product.php', 'cPath=85&product_type=1&pID=187&action=new_product_preview&page=1&', '::1'),
(1079, '2016-03-11 02:07:03', 1, 'product.php', 'cPath=85&product_type=1&pID=187&action=update_product&page=1&', '::1'),
(1080, '2016-03-11 02:07:03', 1, 'categories.php', 'cPath=85&pID=187&page=1&', '::1'),
(1081, '2016-03-11 02:07:03', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=delete_product&', '::1'),
(1082, '2016-03-11 02:07:48', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=188&action=new_product&', '::1'),
(1083, '2016-03-11 02:08:11', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=new_product_preview&page=1&', '::1'),
(1084, '2016-03-11 02:08:13', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=update_product&page=1&', '::1'),
(1085, '2016-03-11 02:08:13', 1, 'categories.php', 'cPath=85&pID=188&page=1&', '::1'),
(1086, '2016-03-11 02:09:36', 1, 'categories.php', 'x=47&y=4&product_type=1&cPath=85&action=new_product&', '::1'),
(1087, '2016-03-11 02:09:36', 1, 'product.php', 'x=47&y=4&product_type=1&cPath=85&action=new_product&', '::1'),
(1088, '2016-03-11 02:11:22', 0, 'login.php ', '', '::1'),
(1089, '2016-03-11 02:11:23', 0, 'login.php admin', '', '::1'),
(1090, '2016-03-11 02:11:26', 1, 'categories.php', '', '::1'),
(1091, '2016-03-11 02:11:30', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1092, '2016-03-11 02:11:45', 1, 'categories.php', 'x=38&y=5&product_type=1&cPath=85&action=new_product&', '::1'),
(1093, '2016-03-11 02:11:45', 1, 'product.php', 'x=38&y=5&product_type=1&cPath=85&action=new_product&', '::1'),
(1094, '2016-03-11 02:12:23', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1095, '2016-03-11 02:12:24', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1096, '2016-03-11 02:12:25', 1, 'categories.php', 'cPath=85&pID=189&', '::1'),
(1097, '2016-03-11 02:14:37', 1, 'categories.php', 'x=81&y=8&product_type=1&cPath=85&action=new_product&', '::1'),
(1098, '2016-03-11 02:14:37', 1, 'product.php', 'x=81&y=8&product_type=1&cPath=85&action=new_product&', '::1'),
(1099, '2016-03-11 02:15:24', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1100, '2016-03-11 02:15:26', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1101, '2016-03-11 02:15:26', 1, 'categories.php', 'cPath=85&pID=190&', '::1'),
(1102, '2016-03-11 02:15:26', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=183&action=new_product&', '::1'),
(1103, '2016-03-11 02:15:28', 1, 'categories.php', 'cPath=85&pID=183&page=1&', '::1'),
(1104, '2016-03-11 02:16:02', 1, 'categories.php', 'x=64&y=17&product_type=1&cPath=85&action=new_product&', '::1'),
(1105, '2016-03-11 02:16:02', 1, 'product.php', 'x=64&y=17&product_type=1&cPath=85&action=new_product&', '::1'),
(1106, '2016-03-11 02:16:49', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1107, '2016-03-11 02:16:50', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1108, '2016-03-11 02:16:50', 1, 'categories.php', 'cPath=85&pID=191&', '::1'),
(1109, '2016-03-11 02:17:31', 1, 'categories.php', 'cPath=85&page=1&', '::1'),
(1110, '2016-03-11 02:17:44', 1, 'categories.php', 'x=85&y=15&product_type=1&cPath=85&action=new_product&', '::1'),
(1111, '2016-03-11 02:17:44', 1, 'product.php', 'x=85&y=15&product_type=1&cPath=85&action=new_product&', '::1'),
(1112, '2016-03-11 02:18:39', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1113, '2016-03-11 02:18:41', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1114, '2016-03-11 02:18:41', 1, 'categories.php', 'cPath=85&pID=192&', '::1'),
(1115, '2016-03-11 02:19:05', 1, 'categories.php', 'x=90&y=13&product_type=1&cPath=85&action=new_product&', '::1'),
(1116, '2016-03-11 02:19:05', 1, 'product.php', 'x=90&y=13&product_type=1&cPath=85&action=new_product&', '::1'),
(1117, '2016-03-11 02:19:06', 1, 'categories.php', 'cPath=85&pID=192&', '::1'),
(1118, '2016-03-11 02:19:11', 1, 'categories.php', 'cPath=85&page=2&', '::1'),
(1119, '2016-03-11 02:19:13', 1, 'categories.php', 'x=74&y=12&product_type=1&cPath=85&action=new_product&', '::1'),
(1120, '2016-03-11 02:19:13', 1, 'product.php', 'x=74&y=12&product_type=1&cPath=85&action=new_product&', '::1'),
(1121, '2016-03-11 02:20:16', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1122, '2016-03-11 02:20:18', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1123, '2016-03-11 02:20:18', 1, 'categories.php', 'cPath=85&pID=193&', '::1'),
(1124, '2016-03-11 02:21:26', 1, 'categories.php', 'cPath=85&page=2&', '::1'),
(1125, '2016-03-11 02:21:35', 1, 'categories.php', 'x=65&y=3&product_type=1&cPath=85&action=new_product&', '::1'),
(1126, '2016-03-11 02:21:35', 1, 'product.php', 'x=65&y=3&product_type=1&cPath=85&action=new_product&', '::1'),
(1127, '2016-03-11 02:22:17', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1128, '2016-03-11 02:22:19', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1129, '2016-03-11 02:22:19', 1, 'categories.php', 'cPath=85&pID=194&', '::1'),
(1130, '2016-03-11 02:22:57', 1, 'categories.php', 'cPath=85&page=2&', '::1'),
(1131, '2016-03-11 02:23:05', 1, 'categories.php', 'cPath=85&page=1&', '::1'),
(1132, '2016-03-11 02:23:23', 1, 'categories.php', 'x=92&y=11&product_type=1&cPath=85&action=new_product&', '::1'),
(1133, '2016-03-11 02:23:24', 1, 'product.php', 'x=92&y=11&product_type=1&cPath=85&action=new_product&', '::1'),
(1134, '2016-03-11 02:24:19', 1, 'product.php', 'cPath=85&product_type=1&action=new_product_preview&', '::1'),
(1135, '2016-03-11 02:24:20', 1, 'product.php', 'cPath=85&product_type=1&action=insert_product&', '::1'),
(1136, '2016-03-11 02:24:21', 1, 'categories.php', 'cPath=85&pID=195&', '::1'),
(1137, '2016-03-11 02:26:00', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=86&', '::1'),
(1138, '2016-03-11 02:26:02', 1, 'categories.php', 'x=63&y=17&product_type=1&cPath=86&action=new_product&', '::1'),
(1139, '2016-03-11 02:26:02', 1, 'product.php', 'x=63&y=17&product_type=1&cPath=86&action=new_product&', '::1'),
(1140, '2016-03-11 02:26:54', 1, 'product.php', 'cPath=86&product_type=1&action=new_product_preview&', '::1'),
(1141, '2016-03-11 02:26:56', 1, 'product.php', 'cPath=86&product_type=1&action=insert_product&', '::1'),
(1142, '2016-03-11 02:26:56', 1, 'categories.php', 'cPath=86&pID=196&', '::1'),
(1143, '2016-03-11 02:27:56', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1144, '2016-03-11 02:27:59', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&page=2&', '::1'),
(1145, '2016-03-11 02:28:03', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&page=1&', '::1'),
(1146, '2016-03-11 02:28:19', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=192&action=new_product&', '::1'),
(1147, '2016-03-11 02:28:24', 1, 'product.php', 'cPath=85&product_type=1&pID=192&action=new_product_preview&page=1&', '::1');
INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`) VALUES
(1148, '2016-03-11 02:28:26', 1, 'product.php', 'cPath=85&product_type=1&pID=192&action=update_product&page=1&', '::1'),
(1149, '2016-03-11 02:28:26', 1, 'categories.php', 'cPath=85&pID=192&page=1&', '::1'),
(1150, '2016-03-11 02:29:09', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=193&action=new_product&', '::1'),
(1151, '2016-03-11 02:29:16', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=new_product_preview&page=1&', '::1'),
(1152, '2016-03-11 02:29:17', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=update_product&page=1&', '::1'),
(1153, '2016-03-11 02:29:17', 1, 'categories.php', 'cPath=85&pID=193&page=1&', '::1'),
(1154, '2016-03-11 02:29:37', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=193&action=new_product&', '::1'),
(1155, '2016-03-11 02:29:56', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=new_product_preview&page=1&', '::1'),
(1156, '2016-03-11 02:29:57', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=update_product&page=1&', '::1'),
(1157, '2016-03-11 02:29:57', 1, 'categories.php', 'cPath=85&pID=193&page=1&', '::1'),
(1158, '2016-03-11 02:30:16', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=193&action=new_product&', '::1'),
(1159, '2016-03-11 02:30:19', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=new_product_preview&page=1&', '::1'),
(1160, '2016-03-11 02:30:21', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=update_product&page=1&', '::1'),
(1161, '2016-03-11 02:30:21', 1, 'categories.php', 'cPath=85&pID=193&page=1&', '::1'),
(1162, '2016-03-11 02:30:25', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=193&action=new_product&', '::1'),
(1163, '2016-03-11 02:30:38', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=new_product_preview&page=1&', '::1'),
(1164, '2016-03-11 02:30:40', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=update_product&page=1&', '::1'),
(1165, '2016-03-11 02:30:40', 1, 'categories.php', 'cPath=85&pID=193&page=1&', '::1'),
(1166, '2016-03-11 02:31:17', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=194&action=new_product&', '::1'),
(1167, '2016-03-11 02:31:33', 1, 'product.php', 'cPath=85&product_type=1&pID=194&action=new_product_preview&page=1&', '::1'),
(1168, '2016-03-11 02:31:34', 1, 'product.php', 'cPath=85&product_type=1&pID=194&action=update_product&page=1&', '::1'),
(1169, '2016-03-11 02:31:34', 1, 'categories.php', 'cPath=85&pID=194&page=1&', '::1'),
(1170, '2016-03-11 02:31:56', 1, 'categories.php', 'cPath=85&page=2&', '::1'),
(1171, '2016-03-11 02:31:58', 1, 'product.php', 'page=2&product_type=1&cPath=85&pID=188&action=new_product&', '::1'),
(1172, '2016-03-11 02:32:07', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=new_product_preview&page=2&', '::1'),
(1173, '2016-03-11 02:32:08', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=update_product&page=2&', '::1'),
(1174, '2016-03-11 02:32:09', 1, 'categories.php', 'cPath=85&pID=188&page=2&', '::1'),
(1175, '2016-03-11 02:32:18', 1, 'product.php', 'page=2&product_type=1&cPath=85&pID=190&action=new_product&', '::1'),
(1176, '2016-03-11 02:33:03', 1, 'product.php', 'cPath=85&product_type=1&pID=190&action=new_product_preview&page=2&', '::1'),
(1177, '2016-03-11 02:33:04', 1, 'product.php', 'cPath=85&product_type=1&pID=190&action=update_product&page=2&', '::1'),
(1178, '2016-03-11 02:33:04', 1, 'categories.php', 'cPath=85&pID=190&page=2&', '::1'),
(1179, '2016-03-11 02:33:17', 1, 'product.php', 'page=2&product_type=1&cPath=85&pID=191&action=new_product&', '::1'),
(1180, '2016-03-11 02:33:24', 1, 'product.php', 'cPath=85&product_type=1&pID=191&action=new_product_preview&page=2&', '::1'),
(1181, '2016-03-11 02:33:26', 1, 'product.php', 'cPath=85&product_type=1&pID=191&action=update_product&page=2&', '::1'),
(1182, '2016-03-11 02:33:26', 1, 'categories.php', 'cPath=85&pID=191&page=2&', '::1'),
(1183, '2016-03-11 02:34:07', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=86&', '::1'),
(1184, '2016-03-11 02:34:08', 1, 'product.php', 'page=1&product_type=1&cPath=86&pID=196&action=new_product&', '::1'),
(1185, '2016-03-11 02:34:25', 1, 'product.php', 'cPath=86&product_type=1&pID=196&action=new_product_preview&page=1&', '::1'),
(1186, '2016-03-11 02:34:26', 1, 'product.php', 'cPath=86&product_type=1&pID=196&action=update_product&page=1&', '::1'),
(1187, '2016-03-11 02:34:26', 1, 'categories.php', 'cPath=86&pID=196&page=1&', '::1'),
(1188, '2016-03-11 02:34:42', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1189, '2016-03-11 02:35:12', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=189&action=new_product&', '::1'),
(1190, '2016-03-11 02:35:37', 1, 'categories.php', 'cPath=85&pID=189&page=1&', '::1'),
(1191, '2016-03-11 02:35:43', 1, 'product.php', 'cPath=85&product_type=1&pID=189&action=move_product&', '::1'),
(1192, '2016-03-11 02:35:47', 1, 'categories.php', 'cPath=85&pID=189&page=1&', '::1'),
(1193, '2016-03-11 02:35:54', 1, 'attributes_controller.php', 'products_filter=189&current_category_id=85&', '::1'),
(1194, '2016-03-11 02:36:08', 1, 'products_to_categories.php', 'products_filter=189&current_category_id=85&', '::1'),
(1195, '2016-03-11 02:36:35', 1, 'products_to_categories.php', 'action=edit&products_filter=189&current_category_id=85&', '::1'),
(1196, '2016-03-11 02:36:51', 1, 'products_to_categories.php', 'action=update_product&products_filter=189&current_category_id=85&', '::1'),
(1197, '2016-03-11 02:36:51', 1, 'products_to_categories.php', 'products_filter=189&current_category_id=85&', '::1'),
(1198, '2016-03-11 02:37:28', 1, 'product_types.php', '', '::1'),
(1199, '2016-03-11 02:37:35', 1, 'product_types.php', 'page=1&ptID=1&action=layout&', '::1'),
(1200, '2016-03-11 02:37:40', 1, 'product_types.php', 'ptID=1&cID=6&action=layout_edit&', '::1'),
(1201, '2016-03-11 02:37:43', 1, 'product_types.php', 'ptID=1&cID=6&action=layout_save&', '::1'),
(1202, '2016-03-11 02:37:43', 1, 'product_types.php', 'gID=&cID=6&ptID=1&action=layout&', '::1'),
(1203, '2016-03-11 02:37:59', 1, 'categories.php', '', '::1'),
(1204, '2016-03-11 02:38:06', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1205, '2016-03-11 02:38:13', 1, 'attributes_controller.php', 'products_filter=195&current_category_id=85&', '::1'),
(1206, '2016-03-11 02:38:16', 1, 'products_to_categories.php', 'products_filter=195&current_category_id=85&', '::1'),
(1207, '2016-03-11 02:38:19', 1, 'products_to_categories.php', 'action=edit&products_filter=195&current_category_id=85&', '::1'),
(1208, '2016-03-11 02:38:22', 1, 'products_to_categories.php', 'action=update_product&products_filter=195&current_category_id=85&', '::1'),
(1209, '2016-03-11 02:38:22', 1, 'products_to_categories.php', 'products_filter=195&current_category_id=85&', '::1'),
(1210, '2016-03-11 02:38:41', 1, 'categories.php', '', '::1'),
(1211, '2016-03-11 02:39:10', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1212, '2016-03-11 02:39:12', 1, 'attributes_controller.php', 'products_filter=180&current_category_id=85&', '::1'),
(1213, '2016-03-11 02:39:14', 1, 'products_to_categories.php', 'products_filter=180&current_category_id=85&', '::1'),
(1214, '2016-03-11 02:39:42', 1, 'products_to_categories.php', 'products_filter=182&current_category_id=85&', '::1'),
(1215, '2016-03-11 02:39:48', 1, 'categories.php', '', '::1'),
(1216, '2016-03-11 02:39:52', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1217, '2016-03-11 02:40:13', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=87&', '::1'),
(1218, '2016-03-11 02:40:16', 1, 'categories.php', 'x=54&y=9&product_type=1&cPath=87&action=new_product&', '::1'),
(1219, '2016-03-11 02:40:16', 1, 'product.php', 'x=54&y=9&product_type=1&cPath=87&action=new_product&', '::1'),
(1220, '2016-03-11 02:42:17', 1, 'product.php', 'cPath=87&product_type=1&action=new_product_preview&', '::1'),
(1221, '2016-03-11 02:42:19', 1, 'product.php', 'cPath=87&product_type=1&action=insert_product&', '::1'),
(1222, '2016-03-11 02:42:19', 1, 'categories.php', 'cPath=87&pID=197&', '::1'),
(1223, '2016-03-11 02:42:25', 1, 'attributes_controller.php', 'products_filter=197&current_category_id=87&', '::1'),
(1224, '2016-03-11 02:42:48', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1225, '2016-03-11 02:43:13', 1, 'products_to_categories.php', 'action=edit&products_filter=197&current_category_id=87&', '::1'),
(1226, '2016-03-11 02:43:37', 1, 'products_to_categories.php', 'action=update_product&products_filter=197&current_category_id=87&', '::1'),
(1227, '2016-03-11 02:43:38', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1228, '2016-03-11 02:44:04', 1, 'alt_nav.php', '', '::1'),
(1229, '2016-03-11 02:44:08', 1, 'categories.php', '', '::1'),
(1230, '2016-03-11 02:44:33', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=85&', '::1'),
(1231, '2016-03-11 02:44:37', 1, 'products_price_manager.php', 'products_filter=189&current_category_id=85&', '::1'),
(1232, '2016-03-11 02:44:42', 1, 'products_to_categories.php', 'products_filter=189&', '::1'),
(1233, '2016-03-11 02:44:44', 1, 'products_to_categories.php', 'action=edit&products_filter=189&current_category_id=85&', '::1'),
(1234, '2016-03-11 02:44:50', 1, 'products_to_categories.php', 'action=update_product&products_filter=189&current_category_id=85&', '::1'),
(1235, '2016-03-11 02:44:50', 1, 'products_to_categories.php', 'products_filter=189&current_category_id=85&', '::1'),
(1236, '2016-03-11 02:45:11', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1237, '2016-03-11 02:45:11', 1, 'products_to_categories.php', 'products_filter=187&current_category_id=85&', '::1'),
(1238, '2016-03-11 02:45:14', 1, 'products_to_categories.php', 'action=edit&products_filter=187&current_category_id=85&', '::1'),
(1239, '2016-03-11 02:45:20', 1, 'products_to_categories.php', 'action=update_product&products_filter=187&current_category_id=85&', '::1'),
(1240, '2016-03-11 02:45:20', 1, 'products_to_categories.php', 'products_filter=187&current_category_id=85&', '::1'),
(1241, '2016-03-11 02:46:38', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1242, '2016-03-11 02:46:38', 1, 'products_to_categories.php', 'products_filter=188&current_category_id=85&', '::1'),
(1243, '2016-03-11 02:46:41', 1, 'products_to_categories.php', 'action=edit&products_filter=188&current_category_id=85&', '::1'),
(1244, '2016-03-11 02:46:49', 1, 'categories.php', '', '::1'),
(1245, '2016-03-11 02:46:53', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=88&', '::1'),
(1246, '2016-03-11 02:47:09', 1, 'categories.php', 'x=67&y=8&product_type=1&cPath=88&action=new_product&', '::1'),
(1247, '2016-03-11 02:47:09', 1, 'product.php', 'x=67&y=8&product_type=1&cPath=88&action=new_product&', '::1'),
(1248, '2016-03-11 02:48:19', 1, 'product.php', 'cPath=88&product_type=1&action=new_product_preview&', '::1'),
(1249, '2016-03-11 02:48:22', 1, 'product.php', 'cPath=88&product_type=1&action=insert_product&', '::1'),
(1250, '2016-03-11 02:48:22', 1, 'categories.php', 'cPath=88&pID=198&', '::1'),
(1251, '2016-03-11 02:48:35', 1, 'attributes_controller.php', 'products_filter=198&current_category_id=88&', '::1'),
(1252, '2016-03-11 02:48:37', 1, 'products_to_categories.php', 'products_filter=198&current_category_id=88&', '::1'),
(1253, '2016-03-11 02:48:40', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=85&products_filter=198&action=new_cat&', '::1'),
(1254, '2016-03-11 02:48:41', 1, 'products_to_categories.php', 'products_filter=181&current_category_id=85&', '::1'),
(1255, '2016-03-11 02:48:58', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1256, '2016-03-11 02:48:58', 1, 'products_to_categories.php', 'products_filter=188&current_category_id=85&', '::1'),
(1257, '2016-03-11 02:49:00', 1, 'products_to_categories.php', 'action=edit&products_filter=188&current_category_id=85&', '::1'),
(1258, '2016-03-11 02:49:05', 1, 'products_to_categories.php', 'action=update_product&products_filter=188&current_category_id=85&', '::1'),
(1259, '2016-03-11 02:49:05', 1, 'products_to_categories.php', 'products_filter=188&current_category_id=85&', '::1'),
(1260, '2016-03-11 02:49:16', 1, 'categories.php', '', '::1'),
(1261, '2016-03-11 02:49:19', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=88&', '::1'),
(1262, '2016-03-11 02:49:21', 1, 'categories.php', 'x=80&y=14&product_type=1&cPath=88&action=new_product&', '::1'),
(1263, '2016-03-11 02:49:21', 1, 'product.php', 'x=80&y=14&product_type=1&cPath=88&action=new_product&', '::1'),
(1264, '2016-03-11 02:50:15', 1, 'product.php', 'cPath=88&product_type=1&action=new_product_preview&', '::1'),
(1265, '2016-03-11 02:50:22', 1, 'product.php', 'cPath=88&product_type=1&action=insert_product&', '::1'),
(1266, '2016-03-11 02:50:22', 1, 'categories.php', 'cPath=88&pID=199&', '::1'),
(1267, '2016-03-11 02:50:50', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=89&', '::1'),
(1268, '2016-03-11 02:50:51', 1, 'categories.php', 'x=65&y=12&product_type=1&cPath=89&action=new_product&', '::1'),
(1269, '2016-03-11 02:50:51', 1, 'product.php', 'x=65&y=12&product_type=1&cPath=89&action=new_product&', '::1'),
(1270, '2016-03-11 02:52:05', 1, 'product.php', 'cPath=89&product_type=1&action=new_product_preview&', '::1'),
(1271, '2016-03-11 02:52:06', 1, 'product.php', 'cPath=89&product_type=1&action=insert_product&', '::1'),
(1272, '2016-03-11 02:52:06', 1, 'categories.php', 'cPath=89&pID=200&', '::1'),
(1273, '2016-03-11 02:54:11', 1, 'product.php', 'page=1&product_type=1&cPath=89&pID=200&action=new_product&', '::1'),
(1274, '2016-03-11 02:54:11', 1, 'attributes_controller.php', 'products_filter=200&current_category_id=89&', '::1'),
(1275, '2016-03-11 02:54:14', 1, 'categories.php', 'cPath=89&pID=200&', '::1'),
(1276, '2016-03-11 02:54:17', 1, 'products_to_categories.php', 'products_filter=200&current_category_id=89&', '::1'),
(1277, '2016-03-11 02:54:23', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=85&products_filter=200&action=new_cat&', '::1'),
(1278, '2016-03-11 02:54:23', 1, 'products_to_categories.php', 'products_filter=181&current_category_id=85&', '::1'),
(1279, '2016-03-11 02:54:30', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1280, '2016-03-11 02:54:31', 1, 'products_to_categories.php', 'products_filter=186&current_category_id=85&', '::1'),
(1281, '2016-03-11 02:54:35', 1, 'products_to_categories.php', 'action=edit&products_filter=186&current_category_id=85&', '::1'),
(1282, '2016-03-11 02:54:38', 1, 'products_to_categories.php', 'action=update_product&products_filter=186&current_category_id=85&', '::1'),
(1283, '2016-03-11 02:54:38', 1, 'products_to_categories.php', 'products_filter=186&current_category_id=85&', '::1'),
(1284, '2016-03-11 02:54:42', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1285, '2016-03-11 02:54:42', 1, 'products_to_categories.php', 'products_filter=190&current_category_id=85&', '::1'),
(1286, '2016-03-11 02:54:47', 1, 'products_to_categories.php', 'action=update_product&products_filter=190&current_category_id=85&', '::1'),
(1287, '2016-03-11 02:54:47', 1, 'products_to_categories.php', 'products_filter=190&current_category_id=85&', '::1'),
(1288, '2016-03-11 02:55:07', 1, 'categories.php', 'x=76&y=9&product_type=1&cPath=89&action=new_product&', '::1'),
(1289, '2016-03-11 02:55:07', 1, 'product.php', 'x=76&y=9&product_type=1&cPath=89&action=new_product&', '::1'),
(1290, '2016-03-11 02:56:10', 1, 'product.php', 'cPath=89&product_type=1&action=new_product_preview&', '::1'),
(1291, '2016-03-11 02:56:12', 1, 'product.php', 'cPath=89&product_type=1&action=insert_product&', '::1'),
(1292, '2016-03-11 02:56:12', 1, 'categories.php', 'cPath=89&pID=201&', '::1'),
(1293, '2016-03-11 02:56:26', 1, 'categories.php', 'x=87&y=11&product_type=1&cPath=89&action=new_product&', '::1'),
(1294, '2016-03-11 02:56:26', 1, 'product.php', 'x=87&y=11&product_type=1&cPath=89&action=new_product&', '::1'),
(1295, '2016-03-11 02:57:35', 1, 'product.php', 'cPath=89&product_type=1&action=new_product_preview&', '::1'),
(1296, '2016-03-11 02:57:36', 1, 'product.php', 'cPath=89&product_type=1&action=insert_product&', '::1'),
(1297, '2016-03-11 02:57:36', 1, 'categories.php', 'cPath=89&pID=202&', '::1'),
(1298, '2016-03-11 02:58:36', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=90&', '::1'),
(1299, '2016-03-11 02:58:38', 1, 'categories.php', 'x=72&y=5&product_type=1&cPath=90&action=new_product&', '::1'),
(1300, '2016-03-11 02:58:38', 1, 'product.php', 'x=72&y=5&product_type=1&cPath=90&action=new_product&', '::1'),
(1301, '2016-03-11 03:00:07', 1, 'product.php', 'cPath=90&product_type=1&action=new_product_preview&', '::1'),
(1302, '2016-03-11 03:00:10', 1, 'product.php', 'cPath=90&product_type=1&action=insert_product&', '::1'),
(1303, '2016-03-11 03:00:10', 1, 'categories.php', 'cPath=90&pID=203&', '::1'),
(1304, '2016-03-11 03:00:27', 1, 'categories.php', 'x=63&y=7&product_type=1&cPath=90&action=new_product&', '::1'),
(1305, '2016-03-11 03:00:27', 1, 'product.php', 'x=63&y=7&product_type=1&cPath=90&action=new_product&', '::1'),
(1306, '2016-03-11 03:01:21', 1, 'product.php', 'cPath=90&product_type=1&action=new_product_preview&', '::1'),
(1307, '2016-03-11 03:01:23', 1, 'product.php', 'cPath=90&product_type=1&action=insert_product&', '::1'),
(1308, '2016-03-11 03:01:23', 1, 'categories.php', 'cPath=90&pID=204&', '::1'),
(1309, '2016-03-11 03:01:37', 1, 'categories.php', 'x=67&y=17&product_type=1&cPath=90&action=new_product&', '::1'),
(1310, '2016-03-11 03:01:37', 1, 'product.php', 'x=67&y=17&product_type=1&cPath=90&action=new_product&', '::1'),
(1311, '2016-03-11 03:02:32', 1, 'product.php', 'cPath=90&product_type=1&action=new_product_preview&', '::1'),
(1312, '2016-03-11 03:02:33', 1, 'product.php', 'cPath=90&product_type=1&action=insert_product&', '::1'),
(1313, '2016-03-11 03:02:33', 1, 'categories.php', 'cPath=90&pID=205&', '::1'),
(1314, '2016-03-11 03:02:47', 1, 'product.php', 'page=1&product_type=1&cPath=90&pID=205&action=new_product&', '::1'),
(1315, '2016-03-11 03:02:47', 1, 'attributes_controller.php', 'products_filter=205&current_category_id=90&', '::1'),
(1316, '2016-03-11 03:02:48', 1, 'categories.php', 'cPath=90&pID=205&', '::1'),
(1317, '2016-03-11 03:02:50', 1, 'products_to_categories.php', 'products_filter=205&current_category_id=90&', '::1'),
(1318, '2016-03-11 03:02:54', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=85&products_filter=205&action=new_cat&', '::1'),
(1319, '2016-03-11 03:02:54', 1, 'products_to_categories.php', 'products_filter=181&current_category_id=85&', '::1'),
(1320, '2016-03-11 03:03:04', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=86&products_filter=181&action=new_cat&', '::1'),
(1321, '2016-03-11 03:03:04', 1, 'products_to_categories.php', 'products_filter=196&current_category_id=86&', '::1'),
(1322, '2016-03-11 03:03:08', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=87&products_filter=196&action=new_cat&', '::1'),
(1323, '2016-03-11 03:03:08', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1324, '2016-03-11 03:03:20', 1, 'products_to_categories.php', 'action=update_product&products_filter=197&current_category_id=87&', '::1'),
(1325, '2016-03-11 03:03:20', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1326, '2016-03-11 03:03:33', 1, 'products_to_categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&current_category_id=85&products_filter=197&action=new_cat&', '::1'),
(1327, '2016-03-11 03:03:33', 1, 'products_to_categories.php', 'products_filter=181&current_category_id=85&', '::1'),
(1328, '2016-03-11 03:03:39', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1329, '2016-03-11 03:03:39', 1, 'products_to_categories.php', 'products_filter=183&current_category_id=85&', '::1'),
(1330, '2016-03-11 03:03:43', 1, 'products_to_categories.php', 'action=update_product&products_filter=183&current_category_id=85&', '::1'),
(1331, '2016-03-11 03:03:43', 1, 'products_to_categories.php', 'products_filter=183&current_category_id=85&', '::1'),
(1332, '2016-03-11 03:03:55', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1333, '2016-03-11 03:03:55', 1, 'products_to_categories.php', 'products_filter=192&current_category_id=85&', '::1'),
(1334, '2016-03-11 03:03:57', 1, 'products_to_categories.php', 'action=update_product&products_filter=192&current_category_id=85&', '::1'),
(1335, '2016-03-11 03:03:57', 1, 'products_to_categories.php', 'products_filter=192&current_category_id=85&', '::1'),
(1336, '2016-03-11 03:04:07', 1, 'products_to_categories.php', 'action=set_products_filter&', '::1'),
(1337, '2016-03-11 03:04:07', 1, 'products_to_categories.php', 'products_filter=184&current_category_id=85&', '::1'),
(1338, '2016-03-11 03:04:10', 1, 'products_to_categories.php', 'action=update_product&products_filter=184&current_category_id=85&', '::1'),
(1339, '2016-03-11 03:04:10', 1, 'products_to_categories.php', 'products_filter=184&current_category_id=85&', '::1'),
(1340, '2016-03-11 03:06:55', 1, 'categories.php', 'securityToken=b7ae726e7c3de04977d21ee2eea59802&cPath=0&', '::1'),
(1341, '2016-03-11 03:07:03', 1, 'categories.php', 'cPath=0_84&', '::1'),
(1342, '2016-03-11 03:07:41', 1, 'modules.php', 'set=payment&', '::1'),
(1343, '2016-03-11 03:07:44', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(1344, '2016-03-11 16:54:21', 0, 'login.php ', '', '::1'),
(1345, '2016-03-11 16:55:36', 0, 'login.php admin', '', '::1'),
(1346, '2016-03-11 16:55:42', 1, 'layout_controller.php', '', '::1'),
(1347, '2016-03-11 16:55:45', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(1348, '2016-03-11 16:55:47', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(1349, '2016-03-11 16:56:15', 1, 'layout_controller.php', 'page=&cID=114&action=save&layout_box_name=search.php&', '::1'),
(1350, '2016-03-11 16:56:15', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(1351, '2016-03-11 16:56:36', 1, 'layout_controller.php', 'page=&cID=114&action=edit&', '::1'),
(1352, '2016-03-11 16:56:38', 1, 'layout_controller.php', 'page=&cID=114&action=save&layout_box_name=search.php&', '::1'),
(1353, '2016-03-11 16:56:38', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(1354, '2016-03-11 16:56:49', 1, 'configuration.php', 'gID=19&', '::1'),
(1355, '2016-03-11 16:57:14', 1, 'configuration.php', 'gID=19&cID=404&action=edit&', '::1'),
(1356, '2016-03-11 16:58:11', 1, 'configuration.php', 'gID=19&cID=570&action=edit&', '::1'),
(1357, '2016-03-11 16:58:19', 1, 'configuration.php', 'gID=19&cID=570&', '::1'),
(1358, '2016-03-11 16:58:38', 1, 'banner_manager.php', '', '::1'),
(1359, '2016-03-11 16:58:56', 1, 'banner_manager.php', 'page=1&bID=13&', '::1'),
(1360, '2016-03-11 16:59:12', 1, 'store_manager.php', '', '::1'),
(1361, '2016-03-11 16:59:21', 1, 'configuration.php', 'gID=1&', '::1'),
(1362, '2016-03-11 16:59:52', 1, 'configuration.php', 'gID=8&', '::1'),
(1363, '2016-03-11 17:00:10', 1, 'configuration.php', 'gID=47&', '::1'),
(1364, '2016-03-11 17:00:12', 1, 'configuration.php', 'gID=47&cID=602&action=edit&', '::1'),
(1365, '2016-03-11 17:00:15', 1, 'configuration.php', 'gID=47&cID=602&action=save&', '::1'),
(1366, '2016-03-11 17:00:15', 1, 'configuration.php', 'gID=47&cID=602&', '::1'),
(1367, '2016-03-11 17:00:30', 1, 'configuration.php', 'gID=47&cID=604&action=edit&', '::1'),
(1368, '2016-03-11 17:00:33', 1, 'configuration.php', 'gID=47&cID=604&action=save&', '::1'),
(1369, '2016-03-11 17:00:33', 1, 'configuration.php', 'gID=47&cID=604&', '::1'),
(1370, '2016-03-11 17:00:39', 1, 'configuration.php', 'gID=47&cID=604&action=edit&', '::1'),
(1371, '2016-03-11 17:00:41', 1, 'configuration.php', 'gID=47&cID=604&action=save&', '::1'),
(1372, '2016-03-11 17:00:41', 1, 'configuration.php', 'gID=47&cID=604&', '::1'),
(1373, '2016-03-11 17:00:42', 1, 'configuration.php', 'gID=47&cID=603&action=edit&', '::1'),
(1374, '2016-03-11 17:01:18', 1, 'configuration.php', 'gID=47&cID=604&action=edit&', '::1'),
(1375, '2016-03-11 17:01:28', 1, 'configuration.php', 'gID=23&', '::1'),
(1376, '2016-03-11 17:07:16', 1, 'configuration.php', 'gID=47&', '::1'),
(1377, '2016-03-11 17:07:19', 1, 'configuration.php', 'gID=47&cID=602&action=edit&', '::1'),
(1378, '2016-03-11 17:07:22', 1, 'configuration.php', 'gID=47&cID=602&action=save&', '::1'),
(1379, '2016-03-11 17:07:22', 1, 'configuration.php', 'gID=47&cID=602&', '::1'),
(1380, '2016-03-11 17:18:21', 1, 'products_expected.php', '', '::1'),
(1381, '2016-03-11 17:18:39', 1, 'specials.php', '', '::1'),
(1382, '2016-03-11 17:18:44', 1, 'featured.php', '', '::1'),
(1383, '2016-03-11 17:18:50', 1, 'categories.php', '', '::1'),
(1384, '2016-03-11 17:18:58', 1, 'categories.php', 'cPath=84&', '::1'),
(1385, '2016-03-11 17:19:00', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1386, '2016-03-11 17:19:07', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=new_product&', '::1'),
(1387, '2016-03-11 17:19:39', 1, 'categories.php', '', '::1'),
(1388, '2016-03-11 17:19:41', 1, 'categories.php', 'cPath=84&', '::1'),
(1389, '2016-03-11 17:19:44', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1390, '2016-03-11 17:19:48', 1, 'attributes_controller.php', 'products_filter=181&current_category_id=85&', '::1'),
(1391, '2016-03-11 17:26:07', 1, 'categories.php', '', '::1'),
(1392, '2016-03-11 17:26:09', 1, 'categories.php', 'cPath=84&', '::1'),
(1393, '2016-03-11 17:26:12', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1394, '2016-03-11 17:27:15', 1, 'categories.php', 'x=70&y=4&product_type=1&cPath=84_85&action=new_product&', '::1'),
(1395, '2016-03-11 17:27:15', 1, 'product.php', 'x=70&y=4&product_type=1&cPath=84_85&action=new_product&', '::1'),
(1396, '2016-03-11 17:29:10', 1, 'product.php', 'cPath=84_85&product_type=1&action=new_product_preview&', '::1'),
(1397, '2016-03-11 17:29:12', 1, 'product.php', 'cPath=84_85&product_type=1&action=insert_product&', '::1'),
(1398, '2016-03-11 17:29:12', 1, 'categories.php', 'cPath=84_85&pID=206&', '::1'),
(1399, '2016-03-11 17:44:10', 1, 'attributes_controller.php', 'products_filter=181&current_category_id=85&', '::1'),
(1400, '2016-03-11 17:44:13', 1, 'products_to_categories.php', 'products_filter=181&current_category_id=85&', '::1'),
(1401, '2016-03-11 17:44:37', 1, 'configuration.php', 'gID=8&', '::1'),
(1402, '2016-03-11 17:44:55', 1, 'configuration.php', 'gID=8&cID=216&action=edit&', '::1'),
(1403, '2016-03-11 17:45:02', 1, 'configuration.php', 'gID=8&cID=219&action=edit&', '::1'),
(1404, '2016-03-11 17:45:22', 1, 'configuration.php', 'gID=8&cID=580&action=edit&', '::1'),
(1405, '2016-03-11 17:45:25', 1, 'configuration.php', 'gID=8&cID=580&action=save&', '::1'),
(1406, '2016-03-11 17:45:25', 1, 'configuration.php', 'gID=8&cID=580&', '::1'),
(1407, '2016-03-11 17:45:30', 1, 'configuration.php', 'gID=8&cID=580&action=edit&', '::1'),
(1408, '2016-03-11 17:45:32', 1, 'configuration.php', 'gID=8&cID=580&action=save&', '::1'),
(1409, '2016-03-11 17:45:32', 1, 'configuration.php', 'gID=8&cID=580&', '::1'),
(1410, '2016-03-11 17:45:35', 1, 'configuration.php', 'gID=8&cID=582&action=edit&', '::1'),
(1411, '2016-03-11 17:45:48', 1, 'configuration.php', 'gID=8&cID=583&action=edit&', '::1'),
(1412, '2016-03-11 17:45:52', 1, 'configuration.php', 'gID=8&cID=583&action=save&', '::1'),
(1413, '2016-03-11 17:45:53', 1, 'configuration.php', 'gID=8&cID=583&', '::1'),
(1414, '2016-03-11 17:46:04', 1, 'configuration.php', 'gID=8&cID=583&action=edit&', '::1'),
(1415, '2016-03-11 17:46:07', 1, 'configuration.php', 'gID=8&cID=583&action=save&', '::1'),
(1416, '2016-03-11 17:46:07', 1, 'configuration.php', 'gID=8&cID=583&', '::1'),
(1417, '2016-03-11 17:46:15', 1, 'configuration.php', 'gID=8&cID=225&action=edit&', '::1'),
(1418, '2016-03-11 17:47:11', 1, 'categories.php', '', '::1'),
(1419, '2016-03-11 17:47:13', 1, 'categories.php', 'cPath=84&', '::1'),
(1420, '2016-03-11 17:47:19', 1, 'categories.php', 'cID=84&', '::1'),
(1421, '2016-03-11 17:47:21', 1, 'categories.php', 'cPath=84&', '::1'),
(1422, '2016-03-11 17:47:23', 1, 'categories.php', 'cPath=84&action=new_category&', '::1'),
(1423, '2016-03-11 17:47:24', 1, 'categories.php', 'cPath=84&', '::1'),
(1424, '2016-03-11 17:47:45', 1, 'categories.php', 'cPath=84&cID=85&action=edit_category&', '::1'),
(1425, '2016-03-11 17:48:06', 1, 'categories.php', 'cPath=84&cID=85&', '::1'),
(1426, '2016-03-11 17:48:10', 1, 'categories.php', '', '::1'),
(1427, '2016-03-11 17:48:24', 1, 'categories.php', 'cPath=91&', '::1'),
(1428, '2016-03-11 17:48:42', 1, 'categories.php', 'securityToken=143fbe765ff55b7e3523bce8edf23390&cPath=98&', '::1'),
(1429, '2016-03-11 17:48:44', 1, 'categories.php', 'x=57&y=9&product_type=1&cPath=98&action=new_product&', '::1'),
(1430, '2016-03-11 17:48:44', 1, 'product.php', 'x=57&y=9&product_type=1&cPath=98&action=new_product&', '::1'),
(1431, '2016-03-11 17:48:48', 1, 'product.php', 'cPath=98&product_type=1&action=new_product_preview&', '::1'),
(1432, '2016-03-11 17:48:50', 1, 'product.php', 'cPath=98&product_type=1&action=insert_product&', '::1'),
(1433, '2016-03-11 17:48:50', 1, 'categories.php', 'cPath=98&pID=207&', '::1'),
(1434, '2016-03-11 17:49:04', 1, 'categories.php', 'cID=98&', '::1'),
(1435, '2016-03-11 17:49:06', 1, 'categories.php', 'cPath=98&', '::1'),
(1436, '2016-03-11 17:49:10', 1, 'product.php', 'cPath=98&product_type=1&pID=207&action=delete_product&', '::1'),
(1437, '2016-03-11 17:49:14', 1, 'product.php', 'action=delete_product_confirm&product_type=1&cPath=98&page=1&', '::1'),
(1438, '2016-03-11 17:49:14', 1, 'categories.php', 'cPath=98&', '::1'),
(1439, '2016-03-11 17:49:16', 1, 'categories.php', 'cID=98&', '::1'),
(1440, '2016-03-11 17:49:23', 1, 'categories.php', 'cPath=84&', '::1'),
(1441, '2016-03-11 17:49:27', 1, 'categories.php', 'cID=84&', '::1'),
(1442, '2016-03-11 17:50:49', 1, 'layout_controller.php', '', '::1'),
(1443, '2016-03-11 17:50:54', 1, 'layout_controller.php', 'page=&cID=114&', '::1'),
(1444, '2016-03-11 17:51:46', 1, 'configuration.php', 'gID=19&', '::1'),
(1445, '2016-03-11 17:51:58', 1, 'configuration.php', 'gID=19&cID=570&action=edit&', '::1'),
(1446, '2016-03-11 17:52:02', 1, 'configuration.php', 'gID=19&cID=570&', '::1'),
(1447, '2016-03-11 18:30:52', 1, 'configuration.php', 'gID=19&cID=399&action=edit&', '::1'),
(1448, '2016-03-11 18:30:54', 1, 'configuration.php', 'gID=19&cID=399&action=save&', '::1'),
(1449, '2016-03-11 18:30:54', 1, 'configuration.php', 'gID=19&cID=399&', '::1'),
(1450, '2016-03-11 18:31:03', 1, 'configuration.php', 'gID=19&cID=400&action=edit&', '::1'),
(1451, '2016-03-11 18:31:06', 1, 'configuration.php', 'gID=19&cID=400&action=save&', '::1'),
(1452, '2016-03-11 18:31:06', 1, 'configuration.php', 'gID=19&cID=400&', '::1'),
(1453, '2016-03-11 18:31:24', 1, 'configuration.php', 'gID=19&cID=402&action=edit&', '::1'),
(1454, '2016-03-11 18:31:32', 1, 'configuration.php', 'gID=19&cID=402&action=save&', '::1'),
(1455, '2016-03-11 18:31:32', 1, 'configuration.php', 'gID=19&cID=402&', '::1'),
(1456, '2016-03-11 18:31:33', 1, 'configuration.php', 'gID=19&cID=403&action=edit&', '::1'),
(1457, '2016-03-11 18:31:40', 1, 'configuration.php', 'gID=19&cID=403&action=save&', '::1'),
(1458, '2016-03-11 18:31:40', 1, 'configuration.php', 'gID=19&cID=403&', '::1'),
(1459, '2016-03-11 18:32:47', 1, 'configuration.php', 'gID=19&cID=433&action=edit&', '::1'),
(1460, '2016-03-11 18:32:58', 1, 'configuration.php', 'gID=19&cID=433&', '::1'),
(1461, '2016-03-11 18:34:51', 0, 'login.php ', '', '::1'),
(1462, '2016-03-11 18:34:52', 0, 'login.php admin', '', '::1'),
(1463, '2016-03-11 18:34:57', 1, 'configuration.php', 'gID=19&', '::1'),
(1464, '2016-03-11 18:34:59', 1, 'configuration.php', 'gID=19&cID=435&action=edit&', '::1'),
(1465, '2016-03-13 15:35:41', 0, 'login.php ', '', '::1'),
(1466, '2016-03-13 15:35:42', 0, 'login.php admin', '', '::1'),
(1467, '2016-03-13 21:53:22', 0, 'login.php ', '', '::1'),
(1468, '2016-03-13 21:53:23', 0, 'login.php admin', '', '::1'),
(1469, '2016-03-13 22:17:24', 1, 'categories.php', '', '::1'),
(1470, '2016-03-13 23:10:48', 1, 'categories.php', '', '::1'),
(1471, '2016-03-13 23:10:56', 1, 'layout_controller.php', '', '::1'),
(1472, '2016-03-13 23:11:12', 1, 'layout_controller.php', 'page=&cID=121&', '::1'),
(1473, '2016-03-13 23:11:15', 1, 'layout_controller.php', 'page=&cID=121&action=edit&', '::1'),
(1474, '2016-03-13 23:11:18', 1, 'layout_controller.php', 'page=&cID=121&action=save&layout_box_name=ch_categories.php&', '::1'),
(1475, '2016-03-13 23:11:18', 1, 'layout_controller.php', 'page=&cID=121&', '::1'),
(1476, '2016-03-13 23:11:28', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(1477, '2016-03-13 23:11:29', 1, 'layout_controller.php', 'page=&cID=98&action=edit&', '::1'),
(1478, '2016-03-13 23:11:31', 1, 'layout_controller.php', 'page=&cID=98&action=save&layout_box_name=categories.php&', '::1'),
(1479, '2016-03-13 23:11:32', 1, 'layout_controller.php', 'page=&cID=98&', '::1'),
(1480, '2016-03-13 23:16:29', 1, 'template_select.php', '', '::1'),
(1481, '2016-03-13 23:21:06', 1, 'layout_controller.php', '', '::1'),
(1482, '2016-03-13 23:21:12', 1, 'layout_controller.php', 'page=&cID=121&', '::1'),
(1483, '2016-03-13 23:21:14', 1, 'layout_controller.php', 'page=&cID=121&action=edit&', '::1'),
(1484, '2016-03-13 23:21:17', 1, 'layout_controller.php', 'page=&cID=121&action=save&layout_box_name=ch_categories.php&', '::1'),
(1485, '2016-03-13 23:21:17', 1, 'layout_controller.php', 'page=&cID=121&', '::1'),
(1486, '2016-03-13 23:21:32', 1, 'categories.php', '', '::1'),
(1487, '2016-03-13 23:21:34', 1, 'categories.php', 'cPath=84&', '::1'),
(1488, '2016-03-13 23:21:35', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1489, '2016-03-13 23:21:36', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(1490, '2016-03-13 23:22:42', 1, 'configuration.php', 'gID=18&', '::1'),
(1491, '2016-03-13 23:23:19', 1, 'configuration.php', 'gID=18&cID=625&action=edit&', '::1'),
(1492, '2016-03-13 23:23:22', 1, 'configuration.php', 'gID=18&cID=625&', '::1'),
(1493, '2016-03-13 23:23:44', 1, 'layout_controller.php', '', '::1'),
(1494, '2016-03-13 23:23:50', 1, 'categories.php', '', '::1'),
(1495, '2016-03-13 23:23:52', 1, 'categories.php', 'cPath=84&', '::1'),
(1496, '2016-03-13 23:23:55', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1497, '2016-03-13 23:24:06', 1, 'attributes_controller.php', 'products_filter=181&current_category_id=85&', '::1'),
(1498, '2016-03-13 23:24:21', 1, 'categories.php', '', '::1'),
(1499, '2016-03-13 23:24:23', 1, 'categories.php', 'cPath=84&', '::1'),
(1500, '2016-03-13 23:24:24', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1501, '2016-03-13 23:24:27', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(1502, '2016-03-13 23:27:24', 1, 'categories.php', '', '::1'),
(1503, '2016-03-13 23:27:28', 1, 'categories.php', 'cPath=84&', '::1'),
(1504, '2016-03-13 23:27:29', 1, 'categories.php', 'cPath=84_85&', '::1'),
(1505, '2016-03-13 23:27:30', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(1506, '2016-03-13 23:28:07', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=new_product_preview&page=1&', '::1'),
(1507, '2016-03-13 23:28:09', 1, 'product.php', 'cPath=84_85&product_type=1&pID=181&action=update_product&page=1&', '::1'),
(1508, '2016-03-13 23:28:10', 1, 'categories.php', 'cPath=84_85&pID=181&page=1&', '::1'),
(1509, '2016-03-13 23:28:15', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=181&action=new_product&', '::1'),
(1510, '2016-03-13 23:28:17', 1, 'categories.php', 'cPath=84_85&pID=181&page=1&', '::1'),
(1511, '2016-03-13 23:28:28', 1, 'product.php', 'page=1&product_type=1&cPath=84_85&pID=180&action=new_product&', '::1'),
(1512, '2016-03-13 23:28:32', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=new_product_preview&page=1&', '::1'),
(1513, '2016-03-13 23:28:34', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=update_product&page=1&', '::1'),
(1514, '2016-03-13 23:28:52', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=new_product_preview&page=1&', '::1'),
(1515, '2016-03-13 23:28:54', 1, 'product.php', 'cPath=84_85&product_type=1&pID=180&action=update_product&page=1&', '::1'),
(1516, '2016-03-13 23:28:54', 1, 'categories.php', 'cPath=84_85&pID=180&page=1&', '::1'),
(1517, '2016-03-14 00:24:47', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1518, '2016-03-14 00:25:01', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&search=solage lotion&', '::1'),
(1519, '2016-03-14 00:25:08', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&search=lotion&', '::1'),
(1520, '2016-03-14 00:29:08', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1521, '2016-03-14 00:29:54', 1, 'categories.php', 'x=63&y=10&product_type=1&cPath=92&action=new_product&', '::1'),
(1522, '2016-03-14 00:29:54', 1, 'product.php', 'x=63&y=10&product_type=1&cPath=92&action=new_product&', '::1'),
(1523, '2016-03-14 00:31:24', 1, 'product.php', 'cPath=92&product_type=1&action=new_product_preview&', '::1'),
(1524, '2016-03-14 00:31:27', 1, 'product.php', 'cPath=92&product_type=1&action=insert_product&', '::1'),
(1525, '2016-03-14 00:31:27', 1, 'categories.php', 'cPath=92&pID=208&', '::1'),
(1526, '2016-03-14 00:32:29', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&search=cleanse&', '::1'),
(1527, '2016-03-14 00:32:32', 1, 'attributes_controller.php', 'products_filter=197&current_category_id=0&', '::1'),
(1528, '2016-03-14 00:32:37', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1'),
(1529, '2016-03-14 00:32:37', 1, 'attributes_controller.php', 'current_category_id=87&products_filter=197&', '::1'),
(1530, '2016-03-14 00:32:50', 1, 'categories.php', '', '::1'),
(1531, '2016-03-14 00:32:53', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&search=cleanse&', '::1'),
(1532, '2016-03-14 00:33:06', 1, 'product.php', 'cPath=87&product_type=1&pID=197&action=new_product&search=cleanse&', '::1'),
(1533, '2016-03-14 00:33:09', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&search=cleanse&', '::1'),
(1534, '2016-03-14 00:33:16', 1, 'attributes_controller.php', 'products_filter=197&current_category_id=0&', '::1'),
(1535, '2016-03-14 00:33:18', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1536, '2016-03-14 00:33:28', 1, 'products_to_categories.php', 'action=update_product&products_filter=197&current_category_id=87&', '::1'),
(1537, '2016-03-14 00:33:28', 1, 'products_to_categories.php', 'products_filter=197&current_category_id=87&', '::1'),
(1538, '2016-03-14 00:34:35', 1, 'categories.php', 'action=new_product&cPath=87&pID=197&product_type=1&', '::1'),
(1539, '2016-03-14 00:34:35', 1, 'product.php', 'action=new_product&cPath=87&pID=197&product_type=1&', '::1'),
(1540, '2016-03-14 00:34:42', 1, 'product.php', 'cPath=87&product_type=1&pID=197&action=new_product_preview&', '::1'),
(1541, '2016-03-14 00:34:43', 1, 'product.php', 'cPath=87&product_type=1&pID=197&action=update_product&', '::1'),
(1542, '2016-03-14 00:34:43', 1, 'categories.php', 'cPath=87&pID=197&', '::1'),
(1543, '2016-03-14 00:35:15', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1544, '2016-03-14 00:35:17', 1, 'categories.php', 'x=3&y=8&product_type=1&cPath=92&action=new_product&', '::1'),
(1545, '2016-03-14 00:35:17', 1, 'product.php', 'x=3&y=8&product_type=1&cPath=92&action=new_product&', '::1'),
(1546, '2016-03-14 00:36:21', 1, 'product.php', 'cPath=92&product_type=1&action=new_product_preview&', '::1'),
(1547, '2016-03-14 00:36:23', 1, 'product.php', 'cPath=92&product_type=1&action=insert_product&', '::1'),
(1548, '2016-03-14 00:36:23', 1, 'categories.php', 'cPath=92&pID=209&', '::1'),
(1549, '2016-03-14 00:36:39', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=208&action=new_product&', '::1'),
(1550, '2016-03-14 00:36:44', 1, 'product.php', 'cPath=92&product_type=1&pID=208&action=new_product_preview&page=1&', '::1'),
(1551, '2016-03-14 00:36:45', 1, 'product.php', 'cPath=92&product_type=1&pID=208&action=update_product&page=1&', '::1'),
(1552, '2016-03-14 00:36:45', 1, 'categories.php', 'cPath=92&pID=208&page=1&', '::1'),
(1553, '2016-03-14 00:37:16', 1, 'attributes_controller.php', 'products_filter=209&current_category_id=92&', '::1'),
(1554, '2016-03-14 00:37:18', 1, 'products_to_categories.php', 'products_filter=209&current_category_id=92&', '::1'),
(1555, '2016-03-14 00:38:18', 1, 'categories.php', '', '::1'),
(1556, '2016-03-14 00:38:24', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1557, '2016-03-14 00:38:25', 1, 'categories.php', 'x=57&y=18&product_type=1&cPath=92&action=new_product&', '::1'),
(1558, '2016-03-14 00:38:25', 1, 'product.php', 'x=57&y=18&product_type=1&cPath=92&action=new_product&', '::1'),
(1559, '2016-03-14 00:38:39', 1, 'categories.php', '', '::1'),
(1560, '2016-03-14 00:38:46', 1, 'categories.php', 'cPath=91&', '::1'),
(1561, '2016-03-14 00:38:49', 1, 'categories.php', 'cPath=91_92&', '::1'),
(1562, '2016-03-14 00:38:53', 1, 'product.php', 'cPath=91_92&product_type=1&pID=197&action=copy_to&', '::1'),
(1563, '2016-03-14 00:39:02', 1, 'product.php', 'action=copy_to_confirm&cPath=91_92&page=1&', '::1'),
(1564, '2016-03-14 00:39:03', 1, 'categories.php', 'cPath=92&pID=210&page=1&', '::1'),
(1565, '2016-03-14 00:39:06', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=210&action=new_product&', '::1'),
(1566, '2016-03-14 00:39:52', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=new_product_preview&page=1&', '::1'),
(1567, '2016-03-14 00:39:53', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=update_product&page=1&', '::1'),
(1568, '2016-03-14 00:39:53', 1, 'categories.php', 'cPath=92&pID=210&page=1&', '::1'),
(1569, '2016-03-14 00:40:07', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=210&action=new_product&', '::1'),
(1570, '2016-03-14 00:40:18', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=new_product_preview&page=1&', '::1'),
(1571, '2016-03-14 00:40:19', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=update_product&page=1&', '::1'),
(1572, '2016-03-14 00:40:19', 1, 'categories.php', 'cPath=92&pID=210&page=1&', '::1'),
(1573, '2016-03-14 00:40:49', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=copy_to&', '::1'),
(1574, '2016-03-14 00:40:54', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1575, '2016-03-14 00:40:54', 1, 'categories.php', 'cPath=92&pID=211&page=1&', '::1'),
(1576, '2016-03-14 00:40:57', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=211&action=new_product&', '::1'),
(1577, '2016-03-14 00:42:00', 1, 'product.php', 'cPath=92&product_type=1&pID=211&action=new_product_preview&page=1&', '::1'),
(1578, '2016-03-14 00:42:02', 1, 'product.php', 'cPath=92&product_type=1&pID=211&action=update_product&page=1&', '::1'),
(1579, '2016-03-14 00:42:02', 1, 'categories.php', 'cPath=92&pID=211&page=1&', '::1'),
(1580, '2016-03-14 00:42:25', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=copy_to&', '::1'),
(1581, '2016-03-14 00:42:27', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1582, '2016-03-14 00:42:27', 1, 'categories.php', 'cPath=92&pID=212&page=1&', '::1'),
(1583, '2016-03-14 00:42:31', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=212&action=new_product&', '::1'),
(1584, '2016-03-14 00:44:14', 1, 'product.php', 'cPath=92&product_type=1&pID=212&action=new_product_preview&page=1&', '::1'),
(1585, '2016-03-14 00:44:27', 1, 'product.php', 'cPath=92&product_type=1&pID=212&action=update_product&page=1&', '::1'),
(1586, '2016-03-14 00:44:27', 1, 'categories.php', 'cPath=92&pID=212&page=1&', '::1'),
(1587, '2016-03-14 00:44:39', 1, 'product.php', 'cPath=92&product_type=1&pID=212&action=new_product&', '::1'),
(1588, '2016-03-14 00:44:41', 1, 'categories.php', 'cPath=92&pID=212&', '::1'),
(1589, '2016-03-14 00:44:44', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1590, '2016-03-14 00:45:37', 1, 'attributes_controller.php', '', '::1'),
(1591, '2016-03-14 00:45:52', 1, 'attributes_controller.php', 'securityToken=397fe67980861057719a67403c4020a1&current_category_id=91&products_filter=&action=new_cat&', '::1'),
(1592, '2016-03-14 00:45:53', 1, 'attributes_controller.php', 'products_filter=&current_category_id=91&', '::1'),
(1593, '2016-03-14 00:45:57', 1, 'attributes_controller.php', 'securityToken=397fe67980861057719a67403c4020a1&current_category_id=92&products_filter=&action=new_cat&', '::1'),
(1594, '2016-03-14 00:45:57', 1, 'attributes_controller.php', 'products_filter=197&current_category_id=92&', '::1'),
(1595, '2016-03-14 00:46:10', 1, 'products_price_manager.php', 'products_filter=197&current_category_id=92&', '::1'),
(1596, '2016-03-14 00:46:29', 1, 'specials.php', 'add_products_id=197&action=new&sID=&go_back=ON&current_category_id=92&', '::1'),
(1597, '2016-03-14 00:46:40', 1, 'products_price_manager.php', 'products_filter=197&current_category_id=92&', '::1'),
(1598, '2016-03-14 00:46:43', 1, 'products_price_manager.php', 'action=set_products_filter&', '::1'),
(1599, '2016-03-14 00:46:43', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1600, '2016-03-14 00:46:57', 1, 'products_price_manager.php', 'action=edit&products_filter=212&current_category_id=92&', '::1'),
(1601, '2016-03-14 00:46:57', 1, 'products_price_manager.php', 'action=edit_update&products_filter=212&current_category_id=92&', '::1'),
(1602, '2016-03-14 00:47:23', 1, 'specials.php', 'add_products_id=212&action=new&sID=&go_back=ON&current_category_id=92&', '::1'),
(1603, '2016-03-14 00:47:28', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1604, '2016-03-14 00:47:33', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1605, '2016-03-14 00:49:03', 1, 'configuration.php', 'gID=13&', '::1'),
(1606, '2016-03-14 00:49:21', 1, 'products_price_manager.php', '', '::1'),
(1607, '2016-03-14 00:49:26', 1, 'products_price_manager.php', 'securityToken=397fe67980861057719a67403c4020a1&current_category_id=92&products_filter=&action=new_cat&', '::1'),
(1608, '2016-03-14 00:49:26', 1, 'products_price_manager.php', 'products_filter=197&current_category_id=92&', '::1'),
(1609, '2016-03-14 00:49:32', 1, 'products_price_manager.php', 'action=set_products_filter&', '::1'),
(1610, '2016-03-14 00:49:32', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1611, '2016-03-14 00:49:52', 1, 'products_price_manager.php', 'action=edit&products_filter=212&current_category_id=92&', '::1'),
(1612, '2016-03-14 00:49:52', 1, 'products_price_manager.php', 'action=edit_update&products_filter=212&current_category_id=92&', '::1'),
(1613, '2016-03-14 00:50:06', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&action=update&', '::1'),
(1614, '2016-03-14 00:50:06', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1615, '2016-03-14 00:50:30', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1616, '2016-03-14 00:50:35', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1'),
(1617, '2016-03-14 00:50:35', 1, 'attributes_controller.php', 'current_category_id=92&products_filter=212&', '::1'),
(1618, '2016-03-14 00:50:50', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1619, '2016-03-14 00:50:50', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1620, '2016-03-14 00:51:49', 1, 'options_name_manager.php', '', '::1'),
(1621, '2016-03-14 00:52:05', 1, 'options_name_manager.php', 'action=add_product_options&option_page=1&option_order_by=products_options_id&', '::1'),
(1622, '2016-03-14 00:52:05', 1, 'options_name_manager.php', 'option_page=1&option_order_by=products_options_id&', '::1'),
(1623, '2016-03-14 00:52:08', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(1624, '2016-03-14 00:52:11', 1, 'options_name_manager.php', 'action=update_option&option_id=20&option_order_by=products_options_id&option_page=2&', '::1'),
(1625, '2016-03-14 00:52:56', 1, 'options_name_manager.php', 'action=update_option_name&option_page=2&option_order_by=products_options_id&', '::1'),
(1626, '2016-03-14 00:52:56', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(1627, '2016-03-14 00:53:31', 1, 'options_name_manager.php', 'action=update_option&option_id=20&option_order_by=products_options_id&option_page=2&', '::1'),
(1628, '2016-03-14 00:53:38', 1, 'options_values_manager.php', '', '::1'),
(1629, '2016-03-14 00:54:02', 1, 'options_name_manager.php', '', '::1'),
(1630, '2016-03-14 00:54:10', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(1631, '2016-03-14 00:54:20', 1, 'options_values_manager.php', '', '::1'),
(1632, '2016-03-14 00:54:34', 1, 'options_name_manager.php', '', '::1'),
(1633, '2016-03-14 00:54:36', 1, 'options_values_manager.php', '', '::1'),
(1634, '2016-03-14 00:54:52', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=1&', '::1'),
(1635, '2016-03-14 00:54:52', 1, 'options_values_manager.php', 'value_page=1&', '::1'),
(1636, '2016-03-14 00:54:58', 1, 'categories.php', '', '::1'),
(1637, '2016-03-14 00:55:03', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1638, '2016-03-14 00:55:06', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1639, '2016-03-14 00:55:08', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1');
INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`) VALUES
(1640, '2016-03-14 00:55:08', 1, 'attributes_controller.php', 'current_category_id=92&products_filter=212&', '::1'),
(1641, '2016-03-14 00:55:15', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1642, '2016-03-14 00:55:15', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1643, '2016-03-14 00:55:38', 1, 'categories.php', 'action=new_product&cPath=91_92&pID=212&product_type=1&', '::1'),
(1644, '2016-03-14 00:55:38', 1, 'product.php', 'action=new_product&cPath=91_92&pID=212&product_type=1&', '::1'),
(1645, '2016-03-14 00:55:46', 1, 'product.php', 'cPath=91_92&product_type=1&pID=212&action=new_product_preview&', '::1'),
(1646, '2016-03-14 00:55:47', 1, 'product.php', 'cPath=91_92&product_type=1&pID=212&action=update_product&', '::1'),
(1647, '2016-03-14 00:55:47', 1, 'categories.php', 'cPath=91_92&pID=212&', '::1'),
(1648, '2016-03-14 00:56:01', 1, 'options_name_manager.php', '', '::1'),
(1649, '2016-03-14 00:56:03', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(1650, '2016-03-14 00:56:05', 1, 'options_name_manager.php', 'action=update_option&option_id=20&option_order_by=products_options_id&option_page=2&', '::1'),
(1651, '2016-03-14 00:56:12', 1, 'options_name_manager.php', 'option_page=2&option_order_by=products_options_id&', '::1'),
(1652, '2016-03-14 00:56:16', 1, 'options_values_manager.php', '', '::1'),
(1653, '2016-03-14 00:56:27', 1, 'options_values_manager.php', 'value_page=2&', '::1'),
(1654, '2016-03-14 00:56:31', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1655, '2016-03-14 00:56:33', 1, 'options_values_manager.php', 'value_page=5&', '::1'),
(1656, '2016-03-14 00:56:36', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1657, '2016-03-14 00:56:39', 1, 'options_values_manager.php', 'action=update_option_value&value_id=69&value_page=6&', '::1'),
(1658, '2016-03-14 00:56:47', 1, 'options_values_manager.php', 'action=update_value&value_page=6&', '::1'),
(1659, '2016-03-14 00:56:47', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1660, '2016-03-14 00:57:25', 1, 'options_values_manager.php', 'action=update_option_value&value_id=69&value_page=6&', '::1'),
(1661, '2016-03-14 00:57:30', 1, 'options_values_manager.php', 'action=update_value&value_page=6&', '::1'),
(1662, '2016-03-14 00:57:30', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1663, '2016-03-14 00:57:38', 1, 'categories.php', '', '::1'),
(1664, '2016-03-14 00:57:41', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1665, '2016-03-14 00:57:44', 1, 'categories.php', 'cPath=92&pID=212&action=attribute_features&page=1&', '::1'),
(1666, '2016-03-14 00:57:48', 1, 'categories.php', 'cPath=92&pID=212&page=1&', '::1'),
(1667, '2016-03-14 00:57:53', 1, 'categories.php', 'cPath=92&pID=212&action=attribute_features&page=1&', '::1'),
(1668, '2016-03-14 00:58:04', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1669, '2016-03-14 00:58:10', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1104&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1670, '2016-03-14 00:58:19', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1671, '2016-03-14 00:58:20', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1672, '2016-03-14 00:58:30', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1673, '2016-03-14 00:58:40', 1, 'products_price_manager.php', 'action=edit&products_filter=212&current_category_id=92&', '::1'),
(1674, '2016-03-14 00:58:40', 1, 'products_price_manager.php', 'action=edit_update&products_filter=212&current_category_id=92&', '::1'),
(1675, '2016-03-14 00:58:44', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&action=update&', '::1'),
(1676, '2016-03-14 00:58:44', 1, 'products_price_manager.php', 'products_filter=212&current_category_id=92&', '::1'),
(1677, '2016-03-14 00:59:58', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1678, '2016-03-14 00:59:58', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1679, '2016-03-14 01:00:22', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1680, '2016-03-14 01:00:23', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1681, '2016-03-14 01:00:30', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1682, '2016-03-14 01:00:30', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1683, '2016-03-14 01:00:37', 1, 'options_values_manager.php', '', '::1'),
(1684, '2016-03-14 01:00:41', 1, 'attributes_controller.php', '', '::1'),
(1685, '2016-03-14 01:00:45', 1, 'attributes_controller.php', 'securityToken=397fe67980861057719a67403c4020a1&current_category_id=92&products_filter=&action=new_cat&', '::1'),
(1686, '2016-03-14 01:00:45', 1, 'attributes_controller.php', 'products_filter=197&current_category_id=92&', '::1'),
(1687, '2016-03-14 01:00:48', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1'),
(1688, '2016-03-14 01:00:48', 1, 'attributes_controller.php', 'current_category_id=92&products_filter=212&', '::1'),
(1689, '2016-03-14 01:01:02', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1690, '2016-03-14 01:01:02', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1691, '2016-03-14 01:01:26', 1, 'attributes_controller.php', 'action=delete_option_name_values_confirm&products_options_id_all=20&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1692, '2016-03-14 01:01:31', 1, 'attributes_controller.php', 'action=delete_option_name_values&', '::1'),
(1693, '2016-03-14 01:01:31', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1694, '2016-03-14 01:02:25', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1695, '2016-03-14 01:02:25', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1696, '2016-03-14 01:02:33', 1, 'attributes_controller.php', 'action=delete_option_name_values_confirm&products_options_id_all=20&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1697, '2016-03-14 01:02:36', 1, 'attributes_controller.php', 'action=delete_option_name_values&', '::1'),
(1698, '2016-03-14 01:02:36', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=92&', '::1'),
(1699, '2016-03-14 01:03:00', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1700, '2016-03-14 01:03:00', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1701, '2016-03-14 01:03:10', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1115&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1702, '2016-03-14 01:03:18', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1703, '2016-03-14 01:03:18', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1704, '2016-03-14 01:03:23', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1115&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1705, '2016-03-14 01:03:35', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1706, '2016-03-14 01:03:35', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1707, '2016-03-14 01:03:44', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1112&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1708, '2016-03-14 01:04:01', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1709, '2016-03-14 01:04:01', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1710, '2016-03-14 01:04:07', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1113&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1711, '2016-03-14 01:04:14', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1712, '2016-03-14 01:04:14', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1713, '2016-03-14 01:04:18', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1114&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1714, '2016-03-14 01:04:25', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1715, '2016-03-14 01:04:25', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1716, '2016-03-14 01:05:16', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1717, '2016-03-14 01:05:17', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1718, '2016-03-14 01:05:24', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1719, '2016-03-14 01:05:24', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1720, '2016-03-14 01:05:28', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1721, '2016-03-14 01:05:29', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1722, '2016-03-14 01:05:32', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1723, '2016-03-14 01:05:33', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1724, '2016-03-14 01:05:36', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1725, '2016-03-14 01:05:36', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1726, '2016-03-14 01:05:41', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1727, '2016-03-14 01:05:41', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1728, '2016-03-14 01:05:46', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=6&', '::1'),
(1729, '2016-03-14 01:05:46', 1, 'options_values_manager.php', 'value_page=6&', '::1'),
(1730, '2016-03-14 01:05:51', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1731, '2016-03-14 01:05:56', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1732, '2016-03-14 01:05:57', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1733, '2016-03-14 01:06:01', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1734, '2016-03-14 01:06:01', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1735, '2016-03-14 01:06:05', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1736, '2016-03-14 01:06:05', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1737, '2016-03-14 01:06:18', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1738, '2016-03-14 01:06:19', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1739, '2016-03-14 01:06:28', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1740, '2016-03-14 01:06:28', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1741, '2016-03-14 01:06:33', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1742, '2016-03-14 01:06:33', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1743, '2016-03-14 01:06:37', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1744, '2016-03-14 01:06:37', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1745, '2016-03-14 01:06:42', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=7&', '::1'),
(1746, '2016-03-14 01:06:42', 1, 'options_values_manager.php', 'value_page=7&', '::1'),
(1747, '2016-03-14 01:06:44', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1748, '2016-03-14 01:06:50', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1749, '2016-03-14 01:06:50', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1750, '2016-03-14 01:06:55', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1751, '2016-03-14 01:06:55', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1752, '2016-03-14 01:07:00', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1753, '2016-03-14 01:07:00', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1754, '2016-03-14 01:07:05', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1755, '2016-03-14 01:07:05', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1756, '2016-03-14 01:07:09', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1757, '2016-03-14 01:07:09', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1758, '2016-03-14 01:07:13', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1759, '2016-03-14 01:07:13', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1760, '2016-03-14 01:07:18', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1761, '2016-03-14 01:07:18', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1762, '2016-03-14 01:07:24', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1763, '2016-03-14 01:07:24', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1764, '2016-03-14 01:07:29', 1, 'options_values_manager.php', 'action=add_product_option_values&value_page=8&', '::1'),
(1765, '2016-03-14 01:07:29', 1, 'options_values_manager.php', 'value_page=8&', '::1'),
(1766, '2016-03-14 01:07:44', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1'),
(1767, '2016-03-14 01:07:44', 1, 'attributes_controller.php', 'current_category_id=92&products_filter=212&', '::1'),
(1768, '2016-03-14 01:08:09', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1769, '2016-03-14 01:08:09', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1770, '2016-03-14 01:08:15', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1119&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1771, '2016-03-14 01:08:25', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1772, '2016-03-14 01:08:25', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1773, '2016-03-14 01:08:33', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1121&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1774, '2016-03-14 01:08:47', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1775, '2016-03-14 01:08:47', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1776, '2016-03-14 01:08:53', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1123&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1777, '2016-03-14 01:08:59', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1778, '2016-03-14 01:08:59', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1779, '2016-03-14 01:09:02', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1125&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1780, '2016-03-14 01:09:06', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1781, '2016-03-14 01:09:06', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1782, '2016-03-14 01:09:10', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1127&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1783, '2016-03-14 01:09:14', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1784, '2016-03-14 01:09:14', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1785, '2016-03-14 01:09:18', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1129&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1786, '2016-03-14 01:09:25', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1787, '2016-03-14 01:09:25', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1788, '2016-03-14 01:09:28', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1131&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1789, '2016-03-14 01:09:33', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1790, '2016-03-14 01:09:33', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1791, '2016-03-14 01:10:19', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1132&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1792, '2016-03-14 01:10:28', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1793, '2016-03-14 01:10:28', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1794, '2016-03-14 01:10:32', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1133&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1795, '2016-03-14 01:10:37', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1796, '2016-03-14 01:10:37', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1797, '2016-03-14 01:10:41', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1134&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1798, '2016-03-14 01:10:46', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1799, '2016-03-14 01:10:46', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1800, '2016-03-14 01:10:49', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1135&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1801, '2016-03-14 01:10:55', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1802, '2016-03-14 01:10:55', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1803, '2016-03-14 01:10:59', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1136&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1804, '2016-03-14 01:11:06', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1805, '2016-03-14 01:11:06', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1806, '2016-03-14 01:11:09', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1137&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1807, '2016-03-14 01:11:19', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1808, '2016-03-14 01:11:20', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1809, '2016-03-14 01:11:23', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1138&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1810, '2016-03-14 01:11:28', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1811, '2016-03-14 01:11:28', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1812, '2016-03-14 01:11:31', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1139&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1813, '2016-03-14 01:11:37', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1814, '2016-03-14 01:11:37', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1815, '2016-03-14 01:11:41', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1116&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1816, '2016-03-14 01:11:46', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1817, '2016-03-14 01:11:47', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1818, '2016-03-14 01:11:52', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1117&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1819, '2016-03-14 01:11:57', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1820, '2016-03-14 01:11:57', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1821, '2016-03-14 01:12:01', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1118&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1822, '2016-03-14 01:12:05', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1823, '2016-03-14 01:12:05', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1824, '2016-03-14 01:12:08', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1120&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1825, '2016-03-14 01:12:15', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1826, '2016-03-14 01:12:15', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1827, '2016-03-14 01:12:18', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1122&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1828, '2016-03-14 01:12:24', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1829, '2016-03-14 01:12:24', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1830, '2016-03-14 01:12:28', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1124&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1831, '2016-03-14 01:12:35', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1832, '2016-03-14 01:12:35', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1833, '2016-03-14 01:12:39', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1126&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1834, '2016-03-14 01:12:44', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1835, '2016-03-14 01:12:44', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1836, '2016-03-14 01:12:47', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1128&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1837, '2016-03-14 01:12:53', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1838, '2016-03-14 01:12:53', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1839, '2016-03-14 01:12:56', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1130&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1840, '2016-03-14 01:13:01', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1841, '2016-03-14 01:13:02', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1842, '2016-03-14 01:13:07', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1115&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1843, '2016-03-14 01:13:22', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1844, '2016-03-14 01:13:22', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1845, '2016-03-14 01:14:04', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1116&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1846, '2016-03-14 01:14:08', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1847, '2016-03-14 01:14:09', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1848, '2016-03-14 01:14:19', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1117&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1849, '2016-03-14 01:14:24', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1850, '2016-03-14 01:14:24', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1851, '2016-03-14 01:14:29', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1118&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1852, '2016-03-14 01:14:34', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1853, '2016-03-14 01:14:34', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1854, '2016-03-14 01:14:39', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1120&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1855, '2016-03-14 01:14:44', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1856, '2016-03-14 01:14:44', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1857, '2016-03-14 01:14:47', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1122&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1858, '2016-03-14 01:14:52', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1859, '2016-03-14 01:14:52', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1860, '2016-03-14 01:14:56', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1124&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1861, '2016-03-14 01:15:00', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1862, '2016-03-14 01:15:00', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1863, '2016-03-14 01:15:04', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1126&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1864, '2016-03-14 01:15:08', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1865, '2016-03-14 01:15:08', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1866, '2016-03-14 01:15:11', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1128&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1867, '2016-03-14 01:15:16', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1868, '2016-03-14 01:15:16', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1869, '2016-03-14 01:15:19', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1130&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1870, '2016-03-14 01:15:24', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(1871, '2016-03-14 01:15:24', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1872, '2016-03-14 01:16:14', 1, 'categories.php', '', '::1'),
(1873, '2016-03-14 01:16:34', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1874, '2016-03-14 01:16:39', 1, 'product.php', 'cPath=92&product_type=1&pID=211&action=copy_to&', '::1'),
(1875, '2016-03-14 01:16:45', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1876, '2016-03-14 01:16:45', 1, 'categories.php', 'cPath=92&pID=213&page=1&', '::1'),
(1877, '2016-03-14 01:16:48', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=213&action=new_product&', '::1'),
(1878, '2016-03-14 01:18:10', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=new_product_preview&page=1&', '::1'),
(1879, '2016-03-14 01:18:20', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=update_product&page=1&', '::1'),
(1880, '2016-03-14 01:18:20', 1, 'categories.php', 'cPath=92&pID=213&page=1&', '::1'),
(1881, '2016-03-14 01:18:48', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=copy_to&', '::1'),
(1882, '2016-03-14 01:18:50', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1883, '2016-03-14 01:18:50', 1, 'categories.php', 'cPath=92&pID=214&page=1&', '::1'),
(1884, '2016-03-14 01:18:53', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=214&action=new_product&', '::1'),
(1885, '2016-03-14 01:20:30', 1, 'product.php', 'cPath=92&product_type=1&pID=214&action=new_product_preview&page=1&', '::1'),
(1886, '2016-03-14 01:20:32', 1, 'product.php', 'cPath=92&product_type=1&pID=214&action=update_product&page=1&', '::1'),
(1887, '2016-03-14 01:20:32', 1, 'categories.php', 'cPath=92&pID=214&page=1&', '::1'),
(1888, '2016-03-14 01:20:35', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=214&action=new_product&', '::1'),
(1889, '2016-03-14 01:20:59', 1, 'categories.php', 'cPath=92&pID=214&page=1&', '::1'),
(1890, '2016-03-14 01:21:02', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=213&action=new_product&', '::1'),
(1891, '2016-03-14 01:21:24', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=new_product_preview&page=1&', '::1'),
(1892, '2016-03-14 01:21:25', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=update_product&page=1&', '::1'),
(1893, '2016-03-14 01:21:25', 1, 'categories.php', 'cPath=92&pID=213&page=1&', '::1'),
(1894, '2016-03-14 01:22:04', 1, 'product.php', 'cPath=92&product_type=1&pID=213&action=copy_to&', '::1'),
(1895, '2016-03-14 01:22:07', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1896, '2016-03-14 01:22:07', 1, 'categories.php', 'cPath=92&pID=215&page=1&', '::1'),
(1897, '2016-03-14 01:22:14', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=215&action=new_product&', '::1'),
(1898, '2016-03-14 01:23:42', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=new_product_preview&page=1&', '::1'),
(1899, '2016-03-14 01:23:45', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=update_product&page=1&', '::1'),
(1900, '2016-03-14 01:23:45', 1, 'categories.php', 'cPath=92&pID=215&page=1&', '::1'),
(1901, '2016-03-14 01:23:58', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=215&action=new_product&', '::1'),
(1902, '2016-03-14 01:24:13', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=new_product_preview&page=1&', '::1'),
(1903, '2016-03-14 01:24:14', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=update_product&page=1&', '::1'),
(1904, '2016-03-14 01:24:14', 1, 'categories.php', 'cPath=92&pID=215&page=1&', '::1'),
(1905, '2016-03-14 01:24:32', 1, 'attributes_controller.php', 'products_filter=215&current_category_id=92&', '::1'),
(1906, '2016-03-14 01:24:52', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=215&', '::1'),
(1907, '2016-03-14 01:24:53', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=215&current_category_id=92&', '::1'),
(1908, '2016-03-14 01:25:13', 1, 'attributes_controller.php', 'action=set_products_filter&', '::1'),
(1909, '2016-03-14 01:25:13', 1, 'attributes_controller.php', 'current_category_id=92&products_filter=212&', '::1'),
(1910, '2016-03-14 01:25:23', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=212&', '::1'),
(1911, '2016-03-14 01:25:23', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1912, '2016-03-14 01:25:51', 1, 'attributes_controller.php', 'action=delete_product_attribute&attribute_id=1145&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1913, '2016-03-14 01:26:14', 1, 'attributes_controller.php', 'action=delete_attribute&attribute_id=1145&attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1914, '2016-03-14 01:26:14', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=92&', '::1'),
(1915, '2016-03-14 01:26:51', 1, 'categories.php', '', '::1'),
(1916, '2016-03-14 01:26:54', 1, 'categories.php', 'securityToken=397fe67980861057719a67403c4020a1&cPath=92&', '::1'),
(1917, '2016-03-14 01:27:07', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=copy_to&', '::1'),
(1918, '2016-03-14 01:27:12', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1919, '2016-03-14 01:27:12', 1, 'categories.php', 'cPath=92&pID=216&page=1&', '::1'),
(1920, '2016-03-14 01:27:19', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=216&action=new_product&', '::1'),
(1921, '2016-03-14 01:28:25', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=new_product_preview&page=1&', '::1'),
(1922, '2016-03-14 01:28:26', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=update_product&page=1&', '::1'),
(1923, '2016-03-14 01:28:26', 1, 'categories.php', 'cPath=92&pID=216&page=1&', '::1'),
(1924, '2016-03-14 01:29:22', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=216&action=new_product&', '::1'),
(1925, '2016-03-14 01:29:32', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=new_product_preview&page=1&', '::1'),
(1926, '2016-03-14 01:29:54', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=update_product&page=1&', '::1'),
(1927, '2016-03-14 01:29:54', 1, 'categories.php', 'cPath=92&pID=216&page=1&', '::1'),
(1928, '2016-03-14 01:30:09', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=copy_to&', '::1'),
(1929, '2016-03-14 01:30:12', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1930, '2016-03-14 01:30:12', 1, 'categories.php', 'cPath=92&pID=217&page=1&', '::1'),
(1931, '2016-03-14 01:30:21', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=217&action=new_product&', '::1'),
(1932, '2016-03-14 01:31:15', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=new_product_preview&page=1&', '::1'),
(1933, '2016-03-14 01:31:16', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=update_product&page=1&', '::1'),
(1934, '2016-03-14 01:31:16', 1, 'categories.php', 'cPath=92&pID=217&page=1&', '::1'),
(1935, '2016-03-14 01:31:29', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=copy_to&', '::1'),
(1936, '2016-03-14 01:31:31', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1937, '2016-03-14 01:31:31', 1, 'categories.php', 'cPath=92&pID=218&page=1&', '::1'),
(1938, '2016-03-14 01:31:35', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=217&action=new_product&', '::1'),
(1939, '2016-03-14 01:32:18', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=new_product_preview&page=1&', '::1'),
(1940, '2016-03-14 01:32:19', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=update_product&page=1&', '::1'),
(1941, '2016-03-14 01:32:19', 1, 'categories.php', 'cPath=92&pID=217&page=1&', '::1'),
(1942, '2016-03-14 01:32:40', 1, 'categories.php', 'action=setflag&flag=1&pID=218&cPath=92&page=1&', '::1'),
(1943, '2016-03-14 01:32:40', 1, 'categories.php', 'cPath=92&pID=218&page=1&', '::1'),
(1944, '2016-03-14 11:29:05', 0, 'login.php ', '', '::1'),
(1945, '2016-03-14 11:29:08', 0, 'login.php admin', '', '::1'),
(1946, '2016-03-14 11:29:13', 1, 'categories.php', '', '::1'),
(1947, '2016-03-14 11:29:17', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=85&', '::1'),
(1948, '2016-03-14 11:29:19', 1, 'product.php', 'page=1&product_type=1&cPath=85&pID=206&action=new_product&', '::1'),
(1949, '2016-03-14 11:29:23', 1, 'product.php', 'cPath=85&product_type=1&pID=206&action=new_product_preview&page=1&', '::1'),
(1950, '2016-03-14 11:29:26', 1, 'product.php', 'cPath=85&product_type=1&pID=206&action=update_product&page=1&', '::1'),
(1951, '2016-03-14 11:29:26', 1, 'categories.php', 'cPath=85&pID=206&page=1&', '::1'),
(1952, '2016-03-14 11:29:32', 1, 'modules.php', 'set=payment&', '::1'),
(1953, '2016-03-14 11:29:34', 1, 'modules.php', 'set=payment&module=shift4&', '::1'),
(1954, '2016-03-14 11:29:36', 1, 'modules.php', 'set=payment&module=shift4&action=edit&', '::1'),
(1955, '2016-03-14 11:33:21', 1, 'categories.php', '', '::1'),
(1956, '2016-03-14 11:33:27', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&', '::1'),
(1957, '2016-03-14 11:34:21', 1, 'product.php', 'cPath=92&product_type=1&pID=208&action=copy_to&', '::1'),
(1958, '2016-03-14 11:34:24', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1959, '2016-03-14 11:34:24', 1, 'categories.php', 'cPath=92&pID=219&page=1&', '::1'),
(1960, '2016-03-14 11:34:27', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=219&action=new_product&', '::1'),
(1961, '2016-03-14 11:35:33', 1, 'product.php', 'cPath=92&product_type=1&pID=219&action=new_product_preview&page=1&', '::1'),
(1962, '2016-03-14 11:35:34', 1, 'product.php', 'cPath=92&product_type=1&pID=219&action=update_product&page=1&', '::1'),
(1963, '2016-03-14 11:35:34', 1, 'categories.php', 'cPath=92&pID=219&page=1&', '::1'),
(1964, '2016-03-14 11:35:57', 1, 'categories.php', 'cPath=92&page=2&', '::1'),
(1965, '2016-03-14 11:36:00', 1, 'categories.php', 'cPath=92&page=1&', '::1'),
(1966, '2016-03-14 11:36:03', 1, 'product.php', 'cPath=92&product_type=1&pID=219&action=copy_to&', '::1'),
(1967, '2016-03-14 11:36:06', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1968, '2016-03-14 11:36:06', 1, 'categories.php', 'cPath=92&pID=220&page=1&', '::1'),
(1969, '2016-03-14 11:36:08', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=220&action=new_product&', '::1'),
(1970, '2016-03-14 11:37:14', 1, 'product.php', 'cPath=92&product_type=1&pID=220&action=new_product_preview&page=1&', '::1'),
(1971, '2016-03-14 11:37:15', 1, 'product.php', 'cPath=92&product_type=1&pID=220&action=update_product&page=1&', '::1'),
(1972, '2016-03-14 11:37:15', 1, 'categories.php', 'cPath=92&pID=220&page=1&', '::1'),
(1973, '2016-03-14 11:37:41', 1, 'product.php', 'cPath=92&product_type=1&pID=219&action=copy_to&', '::1'),
(1974, '2016-03-14 11:37:43', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1975, '2016-03-14 11:37:44', 1, 'categories.php', 'cPath=92&pID=221&page=1&', '::1'),
(1976, '2016-03-14 11:37:47', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=221&action=new_product&', '::1'),
(1977, '2016-03-14 11:38:37', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=new_product_preview&page=1&', '::1'),
(1978, '2016-03-14 11:38:39', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=update_product&page=1&', '::1'),
(1979, '2016-03-14 11:38:39', 1, 'categories.php', 'cPath=92&pID=221&page=1&', '::1'),
(1980, '2016-03-14 11:38:47', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=221&action=new_product&', '::1'),
(1981, '2016-03-14 11:38:55', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=new_product_preview&page=1&', '::1'),
(1982, '2016-03-14 11:38:56', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=update_product&page=1&', '::1'),
(1983, '2016-03-14 11:38:57', 1, 'categories.php', 'cPath=92&pID=221&page=1&', '::1'),
(1984, '2016-03-14 11:39:30', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=copy_to&', '::1'),
(1985, '2016-03-14 11:39:37', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1986, '2016-03-14 11:39:37', 1, 'categories.php', 'cPath=92&pID=222&page=1&', '::1'),
(1987, '2016-03-14 11:39:39', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=222&action=new_product&', '::1'),
(1988, '2016-03-14 11:40:26', 1, 'product.php', 'cPath=92&product_type=1&pID=222&action=new_product_preview&page=1&', '::1'),
(1989, '2016-03-14 11:40:28', 1, 'product.php', 'cPath=92&product_type=1&pID=222&action=update_product&page=1&', '::1'),
(1990, '2016-03-14 11:40:28', 1, 'categories.php', 'cPath=92&pID=222&page=1&', '::1'),
(1991, '2016-03-14 11:40:47', 1, 'product.php', 'cPath=92&product_type=1&pID=222&action=copy_to&', '::1'),
(1992, '2016-03-14 11:40:50', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(1993, '2016-03-14 11:40:50', 1, 'categories.php', 'cPath=92&pID=223&page=1&', '::1'),
(1994, '2016-03-14 11:40:53', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=223&action=new_product&', '::1'),
(1995, '2016-03-14 11:41:57', 1, 'product.php', 'cPath=92&product_type=1&pID=223&action=new_product_preview&page=1&', '::1'),
(1996, '2016-03-14 11:41:58', 1, 'product.php', 'cPath=92&product_type=1&pID=223&action=update_product&page=1&', '::1'),
(1997, '2016-03-14 11:41:58', 1, 'categories.php', 'cPath=92&pID=223&page=1&', '::1'),
(1998, '2016-03-14 11:42:31', 1, 'categories.php', 'action=setflag&flag=1&pID=223&cPath=92&page=1&', '::1'),
(1999, '2016-03-14 11:42:31', 1, 'categories.php', 'cPath=92&pID=223&page=1&', '::1'),
(2000, '2016-03-14 11:44:13', 1, 'categories.php', 'cPath=92&page=2&', '::1'),
(2001, '2016-03-14 11:44:16', 1, 'categories.php', 'cPath=92&page=1&', '::1'),
(2002, '2016-03-14 11:44:59', 1, 'product.php', 'cPath=92&product_type=1&pID=223&action=copy_to&', '::1'),
(2003, '2016-03-14 11:45:01', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(2004, '2016-03-14 11:45:01', 1, 'categories.php', 'cPath=92&pID=224&page=1&', '::1'),
(2005, '2016-03-14 11:45:03', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=224&action=new_product&', '::1'),
(2006, '2016-03-14 11:45:49', 1, 'product.php', 'cPath=92&product_type=1&pID=224&action=new_product_preview&page=1&', '::1'),
(2007, '2016-03-14 11:45:51', 1, 'product.php', 'cPath=92&product_type=1&pID=224&action=update_product&page=1&', '::1'),
(2008, '2016-03-14 11:45:51', 1, 'categories.php', 'cPath=92&pID=224&page=1&', '::1'),
(2009, '2016-03-14 11:45:53', 1, 'categories.php', 'action=setflag&flag=1&pID=224&cPath=92&page=1&', '::1'),
(2010, '2016-03-14 11:45:53', 1, 'categories.php', 'cPath=92&pID=224&page=1&', '::1'),
(2011, '2016-03-14 11:47:41', 1, 'attributes_controller.php', 'products_filter=221&current_category_id=92&', '::1'),
(2012, '2016-03-14 11:47:43', 1, 'categories.php', 'cPath=92&pID=224&page=1&', '::1'),
(2013, '2016-03-14 11:47:44', 1, 'attributes_controller.php', 'products_filter=221&current_category_id=92&', '::1'),
(2014, '2016-03-14 11:47:45', 1, 'categories.php', 'cPath=92&pID=224&page=1&', '::1'),
(2015, '2016-03-14 11:47:47', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=copy_to&', '::1'),
(2016, '2016-03-14 11:47:49', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(2017, '2016-03-14 11:47:50', 1, 'categories.php', 'cPath=92&pID=225&page=1&', '::1'),
(2018, '2016-03-14 11:47:52', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=225&action=new_product&', '::1'),
(2019, '2016-03-14 11:48:38', 1, 'product.php', 'cPath=92&product_type=1&pID=225&action=new_product_preview&page=1&', '::1'),
(2020, '2016-03-14 11:48:39', 1, 'product.php', 'cPath=92&product_type=1&pID=225&action=update_product&page=1&', '::1'),
(2021, '2016-03-14 11:48:39', 1, 'categories.php', 'cPath=92&pID=225&page=1&', '::1'),
(2022, '2016-03-14 11:49:11', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=copy_to&', '::1'),
(2023, '2016-03-14 11:49:13', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(2024, '2016-03-14 11:49:13', 1, 'categories.php', 'cPath=92&pID=226&page=1&', '::1'),
(2025, '2016-03-14 11:49:15', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=226&action=new_product&', '::1'),
(2026, '2016-03-14 11:50:16', 1, 'product.php', 'cPath=92&product_type=1&pID=226&action=new_product_preview&page=1&', '::1'),
(2027, '2016-03-14 11:50:46', 1, 'product.php', 'cPath=92&product_type=1&pID=226&action=update_product&page=1&', '::1'),
(2028, '2016-03-14 11:50:46', 1, 'categories.php', 'cPath=92&pID=226&page=1&', '::1'),
(2029, '2016-03-14 11:51:15', 1, 'product.php', 'cPath=92&product_type=1&pID=221&action=copy_to&', '::1'),
(2030, '2016-03-14 11:51:17', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=1&', '::1'),
(2031, '2016-03-14 11:51:17', 1, 'categories.php', 'cPath=92&pID=227&page=1&', '::1'),
(2032, '2016-03-14 11:51:18', 1, 'product.php', 'page=1&product_type=1&cPath=92&pID=227&action=new_product&', '::1'),
(2033, '2016-03-14 11:52:28', 1, 'product.php', 'cPath=92&product_type=1&pID=227&action=new_product_preview&page=1&', '::1'),
(2034, '2016-03-14 11:52:29', 1, 'product.php', 'cPath=92&product_type=1&pID=227&action=update_product&page=1&', '::1'),
(2035, '2016-03-14 11:52:29', 1, 'categories.php', 'cPath=92&pID=227&page=1&', '::1'),
(2036, '2016-03-14 11:52:56', 1, 'categories.php', 'cPath=92&page=2&', '::1'),
(2037, '2016-03-14 11:53:03', 1, 'product.php', 'page=2&product_type=1&cPath=92&pID=212&action=new_product&', '::1'),
(2038, '2016-03-14 11:53:05', 1, 'categories.php', 'cPath=92&pID=212&page=2&', '::1'),
(2039, '2016-03-14 11:53:07', 1, 'product.php', 'cPath=92&product_type=1&pID=212&action=copy_to&', '::1'),
(2040, '2016-03-14 11:53:13', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2041, '2016-03-14 11:53:13', 1, 'categories.php', 'cPath=93&pID=212&page=2&', '::1'),
(2042, '2016-03-14 11:53:43', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=94&', '::1'),
(2043, '2016-03-14 11:53:45', 1, 'categories.php', 'x=46&y=9&product_type=1&cPath=94&action=new_product&', '::1'),
(2044, '2016-03-14 11:53:45', 1, 'product.php', 'x=46&y=9&product_type=1&cPath=94&action=new_product&', '::1'),
(2045, '2016-03-14 11:54:59', 1, 'product.php', 'cPath=94&product_type=1&action=new_product_preview&', '::1'),
(2046, '2016-03-14 11:55:01', 1, 'product.php', 'cPath=94&product_type=1&action=insert_product&', '::1'),
(2047, '2016-03-14 11:55:01', 1, 'categories.php', 'cPath=94&pID=228&', '::1'),
(2048, '2016-03-14 11:55:11', 1, 'product.php', 'cPath=94&product_type=1&pID=228&action=copy_to&', '::1'),
(2049, '2016-03-14 11:55:14', 1, 'product.php', 'action=copy_to_confirm&cPath=94&page=1&', '::1'),
(2050, '2016-03-14 11:55:14', 1, 'categories.php', 'cPath=94&pID=229&page=1&', '::1'),
(2051, '2016-03-14 11:55:41', 1, 'product.php', 'page=1&product_type=1&cPath=94&pID=229&action=new_product&', '::1'),
(2052, '2016-03-14 11:56:26', 1, 'product.php', 'cPath=94&product_type=1&pID=229&action=new_product_preview&page=1&', '::1'),
(2053, '2016-03-14 11:56:27', 1, 'product.php', 'cPath=94&product_type=1&pID=229&action=update_product&page=1&', '::1'),
(2054, '2016-03-14 11:56:27', 1, 'categories.php', 'cPath=94&pID=229&page=1&', '::1'),
(2055, '2016-03-14 11:56:51', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&', '::1'),
(2056, '2016-03-14 11:56:58', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&page=2&', '::1'),
(2057, '2016-03-14 11:57:02', 1, 'product.php', 'cPath=92&product_type=1&pID=215&action=copy_to&', '::1'),
(2058, '2016-03-14 11:57:07', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2059, '2016-03-14 11:57:07', 1, 'categories.php', 'cPath=95&pID=215&page=2&', '::1'),
(2060, '2016-03-14 11:57:18', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=93&', '::1'),
(2061, '2016-03-14 11:57:22', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&', '::1');
INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`) VALUES
(2062, '2016-03-14 11:57:25', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&page=2&', '::1'),
(2063, '2016-03-14 11:57:29', 1, 'product.php', 'page=2&product_type=1&cPath=92&pID=216&action=new_product&', '::1'),
(2064, '2016-03-14 11:57:29', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=copy_to&', '::1'),
(2065, '2016-03-14 11:57:33', 1, 'categories.php', 'cPath=92&pID=216&page=2&', '::1'),
(2066, '2016-03-14 11:57:39', 1, 'product.php', 'cPath=92&product_type=1&pID=216&action=copy_to&', '::1'),
(2067, '2016-03-14 11:57:43', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2068, '2016-03-14 11:57:43', 1, 'categories.php', 'cPath=95&pID=216&page=2&', '::1'),
(2069, '2016-03-14 11:57:48', 1, 'categories.php', 'cID=95&', '::1'),
(2070, '2016-03-14 11:57:52', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&', '::1'),
(2071, '2016-03-14 11:57:56', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&page=3&cPath=92&', '::1'),
(2072, '2016-03-14 11:57:59', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&page=2&', '::1'),
(2073, '2016-03-14 11:58:04', 1, 'product.php', 'cPath=92&product_type=1&pID=218&action=copy_to&', '::1'),
(2074, '2016-03-14 11:58:07', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2075, '2016-03-14 11:58:08', 1, 'categories.php', 'cPath=95&pID=218&page=2&', '::1'),
(2076, '2016-03-14 11:58:11', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&', '::1'),
(2077, '2016-03-14 11:58:14', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=92&page=2&', '::1'),
(2078, '2016-03-14 11:58:16', 1, 'product.php', 'cPath=92&product_type=1&pID=217&action=copy_to&', '::1'),
(2079, '2016-03-14 11:58:20', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2080, '2016-03-14 11:58:20', 1, 'categories.php', 'cPath=95&pID=217&page=2&', '::1'),
(2081, '2016-03-14 11:58:43', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=94&', '::1'),
(2082, '2016-03-14 11:59:00', 1, 'product.php', 'page=1&product_type=1&cPath=94&pID=229&action=new_product&', '::1'),
(2083, '2016-03-14 11:59:04', 1, 'product.php', 'cPath=94&product_type=1&pID=229&action=new_product_preview&page=1&', '::1'),
(2084, '2016-03-14 11:59:06', 1, 'product.php', 'cPath=94&product_type=1&pID=229&action=update_product&page=1&', '::1'),
(2085, '2016-03-14 11:59:06', 1, 'categories.php', 'cPath=94&pID=229&page=1&', '::1'),
(2086, '2016-03-14 11:59:27', 1, 'product.php', 'page=1&product_type=1&cPath=94&pID=229&action=new_product&', '::1'),
(2087, '2016-03-14 11:59:28', 1, 'categories.php', 'cPath=94&pID=229&page=1&', '::1'),
(2088, '2016-03-14 11:59:30', 1, 'attributes_controller.php', 'products_filter=229&current_category_id=94&', '::1'),
(2089, '2016-03-14 11:59:37', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=229&', '::1'),
(2090, '2016-03-14 11:59:37', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=229&current_category_id=94&', '::1'),
(2091, '2016-03-14 12:00:01', 1, 'categories.php', '', '::1'),
(2092, '2016-03-14 12:00:05', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=96&', '::1'),
(2093, '2016-03-14 12:00:14', 1, 'categories.php', 'x=49&y=14&product_type=1&cPath=96&action=new_product&', '::1'),
(2094, '2016-03-14 12:00:14', 1, 'product.php', 'x=49&y=14&product_type=1&cPath=96&action=new_product&', '::1'),
(2095, '2016-03-14 12:01:26', 1, 'product.php', 'cPath=96&product_type=1&action=new_product_preview&', '::1'),
(2096, '2016-03-14 12:01:27', 1, 'product.php', 'cPath=96&product_type=1&action=insert_product&', '::1'),
(2097, '2016-03-14 12:01:28', 1, 'categories.php', 'cPath=96&pID=230&', '::1'),
(2098, '2016-03-14 12:01:36', 1, 'attributes_controller.php', 'products_filter=230&current_category_id=96&', '::1'),
(2099, '2016-03-14 12:02:04', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=230&', '::1'),
(2100, '2016-03-14 12:02:04', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2101, '2016-03-14 12:02:18', 1, 'options_name_manager.php', '', '::1'),
(2102, '2016-03-14 12:02:21', 1, 'options_name_manager.php', 'action=update_option&option_id=1&option_order_by=products_options_id&option_page=1&', '::1'),
(2103, '2016-03-14 12:02:25', 1, 'options_name_manager.php', 'action=update_option_name&option_page=1&option_order_by=products_options_id&', '::1'),
(2104, '2016-03-14 12:02:26', 1, 'options_name_manager.php', 'option_page=1&option_order_by=products_options_id&', '::1'),
(2105, '2016-03-14 12:02:28', 1, 'options_values_manager.php', '', '::1'),
(2106, '2016-03-14 12:02:38', 1, 'options_values_manager.php', 'action=update_option_value&value_id=17&value_page=1&', '::1'),
(2107, '2016-03-14 12:02:46', 1, 'options_values_manager.php', 'action=update_value&value_page=1&', '::1'),
(2108, '2016-03-14 12:02:47', 1, 'options_values_manager.php', 'value_page=1&', '::1'),
(2109, '2016-03-14 12:02:49', 1, 'options_values_manager.php', 'action=update_option_value&value_id=25&value_page=1&', '::1'),
(2110, '2016-03-14 12:02:53', 1, 'options_values_manager.php', 'action=update_value&value_page=1&', '::1'),
(2111, '2016-03-14 12:02:53', 1, 'options_values_manager.php', 'value_page=1&', '::1'),
(2112, '2016-03-14 12:02:55', 1, 'attributes_controller.php', '', '::1'),
(2113, '2016-03-14 12:02:59', 1, 'attributes_controller.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&current_category_id=96&products_filter=&action=new_cat&', '::1'),
(2114, '2016-03-14 12:02:59', 1, 'attributes_controller.php', 'products_filter=230&current_category_id=96&', '::1'),
(2115, '2016-03-14 12:03:06', 1, 'attributes_controller.php', 'action=add_product_attributes&attribute_page=1&products_filter=230&', '::1'),
(2116, '2016-03-14 12:03:06', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2117, '2016-03-14 12:03:21', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1167&attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2118, '2016-03-14 12:03:35', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=230&', '::1'),
(2119, '2016-03-14 12:03:35', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2120, '2016-03-14 12:03:48', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1166&attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2121, '2016-03-14 12:03:53', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=230&', '::1'),
(2122, '2016-03-14 12:03:53', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=230&current_category_id=96&', '::1'),
(2123, '2016-03-14 12:04:09', 1, 'categories.php', '', '::1'),
(2124, '2016-03-14 12:04:13', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=shampoo&', '::1'),
(2125, '2016-03-14 12:04:15', 1, 'product.php', 'cPath=92&product_type=1&pID=209&action=copy_to&', '::1'),
(2126, '2016-03-14 12:04:26', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2127, '2016-03-14 12:04:26', 1, 'categories.php', 'cPath=97&pID=209&page=2&', '::1'),
(2128, '2016-03-14 12:04:34', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=conditioner&', '::1'),
(2129, '2016-03-14 12:04:37', 1, 'product.php', 'cPath=92&product_type=1&pID=210&action=copy_to&', '::1'),
(2130, '2016-03-14 12:04:40', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2131, '2016-03-14 12:04:40', 1, 'categories.php', 'cPath=97&pID=210&page=2&', '::1'),
(2132, '2016-03-14 12:05:07', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=98&', '::1'),
(2133, '2016-03-14 12:05:08', 1, 'categories.php', 'x=29&y=14&product_type=1&cPath=98&action=new_product&', '::1'),
(2134, '2016-03-14 12:05:08', 1, 'product.php', 'x=29&y=14&product_type=1&cPath=98&action=new_product&', '::1'),
(2135, '2016-03-14 12:06:19', 1, 'product.php', 'cPath=98&product_type=1&action=new_product_preview&', '::1'),
(2136, '2016-03-14 12:06:25', 1, 'product.php', 'cPath=98&product_type=1&action=insert_product&', '::1'),
(2137, '2016-03-14 12:06:25', 1, 'categories.php', 'cPath=98&pID=231&', '::1'),
(2138, '2016-03-14 12:06:42', 1, 'product.php', 'cPath=98&product_type=1&pID=231&action=copy_to&', '::1'),
(2139, '2016-03-14 12:06:45', 1, 'product.php', 'action=copy_to_confirm&cPath=98&page=1&', '::1'),
(2140, '2016-03-14 12:06:45', 1, 'categories.php', 'cPath=98&pID=232&page=1&', '::1'),
(2141, '2016-03-14 12:06:47', 1, 'product.php', 'cPath=98&product_type=1&pID=232&action=copy_to&', '::1'),
(2142, '2016-03-14 12:06:49', 1, 'product.php', 'action=copy_to_confirm&cPath=98&page=1&', '::1'),
(2143, '2016-03-14 12:06:50', 1, 'categories.php', 'cPath=98&pID=233&page=1&', '::1'),
(2144, '2016-03-14 12:06:51', 1, 'product.php', 'page=1&product_type=1&cPath=98&pID=233&action=new_product&', '::1'),
(2145, '2016-03-14 12:06:54', 1, 'product.php', 'cPath=98&product_type=1&pID=233&action=new_product_preview&page=1&', '::1'),
(2146, '2016-03-14 12:06:56', 1, 'product.php', 'cPath=98&product_type=1&pID=233&action=update_product&page=1&', '::1'),
(2147, '2016-03-14 12:06:56', 1, 'categories.php', 'cPath=98&pID=233&page=1&', '::1'),
(2148, '2016-03-14 12:06:58', 1, 'product.php', 'page=1&product_type=1&cPath=98&pID=233&action=new_product&', '::1'),
(2149, '2016-03-14 12:07:14', 1, 'categories.php', 'cPath=98&pID=233&page=1&', '::1'),
(2150, '2016-03-14 12:07:16', 1, 'categories.php', 'action=setflag&flag=1&pID=233&cPath=98&page=1&', '::1'),
(2151, '2016-03-14 12:07:17', 1, 'categories.php', 'cPath=98&pID=233&page=1&', '::1'),
(2152, '2016-03-14 12:07:18', 1, 'product.php', 'page=1&product_type=1&cPath=98&pID=232&action=new_product&', '::1'),
(2153, '2016-03-14 12:07:20', 1, 'product.php', 'cPath=98&product_type=1&pID=232&action=new_product_preview&page=1&', '::1'),
(2154, '2016-03-14 12:07:21', 1, 'product.php', 'cPath=98&product_type=1&pID=232&action=update_product&page=1&', '::1'),
(2155, '2016-03-14 12:07:21', 1, 'categories.php', 'cPath=98&pID=232&page=1&', '::1'),
(2156, '2016-03-14 12:07:23', 1, 'categories.php', 'action=setflag&flag=1&pID=232&cPath=98&page=1&', '::1'),
(2157, '2016-03-14 12:07:23', 1, 'categories.php', 'cPath=98&pID=232&page=1&', '::1'),
(2158, '2016-03-14 12:07:53', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2159, '2016-03-14 12:08:30', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=gift&', '::1'),
(2160, '2016-03-14 12:08:34', 1, 'product.php', 'cPath=92&product_type=1&pID=212&action=copy_to&', '::1'),
(2161, '2016-03-14 12:08:38', 1, 'product.php', 'action=copy_to_confirm&cPath=92&page=2&', '::1'),
(2162, '2016-03-14 12:08:39', 1, 'categories.php', 'cPath=102&pID=212&page=2&', '::1'),
(2163, '2016-03-14 12:08:49', 1, 'categories.php', 'cPath=102&pID=212&action=attribute_features&page=1&', '::1'),
(2164, '2016-03-14 12:08:51', 1, 'attributes_controller.php', 'products_filter=212&current_category_id=102&', '::1'),
(2165, '2016-03-14 12:08:54', 1, 'attributes_controller.php', 'action=update_attribute&attribute_id=1115&attribute_page=1&products_filter=212&current_category_id=102&', '::1'),
(2166, '2016-03-14 12:08:59', 1, 'attributes_controller.php', 'action=update_product_attribute&attribute_page=1&products_filter=212&', '::1'),
(2167, '2016-03-14 12:08:59', 1, 'attributes_controller.php', 'attribute_page=1&products_filter=212&current_category_id=102&', '::1'),
(2168, '2016-03-14 12:09:23', 1, 'categories.php', '', '::1'),
(2169, '2016-03-14 12:09:26', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2170, '2016-03-14 12:09:29', 1, 'product.php', 'cPath=98&product_type=1&pID=231&action=copy_to&', '::1'),
(2171, '2016-03-14 12:09:34', 1, 'product.php', 'action=copy_to_confirm&cPath=98&page=1&', '::1'),
(2172, '2016-03-14 12:09:34', 1, 'categories.php', 'cPath=100&pID=231&page=1&', '::1'),
(2173, '2016-03-14 12:09:38', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2174, '2016-03-14 12:09:40', 1, 'product.php', 'cPath=98&product_type=1&pID=233&action=copy_to&', '::1'),
(2175, '2016-03-14 12:09:45', 1, 'product.php', 'action=copy_to_confirm&cPath=98&page=1&', '::1'),
(2176, '2016-03-14 12:09:45', 1, 'categories.php', 'cPath=100&pID=233&page=1&', '::1'),
(2177, '2016-03-14 12:09:49', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2178, '2016-03-14 12:09:55', 1, 'product.php', 'cPath=98&product_type=1&pID=232&action=copy_to&', '::1'),
(2179, '2016-03-14 12:09:58', 1, 'product.php', 'action=copy_to_confirm&cPath=98&page=1&', '::1'),
(2180, '2016-03-14 12:09:58', 1, 'categories.php', 'cPath=100&pID=232&page=1&', '::1'),
(2181, '2016-03-14 12:10:01', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2182, '2016-03-14 12:10:29', 1, 'product.php', 'cPath=98&product_type=1&pID=232&action=copy_to&', '::1'),
(2183, '2016-03-14 12:10:36', 1, 'categories.php', 'cPath=98&pID=232&page=1&', '::1'),
(2184, '2016-03-14 12:10:41', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2185, '2016-03-14 12:10:46', 1, 'product.php', 'cPath=85&product_type=1&pID=192&action=copy_to&', '::1'),
(2186, '2016-03-14 12:10:55', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2187, '2016-03-14 12:10:55', 1, 'categories.php', 'cPath=100&pID=192&page=1&', '::1'),
(2188, '2016-03-14 12:11:02', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2189, '2016-03-14 12:11:06', 1, 'product.php', 'cPath=85&product_type=1&pID=184&action=copy_to&', '::1'),
(2190, '2016-03-14 12:11:11', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2191, '2016-03-14 12:11:11', 1, 'categories.php', 'cPath=100&pID=184&page=1&', '::1'),
(2192, '2016-03-14 12:11:14', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2193, '2016-03-14 12:11:18', 1, 'product.php', 'cPath=85&product_type=1&pID=187&action=copy_to&', '::1'),
(2194, '2016-03-14 12:11:21', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2195, '2016-03-14 12:11:22', 1, 'categories.php', 'cPath=100&pID=187&page=1&', '::1'),
(2196, '2016-03-14 12:11:25', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2197, '2016-03-14 12:11:30', 1, 'product.php', 'cPath=85&product_type=1&pID=193&action=copy_to&', '::1'),
(2198, '2016-03-14 12:11:34', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2199, '2016-03-14 12:11:34', 1, 'categories.php', 'cPath=100&pID=193&page=1&', '::1'),
(2200, '2016-03-14 12:11:36', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2201, '2016-03-14 12:11:40', 1, 'product.php', 'cPath=85&product_type=1&pID=194&action=copy_to&', '::1'),
(2202, '2016-03-14 12:11:45', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2203, '2016-03-14 12:11:45', 1, 'categories.php', 'cPath=100&pID=194&page=1&', '::1'),
(2204, '2016-03-14 12:11:52', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2205, '2016-03-14 12:11:58', 1, 'product.php', 'cPath=85&product_type=1&pID=189&action=copy_to&', '::1'),
(2206, '2016-03-14 12:12:01', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2207, '2016-03-14 12:12:01', 1, 'categories.php', 'cPath=100&pID=189&page=1&', '::1'),
(2208, '2016-03-14 12:12:05', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2209, '2016-03-14 12:12:08', 1, 'product.php', 'cPath=85&product_type=1&pID=195&action=copy_to&', '::1'),
(2210, '2016-03-14 12:12:11', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2211, '2016-03-14 12:12:11', 1, 'categories.php', 'cPath=100&pID=195&page=2&', '::1'),
(2212, '2016-03-14 12:12:14', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2213, '2016-03-14 12:12:15', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2214, '2016-03-14 12:12:24', 1, 'product.php', 'cPath=85&product_type=1&pID=183&action=copy_to&', '::1'),
(2215, '2016-03-14 12:12:26', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2216, '2016-03-14 12:12:27', 1, 'categories.php', 'cPath=100&pID=183&page=2&', '::1'),
(2217, '2016-03-14 12:12:32', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2218, '2016-03-14 12:12:33', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2219, '2016-03-14 12:12:36', 1, 'product.php', 'cPath=85&product_type=1&pID=186&action=copy_to&', '::1'),
(2220, '2016-03-14 12:12:39', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2221, '2016-03-14 12:12:39', 1, 'categories.php', 'cPath=100&pID=186&page=2&', '::1'),
(2222, '2016-03-14 12:12:43', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2223, '2016-03-14 12:12:44', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2224, '2016-03-14 12:12:46', 1, 'product.php', 'cPath=85&product_type=1&pID=188&action=copy_to&', '::1'),
(2225, '2016-03-14 12:12:48', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2226, '2016-03-14 12:12:49', 1, 'categories.php', 'cPath=100&pID=188&page=2&', '::1'),
(2227, '2016-03-14 12:12:54', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2228, '2016-03-14 12:12:56', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2229, '2016-03-14 12:13:00', 1, 'product.php', 'cPath=85&product_type=1&pID=190&action=copy_to&', '::1'),
(2230, '2016-03-14 12:13:02', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2231, '2016-03-14 12:13:02', 1, 'categories.php', 'cPath=100&pID=190&page=2&', '::1'),
(2232, '2016-03-14 12:13:05', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2233, '2016-03-14 12:13:08', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2234, '2016-03-14 12:13:13', 1, 'product.php', 'cPath=85&product_type=1&pID=185&action=copy_to&', '::1'),
(2235, '2016-03-14 12:13:16', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2236, '2016-03-14 12:13:16', 1, 'categories.php', 'cPath=100&pID=185&page=2&', '::1'),
(2237, '2016-03-14 12:13:20', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&', '::1'),
(2238, '2016-03-14 12:13:22', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=true nature&page=2&', '::1'),
(2239, '2016-03-14 12:13:25', 1, 'product.php', 'cPath=85&product_type=1&pID=191&action=copy_to&', '::1'),
(2240, '2016-03-14 12:13:28', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=2&', '::1'),
(2241, '2016-03-14 12:13:28', 1, 'categories.php', 'cPath=100&pID=191&page=2&', '::1'),
(2242, '2016-03-14 12:14:09', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2243, '2016-03-14 12:14:21', 1, 'product.php', 'cPath=89&product_type=1&pID=201&action=copy_to&', '::1'),
(2244, '2016-03-14 12:14:26', 1, 'product.php', 'action=copy_to_confirm&cPath=89&page=1&', '::1'),
(2245, '2016-03-14 12:14:26', 1, 'categories.php', 'cPath=101&pID=201&page=1&', '::1'),
(2246, '2016-03-14 12:14:29', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2247, '2016-03-14 12:14:31', 1, 'product.php', 'cPath=86&product_type=1&pID=196&action=copy_to&', '::1'),
(2248, '2016-03-14 12:14:34', 1, 'product.php', 'action=copy_to_confirm&cPath=86&page=1&', '::1'),
(2249, '2016-03-14 12:14:34', 1, 'categories.php', 'cPath=101&pID=196&page=1&', '::1'),
(2250, '2016-03-14 12:14:38', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2251, '2016-03-14 12:14:40', 1, 'product.php', 'cPath=90&product_type=1&pID=204&action=copy_to&', '::1'),
(2252, '2016-03-14 12:14:42', 1, 'product.php', 'action=copy_to_confirm&cPath=90&page=1&', '::1'),
(2253, '2016-03-14 12:14:42', 1, 'categories.php', 'cPath=101&pID=204&page=1&', '::1'),
(2254, '2016-03-14 12:14:50', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2255, '2016-03-14 12:14:52', 1, 'product.php', 'cPath=85&product_type=1&pID=181&action=copy_to&', '::1'),
(2256, '2016-03-14 12:14:54', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2257, '2016-03-14 12:14:54', 1, 'categories.php', 'cPath=101&pID=181&page=1&', '::1'),
(2258, '2016-03-14 12:14:58', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2259, '2016-03-14 12:15:00', 1, 'product.php', 'cPath=89&product_type=1&pID=200&action=copy_to&', '::1'),
(2260, '2016-03-14 12:15:02', 1, 'product.php', 'action=copy_to_confirm&cPath=89&page=1&', '::1'),
(2261, '2016-03-14 12:15:03', 1, 'categories.php', 'cPath=101&pID=200&page=1&', '::1'),
(2262, '2016-03-14 12:15:05', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2263, '2016-03-14 12:15:07', 1, 'product.php', 'cPath=89&product_type=1&pID=202&action=copy_to&', '::1'),
(2264, '2016-03-14 12:15:10', 1, 'product.php', 'action=copy_to_confirm&cPath=89&page=1&', '::1'),
(2265, '2016-03-14 12:15:10', 1, 'categories.php', 'cPath=101&pID=202&page=1&', '::1'),
(2266, '2016-03-14 12:15:13', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=or&', '::1'),
(2267, '2016-03-14 12:15:16', 1, 'product.php', 'cPath=90&product_type=1&pID=203&action=copy_to&', '::1'),
(2268, '2016-03-14 12:15:19', 1, 'product.php', 'action=copy_to_confirm&cPath=90&page=1&', '::1'),
(2269, '2016-03-14 12:15:19', 1, 'categories.php', 'cPath=101&pID=203&page=1&', '::1'),
(2270, '2016-03-14 12:15:21', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2271, '2016-03-14 12:15:23', 1, 'product.php', 'cPath=85&product_type=1&pID=180&action=copy_to&', '::1'),
(2272, '2016-03-14 12:15:26', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2273, '2016-03-14 12:15:26', 1, 'categories.php', 'cPath=101&pID=180&page=1&', '::1'),
(2274, '2016-03-14 12:15:36', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2275, '2016-03-14 12:15:38', 1, 'product.php', 'cPath=90&product_type=1&pID=205&action=copy_to&', '::1'),
(2276, '2016-03-14 12:15:40', 1, 'product.php', 'action=copy_to_confirm&cPath=90&page=1&', '::1'),
(2277, '2016-03-14 12:15:40', 1, 'categories.php', 'cPath=101&pID=205&page=1&', '::1'),
(2278, '2016-03-14 12:15:43', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2279, '2016-03-14 12:15:45', 1, 'product.php', 'cPath=88&product_type=1&pID=198&action=copy_to&', '::1'),
(2280, '2016-03-14 12:15:48', 1, 'product.php', 'action=copy_to_confirm&cPath=88&page=1&', '::1'),
(2281, '2016-03-14 12:15:48', 1, 'categories.php', 'cPath=101&pID=198&page=1&', '::1'),
(2282, '2016-03-14 12:16:05', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2283, '2016-03-14 12:16:07', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&page=2&', '::1'),
(2284, '2016-03-14 12:16:13', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&page=1&', '::1'),
(2285, '2016-03-14 12:16:14', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&page=2&', '::1'),
(2286, '2016-03-14 12:16:16', 1, 'product.php', 'cPath=85&product_type=1&pID=182&action=copy_to&', '::1'),
(2287, '2016-03-14 12:16:18', 1, 'product.php', 'action=copy_to_confirm&cPath=85&page=1&', '::1'),
(2288, '2016-03-14 12:16:18', 1, 'categories.php', 'cPath=101&pID=182&page=1&', '::1'),
(2289, '2016-03-14 12:16:21', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2290, '2016-03-14 12:16:23', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&page=2&', '::1'),
(2291, '2016-03-14 12:16:25', 1, 'product.php', 'cPath=88&product_type=1&pID=199&action=copy_to&', '::1'),
(2292, '2016-03-14 12:16:28', 1, 'product.php', 'action=copy_to_confirm&cPath=88&page=1&', '::1'),
(2293, '2016-03-14 12:16:28', 1, 'categories.php', 'cPath=101&pID=199&page=1&', '::1'),
(2294, '2016-03-14 12:16:54', 1, 'categories.php', 'cPath=101&page=1&', '::1'),
(2295, '2016-03-14 12:17:55', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=Organic Male Marine Mineral and Green Tea Gel&', '::1'),
(2296, '2016-03-14 12:18:09', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=marine mineral&', '::1'),
(2297, '2016-03-14 12:18:36', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&cPath=87&', '::1'),
(2298, '2016-03-14 12:18:42', 1, 'categories.php', 'x=94&y=18&product_type=1&cPath=87&action=new_product&', '::1'),
(2299, '2016-03-14 12:18:42', 1, 'product.php', 'x=94&y=18&product_type=1&cPath=87&action=new_product&', '::1'),
(2300, '2016-03-14 12:19:51', 1, 'product.php', 'cPath=87&product_type=1&action=new_product_preview&', '::1'),
(2301, '2016-03-14 12:19:53', 1, 'product.php', 'cPath=87&product_type=1&action=insert_product&', '::1'),
(2302, '2016-03-14 12:19:53', 1, 'categories.php', 'cPath=87&pID=234&', '::1'),
(2303, '2016-03-14 12:20:09', 1, 'product.php', 'cPath=87&product_type=1&pID=234&action=copy_to&', '::1'),
(2304, '2016-03-14 12:20:12', 1, 'product.php', 'action=copy_to_confirm&cPath=87&page=1&', '::1'),
(2305, '2016-03-14 12:20:12', 1, 'categories.php', 'cPath=87&pID=235&page=1&', '::1'),
(2306, '2016-03-14 12:20:14', 1, 'product.php', 'page=1&product_type=1&cPath=87&pID=235&action=new_product&', '::1'),
(2307, '2016-03-14 12:21:09', 1, 'product.php', 'cPath=87&product_type=1&pID=235&action=new_product_preview&page=1&', '::1'),
(2308, '2016-03-14 12:21:10', 1, 'product.php', 'cPath=87&product_type=1&pID=235&action=update_product&page=1&', '::1'),
(2309, '2016-03-14 12:21:10', 1, 'categories.php', 'cPath=87&pID=235&page=1&', '::1'),
(2310, '2016-03-14 12:21:19', 1, 'product.php', 'cPath=87&product_type=1&pID=234&action=copy_to&', '::1'),
(2311, '2016-03-14 12:21:22', 1, 'product.php', 'action=copy_to_confirm&cPath=87&page=1&', '::1'),
(2312, '2016-03-14 12:21:22', 1, 'categories.php', 'cPath=101&pID=234&page=1&', '::1'),
(2313, '2016-03-14 12:21:25', 1, 'categories.php', 'securityToken=016f3f3ae9e07f5bb340d96fb1ccac23&search=organic male&', '::1'),
(2314, '2016-03-14 12:21:28', 1, 'product.php', 'cPath=87&product_type=1&pID=235&action=copy_to&', '::1'),
(2315, '2016-03-14 12:21:30', 1, 'product.php', 'action=copy_to_confirm&cPath=87&page=1&', '::1'),
(2316, '2016-03-14 12:21:30', 1, 'categories.php', 'cPath=101&pID=235&page=1&', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `authorizenet`
--

CREATE TABLE `authorizenet` (
`id` int(11) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `authorization_type` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext COLLATE latin1_general_ci NOT NULL,
  `received` longtext COLLATE latin1_general_ci NOT NULL,
  `time` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `session_id` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
`banners_id` int(11) NOT NULL,
  `banners_title` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `banners_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `banners_image` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `banners_group` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `banners_html_text` text COLLATE latin1_general_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES
(1, 'Zen Cart', 'http://www.zen-cart.com', 'banners/zencart_468_60_02.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(2, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(3, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(4, 'if you have to think ... you haven''t been Zenned!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-12 20:53:18', NULL, 1, 1, 1, 0),
(5, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', 0, NULL, NULL, '2005-05-13 10:54:38', NULL, 1, 1, 1, 10),
(6, 'Start Accepting Credit Cards For Your Business Today!', 'http://www.zen-cart.com/partners/payment', 'banners/cardsvcs_468x60.gif', 'Wide-Banners', '', 0, NULL, NULL, '2006-03-13 11:02:43', '2016-03-10 01:07:46', 0, 1, 1, 0),
(7, 'eStart Your Web Store with Zen Cart(tm)', 'http://www.lulu.com/content/466605', 'banners/big-book-ad.gif', 'Wide-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(8, 'eStart Your Web Store with Zen Cart(tm)', 'http://www.lulu.com/content/466605', 'banners/tall-book.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(9, 'eStart Your Web Store with Zen Cart(tm)', 'http://www.lulu.com/content/466605', 'banners/tall-book.gif', 'BannersAll', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 15),
(10, 'Modern Responsive Design', 'http://www.picaflor-azul.com', 'banners/slide6.jpg', 'homepageslide', NULL, 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 1, 1, 0),
(11, 'Optimized for All Devices', 'http://www.picaflor-azul.com', 'banners/slide7.jpg', 'homepageslide', NULL, 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 1, 1, 0),
(12, 'Packed with Features', 'http://www.picaflor-azul.com', 'banners/slide14.jpg', 'homepageslide', NULL, 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 1, 1, 0),
(13, 'Extensive Documentation', 'http://www.picaflor-azul.com', 'banners/slide9.jpg', 'homepageslide', NULL, 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 1, 1, 0),
(14, 'Custom Tab', '', '', 'Custom Tab', '<div id="custom-tab-wrapper"><img src="includes/templates/winchester_responsive/images/summer.png" class="custom-tab-image" alt="your alt text here" /><div id="custom-tab-text">You can add any content to this tab that you like.  If you want to add text and/images you can use the Admin--Tools--Banner Manager.<br /><br />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum feugiat ipsum vehicula sollicitudin. Integer sed lacus eget risus consectetur ullamcorper. Pellentesque rutrum ullamcorper faucibus. Nam porttitor iaculis enim, mattis tristique velit tristique bibendum. Aliquam porta nisl tortor, non luctus justo. Nam tincidunt dui vel mauris tincidunt posuere. Phasellus rhoncus elit et lorem sodales ullamcorper.</div><div class="clearBoth"></div></div>', 0, NULL, NULL, '0001-01-01 00:00:00', '2016-03-11 00:55:56', 0, 1, 1, 0),
(15, 'Manage Slide show via the Admin', 'http://www.picaflor-azul.com', 'banners/slide10.jpg', 'homepageslide', NULL, 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

CREATE TABLE `banners_history` (
`banners_history_id` int(11) NOT NULL,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 3, 27, 0, '2016-03-02 13:04:53'),
(2, 5, 31, 0, '2016-03-02 13:04:53'),
(3, 9, 31, 0, '2016-03-02 13:04:53'),
(4, 4, 17, 0, '2016-03-02 13:04:53'),
(5, 8, 35, 0, '2016-03-02 13:35:14'),
(6, 1, 23, 0, '2016-03-02 13:35:14'),
(7, 2, 30, 0, '2016-03-02 13:35:17'),
(8, 7, 17, 0, '2016-03-02 13:35:18'),
(9, 6, 15, 0, '2016-03-02 13:45:17'),
(10, 10, 4, 0, '2016-03-02 14:59:33'),
(11, 11, 4, 0, '2016-03-02 14:59:33'),
(12, 12, 4, 0, '2016-03-02 14:59:33'),
(13, 13, 4, 0, '2016-03-02 14:59:33'),
(14, 15, 4, 0, '2016-03-02 14:59:33'),
(15, 10, 2, 0, '2016-03-06 15:04:21'),
(16, 11, 2, 0, '2016-03-06 15:04:21'),
(17, 12, 2, 0, '2016-03-06 15:04:21'),
(18, 13, 2, 0, '2016-03-06 15:04:21'),
(19, 15, 2, 0, '2016-03-06 15:04:21'),
(20, 7, 1, 0, '2016-03-06 15:04:22'),
(21, 14, 1, 0, '2016-03-06 15:35:12'),
(22, 6, 1, 0, '2016-03-06 15:35:12'),
(23, 4, 1, 0, '2016-03-06 17:22:57'),
(24, 10, 73, 0, '2016-03-07 15:07:21'),
(25, 11, 73, 0, '2016-03-07 15:07:21'),
(26, 12, 73, 0, '2016-03-07 15:07:21'),
(27, 13, 73, 0, '2016-03-07 15:07:21'),
(28, 15, 73, 0, '2016-03-07 15:07:21'),
(29, 4, 22, 0, '2016-03-07 15:07:21'),
(30, 7, 20, 0, '2016-03-07 15:18:34'),
(31, 6, 18, 0, '2016-03-07 16:37:22'),
(32, 1, 18, 0, '2016-03-07 17:12:26'),
(33, 10, 134, 0, '2016-03-08 00:03:36'),
(34, 11, 134, 0, '2016-03-08 00:03:36'),
(35, 12, 134, 0, '2016-03-08 00:03:36'),
(36, 13, 134, 0, '2016-03-08 00:03:36'),
(37, 15, 134, 0, '2016-03-08 00:03:36'),
(38, 7, 44, 0, '2016-03-08 00:03:36'),
(39, 6, 36, 0, '2016-03-08 00:03:54'),
(40, 4, 44, 0, '2016-03-08 00:05:57'),
(41, 1, 49, 0, '2016-03-08 00:07:19'),
(42, 14, 1, 0, '2016-03-08 23:32:32'),
(43, 7, 39, 0, '2016-03-09 00:00:35'),
(44, 4, 37, 0, '2016-03-09 00:01:38'),
(45, 6, 38, 0, '2016-03-09 00:07:22'),
(46, 14, 27, 0, '2016-03-09 00:10:32'),
(47, 1, 31, 0, '2016-03-09 00:11:47'),
(48, 7, 119, 0, '2016-03-10 00:01:47'),
(49, 4, 131, 0, '2016-03-10 00:03:12'),
(50, 1, 134, 0, '2016-03-10 00:04:43'),
(51, 6, 22, 1, '2016-03-10 00:32:15'),
(52, 14, 51, 0, '2016-03-10 00:37:09'),
(53, 7, 127, 0, '2016-03-11 00:00:01'),
(54, 1, 117, 0, '2016-03-11 00:00:59'),
(55, 4, 141, 0, '2016-03-11 00:02:45'),
(56, 14, 2, 0, '2016-03-11 00:50:06'),
(57, 10, 4, 0, '2016-03-11 16:56:26'),
(58, 11, 4, 0, '2016-03-11 16:56:26'),
(59, 12, 4, 0, '2016-03-11 16:56:26'),
(60, 13, 4, 0, '2016-03-11 16:56:26'),
(61, 15, 4, 0, '2016-03-11 16:56:26'),
(62, 7, 2, 0, '2016-03-12 11:56:54'),
(63, 4, 36, 0, '2016-03-13 15:07:10'),
(64, 7, 38, 0, '2016-03-13 15:18:12'),
(65, 1, 36, 0, '2016-03-13 15:21:24'),
(66, 1, 68, 0, '2016-03-14 00:00:43'),
(67, 7, 88, 0, '2016-03-14 00:01:44'),
(68, 4, 54, 0, '2016-03-14 00:04:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
`categories_id` int(11) NOT NULL,
  `categories_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES
(65, 'ShopInterior1.jpg', 0, 0, '2016-03-09 00:03:34', '2016-03-09 00:06:52', 0),
(67, 'rewards-2015.png', 0, 0, '2016-03-10 03:02:36', '2016-03-10 03:13:16', 0),
(68, 'social-icon_1fb.png', 0, 0, '2016-03-10 03:13:31', '2016-03-10 03:35:56', 0),
(77, 'social-icon_3pinterest.png', 0, 0, '2016-03-10 03:44:53', '2016-03-10 03:45:07', 0),
(78, 'social-icon_4ta.png', 0, 0, '2016-03-10 03:45:29', '2016-03-10 03:45:43', 0),
(79, 'social-icon_5yt.png', 0, 0, '2016-03-10 03:46:04', '2016-03-10 03:46:18', 0),
(80, 'social-icon_6instagram.png', 0, 0, '2016-03-10 03:46:34', '2016-03-10 03:46:47', 0),
(81, 'social-icon_7g.png', 0, 0, '2016-03-10 03:47:02', '2016-03-10 03:47:15', 0),
(82, 'social-icon_8share.png', 0, 0, '2016-03-10 03:47:22', '2016-03-10 03:47:35', 0),
(76, 'social-icon_2twitter.png', 0, 0, '2016-03-10 03:44:19', '2016-03-10 03:44:32', 0),
(84, NULL, 0, 0, '2016-03-10 22:27:36', NULL, 1),
(85, NULL, 84, 0, '2016-03-10 22:28:27', NULL, 1),
(86, NULL, 84, 1, '2016-03-10 22:28:47', '2016-03-10 22:30:20', 1),
(87, NULL, 84, 2, '2016-03-10 22:28:55', '2016-03-10 22:30:33', 1),
(88, NULL, 84, 3, '2016-03-10 22:29:00', '2016-03-10 22:30:41', 1),
(89, NULL, 84, 4, '2016-03-10 22:29:07', '2016-03-10 22:30:48', 1),
(90, NULL, 84, 5, '2016-03-10 22:29:12', '2016-03-10 22:30:56', 1),
(91, NULL, 0, 1, '2016-03-10 22:29:51', '2016-03-10 22:33:10', 1),
(92, NULL, 91, 0, '2016-03-10 22:31:40', NULL, 1),
(93, NULL, 91, 1, '2016-03-10 22:31:50', NULL, 1),
(94, NULL, 91, 2, '2016-03-10 22:32:00', NULL, 1),
(95, NULL, 91, 3, '2016-03-10 22:32:08', NULL, 1),
(96, NULL, 91, 4, '2016-03-10 22:32:28', NULL, 1),
(97, NULL, 91, 5, '2016-03-10 22:32:35', NULL, 1),
(98, NULL, 0, 2, '2016-03-10 22:33:44', NULL, 1),
(99, NULL, 0, 3, '2016-03-10 22:34:17', NULL, 1),
(100, NULL, 99, 0, '2016-03-10 22:34:33', NULL, 1),
(101, NULL, 99, 1, '2016-03-10 22:34:41', NULL, 1),
(102, NULL, 0, 4, '2016-03-10 22:35:11', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `categories_description` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES
(65, 1, 'Images', ''),
(67, 1, 'Rewards', ''),
(68, 1, 'Social-Fb', ''),
(76, 1, 'Social-Tw', ''),
(77, 1, 'Social-Pi', ''),
(79, 1, 'Social-Yt', ''),
(78, 1, 'Social-Ta', ''),
(80, 1, 'Social-Instagram', ''),
(81, 1, 'Social-G', ''),
(82, 1, 'Social-Sh', ''),
(84, 1, 'Skin Care', ''),
(85, 1, 'Anti-Aging', ''),
(86, 1, 'Exfoliants', ''),
(87, 1, 'Cleansers', ''),
(88, 1, 'Toners', ''),
(89, 1, 'Serums', ''),
(90, 1, 'Moisturizers', ''),
(91, 1, 'Solage Collection', ''),
(92, 1, 'Solage Gifts', ''),
(93, 1, 'Gift Cards', ''),
(94, 1, 'Robes', ''),
(95, 1, 'T-shirts', ''),
(96, 1, 'Hats', ''),
(97, 1, 'Hair', ''),
(98, 1, 'Perfume', ''),
(99, 1, 'View All', ''),
(100, 1, 'True Nature Botanicals', ''),
(101, 1, 'Organic Male', ''),
(102, 1, 'Gift Cards', '');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
`configuration_id` int(11) NOT NULL,
  `configuration_title` text COLLATE latin1_general_ci NOT NULL,
  `configuration_key` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `configuration_value` text COLLATE latin1_general_ci NOT NULL,
  `configuration_description` text COLLATE latin1_general_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text COLLATE latin1_general_ci,
  `set_function` text COLLATE latin1_general_ci
) ENGINE=MyISAM AUTO_INCREMENT=626 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'Solage Calistoga Shop', 'The name of my store', 1, 1, '2016-03-02 15:11:22', '2016-03-02 13:03:31', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'Solage Calistoga', 'The name of my store owner', 1, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(3, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2016-03-02 13:03:31', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(4, 'Zone', 'STORE_ZONE', '12', 'The zone my store is located in', 1, 7, NULL, '2016-03-02 13:03:31', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list('),
(5, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''asc'', ''desc''), '),
(6, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''products_name'', ''date_expected''), '),
(7, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(8, 'Language Selector', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'Should the default language be based on the Store preferences, or the customer''s browser settings?<br /><br />Default: Store''s default settings', 1, 11, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Default'', ''Browser''), '),
(9, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 6, 12, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(10, 'Display Cart After Adding Product', 'DISPLAY_CART', 'false', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, '2016-03-11 01:25:11', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(11, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''and'', ''or''), '),
(12, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Solage Calistoga\r\n755 Silverado Trail\r\nCalistoga, California 94515\r\nUSA', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, '2016-03-07 16:28:01', '2016-03-02 13:03:31', NULL, 'zen_cfg_textarea('),
(13, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(14, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2016-03-02 13:03:31', NULL, NULL),
(15, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(16, 'Display Prices with Tax in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', 'Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)', 1, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(17, 'Basis of Product Tax', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 1, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(18, 'Basis of Shipping Tax', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module', 1, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(19, 'Sales Tax Display Status', 'STORE_TAX_DISPLAY_STATUS', '0', 'Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On', 1, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(20, 'Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', 1, 22, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(21, 'Admin Session Time Out in Seconds', 'SESSION_TIMEOUT_ADMIN', '3600', 'Enter the time in seconds. Default=3600<br />Example: 3600= 1 hour<br /><br />Note: Too few seconds can result in timeout issues when adding/editing products', 1, 40, NULL, '2016-03-02 13:03:31', NULL, NULL),
(22, 'Admin Set max_execution_time for processes', 'GLOBAL_SET_TIME_LIMIT', '60', 'Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process', 1, 42, NULL, '2016-03-02 13:03:31', NULL, NULL),
(23, 'Show if version update available', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', 'Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)', 1, 44, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(24, 'Store Status', 'STORE_STATUS', '0', 'What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices', 1, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(25, 'Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don''t display)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(26, 'Missing Page Check', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to ''index''<br />Off = Don''t check for missing pages<br />Page Not Found = display the Page-Not-Found page', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''On'', ''Off'', ''Page Not Found''),'),
(27, 'cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Does your host require that you use a proxy for cURL communication?', 1, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(28, 'cURL Proxy Address', 'CURL_PROXY_SERVER_DETAILS', '', 'If you have GoDaddy hosting or other hosting services that require use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: for GoDaddy, enter: <strong>proxy.shr.secureserver.net:3128</strong> or possibly 64.202.165.130:3128', 1, 51, NULL, '2016-03-02 13:03:31', NULL, NULL),
(29, 'HTML Editor', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions', 1, 110, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_pull_down_htmleditors('),
(30, 'Enable phpBB linkage?', 'PHPBB_LINKS_ENABLED', 'false', 'Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?', 1, 120, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(31, 'Show Category Counts - Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Show Category Counts in Admin?', 1, 19, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(32, 'Currency Conversion Ratio', 'CURRENCY_UPLIFT_RATIO', '1.05', 'When auto-updating currencies, what "uplift" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.', 1, 55, NULL, '2016-03-02 13:03:31', NULL, NULL),
(33, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(34, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(35, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(36, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(37, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(38, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Minimum length of company name', 2, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(39, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(40, 'City', 'ENTRY_CITY_MIN_LENGTH', '2', 'Minimum length of city', 2, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(41, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2016-03-02 13:03:31', NULL, NULL),
(42, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(43, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Minimum length of password', 2, 11, NULL, '2016-03-02 13:03:31', NULL, NULL),
(44, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(45, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2016-03-02 13:03:31', NULL, NULL),
(46, 'Credit Card CVV Number', 'CC_CVV_MIN_LENGTH', '3', 'Minimum length of credit card CVV number', 2, 13, NULL, '2016-03-02 13:03:31', NULL, NULL),
(47, 'Product Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of product review text', 2, 14, NULL, '2016-03-02 13:03:31', NULL, NULL),
(48, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2016-03-02 13:03:31', NULL, NULL),
(49, 'Also Purchased Products', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2016-03-02 13:03:31', NULL, NULL),
(50, 'Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Minimum length of Nick Name', 2, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(51, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(52, 'Search Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Number of products to list on a search result page', 3, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(53, 'Prev/Next Navigation Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(54, 'Products on Special ', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Number of products on special to display', 3, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(55, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Number of new products to display in a category', 3, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(56, 'Upcoming Products ', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Number of ''upcoming'' products to display', 3, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(57, 'Manufacturers List - Scroll Box Size/Style', 'MAX_MANUFACTURERS_LIST', '0', 'Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(58, 'Manufacturers List - Verify Product Exist', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on', 3, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(59, 'Music Genre List - Scroll Box Size/Style', 'MAX_MUSIC_GENRES_LIST', '0', 'Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(60, 'Record Company List - Scroll Box Size/Style', 'MAX_RECORD_COMPANY_LIST', '0', 'Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(61, 'Length of Record Company Name', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Used in record companies box; maximum length of record company name to display. Longer names will be truncated.', 3, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(62, 'Length of Music Genre Name', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.', 3, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(63, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.', 3, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(64, 'New Product Reviews Per Page', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Number of new reviews to display on each page', 3, 9, NULL, '2016-03-02 13:03:31', NULL, NULL),
(65, 'Random Product Reviews for SideBox', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(66, 'Random New Products for SideBox', 'MAX_RANDOM_SELECT_NEW', '3', 'Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 11, NULL, '2016-03-02 13:03:31', NULL, NULL),
(67, 'Random Products On Special for SideBox', 'MAX_RANDOM_SELECT_SPECIALS', '2', 'Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(68, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2016-03-02 13:03:31', NULL, NULL),
(69, 'New Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Number of new products listed per page', 3, 14, NULL, '2016-03-02 13:03:31', NULL, NULL),
(70, 'Best Sellers For Box', 'MAX_DISPLAY_BESTSELLERS', '10', 'Number of best sellers to display in box', 3, 15, NULL, '2016-03-02 13:03:31', NULL, NULL),
(71, 'Also Purchased Products', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2016-03-02 13:03:31', NULL, NULL),
(72, 'Recent Purchases Box- NOTE: box is disabled ', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Number of products to display in the recent purchases box', 3, 17, NULL, '2016-03-02 13:03:31', NULL, NULL),
(73, 'Customer Order History List Per Page', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Number of orders to display in the order history list in ''My Account''', 3, 18, NULL, '2016-03-02 13:03:31', NULL, NULL),
(74, 'Maximum Display of Customers on Customers Page', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', 3, 19, NULL, '2016-03-02 13:03:31', NULL, NULL),
(75, 'Maximum Display of Orders on Orders Page', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', 3, 20, NULL, '2016-03-02 13:03:31', NULL, NULL),
(76, 'Maximum Display of Products on Reports', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', 3, 21, NULL, '2016-03-02 13:03:31', NULL, NULL),
(77, 'Maximum Categories Products Display List', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', 'Number of products to list per screen', 3, 22, NULL, '2016-03-02 13:03:31', NULL, NULL),
(78, 'Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', 'Maximum Number of Products to list per page on main page', 3, 30, NULL, '2016-03-02 13:03:31', NULL, NULL),
(79, 'Products Attributes - Option Names and Values Display', 'MAX_ROW_LISTS_OPTIONS', '10', 'Maximum number of option names and values to display in the products attributes page', 3, 24, NULL, '2016-03-02 13:03:31', NULL, NULL),
(80, 'Products Attributes - Attributes Controller Display', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Maximum number of attributes to display in the Attributes Controller page', 3, 25, NULL, '2016-03-02 13:03:31', NULL, NULL),
(81, 'Products Attributes - Downloads Manager Display', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Maximum number of attributes downloads to display in the Downloads Manager page', 3, 26, NULL, '2016-03-02 13:03:31', NULL, NULL),
(82, 'Featured Products - Number to Display Admin', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Number of featured products to list per screen - Admin', 3, 27, NULL, '2016-03-02 13:03:31', NULL, NULL),
(83, 'Maximum Display of Featured Products - Main Page', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', 'Number of featured products to list on main page', 3, 28, NULL, '2016-03-02 13:03:31', NULL, NULL),
(84, 'Maximum Display of Featured Products Page', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', 'Number of featured products to list per screen', 3, 29, NULL, '2016-03-02 13:03:31', NULL, NULL),
(85, 'Random Featured Products for SideBox', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', 'Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 30, NULL, '2016-03-02 13:03:31', NULL, NULL),
(86, 'Maximum Display of Specials Products - Main Page', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', 'Number of special products to list on main page', 3, 31, NULL, '2016-03-02 13:03:31', NULL, NULL),
(87, 'New Product Listing - Limited to ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days', 3, 40, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''7'', ''14'', ''30'', ''60'', ''90'', ''120''), '),
(88, 'Maximum Display of Products All Page', 'MAX_DISPLAY_PRODUCTS_ALL', '10', 'Number of products to list per screen', 3, 45, NULL, '2016-03-02 13:03:31', NULL, NULL),
(89, 'Maximum Display of Language Flags in Language Side Box', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Number of Language Flags per Row', 3, 50, NULL, '2016-03-02 13:03:31', NULL, NULL),
(90, 'Maximum File Upload Size', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'What is the Maximum file size for uploads?<br />Default= 2048000', 3, 60, NULL, '2016-03-02 13:03:31', NULL, NULL),
(91, 'Allowed Filename Extensions for uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', 3, 61, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_textarea('),
(92, 'Maximum Orders Detail Display on Admin Orders Listing', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Maximum number of Order Details<br />0 = Unlimited', 3, 65, NULL, '2016-03-02 13:03:31', NULL, NULL),
(93, 'Maximum PayPal IPN Display on Admin Listing', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Maximum number of PayPal IPN Lisings in Admin<br />Default is 20', 3, 66, NULL, '2016-03-02 13:03:31', NULL, NULL),
(94, 'Maximum Display Columns Products to Multiple Categories Manager', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default', 3, 70, NULL, '2016-03-02 13:03:31', NULL, NULL),
(95, 'Maximum Display EZ-Pages', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Maximum Display EZ-Pages<br />20 = Default', 3, 71, NULL, '2016-03-02 13:03:31', NULL, NULL),
(96, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '200', 'The pixel width of small images', 4, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(97, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '200', 'The pixel height of small images', 4, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(98, 'Heading Image Width - Admin', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(99, 'Heading Image Height - Admin', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(100, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(101, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(102, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(103, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(104, 'Image - Shopping Cart Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Show product image in the shopping cart?<br />0= off 1= on', 4, 9, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(105, 'Image - Shopping Cart Width', 'IMAGE_SHOPPING_CART_WIDTH', '50', 'Default = 50', 4, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(106, 'Image - Shopping Cart Height', 'IMAGE_SHOPPING_CART_HEIGHT', '40', 'Default = 40', 4, 11, NULL, '2016-03-02 13:03:31', NULL, NULL),
(107, 'Category Icon Image Width - Product Info Pages', 'CATEGORY_ICON_IMAGE_WIDTH', '57', 'The pixel width of Category Icon heading images for Product Info Pages', 4, 13, NULL, '2016-03-02 13:03:31', NULL, NULL),
(108, 'Category Icon Image Height - Product Info Pages', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', 'The pixel height of Category Icon heading images for Product Info Pages', 4, 14, NULL, '2016-03-02 13:03:31', NULL, NULL),
(109, 'Top Subcategory Image Width', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', 'The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 15, NULL, '2016-03-02 13:03:31', NULL, NULL),
(110, 'Top Subcategory Image Height', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', 'The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 16, NULL, '2016-03-02 13:03:31', NULL, NULL),
(111, 'Product Info - Image Width', 'MEDIUM_IMAGE_WIDTH', '300', 'The pixel width of Product Info images', 4, 20, NULL, '2016-03-02 13:03:31', NULL, NULL),
(112, 'Product Info - Image Height', 'MEDIUM_IMAGE_HEIGHT', '300', 'The pixel height of Product Info images', 4, 21, NULL, '2016-03-02 13:03:31', NULL, NULL),
(113, 'Product Info - Image Medium Suffix', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Product Info Medium Image Suffix<br />Default = _MED', 4, 22, NULL, '2016-03-02 13:03:31', NULL, NULL),
(114, 'Product Info - Image Large Suffix', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Product Info Large Image Suffix<br />Default = _LRG', 4, 23, NULL, '2016-03-02 13:03:31', NULL, NULL),
(115, 'Product Info - Number of Additional Images per Row', 'IMAGES_AUTO_ADDED', '4', 'Product Info - Enter the number of additional images to display per row<br />Default = 3', 4, 30, NULL, '2016-03-02 13:03:31', NULL, NULL),
(116, 'Image - Product Listing Width', 'IMAGE_PRODUCT_LISTING_WIDTH', '200', 'Default = 100', 4, 40, NULL, '2016-03-02 13:03:31', NULL, NULL),
(117, 'Image - Product Listing Height', 'IMAGE_PRODUCT_LISTING_HEIGHT', '200', 'Default = 80', 4, 41, NULL, '2016-03-02 13:03:31', NULL, NULL),
(118, 'Image - Product New Listing Width', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '200', 'Default = 100', 4, 42, NULL, '2016-03-02 13:03:31', NULL, NULL),
(119, 'Image - Product New Listing Height', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', 'Default = 80', 4, 43, NULL, '2016-03-02 13:03:31', NULL, NULL),
(120, 'Image - New Products Width', 'IMAGE_PRODUCT_NEW_WIDTH', '200', 'Default = 100', 4, 44, NULL, '2016-03-02 13:03:31', NULL, NULL),
(121, 'Image - New Products Height', 'IMAGE_PRODUCT_NEW_HEIGHT', '200', 'Default = 80', 4, 45, NULL, '2016-03-02 13:03:31', NULL, NULL),
(122, 'Image - Featured Products Width', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '200', 'Default = 100', 4, 46, NULL, '2016-03-02 13:03:31', NULL, NULL),
(123, 'Image - Featured Products Height', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '200', 'Default = 80', 4, 47, NULL, '2016-03-02 13:03:31', NULL, NULL),
(124, 'Image - Product All Listing Width', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '200', 'Default = 100', 4, 48, NULL, '2016-03-02 13:03:31', NULL, NULL),
(125, 'Image - Product All Listing Height', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '200', 'Default = 80', 4, 49, NULL, '2016-03-02 13:03:31', NULL, NULL),
(126, 'Product Image - No Image Status', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Use automatic No Image when none is added to product<br />0= off<br />1= On', 4, 60, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(127, 'Product Image - No Image picture', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Use automatic No Image when none is added to product<br />Default = no_picture.gif', 4, 61, NULL, '2016-03-02 13:03:31', NULL, NULL),
(128, 'Image - Use Proportional Images on Products and Categories', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on', 4, 75, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(129, 'Email Salutation', 'ACCOUNT_GENDER', 'true', 'Display salutation choice during account creation and with account information', 5, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(130, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require', 5, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(131, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company field during account creation and with account information', 5, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(132, 'Address Line 2', 'ACCOUNT_SUBURB', 'true', 'Display address line 2 field during account creation and with account information', 5, 4, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(133, 'State', 'ACCOUNT_STATE', 'true', 'Display state field during account creation and with account information', 5, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(134, 'State - Always display as pulldown?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', 'When state field is displayed, should it always be a pulldown menu?', 5, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(135, 'Create Account Default Country ID', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', 'Set Create Account Default Country ID to:<br />Default is 223', 5, 6, NULL, '2016-03-02 13:03:31', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none('),
(136, 'Fax Number', 'ACCOUNT_FAX_NUMBER', 'true', 'Display fax number field during account creation and with account information', 5, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(137, 'Show Newsletter Checkbox', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>', 5, 45, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(138, 'Customer Default Email Preference', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />', 5, 46, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(139, 'Customer Product Notification Status', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately', 5, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(140, 'Customer Shop Status - View Shop and Prices', 'CUSTOMERS_APPROVAL', '0', 'Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.', 5, 55, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(141, 'Customer Approval Status - Authorization Pending', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders', 5, 65, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(142, 'Customer Authorization: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization', 5, 66, NULL, '2016-03-02 13:03:31', NULL, ''),
(143, 'Customer Authorization: Hide Header', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Customer Authorization: Hide Header <br />(true=hide false=show)', 5, 67, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(144, 'Customer Authorization: Hide Column Left', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Customer Authorization: Hide Column Left <br />(true=hide false=show)', 5, 68, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(145, 'Customer Authorization: Hide Column Right', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Customer Authorization: Hide Column Right <br />(true=hide false=show)', 5, 69, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(146, 'Customer Authorization: Hide Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Customer Authorization: Hide Footer <br />(true=hide false=show)', 5, 70, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(147, 'Customer Authorization: Hide Prices', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Customer Authorization: Hide Prices <br />(true=hide false=show)', 5, 71, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(148, 'Customers Referral Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer', 5, 80, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(149, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php;shift4.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)', 6, 0, '2016-03-02 13:48:24', '2016-03-02 13:03:31', NULL, NULL),
(150, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(151, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(152, 'Enable Free Shipping', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Do you want to offer Free shipping?', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(153, 'Free Shipping Cost', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'What is the Shipping cost?', 6, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(154, 'Handling Fee', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(155, 'Tax Class', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(156, 'Shipping Zone', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(157, 'Sort Order', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(158, 'Enable Store Pickup Shipping', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Do you want to offer In Store rate shipping?', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(159, 'Shipping Cost', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(160, 'Tax Class', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(161, 'Tax Basis', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing''), '),
(162, 'Shipping Zone', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(163, 'Sort Order', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(164, 'Enable Item Shipping', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Do you want to offer per item rate shipping?', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(165, 'Shipping Cost', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'The shipping cost will be multiplied by the number of items in an order that uses this shipping method.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(166, 'Handling Fee', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(167, 'Tax Class', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(168, 'Tax Basis', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(169, 'Shipping Zone', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(170, 'Sort Order', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(171, 'Enable Free Charge Module', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'False', 'Do you want to accept Free Charge payments?', 6, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(172, 'Sort order of display.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(173, 'Payment Zone', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(174, 'Set Order Status', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(175, 'Enable Check/Money Order Module', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'False', 'Do you want to accept Check/Money Order payments?', 6, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(176, 'Make Payable to:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'Who should payments be made payable to?', 6, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(177, 'Sort order of display.', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(178, 'Payment Zone', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(179, 'Set Order Status', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(180, 'Include Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Include Tax value in amount before discount calculation?', 6, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(181, 'This module is installed', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true''), '),
(182, 'Sort Order', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Sort order of display.', 6, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(183, 'Include Shipping', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Include Shipping value in amount before discount calculation?', 6, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(184, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''), '),
(185, 'Tax Class', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Use the following tax class when treating Group Discount as Credit Note.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(186, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(187, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(188, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(189, 'Tax Basis', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(190, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(191, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(192, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(193, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(194, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(195, 'Admin configuration_key shows', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Manually switch to value of 1 to see the configuration_key name in configuration displays', 6, 0, NULL, '2016-03-02 13:03:31', NULL, NULL),
(196, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2016-03-02 13:03:31', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(197, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', '94515', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.', 7, 2, '2016-03-02 15:08:57', '2016-03-02 13:03:31', NULL, NULL),
(198, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(199, 'Package Tare Small to Medium - added percentage:weight', 'SHIPPING_BOX_WEIGHT', '0:3', 'What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(200, 'Larger packages - added packaging percentage:weight', 'SHIPPING_BOX_PADDING', '10:0', 'What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(201, 'Display Number of Boxes and Weight Status', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight', 7, 15, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(202, 'Shipping Estimator Display Settings for Shopping Cart', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '2', '<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page', 7, 20, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(203, 'Display Order Comments on Admin Invoice', 'ORDER_COMMENTS_INVOICE', '1', 'Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(204, 'Display Order Comments on Admin Packing Slip', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 26, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(205, 'Order Free Shipping 0 Weight Status', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.', 7, 15, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(206, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(207, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(208, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(209, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(210, 'Display Product Price/Add to Cart', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price/Add to Cart', 8, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(211, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(212, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(213, 'Display Product Price/Add to Cart Column Width', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Define the width of the Price/Add to Cart column<br />Default= 125', 8, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(214, 'Display Category/Manufacturer Filter (0=off; 1=on)', 'PRODUCT_LIST_FILTER', '0', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(215, 'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Split Page Navigation', 8, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(216, 'Display Product Listing Default Sort Order', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a', 8, 15, NULL, '2016-03-02 13:03:31', NULL, NULL),
(217, 'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product', 8, 20, '2016-03-11 01:23:52', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(218, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '0', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 8, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(219, 'Display Product Description', 'PRODUCT_LIST_DESCRIPTION', '0', 'Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 8, 30, NULL, '2016-03-02 13:03:31', NULL, NULL),
(220, 'Product Listing Ascending Sort Order', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'What do you want to use to indicate Sort Order Ascending?<br />Default = +', 8, 40, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_textarea_small('),
(221, 'Product Listing Descending Sort Order', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'What do you want to use to indicate Sort Order Descending?<br />Default = -', 8, 41, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_textarea_small('),
(222, 'Include Product Listing Alpha Sorter Dropdown', 'PRODUCT_LIST_ALPHA_SORTER', 'false', 'Do you want to include an Alpha Filter dropdown on the Product Listing?', 8, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(223, 'Include Product Listing Sub Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Do you want to include the Sub Categories Image on the Product Listing?', 8, 52, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(224, 'Include Product Listing Top Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Do you want to include the Top Categories Image on the Product Listing?', 8, 53, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(225, 'Show SubCategories on Main Page while navigating', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on', 8, 60, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(226, 'Check stock level', 'STOCK_CHECK', 'false', 'Check to see if sufficent stock is available', 9, 1, '2016-03-11 00:59:58', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(227, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(228, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(229, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(230, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(231, 'Products status in Catalog when out of stock should be set to', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON', 9, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(232, 'Show Sold Out Image in place of Add to Cart', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '0', 'Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on', 9, 11, '2016-03-11 00:59:35', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(233, 'Product Quantity Decimals', 'QUANTITY_DECIMALS', '0', 'Allow how many decimals on Quantity<br /><br />0= off', 9, 15, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(234, 'Show Shopping Cart - Delete Checkboxes or Delete Button', 'SHOW_SHOPPING_CART_DELETE', '1', 'Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox', 9, 20, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(235, 'Show Shopping Cart - Update Cart Button Location', 'SHOW_SHOPPING_CART_UPDATE', '1', 'Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products', 9, 22, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(236, 'Show New Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Show New Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 30, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(237, 'Show Featured Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 31, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(238, 'Show Special Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 32, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(239, 'Show Upcoming Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 33, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(240, 'Show Notice of Combining Shopping Cart on Login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart', 9, 35, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(241, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(242, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/Applications/MAMP/htdocs/shop.solagecalistoga139h/cache/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(243, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(244, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Display the page parse time on the bottom of each page<br />You do not need to store the times to display them in the Catalog', 10, 4, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(245, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(246, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'PHP', 'Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>"sendmail-f"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.', 12, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''PHP'', ''sendmail'', ''sendmail-f'', ''smtp'', ''smtpauth'', ''Qmail''),'),
(247, 'SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2016-03-02 13:03:31', NULL, NULL),
(248, 'SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2016-03-02 13:03:31', 'zen_cfg_password_display', NULL),
(249, 'SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2016-03-02 13:03:31', NULL, NULL),
(250, 'SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2016-03-02 13:03:31', NULL, NULL),
(251, 'Convert currencies for Text emails', 'CURRENCIES_TRANSLATIONS', '&pound;,£', 'What currency conversions do you need for Text emails?<br />Suggestions = &amp;pound;,&pound;:&amp;euro;,&euro;', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small('),
(252, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''LF'', ''CRLF''),'),
(253, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(254, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 6, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(255, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(256, 'Email Archiving Active?', 'EMAIL_ARCHIVE', 'false', 'If you wish to have email messages archived/stored when sent, set this to "true".', 12, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(257, 'E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'false', 'Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', 12, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(258, 'Email Address (Displayed to Contact you)', 'STORE_OWNER_EMAIL_ADDRESS', 'carlos@essentialinc.co', 'Email address of Store Owner.  Used as "display only" when informing customers of how to contact you.', 12, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(259, 'Email Address (sent FROM)', 'EMAIL_FROM', 'carlos@essentialinc.co', 'Address from which email messages will be "sent" by default. Can be over-ridden at compose-time in admin modules.', 12, 11, NULL, '2016-03-02 13:03:31', NULL, NULL),
(260, 'Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', 'Does your mailserver require that all outgoing emails have their "from" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the "from" address on all outgoing mail.', 12, 11, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(261, 'Email Admin Format?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Please select the Admin extra email format', 12, 12, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''TEXT'', ''HTML''), '),
(262, 'Send Copy of Order Confirmation Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', 'carlos@essentialinc.co', 'Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(263, 'Send Copy of Create Account Emails To - Status', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Send copy of Create Account Status<br />0= off 1= on', 12, 13, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(264, 'Send Copy of Create Account Emails To', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 14, NULL, '2016-03-02 13:03:31', NULL, NULL),
(265, 'Send Copy of Tell a Friend Emails To - Status', 'SEND_EXTRA_TELL_A_FRIEND_EMAILS_TO_STATUS', '0', 'Send copy of Tell a Friend Status<br />0= off 1= on', 12, 15, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(266, 'Send Copy of Tell a Friend Emails To', 'SEND_EXTRA_TELL_A_FRIEND_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Tell a Friend emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 16, NULL, '2016-03-02 13:03:31', NULL, NULL),
(267, 'Send Copy of Customer GV Send Emails To - Status', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Send copy of Customer GV Send Status<br />0= off 1= on', 12, 17, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(268, 'Send Copy of Customer GV Send Emails To', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 18, NULL, '2016-03-02 13:03:31', NULL, NULL),
(269, 'Send Copy of Admin GV Mail Emails To - Status', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin GV Mail Status<br />0= off 1= on', 12, 19, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(270, 'Send Copy of Customer Admin GV Mail Emails To', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 20, NULL, '2016-03-02 13:03:31', NULL, NULL),
(271, 'Send Copy of Admin Discount Coupon Mail Emails To - Status', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on', 12, 21, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(272, 'Send Copy of Customer Admin Discount Coupon Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 22, NULL, '2016-03-02 13:03:31', NULL, NULL),
(273, 'Send Copy of Admin Orders Status Emails To - Status', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Orders Status Status<br />0= off 1= on', 12, 23, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(274, 'Send Copy of Admin Orders Status Emails To', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 24, NULL, '2016-03-02 13:03:31', NULL, NULL),
(275, 'Send Notice of Pending Reviews Emails To - Status', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Send copy of Pending Reviews Status<br />0= off 1= on', 12, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(276, 'Send Notice of Pending Reviews Emails To', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'carlos@essentialinc.co', 'Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 26, NULL, '2016-03-02 13:03:31', NULL, NULL),
(277, 'Set "Contact Us" Email Dropdown List', 'CONTACT_US_LIST', '', 'On the "Contact Us" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 40, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_textarea('),
(278, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product. <br />If set to [false], then tell-a-friend will prompt for login if user is not already logged in.', 12, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(279, 'Contact Us - Show Store Name and Address', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Include Store Name and Address<br />0= off 1= on', 12, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(280, 'Send Low Stock Emails', 'SEND_LOWSTOCK_EMAIL', '0', 'When stock level is at or below low stock level send an email<br />0= off<br />1= on', 12, 60, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(281, 'Send Low Stock Emails To', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'carlos@essentialinc.co', 'When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 61, NULL, '2016-03-02 13:03:31', NULL, NULL),
(282, 'Display "Newsletter Unsubscribe" Link?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Show "Newsletter Unsubscribe" link in the "Information" side-box?', 12, 70, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(283, 'Audience-Select Count Display', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>', 12, 90, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(284, 'Enable Downloads', 'DOWNLOAD_ENABLED', 'true', 'Enable the products download functions.', 13, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(285, 'Download by Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true', 13, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(286, 'Download by streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.', 13, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(287, 'Download Expiration (Number of Days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2016-03-02 13:03:31', NULL, ''),
(288, 'Number of Downloads Allowed - Per Product', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2016-03-02 13:03:31', NULL, ''),
(289, 'Downloads Controller Update Status Value', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'What orders_status resets the Download days and Max Downloads - Default is 4', 13, 10, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(290, 'Downloads Controller Order Status Value >= lower value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.', 13, 12, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(291, 'Downloads Controller Order Status Value <= upper value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.', 13, 13, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(292, 'Enable Price Factor', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Enable the Attributes Price Factor.', 13, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(293, 'Enable Qty Price Discount', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Enable the Attributes Quantity Price Discounts.', 13, 26, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(294, 'Enable Attribute Images', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Enable the Attributes Images.', 13, 28, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(295, 'Enable Text Pricing by word or letter', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Enable the Attributes Text Pricing by word or letter.', 13, 35, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(296, 'Text Pricing - Spaces are Free', 'TEXT_SPACES_FREE', '1', 'On Text pricing Spaces are Free<br /><br />0= off 1= on', 13, 36, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(297, 'Read Only option type - Ignore for Add to Cart', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON', 13, 37, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(298, 'Enable GZip Compression', 'GZIP_LEVEL', '0', '0= off 1= on', 14, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(299, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/Applications/MAMP/htdocs/shop.solagecalistoga139h/cache', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(300, 'Cookie Domain', 'SESSION_USE_FQDN', 'True', 'If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.', 15, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(301, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(302, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(303, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(304, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(305, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(306, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(307, 'IP to Host Conversion Status', 'SESSION_IP_TO_HOST_ADDRESS', 'true', 'Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails', 15, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(308, 'Length of the redeem code', 'SECURITY_CODE_LENGTH', '10', 'Enter the length of the redeem code<br />The longer the more secure', 16, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(309, 'Default Order Status For Zero Balance Orders', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'When an order''s balance is zero, this order status will be assigned to it.', 16, 0, NULL, '2016-03-02 13:03:31', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(310, 'New Signup Discount Coupon ID#', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Select the coupon<br />', 16, 75, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_coupon_id('),
(311, 'New Signup Gift Voucher Amount', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Leave blank for none<br />Or enter an amount ie. 10 for $10.00', 16, 76, NULL, '2016-03-02 13:03:31', NULL, NULL),
(312, 'Maximum Discount Coupons Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Number of Discount Coupons to list per Page', 16, 81, NULL, '2016-03-02 13:03:31', NULL, NULL),
(313, 'Maximum Discount Coupon Report Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Number of Discount Coupons to list on Reports Page', 16, 81, NULL, '2016-03-02 13:03:31', NULL, NULL),
(314, 'Credit Card Enable Status - VISA', 'CC_ENABLED_VISA', '1', 'Accept VISA 0= off 1= on', 17, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(315, 'Credit Card Enable Status - MasterCard', 'CC_ENABLED_MC', '1', 'Accept MasterCard 0= off 1= on', 17, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(316, 'Credit Card Enable Status - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accept AmericanExpress 0= off 1= on', 17, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(317, 'Credit Card Enable Status - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accept Diners Club 0= off 1= on', 17, 4, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(318, 'Credit Card Enable Status - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accept Discover Card 0= off 1= on', 17, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(319, 'Credit Card Enable Status - JCB', 'CC_ENABLED_JCB', '0', 'Accept JCB 0= off 1= on', 17, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(320, 'Credit Card Enable Status - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accept AUSTRALIAN BANKCARD 0= off 1= on', 17, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(321, 'Credit Card Enable Status - SOLO', 'CC_ENABLED_SOLO', '0', 'Accept SOLO Card 0= off 1= on', 17, 8, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(322, 'Credit Card Enable Status - Switch', 'CC_ENABLED_SWITCH', '0', 'Accept SWITCH Card 0= off 1= on', 17, 9, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(323, 'Credit Card Enable Status - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accept MAESTRO Card 0= off 1= on', 17, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(324, 'Credit Card Enabled - Show on Payment', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.', 17, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(325, 'This module is installed', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true''),'),
(326, 'Sort Order', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL),
(327, 'Queue Purchases', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Do you want to queue purchases of the Gift Voucher?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(328, 'Include Shipping', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(329, 'Include Tax', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(330, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(331, 'Tax Class', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Use the following tax class when treating Gift Voucher as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(332, 'Credit including Tax', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Add tax to purchased Gift Voucher when crediting to Account', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(333, 'Set Order Status', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Set the status of orders made where GV covers full payment', 6, 0, NULL, '2016-03-02 13:03:31', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(334, 'This module is installed', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true''),'),
(335, 'Sort Order', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL),
(336, 'Allow Low Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Do you want to allow low order fees?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(337, 'Order Fee For Orders Under', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Add the low order fee to orders under this amount.', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL),
(338, 'Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL),
(339, 'Attach Low Order Fee On Orders Made', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Attach low order fee for orders sent to the set destination.', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(340, 'Tax Class', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Use the following tax class on the low order fee.', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(341, 'No Low Order Fee on Virtual Products', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Do not charge Low Order Fee when cart is Virtual Products Only', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(342, 'No Low Order Fee on Gift Vouchers', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Do not charge Low Order Fee when cart is Gift Vouchers Only', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(343, 'This module is installed', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true''),'),
(344, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL),
(345, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(346, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL),
(347, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(348, 'This module is installed', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(''true''),'),
(349, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL),
(350, 'This module is installed', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(''true''),'),
(351, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL),
(352, 'This module is installed', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(''true''),'),
(353, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL),
(354, 'Tax Class', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Use the following tax class when treating Discount Coupon as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(355, 'Include Tax', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(356, 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL),
(357, 'Include Shipping', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(358, 'This module is installed', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true''),'),
(359, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(360, 'Admin Demo Status', 'ADMIN_DEMO', '0', 'Admin Demo should be on?<br />0= off 1= on', 6, 0, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(361, 'Product option type Select', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'The number representing the Select type of product option.', 0, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(362, 'Text product option type', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Numeric value of the text product option type', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(363, 'Radio button product option type', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Numeric value of the radio button product option type', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(364, 'Check box product option type', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Numeric value of the check box product option type', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(365, 'File product option type', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Numeric value of the file product option type', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(366, 'ID for text and file products options values', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Numeric value of the products_options_values_id used by the text and file attributes.', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(367, 'Upload prefix', 'UPLOAD_PREFIX', 'upload_', 'Prefix used to differentiate between upload options and other options', 0, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(368, 'Text prefix', 'TEXT_PREFIX', 'txt_', 'Prefix used to differentiate between text option values and other option values', 0, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(369, 'Read Only option type', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Numeric value of the file product option type', 6, NULL, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, NULL),
(370, 'Products Info - Products Option Name Sort Order', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name', 18, 35, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(371, 'Products Info - Product Option Value of Attributes Sort Order', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name', 18, 36, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(372, 'Product Info - Show Option Values Name Below Attributes Image', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on', 18, 41, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(373, 'Product Info - Show Sales Discount Savings Status', 'SHOW_SALE_DISCOUNT_STATUS', '1', 'Product Info - Show the amount of discount savings?<br />0= off 1= on', 18, 45, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(374, 'Product Info - Show Sales Discount Savings Dollars or Percentage', 'SHOW_SALE_DISCOUNT', '1', 'Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off', 18, 46, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2''), '),
(375, 'Product Info - Show Sales Discount Savings Percentage Decimals', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0', 18, 47, NULL, '2016-03-02 13:03:31', NULL, NULL),
(376, 'Product Info - Price is Free Image or Text Status', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 50, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(377, 'Product Info - Price is Call for Price Image or Text Status', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 51, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(378, 'Product Quantity Box Status - Adding New Products', 'PRODUCTS_QTY_BOX_STATUS', '1', 'What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1', 18, 55, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(379, 'Product Reviews Require Approval', 'REVIEWS_APPROVAL', '1', 'Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on', 18, 62, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(380, 'Meta Tags - Include Product Model in Title', 'META_TAG_INCLUDE_MODEL', '1', 'Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on', 18, 69, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(381, 'Meta Tags - Include Product Price in Title', 'META_TAG_INCLUDE_PRICE', '1', 'Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on', 18, 70, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(382, 'Meta Tags Generated Description Maximum Length?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Set Generated Meta Tag Description Maximum Length to (words) Default 50:', 18, 71, NULL, '2016-03-02 13:03:31', '', ''),
(383, 'Also Purchased Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', 'Also Purchased Products Columns per Row<br />0= off or set the sort order', 18, 72, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(384, 'Previous Next - Navigation Bar Position', 'PRODUCT_INFO_PREVIOUS_NEXT', '2', 'Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page', 18, 21, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Top of Page''), array(''id''=>''2'', ''text''=>''Bottom of Page''), array(''id''=>''3'', ''text''=>''Both Top & Bottom of Page'')),'),
(385, 'Previous Next - Sort Order', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order', 18, 22, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Product ID''), array(''id''=>''1'', ''text''=>''Name''), array(''id''=>''2'', ''text''=>''Product Model''), array(''id''=>''3'', ''text''=>''Product Price - Name''), array(''id''=>''4'', ''text''=>''Product Price - Model''), array(''id''=>''5'', ''text''=>''Product Name - Model''), array(''id''=>''6'', ''text''=>''Product Sort Order'')),'),
(386, 'Previous Next - Button and Image Status', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Button and Product Image status settings are:<br />0= Off<br />1= On', 18, 20, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''On'')),'),
(387, 'Previous Next - Button and Image Settings', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only', 18, 21, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Button Only''), array(''id''=>''1'', ''text''=>''Button and Product Image''), array(''id''=>''2'', ''text''=>''Product Image Only'')),'),
(388, 'Previous Next - Image Width?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Previous/Next Image Width?', 18, 22, NULL, '2016-03-02 13:03:31', '', ''),
(389, 'Previous Next - Image Height?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Previous/Next Image Height?', 18, 23, NULL, '2016-03-02 13:03:31', '', ''),
(390, 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES', '0', 'Product''s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right', 18, 20, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Align Left''), array(''id''=>''2'', ''text''=>''Align Center''), array(''id''=>''3'', ''text''=>''Align Right'')),'),
(391, 'Previous Next - Navigation Includes Category Name and Image Status', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Product''s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank', 18, 20, '2016-03-02 13:03:31', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Category Name and Image Always''), array(''id''=>''1'', ''text''=>''Category Name only''), array(''id''=>''2'', ''text''=>''Category Name and Image when not blank'')),'),
(392, 'Column Width - Left Boxes', 'BOX_WIDTH_LEFT', '150px', 'Width of the Left Column Boxes<br />px may be included<br />Default = 150px', 19, 1, NULL, '2003-11-21 22:16:36', NULL, NULL),
(393, 'Column Width - Right Boxes', 'BOX_WIDTH_RIGHT', '150px', 'Width of the Right Column Boxes<br />px may be included<br />Default = 150px', 19, 2, NULL, '2003-11-21 22:16:36', NULL, NULL),
(394, 'Bread Crumbs Navigation Separator', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;<i class="fa fa-angle-right"></i>&nbsp;', 'Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;', 19, 3, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(395, 'Define Breadcrumb Status', 'DEFINE_BREADCRUMB_STATUS', '2', 'Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only', 19, 4, '2016-03-11 00:22:11', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(396, 'Bestsellers - Number Padding', 'BEST_SELLERS_FILLER', '&nbsp;', 'What do you want to Pad the numbers with?<br />Default = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(397, 'Bestsellers - Truncate Product Names', 'BEST_SELLERS_TRUNCATE', '35', 'What size do you want to truncate the Product Names?<br />Default = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL),
(398, 'Bestsellers - Truncate Product Names followed by ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'When truncated Product Names follow with ...<br />Default = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(399, 'Categories Box - Show Specials Link', 'SHOW_CATEGORIES_BOX_SPECIALS', 'false', 'Show Specials Link in the Categories Box', 19, 8, '2016-03-11 18:30:54', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(400, 'Categories Box - Show Products New Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'false', 'Show Products New Link in the Categories Box', 19, 9, '2016-03-11 18:31:06', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(401, 'Shopping Cart Box Status', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', 'Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart', 19, 10, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(402, 'Categories Box - Show Featured Products Link', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'false', 'Show Featured Products Link in the Categories Box', 19, 11, '2016-03-11 18:31:32', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(403, 'Categories Box - Show Products All Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'false', 'Show Products All Link in the Categories Box', 19, 12, '2016-03-11 18:31:40', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(404, 'Column Left Status - Global', 'COLUMN_LEFT_STATUS', '1', 'Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override', 19, 15, '2016-03-09 00:52:35', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(405, 'Column Right Status - Global', 'COLUMN_RIGHT_STATUS', '0', 'Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override', 19, 16, '2016-03-09 00:54:51', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(406, 'Column Width - Left', 'COLUMN_WIDTH_LEFT', '250px', 'Width of the Left Column<br />px may be included<br />Default = 150px', 19, 20, NULL, '2003-11-21 22:16:36', NULL, NULL),
(407, 'Column Width - Right', 'COLUMN_WIDTH_RIGHT', '150px', 'Width of the Right Column<br />px may be included<br />Default = 150px', 19, 21, NULL, '2003-11-21 22:16:36', NULL, NULL),
(408, 'Categories Separator between links Status', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Show Category Separator between Category Names and Links?<br />0= off<br />1= on', 19, 24, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(409, 'Categories Separator between the Category Name and Count', 'CATEGORIES_SEPARATOR', '', 'What separator do you want between the Category name and the count?<br />Default = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(410, 'Categories Separator between the Category Name and Sub Categories', 'CATEGORIES_SEPARATOR_SUBS', '', 'What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(411, 'Categories Count Prefix', 'CATEGORIES_COUNT_PREFIX', '<span class="cat-count">', 'What do you want to Prefix the count with?<br />Default= (', 19, 27, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(412, 'Categories Count Suffix', 'CATEGORIES_COUNT_SUFFIX', '</span>', 'What do you want as a Suffix to the count?<br />Default= )', 19, 28, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(413, 'Categories SubCategories Indent', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;', 19, 29, NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small('),
(414, 'Categories with 0 Products Status', 'CATEGORIES_COUNT_ZERO', '0', 'Show Category Count for 0 Products?<br />0= off<br />1= on', 19, 30, '2016-03-11 00:14:38', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(415, 'Split Categories Box', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Split the categories box display by product type', 19, 31, '2016-03-11 00:20:22', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(416, 'Shopping Cart - Show Totals', 'SHOW_TOTALS_IN_CART', '1', 'Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount', 19, 31, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(417, 'Customer Greeting - Show on Index Page', 'SHOW_CUSTOMER_GREETING', '0', 'Always Show Customer Greeting on Index?<br />0= off<br />1= on', 19, 40, '2016-03-11 00:16:33', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(418, 'Categories - Always Show on Main Page', 'SHOW_CATEGORIES_ALWAYS', '0', 'Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level', 19, 45, '2016-03-11 00:17:54', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(419, 'Main Page - Opens with Category', 'CATEGORIES_START_MAIN', '0', '0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10', 19, 46, NULL, '2016-03-02 13:03:31', '', ''),
(420, 'Categories - Always Open to Show SubCategories', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected', 19, 47, '2016-03-11 00:10:09', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(421, 'Banner Display Groups - Header Position 1', 'SHOW_BANNERS_GROUP_SET1', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none', 19, 55, NULL, '2016-03-02 13:03:31', '', ''),
(422, 'Banner Display Groups - Header Position 2', 'SHOW_BANNERS_GROUP_SET2', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none', 19, 56, NULL, '2016-03-02 13:03:31', '', ''),
(423, 'Banner Display Groups - Header Position 3', 'SHOW_BANNERS_GROUP_SET3', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none', 19, 57, NULL, '2016-03-02 13:03:31', '', ''),
(424, 'Banner Display Groups - Footer Position 1', 'SHOW_BANNERS_GROUP_SET4', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none', 19, 65, NULL, '2016-03-02 13:03:31', '', ''),
(425, 'Banner Display Groups - Footer Position 2', 'SHOW_BANNERS_GROUP_SET5', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none', 19, 66, NULL, '2016-03-02 13:03:31', '', ''),
(426, 'Banner Display Groups - Footer Position 3', 'SHOW_BANNERS_GROUP_SET6', 'Wide-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none', 19, 67, NULL, '2016-03-02 13:03:31', '', ''),
(427, 'Banner Display Groups - Side Box banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none', 19, 70, NULL, '2016-03-02 13:03:31', '', ''),
(428, 'Banner Display Groups - Side Box banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none', 19, 71, NULL, '2016-03-02 13:03:31', '', ''),
(429, 'Banner Display Group - Side Box banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none', 19, 72, NULL, '2016-03-02 13:03:31', '', ''),
(430, 'Footer - Show IP Address status', 'SHOW_FOOTER_IP', '0', 'Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?', 19, 80, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(431, 'Product Discount Quantities - Add how many blank discounts?', 'DISCOUNT_QTY_ADD', '5', 'How many blank discount quantities should be added for Product Pricing?', 19, 90, NULL, '2016-03-02 13:03:31', '', ''),
(432, 'Product Discount Quantities - Display how many per row?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'How many discount quantities should show per row on Product Info Pages?', 19, 95, NULL, '2016-03-02 13:03:31', '', ''),
(433, 'Categories/Products Display Sort Order', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name', 19, 100, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6''), '),
(434, 'Option Names and Values Global Add, Copy and Delete Features Status', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />2= Products Model', 19, 110, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(435, 'Categories-Tabs Menu ON/OFF', 'CATEGORIES_TABS_STATUS', '0', 'Categories-Tabs<br />This enables the display of your store''s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs', 19, 112, '2016-03-11 00:18:46', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(436, 'Site Map - include My Account Links?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false', 19, 115, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(437, 'Skip 1-prod Categories', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True', 19, 120, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(438, 'Use split-login page', 'USE_SPLIT_LOGIN_MODE', 'True', 'The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False', 19, 121, '2016-03-11 00:17:12', '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(439, 'CSS Buttons', 'IMAGE_USE_CSS_BUTTONS', 'Yes', 'CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.', 19, 147, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(440, '<strong>Down for Maintenance: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down for Maintenance <br />(true=on false=off)', 20, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(441, 'Down for Maintenance: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance', 20, 2, NULL, '2016-03-02 13:03:31', NULL, ''),
(442, 'Down for Maintenance: Hide Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down for Maintenance: Hide Header <br />(true=hide false=show)', 20, 3, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(443, 'Down for Maintenance: Hide Column Left', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down for Maintenance: Hide Column Left <br />(true=hide false=show)', 20, 4, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(444, 'Down for Maintenance: Hide Column Right', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down for Maintenance: Hide Column Right <br />(true=hide false=show)', 20, 5, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(445, 'Down for Maintenance: Hide Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down for Maintenance: Hide Footer <br />(true=hide false=show)', 20, 6, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(446, 'Down for Maintenance: Hide Prices', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down for Maintenance: Hide Prices <br />(true=hide false=show)', 20, 7, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(447, 'Down For Maintenance (exclude this IP-Address)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL),
(448, 'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the ''Down For Maintenance: ON/OFF'' to true this will automaticly be updated to false', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(449, 'Date and hours for notice before maintenance', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Date and hours for notice before maintenance website, enter date and hours for maintenance website', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(450, 'Display when webmaster has enabled maintenance', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(451, 'Display website maintenance period', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Display Website maintenance period <br />(true=on false=off)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(452, 'Website maintenance period', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Enter Website Maintenance period (hh:mm)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(453, 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', 11, 1, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(454, 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', 'false', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', 11, 2, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(455, 'Display Product Image', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(456, 'Display Product Quantity', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(457, 'Display Product Buy Now Button', 'PRODUCT_NEW_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(458, 'Display Product Name', 'PRODUCT_NEW_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(459, 'Display Product Model', 'PRODUCT_NEW_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(460, 'Display Product Manufacturer Name', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(461, 'Display Product Price', 'PRODUCT_NEW_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(462, 'Display Product Weight', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(463, 'Display Product Date Added', 'PRODUCT_NEW_LIST_DATE_ADDED', '0', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 9, '2016-03-11 01:04:04', '2016-03-02 13:03:31', NULL, NULL),
(464, 'Display Product Description', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 21, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(465, 'Display Product Display - Default Sort Order', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 21, 11, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(466, 'Default Products New Group ID', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?', 21, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(467, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 21, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(468, 'Mask Upcoming Products from being include as New Products', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', 'Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on', 21, 30, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(469, 'Display Product Image', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(470, 'Display Product Quantity', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(471, 'Display Product Buy Now Button', 'PRODUCT_FEATURED_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(472, 'Display Product Name', 'PRODUCT_FEATURED_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(473, 'Display Product Model', 'PRODUCT_FEATURED_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(474, 'Display Product Manufacturer Name', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(475, 'Display Product Price', 'PRODUCT_FEATURED_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(476, 'Display Product Weight', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(477, 'Display Product Date Added', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 9, NULL, '2016-03-02 13:03:31', NULL, NULL),
(478, 'Display Product Description', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 22, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(479, 'Display Product Display - Default Sort Order', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 22, 11, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(480, 'Default Featured Products Group ID', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?', 22, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(481, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 22, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(482, 'Display Product Image', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 1, NULL, '2016-03-02 13:03:31', NULL, NULL),
(483, 'Display Product Quantity', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 2, NULL, '2016-03-02 13:03:31', NULL, NULL),
(484, 'Display Product Buy Now Button', 'PRODUCT_ALL_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 3, NULL, '2016-03-02 13:03:31', NULL, NULL),
(485, 'Display Product Name', 'PRODUCT_ALL_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 4, NULL, '2016-03-02 13:03:31', NULL, NULL),
(486, 'Display Product Model', 'PRODUCT_ALL_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 5, NULL, '2016-03-02 13:03:31', NULL, NULL),
(487, 'Display Product Manufacturer Name', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 6, NULL, '2016-03-02 13:03:31', NULL, NULL),
(488, 'Display Product Price', 'PRODUCT_ALL_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 7, NULL, '2016-03-02 13:03:31', NULL, NULL),
(489, 'Display Product Weight', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 8, NULL, '2016-03-02 13:03:31', NULL, NULL),
(490, 'Display Product Date Added', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 9, NULL, '2016-03-02 13:03:31', NULL, NULL),
(491, 'Display Product Description', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 23, 10, NULL, '2016-03-02 13:03:31', NULL, NULL),
(492, 'Display Product Display - Default Sort Order', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 23, 11, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(493, 'Default Products All Group ID', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?', 23, 12, NULL, '2016-03-02 13:03:31', NULL, NULL),
(494, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 23, 25, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(495, 'Show New Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '0', 'Show New Products on Main Page<br />0= off or set the sort order', 24, 65, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(496, 'Show Featured Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page<br />0= off or set the sort order', 24, 66, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(497, 'Show Special Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '0', 'Show Special Products on Main Page<br />0= off or set the sort order', 24, 67, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(498, 'Show Upcoming Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '0', 'Show Upcoming Products on Main Page<br />0= off or set the sort order', 24, 68, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(499, 'Show New Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '0', 'Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 70, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(500, 'Show Featured Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 71, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(501, 'Show Special Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '0', 'Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 72, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(502, 'Show Upcoming Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '0', 'Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 73, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(503, 'Show New Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 75, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(504, 'Show Featured Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 76, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(505, 'Show Special Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 77, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(506, 'Show Upcoming Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 78, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(507, 'Show New Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', 'Show New Products below Product Listing<br />0= off or set the sort order', 24, 85, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(508, 'Show Featured Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', 'Show Featured Products below Product Listing<br />0= off or set the sort order', 24, 86, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(509, 'Show Special Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', 'Show Special Products below Product Listing<br />0= off or set the sort order', 24, 87, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(510, 'Show Upcoming Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', 'Show Upcoming Products below Product Listing<br />0= off or set the sort order', 24, 88, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(511, 'New Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', 'New Products Columns per Row', 24, 95, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(512, 'Featured Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', 'Featured Products Columns per Row', 24, 96, NULL, '2016-03-02 13:03:31', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(513, 'Special Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', 'Special Products Columns per Row', 24, 97, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(514, 'Filter Product Listing for Current Top Level Category When Enabled', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ', 24, 100, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(515, 'Define Main Page Status', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 60, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(516, 'Define Contact Us Status', 'DEFINE_CONTACT_US_STATUS', '1', 'Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 61, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(517, 'Define Privacy Status', 'DEFINE_PRIVACY_STATUS', '1', 'Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 62, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(518, 'Define Shipping & Returns', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 63, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(519, 'Define Conditions of Use', 'DEFINE_CONDITIONS_STATUS', '1', 'Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 64, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(520, 'Define Checkout Success', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 65, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(521, 'Define Discount Coupon', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 66, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(522, 'Define Site Map Status', 'DEFINE_SITE_MAP_STATUS', '1', 'Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 67, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(523, 'Define Page-Not-Found Status', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON', 25, 67, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(524, 'Define Page 2', 'DEFINE_PAGE_2_STATUS', '1', 'Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 82, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(525, 'Define Page 3', 'DEFINE_PAGE_3_STATUS', '1', 'Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 83, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(526, 'Define Page 4', 'DEFINE_PAGE_4_STATUS', '1', 'Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 84, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(527, 'EZ-Pages Display Status - HeaderBar', 'EZPAGES_STATUS_HEADER', '0', 'Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 10, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(528, 'EZ-Pages Display Status - FooterBar', 'EZPAGES_STATUS_FOOTER', '0', 'Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 11, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(529, 'EZ-Pages Display Status - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 12, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(530, 'EZ-Pages Header Link Separator', 'EZPAGES_SEPARATOR_HEADER', '&nbsp;::&nbsp;', 'EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(531, 'EZ-Pages Footer Link Separator', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;::&nbsp;', 'EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(532, 'EZ-Pages Prev/Next Buttons', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1="Continue"<br />2="Prev/Continue/Next"<br /><br />Default setting: 2.', 30, 30, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(533, 'EZ-Pages Table of Contents for Chapters Status', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', 30, 35, '2016-03-02 13:03:32', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(534, 'EZ-Pages Pages to disable headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "header" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.', 30, 40, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(535, 'EZ-Pages Pages to disable footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "footer" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.', 30, 41, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(536, 'EZ-Pages Pages to disable left-column', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "left" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.', 30, 42, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(537, 'EZ-Pages Pages to disable right-column', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "right" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.', 30, 43, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_textarea_small('),
(538, 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(539, 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'True', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(569, 'Log Gateway Data', 'MODULE_PAYMENT_SHIFT4_LOG_GATEWAY', 'No', 'Set to ''Yes'' if you want to save all gateway communications data to the database. The database table is named "shift4_log" and will be viewable using phpMyAdmin.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(568, 'API Username', 'MODULE_PAYMENT_SHIFT4_USERNAME_PRODUCTION', 'Interface2', 'Your API username provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(567, 'Transaction Mode', 'MODULE_PAYMENT_SHIFT4_TRANSACTION_MODE', 'Book and Ship', '''Immediate Charge'' authorizes and finalizes the transaction. ''Book and Ship'' authorizes the funds and will allow you to manually settle the transaction at <a href="http://www.dollarsonthenet.net">http://www.dollarsonthenet.net</a>. <br /><br />The ''Book and Ship'' option is often used when a merchant bills the shopper after shipment. Settlements should be done within a limited number of days of the original authorization to avoid expiration of the authorization hold.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Book and Ship'', ''Immediate Charge''), '),
(555, 'Enable Shift4 Module', 'MODULE_PAYMENT_SHIFT4_STATUS', 'Enabled', 'Enable Shift4 module to accept and process credit card payments. ', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Enabled'', ''Disabled''), '),
(556, 'i4Go Account ID', 'MODULE_PAYMENT_SHIFT4_I4GO_LOGIN_PRODUCTION', '12481', 'Your i4Go account ID provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(557, 'i4Go Site ID', 'MODULE_PAYMENT_SHIFT4_I4GO_SITE_PRODUCTION', 'https://s705.dollarsonthenet.net/', 'Your i4Go site ID provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(558, 'Processing Mode', 'MODULE_PAYMENT_SHIFT4_ORDER_MODE', 'Demo - no settings needed', '"Demo" mode allows you to test the module without entering any settings or creating any Shift4 accounts. While in "Demo" mode, transactions will be sent to a demo processor. Demo transactions will not be viewable in Dollars on the Net.<br /><br />While in "Live" mode, transactions will be sent to a live processor. Live transactions will be viewable at <a href="http://www.dollarsonthenet.net" target="_blank">http://www.dollarsonthenet.net</a>.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Demo - no settings needed'', ''Live''), '),
(559, 'Sort order of display.', 'MODULE_PAYMENT_SHIFT4_SORT_ORDER', '0', 'The order of display for this payment option (1-first, 2-second, and so on). Entering ''0'' defaults to alphabetical order.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(560, 'Payment Zone Restriction', 'MODULE_PAYMENT_SHIFT4_ZONE', '0', 'If a zone is selected, this payment module will only be enabled for that zone. A setting of "--none--" allows payments from any location.', 6, 2, NULL, '2016-03-02 13:48:24', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(561, 'Set Order Status', 'MODULE_PAYMENT_SHIFT4_ORDER_STATUS_ID', '0', 'Set the default status of orders made with this payment module.', 6, 0, NULL, '2016-03-02 13:48:24', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(562, 'Debug Mode', 'MODULE_PAYMENT_SHIFT4_DEBUGGING', 'Log File', 'Enabling debug mode logs information about each failed transaction in a separate file in the Cache folder and can be emailed to the store owner. These files can be deleted manually, or in the Store Manager page (Tools > Store Manager: ''Cleanup Debug Log Files'')', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Off'', ''Log File'', ''Log and Email''), '),
(563, 'API Password', 'MODULE_PAYMENT_SHIFT4_PASSWORD_PRODUCTION', 'Solage755', 'Your API password provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', 'zen_cfg_password_display', 'zen_cfg_password_input_no_autocomplete('),
(564, 'Account Number', 'MODULE_PAYMENT_SHIFT4_SERIAL_NUMBER_PRODUCTION', '12481', 'Your Account Number provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(565, 'Merchant ID', 'MODULE_PAYMENT_SHIFT4_MERCHANT_ID_PRODUCTION', '12481', 'Your Merchant ID provided by Shift4.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, NULL),
(566, 'Enforce Address Validation', 'MODULE_PAYMENT_SHIFT4_ENFORCE_AVS', 'Do not enforce', 'Set to ''Enforce'' to automatically void the transaction and cancel the order if shopper''s payment information fails the address validation. The shopper will be returned to the payment page with an error message.', 6, 0, NULL, '2016-03-02 13:48:24', NULL, 'zen_cfg_select_option(array(''Enforce'', ''Do not enforce''), '),
(570, '<b>ACTIVATE Responsive Template</b>', 'COLUMN_WIDTH', '1', 'Column Width - Left Boxes &<br /> Column Width - Right Boxes<br /><b>DO NOT WORK WITH</b><br />(1)Responsive Template Settings<br /><br /><b>Use</b><br />Column Width - Left &<br /> Column Width - Right<br /><br /><br /> 0 = Use Default Template Settings<br />1 = Use Responsive Template Settings<br />', 19, NULL, NULL, '2016-03-02 14:01:39', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(571, 'Define About Us Status', 'DEFINE_ABOUT_US_STATUS', '1', 'Enable the Defined About Us Link/Text?0= Link ON, Define Text OFF1= Link ON, Define Text ON2= Link OFF, Define Text ON3= Link OFF, Define Text OFF', 25, 90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(572, 'Carousel Featured Products', 'CAROUSEL_FEATURED_PRODUCTS', 'true', 'Display your featured products in a carousel?<br /><br/>Default = true<br/>', 31, 101, NULL, '2016-03-02 14:01:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(573, 'Maximum Display Carousel Featured Products', 'MAX_DISPLAY_SEARCH_RESULTS_CAROUSEL_FEATURED', '10', 'Set this to how many featured products you have - regardless of the number, only three will show on the carousel at a time.<br/><br/>Default = 10<br/>', 31, 102, NULL, '2016-03-02 14:01:39', NULL, NULL),
(574, 'Display Description', 'CAROUSEL_FEATURED_DESCRIPTION', 'false', 'Display featured products description?<br/><br/>Default = true<br/>', 31, 105, NULL, '2016-03-02 14:01:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(575, 'Description Length', 'CAROUSEL_FEATURED_DESCRIPTION_LENGTH', '100', '--ONLY APPLICABLE IF DISPLAY DISCRIPTION IS TRUE--<br/><br/>Featured product description length in chatacters<br/><br/>Default = 100<br/>', 31, 106, NULL, '2016-03-02 14:01:39', NULL, NULL);
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(576, 'Display Button', 'CAROUSEL_FEATURED_LINK', 'true', 'Display "Buy Now" or "More Information" buttons?<br/><br/>Default = true<br/>', 31, 107, NULL, '2016-03-02 14:01:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(577, 'Display Price', 'CAROUSEL_FEATURED_PRICE', 'true', 'Display featured product price?<br/><br/>Default = true<br/>', 31, 107, NULL, '2016-03-02 14:01:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(578, 'Carousel Featured Image Listing Width', 'IMAGE_CAROUSEL_FEATURED_PRODUCTS_LISTING_WIDTH', '200', 'The width of the product images in the carousel.<br/>Default = 100', 31, 108, NULL, '2016-03-02 14:01:39', NULL, NULL),
(579, 'Carousel Featured Image Listing Height', 'IMAGE_CAROUSEL_FEATURED_PRODUCTS_LISTING_HEIGHT', '200', 'The height of the product images in the carousel.<br/>Default = 80', 31, 109, NULL, '2016-03-02 14:01:39', NULL, NULL),
(580, 'Product Listing - Layout Style', 'PRODUCT_LISTING_LAYOUT_STYLE', 'columns', 'Select the layout style:<br />Each product can be listed in its own row (rows option)\n                or products can be listed in multiple columns per row (columns option)<br />\n				If customer control is enabled this sets the default style.', 8, 41, '2016-03-11 17:45:32', '2016-03-02 14:59:30', NULL, 'zen_cfg_select_option(array(''rows'', ''columns''),'),
(581, 'Product Listing - Columns Per Row', 'PRODUCT_LISTING_COLUMNS_PER_ROW', '3', 'Select the number of columns of products to show in each row in the product listing.  \n               The default setting is 3.', 8, 42, NULL, '2016-03-02 14:59:30', NULL, NULL),
(582, 'Product Listing - Layout Style - Customer Control', 'PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER', '0', 'Allow the customer to select the layout style (0=no, 1=yes):', 8, 43, NULL, '2016-03-02 14:59:30', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(583, 'Product Listing - Show Sorter for Columns Layout', 'PRODUCT_LISTING_GRID_SORT', '0', 'Allow the customer to select the item sort order (0=no, 1=yes):', 8, 44, '2016-03-11 17:46:07', '2016-03-02 14:59:30', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(584, '<b>Zen Colorbox</b>', 'ZEN_COLORBOX_STATUS', 'true', '<br />If true, all product images on the following pages will be displayed within a lightbox:<br /><br />- document_general_info<br />- document_product_info<br />- page (EZ-Pages)<br />- product_free_shipping_info<br />- product_info<br />- product_music_info<br />- product_reviews<br />- product_reviews_info<br />- product_reviews_write<br /><br /><b>Default: true</b>', 46, 100, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(585, 'Overlay Opacity', 'ZEN_COLORBOX_OVERLAY_OPACITY', '0.6', '<br />Controls the transparency of the overlay.<br /><br /><b>Default: 0.6</b>', 46, 101, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''0'', ''0.1'', ''0.2'', ''0.3'', ''0.4'', ''0.5'', ''0.6'', ''0.7'', ''0.8'', ''0.9'', ''1''), '),
(586, 'Resize Duration', 'ZEN_COLORBOX_RESIZE_DURATION', '400', '<br />Controls the speed of the image resizing.<br /><br />Note: This value is measured in milliseconds.<br /><br /><b>Default: 400</b><br />', 46, 102, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(587, 'Initial Width', 'ZEN_COLORBOX_INITIAL_WIDTH', '250', '<br />If Enable Resize Animations is set to true, the lightbox will resize its width from this value to the current image width, when first displayed.<br /><br />Note: This value is measured in pixels.<br /><br /><b>Default: 250</b><br />', 46, 103, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(588, 'Initial Height', 'ZEN_COLORBOX_INITIAL_HEIGHT', '250', '<br />If Enable Resize Animations is set to true, the lightbox will resize its height from this value to the current image height, when first displayed.<br /><br />Note: This value is measured in pixels.<br /><br /><b>Default: 250</b><br />', 46, 104, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(589, 'Display Image Counter', 'ZEN_COLORBOX_COUNTER', 'true', '<br />If true, the image counter will be displayed (below the caption of each image) within the lightbox.<br /><br /><b>Default: true</b>', 46, 105, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(590, 'Close on Overlay Click', 'ZEN_COLORBOX_CLOSE_OVERLAY', 'false', '<br />If true, the lightbox will close when the overlay is clicked.<br /><br /><b>Default: false</b>', 46, 106, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(591, 'Loop', 'ZEN_COLORBOX_LOOP', 'true', '<br />If true, Images will loop in both directions.<br /><br /><b>Default: true</b>', 46, 107, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(592, '<b>Slideshow</b>', 'ZEN_COLORBOX_SLIDESHOW', 'false', '<br />If true, Images will display as a slideshow.<br /><br /><b>Default: false</b>', 46, 200, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(593, '&nbsp; Slideshow Auto Start', 'ZEN_COLORBOX_SLIDESHOW_AUTO', 'true', '<br />If true, your slideshow will auto start.<br /><br /><b>Default: true</b>', 46, 201, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(594, '&nbsp; Slideshow Speed', 'ZEN_COLORBOX_SLIDESHOW_SPEED', '2500', '<br />Sets the speed of the slideshow <br /><br />Note: This value is measured in milliseconds.<br /><br /><b>Default: 2500</b>', 46, 202, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(595, '&nbsp; Slideshow Start Text', 'ZEN_COLORBOX_SLIDESHOW_START_TEXT', 'start slideshow', '<br />Link text to start the slideshow.<br /><br /><b>Default: start slideshow</b>', 46, 203, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(596, '&nbsp; Slideshow Stop Text', 'ZEN_COLORBOX_SLIDESHOW_STOP_TEXT', 'stop slideshow', '<br />Link text to stop the slideshow.<br /><br /><b>Default: stop slideshow</b>', 46, 204, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(597, '<b>Gallery Mode</b>', 'ZEN_COLORBOX_GALLERY_MODE', 'true', '<br />If true, the lightbox will allow additional images to quickly be displayed using previous and next buttons.<br /><br /><b>Default: true</b>', 46, 300, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(598, '&nbsp; Include Main Image in Gallery', 'ZEN_COLORBOX_GALLERY_MAIN_IMAGE', 'true', '<br />If true, the main product image will be included in the lightbox gallery.<br /><br /><b>Default: true</b>', 46, 301, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(599, '<b>EZ-Pages Support</b>', 'ZEN_COLORBOX_EZPAGES', 'true', '<br />If true, the lightbox effect will be used for linked images on all EZ-Pages.<br /><br /><b>Default: true</b>', 46, 400, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(600, '&nbsp; File Types', 'ZEN_COLORBOX_FILE_TYPES', 'jpg,png,gif', '<br />On EZ-Pages, the lightbox effect will be applied to all images with one of the following file types.<br /><br /><b>Default: jpg,png,gif</b><br />', 46, 401, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(601, 'Version', 'WINCHESTER_RESPONSIVE_VERSION', '1.4', 'Version installed:', 47, 0, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(602, 'Home Page Slideshow', 'WIN_SLIDER_STATUS', 'true', 'Activate Home Page Slideshow', 47, 1, '2016-03-11 17:07:22', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(603, 'Banner Display Groups Custom Tab', 'SHOW_BANNERS_GROUP_SETCUSTOMTAB', 'Custom Tab', 'Custom Tab for product info page', 47, 2, '2016-03-02 14:59:31', '2016-03-02 14:59:31', NULL, NULL),
(604, 'EZ Pages in Header Menu', 'SHOW_EZ_PAGES_MENU', 'true', 'Shows the menu option for EZ pages/important links in the header menu', 47, 3, '2016-03-11 17:00:41', '2016-03-02 14:59:31', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(605, 'Enable alternate URLs?', 'USU_ENABLED', 'true', 'This is a global setting and can be used to enable or disable this module completely.', 48, 1, NULL, '2016-03-13 21:54:33', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(606, 'Enable debug log?', 'USU_DEBUG', 'false', 'When enabled, additional debugging information is saved to log files.<br /><br />Enabling debugging may result in the creation of numerous log files and may adversely affect server performance. Only enable this if absolutely necessary!', 48, 2, NULL, '2016-03-13 21:54:33', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(607, 'Generate cPath parameters', 'USU_CPATH', 'auto', 'By default Zen Cart generates a cPath parameter for product pages. These are used to keep linked products in the correct category. In automatic mode the cPath will only be added if needed.', 48, 3, NULL, '2016-03-13 21:54:33', 'usu_check_cpath_option', 'usu_set_cpath_option('),
(608, 'Alternate URLs end with', 'USU_END', '.html', 'If you want your URLs to end with a certain suffix add one here. Common suffixes are ''.html'', ''.htm''. Leave this field blank to have no suffix added to generated URLs.', 48, 4, NULL, '2016-03-13 21:54:33', '', ''),
(609, 'Format of alternate URLs', 'USU_FORMAT', 'original', 'You can select from a list of commonly generated formats.<br /><b>Original:</b><br /><i>Categories:</i> category-name-c-34<br /><i>Products:</i> product-name-p-54<br /><br /><b>Category Parent:</b><br /><i>Categories:</i> parent-category-name-c-34<br /><i>Products:</i> parent-product-name-p-54', 48, 5, NULL, '2016-03-13 21:54:33', 'usu_check_url_format_option', 'usu_set_url_format_option('),
(610, 'Display categories as directories', 'USU_CATEGORY_DIR', 'short', 'You can select from a list of commonly generated formats.<br /><b>Off:</b> disables displaying categories as directories<br /><br /><b>Short:</b> use the settings from ''Format of rewritten URLs''<b>Full:</b> uses full category paths<br /><br />', 48, 6, NULL, '2016-03-13 21:54:33', 'usu_check_category_dir_option', 'usu_set_category_dir_option('),
(611, 'Remove problematic characters', 'USU_REMOVE_CHARS', 'punctuation', 'This allows you remove certain problematic characters from the generated URLs.<br /><br /><i>non-alphanumerical:</i> removes all non-alphanumerical characters<br /><i>punctuation:</i> removes all punctuation characters', 48, 7, NULL, '2016-03-13 21:54:33', 'usu_check_remove_chars_option', 'usu_set_remove_chars_option('),
(612, 'Enter PCRE filter rules', 'USU_FILTER_PCRE', '', 'This setting uses PCRE rules to filter URLs.<br><br>This filter is run before character conversions and stripping of special characters. If you want a dash - in your URLS, use a single space. To escape a character in the regular expression use \\\\ instead of a single \\.<br /><br />The format <b>MUST</b> be in the form: <b>find1=>replace1,find2=>replace2</b>. ', 48, 8, NULL, '2016-03-13 21:54:33', '', ''),
(613, 'Filter short words', 'USU_FILTER_SHORT_WORDS', '0', 'This setting will filter words less than or equal to the value from the URL.', 48, 9, NULL, '2016-03-13 21:54:33', 'usu_check_short_words', ''),
(614, 'Limit alternate URLS to the following pages', 'USU_FILTER_PAGES', 'index, product_info, product_music_info, document_general_info, document_product_info, product_free_shipping_info, products_new, products_all, shopping_cart, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4', 'You can limit the pages which will be rewritten by specifying them here. If no pages are specified all pages will be rewritten. <br><br>The format is comma delimited and <b>MUST</b> be in the form: <b>page1,page2,page3</b> or <b>page1, page2, page3</b>', 48, 10, NULL, '2016-03-13 21:54:33', '', ''),
(615, 'Choose URL Engine', 'USU_ENGINE', 'rewrite', 'Choose which URL Engine to use.', 48, 11, NULL, '2016-03-13 21:54:33', '', 'zen_cfg_select_option(array(''rewrite''),'),
(616, 'Enable automatic redirects?', 'USU_REDIRECT', 'false', 'This will activate the automatic redirect code and send 301 headers for old to new URLs.', 48, 12, NULL, '2016-03-13 21:54:33', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(617, 'Enable caches to save queries?', 'USU_CACHE_GLOBAL', 'true', 'This is a global setting and will turn off both memory and SQL caching of URLs completely.', 48, 13, NULL, '2016-03-13 21:54:33', 'usu_check_cache_options', 'usu_set_global_cache_option('),
(618, 'Enable product cache?', 'USU_CACHE_PRODUCTS', 'true', 'This will turn off SQL caching for the products.', 48, 14, NULL, '2016-03-13 21:54:33', 'usu_check_cache_options', 'usu_set_cache_options(''products'','),
(619, 'Enable categories cache?', 'USU_CACHE_CATEGORIES', 'true', 'This will turn off SQL caching for the categories.', 48, 15, NULL, '2016-03-13 21:54:33', 'usu_check_cache_options', 'usu_set_cache_options(''categories'','),
(620, 'Enable manufacturers cache?', 'USU_CACHE_MANUFACTURERS', 'true', 'This will turn off SQL caching for the manufacturers.', 48, 16, NULL, '2016-03-13 21:54:33', 'usu_check_cache_options', 'usu_set_cache_options(''manufacturers'','),
(621, 'Enable ez pages cache?', 'USU_CACHE_EZ_PAGES', 'true', 'This will turn off SQL caching for ez pages.', 48, 17, NULL, '2016-03-13 21:54:33', 'usu_check_cache_options', 'usu_set_cache_options(''ez_pages'','),
(622, 'Reset URL Cache', 'USU_CACHE_RESET', 'false', 'This will reset the SQL cache data for URLs', 48, 18, NULL, '2016-03-13 21:54:33', 'usu_reset_cache_data', 'zen_cfg_select_option(array(''true'', ''false''),'),
(623, 'Ultimate URLs Version', 'USU_VERSION', '2.215', 'Indicates the currently installed version of Ultimate URLs.', 48, 0, NULL, '2016-03-13 21:54:33', NULL, 'zen_cfg_select_option(array(''2.215''),'),
(625, 'Related Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_RELATED_PRODUCTS', '3', 'Related Products Columns per Row<br />0= off or set the sort order', 18, 100, NULL, '2016-03-13 23:17:42', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''),');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

CREATE TABLE `configuration_group` (
`configuration_group_id` int(11) NOT NULL,
  `configuration_group_title` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Regulations', 'Regulation options', 16, 1),
(12, 'E-Mail Options', 'General settings for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Attribute Settings', 'Configure products attributes settings', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'GV Coupons', 'Gift Vouchers and Coupons', 16, 1),
(17, 'Credit Cards', 'Credit Cards Accepted', 17, 1),
(18, 'Product Info', 'Product Info Display Options', 18, 1),
(19, 'Layout Settings', 'Layout Options', 19, 1),
(20, 'Website Maintenance', 'Website Maintenance Options', 20, 1),
(21, 'New Listing', 'New Products Listing', 21, 1),
(22, 'Featured Listing', 'Featured Products Listing', 22, 1),
(23, 'All Listing', 'All Products Listing', 23, 1),
(24, 'Index Listing', 'Index Products Listing', 24, 1),
(25, 'Define Page Status', 'Define Main Pages and HTMLArea Options', 25, 1),
(30, 'EZ-Pages Settings', 'EZ-Pages Settings', 30, 1),
(31, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 31, 1),
(32, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 32, 1),
(33, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 33, 1),
(34, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 34, 1),
(35, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 35, 1),
(36, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 36, 1),
(37, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 37, 1),
(38, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 38, 1),
(39, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 39, 1),
(40, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 40, 1),
(41, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 41, 1),
(42, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 42, 1),
(43, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 43, 1),
(44, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 44, 1),
(45, 'Carousel Featured Products', 'Set Carousel Featured Products Options', 45, 1),
(46, 'Zen Colorbox', 'Configure Zen Colorbox settings', 46, 1),
(47, 'Winchester Responsive Template Configuration', 'Set Winchester Responsive Template Options', 47, 1),
(48, 'Ultimate URLs', 'Configuration Group for Ultimate URLs', 48, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `startdate` char(8) COLLATE latin1_general_ci DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20160302', 1713);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

CREATE TABLE `counter_history` (
  `startdate` char(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `counter_history`
--

INSERT INTO `counter_history` (`startdate`, `counter`, `session_counter`) VALUES
('20160302', 100, 3),
('20160306', 2, 2),
('20160307', 16, 3),
('20160308', 124, 10),
('20160309', 197, 5),
('20160310', 365, 8),
('20160311', 416, 8),
('20160312', 143, 5),
('20160313', 40, 1),
('20160314', 310, 5);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
`countries_id` int(11) NOT NULL,
  `countries_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(240, 'Aaland Islands', 'AX', 'ALA', 1),
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 2),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'Timor-Leste', 'TL', 'TLS', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macao', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROU', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 6),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Serbia', 'RS', 'SRB', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
`coupon_id` int(11) NOT NULL,
  `coupon_type` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `restrict_to_categories` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `restrict_to_customers` text COLLATE latin1_general_ci,
  `coupon_active` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_description`
--

CREATE TABLE `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `coupon_description` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_email_track`
--

CREATE TABLE `coupon_email_track` (
`unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `sent_lastname` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `emailed_to` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_customer`
--

CREATE TABLE `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_queue`
--

CREATE TABLE `coupon_gv_queue` (
`unique_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `release_flag` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_redeem_track`
--

CREATE TABLE `coupon_redeem_track` (
`unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_restrict`
--

CREATE TABLE `coupon_restrict` (
`restrict_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
`currencies_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `code` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `symbol_left` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `symbol_right` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `decimal_point` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `thousands_point` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `decimal_places` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2016-03-02 13:03:32'),
(2, 'Euro', 'EUR', '&euro;', '', '.', ',', '2', 0.77300000, '2016-03-02 13:03:32'),
(3, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', 0.67259997, '2016-03-02 13:03:32'),
(4, 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', 1.10420001, '2016-03-02 13:03:32'),
(5, 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', 1.17890000, '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
`customers_id` int(11) NOT NULL,
  `customers_gender` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_nick` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_fax` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_password` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_newsletter` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) COLLATE latin1_general_ci NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_nick`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`, `customers_group_pricing`, `customers_email_format`, `customers_authorization`, `customers_referral`, `customers_paypal_payerid`, `customers_paypal_ec`) VALUES
(1, 'm', 'Bill', 'Smith', '2001-01-01 00:00:00', 'root@localhost.com', '', 1, '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0', 0, 'TEXT', 0, '', '', 0),
(2, 'm', 'Carlos', 'Artavia', '1984-10-28 00:00:00', 'carlos@essentialinc.co', '', 2, '3055942222', '', 'dbaf2b8d5771137e36a73827540cd6fd:40', '0', 0, 'TEXT', 0, '', '', 0),
(3, 'm', 'Hiram', 'Mckenzie', '1989-10-10 00:00:00', 'c_artavia@hotmail.com', '', 3, '+881-74-4260375', '+267-55-7161640', '45357b75f151fb3174f7fcc0a9e4e8e0:af', '0', 0, 'HTML', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

CREATE TABLE `customers_basket` (
`customers_basket_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext COLLATE latin1_general_ci NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_basket`
--

INSERT INTO `customers_basket` (`customers_basket_id`, `customers_id`, `products_id`, `customers_basket_quantity`, `final_price`, `customers_basket_date_added`) VALUES
(17, 3, '215:537110f496fc83ceb3851cc5fe344f1b', 1, 0.0000, '20160314'),
(13, 3, '208', 1, 0.0000, '20160314'),
(12, 3, '180', 1, 0.0000, '20160314'),
(16, 3, '212:378f3ce24b91a6caf8ccf5afeba142f3', 1, 0.0000, '20160314');

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

CREATE TABLE `customers_basket_attributes` (
`customers_basket_attributes_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext COLLATE latin1_general_ci NOT NULL,
  `products_options_id` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_basket_attributes`
--

INSERT INTO `customers_basket_attributes` (`customers_basket_attributes_id`, `customers_id`, `products_id`, `products_options_id`, `products_options_value_id`, `products_options_value_text`, `products_options_sort_order`) VALUES
(6, 3, '212:378f3ce24b91a6caf8ccf5afeba142f3', '20', 96, '', '0.00009'),
(7, 3, '215:537110f496fc83ceb3851cc5fe344f1b', '2', 21, '', '20.00020');

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_info`
--

INSERT INTO `customers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`) VALUES
(1, '0001-01-01 00:00:00', 0, '2004-01-21 01:35:28', '0001-01-01 00:00:00', 0),
(2, '2016-03-02 14:56:25', 2, '2016-03-02 13:41:38', NULL, 0),
(3, '2016-03-13 22:52:51', 12, '2016-03-10 02:26:56', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers_wishlist`
--

CREATE TABLE `customers_wishlist` (
  `products_id` int(13) NOT NULL DEFAULT '0',
  `customers_id` int(13) NOT NULL DEFAULT '0',
  `products_model` varchar(13) COLLATE latin1_general_ci DEFAULT NULL,
  `products_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `final_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `products_quantity` int(2) NOT NULL DEFAULT '0',
  `wishlist_name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_cache`
--

CREATE TABLE `db_cache` (
  `cache_entry_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_archive`
--

CREATE TABLE `email_archive` (
`archive_id` int(11) NOT NULL,
  `email_to_name` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email_to_address` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email_from_name` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email_from_address` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email_subject` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email_html` text COLLATE latin1_general_ci NOT NULL,
  `email_text` text COLLATE latin1_general_ci NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ezpages`
--

CREATE TABLE `ezpages` (
`pages_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `alt_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pages_html_text` mediumtext COLLATE latin1_general_ci,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `ezpages`
--

INSERT INTO `ezpages` (`pages_id`, `languages_id`, `pages_title`, `alt_url`, `alt_url_external`, `pages_html_text`, `status_header`, `status_sidebox`, `status_footer`, `status_toc`, `header_sort_order`, `sidebox_sort_order`, `footer_sort_order`, `toc_sort_order`, `page_open_new_window`, `page_is_ssl`, `toc_chapter`) VALUES
(1, 1, 'EZPages', '', '', 'This is the main page listed under the Link EZPages in the Header<br /><br />\r\n\r\n<strong>See: What is EZPages? Link for detailed use of EZPages</strong><br /><br />\r\n\r\nThis Link could show in the Header, Footer or Sidebox or a combination of all three locations.<br /><br />\r\n\r\nThe Chapter and TOC settings are for using this Page in combination with other Pages.<br /><br />\r\n\r\nThe other Pages can be shown either *only* with this Link in the Chapter and TOC or as their own Link in the Header, Footer or Sidebox, depending on how you would like them to appear on your site.<br /><br />\r\n\r\nThere is no true "Master" Link, other than the Links you actually have configured to display. But any Link in a Chapter can be displayed in any of the 3 locations for the Header, Footer or Sidebox or not at all, where it only appears together with the other Links in the Chapter.', 1, 0, 0, 1, 10, 0, 0, 10, 0, 0, 10),
(2, 1, 'A New Page', '', '', 'This is another page that is linked to the Chapter 10 via the Chapter number used and is sorted based on the TOC Order.<br /><br />\r\n\r\nThere is not a link to this page via the Header, Footer nor the Sidebox.<br /><br />\r\n\r\nThis page is only seen if the "main" link is selected and then it will show in the TOC listing.<br /><br />\r\n\r\nThis is a handy way to have numerous links that are related but only show one main link to get to them all.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 30, 0, 0, 10),
(3, 1, 'Another New Page', '', '', 'This is yet another new page or link that is part of Chapter 10<br /><br />\r\n\r\nThe numbering of the Chapters can be done in any manner. But, by number in increments such as 10, 20, 30, etc. you can later insert pages, or links, as needed within the existing pages.<br /><br />\r\n\r\nThere is no limit to the number of pages, or links, that can be grouped together using the Chapter.<br /><br />\r\n\r\nThe display of the Previous/Next and TOC listing is a setting that can be turned on or off.', 0, 0, 0, 1, 0, 0, 0, 40, 0, 0, 10),
(4, 1, 'My Link', '', '', 'This is a single page link that will be shown in the Sidebox.<br /><br />\r\n\r\nThere are no additional pages or links associated with this page as there is no Chapter.<br /><br />\r\n\r\nLater, if you want to expand on this link you can add a Chapter and TOC settings and build a group.<br /><br />\r\n\r\nNotice that the Previous/Next and TOC automatically disable when there isn''t a Chapter. Even with a Chapter, there must be more than one (1) related link or page in the group before these will display.', 0, 1, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(5, 1, 'Anything', '', '', 'The title or link names can be anything that you would like to use.<br /><br />\r\n\r\nYou decide on the content and the link name relative to that content.<br /><br />\r\n\r\nThen, define where you want the link to show: Header, Footer or Sidebox or as a combination of these three locations.<br /><br />\r\n\r\nThe content of the page can be anything you like. Be sure that your content is valid in regard to table and stylesheet rules.<br /><br />\r\n\r\nYou can even set up the links to go to Secure or Non-Secure pages as well as open in the same or a new window.<br /><br />\r\n\r\nLinks can also be setup to use internal or external links vs the HTML Content. See: examples below in the Link URL settings.', 0, 1, 0, 0, 0, 20, 0, 0, 0, 0, 0),
(6, 1, 'Shared', '', '', 'This link is a "shared" link between the Header, Footer and Sidebox.<br /><br />\r\n\r\nThe number on the order was set to 50 on all of the settings just for the sake of an easier notation on entering it.<br /><br />\r\n\r\nThe order can be the same or different for the three locations.<br /><br />\r\n\r\nIf you wanted to really get creative, you could also have this as part of a Chapter not related to the link order.<br /><br />', 1, 1, 1, 0, 50, 50, 50, 0, 0, 0, 0),
(7, 1, 'My Account', 'index.php?main_page=account', '', '', 0, 0, 1, 0, 0, 0, 10, 0, 0, 1, 0),
(8, 1, 'Site Map', 'index.php?main_page=site_map', '', '', 0, 1, 1, 0, 0, 40, 20, 0, 0, 0, 0),
(9, 1, 'Privacy Notice', 'index.php?main_page=privacy', '', '', 1, 0, 1, 0, 30, 0, 40, 0, 0, 0, 0),
(10, 1, 'Zen Cart', '', 'http://www.zen-cart.com', '', 1, 0, 0, 0, 60, 0, 0, 0, 1, 0, 0),
(11, 1, 'Gift Certificates', 'index.php?main_page=index&cPath=21', '', '', 0, 1, 0, 0, 0, 60, 0, 0, 0, 0, 0),
(12, 1, 'Action DVDs', 'index.php?main_page=index&cPath=3_10', '', '', 0, 0, 1, 0, 0, 0, 60, 0, 0, 0, 0),
(13, 1, 'Google', '', 'http://www.google.com', '', 0, 1, 0, 0, 0, 70, 0, 0, 1, 0, 0),
(14, 1, 'What is EZ-Pages?', '', '', '<table cellspacing="4" cellpadding="4" border="3" align="center" style="width: 80%;"><tbody><tr><td><span style="font-style: italic;">\r\n<span style="font-weight: bold;">Note: This EZ-Page has been written with the help of the HTMLarea Editor.<br /> <br />This means that this EZ-page will not validate correctly based on how HTMLarea or other editors renders the code.</span></span></td></tr></tbody></table><br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Summary</span><br /><br /><span style="font-weight: bold;">EZ-Pages</span> is a fast, easy way of creating links and additional pages.<br /><br />The additional Pages can be for:<br /><ul><li>New Pages</li><li>Internal Links</li><li>External Links</li><li>Secure or Non-Secure pages</li><li>Same or New Window</li></ul>In Addition, there is the ability to create &quot;related&quot; links in the format of a Chapter (group) and its TOC (related pages/links).<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Link Naming</span><br /><br />Links are named by the Page Title. All Links need a Page Title in order to function.<br /><br />If you forget to add a Page Title, then you will not be able to add the Link.<br /><br />If you do not assign an Order for the Header, Sidebox or Footer, then the Link will not display even if you have a Page Title.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Link Placement</span><br /><br /></span>While you have the option of adding Additional Links to the Header, Footer and Sidebox with EZ-Pages, you are not limited to these three Link locations. Links can be in one or more locations simply by enabling the Order for the Location(s) where the Link should appear..<br /><br />The Link Location Status for the Header, Footer and Sidebox is controlled simply by setting these to Yes or No for each setting. Then, set the Order in which the Link should appear for each location.<br /><br />This means that if you were to set Header to Yes 30 and Sidebox to Yes 50 then the link would appear in both the Header and Sidebox in the Order of your Links.<br /><br />The Order numbering method is up to you. Numbering using 10, 20, 30, etc. will allow you to sort the Links and add additional Links later.<br /><br />Note: a 0 value for the Order will disable the Link from displaying.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Open in New Window and Secure Pages</span><br /></span><br />With EZ-Pages, each Link can take you to the same, main window for your shop; or, you can have the Link open a brand new New Window. In addition, there is an option for making the Link open as a Secure Page or a Non-Secure Page.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Chapter and TOC</span><br style="font-weight: bold; color: rgb(255, 0, 0);" /><br />The Chapter and TOC, or Table of Contents, are a unique method of building Multiple Links that interact together.<br /><br />While these Links still follow the rules of the Header, Footer and Sidebox placement, the difference is that only one of the Links, the Main Link, needs to be displayed anywhere on the site.<br /><br />If you had, for example, 5 related Links, you could add the first Link as the Main Link by setting its location to the Header, Footer or Sidebox and set its Order, as usual.<br /><br />Next, you need to assign a Chapter or Group number to the Link. This Chapter holds the related Links together.<br /><br />Then, set the TOC or Table of Contents setting. This is a secondary Sort Order for within the Chapter.<br /><br />Again, you can display any of the Links within a Chapter, as well as making any of these Links the Main Link. Whether the Links all show, or just one or more of the Links show, the Chapter is the key to grouping these Links together in the TOC or Previous/Next. <br /><br /><span style="font-weight: bold; font-style: italic;">NOTE: While all Links within a Chapter will display together, you can have the different Links display in the Header, Footer or Sidebox on their own. Or, you can have the additional Links only display when the Main Link or one of the Additional Links within the Chapter has been opened.</span><br style="font-weight: bold; font-style: italic;" /><br />The versitility of EZ-Pages will make adding new Links and Pages extreamly easy for the beginner as well as the advance user.<br /><br />While this page was made in HTMLarea editor, any HTML editor could be used.<br /><br />However, be careful ... HTML editors will often add the opening and closing tags for the &lt;html&gt;, &lt;head&gt; and &lt;body&gt; to the file you are working on.<br /><br />These are already added to the pages via EZ-Pages.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">External Link URL</span><br /><br />External Link URLs are links to outside pages not within your shop. These can be to any valid URL such as:<br /><br />http://www.sashbox.net<br /><br />You need to include the full URL path to any External Link URL. You may also mark these to open in a New Window or the Same Window.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">Internal Link URL</span><br /><br />Internal Link URLs are links to internal pages within your shop. These can be to any valid URL, but should be written as relative links such as:<br /><br />index.php?main_page=index&amp;cPath=21<br /><br />The above Link would take you to the Category for categories_id 21<br /><br />While these links can be the Full URL to an Internal Link, it is best to write as a Relative Link so that if you change domains, are work on a temporary domain or an IP Address, the Link will remain valid if moved to another domain, IP Address, etc.<br /><br />Internal Links can also open in a New Window or the Same Window or be for Secure or Non-Secure Pages.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">EZ-Pages Additional Pages vs Internal Links vs External Links</span><br /><br />The Type of Link that you create is based on an order of precidence, where HTML Content will superceed both the Internal Link and the External Link values.<br /><br />The External Link URL will superceed the Internal Link URL.<br /><br />If you try to set a combination of HTML Content, Internal Link and/or External Link, the Link will be flagged in the listing with a read icon to alert you to your mistake.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">WARNING ...</span><br /><br />When using Editors such as HTMLarea, if you hit enter in the HTML Content area <br /> will be added. These will be detected as &quot;content&quot; and will override any Internal Link URL or External Link URL.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Admin Only Display</span><br /><br />Sometimes, when working on EZ-Pages, you will want to be able to work on a Live Site and see the results of your work, but not allow the Customers to see this until you are done.<br /><br />There are 3 settings in the Configuration ... EZ-Pages Settings for the Header, Footer and Sidebox  Status:<br /><ul><li>OFF</li><li>ON</li><li>Admin Only</li></ul>The Admin Only setting is controlled by the IP Address(es) set in the Website Maintenance.<br /><br />This can be very handy when needing to work on a Live Site but not wanting customers to see the work in progress.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 20, 0, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

CREATE TABLE `featured` (
`featured_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files_uploaded`
--

CREATE TABLE `files_uploaded` (
`files_uploaded_id` int(11) NOT NULL,
  `sesskey` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Must always have either a sesskey or customers_id';

-- --------------------------------------------------------

--
-- Table structure for table `flexible_footer_menu`
--

CREATE TABLE `flexible_footer_menu` (
`page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `page_title` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `page_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `col_header` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `col_image` varchar(254) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `col_html_text` text CHARACTER SET utf8,
  `status` int(1) NOT NULL DEFAULT '0',
  `col_sort_order` int(11) NOT NULL DEFAULT '0',
  `col_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flexible_footer_menu`
--

INSERT INTO `flexible_footer_menu` (`page_id`, `language_id`, `page_title`, `page_url`, `col_header`, `col_image`, `col_html_text`, `status`, `col_sort_order`, `col_id`, `date_added`, `last_update`) VALUES
(3, 1, 'Home', 'index.php?main_page=', '', '', '', 1, 11, 1, '0000-00-00 00:00:00', '2014-04-15 12:23:45'),
(5, 1, 'Featured', 'index.php?main_page=featured_products', '', '', '', 1, 12, 1, '2013-06-24 07:45:26', '2014-04-15 12:25:49'),
(6, 1, '', '', 'Shop', '', '', 1, 1, 1, '2013-06-24 09:03:26', '2014-04-15 13:05:43'),
(8, 1, 'Specials', 'index.php?main_page=specials', '', '', '', 1, 13, 1, '2013-06-24 09:11:56', '2014-04-15 12:25:28'),
(9, 1, 'New Arrivals', 'index.php?main_page=products_new', '', '', '', 1, 14, 1, '2013-06-24 09:12:50', '2014-04-15 12:26:11'),
(10, 1, 'View All', 'index.php?main_page=products_all', '', '', '', 1, 15, 1, '2013-06-24 09:14:04', '2014-04-15 13:03:06'),
(11, 1, '', '', 'Customer Service', '', '', 1, 21, 2, '2013-06-24 09:15:49', '2014-04-15 15:00:16'),
(12, 1, 'About Us', 'index.php?main_page=about_us', '', '', '', 1, 24, 2, '2013-06-24 09:18:43', '2014-04-15 15:03:23'),
(14, 1, 'Gift Certificate FAQ', 'index.php?main_page=gv_faq', '', '', '', 1, 26, 2, '2013-06-24 09:19:40', '2014-04-15 15:02:42'),
(15, 1, 'Discount Coupons', 'index.php?main_page=discount_coupon', '', '', '', 1, 28, 2, '2013-06-24 09:20:12', '2014-04-15 15:04:14'),
(16, 1, 'Newsletter Unsubscribe', 'index.php?main_page=unsubscribe', '', '', '', 1, 28, 2, '2013-06-24 09:21:30', '2014-04-15 15:04:46'),
(18, 1, 'Contact Us', 'index.php?main_page=contact_us', '', '', '', 1, 23, 2, '2013-06-24 09:32:08', '2014-04-15 15:01:46'),
(19, 1, 'Shipping and Returns', 'index.php?main_page=shippinginfo', '', '', '', 1, 22, 2, '2013-06-24 09:32:33', '2014-04-15 15:01:33'),
(23, 1, 'My Account', 'index.php?main_page=account', '', '', '', 1, 25, 2, '2013-06-24 09:35:02', '2014-04-15 15:03:47'),
(25, 1, '', '', 'Share and Connect', '', '', 1, 4, 4, '2013-06-24 09:36:48', '2013-06-24 14:45:35'),
(26, 1, '', '', '', '', '<a href="https://www.facebook.com/Custom.Zen.Cart.Design" target="_blank"><i class="fa fa-facebook"></i></a><a href="https://twitter.com/picaflorazul" target="_blank"><i class="fa fa-twitter"></i></a><a href="http://www.pinterest.com/picaflorazul" target="_blank"><i class="fa fa-pinterest"></i></a><a href="https://www.youtube.com/user/ZenCartEasyHelp" target="_blank"><i class="fa fa-youtube"></i></a><a href="" target="_blank"><i class="fa fa-instagram"></i></a>', 1, 41, 4, '2013-06-24 09:44:30', '2014-04-25 09:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

CREATE TABLE `geo_zones` (
`geo_zone_id` int(11) NOT NULL,
  `geo_zone_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `get_terms_to_filter`
--

CREATE TABLE `get_terms_to_filter` (
  `get_term_name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `get_term_table` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `get_term_name_field` varchar(64) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `get_terms_to_filter`
--

INSERT INTO `get_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES
('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name'),
('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name'),
('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- --------------------------------------------------------

--
-- Table structure for table `group_pricing`
--

CREATE TABLE `group_pricing` (
`group_id` int(11) NOT NULL,
  `group_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `group_pricing`
--

INSERT INTO `group_pricing` (`group_id`, `group_name`, `group_percentage`, `last_modified`, `date_added`) VALUES
(1, 'Group 10', 10.00, NULL, '2004-04-29 00:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
`languages_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `code` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `directory` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout_boxes`
--

CREATE TABLE `layout_boxes` (
`layout_id` int(11) NOT NULL,
  `layout_template` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  `show_box_min_width` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `layout_boxes`
--

INSERT INTO `layout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`, `show_box_min_width`) VALUES
(1, 'default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0, 0),
(2, 'default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127, 0),
(3, 'default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15, 0),
(4, 'default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1, 0),
(5, 'default_template_settings', 'categories.php', 1, 0, 10, 10, 1, 0),
(6, 'default_template_settings', 'currencies.php', 1, 1, 80, 60, 1, 0),
(7, 'default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0, 0),
(8, 'default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1, 0),
(9, 'default_template_settings', 'featured.php', 1, 0, 45, 0, 0, 0),
(10, 'default_template_settings', 'information.php', 1, 0, 50, 40, 1, 0),
(11, 'default_template_settings', 'languages.php', 1, 1, 70, 50, 1, 0),
(12, 'default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1, 0),
(13, 'default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1, 0),
(14, 'default_template_settings', 'more_information.php', 1, 0, 200, 200, 1, 0),
(15, 'default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0, 0),
(16, 'default_template_settings', 'order_history.php', 1, 1, 0, 0, 0, 0),
(17, 'default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1, 0),
(18, 'default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0, 0),
(19, 'default_template_settings', 'reviews.php', 1, 0, 40, 0, 0, 0),
(20, 'default_template_settings', 'search.php', 1, 1, 10, 0, 0, 0),
(21, 'default_template_settings', 'search_header.php', 0, 0, 0, 0, 1, 1),
(22, 'default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1, 0),
(23, 'default_template_settings', 'specials.php', 1, 1, 45, 0, 0, 0),
(24, 'default_template_settings', 'tell_a_friend.php', 1, 1, 65, 0, 0, 1),
(25, 'default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0, 0),
(26, 'default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1, 0),
(27, 'template_default', 'banner_box_all.php', 1, 1, 5, 0, 0, 1),
(28, 'template_default', 'banner_box.php', 1, 0, 300, 1, 127, 1),
(29, 'template_default', 'banner_box2.php', 1, 1, 15, 1, 15, 1),
(30, 'template_default', 'best_sellers.php', 1, 1, 30, 70, 1, 1),
(31, 'template_default', 'categories.php', 1, 0, 10, 10, 1, 1),
(32, 'template_default', 'currencies.php', 1, 1, 80, 60, 1, 1),
(33, 'template_default', 'ezpages.php', 1, 1, -1, 2, 1, 1),
(34, 'template_default', 'featured.php', 1, 0, 45, 0, 0, 1),
(35, 'template_default', 'information.php', 1, 0, 50, 40, 1, 1),
(36, 'template_default', 'languages.php', 1, 1, 70, 50, 1, 1),
(37, 'template_default', 'manufacturers.php', 1, 0, 30, 20, 1, 1),
(38, 'template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1, 1),
(39, 'template_default', 'more_information.php', 1, 0, 200, 200, 1, 1),
(40, 'template_default', 'my_broken_box.php', 1, 0, 0, 0, 0, 1),
(41, 'template_default', 'order_history.php', 1, 1, 0, 0, 0, 1),
(42, 'template_default', 'product_notifications.php', 1, 1, 55, 85, 1, 1),
(43, 'template_default', 'reviews.php', 1, 0, 40, 0, 0, 1),
(44, 'template_default', 'search.php', 1, 1, 10, 0, 0, 1),
(45, 'template_default', 'search_header.php', 0, 0, 0, 0, 1, 1),
(46, 'template_default', 'shopping_cart.php', 1, 1, 20, 30, 1, 1),
(47, 'template_default', 'specials.php', 1, 1, 45, 0, 0, 1),
(48, 'template_default', 'tell_a_friend.php', 1, 1, 65, 0, 0, 1),
(49, 'template_default', 'whats_new.php', 1, 0, 20, 0, 0, 1),
(50, 'template_default', 'whos_online.php', 1, 1, 200, 200, 1, 1),
(51, 'classic', 'banner_box.php', 1, 0, 300, 1, 127, 1),
(52, 'classic', 'banner_box2.php', 1, 1, 15, 1, 15, 1),
(53, 'classic', 'banner_box_all.php', 1, 1, 5, 0, 0, 1),
(54, 'classic', 'best_sellers.php', 1, 1, 30, 70, 1, 1),
(55, 'classic', 'categories.php', 1, 0, 10, 10, 1, 1),
(56, 'classic', 'currencies.php', 1, 1, 80, 60, 1, 1),
(57, 'classic', 'document_categories.php', 1, 0, 0, 0, 0, 1),
(58, 'classic', 'ezpages.php', 1, 1, -1, 2, 1, 1),
(59, 'classic', 'featured.php', 1, 0, 45, 0, 0, 1),
(60, 'classic', 'information.php', 1, 0, 50, 40, 1, 1),
(61, 'classic', 'languages.php', 1, 1, 70, 50, 1, 1),
(62, 'classic', 'manufacturers.php', 1, 0, 30, 20, 1, 1),
(63, 'classic', 'manufacturer_info.php', 1, 1, 35, 95, 1, 1),
(64, 'classic', 'more_information.php', 1, 0, 200, 200, 1, 1),
(65, 'classic', 'music_genres.php', 1, 1, 0, 0, 0, 1),
(66, 'classic', 'order_history.php', 1, 1, 0, 0, 0, 1),
(67, 'classic', 'product_notifications.php', 1, 1, 55, 85, 1, 1),
(68, 'classic', 'record_companies.php', 1, 1, 0, 0, 0, 1),
(69, 'classic', 'reviews.php', 1, 0, 40, 0, 0, 1),
(70, 'classic', 'search.php', 1, 1, 10, 0, 0, 1),
(71, 'classic', 'search_header.php', 0, 0, 0, 0, 1, 1),
(72, 'classic', 'shopping_cart.php', 1, 1, 20, 30, 1, 1),
(73, 'classic', 'specials.php', 1, 1, 45, 0, 0, 1),
(74, 'classic', 'tell_a_friend.php', 1, 1, 65, 0, 0, 1),
(75, 'classic', 'whats_new.php', 1, 0, 20, 0, 0, 1),
(76, 'classic', 'whos_online.php', 1, 1, 200, 200, 1, 1),
(77, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(78, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(79, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(80, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(81, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(82, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(83, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(84, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(85, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(86, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(87, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(88, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(89, 'default_template_settings', 'languages_header.php', 0, 0, 0, 0, 1, 1),
(90, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(91, 'default_template_settings', 'currencies_header.php', 0, 0, 0, 0, 1, 1),
(92, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(93, 'default_template_settings', 'ezpages_drop_menu.php', 0, 0, 0, 0, 1, 1),
(94, 'winchester_responsive', 'banner_box.php', 0, 0, 0, 0, 0, 1),
(95, 'winchester_responsive', 'banner_box2.php', 0, 0, 0, 0, 0, 1),
(96, 'winchester_responsive', 'banner_box_all.php', 0, 0, 0, 0, 0, 1),
(97, 'winchester_responsive', 'best_sellers.php', 0, 0, 0, 0, 0, 1),
(98, 'winchester_responsive', 'categories.php', 0, 0, 1, 0, 0, 1),
(99, 'winchester_responsive', 'currencies.php', 0, 0, 0, 0, 0, 1),
(100, 'winchester_responsive', 'document_categories.php', 0, 0, 0, 0, 0, 1),
(101, 'winchester_responsive', 'ezpages.php', 0, 0, 0, 0, 0, 1),
(102, 'winchester_responsive', 'ezpages_drop_menu.php', 0, 0, 0, 0, 0, 1),
(103, 'winchester_responsive', 'featured.php', 0, 0, 0, 0, 0, 1),
(104, 'winchester_responsive', 'information.php', 0, 0, 0, 0, 0, 1),
(105, 'winchester_responsive', 'languages.php', 0, 0, 0, 0, 0, 1),
(106, 'winchester_responsive', 'manufacturer_info.php', 0, 0, 0, 0, 0, 1),
(107, 'winchester_responsive', 'manufacturers.php', 0, 0, 0, 0, 0, 1),
(108, 'winchester_responsive', 'more_information.php', 0, 0, 0, 0, 0, 1),
(109, 'winchester_responsive', 'music_genres.php', 0, 0, 0, 0, 0, 1),
(110, 'winchester_responsive', 'order_history.php', 0, 0, 0, 0, 0, 1),
(111, 'winchester_responsive', 'product_notifications.php', 0, 0, 0, 0, 0, 1),
(112, 'winchester_responsive', 'record_companies.php', 0, 0, 0, 0, 0, 1),
(113, 'winchester_responsive', 'reviews.php', 0, 0, 0, 0, 0, 1),
(114, 'winchester_responsive', 'search.php', 1, 0, 0, 0, 0, 1),
(115, 'winchester_responsive', 'search_header.php', 0, 0, 0, 0, 0, 1),
(116, 'winchester_responsive', 'shopping_cart.php', 0, 0, 0, 0, 0, 1),
(117, 'winchester_responsive', 'specials.php', 0, 0, 0, 0, 0, 1),
(118, 'winchester_responsive', 'tell_a_friend.php', 0, 0, 0, 0, 0, 1),
(119, 'winchester_responsive', 'whats_new.php', 0, 0, 0, 0, 0, 1),
(120, 'winchester_responsive', 'whos_online.php', 0, 0, 0, 0, 0, 1),
(121, 'winchester_responsive', 'ch_categories.php', 1, 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
`manufacturers_id` int(11) NOT NULL,
  `manufacturers_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Matrox', 'manufacturers/manufacturer_matrox.gif', '2003-12-23 03:18:19', NULL),
(2, 'Microsoft', 'manufacturers/manufacturer_microsoft.gif', '2003-12-23 03:18:19', NULL),
(3, 'Warner', 'manufacturers/manufacturer_warner.gif', '2003-12-23 03:18:19', NULL),
(4, 'Fox', 'manufacturers/manufacturer_fox.gif', '2003-12-23 03:18:19', NULL),
(5, 'Logitech', 'manufacturers/manufacturer_logitech.gif', '2003-12-23 03:18:19', NULL),
(6, 'Canon', 'manufacturers/manufacturer_canon.gif', '2003-12-23 03:18:19', NULL),
(7, 'Sierra', 'manufacturers/manufacturer_sierra.gif', '2003-12-23 03:18:19', NULL),
(8, 'GT Interactive', 'manufacturers/manufacturer_gt_interactive.gif', '2003-12-23 03:18:19', NULL),
(9, 'Hewlett Packard', 'manufacturers/manufacturer_hewlett_packard.gif', '2003-12-23 03:18:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'http://www.matrox.com', 0, NULL),
(2, 1, 'http://www.microsoft.com', 0, NULL),
(3, 1, 'http://www.warner.com', 0, NULL),
(4, 1, 'http://www.fox.com', 0, NULL),
(5, 1, 'http://www.logitech.com', 0, NULL),
(6, 1, 'http://www.canon.com', 0, NULL),
(7, 1, 'http://www.sierra.com', 0, NULL),
(8, 1, 'http://www.infogrames.com', 0, NULL),
(9, 1, 'http://www.hewlettpackard.com', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_clips`
--

CREATE TABLE `media_clips` (
`clip_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text COLLATE latin1_general_ci NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `media_clips`
--

INSERT INTO `media_clips` (`clip_id`, `media_id`, `clip_type`, `clip_filename`, `date_added`, `last_modified`) VALUES
(1, 1, 1, 'thehunter.mp3', '2004-06-01 20:57:43', '0000-00-00 00:00:00'),
(6, 2, 1, 'thehunter.mp3', '2004-07-13 00:45:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `media_manager`
--

CREATE TABLE `media_manager` (
`media_id` int(11) NOT NULL,
  `media_name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `media_manager`
--

INSERT INTO `media_manager` (`media_id`, `media_name`, `last_modified`, `date_added`) VALUES
(1, 'Russ Tippins - The Hunter', '2004-06-01 20:57:43', '2004-06-01 20:42:53'),
(2, 'Help!', '2004-07-13 01:01:14', '2004-07-12 17:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `media_to_products`
--

CREATE TABLE `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_types`
--

CREATE TABLE `media_types` (
`type_id` int(11) NOT NULL,
  `type_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `type_ext` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `media_types`
--

INSERT INTO `media_types` (`type_id`, `type_name`, `type_ext`) VALUES
(1, 'MP3', '.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_categories_description`
--

CREATE TABLE `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `metatags_keywords` text COLLATE latin1_general_ci,
  `metatags_description` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_products_description`
--

CREATE TABLE `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `metatags_keywords` text COLLATE latin1_general_ci,
  `metatags_description` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `music_genre`
--

CREATE TABLE `music_genre` (
`music_genre_id` int(11) NOT NULL,
  `music_genre_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `music_genre`
--

INSERT INTO `music_genre` (`music_genre_id`, `music_genre_name`, `date_added`, `last_modified`) VALUES
(1, 'Rock', '2004-06-01 20:53:26', NULL),
(2, 'Jazz', '2004-06-01 20:53:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
`newsletters_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `content` text COLLATE latin1_general_ci NOT NULL,
  `content_html` text COLLATE latin1_general_ci NOT NULL,
  `module` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
`orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_company` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_street_address` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_city` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_state` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `customers_country` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `delivery_company` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_street_address` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_city` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `delivery_state` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_country` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `billing_company` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `billing_street_address` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `billing_city` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `billing_state` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `billing_country` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shipping_method` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `coupon_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cc_type` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `cc_owner` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cc_number` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `cc_expires` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shift4_order_mode` enum('demo - no settings needed','testing','live') COLLATE latin1_general_ci DEFAULT NULL,
  `shift4_is_auth_only` bit(1) NOT NULL DEFAULT b'0',
  `shift4_invoice` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `shift4_unique_id` varchar(16) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
`orders_products_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `products_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

CREATE TABLE `orders_products_attributes` (
`orders_products_attributes_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_options_values` text COLLATE latin1_general_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text COLLATE latin1_general_ci,
  `attributes_qty_prices_onetime` text COLLATE latin1_general_ci,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

CREATE TABLE `orders_products_download` (
`orders_products_download_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Delivered'),
(4, 1, 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

CREATE TABLE `orders_status_history` (
`orders_status_history_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text COLLATE latin1_general_ci,
  `shift4_is_voided` bit(1) NOT NULL DEFAULT b'0',
  `shift4_is_partial_capture` bit(1) NOT NULL DEFAULT b'0',
  `shift4_amount_captured` decimal(14,2) NOT NULL,
  `shift4_amount_refunded` decimal(14,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

CREATE TABLE `orders_total` (
`orders_total_id` int(10) unsigned NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `text` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal`
--

CREATE TABLE `paypal` (
`paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `module_name` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `module_mode` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `reason_code` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `payment_type` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_status` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `invoice` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `mc_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `first_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `address_name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `address_street` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `address_city` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `address_state` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `address_zip` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `address_country` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `address_status` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `payer_email` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_id` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_status` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `txn_id` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `verify_sign` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status`
--

CREATE TABLE `paypal_payment_status` (
`payment_status_id` int(11) NOT NULL,
  `payment_status_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `paypal_payment_status`
--

INSERT INTO `paypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Failed'),
(4, 'Denied'),
(5, 'Refunded'),
(6, 'Canceled_Reversal'),
(7, 'Reversed');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status_history`
--

CREATE TABLE `paypal_payment_status_history` (
`payment_status_history_id` int(11) NOT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_status` varchar(17) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_session`
--

CREATE TABLE `paypal_session` (
`unique_id` int(11) NOT NULL,
  `session_id` text COLLATE latin1_general_ci NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_testing`
--

CREATE TABLE `paypal_testing` (
`paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `txn_type` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `module_name` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `module_mode` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `reason_code` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `payment_type` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_status` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `invoice` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `mc_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `first_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `address_name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `address_street` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `address_city` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `address_state` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `address_zip` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `address_country` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `address_status` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `payer_email` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_id` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payer_status` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `txn_id` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
`products_id` int(11) NOT NULL,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `products_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_family` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`, `products_family`) VALUES
(180, 1, 0, '', '0317OM120192.jpg', 82.0000, 0, '2016-03-11 00:49:56', '2016-03-13 23:28:54', NULL, 3.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 82.0000, 85, 1, 0, 0, 0, 0, 0, 'skin-care'),
(181, 1, 0, '', '0317OM120191.jpg', 82.0000, 0, '2016-03-11 01:07:36', '2016-03-13 23:28:09', NULL, 3.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 82.0000, 85, 1, 0, 0, 0, 0, 0, 'skin-care'),
(182, 1, 0, '', 'Encore_Protect.jpg', 75.0000, 0, '2016-03-11 01:34:01', NULL, NULL, 3.4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 75.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(183, 1, 0, '', 'TNB_FaceOil-17_LR.jpg', 110.0000, 0, '2016-03-11 01:36:33', '2016-03-11 01:47:00', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 110.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(184, 1, 0, '', 'TNB_BodyOil-2170-2_LR.jpg', 95.0000, 0, '2016-03-11 01:38:40', '2016-03-11 01:49:13', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 95.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(185, 1, 0, '', 'TNB_TopicalMarineTreatment-2111_LR.jpg', 375.0000, 0, '2016-03-11 01:51:16', '2016-03-11 01:52:28', NULL, 0.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 375.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(186, 1, 0, '', 'TNB_FaceSerum-17_LR.jpg', 140.0000, 0, '2016-03-11 01:54:18', NULL, NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 140.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(187, 1, 0, '', 'TNB_ExfoliatingCleanser-2155_LR.jpg', 48.0000, 0, '2016-03-11 02:01:45', '2016-03-11 02:07:03', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 48.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(188, 1, 0, '', 'TNB_Mist-2161_LR.jpg', 48.0000, 0, '2016-03-11 02:04:07', '2016-03-11 02:32:08', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 48.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(189, 1, 0, '', 'TNB_ExfoliatingCleanser-2155_LR.jpg', 48.0000, 0, '2016-03-11 02:12:24', NULL, NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 48.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(190, 1, 0, '', 'TNB_NightSerumWithRetinol-2116_LR.jpg', 150.0000, 0, '2016-03-11 02:15:26', '2016-03-11 02:33:04', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 150.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(191, 1, 0, '', 'TNB_TopicalVitaminCTreatment-2130_LR.jpg', 65.0000, 0, '2016-03-11 02:16:50', '2016-03-11 02:33:26', NULL, 0.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 65.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(192, 1, 0, '', 'TNB_BalancingFaceOil-2120z_LR.jpg', 110.0000, 0, '2016-03-11 02:18:41', '2016-03-11 02:28:26', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 110.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(193, 1, 0, '', 'TNB_EverydaySheerCoverage-2140_LR.jpg', 68.0000, 0, '2016-03-11 02:20:18', '2016-03-11 02:30:40', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 68.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(194, 1, 0, '', 'TNB_EverydaySheerCoverage-2140_LR-1.jpg', 68.0000, 0, '2016-03-11 02:22:19', '2016-03-11 02:31:34', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 68.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(195, 1, 0, '', 'TNB_ExfoliatingMoistureMask-2135-2_LR.jpg', 90.0000, 0, '2016-03-11 02:24:20', NULL, NULL, 1.7, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 90.0000, 85, 1, 0, 0, 0, 0, 0, NULL),
(196, 1, 0, '', '0317OM80175.jpg', 46.0000, 0, '2016-03-11 02:26:56', '2016-03-11 02:34:26', NULL, 5.1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 46.0000, 86, 1, 0, 0, 0, 0, 0, NULL),
(197, 1, 0, '', 'sol_cleanse_l1.jpg', 25.0000, 0, '2016-03-11 02:42:19', '2016-03-14 00:34:43', NULL, 10, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 25.0000, 87, 1, 0, 0, 0, 0, 0, ''),
(198, 1, 0, '', 'sen_step2.jpg', 38.0000, 0, '2016-03-11 02:48:22', NULL, NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 38.0000, 88, 1, 0, 0, 0, 0, 0, NULL),
(199, 1, 0, '', 'normal_step2.jpg', 38.0000, 0, '2016-03-11 02:50:22', NULL, NULL, 4.2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 38.0000, 88, 1, 0, 0, 0, 0, 0, NULL),
(200, 1, 0, '', 'sen_step3.jpg', 58.0000, 0, '2016-03-11 02:52:06', NULL, NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 58.0000, 89, 1, 0, 0, 0, 0, 0, NULL),
(201, 1, 0, '', 'normal_step3.jpg', 58.0000, 0, '2016-03-11 02:56:12', NULL, NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 58.0000, 89, 1, 0, 0, 0, 0, 0, NULL),
(202, 1, 0, '', 'Encore_Refine.jpg', 65.0000, 0, '2016-03-11 02:57:36', NULL, NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 65.0000, 89, 1, 0, 0, 0, 0, 0, NULL),
(203, 1, 0, '', 'sen_step4.jpg', 56.0000, 0, '2016-03-11 03:00:10', NULL, NULL, 3.4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 56.0000, 90, 1, 0, 0, 0, 0, 0, NULL),
(204, 1, 0, '', 'normal_step4.jpg', 56.0000, 0, '2016-03-11 03:01:23', NULL, NULL, 3.4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 56.0000, 90, 1, 0, 0, 0, 0, 0, NULL),
(205, 1, 0, '', 'Encore_SHAVE.jpg', 38.0000, 0, '2016-03-11 03:02:33', NULL, NULL, 5.1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 38.0000, 90, 1, 0, 0, 0, 0, 0, NULL),
(206, 1, 0, '', 'test-product.png', 1.0000, 0, '2016-03-11 17:29:12', '2016-03-14 11:29:26', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1.0000, 85, 1, 0, 0, 0, 0, 0, ''),
(208, 1, 0, '', 'sol_lotion_l1.jpg', 25.0000, 0, '2016-03-14 00:31:27', '2016-03-14 00:36:45', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 25.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(209, 1, 0, '', 'sol_shampoo_l1.jpg', 25.0000, 0, '2016-03-14 00:36:23', NULL, NULL, 10, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 25.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(210, 1, 0, '', 'sol_conditioner_l1.jpg', 25.0000, 0, '2016-03-14 00:39:02', '2016-03-14 00:40:19', NULL, 10, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 25.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(211, 1, 0, '', 'mudkit.jpg', 25.0000, 0, '2016-03-14 00:40:54', '2016-03-14 00:42:02', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 25.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(212, 1, 0, '', 'sol_giftcard_l1.jpg', 0.0000, 0, '2016-03-14 00:42:27', '2016-03-14 00:58:44', NULL, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 50.0000, 92, 0, 0, 0, 0, 0, 0, ''),
(213, 1, 0, '', 'candle2.jpg', 38.0000, 0, '2016-03-14 01:16:45', '2016-03-14 01:21:25', NULL, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 38.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(214, 1, 0, '', 'Stress-Relief-Candle2.jpg', 20.0000, 0, '2016-03-14 01:18:50', '2016-03-14 01:20:32', NULL, 6, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 20.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(215, 1, 0, '', 'W-blue-t-shirt-Front.jpg', 35.0000, 0, '2016-03-14 01:22:07', '2016-03-14 01:24:14', NULL, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 35.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(216, 1, 0, '', 'W-tan-t-shirt-front.jpg', 35.0000, 0, '2016-03-14 01:27:12', '2016-03-14 01:29:54', NULL, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 35.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(217, 1, 0, '', 'M-tan-t-shirt-Front.jpg', 35.0000, 0, '2016-03-14 01:30:12', '2016-03-14 01:32:19', NULL, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 35.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(218, 1, 0, '', 'M-blue-t-shirt-Front.jpg', 35.0000, 0, '2016-03-14 01:31:31', '2016-03-14 01:32:40', '0001-01-01 00:00:00', 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 35.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(219, 1, 0, '', 'Solage_May2012_3066.jpg', 24.0000, 0, '2016-03-14 11:34:24', '2016-03-14 11:35:34', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 24.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(220, 1, 0, '', 'Solage_May2012_30731-365x500.jpg', 15.0000, 0, '2016-03-14 11:36:06', '2016-03-14 11:37:15', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 15.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(221, 1, 0, '', 'water-bottle-G.jpg', 28.0000, 0, '2016-03-14 11:37:43', '2016-03-14 11:38:56', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 28.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(222, 1, 0, '', 'Mug.jpg', 22.0000, 0, '2016-03-14 11:39:37', '2016-03-14 11:40:28', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 22.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(223, 1, 0, '', 'thermos.jpg', 40.0000, 0, '2016-03-14 11:40:50', '2016-03-14 11:42:31', NULL, 16, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 40.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(224, 1, 0, '', 'Coffee.jpg', 13.0000, 0, '2016-03-14 11:45:01', '2016-03-14 11:45:53', NULL, 12, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 13.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(225, 1, 0, '', 'GlassCleaner1.jpg', 10.0000, 0, '2016-03-14 11:47:49', '2016-03-14 11:48:39', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 10.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(226, 1, 0, '', 'Olive-Oils.jpg', 20.0000, 0, '2016-03-14 11:49:13', '2016-03-14 11:50:46', NULL, 7, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 20.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(227, 1, 0, '', 'Burlap-Bag-Front.jpg', 60.0000, 0, '2016-03-14 11:51:17', '2016-03-14 11:52:29', NULL, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 60.0000, 92, 1, 0, 0, 0, 0, 0, ''),
(228, 1, 0, '', 'Solage_Mod_2013_20262.jpg', 125.0000, 0, '2016-03-14 11:55:01', NULL, NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 125.0000, 94, 1, 0, 0, 0, 0, 0, 'robes'),
(229, 1, 0, '', 'sol_spa_robe_l1.jpg', 95.0000, 0, '2016-03-14 11:55:14', '2016-03-14 11:59:06', NULL, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 95.0000, 94, 1, 0, 0, 0, 0, 0, 'robes'),
(230, 1, 0, '', 'sol_hat_l1.jpg', 22.0000, 0, '2016-03-14 12:01:27', NULL, NULL, 4, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 22.0000, 96, 1, 0, 0, 0, 0, 0, ''),
(231, 1, 0, '', 'compact2_ret-1-444x500.jpg', 95.0000, 0, '2016-03-14 12:06:25', NULL, NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 95.0000, 98, 1, 0, 0, 0, 0, 0, ''),
(232, 1, 0, '', 'compact2_ret-1-444x500.jpg', 95.0000, 0, '2016-03-14 12:06:45', '2016-03-14 12:07:23', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 95.0000, 98, 1, 0, 0, 0, 0, 0, ''),
(233, 1, 0, '', 'compact2_ret-1-444x500.jpg', 95.0000, 0, '2016-03-14 12:06:49', '2016-03-14 12:07:16', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 95.0000, 98, 1, 0, 0, 0, 0, 0, ''),
(234, 1, 0, '', 'sen_step-305x500.jpg', 40.0000, 0, '2016-03-14 12:19:53', NULL, NULL, 5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 40.0000, 87, 1, 0, 0, 0, 0, 0, ''),
(235, 1, 0, '', 'normal_step1-310x500.jpg', 40.0000, 0, '2016-03-14 12:20:12', '2016-03-14 12:21:10', NULL, 5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 40.0000, 87, 1, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
`products_attributes_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text COLLATE latin1_general_ci,
  `attributes_qty_prices_onetime` text COLLATE latin1_general_ci,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1171 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`, `products_options_sort_order`, `product_attribute_is_free`, `products_attributes_weight`, `products_attributes_weight_prefix`, `attributes_display_only`, `attributes_default`, `attributes_discounted`, `attributes_image`, `attributes_price_base_included`, `attributes_price_onetime`, `attributes_price_factor`, `attributes_price_factor_offset`, `attributes_price_factor_onetime`, `attributes_price_factor_onetime_offset`, `attributes_qty_prices`, `attributes_qty_prices_onetime`, `attributes_price_words`, `attributes_price_words_free`, `attributes_price_letters`, `attributes_price_letters_free`, `attributes_required`) VALUES
(1112, 212, 20, 70, 100.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1113, 212, 20, 71, 150.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1114, 212, 20, 72, 200.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1115, 212, 20, 69, 50.0000, '+', -1, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 50.0000, 50.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1116, 212, 20, 88, 1000.0000, '+', 1, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1117, 212, 20, 89, 1500.0000, '+', 2, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1118, 212, 20, 90, 2000.0000, '+', 3, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1119, 212, 20, 73, 250.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1120, 212, 20, 91, 2500.0000, '+', 4, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1121, 212, 20, 74, 300.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1122, 212, 20, 92, 3000.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1123, 212, 20, 75, 350.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1124, 212, 20, 93, 3500.0000, '+', 6, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1125, 212, 20, 76, 400.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1126, 212, 20, 94, 4000.0000, '+', 7, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1127, 212, 20, 77, 450.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1128, 212, 20, 95, 4500.0000, '+', 8, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1129, 212, 20, 78, 500.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1130, 212, 20, 96, 5000.0000, '+', 9, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1131, 212, 20, 79, 550.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1132, 212, 20, 80, 600.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1133, 212, 20, 81, 650.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1134, 212, 20, 82, 700.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1135, 212, 20, 83, 750.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1136, 212, 20, 84, 800.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1137, 212, 20, 85, 850.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1138, 212, 20, 86, 900.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1139, 212, 20, 87, 950.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1140, 215, 2, 20, 0.0000, '+', 40, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1141, 215, 2, 18, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1142, 215, 2, 37, 0.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1143, 215, 2, 21, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1144, 215, 2, 19, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1146, 216, 2, 20, 0.0000, '+', 40, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1147, 216, 2, 18, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1148, 216, 2, 37, 0.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1149, 216, 2, 21, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1150, 216, 2, 19, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1151, 217, 2, 20, 0.0000, '+', 40, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1152, 217, 2, 18, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1153, 217, 2, 37, 0.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1154, 217, 2, 21, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1155, 217, 2, 19, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1156, 218, 2, 20, 0.0000, '+', 40, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1157, 218, 2, 18, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1158, 218, 2, 37, 0.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1159, 218, 2, 21, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1160, 218, 2, 19, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1161, 229, 2, 20, 0.0000, '+', 40, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1162, 229, 2, 18, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1163, 229, 2, 37, 0.0000, '+', 5, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1164, 229, 2, 21, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1165, 229, 2, 19, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1166, 230, 1, 29, 0.0000, '+', -10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1167, 230, 1, 28, 0.0000, '+', 0, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1168, 230, 1, 16, 0.0000, '+', 10, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1169, 230, 1, 17, 0.0000, '+', 30, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0),
(1170, 230, 1, 25, 0.0000, '+', 20, 1, 0, '+', 0, 0, 1, '', 1, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', '', 0.0000, 0, 0.0000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE `products_description` (
`products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_description` text COLLATE latin1_general_ci,
  `products_url` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(180, 1, 'Organic Male - Sensitive Starter Travel Set', 'The Sensitive Skin Regimen derives essential active ingredients from the water, the world''s oceans and seas. Active phyto nutrients in marine based botanicals are especially beneficial to sensitive skin. Steeped in ocean marine ingredients, and exotic green tea, the Sensitive Collection is formulated, specifically, to calm and soothe male skin.\r\n\r\nEnjoy the Travel Starter set that includes a TSA approved travel bottle of the 4 steps: 1oz. Wash, 1oz. Balance, 0.5oz Bioactivate, and 1oz. Defend..', '', 65),
(181, 1, 'Organic Male - Normal Starter Travel Set', 'The Normal/Combination Skin Regimen combines mineral-rich, antioxidant-packed berries, grains and wine extracts from across the Oregon vineyards and agricultural landscape. These earthy botanicals provide a solid foundation for normal male skin nutrition. Rich in polyphenols, the Normal Skin Collection defers the onset of fine lines and minimizes large pores. Designed for men with normal/combination skin. Enjoy the Travel Starter set that includes a TSA approved travel bottle of the 4 steps: 1oz. Wash, 1oz. Balance, 0.5oz Bioactivate, and 1oz. Defend.', '', 7),
(182, 1, 'Organic Male - Sun Secure Mineral SPF 30-Broad Spectrum UVA/UVB', 'Protect your skin from the environment and minimize photo-aging with OM4''s unique Broad Spectrum SPF 30.  Signature ingredients are microblended to create a three-in-one product that protects the skin from harmful UV radiation, helps prevent oxidative stress and collagen degradation, while brightening and clarifying the complexion.\r\nProduct size: 100 ml / 3.381 fl. oz.', '', 4),
(183, 1, 'True Nature Botanicals - Pacific Face Oil', 'Boosts the body''s capacity to retain moisture by giving it the super rich, nourishing and highly absorbent essential oils aging skin needs.\r\n\r\nTHE RESULT: Rough patches disappear, cracked skin heals and your overall skin appearance improves.\r\n\r\nIDEAL FOR: All skin types, particularly aging skin.\r\n\r\n4oz | 120ml', '', 8),
(184, 1, 'True Nature Botanicals - Pacific Body Oil', 'Boosts the body''s capacity to retain moisture by giving it the super rich, nourishing and highly absorbent essential oils aging skin needs.\r\n\r\nTHE RESULT: Rough patches disappear, cracked skin heals and your overall skin appearance improves.\r\n\r\nIDEAL FOR: All skin types, particularly aging skin.\r\n\r\n4oz | 120ml', '', 18),
(185, 1, 'True Nature Botanicals - Pacific Topical Marine Treatment', 'This is most potent anti-aging treatment you can buy, one that reverses the skin&rsquo;s aging process in as little as three months. \r\n\r\nTHE RESULT: Reverse the skin''s aging process after just three months of treatment and move forward with younger, thicker and healthier skin. \r\n\r\nIDEAL FOR: All skin types, including sun damaged, thin, aging, wrinkled, and rosacea prone skin. \r\n\r\n0.5oz | 15ml', '', 4),
(186, 1, 'True Nature Botanicals - Pacific Face Serum', 'ourishes aging skin with bioactive ingredients from the ocean to improve barrier function, increase moisture retention and restore suppleness. \r\n\r\nTHE RESULT: Plump, hydrated skin that hides your wrinkles. Dry, damaged skin is replaced by skin that is soft, dewy and smooth. \r\n\r\nIDEAL FOR: All skin types, including dry, aging, and rosacea prone skin. \r\n\r\n1oz | 30ml', '', 2),
(187, 1, 'True Nature Botanicals - Pacific Cleanser', 'Uses extra nutritive oils to hydrate aging skin and mild sudsing agents to gently remove grime, dead skin cells, makeup, and sunscreen.\r\n\r\nTHE RESULT: Cleaner, smoother, softer and more supple skin.\r\n\r\nIDEAL FOR: All skin types, including dry, sensitive and aging skin.\r\n\r\n4oz | 120ml', '', 2),
(188, 1, 'True Nature Botanicals - Pacific Mist', 'Replaces moisture in aging skin by delivering potent marine extracts and extra nutrients to the topmost layers of the skin.\r\n\r\nTHE RESULT: Moist, dewy and plumper skin, which means wrinkles are a lot less noticeable.\r\n\r\nIDEAL FOR: All skin types, particularly aging skin.\r\n\r\n4oz | 120ml', '', 2),
(189, 1, 'True Nature Botanicals - Pacific Exfoliating Cleanser', 'Removes excess dead skin cells naturally, without risk of irritation, by combining a patented mushroom extract with a gentle skin polishing scrub.\r\n\r\nTHE RESULT: Soft, smooth skin that looks and feels fresh and clean.\r\n\r\nIDEAL FOR: All skin types, including dry, sensitive and blemish prone skin.\r\n\r\n4oz | 120ml', '', 3),
(190, 1, 'True Nature Botanicals - Pacific Night Serum with Retinol', 'The all-in-one serum for aging skin&mdash;increases collagen production, prevents moisture loss and stimulates new cell formation to repair damaged skin and even out skin tone. \r\n\r\nTHE RESULT: Regain that &ldquo;youthful glow&rdquo; with bright, moist, plump, and perky skin. \r\n\r\nIDEAL FOR: All skin types, including aging, wrinkled, and sun damaged skin. 1oz | 30ml', '', 2),
(191, 1, 'True Nature Botanicals - Pacific Topical Vitamin C Treatment', 'Delivers Vitamin C in its freshest form, protecting, repairing, and brightening aging skin.\r\n\r\nTHE RESULT: Firmer, less wrinkled and healthier skin with more even skin tones.\r\n\r\nIDEAL FOR:  All skin types, including sun damaged, aging, and wrinkled skin.\r\n\r\n30 capsules', '', 2),
(192, 1, 'True Nature Botanicals - Pacific Balancing Face Oil', 'Anti-bacterial oils eliminate infection, anti-inflammatory oils calm irritation and oils high in linoleic acid balance problematic, blemish-prone skin. Potent marine antioxidants also replenish the top layers of aging skin to retain moisture and repel assaults from sun and wind.\r\n\r\nTHE RESULT: Blemish prone skin clears up, oily skin regains its balance, inflamed skin is calmed, and wrinkles soften.\r\n\r\nIDEAL FOR: Problematic, blemish or acne prone aging skin.\r\n\r\n1oz | 30ml', '', 2),
(193, 1, 'True Nature Botanicals - Pacific Everyday Sheer Coverage light', 'Delivers broad-spectrum UV protection for aging skin with non-nano zinc oxide and powerful antioxidants&mdash;all with a sheer matte finish that makes it ideal for everyday use. \r\n\r\nTHE RESULT: Get a smooth, sheer matte finish and peace of mind knowing your aging skin is protected. \r\n\r\nIDEAL FOR: All skin types, including sensitive, rosacea prone, and blemish or acne prone skin.', '', 5),
(194, 1, 'True Nature Botanicals - Pacific Everyday Sheer Coverage medium', 'Delivers broad-spectrum UV protection for aging skin with non-nano zinc oxide and powerful antioxidants&mdash;all with a sheer matte finish that makes it ideal for everyday use. \r\n\r\nTHE RESULT: Get a smooth, sheer matte finish and peace of mind knowing your aging skin is protected. \r\n\r\nIDEAL FOR: All skin types, including sensitive, rosacea prone, and blemish or acne prone skin. 2oz | 60ml', '', 2),
(195, 1, 'True Nature Botanicals - Pacific Exfoliating Moisture Mask', 'Gives you back that youthful glow by exfoliating, conditioning and brightening your skin.\r\n\r\nTHE RESULT: Gives you back that youthful glow, transforming your skin from dull and blotchy to soft and supple.\r\n\r\nIDEAL FOR: All skin types, including dry, aging, wrinkled, and blemish or acne prone skin.\r\n\r\n1.7oz | 50ml\r\n\r\n- See more at: https://shop.solagecalistoga.com/product/pacific-exfoliating-moisture-mask-2/#sthash.VUyFqYb4.dpuf', '', 1),
(196, 1, 'Organic Male - Citrus Bamboo Resurfacing Scrub', 'Exfoliation is an essential step in men&rsquo;s skin care. Ingrown hair, large pores and other male skin conditions are positively impacted by spending only 60 seconds exfoliating, bi-weekly. The regenerative properties of Tangerine detoxify and potentiate the formation of collagen and stimulate cellular repair. Fruit acids are microblended with exotic hibiscus, neroli, jojoba beads and bamboo to produce an amazing resurfacing agent that will turn back the hands of time. Bring your skin back to life by gently removing dull, dead epidermal cells uncovering a youthful new skin layer which readily absorbs and benefits from your OM4 core products. \r\n\r\nProduct size: 100 ml / 5.072 fl. oz.', '', 2),
(197, 1, 'Solage - Solage Cleanse', 'Our gentle body wash with botanical cleansers, skin-soothing oat and aloe vera, combined with a pro-vitamin cocktail, revitalize and protect the skin, jasmine and thyme, purify and rejuvenate the skin with a delicate, uplifting scent.', '', 3),
(198, 1, 'Organic Male - Soothing Ocean Mineral Splash', 'A soothing aftershave/after cleansing toner designed exclusively for male sensitive skin. Gotu Kola, Rosehip and Chamomile are scientifically blended with our Ocean Mineral Concentrate and proprietary Marine Super Food ComplexTM to protect, soothe and heal environmentally stressed skin. Soothing Ocean Mineral Splash actively reduces inflammation, redness, blemishes and burns. Excellent solution for male rosacea. \r\n\r\nProduct size: 125 ml / 4.227 fl. oz.', '', 1),
(199, 1, 'Organic Male - Surface Refining Ph Balancer', 'Blueberry, Pomegranate and Witch Hazel are key actives in this cooling, anti-inflammatory and regenerative toner. Wild cherry, red raspberry and wine extracts protect, firm and resurface the skin texture leaving a smooth and lively appearance. Product size: 125 ml / 4.227 fl. oz.', '', 0),
(200, 1, 'Organic Male - Phytonutrient Cellular Repair Serum', 'Infuse your skin with marine phytonutrients and a powerhouse blend of vitamin A, B, C, and Coenzyme Q10. This calming and nourishing serum penetrates deeply to literally feed the skin and prevent premature aging. Effective in the treatment and management of rosacea. \r\n\r\nProduct size: 30 ml / 1.014 fl. oz.', '', 4),
(201, 1, 'Organic Male - Age-Defying Antioxidant Serum', 'Allow your skin to drink the benefits of Oregon Grape, and Red Wine extracts. Grape seeds and skins are rich in polyphenols&mdash;powerful anti-aging, antioxidant agents, and resveratrol&mdash;a substance which increases the production of protein SIRT1, known to slow the natural aging process, protect against DNA damage and cellular entropy. Wine extracts also reduce inflammation and protect against damaging environmental impacts. \r\n\r\nProduct size: 30 ml / 1.014 fl. oz.', '', 3),
(202, 1, 'Organic Male - Radical Fine Line Eraser', 'Daytime eye protection is important in the prevention of fine lines which appear around the eye contour area. Radical Fine Line Eraser will minimize the appearance of fine lines, and address common concerns associated with eye fatigue. Eyebright, our Silk Protein Amino Acid Blend, Multi-Fruit Acids and Rosehip Oil protect, defend and help you look your best at any age. Botanicals from each of the four core skin type proprietary blends are added to this potent bioactive eye gel, making for an amazing and lengthy list of ingredients. But, don&rsquo;t let all that content scare you. By adding proprietary actives from each of our skin-type specific core collections, we have created a bioactive, comprehensive daytime gel that will work as hard as you do throughout your active day. \r\n\r\nProduct size: 30 ml / 1.014 fl. oz.', '', 0),
(203, 1, 'Organic Male - Sea Essentials Calming Moisturizer', 'Guard and protect your skin from the impacts of stress and the environment with this soothing blend of essential botanicals from land and sea. Kelp and Jojoba, ingredients which most closely mimic the plasma content of the human body and sebum of the skin, are suspended in hexagonally structured water, which is instantly absorbed leaving the skin highly moisturized without heaviness. Also recommended for rosacea. \r\n\r\nProduct size: 100 ml / 3.381 fl. oz.', '', 1),
(204, 1, 'Organic Male - Environmental Defense Hydration', 'The composition of male skin is unique. Endurance Moisturizing Complex is our signature microblend of the most nutritional, healing and protective ingredients known to man. Jojoba oil, aloe, vitamin A and C are frothed into a light, instantly absorbing moisturizer. Packed with restorative micronutrients found in alfalfa, wine and vines, Endurance Moisturizing Complex is one product you will never want to do without. \r\n\r\nProduct size: 100 ml / 3.381 fl. oz.', '', 0),
(205, 1, 'Organic Male - Soothing Herbal Shaving Emulsion', 'Coltsfoot, cactus and prickly ash are microblended into a protective, soothing lotion which is applied to the skin before shaving. Peppermint and Lavender invigorate the senses, while stonecrop and comfrey immediately soothe razor burn and heal skin irritation. \r\n\r\nProduct size: 150 ml / 5.072 fl. oz.', '', 0),
(206, 1, 'Test product', 'Bacon ipsum dolor amet t-bone beef ribs landjaeger hamburger. Shankle kevin pastrami pig pancetta shank tail brisket drumstick pork belly ribeye. Jowl doner pork chop, rump bresaola short ribs short loin ball tip brisket. Pastrami tenderloin kielbasa, swine strip steak corned beef leberkas sirloin sausage.\r\n\r\nAndouille kevin pig pancetta pork belly. Hamburger venison beef ribs t-bone, pork loin kielbasa biltong tail tongue jowl. Hamburger beef corned beef rump, salami alcatra andouille venison. Strip steak ball tip turkey ground round. Chicken fatback chuck pork chop salami cow. Shoulder beef ribs salami fatback, picanha swine cupim turducken tri-tip porchetta sirloin. Landjaeger kielbasa drumstick bacon rump pork chop, ground round frankfurter filet mignon kevin turkey strip steak sausage hamburger.', '', 0),
(208, 1, 'Solage - Solage Lotion', 'Our signature lavender hand and body lotion drenches the skin with nourishing moisture and provides instant escape from a stress-filled world. Therapeutic oils, herbal extracts, and essential oils of lavender, bergamot and rose geranium, quiet the mind and soothe the spirit.', '', 4),
(209, 1, 'Solage - Solage Shampoo', 'Add brilliance and body to your hair with our purifying shampoo that naturally cleanses and balances the scalp while stimulating healthy hair growth. The uplifting essential oil blend of sweet orange, sage, cedar and rosemary strengthens the hair and maintains a vibrant glossy shine.', '', 2),
(210, 1, 'Solage - Solage Conditioner', 'Enhance manageability and provide a radiant shine with our nutrient rich cr&egrave;me conditioning rinse. A medley of essential oils including rosemary, sage and rose geranium add extra body and provide stimulation to the scalp.', '', 0),
(211, 1, 'Solage - Spa Solage Mud Kit', 'Take home our exclusive Solage mud kit and enjoy a mudslide in your own home!', '', 1),
(212, 1, 'Solage - Solage Gift Cards', 'Surprise them with the Gift of Solage. \r\n\r\nGift certificates range from $50 - $5,000 USD.', '', 22),
(213, 1, 'Solage - Solage Signature candle, large', 'Soy wax candle with pure essential oil. \r\n\r\nStress relief blend: lavender/ geranium / sandalwood boxed\r\n\r\n-8oz', '', 2),
(214, 1, 'Solage - Solage Signature candle, small', 'Soy wax candle with pure essential oil. \r\n\r\nStress relief blend: lavender/ geranium / sandalwood tin \r\n\r\n-6oz', '', 2),
(215, 1, 'Solage - Solage Women&rsquo;s Logo Bike Tee, blue', 'Women&rsquo;s t-shirt with wrap-around bike image and Solage logo on sleeve \r\n\r\n100% cotton \r\n\r\ncolor: blue', '', 5),
(216, 1, 'Solage - Solage Women&rsquo;s Logo Bike Tee, tan', 'Women&rsquo;s t-shirt with wrap-around bike image and Solage logo on sleeve \r\n\r\n50% polyster, 25% cotton, 25% rayon \r\n\r\ncolor: tan', '', 0),
(217, 1, 'Solage - Solage Men&rsquo;s Logo Bike Tee, tan', 'Men&rsquo;s t-shirt with wrap-around bike image and Solage logo on sleeve \r\n\r\n52% cotton, 42% polyester \r\n\r\ncolor: blue', '', 0),
(218, 1, 'Solage - Solage Men&rsquo;s Logo Bike Tee, blue', 'Men&rsquo;s t-shirt with wrap-around bike image and Solage logo on sleeve \r\n\r\n52% cotton, 42% polyester \r\n\r\ncolor: blue', '', 0),
(219, 1, 'Solage - Logo Glass Carafe', 'Solage logo glass carafe &ndash; just like the one Solbar provides at the table! \r\n\r\n32oz', '', 0),
(220, 1, 'Solage - Logo Glass Jar', 'Solage logo glass water jar &ndash; just like the one you can find on your nightstand after turn down during your stay with us! \r\n\r\n8oz', '', 0),
(221, 1, 'Solage -  Logo Filter Water Bottle - green', 'Hydrate with our colorful Solage logo filter water bottle. \r\n\r\n32oz', '', 0),
(222, 1, 'Solage - Logo To-Go Tumbler', 'Enjoy your hot beverage on the go in our Solage logo tumbler stainless steel \r\n\r\n32oz', '', 0),
(223, 1, 'Solage - Logo Thermos', 'Keep your favorite beverage hot or cold in our stainless steel Solage logo thermos bottle. Also comes with a black leather pouch. \r\n\r\n16oz', '', 0),
(224, 1, 'Solage - Solage Coffee', 'Feel like you are drinking coffee in one of our studios: order our Solage Calistoga Blend! 70% dark roast 30% light roast \r\n\r\n12oz', '', 0),
(225, 1, 'Solage - Logo Lens Cleaning Kit', 'Clean your glasses with style and use the Solage logo lens cleaning kit. Microfiber cloth and cleaning solution included.', '', 1),
(226, 1, 'Solage - Olive Oil & Vinegar', 'Everybody&rsquo;s favorite olive oil and balsamic vinegar made for Solage! \r\n\r\nGift set: Cask aged Balsamic Vinegar and Napa Valley Olive Oil. \r\n\r\n100ml each', '', 0),
(227, 1, 'Solage - Jute Market Bag', 'This 100% golden jute fiber Market Bag is the perfect carrier for trips to the farmers market or grocery store. It boasts a waterproof lining, vegetable dyed leather straps and antique nickel rivets. Additionally, this handcrafted bag provides sustainable employment and a fair wage for a growing female artisan cooperative in rural Bangladesh. \r\n\r\nBrand: Solage Resort + Apolis\r\n\r\nOrigin: Bangladesh Project', '', 0),
(228, 1, 'Solage - Resort Robe', 'Experience pure indulgence in our luxury resort robe. Full length Plush, soft lining including lapel. 55% Cotton/45% Poly, 100% poly liner. Cotton outer, machine wash. One size fits most.', '', 2),
(229, 1, 'Solage - Spa Robe', 'Bring home the spa with everyone&rsquo;s favorite 100% cotton waffle weave hooded spa robe.', '', 2),
(230, 1, 'Solage - Hat', '100% cotton twill cap features a form fitting unstructured low-sweep profile with an adjustable closure. \r\n\r\nAvailable in multiple colors.', '', 6),
(231, 1, 'True Nature Botanicals - Noble Citrus', 'PRIMARY NOTES \r\nBergamot, Orris, Cypress \r\n\r\nStroll through a perfect Pacific orange grove surrounded by fragrant cypress trees, twisted and tangled by the cool western winds.', '', 1),
(232, 1, 'True Nature Botanicals - Noble Woods', 'PRIMARY NOTES \r\nBergamot, Orris, Cypress \r\n\r\nStroll through a perfect Pacific orange grove surrounded by fragrant cypress trees, twisted and tangled by the cool western winds.', '', 0),
(233, 1, 'True Nature Botanicals - Noble Floral', 'PRIMARY NOTES \r\nBergamot, Orris, Cypress \r\n\r\nStroll through a perfect Pacific orange grove surrounded by fragrant cypress trees, twisted and tangled by the cool western winds.', '', 0),
(234, 1, 'Organic Male - Marine Mineral and Green Tea Gel Wash', 'This soothing antioxidant- and mineral-rich cleanser is specifically designed for men who experience razor burn and other skin irritations. Green Tea, Irish Moss, Marine Phytoplanktin, Red Algae and Kelp combine to seek and destroy free radicals while providing essential nutrients&ndash;naturally occurring vitamins, amino acids and rare trace elements which increase cellular energy transmission and repair. \r\n\r\nProduct size: 150 ml / 5.072 fl. oz.', '', 0),
(235, 1, 'Organic Male - Microblended Bionutrient Face Wash', 'Red Raspberry, Wild Cherry, Alfalfa, Oats and the Vineyards of the Willamette Valley are common sights across the Oregon landscape. These ingredients are carefully harvested and &ldquo;microblended&rdquo; into a fine Belgian ale for the skin. Oats are high in amino acids, and are effective in soothing and cleansing the epidermis. Oregon Grape and orchard fruits minimize fine lines and stimulate cellular activity. Cheers to healthy, younger looking skin. \r\n\r\nProduct size: 150 ml / 5.072 fl. oz.', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_discount_quantity`
--

CREATE TABLE `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`products_options_id`, `language_id`, `products_options_name`, `products_options_sort_order`, `products_options_type`, `products_options_length`, `products_options_comment`, `products_options_size`, `products_options_images_per_row`, `products_options_images_style`, `products_options_rows`) VALUES
(1, 1, 'Color', 10, 0, 32, '', 32, 5, 0, 1),
(2, 1, 'Size', 20, 0, 32, '', 32, 5, 0, 1),
(3, 1, 'Model', 30, 0, 32, '', 32, 5, 0, 1),
(4, 1, 'Memory', 50, 0, 32, '', 32, 5, 0, 1),
(5, 1, 'Version', 40, 0, 32, '', 32, 5, 0, 1),
(6, 1, 'Media Type', 60, 0, 32, '', 32, 5, 0, 1),
(17, 1, 'Documentation', 45, 0, 32, NULL, 32, 5, 0, 1),
(16, 1, 'Irons', 800, 3, 32, '', 32, 5, 0, 1),
(7, 1, 'Logo Back', 310, 4, 32, '', 32, 5, 0, 1),
(8, 1, 'Logo Front', 300, 4, 32, 'You may upload your own image file(s)', 32, 5, 0, 1),
(9, 1, 'Line 2', 410, 1, 64, '', 40, 5, 0, 1),
(10, 1, 'Line 1', 400, 1, 64, 'Enter your text up to 64 characters, punctuation and spaces', 40, 5, 0, 1),
(11, 1, 'Line 3', 420, 1, 64, '', 40, 5, 0, 1),
(12, 1, 'Line 4', 430, 1, 64, '', 40, 5, 0, 1),
(13, 1, 'Gift Options', 70, 3, 32, 'Special Option Options Available:', 32, 5, 0, 1),
(14, 1, 'Amount', 200, 2, 32, '', 32, 5, 0, 1),
(15, 1, 'Features', 700, 5, 32, '&nbsp;', 32, 5, 0, 1),
(18, 1, 'Length', 70, 0, 32, '', 32, 5, 0, 1),
(19, 1, 'Shipping', 600, 5, 32, '', 32, 0, 0, 1),
(20, 1, 'Price', 0, 0, 32, '', 32, 0, 0, 28);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_types`
--

CREATE TABLE `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Track products_options_types';

--
-- Dumping data for table `products_options_types`
--

INSERT INTO `products_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES
(0, 'Dropdown'),
(1, 'Text'),
(2, 'Radio'),
(3, 'Checkbox'),
(4, 'File'),
(5, 'Read Only');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES
(0, 1, 'TEXT', 0),
(1, 1, '4 mb', 10),
(2, 1, '8 mb', 20),
(3, 1, '16 mb', 30),
(4, 1, '32 mb', 40),
(5, 1, 'Value', 10),
(6, 1, 'Premium', 20),
(7, 1, 'Deluxe', 30),
(8, 1, 'PS/2', 20),
(9, 1, 'USB', 10),
(10, 1, 'Download: Windows - English', 10),
(13, 1, 'Box: Windows - English', 1000),
(14, 1, 'DVD/VHS Combo Pak', 30),
(15, 1, 'Blue', 50),
(16, 1, 'Red', 10),
(17, 1, 'Grey', 30),
(18, 1, 'Medium', 30),
(63, 1, 'MS Word - English', 20),
(19, 1, 'X-Small', 10),
(62, 1, 'PDF - English', 10),
(61, 1, '2 Iron', 20),
(20, 1, 'Large', 40),
(60, 1, '8 Iron', 80),
(59, 1, '7 Iron', 70),
(21, 1, 'Small', 20),
(58, 1, 'Wedge', 200),
(57, 1, '9 Iron', 90),
(22, 1, 'VHS', 20),
(23, 1, 'DVD', 10),
(56, 1, '6 Iron', 60),
(55, 1, '5 Iron', 50),
(24, 1, '20th Century', 10),
(54, 1, '4 Iron', 40),
(53, 1, '3 Iron', 30),
(25, 1, 'Khaki', 20),
(26, 1, 'Green', 40),
(27, 1, 'Purple', 60),
(28, 1, 'Brown', 70),
(29, 1, 'Black', 80),
(30, 1, 'White', 90),
(31, 1, 'Silver', 100),
(32, 1, 'Gold', 110),
(64, 1, 'Download: MAC - English', 100),
(34, 1, 'Wrapping', 40),
(35, 1, 'Autographed Memorabilia Card', 30),
(36, 1, 'Collector''s Tin', 20),
(37, 1, 'Select from below ...', 5),
(38, 1, '$5.00', 5),
(39, 1, '$10.00', 10),
(40, 1, '$25.00', 25),
(41, 1, '$15.00', 15),
(42, 1, '$50.00', 50),
(43, 1, '$100.00', 100),
(44, 1, 'Select from below ...', 5),
(45, 1, 'NONE', 5),
(46, 1, 'None', 5),
(47, 1, 'Embossed Collector''s Tin', 10),
(49, 1, 'Custom Handling', 20),
(48, 1, 'None', 5),
(50, 1, 'Same Day Shipping', 30),
(51, 1, 'Quality Design', 10),
(52, 1, 'Download: Windows - Spanish', 20),
(65, 1, 'per Foot', 10),
(66, 1, 'per Yard', 20),
(67, 1, 'Free Shipping Included!', 10),
(68, 1, 'Book Hard Cover', 5),
(69, 1, '$50.00', 0),
(70, 1, '$100', 0),
(71, 1, '$150', 0),
(72, 1, '$200', 0),
(73, 1, '$250', 0),
(74, 1, '$300', 0),
(75, 1, '$350', 0),
(76, 1, '$400', 0),
(77, 1, '$450', 0),
(78, 1, '$500', 0),
(79, 1, '$550', 0),
(80, 1, '$600', 0),
(81, 1, '$650', 0),
(82, 1, '$700', 0),
(83, 1, '$750', 0),
(84, 1, '$800', 0),
(85, 1, '$850', 0),
(86, 1, '$900', 0),
(87, 1, '$950', 0),
(88, 1, '$1000', 0),
(89, 1, '$1500', 0),
(90, 1, '$2000', 0),
(91, 1, '$2500', 0),
(92, 1, '$3000', 0),
(93, 1, '$3500', 0),
(94, 1, '$4000', 0),
(95, 1, '$4500', 0),
(96, 1, '$5000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

CREATE TABLE `products_options_values_to_products_options` (
`products_options_values_to_products_options_id` int(11) NOT NULL,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options_values_to_products_options`
--

INSERT INTO `products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13),
(14, 6, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 6, 22),
(23, 6, 23),
(24, 5, 24),
(61, 8, 0),
(60, 7, 0),
(59, 12, 0),
(58, 11, 0),
(57, 10, 0),
(56, 9, 0),
(35, 1, 25),
(36, 1, 26),
(37, 1, 27),
(38, 1, 28),
(39, 1, 29),
(40, 1, 30),
(41, 1, 31),
(42, 1, 32),
(89, 5, 64),
(55, 13, 36),
(54, 13, 35),
(53, 13, 34),
(62, 2, 37),
(63, 14, 38),
(64, 14, 39),
(65, 14, 40),
(66, 14, 41),
(67, 14, 42),
(68, 14, 43),
(69, 13, 44),
(70, 1, 45),
(71, 4, 46),
(72, 13, 47),
(73, 13, 48),
(74, 15, 49),
(75, 15, 50),
(76, 15, 51),
(77, 5, 52),
(78, 16, 53),
(79, 16, 54),
(80, 16, 55),
(81, 16, 56),
(82, 16, 57),
(83, 16, 58),
(84, 16, 59),
(85, 16, 60),
(86, 16, 61),
(87, 17, 62),
(88, 17, 63),
(90, 18, 65),
(91, 18, 66),
(92, 19, 67),
(93, 5, 68),
(94, 20, 69),
(95, 20, 70),
(96, 20, 71),
(97, 20, 72),
(98, 20, 73),
(99, 20, 74),
(100, 20, 75),
(101, 20, 76),
(102, 20, 77),
(103, 20, 78),
(104, 20, 79),
(105, 20, 80),
(106, 20, 81),
(107, 20, 82),
(108, 20, 83),
(109, 20, 84),
(110, 20, 85),
(111, 20, 86),
(112, 20, 87),
(113, 20, 88),
(114, 20, 89),
(115, 20, 90),
(116, 20, 91),
(117, 20, 92),
(118, 20, 93),
(119, 20, 94),
(120, 20, 95),
(121, 20, 96);

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(180, 85),
(180, 101),
(181, 85),
(181, 101),
(182, 85),
(182, 101),
(183, 85),
(183, 90),
(183, 100),
(184, 85),
(184, 90),
(184, 100),
(185, 85),
(185, 100),
(186, 85),
(186, 89),
(186, 100),
(187, 85),
(187, 87),
(187, 100),
(188, 85),
(188, 88),
(188, 100),
(189, 85),
(189, 86),
(189, 87),
(189, 100),
(190, 85),
(190, 89),
(190, 100),
(191, 85),
(191, 100),
(192, 85),
(192, 90),
(192, 100),
(193, 85),
(193, 100),
(194, 85),
(194, 100),
(195, 85),
(195, 86),
(195, 100),
(196, 86),
(196, 101),
(197, 87),
(197, 90),
(197, 92),
(198, 88),
(198, 101),
(199, 88),
(199, 101),
(200, 89),
(200, 101),
(201, 89),
(201, 101),
(202, 89),
(202, 101),
(203, 90),
(203, 101),
(204, 90),
(204, 101),
(205, 90),
(205, 101),
(206, 85),
(208, 92),
(209, 92),
(209, 97),
(210, 92),
(210, 97),
(211, 92),
(212, 92),
(212, 93),
(212, 102),
(213, 92),
(214, 92),
(215, 92),
(215, 95),
(216, 92),
(216, 95),
(217, 92),
(217, 95),
(218, 92),
(218, 95),
(219, 92),
(220, 92),
(221, 92),
(222, 92),
(223, 92),
(224, 92),
(225, 92),
(226, 92),
(227, 92),
(228, 94),
(229, 94),
(230, 96),
(231, 98),
(231, 100),
(232, 98),
(232, 100),
(233, 98),
(233, 100),
(234, 87),
(234, 101),
(235, 87),
(235, 101);

-- --------------------------------------------------------

--
-- Table structure for table `product_music_extra`
--

CREATE TABLE `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
`type_id` int(11) NOT NULL,
  `type_name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `type_handler` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES
(1, 'Product - General', 'product', 1, 'Y', '', '2016-03-02 13:03:32', '2016-03-02 13:03:32'),
(2, 'Product - Music', 'product_music', 1, 'Y', '', '2016-03-02 13:03:32', '2016-03-02 13:03:32'),
(3, 'Document - General', 'document_general', 3, 'N', '', '2016-03-02 13:03:32', '2016-03-02 13:03:32'),
(4, 'Document - Product', 'document_product', 3, 'Y', '', '2016-03-02 13:03:32', '2016-03-02 13:03:32'),
(5, 'Product - Free Shipping', 'product_free_shipping', 1, 'Y', '', '2016-03-02 13:03:32', '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_types_to_category`
--

CREATE TABLE `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `product_types_to_category`
--

INSERT INTO `product_types_to_category` (`product_type_id`, `category_id`) VALUES
(3, 63),
(4, 63),
(2, 62);

-- --------------------------------------------------------

--
-- Table structure for table `product_type_layout`
--

CREATE TABLE `product_type_layout` (
`configuration_id` int(11) NOT NULL,
  `configuration_title` text COLLATE latin1_general_ci NOT NULL,
  `configuration_key` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `configuration_value` text COLLATE latin1_general_ci NOT NULL,
  `configuration_description` text COLLATE latin1_general_ci NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text COLLATE latin1_general_ci,
  `set_function` text COLLATE latin1_general_ci
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `product_type_layout`
--

INSERT INTO `product_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Show Model Number', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 1, 1, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(2, 'Show Weight', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Display Weight on Product Info 0= off 1= on', 1, 2, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(3, 'Show Attribute Weight', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 1, 3, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(4, 'Show Manufacturer', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 1, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(5, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 1, 5, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(6, 'Show Quantity in Stock', 'SHOW_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 1, 6, '2016-03-11 02:37:43', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(7, 'Show Product Reviews Count', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 1, 7, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(8, 'Show Product Reviews Button', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 1, 8, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(9, 'Show Date Available', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 1, 9, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(10, 'Show Date Added', 'SHOW_PRODUCT_INFO_DATE_ADDED', '0', 'Display Date Added on Product Info 0= off 1= on', 1, 10, '2016-03-11 01:04:48', '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(11, 'Show Product URL', 'SHOW_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 1, 11, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(12, 'Show Product Additional Images', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 1, 13, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(13, 'Show Starting At text on Price', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 1, 12, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(14, 'Show Product Tell a Friend button', 'SHOW_PRODUCT_INFO_TELL_A_FRIEND', '1', 'Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on', 1, 15, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(15, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 1, 16, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(16, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 1, 100, NULL, '2016-03-02 13:03:32', '', ''),
(17, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 1, 101, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(18, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 1, 102, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(19, 'Show Model Number', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 2, 1, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(20, 'Show Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 2, 2, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(21, 'Show Attribute Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 2, 3, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(22, 'Show Artist', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Display Artists Name on Product Info 0= off 1= on', 2, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(23, 'Show Music Genre', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Display Music Genre on Product Info 0= off 1= on', 2, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(24, 'Show Record Company', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Display Record Company on Product Info 0= off 1= on', 2, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(25, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 2, 5, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(26, 'Show Quantity in Stock', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 2, 6, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(27, 'Show Product Reviews Count', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 2, 7, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(28, 'Show Product Reviews Button', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 2, 8, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(29, 'Show Date Available', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 2, 9, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(30, 'Show Date Added', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 2, 10, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(31, 'Show Starting At text on Price', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 2, 12, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(32, 'Show Product Additional Images', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 2, 13, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(33, 'Show Product Tell a Friend button', 'SHOW_PRODUCT_MUSIC_INFO_TELL_A_FRIEND', '1', 'Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on', 2, 15, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(34, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 2, 16, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(35, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 2, 100, NULL, '2016-03-02 13:03:32', '', ''),
(36, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 2, 101, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(37, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 2, 102, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(38, 'Show Product Reviews Count', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 3, 7, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(39, 'Show Product Reviews Button', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 3, 8, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(40, 'Show Date Available', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 3, 9, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(41, 'Show Date Added', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 3, 10, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(42, 'Show Product Tell a Friend button', 'SHOW_DOCUMENT_GENERAL_INFO_TELL_A_FRIEND', '1', 'Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on', 3, 15, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(43, 'Show Product URL', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 3, 11, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(44, 'Show Product Additional Images', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 3, 13, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(45, 'Show Model Number', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 4, 1, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(46, 'Show Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 4, 2, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(47, 'Show Attribute Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 4, 3, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(48, 'Show Manufacturer', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 4, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(49, 'Show Quantity in Shopping Cart', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 4, 5, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(50, 'Show Quantity in Stock', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 4, 6, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(51, 'Show Product Reviews Count', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 4, 7, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(52, 'Show Product Reviews Button', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 4, 8, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(53, 'Show Date Available', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 4, 9, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(54, 'Show Date Added', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 4, 10, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(55, 'Show Product URL', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 4, 11, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(56, 'Show Product Additional Images', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 4, 13, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(57, 'Show Starting At text on Price', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 4, 12, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(58, 'Show Product Tell a Friend button', 'SHOW_DOCUMENT_PRODUCT_INFO_TELL_A_FRIEND', '1', 'Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on', 4, 15, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(59, 'Product Free Shipping Image Status - Catalog', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 4, 16, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(60, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 4, 100, NULL, '2016-03-02 13:03:32', '', ''),
(61, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 4, 101, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(62, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 4, 102, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(63, 'Show Model Number', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 5, 1, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(64, 'Show Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 5, 2, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(65, 'Show Attribute Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 5, 3, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(66, 'Show Manufacturer', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 5, 4, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(67, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 5, 5, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(68, 'Show Quantity in Stock', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 5, 6, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(69, 'Show Product Reviews Count', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 5, 7, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(70, 'Show Product Reviews Button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 5, 8, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(71, 'Show Date Available', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Display Date Available on Product Info 0= off 1= on', 5, 9, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(72, 'Show Date Added', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 5, 10, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(73, 'Show Product URL', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 5, 11, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(74, 'Show Product Additional Images', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 5, 13, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(75, 'Show Starting At text on Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 5, 12, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(76, 'Show Product Tell a Friend button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_TELL_A_FRIEND', '1', 'Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on', 5, 15, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(77, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Show the Free Shipping image/text in the catalog?', 5, 16, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(78, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 5, 100, NULL, '2016-03-02 13:03:32', '', ''),
(79, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 5, 101, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(80, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 5, 102, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(81, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 1, 50, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(82, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 1, 51, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(83, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 1, 52, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(84, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 1, 53, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(85, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 1, 54, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(86, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 2, 50, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(87, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 2, 51, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(88, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 2, 52, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(89, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 2, 53, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(90, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 2, 54, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(91, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 3, 50, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(92, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 3, 51, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(93, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 3, 54, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(94, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 4, 50, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(95, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 4, 51, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(96, 'Show Metatags Title Default - Document Model', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Document Model in Meta Tags Title 0= off 1= on', 4, 52, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(97, 'Show Metatags Title Default - Document Price', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Document Price in Meta Tags Title 0= off 1= on', 4, 53, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(98, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 4, 54, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(99, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 5, 50, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(100, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 5, 51, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(101, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 5, 52, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(102, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 5, 53, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(103, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 5, 54, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(104, 'PRODUCT Attribute is Display Only - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 1, 200, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(105, 'PRODUCT Attribute is Free - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 1, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(106, 'PRODUCT Attribute is Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 1, 202, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(107, 'PRODUCT Attribute is Discounted - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 1, 203, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(108, 'PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 1, 204, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(109, 'PRODUCT Attribute is Required - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 1, 205, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(110, 'PRODUCT Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 1, 206, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(111, 'PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 1, 207, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(112, 'MUSIC Attribute is Display Only - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 2, 200, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(113, 'MUSIC Attribute is Free - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 2, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(114, 'MUSIC Attribute is Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 2, 202, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(115, 'MUSIC Attribute is Discounted - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 2, 203, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(116, 'MUSIC Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 2, 204, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(117, 'MUSIC Attribute is Required - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 2, 205, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(118, 'MUSIC Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 2, 206, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(119, 'MUSIC Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 2, 207, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(120, 'DOCUMENT GENERAL Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 3, 200, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(121, 'DOCUMENT GENERAL Attribute is Free - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 3, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(122, 'DOCUMENT GENERAL Attribute is Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 3, 202, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(123, 'DOCUMENT GENERAL Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 3, 203, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(124, 'DOCUMENT GENERAL Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 3, 204, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(125, 'DOCUMENT GENERAL Attribute is Required - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 3, 205, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(126, 'DOCUMENT GENERAL Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 3, 206, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(127, 'DOCUMENT GENERAL Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 3, 207, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(128, 'DOCUMENT PRODUCT Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 4, 200, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(129, 'DOCUMENT PRODUCT Attribute is Free - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 4, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(130, 'DOCUMENT PRODUCT Attribute is Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 4, 202, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(131, 'DOCUMENT PRODUCT Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 4, 203, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(132, 'DOCUMENT PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 4, 204, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(133, 'DOCUMENT PRODUCT Attribute is Required - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 4, 205, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(134, 'DOCUMENT PRODUCT Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 4, 206, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(135, 'DOCUMENT PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 4, 207, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(136, 'PRODUCT FREE SHIPPING Attribute is Display Only - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 5, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(137, 'PRODUCT FREE SHIPPING Attribute is Free - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 5, 201, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(138, 'PRODUCT FREE SHIPPING Attribute is Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 5, 202, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(139, 'PRODUCT FREE SHIPPING Attribute is Discounted - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 5, 203, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(140, 'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 5, 204, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(141, 'PRODUCT FREE SHIPPING Attribute is Required - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 5, 205, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(142, 'PRODUCT FREE SHIPPING Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 5, 206, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(143, 'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 5, 207, NULL, '2016-03-02 13:03:32', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), ');

-- --------------------------------------------------------

--
-- Table structure for table `project_version`
--

CREATE TABLE `project_version` (
`project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_major` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Database Version Tracking';

--
-- Dumping data for table `project_version`
--

INSERT INTO `project_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '3.9h', '', '', '', '', 'Fresh Installation', '2016-03-02 13:03:32'),
(2, 'Zen-Cart Database', '1', '3.9h', '', '', '', '', 'Fresh Installation', '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `project_version_history`
--

CREATE TABLE `project_version_history` (
`project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_major` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Database Version Tracking History';

--
-- Dumping data for table `project_version_history`
--

INSERT INTO `project_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '3.9h', '', 'Fresh Installation', '2016-03-02 13:03:32'),
(2, 'Zen-Cart Database', '1', '3.9h', '', 'Fresh Installation', '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `query_builder`
--

CREATE TABLE `query_builder` (
`query_id` int(11) NOT NULL,
  `query_category` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `query_name` varchar(80) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `query_description` text COLLATE latin1_general_ci NOT NULL,
  `query_string` text COLLATE latin1_general_ci NOT NULL,
  `query_keys_list` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Stores queries for re-use in Admin email and report modules';

--
-- Dumping data for table `query_builder`
--

INSERT INTO `query_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES
(1, 'email', 'All Customers', 'Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', ''),
(2, 'email,newsletters', 'All Newsletter Subscribers', 'Returns name and email address of newsletter subscribers', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = ''1''', ''),
(3, 'email,newsletters', 'Dormant Customers (>3months) (Subscribers)', 'Subscribers who HAVE purchased something, but have NOT purchased for at least three months.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', ''),
(4, 'email,newsletters', 'Active customers in past 3 months (Subscribers)', 'Newsletter subscribers who are also active customers (purchased something) in last 3 months.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = ''1'' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(5, 'email,newsletters', 'Active customers in past 3 months (Regardless of subscription status)', 'All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(6, 'email,newsletters', 'Administrator', 'Just the email account of the current administrator', 'select ''ADMIN'' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', ''),
(7, 'email,newsletters', 'Customers who have never completed a purchase', 'For sending newsletter to all customers who registered but have never completed a purchase', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- --------------------------------------------------------

--
-- Table structure for table `record_artists`
--

CREATE TABLE `record_artists` (
`artists_id` int(11) NOT NULL,
  `artists_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `artists_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `record_artists`
--

INSERT INTO `record_artists` (`artists_id`, `artists_name`, `artists_image`, `date_added`, `last_modified`) VALUES
(1, 'The Russ Tippins Band', 'sooty.jpg', '2004-06-01 20:53:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `record_artists_info`
--

CREATE TABLE `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `record_artists_info`
--

INSERT INTO `record_artists_info` (`artists_id`, `languages_id`, `artists_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'russtippinsband.users.btopenworld.com/', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `record_company`
--

CREATE TABLE `record_company` (
`record_company_id` int(11) NOT NULL,
  `record_company_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `record_company_image` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `record_company`
--

INSERT INTO `record_company` (`record_company_id`, `record_company_name`, `record_company_image`, `date_added`, `last_modified`) VALUES
(1, 'HMV Group', NULL, '2004-07-09 14:11:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `record_company_info`
--

CREATE TABLE `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `record_company_info`
--

INSERT INTO `record_company_info` (`record_company_id`, `languages_id`, `record_company_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'www.hmvgroup.com', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
`reviews_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salemaker_sales`
--

CREATE TABLE `salemaker_sales` (
`sale_id` int(11) NOT NULL,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text COLLATE latin1_general_ci,
  `sale_categories_all` text COLLATE latin1_general_ci,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sesskey` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('c69d5ae567dee2255415d5d80d5b5446', 1457983439, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774d545a6d4d32597a595755355a5441335a6a5669596a4d304d4751354e6d5a694d574e6a59574d794d794937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a747a5a57786c5933526c5a46396962336838637a6f784d7a6f69593239755a6d6c6e64584a6864476c7662694937614852746246396c5a476c3062334a6663484a6c5a6d56795a57356a5a56397a6447463064584e38637a6f304f694a4f54303546496a74685a473170626c39705a48787a4f6a4536496a45694f324e686447566e62334a705a584e6663484a765a48566a64484e666332397964463976636d526c636e787a4f6a4536496a41694f3252706333427359586c66593246305a576476636d6c6c6331396b636d39775a473933626e78704f6a41376347466e5a563970626d5a7666484d364e546b36496d463064484a70596e56305a5639775957646c5054456d63484a765a48566a64484e665a6d6c7364475679505449784d695a6a64584a795a57353058324e686447566e62334a3558326c6b50546b79496a74766348527062323566626d46745a584e66646d46736457567a58324e7663476c6c636e787a4f6a4536496a45694f773d3d),
('ade656f9290ad76be68bcf81bae5492d', 1457981240, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a694f4752695a54417a4e6a517a4d3259784e5451304d54686b5a5445324f54673159574a6a5a6a45774e5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a6b36496d7876593246736147397a644349375932467964456c4566484d364d446f69496a746a59584a30664538364d544936496e4e6f623342776157356e51324679644349364f447037637a6f344f694a6a623235305a5735306379493759546f774f6e7439637a6f314f694a30623352686243493761546f774f334d364e6a6f69643256705a326830496a74704f6a4137637a6f324f694a6a59584a30535551694f303437637a6f784d6a6f695932397564475675644639306558426c496a74694f6a4137637a6f784f446f695a6e4a6c5a56397a61476c7763476c755a31397064475674496a74704f6a4137637a6f794d446f695a6e4a6c5a56397a61476c7763476c755a3139335a576c6e614851694f326b364d44747a4f6a45354f694a6d636d566c58334e6f615842776157356e5833427961574e6c496a74704f6a413766573568646d6c6e5958527062323538547a6f784e7a6f69626d46326157646864476c76626b687063335276636e6b694f6a493665334d364e446f69634746306143493759546f794f6e74704f6a413759546f304f6e747a4f6a5136496e42685a3255694f334d364e546f696157356b5a5867694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a453665334d364e546f6959314268644767694f334d364d7a6f694d544179496a7439637a6f304f694a7762334e30496a74684f6a41366533313961546f784f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a493665334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4d36496a49784d694937637a6f314f694a6a5547463061434937637a6f7a4f6949784d4449694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f304f6e747a4f6a5136496e42685a3255694f334d364d544936496e427962325231593352666157356d62794937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d6a7037637a6f784d546f6963484a765a48566a64484e66615751694f334d364d7a6f694d6a4579496a747a4f6a5536496d4e515958526f496a747a4f6a4d36496a45774d69493766584d364e446f696347397a6443493759546f774f6e74396658316a6147566a61313932595778705a48787a4f6a5136496e5279645755694f327868626d64315957646c66484d364e7a6f695a57356e62476c7a61434937624746755a3356685a32567a58326c6b66484d364d546f694d534937624746755a3356685a32567a58324e765a475638637a6f794f694a6c6269493759335679636d567559336c38637a6f7a4f694a56553051694f3352765a47463558326c7a66484d364d544136496a49774d5459744d444d744d5451694f3356775a4746305a55563463476c79595852706232357a664749364d54746a5958526c5a32397965563930636d566c664538364d6a4936496e4e70625842735a56396a5958526c5a3239796157567a583352795a5755694f6a673665334d364d544d36496d4e686447566e62334a35583352795a5755694f3245364d6a413665326b364f44513759546f334f6e747a4f6a5136496d3568625755694f334d364f546f69553274706269424459584a6c496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d6a6f694f4451694f33317a4f6a6736496e4e31596c396a5958527a496a74684f6a593665326b364d44747a4f6a4936496a6731496a74704f6a4537637a6f794f6949344e69493761546f794f334d364d6a6f694f4463694f326b364d7a747a4f6a4936496a6734496a74704f6a5137637a6f794f6949344f53493761546f314f334d364d6a6f694f5441694f33317a4f6a4d36496e4e3159694937637a6f334f694a6f59584e6663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4936496a6730496a747a4f6a45794f694a6b5a5756775a584e3058324e6864484d694f3245364e6a703761546f774f334d364d6a6f694f4455694f326b364d54747a4f6a4936496a6732496a74704f6a4937637a6f794f6949344e79493761546f7a4f334d364d6a6f694f4467694f326b364e44747a4f6a4936496a6735496a74704f6a5537637a6f794f6949354d434937665831704f6a413759546f304f6e747a4f6a6736496e4e31596c396a5958527a496a74684f6a553665326b364d44747a4f6a4936496a6730496a74704f6a4537637a6f794f6949354d53493761546f794f334d364d6a6f694f5467694f326b364d7a747a4f6a4936496a6b35496a74704f6a5137637a6f7a4f6949784d4449694f33317a4f6a4d36496e4e3159694937637a6f334f694a6f59584e6663335669496a747a4f6a5536496d4e515958526f496a74704f6a4137637a6f784d6a6f695a47566c6347567a6446396a5958527a496a74684f6a45304f6e74704f6a4137637a6f794f6949344e53493761546f784f334d364d6a6f694f4459694f326b364d6a747a4f6a4936496a6733496a74704f6a4d37637a6f794f6949344f43493761546f304f334d364d6a6f694f446b694f326b364e54747a4f6a4936496a6b77496a74704f6a5937637a6f794f6949354d69493761546f334f334d364d6a6f694f544d694f326b364f44747a4f6a4936496a6b30496a74704f6a6b37637a6f794f6949354e53493761546f784d44747a4f6a4936496a6b32496a74704f6a45784f334d364d6a6f694f5463694f326b364d544937637a6f7a4f6949784d4441694f326b364d544d37637a6f7a4f6949784d4445694f33313961546f354d5474684f6a633665334d364e446f69626d46745a534937637a6f784e7a6f69553239735957646c49454e766247786c59335270623234694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a41694f334d364e446f69634746306143493759546f784f6e74704f6a4137637a6f794f6949354d53493766584d364f446f696333566958324e6864484d694f3245364e6a703761546f774f334d364d6a6f694f5449694f326b364d54747a4f6a4936496a6b7a496a74704f6a4937637a6f794f6949354e43493761546f7a4f334d364d6a6f694f5455694f326b364e44747a4f6a4936496a6b32496a74704f6a5537637a6f794f6949354e79493766584d364d7a6f6963335669496a747a4f6a6336496d68686331397a645749694f334d364e546f6959314268644767694f334d364d6a6f694f5445694f334d364d544936496d526c5a58426c63335266593246306379493759546f324f6e74704f6a4137637a6f794f6949354d69493761546f784f334d364d6a6f694f544d694f326b364d6a747a4f6a4936496a6b30496a74704f6a4d37637a6f794f6949354e53493761546f304f334d364d6a6f694f5459694f326b364e54747a4f6a4936496a6b33496a743966576b364f54673759546f314f6e747a4f6a5136496d3568625755694f334d364e7a6f69554756795a6e56745a534937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4936496a6b34496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4936496a6b34496a743961546f354f5474684f6a633665334d364e446f69626d46745a534937637a6f344f694a57615756334945467362434937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4936496a6b35496a7439637a6f344f694a7a64574a66593246306379493759546f794f6e74704f6a4137637a6f7a4f6949784d4441694f326b364d54747a4f6a4d36496a45774d53493766584d364d7a6f6963335669496a747a4f6a6336496d68686331397a645749694f334d364e546f6959314268644767694f334d364d6a6f694f546b694f334d364d544936496d526c5a58426c63335266593246306379493759546f794f6e74704f6a4137637a6f7a4f6949784d4441694f326b364d54747a4f6a4d36496a45774d534937665831704f6a45774d6a74684f6a553665334d364e446f69626d46745a534937637a6f784d446f6952326c6d6443424459584a6b63794937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4d36496a45774d69493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f7a4f6949784d4449694f3331704f6a67314f3245364e547037637a6f304f694a755957316c496a747a4f6a45774f694a42626e52704c55466e6157356e496a747a4f6a6b36496e4268636d5675644639705a434937637a6f794f6949344e434937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4936496a6730496a74704f6a4537637a6f794f6949344e53493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f314f6949344e4638344e53493766576b364f44593759546f314f6e747a4f6a5136496d3568625755694f334d364d544136496b56345a6d39736157467564484d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6730496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f4451694f326b364d54747a4f6a4936496a6732496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6730587a6732496a743961546f344e7a74684f6a553665334d364e446f69626d46745a534937637a6f354f694a4462475668626e4e6c636e4d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6730496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f4451694f326b364d54747a4f6a4936496a6733496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6730587a6733496a743961546f344f4474684f6a553665334d364e446f69626d46745a534937637a6f324f694a556232356c636e4d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6730496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f4451694f326b364d54747a4f6a4936496a6734496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6730587a6734496a743961546f344f5474684f6a553665334d364e446f69626d46745a534937637a6f324f694a545a584a3162584d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6730496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f4451694f326b364d54747a4f6a4936496a6735496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6730587a6735496a743961546f354d4474684f6a553665334d364e446f69626d46745a534937637a6f784d6a6f695457397063335231636d6c365a584a7a496a747a4f6a6b36496e4268636d5675644639705a434937637a6f794f6949344e434937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4936496a6730496a74704f6a4537637a6f794f6949354d43493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f314f6949344e4638354d43493766576b364f54493759546f314f6e747a4f6a5136496d3568625755694f334d364d544936496c4e766247466e5a53424861575a3063794937637a6f354f694a7759584a6c626e5266615751694f334d364d6a6f694f5445694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f794f6949354d53493761546f784f334d364d6a6f694f5449694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e546f694f5446664f5449694f3331704f6a6b7a4f3245364e547037637a6f304f694a755957316c496a747a4f6a45774f694a4861575a3049454e68636d527a496a747a4f6a6b36496e4268636d5675644639705a434937637a6f794f6949354d534937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4936496a6b78496a74704f6a4537637a6f794f6949354d79493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f314f6949354d5638354d79493766576b364f54513759546f314f6e747a4f6a5136496d3568625755694f334d364e546f69556d39695a584d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6b78496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f5445694f326b364d54747a4f6a4936496a6b30496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6b78587a6b30496a743961546f354e5474684f6a553665334d364e446f69626d46745a534937637a6f344f694a554c584e6f61584a3063794937637a6f354f694a7759584a6c626e5266615751694f334d364d6a6f694f5445694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f794f6949354d53493761546f784f334d364d6a6f694f5455694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e546f694f5446664f5455694f3331704f6a6b324f3245364e547037637a6f304f694a755957316c496a747a4f6a5136496b686864484d694f334d364f546f69634746795a57353058326c6b496a747a4f6a4936496a6b78496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d6a6f694f5445694f326b364d54747a4f6a4936496a6b32496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5536496a6b78587a6b32496a743961546f354e7a74684f6a553665334d364e446f69626d46745a534937637a6f304f694a4959576c79496a747a4f6a6b36496e4268636d5675644639705a434937637a6f794f6949354d534937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4936496a6b78496a74704f6a4537637a6f794f6949354e79493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f314f6949354d5638354e79493766576b364d5441774f3245364e547037637a6f304f694a755957316c496a747a4f6a49794f694a55636e566c49453568644856795a53424362335268626d6c6a5957787a496a747a4f6a6b36496e4268636d5675644639705a434937637a6f794f6949354f534937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4936496a6b35496a74704f6a4537637a6f7a4f6949784d4441694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e6a6f694f546c664d544177496a743961546f784d44453759546f314f6e747a4f6a5136496d3568625755694f334d364d544936496b39795a32467561574d67545746735a534937637a6f354f694a7759584a6c626e5266615751694f334d364d6a6f694f546b694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f794f6949354f53493761546f784f334d364d7a6f694d544178496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5936496a6b35587a45774d5349376658317a4f6a49784f694a706331396b5a5756775a584e3058324e6864484e66596e5670624851694f3249364d54747a4f6a45314f694a7759584a6c626e52666233426c626c3930595763694f334d364d446f69496a747a4f6a45324f694a7759584a6c626e526659327876633256666447466e496a747a4f6a413649694937637a6f784e446f6959326870624752666233426c626c3930595763694f334d364d446f69496a747a4f6a45314f694a6a61476c735a46396a6247397a5a563930595763694f334d364d446f69496a747a4f6a45774f694a6a64584a795a57353058326c6b496a747a4f6a4d36496a45774d694937637a6f784e6a6f695a58686a5a584230615739755957786662476c7a6443493759546f784f6e74704f6a4137637a6f7a4f6949784d4449694f3331396332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a4536496a45694f773d3d),
('217a03ead4749f1542a313864a860707', 1457981045, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774d545a6d4d32597a595755355a5441335a6a5669596a4d304d4751354e6d5a694d574e6a59574d794d794937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a747a5a57786c5933526c5a46396962336838637a6f784d7a6f69593239755a6d6c6e64584a6864476c7662694937614852746246396c5a476c3062334a6663484a6c5a6d56795a57356a5a56397a6447463064584e38637a6f304f694a4f54303546496a733d);

-- --------------------------------------------------------

--
-- Table structure for table `shift4_invoices`
--

CREATE TABLE `shift4_invoices` (
`shift4_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift4_log`
--

CREATE TABLE `shift4_log` (
`shift4_log_id` int(11) NOT NULL,
  `shift4_log_time` datetime NOT NULL,
  `shift4_log_customer_id` int(11) NOT NULL,
  `shift4_log_customer_name` varchar(35) NOT NULL,
  `shift4_log_order_id` int(11) DEFAULT NULL,
  `shift4_log_shift4_invoice` varchar(11) NOT NULL,
  `shift4_log_request_code` varchar(2) NOT NULL,
  `shift4_log_response_code` varchar(1) DEFAULT NULL,
  `shift4_log_error_indicator` varchar(1) NOT NULL,
  `shift4_log_error_text` varchar(100) DEFAULT NULL,
  `shift4_log_sent` text NOT NULL,
  `shift4_log_received` text NOT NULL,
  `shift4_log_session_id` varchar(128) NOT NULL,
  `shift4_log_transaction_time` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift4_timeout_log`
--

CREATE TABLE `shift4_timeout_log` (
`shift4_timeout_log_id` int(11) NOT NULL,
  `shift4_timeout_log_time` datetime NOT NULL,
  `shift4_timeout_log_customer_id` int(11) NOT NULL,
  `shift4_timeout_log_customer_name` varchar(50) NOT NULL,
  `shift4_timeout_log_invoice` varchar(11) NOT NULL,
  `shift4_timeout_log_request_code` varchar(2) NOT NULL,
  `shift4_timeout_log_session_id` varchar(128) NOT NULL,
  `shift4_timeout_log_notes` text NOT NULL,
  `shift4_timeout_log_amount` decimal(14,2) NOT NULL,
  `shift4_timeout_log_cardtype` varchar(32) NOT NULL,
  `shift4_timeout_log_cardnumber` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE `specials` (
`specials_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
`tax_class_id` int(11) NOT NULL,
  `tax_class_title` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included: non-food, services, etc', NULL, '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
`tax_rates_id` int(11) NOT NULL,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, 7.0000, 'FL TAX 7.0%', '2016-03-02 13:03:32', '2016-03-02 13:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `template_select`
--

CREATE TABLE `template_select` (
`template_id` int(11) NOT NULL,
  `template_dir` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `template_language` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `template_select`
--

INSERT INTO `template_select` (`template_id`, `template_dir`, `template_language`) VALUES
(1, 'winchester_responsive', '0');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_exceptions`
--

CREATE TABLE `upgrade_exceptions` (
`upgrade_exception_id` smallint(5) NOT NULL,
  `sql_file` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `reason` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usu_cache`
--

CREATE TABLE `usu_cache` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_language_id` tinyint(1) NOT NULL DEFAULT '0',
  `cache_name` varchar(255) NOT NULL DEFAULT '',
  `cache_data` mediumblob NOT NULL,
  `cache_global` tinyint(1) NOT NULL DEFAULT '1',
  `cache_gzip` tinyint(1) NOT NULL DEFAULT '1',
  `cache_method` varchar(20) NOT NULL DEFAULT 'RETURN',
  `cache_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cache_expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usu_cache`
--

INSERT INTO `usu_cache` (`cache_id`, `cache_language_id`, `cache_name`, `cache_data`, `cache_global`, `cache_gzip`, `cache_method`, `cache_date`, `cache_expires`) VALUES
('aa52eb591cb1f251d3bd144f4cc29025', 1, 'usu_v3_manufacturers', 0x25cc4d0e83400805e0bbb07761fda9e269c81495d4ce3448aa49d3bb17e2f27d8f07e1885fc17adab147789169396112bc398c0e92b4ec65b6b0e63a3a48336b40ebd020ccd7a4f334206c6511e3b406f54e1d42a25c72e4fbf5611756a580c1a16e1116ab241b2b25930f473346e3db958f8dcdaa37a527e903a6df1f, 1, 1, 'RETURN', '2016-03-14 19:21:10', '2016-04-13 19:21:10'),
('ad4baf75b1497c2576ac411a78ccec26', 1, 'usu_v3_ezpages', 0x55905d6e02310c84ef92774b18963f731a2b1bb21690ac1217b454bd7be34d5589d72f33e39930e140df4278a9742417de33c750dd4568db086ec831a4f002c34677460f8da6ac53281f6f43cf782c70977433b26fe464e2452749d1d0a1a1e6af1397301a38fedd6936f63e7f25357aeace2a1ae0c1b3a1b3090772739127fb055a03f1eb61dc74f53b24f05cd600b445d8ea44b92af85054aee259fb385cd761abe6557282f13976beebf562cef1deb36d15eec9bd2656900aff5ff4f30b, 1, 1, 'RETURN', '2016-03-14 19:21:10', '2016-04-13 19:21:10'),
('cc42973580bf9fff7bbed2323c1b5212', 1, 'usu_v3_categories', 0x4bb432b0aaae0500, 1, 1, 'RETURN', '2016-03-14 19:21:10', '2016-04-13 19:21:10'),
('e56cd0f958e0c4cbe40aa07499c079c3', 1, 'usu_v3_products', 0x9556db96a3380cfc9779f7395cd321f335020c78da588c6d4867f6ecbfaf849d4e42a737cc0b84a0d2ad4a32702acbd33fea941e939fee54a4a71f687b30aa112368299c344e79b5d02f0fd64b2bbc85456a7ae17ffc64584ab0fcb88119b474ff169311a6acb6a1664316cd6ca518959196f15327f2a4b6082dfd968db7f328e605e6a50e8e720e4e8ee8050505cfe01a3d3b05edc4048deac87f078d14a8740015fb4035b6971ba8e494cb97208f13ff411559aa810a97e0476962dd87d8e23de93a49c506d8dbbe841b2dc1102c808e0c7a9df0a85c4caee20a5f27273f3ad40abc32fd63c42ad9d722a3fac187f2c459f9415849ce30f4b9623995c7dd7d5e9407528b6836adae5862c50e92418369b896078d542cac43f2ba198bb497162ec20d9274de203d432f85e61a832756db61475bbff134ca56451d54ab060f7fc5d088c4ef3a52e0de83975584c566f81a454e1db563ac118911375b6a087b708d9dc3b455acc38c4a71a839b5788b220826acba22db4e36a21fd81736647a37dd1adc1070d5d3e5b32621299d4e19c64f43242c482e4bd69db55d3ed370f168666f15a9413452eb5983252f13287b9bab2c499f05a5925ad95d381c18aff043b574bf87b1b4f2b70dcc42bb0ab2e3b1d77ca11add354f9653f1f665b782908e36ac574c1fa1c73bcad49f2bb8784698348bb26858f0149532a6452dc570692d118f2620593045f91d1b83b435d330c0c28f729cb5fb84b24a5222d24be7c564b19d1b1fde30c559b25581c65bd8eaa94e28ce3821ae26291397955fa484a655ec27969ea61bb309aea6e3dc8a7715524a9991acd87aeb5547f4836d5db05a0f8bc397b4541f47a901d3527f482bbd0c88621fc2515f75409491ab47c4198927eb7ecfe8a8513d8a5abdd3e120697cf51c63ad6399ef47d2d807e05b54f123f025ec3aa9fb60b73cabc75eaf663d0d320bd84217acb2e451027756bf20709ba5718cee4d3aa5f97be10c7ca5d5e6a9bbbd9532e49c654f62fbf5328fb58ea2c998e7b4da5891d8470c42c88aa70a6eb0eb644c9f69cc362e344d5858763c2d57ed6587c79c68f32eeb3942479391fdb5d87575debafd6bf6bc92edbbf4b4d1fa60c38ca4c74f1b5ac268bdb058c7a4b8f3e9e3307cbeccb9e1e9ada601427a79faff9f0106ebcfed1f00eb762b5e00ce8871aaf27c4f804e236dfc00e0ee97c96629c5efa5ebd14073157827f181e8e9dbf11c8f8a2c2f9fedd2513596239956b6a4dadbfa5f0f9000fef73f, 1, 1, 'RETURN', '2016-03-14 19:21:10', '2016-04-13 19:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `session_id` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ip_address` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `time_entry` varchar(14) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `time_last_click` varchar(14) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `last_page_url` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `host_address` text COLLATE latin1_general_ci NOT NULL,
  `user_agent` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES
(0, '&yen;Guest', 'ade656f9290ad76be68bcf81bae5492d', '1', '1457976811', '1457979798', '/shop.solagecalistoga139h/gift-cards-c-102/solage-solage-gift-cards-p-212.html', 'localhost', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
`zone_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `zone_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(6, 223, 'AF', 'Armed Forces Africa'),
(7, 223, 'AA', 'Armed Forces Americas'),
(8, 223, 'AC', 'Armed Forces Canada'),
(9, 223, 'AE', 'Armed Forces Europe'),
(10, 223, 'AM', 'Armed Forces Middle East'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 163, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NL', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden Würtemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niedersterreich'),
(97, 14, 'OO', 'Obersterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubnden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zrich'),
(130, 195, 'A Corua', 'A Corua'),
(131, 195, 'Alava', 'Alava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almeria', 'Almeria'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Avila', 'Avila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Caceres', 'Caceres'),
(142, 195, 'Cadiz', 'Cadiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellon', 'Castellon'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Cordoba', 'Cordoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipuzcoa', 'Guipuzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaen', 'Jaen'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'Leon', 'Leon'),
(159, 195, 'Lleida', 'Lleida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Malaga', 'Malaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza'),
(182, 13, 'ACT', 'Australian Capital Territory'),
(183, 13, 'NSW', 'New South Wales'),
(184, 13, 'NT', 'Northern Territory'),
(185, 13, 'QLD', 'Queensland'),
(186, 13, 'SA', 'South Australia'),
(187, 13, 'TAS', 'Tasmania'),
(188, 13, 'VIC', 'Victoria'),
(189, 13, 'WA', 'Western Australia');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

CREATE TABLE `zones_to_geo_zones` (
`association_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2016-03-02 13:03:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_book`
--
ALTER TABLE `address_book`
 ADD PRIMARY KEY (`address_book_id`), ADD KEY `idx_address_book_customers_id_zen` (`customers_id`);

--
-- Indexes for table `address_format`
--
ALTER TABLE `address_format`
 ADD PRIMARY KEY (`address_format_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`admin_id`), ADD KEY `idx_admin_name_zen` (`admin_name`), ADD KEY `idx_admin_email_zen` (`admin_email`);

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
 ADD PRIMARY KEY (`log_id`), ADD KEY `idx_page_accessed_zen` (`page_accessed`), ADD KEY `idx_access_date_zen` (`access_date`), ADD KEY `idx_ip_zen` (`ip_address`);

--
-- Indexes for table `authorizenet`
--
ALTER TABLE `authorizenet`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
 ADD PRIMARY KEY (`banners_id`), ADD KEY `idx_status_group_zen` (`status`,`banners_group`), ADD KEY `idx_expires_date_zen` (`expires_date`), ADD KEY `idx_date_scheduled_zen` (`date_scheduled`);

--
-- Indexes for table `banners_history`
--
ALTER TABLE `banners_history`
 ADD PRIMARY KEY (`banners_history_id`), ADD KEY `idx_banners_id_zen` (`banners_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`categories_id`), ADD KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`), ADD KEY `idx_status_zen` (`categories_status`), ADD KEY `idx_sort_order_zen` (`sort_order`);

--
-- Indexes for table `categories_description`
--
ALTER TABLE `categories_description`
 ADD PRIMARY KEY (`categories_id`,`language_id`), ADD KEY `idx_categories_name_zen` (`categories_name`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
 ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_cfg_grp_id_zen` (`configuration_group_id`);

--
-- Indexes for table `configuration_group`
--
ALTER TABLE `configuration_group`
 ADD PRIMARY KEY (`configuration_group_id`), ADD KEY `idx_visible_zen` (`visible`);

--
-- Indexes for table `counter_history`
--
ALTER TABLE `counter_history`
 ADD PRIMARY KEY (`startdate`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`countries_id`), ADD KEY `idx_countries_name_zen` (`countries_name`), ADD KEY `idx_address_format_id_zen` (`address_format_id`), ADD KEY `idx_iso_2_zen` (`countries_iso_code_2`), ADD KEY `idx_iso_3_zen` (`countries_iso_code_3`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
 ADD PRIMARY KEY (`coupon_id`), ADD KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`), ADD KEY `idx_coupon_code_zen` (`coupon_code`), ADD KEY `idx_coupon_type_zen` (`coupon_type`);

--
-- Indexes for table `coupons_description`
--
ALTER TABLE `coupons_description`
 ADD PRIMARY KEY (`coupon_id`,`language_id`);

--
-- Indexes for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
 ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_gv_customer`
--
ALTER TABLE `coupon_gv_customer`
 ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
 ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`), ADD KEY `idx_release_flag_zen` (`release_flag`);

--
-- Indexes for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
 ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
 ADD PRIMARY KEY (`restrict_id`), ADD KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
 ADD PRIMARY KEY (`currencies_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`customers_id`), ADD KEY `idx_email_address_zen` (`customers_email_address`), ADD KEY `idx_referral_zen` (`customers_referral`(10)), ADD KEY `idx_grp_pricing_zen` (`customers_group_pricing`), ADD KEY `idx_nick_zen` (`customers_nick`), ADD KEY `idx_newsletter_zen` (`customers_newsletter`);

--
-- Indexes for table `customers_basket`
--
ALTER TABLE `customers_basket`
 ADD PRIMARY KEY (`customers_basket_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
 ADD PRIMARY KEY (`customers_basket_attributes_id`), ADD KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36));

--
-- Indexes for table `customers_info`
--
ALTER TABLE `customers_info`
 ADD PRIMARY KEY (`customers_info_id`);

--
-- Indexes for table `db_cache`
--
ALTER TABLE `db_cache`
 ADD PRIMARY KEY (`cache_entry_name`);

--
-- Indexes for table `email_archive`
--
ALTER TABLE `email_archive`
 ADD PRIMARY KEY (`archive_id`), ADD KEY `idx_email_to_address_zen` (`email_to_address`), ADD KEY `idx_module_zen` (`module`);

--
-- Indexes for table `ezpages`
--
ALTER TABLE `ezpages`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `idx_lang_id_zen` (`languages_id`), ADD KEY `idx_ezp_status_header_zen` (`status_header`), ADD KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`), ADD KEY `idx_ezp_status_footer_zen` (`status_footer`), ADD KEY `idx_ezp_status_toc_zen` (`status_toc`);

--
-- Indexes for table `featured`
--
ALTER TABLE `featured`
 ADD PRIMARY KEY (`featured_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`featured_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
 ADD PRIMARY KEY (`files_uploaded_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `flexible_footer_menu`
--
ALTER TABLE `flexible_footer_menu`
 ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `geo_zones`
--
ALTER TABLE `geo_zones`
 ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `get_terms_to_filter`
--
ALTER TABLE `get_terms_to_filter`
 ADD PRIMARY KEY (`get_term_name`);

--
-- Indexes for table `group_pricing`
--
ALTER TABLE `group_pricing`
 ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`languages_id`), ADD KEY `idx_languages_name_zen` (`name`);

--
-- Indexes for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
 ADD PRIMARY KEY (`layout_id`), ADD KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`), ADD KEY `idx_layout_box_status_zen` (`layout_box_status`), ADD KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
 ADD PRIMARY KEY (`manufacturers_id`), ADD KEY `idx_mfg_name_zen` (`manufacturers_name`);

--
-- Indexes for table `manufacturers_info`
--
ALTER TABLE `manufacturers_info`
 ADD PRIMARY KEY (`manufacturers_id`,`languages_id`);

--
-- Indexes for table `media_clips`
--
ALTER TABLE `media_clips`
 ADD PRIMARY KEY (`clip_id`), ADD KEY `idx_media_id_zen` (`media_id`), ADD KEY `idx_clip_type_zen` (`clip_type`);

--
-- Indexes for table `media_manager`
--
ALTER TABLE `media_manager`
 ADD PRIMARY KEY (`media_id`), ADD KEY `idx_media_name_zen` (`media_name`);

--
-- Indexes for table `media_to_products`
--
ALTER TABLE `media_to_products`
 ADD KEY `idx_media_product_zen` (`media_id`,`product_id`);

--
-- Indexes for table `media_types`
--
ALTER TABLE `media_types`
 ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_name_zen` (`type_name`);

--
-- Indexes for table `meta_tags_categories_description`
--
ALTER TABLE `meta_tags_categories_description`
 ADD PRIMARY KEY (`categories_id`,`language_id`);

--
-- Indexes for table `meta_tags_products_description`
--
ALTER TABLE `meta_tags_products_description`
 ADD PRIMARY KEY (`products_id`,`language_id`);

--
-- Indexes for table `music_genre`
--
ALTER TABLE `music_genre`
 ADD PRIMARY KEY (`music_genre_id`), ADD KEY `idx_music_genre_name_zen` (`music_genre_name`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
 ADD PRIMARY KEY (`newsletters_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`orders_id`), ADD KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`), ADD KEY `idx_date_purchased_zen` (`date_purchased`), ADD KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
 ADD PRIMARY KEY (`orders_products_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`), ADD KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`);

--
-- Indexes for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
 ADD PRIMARY KEY (`orders_products_attributes_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`);

--
-- Indexes for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
 ADD PRIMARY KEY (`orders_products_download_id`), ADD KEY `idx_orders_id_zen` (`orders_id`), ADD KEY `idx_orders_products_id_zen` (`orders_products_id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
 ADD PRIMARY KEY (`orders_status_id`,`language_id`), ADD KEY `idx_orders_status_name_zen` (`orders_status_name`);

--
-- Indexes for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
 ADD PRIMARY KEY (`orders_status_history_id`), ADD KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`);

--
-- Indexes for table `orders_total`
--
ALTER TABLE `orders_total`
 ADD PRIMARY KEY (`orders_total_id`), ADD KEY `idx_ot_orders_id_zen` (`orders_id`), ADD KEY `idx_ot_class_zen` (`class`);

--
-- Indexes for table `paypal`
--
ALTER TABLE `paypal`
 ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
 ADD PRIMARY KEY (`payment_status_id`);

--
-- Indexes for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
 ADD PRIMARY KEY (`payment_status_history_id`), ADD KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`);

--
-- Indexes for table `paypal_session`
--
ALTER TABLE `paypal_session`
 ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_session_id_zen` (`session_id`(36));

--
-- Indexes for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
 ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`products_id`), ADD KEY `idx_products_date_added_zen` (`products_date_added`), ADD KEY `idx_products_status_zen` (`products_status`), ADD KEY `idx_products_date_available_zen` (`products_date_available`), ADD KEY `idx_products_ordered_zen` (`products_ordered`), ADD KEY `idx_products_model_zen` (`products_model`), ADD KEY `idx_products_price_sorter_zen` (`products_price_sorter`), ADD KEY `idx_master_categories_id_zen` (`master_categories_id`), ADD KEY `idx_products_sort_order_zen` (`products_sort_order`), ADD KEY `idx_manufacturers_id_zen` (`manufacturers_id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
 ADD PRIMARY KEY (`products_attributes_id`), ADD KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`), ADD KEY `idx_opt_sort_order_zen` (`products_options_sort_order`);

--
-- Indexes for table `products_attributes_download`
--
ALTER TABLE `products_attributes_download`
 ADD PRIMARY KEY (`products_attributes_id`);

--
-- Indexes for table `products_description`
--
ALTER TABLE `products_description`
 ADD PRIMARY KEY (`products_id`,`language_id`), ADD KEY `idx_products_name_zen` (`products_name`);

--
-- Indexes for table `products_discount_quantity`
--
ALTER TABLE `products_discount_quantity`
 ADD KEY `idx_id_qty_zen` (`products_id`,`discount_qty`);

--
-- Indexes for table `products_notifications`
--
ALTER TABLE `products_notifications`
 ADD PRIMARY KEY (`products_id`,`customers_id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
 ADD PRIMARY KEY (`products_options_id`,`language_id`), ADD KEY `idx_lang_id_zen` (`language_id`), ADD KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`), ADD KEY `idx_products_options_name_zen` (`products_options_name`);

--
-- Indexes for table `products_options_types`
--
ALTER TABLE `products_options_types`
 ADD PRIMARY KEY (`products_options_types_id`);

--
-- Indexes for table `products_options_values`
--
ALTER TABLE `products_options_values`
 ADD PRIMARY KEY (`products_options_values_id`,`language_id`), ADD KEY `idx_products_options_values_name_zen` (`products_options_values_name`), ADD KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`);

--
-- Indexes for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
 ADD PRIMARY KEY (`products_options_values_to_products_options_id`), ADD KEY `idx_products_options_id_zen` (`products_options_id`), ADD KEY `idx_products_options_values_id_zen` (`products_options_values_id`);

--
-- Indexes for table `products_to_categories`
--
ALTER TABLE `products_to_categories`
 ADD PRIMARY KEY (`products_id`,`categories_id`), ADD KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`);

--
-- Indexes for table `product_music_extra`
--
ALTER TABLE `product_music_extra`
 ADD PRIMARY KEY (`products_id`), ADD KEY `idx_music_genre_id_zen` (`music_genre_id`), ADD KEY `idx_artists_id_zen` (`artists_id`), ADD KEY `idx_record_company_id_zen` (`record_company_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
 ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_master_type_zen` (`type_master_type`);

--
-- Indexes for table `product_types_to_category`
--
ALTER TABLE `product_types_to_category`
 ADD KEY `idx_category_id_zen` (`category_id`), ADD KEY `idx_product_type_id_zen` (`product_type_id`);

--
-- Indexes for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
 ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`);

--
-- Indexes for table `project_version`
--
ALTER TABLE `project_version`
 ADD PRIMARY KEY (`project_version_id`), ADD UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`);

--
-- Indexes for table `project_version_history`
--
ALTER TABLE `project_version_history`
 ADD PRIMARY KEY (`project_version_id`);

--
-- Indexes for table `query_builder`
--
ALTER TABLE `query_builder`
 ADD PRIMARY KEY (`query_id`), ADD UNIQUE KEY `query_name` (`query_name`);

--
-- Indexes for table `record_artists`
--
ALTER TABLE `record_artists`
 ADD PRIMARY KEY (`artists_id`), ADD KEY `idx_rec_artists_name_zen` (`artists_name`);

--
-- Indexes for table `record_artists_info`
--
ALTER TABLE `record_artists_info`
 ADD PRIMARY KEY (`artists_id`,`languages_id`);

--
-- Indexes for table `record_company`
--
ALTER TABLE `record_company`
 ADD PRIMARY KEY (`record_company_id`), ADD KEY `idx_rec_company_name_zen` (`record_company_name`);

--
-- Indexes for table `record_company_info`
--
ALTER TABLE `record_company_info`
 ADD PRIMARY KEY (`record_company_id`,`languages_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
 ADD PRIMARY KEY (`reviews_id`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_customers_id_zen` (`customers_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_date_added_zen` (`date_added`);

--
-- Indexes for table `reviews_description`
--
ALTER TABLE `reviews_description`
 ADD PRIMARY KEY (`reviews_id`,`languages_id`);

--
-- Indexes for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
 ADD PRIMARY KEY (`sale_id`), ADD KEY `idx_sale_status_zen` (`sale_status`), ADD KEY `idx_sale_date_start_zen` (`sale_date_start`), ADD KEY `idx_sale_date_end_zen` (`sale_date_end`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`sesskey`);

--
-- Indexes for table `shift4_invoices`
--
ALTER TABLE `shift4_invoices`
 ADD PRIMARY KEY (`shift4_id`);

--
-- Indexes for table `shift4_log`
--
ALTER TABLE `shift4_log`
 ADD PRIMARY KEY (`shift4_log_id`);

--
-- Indexes for table `shift4_timeout_log`
--
ALTER TABLE `shift4_timeout_log`
 ADD PRIMARY KEY (`shift4_timeout_log_id`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
 ADD PRIMARY KEY (`specials_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`specials_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
 ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
 ADD PRIMARY KEY (`tax_rates_id`), ADD KEY `idx_tax_zone_id_zen` (`tax_zone_id`), ADD KEY `idx_tax_class_id_zen` (`tax_class_id`);

--
-- Indexes for table `template_select`
--
ALTER TABLE `template_select`
 ADD PRIMARY KEY (`template_id`), ADD KEY `idx_tpl_lang_zen` (`template_language`);

--
-- Indexes for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
 ADD PRIMARY KEY (`upgrade_exception_id`);

--
-- Indexes for table `usu_cache`
--
ALTER TABLE `usu_cache`
 ADD PRIMARY KEY (`cache_id`,`cache_language_id`), ADD KEY `cache_id` (`cache_id`), ADD KEY `cache_language_id` (`cache_language_id`), ADD KEY `cache_global` (`cache_global`);

--
-- Indexes for table `whos_online`
--
ALTER TABLE `whos_online`
 ADD KEY `idx_ip_address_zen` (`ip_address`), ADD KEY `idx_session_id_zen` (`session_id`), ADD KEY `idx_customer_id_zen` (`customer_id`), ADD KEY `idx_time_entry_zen` (`time_entry`), ADD KEY `idx_time_last_click_zen` (`time_last_click`), ADD KEY `idx_last_page_url_zen` (`last_page_url`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
 ADD PRIMARY KEY (`zone_id`), ADD KEY `idx_zone_country_id_zen` (`zone_country_id`), ADD KEY `idx_zone_code_zen` (`zone_code`);

--
-- Indexes for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
 ADD PRIMARY KEY (`association_id`), ADD KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_book`
--
ALTER TABLE `address_book`
MODIFY `address_book_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `address_format`
--
ALTER TABLE `address_format`
MODIFY `address_format_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
MODIFY `log_id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2317;
--
-- AUTO_INCREMENT for table `authorizenet`
--
ALTER TABLE `authorizenet`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
MODIFY `banners_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `banners_history`
--
ALTER TABLE `banners_history`
MODIFY `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=626;
--
-- AUTO_INCREMENT for table `configuration_group`
--
ALTER TABLE `configuration_group`
MODIFY `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `countries_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
MODIFY `unique_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
MODIFY `restrict_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
MODIFY `currencies_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `customers_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customers_basket`
--
ALTER TABLE `customers_basket`
MODIFY `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
MODIFY `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `email_archive`
--
ALTER TABLE `email_archive`
MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ezpages`
--
ALTER TABLE `ezpages`
MODIFY `pages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `featured`
--
ALTER TABLE `featured`
MODIFY `featured_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
MODIFY `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flexible_footer_menu`
--
ALTER TABLE `flexible_footer_menu`
MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `geo_zones`
--
ALTER TABLE `geo_zones`
MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_pricing`
--
ALTER TABLE `group_pricing`
MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `languages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
MODIFY `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `media_clips`
--
ALTER TABLE `media_clips`
MODIFY `clip_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `media_manager`
--
ALTER TABLE `media_manager`
MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `media_types`
--
ALTER TABLE `media_types`
MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `music_genre`
--
ALTER TABLE `music_genre`
MODIFY `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
MODIFY `newsletters_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
MODIFY `orders_products_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
MODIFY `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
MODIFY `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
MODIFY `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_total`
--
ALTER TABLE `orders_total`
MODIFY `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal`
--
ALTER TABLE `paypal`
MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
MODIFY `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
MODIFY `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_session`
--
ALTER TABLE `paypal_session`
MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=236;
--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
MODIFY `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1171;
--
-- AUTO_INCREMENT for table `products_description`
--
ALTER TABLE `products_description`
MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=236;
--
-- AUTO_INCREMENT for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
MODIFY `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `project_version`
--
ALTER TABLE `project_version`
MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_version_history`
--
ALTER TABLE `project_version_history`
MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `query_builder`
--
ALTER TABLE `query_builder`
MODIFY `query_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `record_artists`
--
ALTER TABLE `record_artists`
MODIFY `artists_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `record_company`
--
ALTER TABLE `record_company`
MODIFY `record_company_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `shift4_invoices`
--
ALTER TABLE `shift4_invoices`
MODIFY `shift4_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shift4_log`
--
ALTER TABLE `shift4_log`
MODIFY `shift4_log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shift4_timeout_log`
--
ALTER TABLE `shift4_timeout_log`
MODIFY `shift4_timeout_log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
MODIFY `specials_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
MODIFY `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `template_select`
--
ALTER TABLE `template_select`
MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
MODIFY `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
