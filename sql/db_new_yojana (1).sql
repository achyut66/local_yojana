-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2022 at 11:56 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_new_yojana`
--

-- --------------------------------------------------------

--
-- Table structure for table `abstract_cost`
--

CREATE TABLE `abstract_cost` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `quantity` varchar(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL,
  `rate` varchar(11) NOT NULL DEFAULT '0',
  `total` varchar(11) NOT NULL DEFAULT '0',
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abstract_cost`
--

INSERT INTO `abstract_cost` (`id`, `name`, `quantity`, `unit_id`, `rate`, `total`, `plan_id`) VALUES
(41, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 1),
(42, 'Stone soling work', '30', 2, '100', '3000', 1),
(43, 'P.C.C.work', '10', 6, '200', '2000', 1),
(44, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 1),
(45, 'Side Formwork', '10', 6, '100', '1000', 1),
(46, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 2),
(47, 'Stone soling work', '30', 2, '100', '3000', 2),
(48, 'P.C.C.work', '10', 6, '200', '2000', 2),
(49, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 2),
(50, 'Side Formwork', '40', 6, '100', '4000', 2),
(56, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 56),
(57, 'Stone soling work', '30', 2, '100', '3000', 56),
(58, 'P.C.C.work', '10', 6, '200', '2000', 56),
(59, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 56),
(60, 'Side Formwork', '40', 6, '100', '4000', 56),
(66, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 96),
(67, 'Stone soling work', '30', 2, '100', '3000', 96),
(68, 'P.C.C.work', '10', 6, '200', '2000', 96),
(69, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 96),
(70, 'Side Formwork', '40', 6, '100', '4000', 96),
(76, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 98),
(77, 'Stone soling work', '30', 2, '100', '3000', 98),
(78, 'P.C.C.work', '10', 6, '200', '2000', 98),
(79, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 98),
(80, 'Side Formwork', '40', 6, '100', '4000', 98),
(86, 'Earthwork in excavation for drain foundation', '10', 1, '500', '5000', 88),
(87, 'Stone soling work', '30', 2, '100', '3000', 88),
(88, 'P.C.C.work', '10', 6, '200', '2000', 88),
(89, 'REINFORCEMENT DETAIILS', '20', 6, '300', '6000', 88),
(90, 'Side Formwork', '40', 6, '100', '4000', 88);

-- --------------------------------------------------------

--
-- Table structure for table `abstract_cost_image`
--

CREATE TABLE `abstract_cost_image` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abstract_cost_image`
--

INSERT INTO `abstract_cost_image` (`id`, `title`, `image`, `plan_id`) VALUES
(6, 'University Physics', 'abstract_images/6155f6c30123c.png', 1),
(7, 'cost estimate', 'abstract_images/615b72300d80e.png', 56),
(8, 'bcvbcvbvc', 'abstract_images/615b724522d58.png', 56),
(9, 'trytytr', 'abstract_images/615b7253166ba.png', 56),
(10, 'cost estimate', 'abstract_images/615b7c6936a73.png', 98);

-- --------------------------------------------------------

--
-- Table structure for table `abstract_profile`
--

CREATE TABLE `abstract_profile` (
  `id` int(11) NOT NULL,
  `sub_total` varchar(11) NOT NULL DEFAULT '0',
  `date_nepali` varchar(255) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `in_review` int(1) NOT NULL DEFAULT 0,
  `approved` int(1) NOT NULL DEFAULT 0,
  `version` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abstract_profile`
--

INSERT INTO `abstract_profile` (`id`, `sub_total`, `date_nepali`, `plan_id`, `in_review`, `approved`, `version`) VALUES
(3, '17000', '2078-06-14', 1, 0, 1, NULL),
(4, '20000', '2078-05-03', 2, 0, 0, NULL),
(5, '20000', '2078-06-18', 56, 0, 1, NULL),
(6, '20000', '2078-06-18', 96, 0, 1, NULL),
(7, '20000', '2078-06-18', 98, 1, 0, NULL),
(8, '20000', '2078-06-19', 88, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amanat_lagat`
--

CREATE TABLE `amanat_lagat` (
  `id` int(11) NOT NULL,
  `agreement_gauplaika` varchar(255) DEFAULT NULL,
  `agreement_other` varchar(255) DEFAULT NULL,
  `costumer_agreement` varchar(255) DEFAULT NULL,
  `other_agreement` varchar(255) DEFAULT NULL,
  `bhuktani_anudan` varchar(255) DEFAULT NULL,
  `costumer_investment` varchar(255) DEFAULT NULL,
  `total_investment` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_total` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `marmat_new` float DEFAULT NULL,
  `marmat_old` float DEFAULT NULL,
  `bipat_new` float DEFAULT NULL,
  `b_pat` float DEFAULT NULL,
  `sajhedari_per` float DEFAULT NULL,
  `janashramdan` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amanat_lagat`
--

INSERT INTO `amanat_lagat` (`id`, `agreement_gauplaika`, `agreement_other`, `costumer_agreement`, `other_agreement`, `bhuktani_anudan`, `costumer_investment`, `total_investment`, `plan_id`, `unit_id`, `unit_total`, `created_date`, `marmat_new`, `marmat_old`, `bipat_new`, `b_pat`, `sajhedari_per`, `janashramdan`) VALUES
(9, '500000', '0', '0', '0', '485000', '100000', '585000.0000', 65, 0, '', '2021-09-16', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '100000', '0', '0', '0', '100000', '20000', '120000.0000', 56, 0, '', '2021-09-21', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2000000', '0', '0', '0', '2000000', '100000', '2100000.0000', 4, 0, '', '2021-09-30', NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2000000', '0', '0', '0', '1940000', '100000', '2040000.0000', 2, 0, '', '2021-12-12', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amanat_more_details`
--

CREATE TABLE `amanat_more_details` (
  `id` int(11) NOT NULL,
  `organizer_name` text DEFAULT NULL,
  `place_to_organize` text DEFAULT NULL,
  `yojana_start_date` varchar(50) DEFAULT NULL,
  `yojana_start_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date` varchar(50) DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `pariwar_population` int(11) NOT NULL,
  `male` int(11) NOT NULL,
  `female` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `chalani_no` varchar(255) DEFAULT NULL,
  `organizer_name_address` varchar(255) DEFAULT NULL,
  `organizer_name_post` varchar(255) DEFAULT NULL,
  `aadesh_per_post` varchar(255) DEFAULT NULL,
  `yojana_samjhauta_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amanat_more_details`
--

INSERT INTO `amanat_more_details` (`id`, `organizer_name`, `place_to_organize`, `yojana_start_date`, `yojana_start_date_english`, `yojana_sakine_date`, `yojana_sakine_date_english`, `pariwar_population`, `male`, `female`, `total`, `plan_id`, `chalani_no`, `organizer_name_address`, `organizer_name_post`, `aadesh_per_post`, `yojana_samjhauta_date`) VALUES
(1, 'सागर लम्साल ', 'नागार्जुन १०', '2078-05-01', '2021-8-17', '2078-05-31', '2021-9-16', 10, 10, 20, 30, 2, '102302', 'dhading', 'executive officer', 'श्रीमान् नगर प्रमुखज्यू', '2078-08-02'),
(4, 'अनुराग बस्याल', 'तरकेश्वोर', '2078-05-31', '2021-9-16', '2078-06-06', '2021-9-22', 10, 10, 10, 20, 65, '205', 'हेटौंडा-१९', 'शहरी स्वास्थ्य केन्द्र ईन्चार्ज', 'श्रीमान् नगर प्रमुखज्यू', '2078-05-31'),
(6, 'A5dGewAHlg', '8mMhwGqsjY', '8WVVAgPPbi', '--', '1EppB55ZIF', '--', 0, 0, 0, 0, 4, 'MnWksnkCj8', 'p8fMWgoO6w', 'MxvedGXgkS', 'श्रीमान् नगर प्रमुखज्यू', 'slTwozt8FB');

-- --------------------------------------------------------

--
-- Table structure for table `analysis_based_withdraw`
--

CREATE TABLE `analysis_based_withdraw` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` tinyint(1) NOT NULL,
  `get_qty` int(11) NOT NULL,
  `get_unit_id` int(11) NOT NULL,
  `evaluated_date` varchar(10) DEFAULT NULL,
  `evaluated_date_english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluated_amount` varchar(15) DEFAULT NULL,
  `payable_amount` varchar(15) DEFAULT NULL,
  `advance_payment` varchar(15) DEFAULT NULL,
  `contengency_amount` varchar(15) DEFAULT NULL,
  `renovate_amount` varchar(15) DEFAULT NULL,
  `due_amount` varchar(15) DEFAULT NULL,
  `disaster_management_amount` varchar(15) DEFAULT NULL,
  `total_amount_deducted` varchar(15) DEFAULT NULL,
  `total_paid_amount` varchar(15) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dpr_amount` double(15,2) NOT NULL,
  `aanya_nikaya` double(15,2) NOT NULL,
  `aanya_sajhedari` double(15,2) NOT NULL,
  `nagad_sajhedari` double(15,2) NOT NULL,
  `local_gov` double(15,2) NOT NULL,
  `janshramdan` double(15,2) NOT NULL,
  `khud_evaluated_amount` double(15,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `analysis_based_withdraw`
--

INSERT INTO `analysis_based_withdraw` (`id`, `payment_evaluation_count`, `get_qty`, `get_unit_id`, `evaluated_date`, `evaluated_date_english`, `evaluated_amount`, `payable_amount`, `advance_payment`, `contengency_amount`, `renovate_amount`, `due_amount`, `disaster_management_amount`, `total_amount_deducted`, `total_paid_amount`, `plan_id`, `created_date`, `created_date_english`, `dpr_amount`, `aanya_nikaya`, `aanya_sajhedari`, `nagad_sajhedari`, `local_gov`, `janshramdan`, `khud_evaluated_amount`) VALUES
(16, 1, 0, 0, '2078-09-29', '2022-1-13', '1000000', '950980.39', '80000', '29411.77', '', '', '', '250', '851122.55', 2, '2078-9-29', '2022-1-13', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `anugaman_detail_patra`
--

CREATE TABLE `anugaman_detail_patra` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `thek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anugaman` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prabidhik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hording` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khata` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `samuday` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kista` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bhautik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `udeshya` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `samasya` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prayas` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sujhab` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sujhab1` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `anugaman_detail_patra`
--

INSERT INTO `anugaman_detail_patra` (`id`, `plan_id`, `thek`, `anugaman`, `prabidhik`, `hording`, `khata`, `samuday`, `kista`, `bhautik`, `udeshya`, `samasya`, `prayas`, `sujhab`, `sujhab1`) VALUES
(1, 1, 'rewrwerewre', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `anugaman_samiti_bibaran`
--

CREATE TABLE `anugaman_samiti_bibaran` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anugaman_samiti_bibaran`
--

INSERT INTO `anugaman_samiti_bibaran` (`id`, `post_id`, `name`, `address`, `gender`, `mobile_no`, `post_name`, `created_date`) VALUES
(3, 6, 'जमुना ढकाल ', '', '2', '', 'उपाध्यक्ष', ''),
(4, 5, 'रमेश खरेल', '', '1', '', 'सदस्य', ''),
(5, 5, 'केशब कार्की', '', '1', '', 'सदस्य', ''),
(6, 5, 'सुदिप मिश्र', '', '1', '', 'सदस्य', '');

-- --------------------------------------------------------

--
-- Table structure for table `assign_plan`
--

CREATE TABLE `assign_plan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `costumer_name` varchar(255) DEFAULT NULL,
  `costumer_address` varchar(255) DEFAULT NULL,
  `authority1` varchar(255) DEFAULT NULL,
  `authority2` varchar(255) DEFAULT NULL,
  `authority3` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank_information`
--

CREATE TABLE `bank_information` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_information`
--

INSERT INTO `bank_information` (`id`, `name`, `address`) VALUES
(1, 'NIC ASIA', 'Tarakeshwor'),
(2, 'हिमालयन बैंक', 'काठमाडौँ'),
(4, 'हिमालयन बैंक', 'काठमाडौँ');

-- --------------------------------------------------------

--
-- Table structure for table `bhautik_lakshya`
--

CREATE TABLE `bhautik_lakshya` (
  `id` int(11) NOT NULL,
  `details_id` int(11) NOT NULL,
  `qty` double(15,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `payment_count` int(11) NOT NULL,
  `prev_qty` double(15,2) NOT NULL,
  `miti` varchar(50) DEFAULT NULL,
  `miti_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bhautik_lakshya`
--

INSERT INTO `bhautik_lakshya` (`id`, `details_id`, `qty`, `unit_id`, `plan_id`, `type`, `payment_count`, `prev_qty`, `miti`, `miti_english`, `parent_id`) VALUES
(46, 45, 10.00, 1, 4, 1, 0, 0.00, '2078-6-14', '2021-09-30', NULL),
(47, 43, 1.00, 5, 4, 1, 0, 0.00, '2078-6-14', '2021-09-30', NULL),
(57, 3, 10.00, 0, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(58, 3, 10.00, 2, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(59, 3, 10.00, 0, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(60, 3, 10.00, 2, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(61, 3, 10.00, 0, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(62, 3, 10.00, 2, 10, 1, 0, 0.00, '2078-6-15', '2021-10-01', NULL),
(78, 2, 10.00, 1, 88, 1, 0, 0.00, '2078-6-19', '2021-10-05', 3),
(79, 24, 2.00, 6, 88, 1, 0, 0.00, '2078-6-19', '2021-10-05', 6),
(91, 38, 5.00, 4, 176, 1, 0, 0.00, '2078-6-22', '2021-10-08', 3),
(93, 10, 5.00, 0, 69, 1, 0, 0.00, '2078-6-22', '2021-10-08', 0),
(111, 9, 10.00, 4, 22, 1, 0, 0.00, '2078-8-22', '2021-12-08', 0),
(114, 40, 10.00, 2, 5, 1, 0, 0.00, '2078-8-24', '2021-12-10', 0),
(115, 38, 5.00, 5, 5, 1, 0, 0.00, '2078-8-24', '2021-12-10', 0),
(195, 2, 10.00, 1, 26, 1, 0, 0.00, '2078-8-24', '2021-12-10', 0),
(196, 2, 10.00, 1, 26, 1, 0, 0.00, '2078-8-24', '2021-12-10', 0),
(197, 43, 5.00, 3, 26, 1, 0, 0.00, '2078-8-24', '2021-12-10', 0),
(224, 41, 10.00, 4, 2, 1, 0, 0.00, '2078-8-26', '2021-12-12', 4),
(225, 37, 5.00, 1, 2, 1, 0, 0.00, '2078-8-26', '2021-12-12', 3),
(226, 36, 10.00, 1, 3, 1, 0, 0.00, '2078-8-26', '2021-12-12', 3),
(234, 2, 10.00, 2, 1, 1, 0, 0.00, '2078-9-8', '2021-12-23', 3),
(235, 40, 3.00, 1, 1, 1, 0, 0.00, '2078-9-8', '2021-12-23', 4),
(236, 37, 5.00, 5, 1, 1, 0, 0.00, '2078-9-8', '2021-12-23', 3),
(251, 41, 5.00, 4, 2, 2, 1, 10.00, '2078-9-29', '2022-1-13', 0),
(252, 37, 2.00, 1, 2, 2, 1, 5.00, '2078-9-29', '2022-1-13', 0),
(255, 41, 5.00, 4, 2, 3, 0, 10.00, '2078-9-29', '2022-1-13', 0),
(256, 37, 3.00, 1, 2, 3, 0, 5.00, '2078-9-29', '2022-1-13', 0),
(260, 36, 5.00, 1, 3, 2, 1, 10.00, '', '--', 0),
(262, 36, 5.00, 1, 3, 3, 0, 10.00, '', '--', 0),
(281, 36, 5.00, 1, 6, 1, 0, 0.00, '2078-10-2', '2022-01-16', 3),
(282, 43, 3.00, 5, 6, 1, 0, 0.00, '2078-10-2', '2022-01-16', 5),
(287, 36, 2.00, 1, 6, 2, 1, 5.00, '2078-10-2', '2022-1-16', 0),
(288, 43, 1.50, 5, 6, 2, 1, 3.00, '2078-10-2', '2022-1-16', 0),
(289, 36, 3.00, 1, 6, 3, 0, 5.00, '2078-10-2', '2022-1-16', 0),
(290, 43, 1.50, 5, 6, 3, 0, 3.00, '2078-10-2', '2022-1-16', 0),
(291, 41, 5.00, 1, 15, 1, 0, 0.00, '2078-10-2', '2022-01-16', 0),
(292, 37, 10.00, 2, 15, 1, 0, 0.00, '2078-10-2', '2022-01-16', 0),
(293, 41, 5.00, 1, 15, 3, 0, 5.00, '2078-10-2', '2022-1-16', 0),
(294, 37, 9.00, 2, 15, 3, 0, 10.00, '2078-10-2', '2022-1-16', 0),
(297, 36, 10.00, 1, 12, 1, 0, 0.00, '2078-10-3', '2022-01-17', 3),
(298, 43, 1.00, 5, 12, 1, 0, 0.00, '2078-10-3', '2022-01-17', 5),
(307, 36, 10.00, 1, 12, 3, 0, 10.00, '2078-10-3', '2022-1-17', 0),
(308, 43, 1.00, 5, 12, 3, 0, 1.00, '2078-10-3', '2022-1-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_payment`
--

CREATE TABLE `bill_payment` (
  `id` int(11) NOT NULL,
  `bhuktani_bill_amount` double(15,2) NOT NULL,
  `bhuktani_rem_amount` double(15,2) NOT NULL,
  `period` tinyint(2) NOT NULL,
  `bill_date_nepali` varchar(11) DEFAULT NULL,
  `bill_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `budget_nirman`
--

CREATE TABLE `budget_nirman` (
  `id` int(11) NOT NULL,
  `program_name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `status` int(11) NOT NULL,
  `ward_no` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `topic_area_type_sub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `child_plan_details`
--

CREATE TABLE `child_plan_details` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `parent_plan_id` int(11) NOT NULL,
  `added_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `budget_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `child_plan_details`
--

INSERT INTO `child_plan_details` (`id`, `plan_id`, `parent_plan_id`, `added_date`, `budget_amount`) VALUES
(1, 846, 688, '2021-08-25', NULL),
(2, 847, 688, '2021-08-25', NULL),
(3, 740, 17, '2021-10-09', NULL),
(4, 743, 17, '2021-10-09', 0),
(5, 744, 17, '2021-10-09', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `contingency`
--

CREATE TABLE `contingency` (
  `id` int(11) NOT NULL,
  `percent` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contingency`
--

INSERT INTO `contingency` (`id`, `percent`, `amount`, `plan_id`, `type`) VALUES
(1, '3', '0.03', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contingency_exenditure`
--

CREATE TABLE `contingency_exenditure` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` int(11) NOT NULL,
  `contingency_amount` int(11) NOT NULL,
  `taken_date` varchar(50) DEFAULT NULL,
  `taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contingency_exenditure`
--

INSERT INTO `contingency_exenditure` (`id`, `payment_evaluation_count`, `contingency_amount`, `taken_date`, `taken_date_english`, `plan_id`) VALUES
(1, 1, 100000, '2078-06-01', '2021-9-17', 6),
(2, 1, 100000, '2078-06-01', '2021-9-17', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_amount_withdraw_details`
--

CREATE TABLE `contract_amount_withdraw_details` (
  `id` int(11) NOT NULL,
  `plan_end_date` varchar(10) DEFAULT NULL,
  `plan_end_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date` varchar(250) DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_date` varchar(10) DEFAULT NULL,
  `plan_evaluated_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_amount` varchar(20) DEFAULT NULL,
  `final_payable_amount` varchar(20) DEFAULT NULL,
  `payment_till_now` varchar(20) DEFAULT NULL,
  `advance_payment` int(11) NOT NULL,
  `anudan_remaining_amount` varchar(20) DEFAULT NULL,
  `costumer_agreement` varchar(20) DEFAULT NULL,
  `remaining_payment_amount` varchar(20) DEFAULT NULL,
  `final_renovate_amount` varchar(20) DEFAULT NULL,
  `final_due_amount` varchar(20) DEFAULT NULL,
  `final_disaster_management_amount` varchar(20) DEFAULT NULL,
  `final_total_amount_deducted` varchar(20) DEFAULT NULL,
  `final_total_paid_amount` varchar(20) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `vat_per` float DEFAULT NULL,
  `vat_amt` float DEFAULT NULL,
  `bipat_per` float DEFAULT NULL,
  `bipat` float DEFAULT NULL,
  `dharauti_per` float DEFAULT NULL,
  `dharauti` float DEFAULT NULL,
  `cont_per` float DEFAULT NULL,
  `contingency` float DEFAULT NULL,
  `marmat_per` float DEFAULT NULL,
  `marmat` float DEFAULT NULL,
  `agrim_kar_per` float DEFAULT NULL,
  `bahal_per` float DEFAULT NULL,
  `paris_per` float DEFAULT NULL,
  `samajik_per` float DEFAULT NULL,
  `agrim_kar_amt` float DEFAULT NULL,
  `bahal_amt` float DEFAULT NULL,
  `paris_amt` float DEFAULT NULL,
  `samajik_amt` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_amount_withdraw_details`
--

INSERT INTO `contract_amount_withdraw_details` (`id`, `plan_end_date`, `plan_end_date_english`, `yojana_sakine_date`, `yojana_sakine_date_english`, `plan_evaluated_date`, `plan_evaluated_date_english`, `plan_evaluated_amount`, `final_payable_amount`, `payment_till_now`, `advance_payment`, `anudan_remaining_amount`, `costumer_agreement`, `remaining_payment_amount`, `final_renovate_amount`, `final_due_amount`, `final_disaster_management_amount`, `final_total_amount_deducted`, `final_total_paid_amount`, `created_date`, `created_date_english`, `plan_id`, `vat_per`, `vat_amt`, `bipat_per`, `bipat`, `dharauti_per`, `dharauti`, `cont_per`, `contingency`, `marmat_per`, `marmat`, `agrim_kar_per`, `bahal_per`, `paris_per`, `samajik_per`, `agrim_kar_amt`, `bahal_amt`, `paris_amt`, `samajik_amt`) VALUES
(1, '', '', '2078-06-15', '2021-10-1', '', '--', '400000', '452000', '0', 0, '', '', '439000', '', '', '39000.00', '40000', '412000.00', '2078-6-1', NULL, 4, 0, 52000, 0, 0, 1.5, 6000, 0, 0, 0, 0, 2, 0, 0, 0, 8000, 0, 0, 0),
(7, '', '', '2078-09-30', '2022-1-14', '', '--', '150000', '169500', '266250', 0, '', '', '153750', '', '', '3750.00', '9750', '159750.00', '2078-10-2', NULL, 6, 0, 19500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contract_analysis_based_withdraw`
--

CREATE TABLE `contract_analysis_based_withdraw` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` tinyint(1) NOT NULL,
  `evaluated_date` varchar(10) DEFAULT NULL,
  `evaluated_date_english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluated_amount` varchar(15) DEFAULT NULL,
  `payable_amount` varchar(15) DEFAULT NULL,
  `advance_payment` varchar(15) DEFAULT NULL,
  `contengency_amount` varchar(15) DEFAULT NULL,
  `renovate_amount` varchar(15) DEFAULT NULL,
  `due_amount` varchar(15) DEFAULT NULL,
  `disaster_management_amount` varchar(15) DEFAULT NULL,
  `total_amount_deducted` varchar(15) DEFAULT NULL,
  `total_paid_amount` varchar(15) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `advance_rate` varchar(50) DEFAULT NULL,
  `local_body_rate` varchar(50) DEFAULT NULL,
  `aaya_rate` varchar(50) DEFAULT NULL,
  `marmat_samhar_rate` varchar(50) DEFAULT NULL,
  `dharauti_rate` varchar(50) DEFAULT NULL,
  `fine_rate` varchar(50) DEFAULT NULL,
  `disaster_rate` varchar(50) DEFAULT NULL,
  `local_body_rate_amount` varchar(50) DEFAULT NULL,
  `aaya_rate_amount` varchar(50) DEFAULT NULL,
  `fine_rate_amount` varchar(50) DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `vat_amt` float DEFAULT NULL,
  `bipat_per` float DEFAULT NULL,
  `bipat` float DEFAULT NULL,
  `dharauti_per` float DEFAULT NULL,
  `dharauti` float DEFAULT NULL,
  `cont_per` float DEFAULT NULL,
  `contingency` float DEFAULT NULL,
  `marmat_per` float DEFAULT NULL,
  `marmat` float DEFAULT NULL,
  `vat_per` float DEFAULT NULL,
  `agrim_kar_per` float DEFAULT NULL,
  `agrim_kar_amt` float DEFAULT NULL,
  `bahal_per` float DEFAULT NULL,
  `bahal_amt` float DEFAULT NULL,
  `paris_per` float DEFAULT NULL,
  `paris_amt` float DEFAULT NULL,
  `samajik_per` float DEFAULT NULL,
  `samajik_amt` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_analysis_based_withdraw`
--

INSERT INTO `contract_analysis_based_withdraw` (`id`, `payment_evaluation_count`, `evaluated_date`, `evaluated_date_english`, `evaluated_amount`, `payable_amount`, `advance_payment`, `contengency_amount`, `renovate_amount`, `due_amount`, `disaster_management_amount`, `total_amount_deducted`, `total_paid_amount`, `plan_id`, `created_date`, `created_date_english`, `advance_rate`, `local_body_rate`, `aaya_rate`, `marmat_samhar_rate`, `dharauti_rate`, `fine_rate`, `disaster_rate`, `local_body_rate_amount`, `aaya_rate_amount`, `fine_rate_amount`, `vat`, `vat_amt`, `bipat_per`, `bipat`, `dharauti_per`, `dharauti`, `cont_per`, `contingency`, `marmat_per`, `marmat`, `vat_per`, `agrim_kar_per`, `agrim_kar_amt`, `bahal_per`, `bahal_amt`, `paris_per`, `paris_amt`, `samajik_per`, `samajik_amt`) VALUES
(3, 1, '2078-10-02', '2022-1-16', '250000', '', '0', NULL, '', '', '', '16250.00', '266250.00', 6, '2078-10-2', '2022-1-16', '', '', '', '', '', '', '', '', '', '', 0, 32500, 0, 0, 0, 0, 0, 0, 0, 0, 16250, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contract_bid`
--

CREATE TABLE `contract_bid` (
  `id` int(11) NOT NULL,
  `enlist_id` int(11) NOT NULL,
  `bid_amount` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_bid_final`
--

CREATE TABLE `contract_bid_final` (
  `id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `bank_guarentee` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `bank_address` text DEFAULT NULL,
  `bank_guarentee_date` varchar(50) DEFAULT NULL,
  `dharauti_amount` double(11,2) NOT NULL,
  `details` text DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `created_date_english` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_bid_final`
--

INSERT INTO `contract_bid_final` (`id`, `contractor_id`, `bank_guarentee`, `bank_name`, `bank_address`, `bank_guarentee_date`, `dharauti_amount`, `details`, `created_date`, `created_date_english`, `plan_id`) VALUES
(4, 1, '50000000', 'kumari bank', 'kalanki', '2078-05-24', 200000.00, '', '2078-08-24', '2021-12-10', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_details`
--

CREATE TABLE `contract_details` (
  `id` int(11) NOT NULL,
  `contractor_name` text DEFAULT NULL,
  `contractor_address` varchar(255) DEFAULT NULL,
  `contractor_contact` varchar(12) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_details`
--

INSERT INTO `contract_details` (`id`, `contractor_name`, `contractor_address`, `contractor_contact`, `pan_no`) VALUES
(2, 'Anupam Construction', 'Balaju', '977686565', '87654654654'),
(3, 'Sandhya Construction', 'chitwan', '9865326545', '98793135156'),
(4, 'Khan Brothers Real Estate And Contrustion', 'Jwalakhel', '01-562358', '023456896');

-- --------------------------------------------------------

--
-- Table structure for table `contract_dharauti`
--

CREATE TABLE `contract_dharauti` (
  `id` int(11) NOT NULL,
  `dharauti_amount` varchar(255) DEFAULT NULL,
  `return_amount` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_dharuti_add`
--

CREATE TABLE `contract_dharuti_add` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` int(11) NOT NULL,
  `contractor_name` varchar(255) DEFAULT NULL,
  `contractor_id` int(11) NOT NULL,
  `dharauti_amount` varchar(255) DEFAULT NULL,
  `taken_date` varchar(50) DEFAULT NULL,
  `taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_dharuti_firta`
--

CREATE TABLE `contract_dharuti_firta` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` int(11) NOT NULL,
  `dharauti_return_amount` varchar(255) DEFAULT NULL,
  `contractor_id` int(11) NOT NULL,
  `dharauti_amount` varchar(255) DEFAULT NULL,
  `taken_date` varchar(50) DEFAULT NULL,
  `taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_document`
--

CREATE TABLE `contract_document` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_document`
--

INSERT INTO `contract_document` (`id`, `name`) VALUES
(1, 'नागरिकता');

-- --------------------------------------------------------

--
-- Table structure for table `contract_entry_final`
--

CREATE TABLE `contract_entry_final` (
  `id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `bill_type` int(11) NOT NULL,
  `bid_amount` int(11) NOT NULL,
  `total_bid_amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) DEFAULT NULL,
  `approved_date` varchar(50) DEFAULT NULL,
  `approved_date_english` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_entry_final`
--

INSERT INTO `contract_entry_final` (`id`, `contractor_id`, `bill_type`, `bid_amount`, `total_bid_amount`, `status`, `plan_id`, `created_date`, `created_date_english`, `approved_date`, `approved_date_english`) VALUES
(4, 1, 2, 300000, 420000, 1, 6, '2078-08-24', '2021-12-10', '2078-08-24', '2021-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `contract_info`
--

CREATE TABLE `contract_info` (
  `id` int(11) NOT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contract_amount` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `contract_type` int(11) NOT NULL,
  `last_entry_date` varchar(50) DEFAULT NULL,
  `last_entry_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `thekka_id` varchar(255) DEFAULT NULL,
  `ps` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_info`
--

INSERT INTO `contract_info` (`id`, `created_date`, `created_date_english`, `contract_amount`, `plan_id`, `amount`, `contract_type`, `last_entry_date`, `last_entry_date_english`, `thekka_id`, `ps`) VALUES
(3, '2078-08-24', '2021-12-10', '2010000.00', 6, '2000000', 1, '2078-08-24', '2021-12-10', '102', 10000),
(4, '2078-09-20', '2022-1-4', '2500200.00', 55, '2500000', 1, '2078-09-21', '2022-1-5', '203', 200),
(5, '2078-09-20', '2022-1-4', '430000.00', 99, '400000', 1, '2078-09-20', '2022-1-4', '206', 30000),
(6, '2078-09-20', '2022-1-4', '199900.00', 78, '199000', 1, '2078-09-20', '2022-1-4', 'AND465.345', 900),
(7, '2078-09-21', '2022-1-5', '336000.00', 39, '300000', 1, '2078-09-22', '2022-1-6', 'bmsn2032659', 36000),
(8, '2078-09-21', '2022-1-5', '420000.00', 89, '400000', 1, '2078-09-28', '2022-1-12', 'fsdfds54545', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `contract_invitation_entry`
--

CREATE TABLE `contract_invitation_entry` (
  `id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `contractor_address` varchar(50) DEFAULT NULL,
  `contractor_contact` bigint(11) NOT NULL,
  `darta_miti` varchar(50) DEFAULT NULL,
  `darta_miti_english` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_invitation_entry`
--

INSERT INTO `contract_invitation_entry` (`id`, `bid_id`, `contractor_id`, `contractor_address`, `contractor_contact`, `darta_miti`, `darta_miti_english`, `plan_id`) VALUES
(1, 1, 1, 'tarkeshwor', 9861023479, '2078-08-24', '2021-12-10', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_invitation_for_bid`
--

CREATE TABLE `contract_invitation_for_bid` (
  `id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `contractor_address` text DEFAULT NULL,
  `contractor_contact` bigint(11) NOT NULL,
  `document_type` int(11) NOT NULL,
  `contractor_document` varchar(50) DEFAULT NULL,
  `bill_no` int(11) NOT NULL,
  `bid_fee` int(11) NOT NULL,
  `contract_date` varchar(50) DEFAULT NULL,
  `contract_date_english` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_invitation_for_bid`
--

INSERT INTO `contract_invitation_for_bid` (`id`, `bid_id`, `contractor_id`, `contractor_address`, `contractor_contact`, `document_type`, `contractor_document`, `bill_no`, `bid_fee`, `contract_date`, `contract_date_english`, `plan_id`) VALUES
(1, 1, 1, 'tarkeshwor', 9861023479, 1, '1', 222, 100, '2078-05-23', '2021-9-8', 6),
(2, 1, 1, 'tarkeshwor', 9861023479, 1, '1', 222, 100, '2078-05-23', '2021-9-8', 55),
(3, 1, 4, 'Jwalakhel', 1, 1, '1', 222, 100, '2078-05-23', '2021-9-8', 99),
(4, 1, 3, 'chitwan', 9865326545, 1, '1', 222, 100, '2078-09-19', '2022-1-3', 78),
(5, 1, 1, 'tarkeshwor', 9861023479, 1, '1', 96, 300, '2078-09-21', '2022-1-5', 39),
(6, 1, 1, 'tarkeshwor', 9861023479, 1, '1', 9666, 200, '2078-09-21', '2022-1-5', 89);

-- --------------------------------------------------------

--
-- Table structure for table `contract_more_details`
--

CREATE TABLE `contract_more_details` (
  `id` int(11) NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `work_order_date` varchar(50) DEFAULT NULL,
  `work_order_budget` varchar(255) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `start_date_english` text DEFAULT NULL,
  `completion_date` varchar(50) DEFAULT NULL,
  `completion_date_english` text DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `enlist_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `samjhauta_party` int(11) NOT NULL,
  `post_id_3` varchar(255) DEFAULT NULL,
  `miti` varchar(50) DEFAULT NULL,
  `total_family_members` varchar(50) DEFAULT NULL,
  `male` varchar(50) DEFAULT NULL,
  `female` varchar(50) DEFAULT NULL,
  `total_members` varchar(50) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_more_details`
--

INSERT INTO `contract_more_details` (`id`, `budget`, `work_order_date`, `work_order_budget`, `start_date`, `start_date_english`, `completion_date`, `completion_date_english`, `venue`, `enlist_id`, `type_id`, `samjhauta_party`, `post_id_3`, `miti`, `total_family_members`, `male`, `female`, `total_members`, `plan_id`) VALUES
(3, '1850000', '2078-09-13', '1850000', '2078-09-13', '', '2078-09-14', '', 'sthan', 0, 0, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2078-09-13', '10', '10', '10', '20', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_starting_fund`
--

CREATE TABLE `contract_starting_fund` (
  `id` int(11) NOT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `advance_taken_date` varchar(255) DEFAULT NULL,
  `advance_return_date` varchar(255) DEFAULT NULL,
  `advance_reason` varchar(255) DEFAULT NULL,
  `advance_taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `advance_return_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_time_addition_affiliation`
--

CREATE TABLE `contract_time_addition_affiliation` (
  `id` int(11) NOT NULL,
  `period` varchar(255) DEFAULT NULL,
  `program_problem_reason` varchar(255) DEFAULT NULL,
  `letter_date` varchar(10) DEFAULT NULL,
  `letter_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `decesion_date` varchar(10) DEFAULT NULL,
  `decesion_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `extended_date` varchar(10) DEFAULT NULL,
  `extended_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_time_addition_affiliation`
--

INSERT INTO `contract_time_addition_affiliation` (`id`, `period`, `program_problem_reason`, `letter_date`, `letter_date_english`, `decesion_date`, `decesion_date_english`, `extended_date`, `extended_date_english`, `plan_id`) VALUES
(1, '1', 'karan', '2078-09-30', '2022-1-14', '2078-09-30', '2078-09-30', '2078-09-30', '2022-1-14', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_total_investment`
--

CREATE TABLE `contract_total_investment` (
  `id` int(11) NOT NULL,
  `agreement_gaupalika` varchar(255) DEFAULT NULL,
  `bhuktani_anudan` varchar(255) DEFAULT NULL,
  `contract_total_amount` varchar(255) DEFAULT NULL,
  `total_investment` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_total` varchar(255) DEFAULT NULL,
  `contractor_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_total_investment`
--

INSERT INTO `contract_total_investment` (`id`, `agreement_gaupalika`, `bhuktani_anudan`, `contract_total_amount`, `total_investment`, `plan_id`, `unit_id`, `unit_total`, `contractor_id`, `created_date`) VALUES
(1, '1850000', '420000', '420000', '2010000.00', 6, 0, '', 1, '2022-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `costumer_association_details`
--

CREATE TABLE `costumer_association_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `issued_district` varchar(255) DEFAULT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `costumer_association_details`
--

INSERT INTO `costumer_association_details` (`id`, `post_id`, `name`, `address`, `gender`, `cit_no`, `issued_district`, `mobile_no`, `plan_id`, `created_date`) VALUES
(262, 0, 'अदक्ष्य', '3', 2, '', 'काठमाण्डौं', 0, 65, '2021-09-02'),
(263, 0, 'अदक्ष्य', '3', 2, '', 'काठमाण्डौं', 0, 65, '2021-09-02'),
(264, 0, 'अदक्ष्य', '3', 1, '', 'काठमाण्डौं', 0, 65, '2021-09-02'),
(265, 0, 'अदक्ष्य', '3', 1, '', 'काठमाण्डौं', 0, 65, '2021-09-02'),
(266, 0, 'अदक्ष्य', '3', 1, '', 'काठमाण्डौं', 0, 65, '2021-09-02'),
(282, 1, 'सागर लम्साल ', '1', 1, '1', 'काठमाण्डौं', 9851117526, 738, '2021-09-03'),
(283, 3, 'मिरा ', '1', 2, '1', 'काठमाण्डौं', 9851117526, 738, '2021-09-03'),
(284, 4, 'मिरा ', '1', 2, '1', 'काठमाण्डौं', 9851117526, 738, '2021-09-03'),
(285, 5, 'मिरा ', '1', 2, '1', 'काठमाण्डौं', 0, 738, '2021-09-03'),
(286, 5, 'मिरा ', '1', 1, '1', 'काठमाण्डौं', 0, 738, '2021-09-03'),
(292, 1, 'अच्युत न्यौपाने', '6', 2, '11', 'काठमाण्डौं', 9861023479, 36, '2021-09-22'),
(293, 4, 'अच्युत न्यौपाने', '6', 2, '102', 'काठमाण्डौं', 9861023479, 36, '2021-09-22'),
(294, 3, 'अच्युत न्यौपाने', '6', 1, '5656', 'काठमाण्डौं', 9861023479, 36, '2021-09-22'),
(295, 5, 'अच्युत न्यौपाने', '6', 1, '0', 'काठमाण्डौं', 9861023479, 36, '2021-09-22'),
(296, 5, 'अच्युत न्यौपाने', '6', 1, '11', 'काठमाण्डौं', 9861023479, 36, '2021-09-22'),
(297, 1, 'अच्युत न्यौपाने', '6', 2, '11', 'काठमाण्डौं', 9861023479, 18, '2021-09-22'),
(298, 4, 'अच्युत न्यौपाने', '6', 2, '102', 'काठमाण्डौं', 9861023479, 18, '2021-09-22'),
(299, 3, 'अच्युत न्यौपाने', '6', 1, '102', 'काठमाण्डौं', 9861023479, 18, '2021-09-22'),
(300, 5, 'अच्युत न्यौपाने', '6', 1, '5656', 'काठमाण्डौं', 9861023479, 18, '2021-09-22'),
(301, 5, 'अच्युत न्यौपाने', '6', 1, '11', 'काठमाण्डौं', 9861023479, 18, '2021-09-22'),
(317, 4, 'g', '6', 2, '11', 'काठमाण्डौं', 9861023479, 176, '2021-10-08'),
(318, 1, 'अच्युत न्यौपाने', '6', 2, '11', 'काठमाण्डौं', 977, 176, '2021-10-08'),
(319, 3, 'hgfhg', '6', 1, '11', 'काठमाण्डौं', 4, 176, '2021-10-08'),
(320, 5, 'प्रदेश सरकार - समानिकरण अनुदान', '6', 1, '5656', 'काठमाण्डौं', 2403786519, 176, '2021-10-08'),
(321, 5, 'संस्थागत विकाश सेवा प्रबाह', '6', 1, '102', 'काठमाण्डौं', 0, 176, '2021-10-08'),
(337, 1, 'सागर लम्साल ', '1', 1, '1', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(338, 3, 'मिरा ', '1', 2, '2', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(339, 4, 'रिमा', '1', 1, '3', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(340, 5, 'हिरा ', '1', 1, '4', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(341, 5, 'बिनोद ', '1', 2, '5', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(342, 5, 'कोसिस', '1', 1, '6', 'काठमाण्डौं', 0, 1, '2022-01-11'),
(343, 0, 'sabin', '6', 1, '11', 'काठमाण्डौं', 9861023479, 38, '2022-01-11'),
(344, 0, 'nabin', '6', 2, '102', 'काठमाण्डौं', 0, 38, '2022-01-11'),
(345, 0, 'babin', '6', 2, '5656', 'काठमाण्डौं', 0, 38, '2022-01-11'),
(346, 0, 'rubin', '6', 1, 'pad', 'काठमाण्डौं', 0, 38, '2022-01-11'),
(347, 0, 'dubin', '6', 1, '102', 'काठमाण्डौं', 0, 38, '2022-01-11'),
(348, 1, 'sanjay mishra', '3', 1, '100', 'काठमाण्डौं', 0, 58, ''),
(349, 3, 'nabin koirala', '3', 1, '200', 'काठमाण्डौं', 0, 58, ''),
(350, 4, 'sabin ghising', '3', 1, '300', 'काठमाण्डौं', 0, 58, ''),
(351, 5, 'binay marhatthaa', '3', 2, '400', 'काठमाण्डौं', 0, 58, ''),
(352, 5, 'rabina tondon', '3', 2, '500', 'काठमाण्डौं', 0, 58, '');

-- --------------------------------------------------------

--
-- Table structure for table `costumer_association_details_0`
--

CREATE TABLE `costumer_association_details_0` (
  `id` int(11) NOT NULL,
  `program_organizer_group_name` varchar(556) DEFAULT NULL,
  `program_organizer_group_address` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `address_new` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `costumer_association_details_0`
--

INSERT INTO `costumer_association_details_0` (`id`, `program_organizer_group_name`, `program_organizer_group_address`, `plan_id`, `created_date`, `address_new`) VALUES
(8, 'सुन्दर वस्तिमा ढल तथा बाटो निर्माण उपभोक्ता समिति ', '1', 1, '2022-01-11', 'सुन्दर वस्ति'),
(9, 'अकवरेश्वर एैतिहासिक मन्दिर संरक्षण तथा पौवा निर्माण उपभोक्ता समिति ', '3', 65, '2021-09-02', 'तर्केश्वोर'),
(10, 'किसनडोल पिपलवोट सडक jodeko  उपभोक्ता समिति ', '1', 738, '2021-09-03', 'पिपल डाँडा'),
(11, 'चिसापानी नयाँवस्ति टोलमा खानेपानी ढल र ग्रावेल उपभोक्ता समिति ', '6', 36, '2021-09-22', 'तर्केश्वोर'),
(12, 'खड्गेश्वर मन्दिरदेखि महादेव खोलासम्म सडक स्तरीकरण उपभोक्ता समिति ', '6', 18, '2021-09-22', 'तर्केश्वोर'),
(13, 'ग्राम सेवा मा. वि. उपभोक्ता समिति ', '6', 176, '2021-10-08', 'sanchalan sthan'),
(14, 'बस्नेतटार उकालो बाटो ढलान , ढल निर्माण उपभोक्ता समिति ', '6', 38, '2022-01-11', 'तर्केश्वोर'),
(15, 'बानियाँ टोल भित्री बाटो ढल निर्माण उपभोक्ता समिति', '3', 58, '2022-1-11', '');

-- --------------------------------------------------------

--
-- Table structure for table `costumer_black_list`
--

CREATE TABLE `costumer_black_list` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `costumer_name` varchar(255) NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `black_list_reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `costumer_black_list`
--

INSERT INTO `costumer_black_list` (`id`, `plan_id`, `costumer_name`, `program_name`, `black_list_reason`) VALUES
(2, 738, 'किसनडोल पिपलवोट सडक jodeko  उपभोक्ता समिति ', 'किसनडोल पिपलवोट सडक jodeko ', 'reason\r\n'),
(5, 65, 'अकवरेश्वर एैतिहासिक मन्दिर संरक्षण तथा पौवा निर्माण उपभोक्ता समिति ', 'अकवरेश्वर एैतिहासिक मन्दिर संरक्षण तथा पौवा निर्माण', 'kaary bhaneko samaymaa sampann pani garna nasakne ra paisako kami bhayeko dekhayekole\r\n'),
(7, 176, 'ग्राम सेवा मा. वि. उपभोक्ता समिति ', 'ग्राम सेवा मा. वि.', 'sewa garne bhanne udeshyle upabhokta samiti darta garayeko tara kaarya nagareko\r\n'),
(8, 38, 'बस्नेतटार उकालो बाटो ढलान , ढल निर्माण उपभोक्ता समिति ', 'बस्नेतटार उकालो बाटो ढलान , ढल निर्माण', 'malai man agera kaalo suchi ma rakhidiyeko'),
(9, 18, 'खड्गेश्वर मन्दिरदेखि महादेव खोलासम्म सडक स्तरीकरण उपभोक्ता समिति ', 'खड्गेश्वर मन्दिरदेखि महादेव खोलासम्म सडक स्तरीकरण', 'mandiko naam ma 17 lakh rupaya ko hera pheri bhayeko tara mandir nabaneko ');

-- --------------------------------------------------------

--
-- Table structure for table `deactive_plan_details`
--

CREATE TABLE `deactive_plan_details` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `deactivate_reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deactive_plan_details`
--

INSERT INTO `deactive_plan_details` (`id`, `plan_id`, `status`, `program_name`, `deactivate_reason`) VALUES
(3, 11, 1, 'प्रेम बहादुर तामाङ्को टहरादेखी कमानसिह थापा मगरको घरसम्मको १३ फी कच्चिमोटरबाटोमा ढल व्यवस्थापन  तथा बाटो मर्मत', 'dohoriyeko'),
(4, 321, 1, 'भष्मेश्वर घाट संरक्षण तथा खानेपानी  व्यवस्थापन', 'fdhgfdfdghg'),
(5, 9, 1, 'नयावस्ती आनन्दटोल सडक निर्माण तथा स्तरोत्रती', 'योजना दर्ता नं दोहोरिएको'),
(7, 17, 1, 'फुलबारी टोलमा ढल निकास', 'karyaram nabhayeko mistake le \r\n'),
(8, 14, 1, 'लोलाङ्ग स्थित नमुना बस्ती मार्गको बाटो स्तरोन्नति तथा ढलान', 'योजना संख्या दुई ओटा भएकोले'),
(10, 261, 1, 'ठकुरी दोबाटो पोखरी निर्माण', 'hawa ma entry gareko dohoriyeko data');

-- --------------------------------------------------------

--
-- Table structure for table `dharauti_khata_info`
--

CREATE TABLE `dharauti_khata_info` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `bank_amount` float NOT NULL,
  `bank_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dharauti_amt` float NOT NULL,
  `dharauti_miti` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_print`
--

CREATE TABLE `document_print` (
  `id` int(11) NOT NULL,
  `document` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_report`
--

CREATE TABLE `document_report` (
  `id` int(11) NOT NULL,
  `document` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ekmusta_budget`
--

CREATE TABLE `ekmusta_budget` (
  `id` int(11) NOT NULL,
  `total_expenditure` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eng_dates`
--

CREATE TABLE `eng_dates` (
  `id` int(11) NOT NULL,
  `date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `date_nepali` varchar(10) DEFAULT NULL,
  `type` tinyint(2) NOT NULL,
  `period` tinyint(2) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enlist`
--

CREATE TABLE `enlist` (
  `id` int(11) NOT NULL,
  `name0` text DEFAULT NULL,
  `address0` varchar(100) DEFAULT NULL,
  `number0` varchar(50) DEFAULT NULL,
  `name1` text DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `number1` varchar(50) DEFAULT NULL,
  `post1` varchar(50) DEFAULT NULL,
  `branch1` varchar(50) DEFAULT NULL,
  `name2` text DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `number2` varchar(50) DEFAULT NULL,
  `name3` text DEFAULT NULL,
  `post3` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `number3` varchar(255) DEFAULT NULL,
  `name4` text DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `number4` varchar(255) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enlist`
--

INSERT INTO `enlist` (`id`, `name0`, `address0`, `number0`, `name1`, `address1`, `number1`, `post1`, `branch1`, `name2`, `address2`, `number2`, `name3`, `post3`, `address3`, `number3`, `name4`, `address4`, `number4`, `type`) VALUES
(4, '', '', '', 'vfxvxcv', 'dfgfdg', '456546', 'fdgdfg', 'fdgdfg', '', '', '', '', '', '', '', '', '', '', '1'),
(5, 'आयुर्वेद तथा जनस्वास्थ्य प्रवर्धन शाखा', 'काठमाडौँ', '012345678', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `estimate_add`
--

CREATE TABLE `estimate_add` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_name` text DEFAULT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_anudan_details`
--

CREATE TABLE `estimate_anudan_details` (
  `id` int(11) NOT NULL,
  `investment_amount` int(11) NOT NULL,
  `other_source` int(11) NOT NULL,
  `samiti_investment` int(11) NOT NULL,
  `other_agreement` int(11) NOT NULL,
  `total_investment` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estimate_anudan_details`
--

INSERT INTO `estimate_anudan_details` (`id`, `investment_amount`, `other_source`, `samiti_investment`, `other_agreement`, `total_investment`, `plan_id`) VALUES
(1, 800000, 0, 0, 0, 800000, 22),
(2, 500000, 0, 100000, 0, 500000, 1),
(3, 2000000, 0, 0, 0, 2000000, 2),
(4, 1000000, 0, 0, 0, 1000000, 13),
(5, 1000000, 0, 0, 0, 1000000, 43),
(6, 2000000, 0, 2000000, 0, 2000000, 8),
(7, 2000000, 0, 0, 0, 2000000, 4),
(8, 2000000, 0, 0, 0, 2000000, 2),
(9, 500000, 0, 0, 0, 500000, 1),
(10, 500000, 0, 40000, 0, 500000, 65),
(11, 500000, 0, 0, 0, 500000, 1),
(12, 4500000, 0, 0, 0, 4500000, 738),
(13, 500000, 0, 0, 0, 500000, 1),
(14, 1500000, 0, 0, 0, 1500000, 5),
(15, 1500000, 0, 0, 0, 1500000, 5),
(16, 500000, 0, 0, 0, 500000, 1),
(17, 1500000, 0, 0, 0, 1500000, 5),
(18, 1500000, 0, 10000, 100000, 1600000, 5),
(19, 1500000, 0, 0, 0, 1500000, 5),
(20, 1500000, 0, 0, 0, 1500000, 5),
(21, 500000, 0, 0, 0, 500000, 20),
(22, 500000, 0, 0, 0, 500000, 65),
(23, 2000000, 0, 0, 0, 2000000, 2),
(24, 100000, 0, 0, 0, 100000, 56),
(25, 2000000, 0, 0, 0, 2000000, 4),
(26, 2000000, 0, 0, 0, 2000000, 4),
(27, 150000, 0, 0, 0, 150000, 98),
(28, 500000, 0, 0, 0, 500000, 88),
(29, 235000, 0, 0, 0, 235000, 176),
(30, 2000000, 0, 0, 0, 2000000, 2),
(31, 2000000, 0, 0, 0, 2000000, 38);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_lagat_anuman`
--

CREATE TABLE `estimate_lagat_anuman` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `main_work_name` text DEFAULT NULL,
  `total_evaluation` double(15,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `task_rate` double(15,2) NOT NULL,
  `total_rate` double(15,2) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `break_type` tinyint(1) NOT NULL,
  `sno` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estimate_lagat_anuman`
--

INSERT INTO `estimate_lagat_anuman` (`id`, `task_id`, `main_work_name`, `total_evaluation`, `unit_id`, `task_rate`, `total_rate`, `plan_id`, `break_type`, `sno`) VALUES
(4, 0, 'Earthwork in excavation for drain foundation', 12.00, 0, 91.53, 1098.36, 21, 1, 1),
(5, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 21, 1, 2),
(6, 0, 'P.C.C.work', 392.76, 6, 10648.79, 4182455.84, 21, 2, 3),
(37, 0, 'Earthwork in excavation for drain foundation', 12.00, 0, 91.53, 1098.36, 36, 1, 1),
(38, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 36, 1, 2),
(39, 0, 'P.C.C.work', 36.58, 6, 960.96, 35148.07, 36, 2, 3),
(40, 0, 'REINFORCEMENT DETAIILS', 36.58, 6, 960.96, 35148.07, 36, 2, 4),
(41, 0, 'Side Formwork', 36.58, 6, 960.96, 35148.07, 36, 1, 5),
(62, 0, 'Earthwork in excavation for drain foundation', 12.00, 0, 91.53, 1098.36, 38, 1, 1),
(63, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 38, 1, 2),
(64, 0, 'P.C.C.work', 36.58, 6, 960.96, 35148.07, 38, 2, 3),
(65, 0, 'REINFORCEMENT DETAIILS', 36.58, 6, 960.96, 35148.07, 38, 2, 4),
(66, 0, 'Side Formwork', 36.58, 6, 960.96, 35148.07, 38, 1, 5),
(87, 0, 'Earthwork in excavation for drain foundation', 12.00, 1, 91.53, 1098.36, 33, 1, 1),
(88, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 33, 1, 2),
(89, 0, 'P.C.C.work', 20.00, 6, 1000.00, 20000.00, 33, 2, 3),
(90, 0, 'REINFORCEMENT DETAIILS', 20.00, 6, 1000.00, 20000.00, 33, 2, 4),
(91, 0, 'Side Formwork', 20.00, 6, 1000.00, 20000.00, 33, 1, 5),
(96, 0, 'Earthwork in excavation for drain foundation', 12.00, 1, 91.53, 1098.36, 1, 1, 1),
(97, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 1, 1, 2),
(98, 0, 'P.C.C.work', 20.00, 6, 1000.00, 20000.00, 1, 2, 3),
(99, 0, 'REINFORCEMENT DETAIILS', 20.00, 6, 1000.00, 20000.00, 1, 2, 4),
(100, 0, 'Side Formwork', 20.00, 6, 1000.00, 20000.00, 1, 1, 5),
(106, 0, 'Earthwork in excavation for drain foundation', 12.00, 1, 91.53, 1098.36, 56, 1, 1),
(107, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 56, 1, 2),
(108, 0, 'P.C.C.work', 36.58, 6, 960.96, 35148.07, 56, 2, 3),
(109, 0, 'REINFORCEMENT DETAIILS', 36.58, 6, 960.96, 35148.07, 56, 2, 4),
(110, 0, 'Side Formwork', 36.58, 6, 960.96, 35148.07, 56, 1, 5),
(121, 0, 'Earthwork in excavation for drain foundation', 12.00, 1, 91.53, 1098.36, 98, 1, 1),
(122, 0, 'Stone soling work', 3.66, 2, 2207.58, 8074.44, 98, 1, 2),
(123, 0, 'P.C.C.work', 36.58, 6, 960.96, 35148.07, 98, 2, 3),
(124, 0, 'REINFORCEMENT DETAIILS', 36.58, 6, 960.96, 35148.07, 98, 2, 4),
(125, 0, 'Side Formwork', 36.58, 6, 960.96, 35148.07, 98, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_lagat_anuman_break`
--

CREATE TABLE `estimate_lagat_anuman_break` (
  `id` int(11) NOT NULL,
  `break_work_name` text DEFAULT NULL,
  `task_count` double(15,2) DEFAULT NULL,
  `length` double(15,2) DEFAULT NULL,
  `breadth` double(15,2) DEFAULT NULL,
  `height` double(15,2) DEFAULT NULL,
  `total_evaluation` varchar(255) DEFAULT NULL,
  `deduct_part` tinyint(4) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sno_taken` tinyint(3) NOT NULL,
  `break_no` tinyint(2) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `task_rate` int(11) DEFAULT NULL,
  `total_rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estimate_lagat_anuman_break`
--

INSERT INTO `estimate_lagat_anuman_break` (`id`, `break_work_name`, `task_count`, `length`, `breadth`, `height`, `total_evaluation`, `deduct_part`, `plan_id`, `sno_taken`, `break_no`, `unit_id`, `task_rate`, `total_rate`) VALUES
(9, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 21, 1, 0, NULL, NULL, NULL),
(10, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 21, 2, 0, NULL, NULL, NULL),
(11, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 21, 3, 1, NULL, NULL, NULL),
(12, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 21, 3, 2, NULL, NULL, NULL),
(13, 'REINFORCEMENT DETAIILS', 0.00, 0.00, 0.00, 0.00, '', 0, 21, 3, 3, NULL, NULL, NULL),
(14, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 21, 3, 4, NULL, NULL, NULL),
(15, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 21, 3, 5, NULL, NULL, NULL),
(16, 'Side Formwork', 2.00, 50.00, 0.00, 12.00, '20', 0, 21, 3, 6, NULL, NULL, NULL),
(59, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 36, 1, 0, NULL, NULL, NULL),
(60, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 36, 2, 0, NULL, NULL, NULL),
(61, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 36, 3, 1, NULL, NULL, NULL),
(62, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 36, 3, 2, NULL, NULL, NULL),
(63, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 36, 4, 1, NULL, NULL, NULL),
(64, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 36, 4, 2, NULL, NULL, NULL),
(65, '', 2.00, 40.00, 0.00, 0.46, '', 0, 36, 5, 0, NULL, NULL, NULL),
(94, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 38, 1, 0, NULL, NULL, NULL),
(95, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 38, 2, 0, NULL, NULL, NULL),
(96, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 38, 3, 1, NULL, NULL, NULL),
(97, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 38, 3, 2, NULL, NULL, NULL),
(98, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 38, 4, 1, NULL, NULL, NULL),
(99, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 38, 4, 2, NULL, NULL, NULL),
(100, '', 2.00, 40.00, 0.00, 0.46, '', 0, 38, 5, 0, NULL, NULL, NULL),
(129, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 33, 1, 0, NULL, NULL, NULL),
(130, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 33, 2, 0, NULL, NULL, NULL),
(131, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 33, 3, 1, NULL, NULL, NULL),
(132, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 33, 3, 2, NULL, NULL, NULL),
(133, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 33, 4, 1, NULL, NULL, NULL),
(134, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 33, 4, 2, NULL, NULL, NULL),
(135, '', 2.00, 50.00, 0.00, 12.00, '', 0, 33, 5, 0, NULL, NULL, NULL),
(136, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 1, 1, 0, 1, 92, 1098),
(137, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 1, 2, 0, 2, 2208, 8074),
(138, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 1, 3, 1, 6, 0, 0),
(139, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 1, 3, 2, 6, 0, 0),
(140, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 1, 4, 1, 6, 0, 0),
(141, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 1, 4, 2, 6, 0, 0),
(142, '', 2.00, 50.00, 0.00, 12.00, '', 0, 1, 5, 0, 6, 0, 0),
(150, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 56, 1, 0, 1, 92, 1098),
(151, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 56, 2, 0, 2, 2208, 8074),
(152, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 56, 3, 1, 6, 10649, 19475),
(153, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 56, 3, 2, 6, 10649, 39572),
(154, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 56, 4, 1, 6, 107, 17979),
(155, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 56, 4, 2, 6, 107, 21130),
(156, '', 2.00, 40.00, 0.00, 0.46, '', 0, 56, 5, 0, 6, 0, 0),
(171, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 98, 1, 0, 1, 92, 1098),
(172, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 98, 2, 0, 2, 2208, 8074),
(173, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 98, 3, 1, 6, 10649, 19475),
(174, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 98, 3, 2, 6, 10649, 39572),
(175, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 98, 4, 1, 6, 107, 17979),
(176, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 98, 4, 2, 6, 107, 21130),
(177, '', 2.00, 40.00, 0.00, 0.46, '', 0, 98, 5, 0, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_lagat_profile`
--

CREATE TABLE `estimate_lagat_profile` (
  `id` int(11) NOT NULL,
  `sub_total` double(15,2) NOT NULL,
  `gaupalika_anudan` double(15,2) NOT NULL,
  `contingency` double(15,2) NOT NULL,
  `bhuktani_anudan` double(15,2) NOT NULL,
  `public_anudan` double(15,2) NOT NULL,
  `vat_amount` double(15,2) NOT NULL,
  `overhead` double(15,2) NOT NULL,
  `grand_total` double(15,2) NOT NULL,
  `date_nepali` varchar(11) DEFAULT NULL,
  `date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `in_review` varchar(255) DEFAULT NULL,
  `approved` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estimate_lagat_profile`
--

INSERT INTO `estimate_lagat_profile` (`id`, `sub_total`, `gaupalika_anudan`, `contingency`, `bhuktani_anudan`, `public_anudan`, `vat_amount`, `overhead`, `grand_total`, `date_nepali`, `date_english`, `plan_id`, `type`, `in_review`, `approved`) VALUES
(2, 142476.36, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-06', '2021-9-22', 36, 0, NULL, NULL),
(3, 142476.36, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-06', '2021-9-22', 38, 0, NULL, NULL),
(4, 142476.36, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-06', '2021-9-22', 38, 0, NULL, NULL),
(5, 127328.28, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-12', '2021-9-28', 1, 0, '0', 1),
(6, 127328.28, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-12', '2021-9-28', 1, 0, NULL, NULL),
(7, 127328.28, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-12', '2021-9-28', 33, 0, NULL, NULL),
(8, 142476.36, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-18', '2021-10-4', 56, 0, '0', 1),
(9, 142476.36, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2078-06-18', '2021-10-4', 98, 0, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_other_agreement`
--

CREATE TABLE `estimate_other_agreement` (
  `id` int(11) NOT NULL,
  `total_investment_amount` int(11) NOT NULL,
  `other_investment` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ethekka_info_list`
--

CREATE TABLE `ethekka_info_list` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `firm_name` varchar(255) DEFAULT NULL,
  `firm_address` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `thekka_no` varchar(255) DEFAULT NULL,
  `thekka_rakam` float NOT NULL,
  `kabol_rakam` float NOT NULL,
  `print_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `bank_amount` varchar(255) DEFAULT NULL,
  `bank_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dharauti_amt` float DEFAULT NULL,
  `dharauti_miti` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bolpatra_miti` varchar(255) DEFAULT NULL,
  `bolpatra_m` varchar(255) DEFAULT NULL,
  `place_to_organize` varchar(255) DEFAULT NULL,
  `dharauti_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ethekka_info_list`
--

INSERT INTO `ethekka_info_list` (`id`, `plan_id`, `firm_name`, `firm_address`, `contact_no`, `thekka_no`, `thekka_rakam`, `kabol_rakam`, `print_date`, `bank_name`, `bank_address`, `bank_amount`, `bank_date`, `dharauti_amt`, `dharauti_miti`, `bolpatra_miti`, `bolpatra_m`, `place_to_organize`, `dharauti_no`) VALUES
(16, 6, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9861023479', '(RAT/Chitwan/Works/NCB/01/077-78)', 3060000, 2030000, '2078-06-01', 'मनकुमारी बैंक ', 'कलंकी,काठमाडौँ', '10000000', '2078-06-29', 10000000, '2078-06-01', '2078-06-01', 'कान्तिपुर दैनिक', 'अस्पताल रोड २. नं वडा', 'BB/0175/0013/5352/20'),
(17, 12, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9851014969', '568-256RAT-Cnst/5632', 2450000, 2443770, '2078-06-01', 'कुमारी बैंक ', 'कलंकी', '5000000', '2078-06-14', 10000000, '2078-06-01', '2078-06-05', 'कान्तिपुर दैनिक', 'अस्पताल रोडमा २. नं वडा', 'BB/0175/0013/5352/30'),
(18, 12, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9851014969', '568-256RAT-Cnst/5632', 2450000, 2443770, '2078-06-01', 'कुमारी बैंक ', 'कलंकी', '5000000', '2078-06-14', 10000000, '2078-06-01', '2078-06-05', 'कान्तिपुर दैनिक', 'अस्पताल रोडमा २. नं वडा', 'BB/0175/0013/5352/30'),
(19, 22, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9851014969', '568-256RAT-Cnst/5632', 2450000, 2030000, '2078-06-01', 'कुमारी बैंक ', 'कलंकी', '8000000', '2078-06-29', 10000000, '2078-06-01', '2078-06-05', 'कान्तिपुर दैनिक', 'तरकेश्वोर', 'BB/0175/0013/5352/30'),
(20, 6, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9861023479', '(RAT/Chitwan/Works/NCB/01/077-78)', 3060000, 2030000, '2078-06-01', 'मनकुमारी बैंक ', 'कलंकी,काठमाडौँ', '10000000', '2078-06-29', 10000000, '2078-06-01', '2078-06-01', 'कान्तिपुर दैनिक', 'अस्पताल रोड २. नं वडा', 'BB/0175/0013/5352/20'),
(21, 15, 'ए.बि.सि कन्स्ट्रक्सन', 'बाफल काठमाडौँ', '9851014969', '568-256RAT-Cnst/5632', 980000, 995000, '2078-10-02', 'कुमारी बैंक ', 'कलंकी', '5000000', '2078-06-29', 10000000, '2078-06-01', '2078-06-05', 'कान्तिपुर दैनिक', 'अस्पताल रोडमा २. नं वडा', 'BB/0175/0013/5352/30');

-- --------------------------------------------------------

--
-- Table structure for table `ethekka_kul_lagat`
--

CREATE TABLE `ethekka_kul_lagat` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `agreement_gaupalika` int(11) NOT NULL,
  `kul_rakam` int(11) NOT NULL,
  `katti` int(11) NOT NULL,
  `contract_total_investment` int(11) NOT NULL,
  `total_investment` int(11) NOT NULL,
  `anya_nikaya_per` float DEFAULT NULL,
  `anya_nikaya` varchar(255) DEFAULT NULL,
  `anya_nikaya_amount` int(11) DEFAULT NULL,
  `agreement_gaupalika_per` float DEFAULT NULL,
  `lagat_miti` varchar(255) DEFAULT NULL,
  `cont` float DEFAULT NULL,
  `yojanaa_samjhauta_date` varchar(255) DEFAULT NULL,
  `yojana_end_date` varchar(255) DEFAULT NULL,
  `yojana_start_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ethekka_kul_lagat`
--

INSERT INTO `ethekka_kul_lagat` (`id`, `plan_id`, `agreement_gaupalika`, `kul_rakam`, `katti`, `contract_total_investment`, `total_investment`, `anya_nikaya_per`, `anya_nikaya`, `anya_nikaya_amount`, `agreement_gaupalika_per`, `lagat_miti`, `cont`, `yojanaa_samjhauta_date`, `yojana_end_date`, `yojana_start_date`) VALUES
(1, 6, 1850000, 0, 90000, 3020000, 3060000, 43.05, 'जिल्ला समन्वय समिति चितवन', 1300000, 56.95, '2078-06-03', 55500, '2078-06-14', '2078-06-06', '2078-06-01'),
(2, 6, 1850000, 0, 90000, 3020000, 3060000, 43.05, 'जिल्ला समन्वय समिति चितवन', 1300000, 56.95, '2078-06-03', 55500, '2078-06-14', '2078-06-06', '2078-06-01'),
(3, 6, 1850000, 0, 90000, 3020000, 3060000, 43.05, 'जिल्ला समन्वय समिति चितवन', 1300000, 56.95, '2078-06-03', 55500, '2078-06-14', '2078-06-06', '2078-06-01'),
(4, 6, 1850000, 0, 90000, 3020000, 3115500, 43.05, 'जिल्ला समन्वय समिति चितवन', 1300000, 56.95, '2078-06-03', 0, '2078-06-14', '2078-06-06', '2078-06-01'),
(5, 69, 2500000, 0, 100000, 2500000, 2400000, 0, 'ddsafdsf', 0, 100, '2078-06-05', 0, '2078-06-05', '2078-06-28', '2078-05-23'),
(6, 22, 800000, 0, 50000, 2500000, 2450000, 10, 'sasasa', 250000, 90, '2078-08-10', 24000, '2078-06-14', '2078-06-28', '2078-06-05'),
(7, 12, 1875000, 0, 50000, 2500000, 2450000, 25, 'जिल्ला समन्वय समिति चितवन', 625000, 75, '2078-08-21', 75000, '2078-06-14', '2078-05-31', '2078-05-23'),
(8, 15, 886500, 0, 5000, 985000, 980000, 10, 'जिल्ला समन्वय समिति चितवन', 98500, 90, '2078-10-02', 0, '2078-06-05', '2078-06-06', '2078-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `extra_investment_details`
--

CREATE TABLE `extra_investment_details` (
  `id` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `c_percent` double(15,2) NOT NULL,
  `is_c` tinyint(4) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extra_investment_details`
--

INSERT INTO `extra_investment_details` (`id`, `budget_id`, `topic_id`, `amount`, `c_percent`, `is_c`, `plan_id`) VALUES
(1, 9, 0, 10000.00, 0.00, 0, 739),
(2, 15, 0, 20000.00, 0.00, 0, 739),
(3, 9, 0, 200000.00, 0.00, 0, 745);

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year`
--

CREATE TABLE `fiscal_year` (
  `id` int(11) NOT NULL,
  `year` varchar(9) DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fiscal_year`
--

INSERT INTO `fiscal_year` (`id`, `year`, `is_current`) VALUES
(1, '2078/079', 1);

-- --------------------------------------------------------

--
-- Table structure for table `investigation_association_details`
--

CREATE TABLE `investigation_association_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `investigation_association_details`
--

INSERT INTO `investigation_association_details` (`id`, `post_id`, `name`, `address`, `gender`, `mobile_no`, `plan_id`, `created_date`, `post_name`) VALUES
(89, 5, 'sfdsf', '1', 1, 0, 65, '2021-09-02', ''),
(90, 6, 'erewre', '2', 1, 0, 65, '2021-09-02', ''),
(91, 5, 'ytrytry', '2', 1, 0, 65, '2021-09-02', ''),
(94, 6, 'जमुना ढकाल ', '1', 1, 0, 738, '2021-09-03', ''),
(97, 5, 'अच्युत न्यौपाने', '1', 1, 0, 36, '2021-09-22', ''),
(98, 6, 'अच्युत न्यौपाने', '', 1, 0, 36, '2021-09-22', ''),
(111, 5, 'अच्युत न्यौपाने', '1', 1, 0, 18, '2021-09-22', ''),
(112, 6, 'अच्युत न्यौपाने', '2', 1, 0, 18, '2021-09-22', ''),
(121, 6, 'प्रदेश सरकार - समानिकरण अनुदान', '2', 1, 0, 176, '2021-10-08', ''),
(122, 5, 'g', '2', 1, 0, 176, '2021-10-08', ''),
(125, 6, 'samyojak', '2', 1, 0, 1, '2021-12-23', ''),
(126, 5, 'sadasya', '2', 1, 0, 1, '2021-12-23', '');

-- --------------------------------------------------------

--
-- Table structure for table `kar_bibaran`
--

CREATE TABLE `kar_bibaran` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `kar_percent` varchar(255) DEFAULT NULL,
  `kar_rakam` varchar(255) DEFAULT NULL,
  `total_kar_amount` varchar(255) DEFAULT NULL,
  `kar_topic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kar_bibaran`
--

INSERT INTO `kar_bibaran` (`id`, `darta_id`, `kar_percent`, `kar_rakam`, `total_kar_amount`, `kar_topic`) VALUES
(104, 176, '1', '0', '', 'घर बहाल कर'),
(105, 176, '2', '0', '', 'आय कर'),
(106, 176, '1.5', '0', '', 'डोर हाजिर '),
(113, 100, '1', '', '', 'घर बहाल कर'),
(114, 100, '2', '', '', 'आय कर'),
(115, 100, '1.5', '', '', 'डोर हाजिर '),
(138, 2, '2.5', '10000', '250', 'पारिश्रमिक कर'),
(139, 3, '2.5', '10000', '250', 'सामाजिक सुरक्षा कर'),
(140, 3, '3', '10000', '300', 'नया कर '),
(141, 3, '2.5', '2000', '50', 'सामाजिक सुरक्षा कर'),
(142, 3, '3', '10000', '300', 'नया कर '),
(143, 3, '2.5', '2000', '50', 'सामाजिक सुरक्षा कर'),
(144, 3, '3', '2000', '60', 'नया कर '),
(146, 15, '5', '10000', '500', 'आय कर'),
(150, 12, '2.5', '10000', '250', 'पारिश्रमिक कर');

-- --------------------------------------------------------

--
-- Table structure for table `katti_details`
--

CREATE TABLE `katti_details` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `payment_count` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `katti_id` int(11) NOT NULL,
  `katti_amount` double(15,2) NOT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `letters_history`
--

CREATE TABLE `letters_history` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `one` int(11) NOT NULL,
  `two` int(11) NOT NULL,
  `three` int(11) NOT NULL,
  `four` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `letter_bill_paper_details`
--

CREATE TABLE `letter_bill_paper_details` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `documents` int(11) NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `letter_bill_paper_details`
--

INSERT INTO `letter_bill_paper_details` (`id`, `plan_id`, `documents`, `date`) VALUES
(1, 1, 1, '2021-09-05'),
(2, 1, 1, '2021-09-05'),
(3, 1, 1, '2021-09-05'),
(4, 1, 1, '2021-09-05'),
(5, 1, 1, '2021-09-05'),
(6, 1, 1, '2021-09-05'),
(7, 1, 1, '2021-09-05'),
(8, 1, 1, '2021-09-10'),
(9, 1, 1, '2022-01-13'),
(10, 1, 1, '2022-01-13'),
(11, 1, 1, '2022-01-13');

-- --------------------------------------------------------

--
-- Table structure for table `letter_format`
--

CREATE TABLE `letter_format` (
  `id` int(11) NOT NULL,
  `plan_type` int(11) NOT NULL,
  `letter_type` text DEFAULT NULL,
  `letter_text` longtext DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `letter_format`
--

INSERT INTO `letter_format` (`id`, `plan_type`, `letter_type`, `letter_text`, `date`) VALUES
(14, 6, 'दररेट पेश गर्न कम्पनी/निर्माण व्यवसायीलाई लेखेको पत्र', '<p style=\"text-align:center;\"><strong>विषय&nbsp;:&nbsp;<u>दररेट पेश गर्ने सम्बन्धमा ।</u></strong></p><p style=\"text-align:justify;\">&nbsp;</p><p style=\"text-align:justify;\">श्री <span class=\"mention\" data-mention=\"[[form_company_name]]\">[[form_company_name]]</span></p><p style=\"text-align:justify;\">&nbsp; &nbsp;<span class=\"mention\" data-mention=\"[[form_company_address]]\">[[form_company_address]]</span></p><p style=\"text-align:justify;\">&nbsp;</p><p style=\"text-align:justify;\">&nbsp;&nbsp;&nbsp; प्रस्तुत विषयमा तारकेश्नवर नगरपालिका वडा नं <span class=\"mention\" data-mention=\"[[yojana_ward_no]]\">[[yojana_ward_no]]</span> मा&nbsp;<span class=\"mention\" data-mention=\"[[yojana_name]]\">[[yojana_name]]</span> गर्नुपर्ने भएको हुँदा उक्त सामग्री / योजना&nbsp;के कति दर रेटमा उपलब्ध गराउन / कार्य &nbsp;गर्न सकिने क्रममा &nbsp;आफ्नो निर्माण सेवा / कम्पनीको आधिकारिक दररेट खुलाई यस कार्यालयमा यथाशीघ्र पेश गर्नुहुन अनुरोध छ ।</p><p style=\"text-align:justify;\">&nbsp;</p>', 2021),
(15, 6, 'कोटेशनबाट खरीद गर्दाको सबभन्दा शुरुको टिप्पणी', '<p style=\"text-align:center;\">&nbsp; विषय : <span class=\"mention\" data-mention=\"[[yojana_name]]\">[[yojana_name]]</span> सम्बन्धमा ।</p><p style=\"text-align:justify;\">श्रीमान्,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;प्रस्तुत विषयमा तारकेश्वर नगरपालिका वडा नं <span class=\"mention\" data-mention=\"[[yojana_ward_no]]\">[[yojana_ward_no]]</span> स्थित () &nbsp;नभएकोले त्यहाँका बासिन्दाहरुलाई समस्या परिरहेको अवस्था छ ।<br>तारकेश्वर नगरपालिकाको नगर सभा / नगर कार्यपालिकाको बैठकबाट योजना / मर्मत / साझेदारी को लागि रु <span class=\"mention\" data-mention=\"[[anudan]]\">[[anudan]]</span> बजेट विनियोजन भएको र माथि उल्लिखित कार्य गर्न प्राविधिकबाट रु. <span class=\"mention\" data-mention=\"[[kul_lagat_anudan]]\">[[kul_lagat_anudan]]</span> को लागत अनुमान&nbsp; पेश हुन आएको हुँदा नगर सभा/नगर कार्यपालिकाको बैठकबाट <span class=\"mention\" data-mention=\"[[anudan]]\">[[anudan]]</span>]] विनियोजित रकमलाई मुख्य लागत अनुमान &nbsp;कायम गरी &nbsp;सार्वजनिक खरीद ऐन, २०६३ को दफा ४१ र &nbsp;सार्वजनिक खरीद नियमावली, २०६४ को नियम ८५ बमोजिम खरीद&nbsp; प्रकृया अघि बढाउन निर्णयार्थ पेश गरिएको छ ।</p>', 2021),
(16, 6, 'samjhauta patra', '<p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; subject: samjhauta_patra</p><p>&nbsp;</p><p>प्रस्तुत विषयमा यस कार्यालयको मिति को पत्रानुसार Removal of Landslide and Maintenance of Different Road Palungtar Municipality को लागि तहाँ निर्माण व्यवसायी/कम्पनी/फर्मसमेतबाट दररेट माग गरिएकोमा तहाँ निर्माण व्यवसायी/कम्पनी/फर्मले कबोल गरेको कूल अंक रु १,३८,०८६ अक्षरेपी एक लाख अठतीस हजार छयासीरुपैया को दररेट स्वीकृत भएको हुँदा सम्झौता गर्न आउनुहुन अनुरोध छ । श्री Annapurna Nirman Sewa र गौरीगञ्ज गाउँ कार्यपालिकाको कार्यालयबीच Removal of Landslide and Maintenance of Different Road Palungtar Municipality कार्यको लागि गरिएको सम्झौता-पत्र गौरीगञ्ज गाउँ कार्यपालिकाको कार्यालय (जसलाई यसपछि प्रथम पक्ष भनिनेछ) र Annapurna Nirman Sewa (जसलाई यसपछि दोश्रो पक्ष भनिनेछ) बीच Removal of Landslide and Maintenance of Different Road Palungtar Municipality कार्य गर्न/खरीद गर्न निम्नानुसारका शर्तहरुको अधिनमा रही यो सम्झौता-पत्रमा हस्ताक्षर गरी दुवै पक्षले लियौं/दियौं । सम्झौताको शर्तहरु&nbsp;<br>&nbsp;</p><ul><li>१. प्राविधिक इष्टिमेट/स्वीकृत लागत अनुमान बमोजिम Removal of Landslide and Maintenance of Different Road Palungtar Municipality कार्य मिति २०७७-०६-३० भित्रमा सम्पन्न गरिसक्नुपर्नेछ ।</li><li>२. बुँदा नम्बर १ (एक) बमोजिमको कार्य सम्पन्न गरे पश्चात सम्बन्धित प्राविधिक मूल्यांकन प्रतिवेदन, वडा कार्यालयको सिफारिस, अनुगमन समितिको प्रतिवेदन, सम्पन्न योजनाको फोटो, बील-भरपाइ एवं अन्य आवश्यक कागजातहरुको आधारमा प्रथम पक्षले दोश्रो पक्षलाई जम्मा स्वीकृत रकम रु १,३८,०८६ अक्षरेपी एक लाख अठतीस हजार छयासीरुपैया मात्र (मू.अ. करसहित) उपलब्ध गराउने छ ।</li><li>३. प्रथम पक्षले दोश्रो पक्षलाई रकम भुक्तानी गर्दा १.५ आय कर कट्टी गरी बाँकी रकम मात्र भुक्तानी गरिने छ । अन्य नियमानुसार नेपाल सरकार वा अन्य निकायलाई कुनै शुल्क वा जरीवाना बुझाउनु परेमा स्वयं दोश्रो पक्षले व्यहोर्नु पर्नेछ ।</li><li>४. प्राविधिक इष्टिमेट बमोजिम गुणस्तरयुक्त सामग्री उपलब्ध गराउनु दोश्रो पक्षको कर्तव्य हुनेछ ।</li><li>५. अन्य शर्तहरु सार्वजनिक खरीद ऐन, २०६३, सार्वजनिक खरीद नियमावली, २०६४ र अन्य प्रचलित कानून बमोजिम हुनेछ ।</li><li>6.hksgfksdfgksfgskfsgksjf</li></ul>', 2020),
(17, 6, 'antim bhuktani ', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><u> &nbsp;bishay: antim bhuktani sambadhma</u></strong></p><p style=\"text-align:justify;\"><strong><u>hgfkjsfgkjdsgfkdsgskjfgskfjgssfgskfjskdbfksdjfsfkjhdhjsfgkFKMBSFKJSDHFHSEFJSFHKJSDFHSDKJSKEIRKYWKURYEWUKHMDSBFMSDBFSDKFSHKFJfbkjfgkjshflhglkfhglkfghlkfhglkfhglkfghlkaghlkhjbfdaghjfhaflg</u></strong></p><p style=\"text-align:justify;\"><strong><u>fkjsdfjhfk</u></strong></p><p style=\"text-align:justify;\"><strong><u>jhfsdkjhfksdjfhsdkjagdkjdgakjgfksjdfgkjdffsdfsdfsdfdsfFSDFSDF</u></strong></p>', 2020),
(18, 6, 'अन्तिम भुक्तानी सम्बन्धमा ', '<p style=\"text-align:center;\"><strong><u>अन्तिम भुक्तानी सम्बन्धमा&nbsp;</u></strong></p><p style=\"text-align:justify;\">श्रीमान्&nbsp;</p><p style=\"text-align:justify;\">प्रस्तुत विषयमा&nbsp; यस पालुङटार नगरपालिकाको आ.व. २०७७/०७८ मा नगर / वडा स्तरीय योजना अन्तर्गत मर्मत सम्भार कार्यक्रममा बिनियोजन गरिएको रकम रु ५०,००,०००/- (अक्षरुपि: पचास लाख रुपिया) मध्येवाट खर्च हुने गरि <u>पा</u><strong><u>.न.पा ४, स्थित पुष्पलाल राजमार्ग र हवाईग्राउण्ड र बोहोरे खोलामा आएको पहिरो ब्यबस्थापन</u></strong>कार्य का लागि&nbsp; रु. <strong>१३९४१३.७५ (अक्षरुपि: एक लाख उन्चालिस हजार चार सय तेह्र रुपिया पचहत्तर पैसा मु.अ.क. सहित)&nbsp;</strong>प्राविधिक लागत अनुमान स्वीकृत भई&nbsp; स्वीकृत लागत अनुमान बमोजिम कोटेशन&nbsp; मार्फत गर्नका लागि, रित पुर्वक दर्ता हुन आएका फर्महरु मध्ये तपाइँ श्री अन्नपूर्ण निर्माण सेवाले&nbsp;सबै भन्दा कम कबोल अंक रु १३८०८६/- &nbsp;(अक्षरुपि:एक लाख अड्तीस हजार छयासी हजार रुपिया मात्र) पेश गरेको हुदा यस कार्यालयको मिति २०७७/०६/०२ को निर्णयले स्वीकृत गरि कार्य योजनाको लागि कार्यादेश दिई नियमानुसार सम्झौता भइ&nbsp;योजना सञ्चालनको अवस्थाको अनुगमन&nbsp;(Ongoing Monitoring), &nbsp;योजना कार्य सम्पन्न पश्चातको नापजाच&nbsp;(Work Completion Report/ Measurement Of Quantity) बमोजिम र मिति २०७७/०६/२० गतेको न.पा. स्तरीय अनुगनम समितिको प्रतिवेदन समेतको आधारमा सम्बन्धित वडा कार्यालयको सिफारिस समेत&nbsp; समावेश गरी रकम भुक्तानीको लागि निवेदन पेश गरेकोले&nbsp; नियमानुसार लाग्ने रकम करकट्टा गरि&nbsp;रकम भुक्तानीको लागि यो&nbsp;निर्णयार्थ गरेको छु ।</p>', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `letter_indices`
--

CREATE TABLE `letter_indices` (
  `id` int(11) NOT NULL,
  `letter_index` text DEFAULT NULL,
  `letter_index_nepali` text DEFAULT NULL,
  `letter_table` text DEFAULT NULL,
  `table_property` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `letter_indices`
--

INSERT INTO `letter_indices` (`id`, `letter_index`, `letter_index_nepali`, `letter_table`, `table_property`) VALUES
(1, 'yojana_name', 'योजनाको नाम', 'plan_details1', 'program_name'),
(2, 'anudan', 'योजनाको अनुदान रु ', 'plan_details1', 'investment_amount'),
(3, 'contengency_amount', 'कन्टेन्जेन्सी रकम रु ', 'quotation_total_investment', 'contigency_amount  '),
(4, 'kul_lagat_anudan', 'कुल लागत अनुदान', 'quotation_total_investment', 'kul_lagat_anudan'),
(5, 'yojana_start_date', 'योजना सुरु हुने मिती', 'quotation_more_details', 'yojana_start_date'),
(6, 'yojana_end_date', 'योजना सम्पन्न हुने  मिती', 'quotation_more_details', 'yojana_end_date');

-- --------------------------------------------------------

--
-- Table structure for table `marmat_samhar`
--

CREATE TABLE `marmat_samhar` (
  `id` int(11) NOT NULL,
  `percent` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marmat_samhar`
--

INSERT INTO `marmat_samhar` (`id`, `percent`, `amount`) VALUES
(1, '2', '0.02');

-- --------------------------------------------------------

--
-- Table structure for table `material_anudan`
--

CREATE TABLE `material_anudan` (
  `id` int(11) NOT NULL,
  `external_source` text DEFAULT NULL,
  `state_gov` text DEFAULT NULL,
  `local_level` text DEFAULT NULL,
  `sub_gov` text DEFAULT NULL,
  `foreign_gov` text DEFAULT NULL,
  `other_nikaya` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `merge_plan_id`
--

CREATE TABLE `merge_plan_id` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `parent_plan_ids` varchar(50) DEFAULT NULL,
  `merged_amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merge_plan_id`
--

INSERT INTO `merge_plan_id` (`id`, `plan_id`, `parent_plan_ids`, `merged_amount`) VALUES
(1, 738, '7-8', '4500000');

-- --------------------------------------------------------

--
-- Table structure for table `more_plan_details`
--

CREATE TABLE `more_plan_details` (
  `id` int(11) NOT NULL,
  `samiti_gathan_date` varchar(255) DEFAULT NULL,
  `costumer_total_population` varchar(255) DEFAULT NULL,
  `yojana_start_date` varchar(255) DEFAULT NULL,
  `yojana_sakine_date` varchar(255) DEFAULT NULL,
  `samjhauta_party` varchar(255) DEFAULT NULL,
  `post_id_3` varchar(255) DEFAULT NULL,
  `miti` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `samiti_gathan_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_start_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `miti_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `more_plan_details`
--

INSERT INTO `more_plan_details` (`id`, `samiti_gathan_date`, `costumer_total_population`, `yojana_start_date`, `yojana_sakine_date`, `samjhauta_party`, `post_id_3`, `miti`, `plan_id`, `samiti_gathan_date_english`, `yojana_start_date_english`, `yojana_sakine_date_english`, `miti_english`, `created_date`) VALUES
(8, '2078-5-17', '10', '2078-05-02', '2078-05-31', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-05-02', 1, '2021-9-2', '2021-8-18', '2021-9-16', '2021-8-18', NULL),
(9, '2078-5-17', '30', '2078-05-17', '2078-05-31', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-05-17', 65, '2021-9-2', '2021-9-2', '2021-9-16', '2021-9-2', NULL),
(10, '2078-5-18', '10', '2078-05-02', '2078-05-01', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-05-02', 738, '2021-9-3', '2021-8-18', '2021-8-17', '2021-8-18', NULL),
(11, '2078-6-22', '30', '2078-06-22', '2078-06-22', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-06-22', 176, '2021-10-8', '2021-10-8', '2021-10-8', '2021-10-8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `napi_lagat_anuman`
--

CREATE TABLE `napi_lagat_anuman` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `main_work_name` text DEFAULT NULL,
  `total_evaluation` varchar(255) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `task_rate` double(15,2) NOT NULL,
  `total_rate` double(15,2) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `break_type` tinyint(1) NOT NULL,
  `sno` tinyint(3) NOT NULL,
  `period` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `napi_lagat_anuman`
--

INSERT INTO `napi_lagat_anuman` (`id`, `task_id`, `main_work_name`, `total_evaluation`, `unit_id`, `task_rate`, `total_rate`, `plan_id`, `break_type`, `sno`, `period`) VALUES
(4, 0, 'Earthwork in excavation for drain foundation', '12.00', 1, 91.53, 1098.36, 1, 1, 1, 1),
(5, 0, 'Stone soling work', '3.66', 2, 2207.58, 8074.44, 1, 1, 2, 1),
(6, 0, 'P.C.C.work', '20.00', 6, 1000.00, 20000.00, 1, 2, 3, 1),
(7, 0, 'REINFORCEMENT DETAIILS', '20.00', 6, 1000.00, 20000.00, 1, 2, 4, 1),
(8, 0, 'Side Formwork', '20.00', 6, 1000.00, 20000.00, 1, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `napi_lagat_anuman_break`
--

CREATE TABLE `napi_lagat_anuman_break` (
  `id` int(11) NOT NULL,
  `break_work_name` text DEFAULT NULL,
  `task_count` double(15,2) DEFAULT NULL,
  `length` double(15,2) DEFAULT NULL,
  `breadth` double(15,2) NOT NULL,
  `height` double(15,2) NOT NULL,
  `total_evaluation` varchar(255) DEFAULT NULL,
  `deduct_part` tinyint(4) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sno_taken` tinyint(3) NOT NULL,
  `break_no` tinyint(2) NOT NULL,
  `period` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `napi_lagat_anuman_break`
--

INSERT INTO `napi_lagat_anuman_break` (`id`, `break_work_name`, `task_count`, `length`, `breadth`, `height`, `total_evaluation`, `deduct_part`, `plan_id`, `sno_taken`, `break_no`, `period`) VALUES
(9, '', 1.00, 40.00, 1.00, 0.30, '12.00', 0, 1, 1, 0, 1),
(10, '', 1.00, 40.00, 0.46, 0.20, '3.66', 0, 1, 2, 0, 1),
(11, 'P.C.C.work(1:2:4) Bottom', 1.00, 40.00, 0.46, 0.10, '1.8288', 0, 1, 3, 1, 1),
(12, 'P.C.C.work(1:2:4) SIDE', 2.00, 40.00, 0.10, 0.46, '3.7161216', 0, 1, 3, 1, 1),
(13, '10 mm U BAR @ 150mm C/C Spacing', 268.00, 1.02, 0.62, 0.00, '168.81856', 0, 1, 4, 1, 1),
(14, '10mm distribution bar @150mm C/C spacing', 8.00, 40.00, 0.62, 0.00, '198.4', 0, 1, 4, 1, 1),
(15, '', 2.00, 50.00, 0.00, 12.00, '20.00', 0, 1, 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `napi_lagat_profile`
--

CREATE TABLE `napi_lagat_profile` (
  `id` int(11) NOT NULL,
  `date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `date_nepali` varchar(10) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `period` tinyint(2) NOT NULL,
  `sub_total` varchar(15) DEFAULT NULL,
  `antim` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `napi_lagat_profile`
--

INSERT INTO `napi_lagat_profile` (`id`, `date_english`, `date_nepali`, `plan_id`, `period`, `sub_total`, `antim`) VALUES
(2, '2021-9-28', '2078-06-12', 1, 1, '127328.28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plan_amount_withdraw_details`
--

CREATE TABLE `plan_amount_withdraw_details` (
  `id` int(11) NOT NULL,
  `get_qty` int(11) NOT NULL,
  `get_unit_id` int(11) NOT NULL,
  `plan_end_date` varchar(10) DEFAULT NULL,
  `plan_end_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date` varchar(250) DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `upabhokta_aproved_date` varchar(10) DEFAULT NULL,
  `upabhokta_aproved_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `expenditure_approved_date` varchar(10) DEFAULT NULL,
  `expenditure_approved_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_date` varchar(10) DEFAULT NULL,
  `plan_evaluated_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_amount` varchar(20) DEFAULT NULL,
  `final_payable_amount` varchar(20) DEFAULT NULL,
  `payment_till_now` varchar(20) DEFAULT NULL,
  `advance_payment` int(11) NOT NULL,
  `anudan_remaining_amount` varchar(20) DEFAULT NULL,
  `costumer_agreement` varchar(20) DEFAULT NULL,
  `remaining_payment_amount` varchar(20) DEFAULT NULL,
  `final_contengency_amount` varchar(20) DEFAULT NULL,
  `final_renovate_amount` varchar(20) DEFAULT NULL,
  `final_due_amount` varchar(20) DEFAULT NULL,
  `final_disaster_management_amount` varchar(20) DEFAULT NULL,
  `final_total_amount_deducted` varchar(20) DEFAULT NULL,
  `final_total_paid_amount` varchar(20) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `final_bhuktani_ghati_amount` varchar(50) DEFAULT NULL,
  `final_dpr_amount` double(15,2) NOT NULL,
  `aanya_nikaya` double(15,2) NOT NULL,
  `aanya_sajhedari` double(15,2) NOT NULL,
  `nagad_sajhedari` double(15,2) NOT NULL,
  `local_gov` double(15,2) NOT NULL,
  `janashramdhan` double(15,2) NOT NULL,
  `total_amount_without_con` double(15,2) NOT NULL,
  `bank_acc` varchar(255) DEFAULT NULL,
  `agreement_gauplaika_calc` float DEFAULT NULL,
  `agreement_other_calc` float DEFAULT NULL,
  `other_agreement_calc` float DEFAULT NULL,
  `customer_agreement_calc` float DEFAULT NULL,
  `chalani_no` varchar(255) DEFAULT NULL,
  `bank_lagat_date` varchar(255) DEFAULT NULL,
  `us_bank_name` varchar(255) DEFAULT NULL,
  `us_bank_acc` varchar(255) DEFAULT NULL,
  `other_kaifiyet` varchar(255) DEFAULT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `vat_amt` float DEFAULT NULL,
  `retention` float DEFAULT NULL,
  `tds` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_amount_withdraw_details`
--

INSERT INTO `plan_amount_withdraw_details` (`id`, `get_qty`, `get_unit_id`, `plan_end_date`, `plan_end_date_english`, `yojana_sakine_date`, `yojana_sakine_date_english`, `upabhokta_aproved_date`, `upabhokta_aproved_date_english`, `expenditure_approved_date`, `expenditure_approved_date_english`, `plan_evaluated_date`, `plan_evaluated_date_english`, `plan_evaluated_amount`, `final_payable_amount`, `payment_till_now`, `advance_payment`, `anudan_remaining_amount`, `costumer_agreement`, `remaining_payment_amount`, `final_contengency_amount`, `final_renovate_amount`, `final_due_amount`, `final_disaster_management_amount`, `final_total_amount_deducted`, `final_total_paid_amount`, `plan_id`, `created_date`, `created_date_english`, `final_bhuktani_ghati_amount`, `final_dpr_amount`, `aanya_nikaya`, `aanya_sajhedari`, `nagad_sajhedari`, `local_gov`, `janashramdhan`, `total_amount_without_con`, `bank_acc`, `agreement_gauplaika_calc`, `agreement_other_calc`, `other_agreement_calc`, `customer_agreement_calc`, `chalani_no`, `bank_lagat_date`, `us_bank_name`, `us_bank_acc`, `other_kaifiyet`, `doc_name`, `vat_amt`, `retention`, `tds`) VALUES
(29, 0, 0, '2078-06-04', '', '2078-06-06', '', '', '--', '', '--', '2078-05-31', '2021-9-16', '585000.00', '0', '0', 0, '', '', '', '15000.00', '', '', '', '', '475000.00', 65, '2078-5-31', '2021-9-16', '0.00', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0, '', '', '', '', 'fdgdfgfdgfdgfdg', 'cdvbcvb,fdg,fdg,fdgfdgfd,g,fd', NULL, NULL, NULL),
(36, 0, 0, '', '', '2078-06-22', '', '', '--', '', '--', '', '--', '280000.00', '235000', '0', 0, '', '', '', '6580.00', '4386.67', '', '', '10966.67', '208366.67', 176, '2078-6-22', '2021-10-8', '15196.67', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '                                ', 235000, 0, 0, 0, '', '2078-6-22', '', '', '', '', NULL, NULL, NULL),
(39, 0, 0, '', '', '', '', '', '--', '', '--', '', '--', '490000.00', '', '0', 0, '', '', '', '10000.00', '', '', '', '', '490000.00', 100, '2078-8-20', '2021-12-6', '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0, '', '', '', '', '', '', NULL, NULL, NULL),
(46, 0, 0, '', '', '2078-08-29', '', '', '--', '', '--', '', '--', '2025000.00', '0', '950980.39', 80000, '', '', '', '', '', '', '', '', '954656.86', 2, '2078-9-29', '2022-1-13', '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0, '', '', '', '', '', '', NULL, NULL, NULL),
(47, 0, 0, '', '', '2078-10-28', '', '', '--', '', '--', '', '--', '900000', '', '', 80000, '', '', '', '', '', '', '', '', '820000', 15, '2078-10-2', '2022-1-16', '-95000', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0, '', '', '', '', '', '', NULL, NULL, NULL),
(52, 0, 0, '', '', '2078-08-28', '', '', '--', '', '--', '', '--', '1696500', '', '', 0, '', '', '', '10000.00', '', '', '', '', '1813250', 12, '2078-10-3', '2022-1-17', '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0, '', '', '', '', '', '', 253500, 97500, 29250);

-- --------------------------------------------------------

--
-- Table structure for table `plan_details`
--

CREATE TABLE `plan_details` (
  `id` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `topic_area_agreement_id` int(11) NOT NULL,
  `topic_area_investment_id` int(11) NOT NULL,
  `topic_area_investment_source_id` int(11) NOT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `ward_no` varchar(255) DEFAULT NULL,
  `tole_name` varchar(255) DEFAULT NULL,
  `investment_amount` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plan_details1`
--

CREATE TABLE `plan_details1` (
  `id` int(15) NOT NULL,
  `fiscal_id` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `parishad_sno` text DEFAULT NULL,
  `sn` int(11) NOT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `topic_area_type_sub_id` int(11) NOT NULL,
  `topic_area_agreement_id` int(11) NOT NULL,
  `topic_area_investment_id` int(11) NOT NULL,
  `topic_area_investment_source_id` int(11) NOT NULL,
  `program_name` text DEFAULT NULL,
  `ward_no` varchar(11) DEFAULT NULL,
  `tole_name` varchar(255) DEFAULT NULL,
  `investment_amount` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `expenditure_type` int(11) NOT NULL,
  `first` varchar(255) DEFAULT NULL,
  `second` varchar(255) DEFAULT NULL,
  `third` varchar(255) DEFAULT NULL,
  `prev_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `rajpatra_no` varchar(255) DEFAULT NULL,
  `topic_no` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_details1`
--

INSERT INTO `plan_details1` (`id`, `fiscal_id`, `budget_id`, `parishad_sno`, `sn`, `topic_area_id`, `topic_area_type_id`, `topic_area_type_sub_id`, `topic_area_agreement_id`, `topic_area_investment_id`, `topic_area_investment_source_id`, `program_name`, `ward_no`, `tole_name`, `investment_amount`, `type`, `expenditure_type`, `first`, `second`, `third`, `prev_id`, `status`, `rajpatra_no`, `topic_no`, `qty`) VALUES
(1, 1, 10, '५०-५० साझेदारी क्रमागत', 0, 2, 10, 24, 5, 1, 0, 'सुन्दर वस्तिमा ढल तथा बाटो निर्माण', '1', NULL, 500000, 0, 1, '500000', '0', '0', 0, 0, '102', '32000', 1),
(2, 1, 22, '५०/५० साझेदारी क्रमागत', 0, 18, 18, 130, 5, 7, 0, 'सामुदायिक सभाहल  निर्माण', '1', NULL, 2000000, 0, 1, '2000000', '0', '0', 0, 0, '', '', 1),
(3, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 2, 0, 'रमाईलो डाँडा साङ्लामा बाटो ढलान तथा खानेपानी विस्तार', '1', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '', '', 1),
(4, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'उज्यालो सडक खण्डमा ढलान तथा बाटो निर्माण', '1', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '', 1),
(5, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'महादेवस्थान मन्दिरबाट वालकुमारी पुल जोड्ने बाटो ढलान', '1', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', NULL, 1),
(6, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'मालुङ्ग जाने सडक ढलान', '1', NULL, 1850000, 0, 0, '0', '0', '1850000', 0, 0, '', NULL, 1),
(9, 1, 16, 'नगर स्तरीय', 0, 18, 6, 19, 8, 1, 0, 'नयावस्ती आनन्दटोल सडक निर्माण तथा स्तरोत्रती', '0', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', NULL, 1),
(10, 1, 16, 'नगर स्तरीय', 0, 18, 6, 128, 8, 1, 0, 'काभ्रेस्थली स्कुल हुदै भ्याली पुल सडक निर्माण', '0', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '', 1),
(11, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'प्रेम बहादुर तामाङ्को टहरादेखी कमानसिह थापा मगरको घरसम्मको १३ फी कच्चिमोटरबाटोमा ढल व्यवस्थापन  तथा बाटो मर्मत', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', NULL, 1),
(12, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'संगम चोक  घट्टेखोला स्वर्णीम चोक सडक निर्माण', '2', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', NULL, 1),
(13, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'संगम वस्तिमा ढल ढलान र खानेपानि लाईन व्यवस्थापन', '2', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(14, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'लोलाङ्ग स्थित नमुना बस्ती मार्गको बाटो स्तरोन्नति तथा ढलान', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', NULL, 1),
(15, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'नमुना बस्तीमा बाटो ढलान', '4', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(16, 1, 16, 'नगर स्तरीय', 0, 18, 6, 19, 8, 1, 0, 'खड्का भर्यांगबाट काभ्रेस्थली जाने सडक', '0', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', NULL, 1),
(17, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'फुलबारी टोलमा ढल निकास', '4', NULL, 350000, 1, 0, '0', '0', '750000', 0, 0, '', '', 1),
(18, 1, 16, 'नगर स्तरीय', 0, 18, 6, 43, 8, 1, 0, 'खड्गेश्वर मन्दिरदेखि महादेव खोलासम्म सडक स्तरीकरण', '6', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', NULL, 1),
(19, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, '“लक्ष्मीटोल भित्र वाटो ढलान”', '4', NULL, 1800000, 0, 0, '0', '0', '1800000', 0, 0, '', NULL, 1),
(20, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, '४र५ को सिमानामा रहेको कमेरेखोला सडक देखी नागेश्वर मार्ग गेट सम्मको मूल बाटो ढलान', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', NULL, 1),
(21, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'देविस्थान रमाइलो बस्ति समितिको भित्रि बाटो ढलान', '5', NULL, 700000, 1, 1, '0', '0', '700000', 0, 0, '', '', 1),
(22, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'फुलवारी गेट नागार्जुन मा वि सडक खण्डको एस एस हार्डवयर अगाडि हुदै भित्रि सडक निर्माण', '5', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', NULL, 1),
(23, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'नागार्जुन चेतन नगरको भित्रि बाटो निर्माण', '5', NULL, 750000, 0, 0, '0', '0', '750000', 0, 0, '', NULL, 1),
(24, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'दिगो  बिकाश टोलमा ढल तथा बाटो ढलान', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', NULL, 1),
(25, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'बैखु ठाडो सहायक तेर्सो बाटोको बिच बाटो स्तरोन्नति', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', NULL, 1),
(26, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'सरस्वति टोलमा ढल तथा सडक निर्माण', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', NULL, 1),
(27, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'अर्यालटार नया वस्तिटोलको  बाटो निर्माण', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(28, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'एकता बस्ति टोलका बाटो निर्माण', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', NULL, 1),
(29, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'गुठ पृथ्वी नारायण मा. वि ढल तथा बाटो निर्माण', '5', NULL, 750000, 0, 0, '0', '0', '750000', 0, 0, '', NULL, 1),
(30, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'पृथ्वी नारायण सडक खण्ड भित्र रहेको  पृथ्वी नारायण मा .वि देखि खोला जाने बाटोमा ढल निर्माण', '5', NULL, 2400000, 0, 0, '0', '0', '2400000', 0, 0, '', NULL, 1),
(31, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'विहानी बस्तिमा ढल व्यवस्थापन', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(32, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'बैखु ठाडोबाटो निर्माण समितिमा ढल निर्माण', '5', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', NULL, 1),
(33, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'अर्यालटार नागर्जुन बाटो खण्डको टार बस्तीको सडक निर्माण', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', NULL, 1),
(34, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'चिसापानी आयटारमा  ढल तथा खानेपानीको पाइप बिच्छाउने कार्य', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', NULL, 1),
(35, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'बानिया गाँउको ढल ब्यवस्थापन', '6', NULL, 1200000, 0, 0, '0', '0', '1200000', 0, 0, '', NULL, 1),
(36, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'चिसापानी नयाँवस्ति टोलमा खानेपानी ढल र ग्रावेल', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', NULL, 1),
(37, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'धर्मस्थली कोलोनि समाज', '6', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', NULL, 1),
(38, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'बस्नेतटार उकालो बाटो ढलान , ढल निर्माण', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', NULL, 1),
(39, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'हलेशी मार्ग ढल निर्माण  (सुर्योदय टोल ढल निर्माण)', '6', NULL, 1500000, 0, 1, '0', '0', '1500000', 0, 0, '', '', 1),
(40, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'कुमाली टोलको देउथलीवाट कोरीयन अस्पतालसम्म वाटो सुधार र व्यवस्थापन', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', NULL, 1),
(41, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'बस्नेतटार कमेरेखोला घिमिरे गाउ जाने वाटो डिमार्केशन', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', NULL, 1),
(42, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'केशव श्रेष्ठको घरदेखी तेजश्वि एकेडेमी जाने सडक निर्माण', '7', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(43, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'लक्ष्मीटार टोलमा ढल तथा ग्रावेल', '7', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(44, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'खत्री टोल चिम्बर पोखरी बस्ती विकास', '7', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(45, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'संगम फाटको सोर फिटे बाटो जोड्ने गल्ली ढलान', '7', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', NULL, 1),
(46, 1, 22, '५०-५० साझेदारी क्रमागत', 0, 18, 6, 19, 5, 7, 0, 'ग्याडोल टोलको बाटो ढलान र वाल निर्माण', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', NULL, 1),
(47, 1, 22, 'मर्मत सम्भार  क्रमागत', 0, 18, 18, 52, 5, 6, 0, 'वडा नं ५ वडा कार्यालय भवन (मर्मत क्रमागत)', '5', NULL, 215000, 0, 1, '0', '0', '215000', 0, 0, '111', '201', 1),
(48, 1, 19, 'मर्मत सम्भार', 0, 18, 6, 19, 5, 6, 0, 'भैरव खानेपानी तथा सरसफाई उपभोक्ता समिति सडक निर्माण (मर्मत सम्भार क्रमागत)', '7', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '201', '222', 1),
(49, 1, 19, 'अन्य क्रमागत', 0, 19, 21, 195, 7, 6, 0, 'कृषि सम्बन्धि कार्यक्रम (सिंचाई) क्रमागत', '1', NULL, 300000, 0, 1, '0', '0', '300000', 0, 0, '0', '0', 1),
(50, 1, 19, 'नगर स्थरिय', 0, 20, 64, 2, 5, 6, 0, 'बालबालिका सम्बन्धी खेलकुद', '1', NULL, 100000, 1, 2, '0', '0', '100000', 0, 0, '', '', 1),
(51, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'छाप सामुदायिक भवन रेलिंग', '1', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '', 1),
(52, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'देवस्थली मन्दिर निर्माण क्रमागत', '2', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(53, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'रक्षादेवी मन्दिर निर्माण क्रमागत', '2', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(55, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'कोईराले खोला देखि नवराजको घर सम्म खानेपानी ट्रंक लाईन विस्तार', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(56, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'कुवा मर्मत तथा खानेपानी व्यवस्थापन', '2', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(57, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'खानेपानी व्यवस्थापन', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(58, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'बानियाँ टोल भित्री बाटो ढल निर्माण', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(61, 1, 19, 'नगर स्थरिय', 0, 18, 18, 130, 5, 6, 0, 'शहरी स्वास्थ्य केन्द्र माथि ट्रस निर्माण', '9', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '', 1),
(62, 1, 19, 'नगर स्थरिय', 0, 18, 6, 19, 0, 6, 0, 'मनमैजु गणेस्थान मन्दिरमा ढुङ्गा राख्ने', '9', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(64, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'सांग्ला बजार थापाटोल सडक', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(65, 1, 19, 'नगर सभा', 0, 18, 15, 87, 5, 6, 0, 'अकवरेश्वर एैतिहासिक मन्दिर संरक्षण तथा पौवा निर्माण', '3', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '', 1),
(66, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'पहेलबित्ती खानेपानी मर्मत तथा श्रोत संरक्षण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(67, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'कालिदेवी मन्दिर संरक्षण', '3', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '', 1),
(68, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'रेग्मीटोल बाटो', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(69, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'आठमाईल नागार्जुन मा.वि. जाने मोटर बाटो मर्मत', '3', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(70, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'देवीस्थान भ्यूटावर सिढी बाटो निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(71, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'डान्सफमरदेखि मुक्तेश्वर मन्दिर हुदै ठुलोधारो अधुरो सिंढी निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(72, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'अर्याल गाउंदेखि बदेली चौर सम्मको मोटर बाटो स्तरोन्नती', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(73, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'देवकोटा दाहाल टोल बाटो निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(74, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'विश्वकर्मा टोल खा.पा मर्मत तथा श्रोत संरक्षण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(75, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'बैखुपुरानो ठाडो बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(76, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'नागार्जुन मा.बि. बैखु सडक', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(77, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'सार्वजनिक निर्माण तथा व्यवस्थापन', '5', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(78, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'सूर्यदय टोल वाटो निर्माण', '6', NULL, 500000, 0, 1, '', '500000', '', 0, 0, '', '', 1),
(79, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'लाछीको पाटी मर्मत सुधार', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(80, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'पैयाटार गणेश मन्दिर मर्मत', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(81, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'मिलीजुली टोलमा बाटो निर्माण', '9', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(82, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'अजिमा पार्क निर्माण', '9', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(83, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'नविन नगर सडक पिच तथा मर्मत', '9', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(84, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'सार्वजनिक सम्पत्ति संरक्षण', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(85, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'ऐर्श्वयनगर टोलमा बाटो स्तरोन्नति', '10', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(86, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'हिलेडोल हाइट बाटो स्तरोन्नती र ब्लक विच्छ्याउने', '10', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(87, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 6, 0, 'रामबाबाको घर देवी गणेश थापाको घर सम्म बाटो ढलान', '11', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '', 1),
(88, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'मर्मत तथा संभार र विपद् व्यवस्थापन', '1', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(89, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'सडक पूर्वाधार विपद् व्यवस्थापन तथा अन्य मर्मत सुधार', '2', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '', 1),
(90, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'विपद् व्यववस्थापन', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(91, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'गौरीगाउं सिंचाई कुलो तथा नहर निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(92, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'खानेपानी श्रोत मर्मत', '3', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(93, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'सडक मर्मत कोष', '3', NULL, 550000, 0, 0, '0', '0', '550000', 0, 0, '', '', 1),
(94, 1, 19, 'नगर सभा', 0, 18, 7, 62, 5, 6, 0, 'उज्यालो वडा कार्यक्रम', '3', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '', 1),
(95, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'आधारभूत स्कुल शैक्षिक सुधार कार्यक्रम', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(96, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'धर्मस्थली कोलोनी बाटो सोलिङ्ग', '6', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(97, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'पुसल नारायण मन्दिर अधुरो वाल', '6', NULL, 250000, 0, 0, '0', '0', '250000', 0, 0, '', '', 1),
(98, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'जोर गणेश टोल उपभोक्ता समिति', '6', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '', 1),
(99, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'सार्वजनिक निर्माण तथा व्यवस्थापन / साना अधुरा योजना', '11', NULL, 1141000, 0, 0, '0', '0', '1141000', 0, 0, '', '', 1),
(100, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 6, 0, 'मर्मत सम्भार', '10', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(101, 1, 19, 'नगर सभा', 0, 22, 39, 189, 5, 6, 0, 'वडा कार्यालय व्यवस्थापन र सूचना प्रविधि कार्यक्रम', '5', NULL, 200000, 0, 1, '0', '0', '200000', 0, 0, '', '', 1),
(102, 1, 19, 'नगर सभा', 0, 18, 18, 69, 5, 6, 0, 'सार्वजनिक संरचना निर्माण तथा व्यवस्थापन', '7', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '', 1),
(103, 1, 19, 'नगर सभा', 0, 18, 7, 62, 5, 6, 0, 'वडाका मुख्य मुख्य बाटोहरुमा सेन्सर/स्मार्ट बत्ती जडान', '10', NULL, 160000, 0, 1, '0', '0', '160000', 0, 0, '', '', 1),
(104, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'भण्डारी गाउँ बञ्चरे खोलामा ढल निकासा गर्न ह्ययुम पाइप विच्छाउने र ग्राभेल समेतको कार्य', '2', NULL, 250000, 0, 0, '0', '0', '250000', 0, 0, '', '', 1),
(105, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'दलकापचोक देखि ज्ञानोदय स्कुल हुँदै खानेपानी ट्याङ्ककी सम्म मोटर बाटो निर्माण', '2', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(106, 1, 19, 'नगर सभा', 0, 23, 39, 189, 5, 6, 0, 'वडा कार्यालय व्यवस्थापन', '2', NULL, 300000, 1, 2, '0', '0', '300000', 0, 0, '', '', 1),
(107, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'जेष्ठ नागरिक/ मिलन चौतारी', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(108, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'खडुवालकोट एकिकृत खानेपानी व्यवस्थापन (१ घर १ धारा निती अनुरुप)', '3', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(109, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'खानेपानी मुल तथा श्रोत मर्मत कोष', '3', NULL, 230000, 0, 0, '0', '0', '230000', 0, 0, '', '', 1),
(110, 1, 22, 'नगर सभा', 0, 23, 6, 19, 5, 6, 0, 'मुल तथा सहायक बाटो मर्मत कोष   खडुवाल  तल्लाेटाेल बाटाे निमार्णा  वडा कार्यालयकाे  मिति  2078-2-28 काे  निर्णयानुसार', '3', NULL, 200000, 0, 1, '0', '0', '200000', 0, 0, '', '', 1),
(111, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'पाँचमाने अर्यालगाउँ हुँदै बदेली जाने मोटरबाटो स्तरोन्नती तथा ग्राभेल विछ्याउने काम', '3', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(112, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'खानेपानी मुल तथा श्रोत मर्मत कोष', '3', NULL, 170000, 0, 0, '0', '0', '170000', 0, 0, '', '', 1),
(113, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'किसन्डोल एकीकृत खानेपानी व्यवस्थापन  (१ घर १ धारा निती अनुरुप)', '3', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(114, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, '२ नं पुल ठुलागाउँ खानेपानी योजना', '3', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(115, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'कुलाबाझ पांचमाने जाने मोटर बाटो', '3', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(116, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'देवकोटा टोल सडक निर्माण वडा समितिको', '3', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(117, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'वातावरण सरसफाई', '4', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(118, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'लोलाङ हार्इट ६ल सुधार अन्तर्गत बाटो स्तरोन्नती', '4', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(119, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'नारायण मन्दिर पुसल', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(120, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'नारायण मन्दिर सिंढी निर्माण', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(121, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'गणेश मन्दिर परिसर, जरंखु', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(122, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'सुर्यदर्शन टोलको बाटोमा ढल तथा ढलान', '2', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(123, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'सानोपुल कोरीडोर जानेबाटो', '', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(124, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'वडा नं. ४ - ५ को  सडकमा लाइनिङ थर्मोप्लास्ट रंगरोगन कार्य', '', NULL, 1400000, 0, 0, '0', '0', '1400000', 0, 0, '', '', 1),
(125, 1, 19, 'नगर सभा', 0, 23, 15, 87, 5, 6, 0, 'पांचमाने परिसर मर्मत तथा संरक्षण', '3', NULL, 2600000, 0, 1, '0', '0', '2600000', 0, 0, '', '', 1),
(126, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'कोइराला खोला शिर्षक योजना', '', NULL, 1185000, 0, 0, '0', '0', '1185000', 0, 0, '', '', 1),
(127, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'बिचारीथोक पुल विग्स तथा टेवा वाल निर्माण', '', NULL, 4500000, 0, 0, '0', '0', '4500000', 0, 0, '', '', 1),
(128, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'बिहानीचोकसडक सडकमा ग्राभेलिड्ड तथा वाल निर्माण', '', NULL, 1250000, 0, 0, '0', '0', '1250000', 0, 0, '', '', 1),
(129, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'नयाँवस्ती लामवगर उपभोक्ता मञ्च भित्र सडक सतरोन्नती तथा ढल व्यवस्थापन', '', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(130, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'सुधार केन्द्र सँगैको पर्खाल निर्माण', '1', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(131, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'कमेरेखोला वाल निर्माण (सम्पूर्ण निवासदेखि गोपालको घर हुदैं दिनेश श्रेष्ठको घर जानेतर्फ)', '4', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(132, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'घट्टे गणेश वाटो मर्मत तथा शौचालय निर्माण योजना', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(133, 1, 19, 'नगर सभा', 0, 23, 6, 0, 5, 6, 0, 'धितालथोक दाहालथोक जाने वाटो निर्माण', '5', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '', '', 1),
(134, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'धर्म विद्याश्रमवाट चोगाउ जाने सडक निर्माण', '6', NULL, 3800000, 0, 0, '0', '0', '3800000', 0, 0, '', '', 1),
(135, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 6, 0, 'सुन्दर वस्ती वाटो निर्माण', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(136, 1, 19, 'नगर सभा', 0, 23, 0, 0, 5, 3, 0, 'क्रमागत अन्य योजना तथा कार्यक्रम', '', NULL, 11800000, 0, 0, '0', '0', '11800000', 0, 0, '', '', 1),
(137, 1, 19, 'वडा - २५००००० नगर ५०००००', 0, 18, 6, 19, 5, 3, 0, 'साङ्ले खोला पुल तथा कल्भर्ट निर्माण', '1', NULL, 3000000, 0, 1, '0', '0', '3000000', 0, 0, '', '', 1),
(138, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'खेलकुद मैदानमा वाल निर्माण', '1', NULL, 1600000, 0, 0, '0', '0', '1600000', 0, 0, '', '', 1),
(139, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'साङ्ला छेकोटे कालिमाटी खोल्सा दोबाटो झोर सिमाना मोटर बाटोमा डिमार्केसन र ग्रावेल', '1', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(140, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'देवीस्थान जाने बाटो स्तरोन्नती', '2', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(141, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'फुलबारी गेट, उकालो बाटो निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(142, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'हरियाली समाजमा वाटो स्तरोन्नती', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(143, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'गोलढुङ्गा खेलकुद ग्राउण्डको बाटो संरक्षण', '5', NULL, 6000000, 0, 0, '0', '0', '6000000', 0, 0, '', '', 1),
(144, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'पृथ्वीनारायणा स्कुलदेखि धितालथोक ढल व्यवस्थापन', '5', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '', 1),
(145, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'गोलढुङ्गा साहित्य परिषद भवन संरक्षण', '5', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(146, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'पृथ्वीनारायणा स्कुलदेखि धितालथोक जाने सडक टेवा पर्खाल तथा सडक स्तरोन्नती', '5', NULL, 7500000, 0, 0, '0', '0', '7500000', 0, 0, '', '', 1),
(147, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'झयाङपोल खानेपानी ट्याङ्की निर्माण', '5', NULL, 800000, 0, 1, '0', '0', '800000', 0, 0, '', '', 1),
(148, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'धर्मस्थली हरि बहादुर बस्नेतको घरमुनिको पहिरो नियन्त्रण', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(149, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'Helping hands भवन सुधार तथा परिसर संरक्षण', '6', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '', 1),
(150, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'टौसीमा  ढुंगाको वाल निर्माण', '6', NULL, 592000, 0, 0, '0', '0', '592000', 0, 0, '', '', 1),
(151, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'सनफ्लावर स्कुलदेखि फलामेपुल सम्मको बाटोमा वाल निर्माण', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(152, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'बस्नेतटार महाङ्काल सडक', '6', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(153, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'नगरपालिकाको अगाडीको पार्क संरक्षण र सुधार', '6', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(154, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'तिमिल्सिना बस्ती खानेपानी ट्यांकी निर्माण', '6', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '', 1),
(155, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'फुटुङ्को ढल कोरीडोरको  वाल सम्म पुर्याउने कार्य', '7', NULL, 350000, 0, 0, '0', '0', '350000', 0, 0, '', '', 1),
(156, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'मुलबाटोबाट कार्कीथोक जाने सडक', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(157, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'थापागाउँ देखी नागपोखरी सम्मको साईड ड्रेन वाल निर्माण', '7', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(158, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'मनमैजु बजारमा ईट्टा सोलिंग', '9', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(159, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'न्यौपानेको पसल नजिक लक्ष्मण डंगोलको घर छेउको मुल सडकमा पहिरो नियन्त्रण', '9', NULL, 160000, 0, 0, '0', '0', '160000', 0, 0, '', '', 1),
(160, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'शिवनगर टोलको घलेपुल नजिक रहेको विजुलीको पोल संरक्षणका लागी वाल निर्माण', '10', NULL, 480000, 0, 0, '0', '0', '480000', 0, 0, '', '', 1),
(161, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'नवराजको घरदेखी मिना थापाको घर सम्मको वाल निर्माण', '10', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '', 1),
(162, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'ढलान ड्रेन मर्मत, पिच तथा गोरेटो बाटोमा ब्लक छाप्ने कार्य', '१० र ११', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(163, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'थुम्की बृहत खानेपानी आयोजनालार्इ इन्टेक र ट्यांकी संरक्षण गर्ने कार्यको लागी', '', NULL, 290000, 0, 0, '0', '0', '290000', 0, 0, '', '', 1),
(164, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'थुम्की टोलमा रहेको  लामिडाँडा मोटरबाटोमा वाल लगाउने कार्य', '', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '', 1),
(165, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'बोहरा पुलको पुर्व पश्चिम तर्फको टेवा पर्खाल तथा सडक स्तरोन्नती', '11', NULL, 2555000, 0, 0, '0', '0', '2555000', 0, 0, '', '', 1),
(166, 1, 19, 'नगर सभा', 0, 22, 20, 171, 5, 3, 0, 'ट्राफिक व्यवस्थापन', '0', NULL, 1000000, 0, 1, '1000000', '0', '', 0, 0, '', '', 1),
(167, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'सामुदायिक प्रहरी तथा चौकी भवन निर्माण', '11', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '', '', 1),
(168, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'विष्णुमति करिडोर संरक्षणको लागी पर्खाल निर्माण', '11', NULL, 140000, 0, 0, '0', '0', '140000', 0, 0, '', '', 1),
(169, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'चिसापानी हरियाटार कृषि सडक', '', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(170, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'तीनपिप्ले ठुला गाऊँ कृषि सडक', '', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(171, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'लामवगर महादेव मन्दिर परिसरमा पार्क निर्माण', '', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(172, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'प्रशंसा टोल सुधार समितिमा जोडिएको साङ्गले खोला कोरिडोर (ढुंगाको वाल निर्माण)', '', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(173, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'वडा नं २ र ६ जोड्ने तिरतिरे खोलामा पुल निर्माण', '', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '', 1),
(174, 1, 19, 'नगर सभा', 0, 18, 6, 19, 5, 3, 0, 'सार्वजनिक जग्गामा पार्क निर्माण', '', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(175, 1, 19, 'नगर सभा', 0, 18, 14, 80, 5, 3, 0, 'मृर्गौला डाईलोसिस सेन्टर सञ्चालानार्थ (डाईलोसिस मेशिन र यस.एस.जी. मेशिन खरिद) तथा नगर हस्पिटल', '10', NULL, 22500000, 0, 1, '0', '022500000', '0', 0, 0, '', '', 1),
(176, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 3, 0, 'ग्राम सेवा मा. वि.', '6', NULL, 235000, 0, 0, '0', '0', '235000', 0, 0, '', '', 1),
(177, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 3, 0, 'फुटुङ्ग मा.वि. (फुटुंग माविमा कक्षा कोठा थप काम भौतिक तथा शैक्षिक सुधार कार्यक्रम)', '7', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(178, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 3, 0, 'ग्रामिण आदर्श ब. क्याम्पस (सामुदायिक कलेज उच्च मा.वि.हरुका लागी भौतिक तथा शैक्षिक सुधार कार्यक्रम)', '11', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(179, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'काभ्रेस्थली स्वास्थ्य भवन निर्माण', '2', NULL, 1800000, 0, 0, '0', '0', '1800000', 0, 0, '', '', 1),
(180, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 3, 0, 'जितपुर माध्यामिक विधालय भौतिक सुधार', '3', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '', '', 1),
(181, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 3, 0, 'जितपुर बहुमुखी क्याम्पस', '3', NULL, 1700000, 0, 1, '0', '0', '1700000', 0, 0, '', '', 1),
(182, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'वडा नं ३ भवन निर्माण मर्मत सुधार', '3', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(183, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, ' वडा कार्यालय भवन निर्माण', '10', NULL, 6000000, 0, 1, '0', '0', '6000000', 0, 0, '', '', 1),
(184, 1, 22, 'नगर सभा', 0, 18, 6, 43, 5, 3, 0, 'सरस्वती टोल वडा नं ४ मा सडक स्तरोन्नती', '4', NULL, 2000000, 0, 1, '0', '2000000', '0', 0, 0, '', '', 1),
(185, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'मुड्खु भन्ज्यांग बहुउद्धेश्यीय भवन निर्माण', '5', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(186, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'सामुदायिक भवन निर्माण', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(187, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'श्री नमुनानगर टोल सुधार समिति', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(188, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'शुभकामना चोक गणेश मन्दिर चिउरामिल मनमैजु (कार्यालयको ३० % म्याचिङ्ग फन्ट बाट २०,५६,१४२।०० नगरपालिकाले व्यहोरिने) ६८,५७,१४२।८० मध्ये) (उपभोक्ता समिति मार्फत)', '0', NULL, 3284000, 0, 0, '0', '0', '3284000', 0, 0, '', '', 1),
(189, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R2/077/078 बोहराटार नागार्जुन मा.वि सडक निर्माण', '0', NULL, 15000000, 0, 0, '0', '0', '15000000', 0, 0, '', '', 1),
(190, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R3/077/078 नयाँ गणेश फुलवारी गेट नागार्जुन मा.वि फुयालथोक बिचारीथोक पुल निर्माण', '0', NULL, 3923000, 0, 0, '0', '0', '3923000', 0, 0, '', '', 1),
(191, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R4/077/078  संगमचोक कोईराला खोला बिहानिचोक निउरेखोला पुल सडक निर्माण', '0', NULL, 6000000, 0, 0, '0', '0', '6000000', 0, 0, '', '', 1),
(192, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R5/077/078 सानोपुल बोहराटार धितालथोक लोलाङ हाईट रोड', '0', NULL, 9400000, 0, 0, '0', '0', '9400000', 0, 0, '', '', 1),
(193, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R6/077/078 बिहानिचोक छाप सडक', '0', NULL, 2750000, 0, 0, '0', '0', '2750000', 0, 0, '', '', 1),
(194, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R8/077/078 चिसापानि तिनपिप्ले सडक', '0', NULL, 31700000, 0, 0, '0', '0', '31700000', 0, 0, '', '', 1),
(195, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R9/077/078 नेपालटार फुटुङ साङ्ला  सडक', '0', NULL, 19434000, 0, 0, '0', '0', '19434000', 0, 0, '', '', 1),
(196, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R10/077/078 काभ्रेस्थली साङ्ला विहानी चोक सडक', '0', NULL, 8400000, 0, 0, '0', '0', '8400000', 0, 0, '', '', 1),
(197, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R11/077/078 ठुलो ईनार मनमैजु मन्दिर सडक कालोपत्रे कार्य', '0', NULL, 5900000, 0, 0, '0', '0', '5900000', 0, 0, '', '', 1),
(198, 1, 19, 'नगर सभा', 0, 18, 19, 30, 5, 4, 0, 'Tarkeshwor/ R12/077/078 भ्यु टावर खानेपाजी ट्याङ्मी निर्माण', '0', NULL, 4500000, 0, 1, '0', '0', '4500000', 0, 0, '', '', 1),
(199, 1, 19, 'नगर सभा', 0, 18, 22, 112, 5, 4, 0, 'Tarkeshwor/ R13/077/078 राष्टिय झण्डा पार्क निर्माण', '0', NULL, 10000000, 0, 1, '0', '0', '10000000', 0, 0, '', '', 1),
(200, 1, 19, 'नगर सभा', 0, 18, 22, 118, 5, 4, 0, 'Tarkeshwor/ R14/077/078 भ्युटवार संरक्षण तथा पार्क निर्माण', '0', NULL, 10000000, 0, 1, '0', '0', '10000000', 0, 0, '', '', 1),
(201, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R15/077/078 ग्याडोल कालोट्याङ्की मनमैजु फुटुङ नागपोखरी सडक', '0', NULL, 8477000, 0, 0, '0', '0', '8477000', 0, 0, '', '', 1),
(202, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R16/077/078 नेपालटार फुटुङ साङ्ला सडक दोस्रो चरण', '0', NULL, 14200000, 0, 0, '0', '0', '14200000', 0, 0, '', '', 1),
(203, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarkeshwor/ R17/077/078 जरङ्खु चिसापानी तिनपिप्ले सडक द्रोस्रो चरण', '0', NULL, 16426000, 0, 0, '0', '0', '16426000', 0, 0, '', '', 1),
(204, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tara/SQ1/077/078 तारकेश्वर न.पा.का विभिन्न सडकहरूको लागि ग्राभेलिंग गर्ने कार्य', '0', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(205, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tara/SQ2/077/078 तारकेश्वर न.पा.का विभिन्न सडकहरूको लागि ग्राभेलिंग गर्ने कार्य', '0', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(206, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 4, 0, 'Tarakeshwor/R1-B/01/075-076, जरंखुदेखि चिसापानी हुदैं तीनपिप्ले सडक कालोपत्रे तथा स्तरोन्नति, स्ल्याब कल्भर्ट निर्माण गर्ने कार्य', '0', NULL, 7400000, 0, 0, '0', '0', '7400000', 0, 0, '', '', 1),
(207, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'टौसी फाँटको सिँचाई', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(208, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'खुलालटार मची खोल्चामा ढल व्यवस्थापन', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(209, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'कुञ्चिप्वाकल स्वास्थ्य चौकीको भूक्ष्य नियन्त्रण', '1', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(210, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'शान्तिधाम जाने बाटोको भूक्ष्य नियन्त्रण', '2', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(211, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'कमेरेखोला (लामाचौर सम्पूर्णको घर) नदी नियन्त्रण', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(212, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'कमेरेखोला सुनौलो बस्ती बाटोको भूक्ष्य नियन्त्रण', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(213, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'विन्दावासिनी चोक/अच्युतको घर सम्मको सडकको भू संरक्षण', '6', NULL, 735000, 0, 0, '0', '0', '735000', 0, 0, '', '', 1),
(214, 1, 19, 'नगर सभा', 0, 21, 29, 145, 5, 3, 0, 'सनफ्लावर स्कुल/महादेवखोला करिडोर स्त्तरोन्नती', '6', NULL, 200000, 0, 1, '0', '0', '200000', 0, 0, '', '', 1),
(215, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'विष्णुमति करिडोर स्तरोन्नती', '10', NULL, 4000000, 0, 0, '0', '0', '4000000', 0, 0, '', '', 1),
(216, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'वडा कार्यालयको भूक्ष्य नियन्त्रण', '1', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(217, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'न्युरे खोला भू संरक्षण', '1', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(218, 1, 19, 'नगर सभा', 0, 18, 9, 91, 5, 3, 0, 'गुप्तेश्वर महादेव मन्दिरको भू संरक्षण', '6', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '', 1),
(219, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'ठुलोधारो खानेपानी मर्मत', '0', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(220, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'देबकोटा टोल र ढकाल टोलको खानेपानी मर्मत तथा पाईप विस्तार', '0', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(221, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'साङ्गला खानेपानी ट्याङ्की निर्माण', '0', NULL, 1400000, 0, 0, '0', '0', '1400000', 0, 0, '', '', 1),
(222, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'फुयालथोक टोलमा खानेपानी व्यवस्थापन', '0', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(223, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'कुमालटार खानेपानी मर्मत तथा बिस्तार', '0', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(224, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'हिलेडोल हाईट खानेपानी व्यवस्थापन', '0', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(225, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'परियारटोल खानेपानी ट्याङ्की निर्माण तथा पाईप बिस्तार', '0', NULL, 750000, 0, 0, '0', '0', '750000', 0, 0, '', '', 1),
(226, 1, 19, 'नगर सभा', 0, 18, 10, 29, 5, 3, 0, 'खानेपानी ट्याङ्की निर्माण तथा पाईप बिस्तार', '0', NULL, 450000, 0, 0, '0', '0', '450000', 0, 0, '', '', 1),
(227, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 3, 0, 'खेलाचौरको पहिरो नियन्त्रण', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(228, 1, 19, 'नगर सभा', 0, 21, 26, 143, 5, 3, 0, 'प्रसन्न खड्गीको घर नजिकको पहिरो नियन्त्रण', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(229, 1, 19, 'नगर सभा', 0, 20, 15, 27, 5, 3, 0, 'पाँचकन्या मन्दिर संरक्षण', '3', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '', 1),
(230, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'पृकुन भैरव मन्दिर मर्मत संरक्षण', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(231, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'वंगलामुखि मन्दिर संरक्षण समिति', '6', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(232, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'विश्वनाथ महादेव मन्दिर व्यवस्थापन समिति', '8', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(233, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'कृष्ण प्रणामी मन्दिर निर्माण', '5', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(234, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'सिद्धि गणेश मन्दिर स्थानान्तरण', '11', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(235, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'पुष्प नारायण मन्दिर संरक्षण', '6', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '', 1),
(236, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'आशापुरी (बुढाथोकी टोल) महादेव मन्दिर संरक्षण तथा सुधार', '7', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '', 1),
(237, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'सिलाफल धर्मस्थलीको विन्ध्यावासिनी मन्दिर संरक्षण', '6', NULL, 900000, 0, 0, '0', '0', '900000', 0, 0, '', '', 1),
(238, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'धितालचोक देखि गाउँ जाने बाटोको पहिरो नियन्त्रण', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(239, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'कान्छा दमाईको घर नजिकको पहिरो नियन्त्रण', '5', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(240, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'पार्वती परियारको घर मुनिको पहिरो नियन्त्रण', '5', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(241, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'लक्ष्मी दमिनीको घर अगाडिको पहिरो नियन्त्रण', '9', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(242, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'ईन्द्रायणी गुठी तथा बस्ती जाने सडक संरक्षण', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(243, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'फिरफिरे डाँडा मुनिको बस्ती संरक्षण', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(244, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'सोमनाथ लामिछानेको घर मुनिको पहिरो नियन्त्रण', '5', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(245, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'जरंकु हाईटको राजकुलो संरक्षण', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(246, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'प्रशंशा टोल जाने पुल संरक्षण', '6', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '', 1),
(247, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'देव कुमारी भट्टको घर नजिकको पहिरो संरक्षण', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 1),
(248, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'शुष्मा खड्गीको घर नजिकको पहिरो नियन्त्रण', '2', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '', 1),
(249, 1, 19, 'नगर सभा', 0, 21, 41, 21, 5, 3, 0, 'मुड्खु भञ्ज्याङ आचार्यटोलको पहिरो नियन्त्रण', '5', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '', 1),
(250, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 3, 0, 'मिलन चौतारी तथा समावेशी पार्क', '3', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(251, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 3, 0, 'ज्येष्ठ नागरिक मिलन केन्द्र', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(252, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 3, 0, 'ज्येष्ठ नागरिक मिलन केन्द्र', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '', 1),
(253, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 3, 0, 'भलेश्वर महादेव चौतारामा मिलन चौतारी निर्माण', '1', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '', 1),
(254, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 3, 0, 'पाटिखोला घाट मिलन चौतारी', '3', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '', 1),
(255, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'पार्क निर्माण', '11', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(256, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'देविस्थान झण्डा पार्कमा आवश्यक पूर्वाधार निर्माण', '2', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(257, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'पिपलचौतारी बाटो संरक्षण', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(258, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'शान्तिटोल वडा कार्यालय पछाडि पार्क निर्माण', '8', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(259, 1, 19, 'नगर सभा', 0, 20, 65, 0, 5, 3, 0, 'गणेश मन्दिर प्राङ्गणमा संरक्षण तथा पार्क निर्माण', '10', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(260, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'नगरपालिका परिसरको पोखरी निर्माण', '0', NULL, 5750000, 0, 0, '0', '0', '5750000', 0, 0, '', '', 1),
(261, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'ठकुरी दोबाटो पोखरी निर्माण', '0', NULL, 1525000, 0, 0, '0', '0', '1525000', 0, 0, '', '', 1),
(262, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'विषयगत शाखा कार्यालयहरु रहेको भवन सुधार तथा परिसर संरक्षण गर्न वाल निर्माण', '6', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '', 1),
(263, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'ता.न.पा. ०६ स्थित प्रहरी चौकी रहेको भवन संरचना निर्माण तथा सुधार', '6', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '', 1),
(264, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'काभ्रेस्थली कृषक समुह भवनको तला थप गर्ने', '2', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(265, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'ता.न.पा. ०२ को शहरी स्वास्थ्य केन्द्र भवन संरक्षण गर्न वाल निर्माण', '2', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '', 1),
(266, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'विन्दावासिनी सामुदायिक भवन', '5', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(267, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 3, 0, 'वडा न. ०५ को बहुउद्देश्यीय भवनलाई थप रकम', '5', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '', 1),
(268, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कृषि', '1', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(269, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला आय आर्जन तथा सशक्तिकरण कार्यक्रम', '1', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(270, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'अशक्त, अपाङ्ग आय आर्जन तथा सशक्तिकरण कार्यक्रम', '1', NULL, 150000, 1, 0, '0', '0', '150000', 0, 0, '', '31112', 1),
(271, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कुञ्चिप्वाकल वसन्त देवी मन्दिर जाने बाटो सिढी निर्माण (धार्मिक पर्यटन )', '1', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(272, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'छाप बरुवाल बासस्थान हुदै भलेश्वर मन्दिर जाने सडक(धार्मिक पर्यटन)', '1', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(273, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कोभिड–१९ का कारण रोजगार गुमाएका बेरोजगार युवायुवतीको लक्षित रोजगार अभिबृद्धि कार्यक्रम', '2', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(274, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'देवस्थली ईन्द्रायणी मन्दिर निर्माण', '2', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(275, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कृषि विउँ –विजन तथा बोटविरुवा वितरण कार्यक्रम', '2', NULL, 100000, 1, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(276, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला सिपमुलक तालिम तथा रोजगार कार्यक्रम', '2', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(277, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'विपन्न तथा दलितका लागि सिपमुलक तालिम तथा कार्यक्रम', '2', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(278, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'युवा लक्षित जिवन उपयोगी सिपमुलक तालिम', '2', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(279, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला आयआर्जन तथा सिपमूलक कार्यक्रम अन्तर्गत मन्टेश्वरी तालिम', '3', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(280, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'बालवालिका क्षमता अभिवृद्धि तथा नेतृत्व विकास कार्यक्रम', '3', NULL, 100000, 1, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(281, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'पातले खोला कृषि सडक निर्माण', '3', NULL, 800000, 1, 0, '0', '0', '800000', 0, 0, '', '31112', 1),
(282, 1, 16, 'नगर सभा', 0, 19, 9, 35, 8, 5, 0, 'कृषि नहर तथा कुलो मर्मत', '3', NULL, 400000, 1, 1, '0', '0', '400000', 0, 0, '', '31112', 1),
(283, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'अपाङग तथा जेष्ठ नागरिक आयआर्जन सम्बन्धी कार्यक्रम', '3', NULL, 100000, 1, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(284, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कौसीखेती तालिम', '4', NULL, 100000, 1, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(285, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'दुखेल बुद्ध मन्दिर संरक्षण (पर्यटन प्रवर्धन)', '4', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(286, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'मन्दिर संरक्षण तथा मर्मत(पर्यटन प्रवर्धन)', '4', NULL, 400000, 1, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(287, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कृषि कार्यक्रम', '5', NULL, 100000, 1, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(288, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'भ्युटावर जाने बाटो (पर्यटन प्रवर्धन)', '5', NULL, 900000, 1, 0, '0', '0', '900000', 0, 0, '', '31112', 1),
(289, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला सिपमुलक तालिम तथा रोजगार कार्यक्रम', '5', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(290, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला क्षमता अभिबृद्घि कार्यक्रम', '6', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(291, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'बुद्घ स्तुपा संरक्षण मुसुम्वहाल', '6', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(292, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'दलित समुदाय क्षमता अभिबृद्घि कार्यक्रम', '6', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(293, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कृषकहरुका लागि कृषि विउ, विजन तथा औजार वितरण', '7', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(294, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'दलित, जनजाती तथा महिला लक्षित स्वःरोजगारमुखी तालिम', '8', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(295, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'युवा लक्षित आयआर्जन कार्यक्रम', '8', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(296, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला तथा लक्षित वर्गको क्षमता विकास', '9', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(297, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'चारघरेको बुद्ध मन्दिर जीर्णद्वार', '9', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(298, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'युवाहरुलाई तालिम, औद्योगिक अवलोकन भ्रमण', '9', NULL, 400000, 1, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(299, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला आदीवासी जनजाती, दलित लक्षित आर्थिक विकास तथा क्षमता अभिवृद्धि कार्यक्रम', '10', NULL, 500000, 1, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(300, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'युवा लक्षित क्षमता अभिवृद्धि कार्यक्रम', '10', NULL, 400000, 1, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(301, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'छाडा पशु चौपाया ब्यवस्थापन तथा कुकुर बन्ध्याकरण', '11', NULL, 300000, 1, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(302, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'कौसीखेती तालिम', '11', NULL, 200000, 1, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(303, 1, 16, 'नगर सभा', 0, 19, 17, 25, 8, 5, 0, 'महिला, युवा, दलित, लक्षित आय आर्जन कार्यक्रम', '11', NULL, 400000, 1, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(304, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'बालबालिका अन्तर्गत विधालय', '1', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(305, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'देवीथुम्का चौतारी छहारी निर्माण', '1', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(306, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'साङ्ग्ला पिपलबोट छहारी निर्माण', '1', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(307, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'साङ्ग्ला जात्रा व्यवस्थापन', '1', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(308, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'ढकालचौर युवा क्लब लार्इब्रेरी,  फर्निचर व्यवस्थापन', '1', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(309, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'ल्होसार पर्व व्यवस्थापन', '1', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(310, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'खेलकुद सम्बन्धी', '1', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(311, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'महिला भवन संरक्षण लखनडोल', '1', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(312, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक कार्यक्रम', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(313, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वयम् सेविका अभिमुखीकरण कार्यक्रम', '1', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(314, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'काभ्रेस्थली मा.वि. फर्निचर खरिद', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(315, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'कालिदेवी मा.वि. जमिन संरक्षण', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(316, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'मेले डाँडा सिंचाई कुलो  मर्मत तथा पाईप खरिद', '2', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(317, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'काउरे गाउँ सिंचाई कुलो मर्मत तथा पाईप खरिद', '2', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '31112', 1),
(318, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'देवस्थली ईन्द्रयणी जात्रा संञ्चालन', '2', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(319, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'विराट् सनातन गुरुकुल विद्यालय शिक्षक तथा खाद्य सामग्री व्यवस्थापन', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1);
INSERT INTO `plan_details1` (`id`, `fiscal_id`, `budget_id`, `parishad_sno`, `sn`, `topic_area_id`, `topic_area_type_id`, `topic_area_type_sub_id`, `topic_area_agreement_id`, `topic_area_investment_id`, `topic_area_investment_source_id`, `program_name`, `ward_no`, `tole_name`, `investment_amount`, `type`, `expenditure_type`, `first`, `second`, `third`, `prev_id`, `status`, `rajpatra_no`, `topic_no`, `qty`) VALUES
(320, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'एकल महिला,जेष्ठ नागरिक मिलन चौतारी निर्माण', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(321, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'भष्मेश्वर घाट संरक्षण तथा खानेपानी  व्यवस्थापन', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(322, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'शेषमती मरणघाट निर्माण तथा स्तरोन्नती', '3', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(323, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'थुम्की कृयादि कर्म गर्ने बहुउपयोगी ट्रष्ट निर्माण', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(324, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'नयांगाउं तामाङ मरणघाट निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(325, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'आधारभुत विद्यालय शिक्षा सुधार कार्यक्रम', '3', NULL, 205000, 0, 0, '0', '0', '205000', 0, 0, '', '31112', 1),
(326, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य सुधार तथा स्वयम् सेविका अभिमुखीकरण तालिम', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(327, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'लोलाङ पुरानो खानेपानी पाइपलाइन मर्मत', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(328, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'खेलकुद', '4', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(329, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक, महिला तथा बालबालिका', '4', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(330, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'दगुर्नेपानी पाइपलाइन मर्मत', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(331, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य स्वयम् सेविका तालिम', '4', NULL, 50000, 0, 0, '0', '0', '50000', 0, 0, '', '31112', 1),
(332, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'परम्परा संस्कृति प्रवद्र्धन', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31112', 1),
(333, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'महिला बालबालिका तथा जेष्ठ नागरिक', '5', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(334, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'युवा तथा खेलकुद', '5', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(335, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वयम् सेविका अभिमुखीकरण कार्यक्रम', '5', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(336, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य व्यवस्थापन कार्यक्रम', '5', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(337, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक देश दर्शन कार्यक्रम', '6', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(338, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'एकल महिला देश दर्शन कार्यक्रम', '6', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(339, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'संस्कृति संरक्षण जात्रा पर्व', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(340, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'कृष्णको रथ निर्माण', '6', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(341, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'महिला स्वयंसेवक स्वास्थ्यकर्मी सहित कार्यक्रम', '6', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(342, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'बालबालिका कार्यक्रम फुटुङ्ग मा.बि.', '7', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(343, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक तथा एकल महिला सम्मान कार्यक्रम', '7', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(344, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'महिला, बालबालिका, दलित, अपाङ्गता तथा पिछडिएका वर्ग कार्यक्रम', '7', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(345, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'महिला स्वास्थ्य स्वयंम सेविका क्षमता अभिवृद्धि कार्यक्रम', '7', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(346, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'सांस्कृति संरक्षण जात्रा तथा पर्ब', '7', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(347, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक सम्मान कार्यक्रम', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(348, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'एकल महिला तथा दलित उत्थान कार्यक्रम', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(349, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'शारिरीक अशक्तता तथा दिर्घरोगी सम्बन्धी कार्यक्रम,,महिला स्वयंसेविका लक्षित कार्यक्रम', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(350, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'कोभिड १९ मृतक परिवार सहयोग कार्यक्रम', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(351, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'अभिभावक बिहिन बालबालिका सहयोग कार्यक्रम', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(352, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'गणेशस्थान मन्दिरमा छाना राख्ने एवंम मर्मत गर्ने', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(353, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जात्रा बाजा व्यवस्थापन एवंम धामी संरक्षण', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31112', 1),
(354, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'विभिन्न जात्रा सरक्षण, प्रवर्धन', '10', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(355, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'विभिन्न खेलकुद कार्यक्रम तथा खेलकुद सामाग्री वितरण', '10', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(356, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य स्वयमसेविकाहरुको क्षमता अभिबृध्दी तथा अध्ययन अवलोकन भ्रमण', '10', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(357, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य सामाग्री खरिद तथा विभिन्न कार्यक्रम सन्चालन', '10', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31112', 1),
(358, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'शिक्षा', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(359, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वास्थ्य सम्बन्धी कार्यक्रम (कोभिड १९ रोकथाम तथा न्युनिकरण) योगा कार्यक्रम', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(360, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'स्वयंसेबिका क्षमता बिकास तथा अभिमुखिकरण', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(361, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'जेष्ठ नागरिक मिलन कार्यक्रम', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(362, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'फोहोरमैला तथा सरसफार्इ व्यवस्थापन', '11', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(363, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'विन्दबासिनी मन्दिर मर्मत तथा रंगरोगन', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31112', 1),
(364, 1, 16, 'नगर सभा', 0, 20, 8, 17, 8, 5, 0, 'विन्दबासिनी मन्दिरको बार्षिकोत्सव पुजा (नियमित)', '11', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31112', 1),
(365, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कठेरी बाटो मर्मत सम्भार', '1', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(366, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कठेरी चिहान डाडा चित्ता निर्माण', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(367, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'देउरालीबाट फुटबल चौर जाने सडक', '1', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(368, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'देउराली बाहुन डाडा जिम्वलटोल', '1', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(369, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कामिको डिल सल्लेगाउ जगात देवीथुम्का सडक मर्मत', '1', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(370, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'विहानीचोक छाप सडक ढलान', '1', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(371, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कुन्चिप्वाकल माझगाउ गुम्बा जाने बाटो -पर्यटन प्रवर्धन', '1', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(372, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'छाप भलेश्वर मन्दिरको उकालो रेलिंग', '1', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31114', 1),
(373, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'खर्क टोल बाटो ढलान', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(374, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लक्ष्मीपुर सामुदायिक भवन पूर्वाधार निर्माण', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(375, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कुन्चिप्वाकल देवकोटा टोल सडक ढलान', '1', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(376, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सांग्ला बजार सडक मर्मत', '1', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(377, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'देउराली अधिकारी टोल बाटो मर्मत', '1', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(378, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सांग्ला बजार ढुङ्गा सोलिङ्ग', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(379, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नयँ वस्ती आनन्दटोल सडक मर्मत', '1', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(380, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नया वस्ती भलेश्वर हाइटसडक मर्मत', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(381, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ठुलोखोला चिता निर्माण', '1', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(382, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'खानेपानी', '1', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(383, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कुन्चिप्वाकल ढकालचौर सडक ढलान', '1', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(384, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'देवीथुम्का सत्तल वाल रेलिङ्ग', '1', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31114', 1),
(385, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'जगात खानेपानी मर्मत', '1', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(386, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत सम्भार तथा विपद व्यवस्थापन', '1', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(387, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कुँवरथोक तामाङ चिहान महादेव खोला मोटर बाटो स्तरोन्नती', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(388, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'छोर्तेन जाने सिढीं निमाण', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(389, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ज्ञानोदय स्कुल वाल कम्पाउण्ड', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(390, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कमलाको पसल देखी ज्ञानोदय हुँदैं पानी ट्याङकी जाने मोटर बाटो स्तरउन्नती', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31114', 1),
(391, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'माथिल्लो कार्कीथोक टारेको डिल ड्रेन तथा वाल निर्माण', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(392, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ढकालटार कृष्ण मन्दिर परिसर ट्वाईलेट तथा ट्रस्ट निर्माण', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(393, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मितेरी चोक देखी प्रेम बहादुर तामाङको घर हुँदैं रामशरण दवाडीको घर सम्म मोटरबाटो स्तरउन्नती', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(394, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'बसन्त नगर कोलनी मन्दिर परिसरमा ढुङगा विछ्याउने', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(395, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'फिरफिरे डाँडा भेडीगोठ गणेश मन्दिर सडक स्तरोन्नती', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(396, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'काभ्रेस्थली स्वास्थ्य चौकी भवन निर्माण', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(397, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पाले घर माटिकोरीया सडक स्तरोन्नती', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(398, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'माटिकोरीया शान्ति धाम मार्ग विश्राम स्थल', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(399, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'बसन्त नगर कोलनी हाईट मोटरबाटो स्तरोन्नती', '2', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(400, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'भण्डारी गाउँ मुल सडक हुँदैं सेन्टर सडक निर्माण', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(401, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'भण्डारी गाउँ माझ खण्ड सडक निर्माण', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(402, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'थलीगाउँ सामुदायिक भवन तथा परिसर निर्माण', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(403, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नव सृजना टोल बाटो स्तरउन्नती', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(404, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'घट्टेखोला सामुदायिक भवन परिसर निर्माण तथा मर्मत सम्भार', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(405, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'भाईरामे लुङ फाँट मोटर बाटो स्तरोन्नती', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(406, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत सम्भार तथा विपद व्यवस्थापन', '2', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(407, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सिम्लेश्वर महादेव मन्दिर आसपासमा शौचालय निर्माण', '2', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(408, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ढप्पु व्याटमिटन कभड हल निर्माण', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(409, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नागस्थान घट्टे खोलाको कुलो संरक्षण (अर्जुन फुयाँलको घर पछाडि, पहिरो नियन्त्रण समेत)', '2', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(410, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'थुम्की खेल मैदान', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(411, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'महादेवस्थान आधारभूत स्कुलबाट ढलान जोड्ने मोटर बाटो', '3', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(412, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'डम्पिङ रुम्टी किसन्डोल मोटरबाटो स्तरोन्नती', '3', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(413, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'महादेवस्थान आधारभुत स्कुल हुदै तल्लो ढलान सम्मको मोटरबाटो स्तरोन्नती', '3', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(414, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ऋषि बाहालेश्वर घाट निर्माण', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(415, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गणतान्त्रिक मार्ग स्तरोन्नती', '3', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(416, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लामिछाने गाउं मोटरबाटो स्तरोन्नती', '3', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(417, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'देविस्थान विश्वकर्मा टोल मोटरबाटो स्तरोन्नती', '3', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(418, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'आठमाईल हुदै नार्गाजुन स्कुल जान मोटरबाटो स्तरोन्नती', '3', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(419, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'आपचौर मोटरबाटो स्तरोन्नती', '3', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(420, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'स्यालागुढ गौरीगाउं मोटरबाटो स्तरोन्नती', '3', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(421, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'च्वाईस नेपाल खानेपानी आयोजना (एक घर एक धारो)', '3', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(422, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'किसन्डोल माझगाउं खानेपानी विस्तार तथा व्यवस्थापन', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(423, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कोटगाउं खानेपानी', '3', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(424, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'खानेपानी मर्मत कोष', '3', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(425, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सुन्दर वस्ती सडक स्तरोन्नती', '3', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(426, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सडक मर्मत कोष ( मर्मत सम्भार तथा विपद व्यवस्थापन)', '3', NULL, 1400000, 0, 0, '0', '0', '1400000', 0, 0, '', '31114', 1),
(427, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लोलाङ पोखरी सडक निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(428, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नयाँ गणेश बाटो निर्माण', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(429, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सडक बत्ती', '4', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(430, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मिलीजुली बस्ती बाटो निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(431, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'दुखेल मंगले र राम भगतको घर तर्रफ जाने बाटो निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(432, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मृगस्थली मार्ग बाटो निर्माण', '4', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(433, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'माछापुच्छ्रे कान्ति बज्राचार्यको घर जाने बाटो निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(434, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गैरी टोल बाटो निर्माण', '4', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(435, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सुन्दर बस्ती सडक निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(436, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'भट्टेपाखा सडक निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(437, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'चेतनानगर नागिनी खोला बाटो निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(438, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गुप्तेश्वर मार्ग सिग्देलको घर जाने बाटो', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(439, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'महादेव खोला नयाँ पुल बाटो निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(440, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'करणको घर जाने बाटो निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(441, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मनकामना टोल बाटो निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(442, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नमुना टोल राम पुतुवारको घर जाने बाटो निर्माण', '4', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(443, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सन्जिवनी बस्ती बाटो निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(444, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'रिता, मैया, छत्रकुमारीको घर जाने बाटो निर्माण', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(445, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गौरी गणेश बाटो तथा ढल निर्माण', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(446, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'हरी दाइको घर जाने बाटो मर्मत', '4', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31114', 1),
(447, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लोलाङ सामुदायिक भवन निर्माण', '4', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(448, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत सम्भार कोष', '4', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(449, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'तिन धारा बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(450, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नाखण्डोल बाटो', '5', NULL, 900000, 0, 0, '0', '0', '900000', 0, 0, '', '31114', 1),
(451, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'वैखु भित्री बाटो', '5', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(452, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नाखण्डोल अर्यालटार बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(453, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'अर्यालटार भित्री दलित वस्ती बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(454, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गुठ न्यौपानेथोक बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(455, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कमेरे वस्ती सपनाटोल बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(456, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'क्रियापुत्री भवन ठाडो बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(457, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मधुवन रिर्सोट  देखि आडको डिल बाटो', '5', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(458, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'साविक गोलढुङ्ग - ९को  धिताल कुवा संरक्षण तथा  बाटो निर्माण', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(459, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'दुलालथोक सुदामको मिल बाटो', '5', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(460, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'माथिल्लो मुलबाटो बाट तल्लो मुल बाटो जोड्ने फुयालथोक माझगाँउ बाटो', '5', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(461, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'चियानडाडा देखि कुमालटार बाटो', '5', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(462, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत सम्भार तथा विपद व्यवस्थापन', '5', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(463, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सार्वजनिक निर्माण तथा व्यवस्थापन', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(464, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गगनटोल ब्लक सोलिङ बाकी कार्य', '6', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(465, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'धर्मस्थली सौर्य बत्ती', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(466, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सुनार टोल धर्मस्थली वाटो निर्माया', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(467, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सानो बाइपास उकालो ढलान', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(468, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गणेश गुरुङको घर अगाडीको पहिरो नियन्त्रण, पैयाटार', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(469, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'घिमिरे टोल भित्रि ढलान बस्नेतटार', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(470, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'खर्क उकालो बाटो ढलान', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(471, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नारायण मन्दिर सिंढी निर्माण पुसल', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(472, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पहरा गणेश मन्दिर तामा र पित्तलको छाना', '6', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(473, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत संभार', '6', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(474, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सुन्दरवस्ती बाटो स्तरोन्नती', '6', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(475, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पृकुनबाट धर्मस्थली जाने सडक', '6', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(476, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मुल सडक देखि खहरे पियाले चौर सम्म बाटो', '7', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(477, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पाखुरेडाँडा बाटो', '7', NULL, 900000, 0, 0, '0', '0', '900000', 0, 0, '', '31114', 1),
(478, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मूल सडकबाट कार्की गाउँ जानेबाटो ढल र ढलान', '7', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(479, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'खड्का भञ्ज्याङ्ग बाटो', '7', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(480, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'शान्ती मार्ग बाटो वाल निर्माण', '7', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(481, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'गणेशस्थान मन्दिर निर्माण', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(482, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'जगन्नाथ राजवाहकको घर देखि भित्री बाटो', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(483, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'हाउजिङ्ग टोल प्रदिपको घर जाने बाटो', '7', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(484, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'टुसाल भित्री बाटो', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(485, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'रुकु कुँवरको घर देखि उद्धव के.सी.को घर सम्मको बाटो ढलान', '7', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(486, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मनकामना मन्दिर निर्माण', '7', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(487, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'वडा नं. ९ र ७ को सिमाना मिल भित्रको बाटो', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(488, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ऋषेश्वर महादेव मन्दिर निर्माण', '7', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(489, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सडक बत्ति जडान कार्यक्रम', '7', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(490, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'फुटुङ्ग गणेशस्थान बाट दक्षिण तर्फ जाने बाटो', '7', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31114', 1),
(491, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मुल सडक देखि रामकुमार के.सी.को घर सम्म जाने बाटो', '7', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(492, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ज्ञानभुमी टोल अन्र्तगत विवेकशिल उपभोक्ता समिति बाटो निर्माण', '8', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(493, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'बुद्धटोल वाल तथा बाटो निर्माण', '8', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(494, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'शिव अर्यालको घर पछाडिको बाटो तथा वाल निर्माण', '8', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(495, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मोहन भण्डारीको घर पछाडिको बाटो निर्माण', '8', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(496, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सुन्दरबस्ती टोल बाटो निर्माण', '8', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(497, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लालीगुराँस टोलको शेखरको घर जाने र न्यौपानेको घर जाने भित्री बाटो तथा वाल निर्माण', '8', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(498, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'शान्तिटोल भित्रको मेघा स्कुल पछाडिको बाटो निर्माण', '8', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(499, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नागेश्वर मार्गको बाटो ढलान', '8', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(500, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'विभिन्न स्थानहरुमा बल्क बिछ्याउने', '8', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(501, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत तथा संम्भार (अधुरा कार्य सम्पन्न)', '8', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(502, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'अधुरा कार्य सम्पन्न', '8', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(503, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पिपलबोट मार्ग बाटो स्तरोन्नति', '8', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(504, 1, 16, 'नगर सभा', 0, 20, 0, 0, 6, 1, 0, 'रामघाट राम मन्दिर निर्माण', '3', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '31114', 1),
(505, 1, 0, 'नगर सभा', 0, 22, 6, 43, 6, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '8', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(506, 1, 0, 'नगर सभा', 0, 22, 6, 43, 6, 5, 0, 'वडाका जनप्रतिनिधि र कर्मचारीहरुको क्षमता बिकास कार्यक्रम', '8', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(507, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मिलीजुली टोलमा बाटो निर्माण', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(508, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नर्थपोल स्कूल अगाडीको बाटो ढलान', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(509, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'वडाका विभिन्न भित्री बाटोहरुमा बत्ती जडान', '9', NULL, 1200000, 0, 0, '0', '0', '1200000', 0, 0, '', '31114', 1),
(510, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'कबडहलमा ZYM को लागि सामाग्री खरिद', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(511, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'वडा नं. ९ र १० सिमाना बाटोबाट उत्तर तर्फको बाटो ढलान', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(512, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'बाक्चापाखा बाट उत्तर तर्फ नेपाटप जोड्ने सडकमा ढल राख्ने तथा सडक निर्माण', '9', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(513, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मनमैजु मा.वि. को पूर्ब तिर जाने बाटोमा भ¥याङ निर्माण', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(514, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नेपाटप ग्याडेलबाट  दक्षिण तिर जाने बाटो निर्माण', '9', NULL, 800000, 0, 0, '0', '0', '800000', 0, 0, '', '31114', 1),
(515, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सार्वजानीक सम्पति संरक्षण', '9', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(516, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत संम्भार', '9', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(517, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सूर्योदय टोलको बाटो पक्की', '10', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(518, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मिजङ्ख्य टोलको भित्री बाटो पक्की', '10', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31114', 1),
(519, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सप्तऋषि टोलको बाटो पक्की', '10', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31114', 1),
(520, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'नाट्येश्वर मार्गको भित्रि बाटो पक्की र इनार मर्मत', '10', NULL, 1200000, 0, 0, '0', '0', '1200000', 0, 0, '', '31114', 1),
(521, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'पन्चेश्वर मन्दिर गेट र बाटो निर्माण', '10', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(522, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ढुङगेधारा निर्माण हिलेडोल हाईटको ढल मर्मत', '10', NULL, 600000, 0, 0, '0', '0', '600000', 0, 0, '', '31114', 1),
(523, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सि सि क्यामेरा तथा सडक बत्ती विस्तार तथा मर्मत', '10', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(524, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मर्मत सम्भार कार्यक्रम/ प्रतिजग्गा सरक्षण', '10', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(525, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'लाखेडोलको पर्ति जग्गा संरक्षण तथा पार्क निर्माण', '11', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(526, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'शहरी स्वास्थ केन्द्रको अगाडी पार्क निर्माण', '11', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(527, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'राम बाबाको घर अगाडि ढल तथा बाटो ढलान', '11', NULL, 900000, 0, 0, '0', '0', '900000', 0, 0, '', '31114', 1),
(528, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'हिरापुरको हार्इटको सिढी मुनिको अधुरो बाटो', '11', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(529, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'हिरापुरको मुख्य बाटोबाट आउने बाँसको थान सँगैको अधुरो बाटो', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(530, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'हिरापुर एरियाको अधुरो बाटो', '11', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(531, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, '८ र ११ को सिमानाको अधुरो बाटो ढलान', '11', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(532, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'केशव रेग्मीको घर अगाडिको अधुरो बाटो', '11', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31114', 1),
(533, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'सार्वजनिक निर्माण तथा व्यवस्थापन / साना अधुरा योजना', '11', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(534, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'विकास थापाको घरदेखी बिष्णु ढकालको घर सम्म (खरिबोटको भित्री बाटो)', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(535, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'अस्मिन्द्र थापाको घर नजिकको बाटोमा व्लक बिच्छाउने', '11', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '31114', 1),
(536, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'मुल सडक बाट कान्तिपुर पार्टी प्यालेस आउने बाटो', '11', NULL, 900000, 0, 0, '0', '0', '900000', 0, 0, '', '31114', 1),
(537, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'एन आर कलेजको छेउको बाटोमा ढल र बाटो स्तरोन्नती', '11', NULL, 700000, 0, 0, '0', '0', '700000', 0, 0, '', '31114', 1),
(538, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'श्याम कुमार श्रेष्ठको घर अगाडी ढल निर्माण', '11', NULL, 150000, 0, 0, '0', '0', '150000', 0, 0, '', '31114', 1),
(539, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'ढुंगेधारा संरक्षण', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31114', 1),
(540, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'दैवी प्रकोप व्यवस्थापन', '11', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31114', 1),
(541, 1, 9, 'नगर सभा', 0, 18, 6, 43, 6, 5, 0, 'महिला सामुदायिक भवन निर्माण', '11', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31114', 1),
(542, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय सञ्चालन तथा व्यवस्थापन', '1', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(543, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय सञ्चालन तथा व्यवस्थापन', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(544, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'तारकेश्वर नगरपालिका वडा नं.२ को सूचना तथा वृत्तचित्र', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(545, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'डि.पि.आर.निर्माण, मर्मत सम्भार तथा बिविध', '2', NULL, 400000, 0, 0, '0', '0', '400000', 0, 0, '', '31115', 1),
(546, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(547, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'सूचना प्रकाशन तथा सूचना सम्प्रेषण', '3', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(548, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'विकास निर्माणको संगालो सहित वडा चिनारी श्रव्य दृश्य निर्माण', '3', NULL, 495000, 0, 0, '0', '0', '495000', 0, 0, '', '31115', 1),
(549, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '4', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31115', 1),
(550, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '5', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(551, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'वडामा भएआएका विकास निर्माणको संगालो सहित वडा चिनारी श्रव्य दृश्य निर्माण', '5', NULL, 300000, 0, 0, '0', '0', '300000', 0, 0, '', '31115', 1),
(552, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'अन्य मर्मत सम्भार तथा बिविध', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(553, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '6', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(554, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'वडा कार्यालय व्यवस्थापन', '7', NULL, 500000, 0, 0, '0', '0', '500000', 0, 0, '', '31115', 1),
(555, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय संचालन तथा कार्यक्रम संचालन', '9', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(556, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'सूचना तथा प्रविधि सम्बन्धी कार्यक्रम', '10', NULL, 100000, 0, 0, '0', '0', '100000', 0, 0, '', '31115', 1),
(557, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यालय व्यवस्थापन', '10', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(558, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'कार्यलय व्यवस्थापन', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(559, 1, 16, 'नगर सभा', 0, 22, 31, 52, 8, 5, 0, 'वडाका जनप्रतिनिधि र कर्मचारीहरुको क्षमता बिकास कार्यक्रम', '11', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '31115', 1),
(560, 1, 16, 'नगर सभा', 0, 18, 37, 208, 8, 1, 0, 'लमिनिचौर संरक्षण तथा व्याडमिण्टन कोर्ट निर्माण', '5', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '31116', 1),
(561, 1, 16, 'नगर सभा', 0, 18, 18, 130, 8, 1, 0, 'क्रियापुत्री घर पूर्वाधार निर्माण, चापागाईटार', '5', NULL, 2200000, 0, 1, '0', '0', '2200000', 0, 0, '', '31116', 1),
(562, 1, 16, 'नगर सभा', 0, 20, 65, 1, 8, 1, 0, 'विन्ध्यवासिनि मन्दिर पार्क निर्माण करिव ४० रोपनि जग्गा', '5', NULL, 1000000, 0, 1, '0', '0', '1000000', 0, 0, '', '31116', 1),
(563, 1, 16, 'नगर सभा', 0, 20, 65, 1, 8, 1, 0, 'गुम्वा चैत्य निर्माण', '0', NULL, 1200000, 0, 1, '0', '0', '1200000', 0, 0, '', '31116', 1),
(564, 1, 16, 'नगर सभा', 0, 20, 15, 76, 8, 1, 0, 'पाचमाने संरक्षण सम्वद्र्धन कार्यक्रम', '3', NULL, 5884000, 1, 1, '0', '0', '5884000', 0, 0, '', '31116', 1),
(565, 1, 16, 'नगर सभा', 0, 18, 6, 43, 8, 1, 0, 'धर्मस्थली पुरानो वजार—तिमिल्सिना गाउँ—ठाडो ढुङ्गा— काभ्रेस्थली सडक', '6', NULL, 14588000, 0, 2, '0', '0', '14588000', 0, 0, '', '31116', 1),
(566, 1, 14, 'नगर सभा', 0, 18, 6, 19, 6, 1, 0, 'विष्णुमति खोला—वोहरापुल—नेपालटार—शेषमति सडक ', '11', NULL, 6672000, 0, 1, '0', '0', '6672000', 0, 0, '', '26336', 1),
(567, 1, 14, 'नगर सभा', 0, 21, 26, 141, 6, 1, 0, 'फोहर मैला व्यवस्थापन', '0', NULL, 4200000, 1, 1, '0', '0', '4200000', 0, 0, '', '26336', 1),
(568, 1, 14, 'नगर सभा', 0, 20, 19, 30, 6, 1, 0, 'साङलाखानेपानी योजना', '1', NULL, 4200000, 0, 1, '0', '0', '4200000', 0, 0, '', '26336', 1),
(569, 1, 14, 'नगर सभा', 0, 18, 6, 19, 6, 1, 0, 'मनमैजु फुटुङ सांग्ला, गुर्जे भञ्ज्याङ, नुवाकोट सडक(क्रमागत आयोजना)', '0', NULL, 4200000, 0, 1, '0', '0', '4200000', 0, 0, '', '26336', 1),
(570, 1, 14, 'नगर सभा', 0, 20, 14, 201, 6, 1, 0, 'स्वास्थ्य चौकी भवन निर्माण', '0', NULL, 5000000, 0, 1, '0', '0', '5000000', 0, 0, '', '26336', 1),
(571, 1, 14, 'नगर सभा', 0, 19, 21, 58, 6, 1, 0, 'डि पी आर अनुसार कृषि वजार पूर्वाधार निर्माण तथा निरन्तरता', '5', NULL, 30000000, 0, 1, '0', '0', '30000000', 0, 0, '', '26336', 1),
(572, 1, 14, 'नगर सभा', 0, 19, 22, 112, 6, 1, 0, 'मुडखु ढाका प्रवेशद्धार निर्माण, (पर्यटन पूर्वाधार विकास)', '5', NULL, 900000, 0, 1, '0', '0', '900000', 0, 0, '', '26336', 1),
(573, 1, 14, 'नगर सभा', 0, 19, 22, 112, 6, 1, 0, 'चुनदेवी मन्दिरसम्म जाने पदमार्ग (पर्यटन पूर्वाधार विकास)', '6', NULL, 900000, 1, 1, '0', '0', '900000', 0, 0, '', '26336', 1),
(574, 1, 14, 'नगर सभा', 0, 18, 7, 62, 6, 1, 0, ' नविकरणिय उर्जा प्रविधि जडान (वायोग्यास विद्युतिय चुलो सुधारिएको चुलो सौर्य उर्जा ', '0', NULL, 800000, 0, 1, '0', '0', '800000', 0, 0, '', '26336', 1),
(575, 1, 14, 'नगर सभा', 0, 20, 65, 1, 6, 1, 0, 'जलपमदेवी निर्माण, मुड्खु(सस्कृति प्रवद्र्धन)', '5', NULL, 500000, 0, 1, '0', '0', '500000', 0, 0, '', '26336', 1),
(576, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'भवन निर्माण', '0', NULL, 60000000, 0, 0, '0', '0', '60000000', 0, 0, '', '31112', 1),
(577, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'निर्मित भवनको संरचनात्मक सुधार खर्च', '0', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '31113', 1),
(578, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'म्याचिङ फण्ड', '0', NULL, 40000000, 0, 0, '0', '0', '40000000', 0, 0, '', '', 1),
(579, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'अन्य योजना निर्माण तथा योजना मर्मत सम्भार', '0', NULL, 14580000, 0, 0, '0', '0', '15000000', 0, 0, '', '31159', 1),
(580, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'साझेदारी कार्यक्रम', '0', NULL, 25000000, 0, 0, '0', '0', '25000000', 0, 0, '', '', 1),
(581, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'मनमैजु, फुटुंग, सांग्ला गुर्जेभन्ज्यांग नुवाकोट सडक (समपूरक योजना, बहुबर्षीय योजना)', '0', NULL, 8400000, 0, 0, '0', '0', '8400000', 0, 0, '', '', 1),
(582, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'पाँचमाने संरक्षण सम्वद्र्धन कार्यक्रम', '0', NULL, 11768000, 0, 0, '0', '0', '11768000', 0, 0, '', '', 1),
(583, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'धर्मस्थली पुरानो बजार तिमल्सिना गाऊँ ठाडो ढुङ्गा काभेस्थली सडक', '0', NULL, 29176000, 0, 0, '0', '0', '29176000', 0, 0, '', '', 1),
(584, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'विष्णुमती खोला बोहरापुल नेपालटार शेषमती सडक', '0', NULL, 13344000, 0, 0, '0', '0', '13344000', 0, 0, '', '', 1),
(585, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'का.म.न.पा.–नेपालटार–शेषमती–जरंखु चिसापानी – तीनपिप्ले हुदैं ओखरपौवा जाने सडक (चिसापानी–तीनपिप्ले खण्ड)', '0', NULL, 60000000, 0, 1, '0', '0', '60000000', 0, 0, '', '18.1', 1),
(586, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'का.म.न.पा.–बाईपास–नेपालटार–फुटुंग झोर हुदैं नुवाकोट सडक (फुटुंग झोर सडक खण्ड)', '0', NULL, 55000000, 0, 0, '0', '0', '55000000', 0, 0, '', '18.2', 1),
(587, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'टोखा न.पा. ११–महादेव मार्ग हुदैं शेषमती सडक', '0', NULL, 35000000, 0, 0, '0', '0', '35000000', 0, 0, '', '18.3', 1),
(588, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'विष्णुमती खोला मार्ग हुदैं सांग्ले खोला ईन्द्रायणी पुल सडक', '0', NULL, 30000000, 0, 0, '0', '0', '30000000', 0, 0, '', '18.4', 1),
(589, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कमेरोखोला–बस्नेतटार–पुसल–चोगाऊँ सडक', '0', NULL, 25000000, 0, 0, '0', '0', '25000000', 0, 0, '', '18.5', 1),
(590, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बोहराटार–धितालथोक–चोगाऊँ सडक', '0', NULL, 22500000, 0, 0, '0', '0', '22500000', 0, 0, '', '18.6', 1),
(591, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'भत्केको पुल–छाप हुदैं बिहानीचोक सडक', '0', NULL, 20500000, 0, 0, '0', '0', '20500000', 0, 0, '', '18.7', 1),
(592, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'नागार्जुन मा.वि.–फुयालथोक सडक', '0', NULL, 20500000, 0, 0, '0', '0', '20500000', 0, 0, '', '18.8', 1),
(593, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'मालपोत कार्यालय–न्यायीक प्रतिष्ठान हुदैं फुटुंग सडक', '0', NULL, 15000000, 0, 0, '0', '0', '15000000', 0, 0, '', '18.9', 1),
(594, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बोहराटार–भैरवपाटी–नागार्जुन सडक', '0', NULL, 10000000, 0, 0, '0', '0', '10000000', 0, 0, '', '18.1', 1),
(595, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सानो बाईपास–फेदी बजार–भण्डारी गाऊँ हुदैं ठाटी सडक', '0', NULL, 12500000, 0, 0, '0', '0', '12500000', 0, 0, '', '18.11', 1),
(596, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बिहानीचोकबाट झोर जाने सडक', '1', NULL, 10000000, 0, 0, '0', '0', '10000000', 0, 0, '', '18.12', 1),
(597, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'जरंखु खोला पुल–महादेव खोला पुर्वी किनार हुदैं भ्याली पुल', '0', NULL, 7500000, 0, 0, '0', '0', '7500000', 0, 0, '', '18.13', 1),
(598, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'काभ्रेस्थली–कार्कीथोक फुटुंग सडक (कार्कीथोक धारा देखि भगवान पण्डितको घरसम्म)', '0', NULL, 7000000, 0, 0, '0', '0', '7000000', 0, 0, '', '18.14', 1),
(599, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'शिवनगर ऐश्वर्यनगर सडक स्तरोन्नति', '10', NULL, 5500000, 0, 0, '0', '0', '5500000', 0, 0, '', '18.15', 1),
(600, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'आठमाईल डाडागाऊँ हुदैं छत्रेदेउराली धादिंग सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.16', 1),
(601, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, '१ नं. पुल बाट भ्यू टावर जाने सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.17', 1),
(602, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'तीनपिप्ले–फेदी बजार सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.18', 1),
(603, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कमेरेखोला लामा चोकबाट – झुलाफाँट सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.19', 1),
(604, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सानो पुल (नयाँपुल) – नागिनी खोला कोरिडोर स्तरोन्नति', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.2', 1),
(605, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'काभ्रेस्थली–देवीस्थान सडक (कोइरालेखोला शान्तिधाम हुदैं देवीस्थान जाने बाटो)', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.21', 1),
(606, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'जगात–कुञ्चिप्वाकल–ढकालचोर सडक', '0', NULL, 7500000, 0, 0, '0', '0', '7500000', 0, 0, '', '18.22', 1),
(607, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'नागपोखरी–गणेश मन्दिर–भ्याली पुल सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.23', 1),
(608, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'तीनपिप्ले–जितपुर–गैरी गाऊँ–पाँचमाने ठुलोखोला सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.24', 1),
(609, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'पदमशाल चोकबाट पदमशाल हुदैं ठाडो ढुंगा सडक', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.25', 1),
(610, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'तिनपिप्लेबाट भुवनेश्वर मन्दिर जाने सिढी बाटो तथा पूर्वाधार निर्माण', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.26', 1),
(611, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'संगमचोक घटेखोला लामिछाने चोक सडक', '2', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.27', 1),
(612, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'भ्यालीपुल काभ्रेस्थली मा.वि. सडक स्तरोन्नति', '2', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.28', 1),
(613, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'फेदीपुल भण्डारी गाऊँ हुदैं संगमचोक सडक', '2', NULL, 4000000, 0, 0, '0', '0', '4000000', 0, 0, '', '18.29', 1),
(614, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'फेदीबाट चिसापानी सडक', '3,6', NULL, 4000000, 0, 0, '0', '0', '4000000', 0, 0, '', '18.3', 1),
(615, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'नेपालटार पुलमा कजवे निर्माण', '11', NULL, 4000000, 0, 0, '0', '0', '4000000', 0, 0, '', '18.31', 1),
(616, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'महादेवखोला–गैरी गाऊँ–पानी ट्यांकी सडक', '0', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.32', 1),
(617, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बाटाटार–किसनडोल–जितपुर मा.वि. सडक', '0', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.33', 1),
(618, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'हाउजिंगबाट भित्री वस्ती – सन्तानेश्वर मन्दिर सडक', '0', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.34', 1),
(619, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'उमा महेश्वर गेटबाट रावलटार सडक', '0', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.35', 1),
(620, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'धुलेपुल लटेपु बाटो', '3', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.36', 1),
(621, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'गणेश मन्दिर विन्दावासिनी पुसल सडक', '5,6', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.37', 1),
(622, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'मानसिंह महर्जनको घर हुदैं गैरीधारा जाने सडक', '9', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.38', 1),
(623, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'वडा नं. ९ र १० को सिमानामा सांग्लेखोला कोरिडोर निस्कने सडक', '9,10', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.39', 1),
(624, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सिद्धेश्वर टोलको ढल तथा सडक स्तरोननति', '10', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.4', 1),
(625, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'आनन्द टोलको टोलको पुलबाट गुम्बा चोक पहुदैं लोकतान्त्रिक चोक जाने सडक', '11', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.41', 1),
(626, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सुर्यदर्शन हाईटमा सडक ढलान तथा स्तरोन्नती (सुर्यदर्शन उ.स. भित्रमा सडकहरूमा)', '2', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.42', 1),
(627, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'काउरे गाऊँबाट बद्री बाजेको घर जाने सडक', '2', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.43', 1),
(628, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'पैयाटार बोगटी गाउँ सडक', '6', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.44', 1),
(629, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'शान्तिटोल वडा कार्यालय डाँडागाउ उकालो बाटो स्तोन्नती', '8', NULL, 3000000, 0, 0, '0', '0', '3000000', 0, 0, '', '18.45', 1),
(630, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'महांकाल धारावन देउकी दोभान सडक', '6', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.46', 1),
(631, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कमेरोखोला रुद्रमती भवन जाने सडक', '5', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.47', 1),
(632, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सावित्रीको कोल्ड स्टोरदेखि तल्लो भेडीगोठ सडक', '2', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.48', 1),
(633, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'गुम्बा मुनिको ट्यांकीबाट गाम्चा सडक स्तरोन्नती', '5', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.49', 1),
(634, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कुलाबाध पाँचमाने मोटर बाटो', '3', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.5', 1),
(635, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'गौचरण–शिलाफल–ठाडो ढुङ्गा– ठाटी जाने सडक', '0', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.51', 1),
(636, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'मनमैजु बजार वस्ती सडक स्तरोन्नती', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '18.52', 1),
(637, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'टोखा–थापाटोल हुदैं फुटुंग नागपोखरी सडक', '0', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.53', 1),
(638, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'देउकीको पुलबाट उत्तर तर्फ भंगेरी टार जाने सडक', '6', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '18.54', 1),
(639, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'महादेव खोला–करिडोर–खानेपानीको बोरिंग निकालेको ठाउँबाट फुटुंग मुल सडक', '0', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.55', 1);
INSERT INTO `plan_details1` (`id`, `fiscal_id`, `budget_id`, `parishad_sno`, `sn`, `topic_area_id`, `topic_area_type_id`, `topic_area_type_sub_id`, `topic_area_agreement_id`, `topic_area_investment_id`, `topic_area_investment_source_id`, `program_name`, `ward_no`, `tole_name`, `investment_amount`, `type`, `expenditure_type`, `first`, `second`, `third`, `prev_id`, `status`, `rajpatra_no`, `topic_no`, `qty`) VALUES
(640, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'देवीथुम्का सल्लेगाऊँ जगात सडक', '1', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.56', 1),
(641, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ढ्याकटे दोबाटोबाट विन्दावासिनी मन्दिर सडक', '1', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.57', 1),
(642, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कल्पनेश्वर महादेव मन्दिर देखि बदेली चौर सडक', '3', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.58', 1),
(643, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ठुलागाऊँ स्कुल जाने बाटो र स्कुलका दुई वटा भवनहरु जोड्ने बाटो', '3', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.59', 1),
(644, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बरको बोटदेखि कृष्ण मन्दिर जाने सडक', '5', NULL, 3500000, 0, 0, '0', '0', '3500000', 0, 0, '', '18.6', 1),
(645, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बतासेडाँडा फुयालथोक सडक', '5', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.61', 1),
(646, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'नागार्जुन स्कुल बैखु जाने ठाडो बाटो स्तरोन्नती', '5', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.62', 1),
(647, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'धर्मस्थली गिनिज स्कुलबाट गैरी टोल जाने सडक', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.63', 1),
(648, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सानो बाईपासबाट कोलापाखो जाने सडक', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.64', 1),
(649, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'पैयाँटार गणेश सडक', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.65', 1),
(650, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'गणेशस्थानबट दक्षिणतर्फ सडक', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.66', 1),
(651, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'धौलागिरी टोल सडक', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.67', 1),
(652, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'संगमफाँट सडक स्तरोन्नति', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.68', 1),
(653, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'पदमचक्र स्कुलबाट ढकालचौर सडक', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.69', 1),
(654, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कार्कीथोक जाने सडक', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.7', 1),
(655, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'लामवगर क्रान्तिमार्ग हुदैं खत्री टोल सडक', '8', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.71', 1),
(656, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ग्याडोल चौकीबाट वस्ती जाने सडक', '8', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.72', 1),
(657, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'खुलालटारबाट भित्री बाटो हुदैं टुसाल जाने सडक', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.73', 1),
(658, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'अन्नपूर्ण टोलबाट भित्र जाने सडक', '2', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.74', 1),
(659, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'जरंखु हार्इट टोल सुधार समितिमा ढलान', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.75', 1),
(660, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'फिरफिरे डाँडा गणेश मन्दिर हुदैं भेडीगोठ जाने सडक', '2', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.76', 1),
(661, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ठुलोकोट पिपलबोट मोटर बाटो', '3', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '18.77', 1),
(662, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'दलकाप चोकबाट ज्ञानोदय स्कुल मोटरबाटो', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.78', 1),
(663, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'वडा नं. ५ को बाख्लो गैराबाट बिन्दावासिनी जाने शाखा बाटो ढलान', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.79', 1),
(664, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'जयन्तीपुर सुन्दरवस्ती सडक ढलान', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.8', 1),
(665, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'संगम टोलको पश्चिम पट्टि तारा सम्झनाको घर जाने सडक स्तरोन्नती', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.81', 1),
(666, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सल्लेगाऊँ भैरव सापकोटाको घरदेखि जयराम काफ्लेको घरसम्मको सडक स्तरोन्नती', '1', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.82', 1),
(667, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सिमाखोलाबाट तल्लो सिरानटोल बाटो निर्माण', '3', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.83', 1),
(668, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'बुढाथोकी टोलबाट फुटुंग जाने बाटो स्तरोन्नती', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.84', 1),
(669, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'टुसालको भित्री बाटो (ढलान भएको ठाउँबाट अगाडि बढाउने)', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.85', 1),
(670, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सविना थापा मगरको घरदेखि राजकुमार कार्कीको घर हुदैं कल्भर्ट जोड्ने सडक स्तरोन्नती', '6', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.86', 1),
(671, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सुन्दरवस्ती हुदैं महादेव खोला जान सडक स्तरोन्नती', '7', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.87', 1),
(672, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सातधारादेखि एलिगेट स्कुल हुदैं खेलकुद मैदान तर्फ ढल तथा  सडक स्तरोन्नती', '5', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.88', 1),
(673, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'काभ्रेस्थली मा.वि. अगाडिको सडक स्तरोन्नती', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.89', 1),
(674, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'कठेरी जाने मुलबाटो स्तरोन्नती', '1', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.9', 1),
(675, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'देवकोटा टोल हुदैं शान्तिधाम जाने सडक स्तरोन्नती', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.91', 1),
(676, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'मनमैजु दपाः छेँ संङ्ग्राहालय निरन्तर स्तरोन्नती', '9', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.92', 1),
(677, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'देउकीको भित्री बाटोमा ढल तथा सडक स्तरोन्नती', '6', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.93', 1),
(678, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'गणतान्त्रिक मार्ग सडक स्तरोन्नती', '3', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.94', 1),
(679, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ठुलागाउँ गल्छीबाट सन्तकनाथ मन्दिर जाने सडक', '3', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.95', 1),
(680, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'तल्लो उपभोक्ता समिति संरचना वस्ती सुधार समाजमा सडक ढलान', '6', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.96', 1),
(681, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'वडा नं. ११ को चारघरे जानेतर्फ पिपलबोट चौतारो सँगैको सडक स्तरोन्नती', '11', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.97', 1),
(682, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'स्यालागुडदेखि राजु लामाको घर जाने चोक हुदैं सिधाअगाडिको सडक निर्माण', '3', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '18.98', 1),
(683, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'हिमालयन वस्ती टोलमा सडक स्तरोन्नती', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.99', 1),
(684, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'ज्ञानभूमि हाइट सुधार समिति अन्तर्गतको बाटो स्तरोन्नती', '8', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.1', 1),
(685, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'वडा नं. १० को स्वास्थ्य कार्यालयबाट सुर्य महर्जनको घर हुदैं हिलेडोलहाईटको मुल सडक स्तरोन्नती', '10', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.101', 1),
(686, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'धितालथोक कृष्ण मन्दिर जाने सडक स्तरोन्नती', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '18.102', 1),
(687, 1, 19, 'नगर सभा', 0, 18, 65, 1, 5, 1, 0, 'देवीको मन्दिर परियार टोल', '3', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '19.1', 1),
(688, 1, 19, 'नगर सभा', 0, 18, 65, 1, 5, 1, 0, 'शान्तिधाम पूर्वाधार निर्माण', '2', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '19.2', 1),
(689, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'शान्तिटोल क्लब भवन', '8', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31112', 1),
(690, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'सामुदायिक महिला भवन (सरकारी धारासँगै)', '7', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31112', 1),
(691, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'विन्दावासिनी सामुदायिक भवन', '1', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31112', 1),
(692, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'भण्डारी गाऊँको सामुदायिक भवन', '2', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31112', 1),
(693, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'लामवगर रमार्इलो पाठशाला अगाडि सार्वजनिक जग्गामा ट्रस निर्माण', '8', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31112', 1),
(694, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'साहित्य सदनको पूर्वाधार निर्माण', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31112', 1),
(695, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'विचारीथोकको बहुउद्देशीय भवन पूर्वाधार निर्माण', '5', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31112', 1),
(696, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'सामुदायिक प्रहरी भवन', '0', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31112', 1),
(697, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'लखनडोल महिला भवन संरक्षण', '1', NULL, 1000000, 0, 0, '0', '0', '1000000', 0, 0, '', '31112', 1),
(698, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 1, 0, 'सामुदायिक विधालय तथा कलेजहरूका लागि भौतिक तथा शैक्षिक सुधार', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '31159', 1),
(699, 1, 19, 'नगर सभा', 0, 20, 8, 17, 5, 1, 0, 'पृथ्वीनारायण स्कुलको भवन निर्माण तथा फर्निचर व्यवस्थापन', '0', NULL, 7500000, 0, 0, '0', '0', '7500000', 0, 0, '', '31159', 1),
(700, 1, 19, 'नगर सभा', 0, 18, 18, 130, 5, 1, 0, 'वडा नं. ३ को वृद्द मिलन चौतरी संरक्षण', '0', NULL, 1500000, 0, 1, '0', '0', '1500000', 0, 0, '', '31159', 1),
(701, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'झण्डापार्क जाने सिढी निर्माण तथा पिकनिक स्पोर्ट व्यवस्थापन', '0', NULL, 5000000, 1, 0, '0', '0', '5000000', 0, 0, '', '31159', 1),
(702, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'चोगाऊँबाट डाँफे हुदैं भ्यू टावर सिढी निर्माण', '0', NULL, 5000000, 1, 0, '0', '0', '5000000', 0, 0, '', '31159', 1),
(703, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'धारावन महांकाल सिढी निर्माण', '6', NULL, 2500000, 1, 0, '0', '0', '2500000', 0, 0, '', '31159', 1),
(704, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'नगरपालिका कार्यालय भवन र धर्मस्थली पुरानो वस्ती जाने बाटोमा गेट निर्माण', '0', NULL, 3500000, 1, 0, '0', '0', '3500000', 0, 0, '', '31159', 1),
(705, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'पुल पुलेसा, बाटो, मठ मन्दिर, कोरिडोर तथा अन्य सार्वजनिक स्थानमा रेलिंग निर्माण तथा संरक्षण', '0', NULL, 4000000, 1, 0, '0', '0', '4000000', 0, 0, '', '31159', 1),
(706, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'रामशरण खत्रीको घर सँगैको सडक (पहिरो नियन्त्रण)', '7', NULL, 2000000, 1, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(707, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'तरकारी बजार व्यवस्थापन', '0', NULL, 3000000, 1, 0, '0', '0', '3000000', 0, 0, '', '31159', 1),
(708, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'सडक विस्तार (उद्दार, राहत तथा पुनर्स्थापना खर्च)', '0', NULL, 1500000, 1, 0, '0', '0', '1500000', 0, 0, '', '31159', 1),
(709, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'विपद् व्यवस्थापन तथा राहत उद्दार कार्यक्रम', '0', NULL, 10000000, 1, 0, '0', '0', '10000000', 0, 0, '', '31159', 1),
(710, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'वडा नं. ३ डाडागाऊँ जानेतर्फ पहिरो नियन्त्रण', '3', NULL, 2000000, 1, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(711, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'उर्जा प्रर्वद्धन (उर्जा प्रवद्र्धन (नगर उज्यालो कार्यक्रम) (सडक पोलबत्ती)', '0', NULL, 32500000, 1, 0, '0', '0', '32500000', 0, 0, '', '31153', 1),
(712, 1, 19, 'नगर सभा', 0, 18, 18, 63, 5, 1, 0, 'नदी नियन्त्रण तथा करिडोर स्तरोन्नति तथा भू-संरक्षण', '0', NULL, 15000000, 1, 0, '0', '0', '15000000', 0, 0, '', '31154', 1),
(713, 1, 19, 'नगर सभा', 0, 18, 37, 208, 5, 1, 0, 'युवा तथा खेलकुद', '0', NULL, 12500000, 0, 0, '0', '0', '12500000', 0, 0, '', '31159', 1),
(714, 1, 19, 'नगर सभा', 0, 18, 37, 208, 5, 1, 0, 'ढकालचौर खेलकुद मैदान स्तरोन्नती', '1', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(715, 1, 19, 'नगर सभा', 0, 18, 37, 208, 5, 1, 0, 'ठुलागाउँ खेलकुद मैदान', '3', NULL, 1500000, 0, 0, '0', '0', '1500000', 0, 0, '', '31159', 1),
(716, 1, 19, 'नगर सभा', 0, 18, 37, 208, 5, 1, 0, 'पृकुन धमस्थली कभर्डहल निर्माण', '6', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(717, 1, 19, 'नगर सभा', 0, 18, 19, 30, 5, 1, 0, 'खानेपानी श्रोत संरक्षण, विस्तार तथा सरसफाई तथा सिचाँर्इ', '0', NULL, 7500000, 0, 1, '0', '0', '7500000', 0, 0, '', '31156', 1),
(718, 1, 19, 'नगर सभा', 0, 18, 19, 30, 5, 1, 0, 'जितपुर ठुलोधारा खानेपानी (साविक जितपुरफेदी ३)', '3', NULL, 3000000, 0, 1, '0', '0', '3000000', 0, 0, '', '31156', 1),
(719, 1, 19, 'नगर सभा', 0, 18, 19, 30, 5, 1, 0, 'धर्मस्थली बजारमा खानेपानी व्यवस्थापन', '6', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '31156', 1),
(720, 1, 19, 'नगर सभा', 0, 18, 19, 30, 5, 1, 0, 'चिलाउनेटार साठीमुरे सिँचार्इ योजना', '3', NULL, 2000000, 0, 1, '0', '0', '2000000', 0, 0, '', '31155', 1),
(721, 1, 19, 'नगर सभा', 0, 19, 22, 112, 5, 1, 0, 'पर्यटकीय पुर्वाधार', '0', NULL, 7500000, 0, 0, '0', '0', '12500000', 0, 0, '', '31159', 1),
(722, 1, 19, 'नगर सभा', 0, 19, 22, 112, 5, 1, 0, 'महाँकाल मन्दिरको छानो निर्माण', '6', NULL, 1500000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(723, 1, 19, 'नगर सभा', 0, 19, 22, 112, 5, 1, 0, 'पृकुन घाट पूर्वाधार निर्माण', '6', NULL, 1000000, 0, 0, '0', '0', '1500000', 0, 0, '', '31159', 1),
(724, 1, 19, 'नगर सभा', 0, 19, 22, 112, 5, 1, 0, 'साङ्गलाको पुरानो बजार कोतघर निर्माण', '1', NULL, 2500000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(725, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'वातावरण संरक्षण, सार्वजनिक जग्गा संरक्षण, पोखरी निर्माण, पार्क तथा बसपार्क निर्माण', '0', NULL, 15000000, 0, 1, '0', '0', '15000000', 0, 0, '', '31159', 1),
(726, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'नगरपालिका कार्यालय सँगैको धर्मस्थली खेलाचौर पार्क निर्माण', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '31159', 1),
(727, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'वडा नं. ११ कार्यालय भवन सँगै पार्क निर्माण', '0', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(728, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'चारघरे जाने बाटो तर्फको पार्क निर्माण', '0', NULL, 2000000, 0, 0, '0', '0', '2000000', 0, 0, '', '31159', 1),
(729, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'पुल तथा कल्भर्ट निर्माण', '0', NULL, 10000000, 0, 0, '0', '0', '10000000', 0, 0, '', '31151', 1),
(730, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'बसन्तक्लोनी गेट छिर्ने पुल निर्माण', '0', NULL, 2500000, 0, 0, '0', '0', '2500000', 0, 0, '', '31151', 1),
(731, 1, 19, 'नगर सभा', 0, 18, 6, 128, 5, 1, 0, 'वडा नं. ४ र ११ जोड्ने पुल (दगुर्नेपानी पिपलको बोटबाट ११ नं. जोड्ने)', '0', NULL, 5000000, 0, 0, '0', '0', '5000000', 0, 0, '', '31151', 1),
(732, 1, 19, 'नगर सभा', 0, 18, 6, 43, 5, 1, 0, 'सडक बोर्ड', '0', NULL, 4500000, 0, 0, '0', '0', '4500000', 0, 0, '', '', 1),
(733, 1, 19, 'नवि नगर सभा ', 0, 20, 0, 0, 5, 1, 0, 'मठ मन्दिर निर्माण ', '2', NULL, 10000000, 1, 0, '0', '0', '10000000', 0, 0, '', '', 1),
(734, 1, 22, 'नगर सभा', 0, 18, 6, 24, 5, 1, 0, ' मिलिजुली टोल सुधार समितिमा वाटो निर्माण', '2', NULL, 1500000, 0, 1, '0', '01500000', '0', 0, 0, '', '31151', 1),
(735, 1, 22, 'नगर सभा', 0, 18, 6, 24, 5, 1, 0, 'श्रैष्ठ कोलोनि भित्र वाटो ढलान', '4', NULL, 1000000, 0, 1, '', '1000000', '0', 0, 0, '', '31151', 1),
(736, 1, 19, 'मिति २०७८।०५।०३ को नगर कार्यपालिकाको कार्यालयको  निर्णय', 0, 18, 6, 24, 5, 1, 0, 'वडा नं ११ कार्यालय अगाडी ढल तथा गेट निर्माण', '11', NULL, 190000, 0, 0, '0', '190000', '0', 0, 0, '', '31159', 1),
(737, 1, 19, 'मिति २०७८।०५।०३ को नगर कार्यपालिकाको कार्यालयको निर्णय', 0, 18, 6, 19, 5, 1, 0, 'नेपालटारमा वाटो मर्मत', '11', NULL, 230000, 0, 0, '0', '230000', '0', 0, 0, '', '31159', 1),
(738, 1, 0, 'da no 7/8 एउटा बनाएर ', 0, 18, 6, 10, 3, 1, 0, 'किसनडोल पिपलवोट सडक jodeko ', '1', NULL, 4500000, 0, 1, '0', '0', '4500000', 0, 0, '', '', 0),
(740, 1, 9, 'टुक्रिएको', 0, 3, 22, 74, 0, 0, 0, 'टुक्रिएर बनेको योजना', '2', NULL, 200000, 0, 0, '0', '0', '200000', 0, 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan_details_anudan`
--

CREATE TABLE `plan_details_anudan` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `is_contingency` int(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `value` int(11) NOT NULL,
  `is_marmat` int(1) NOT NULL DEFAULT 0,
  `is_anudan_add` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plan_katti_record`
--

CREATE TABLE `plan_katti_record` (
  `id` int(11) NOT NULL,
  `katti_id` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `payment_count` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plan_shrot_record`
--

CREATE TABLE `plan_shrot_record` (
  `id` int(11) NOT NULL,
  `shrot_id` int(11) NOT NULL,
  `budget` double(15,2) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plan_starting_fund`
--

CREATE TABLE `plan_starting_fund` (
  `id` int(11) NOT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `advance_taken_date` varchar(255) DEFAULT NULL,
  `advance_taken_group` varchar(255) DEFAULT NULL,
  `advance_taken_group_address` varchar(255) DEFAULT NULL,
  `advance_return_date` varchar(255) DEFAULT NULL,
  `advance_reason` varchar(255) DEFAULT NULL,
  `advance_taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `advance_return_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `peski_stat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_starting_fund`
--

INSERT INTO `plan_starting_fund` (`id`, `advance`, `advance_taken_date`, `advance_taken_group`, `advance_taken_group_address`, `advance_return_date`, `advance_reason`, `advance_taken_date_english`, `advance_return_date_english`, `plan_id`, `created_date`, `peski_stat`) VALUES
(2, '80000', '2078-08-24', '', '', '2078-08-22', 'पैसा नभएर ', '2021-12-10', '2021-12-8', 2, '2021-12-10', NULL),
(10, '20000', '2078-09-21', '', '', '2078-09-20', 'karan3', '2022-1-5', '2022-1-4', 1, '2022-01-05', 2),
(11, '10000', '2078-09-21', '', '', '2078-09-545', 'karan4', '2022-1-5', '2022-1-4', 1, '2022-01-06', 3),
(12, '20000', '2078-09-21', '', '', '2078-09-20', 'paisa nabhayera', '2022-1-5', '2022-1-4', 3, '2022-01-14', 1),
(19, '80000', '2078-10-02', '', '', '2078-10-10', 'no money no work so to start doing work we need money', '2022-1-16', '2022-1-24', 15, '2022-01-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plan_time_addition_affiliation`
--

CREATE TABLE `plan_time_addition_affiliation` (
  `id` int(11) NOT NULL,
  `period` varchar(255) DEFAULT NULL,
  `program_problem_reason` varchar(255) DEFAULT NULL,
  `letter_date` varchar(10) DEFAULT NULL,
  `letter_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `decesion_date` varchar(10) DEFAULT NULL,
  `decesion_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `extended_date` varchar(10) DEFAULT NULL,
  `extended_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_time_addition_affiliation`
--

INSERT INTO `plan_time_addition_affiliation` (`id`, `period`, `program_problem_reason`, `letter_date`, `letter_date_english`, `decesion_date`, `decesion_date_english`, `extended_date`, `extended_date_english`, `plan_id`) VALUES
(1, '1', 'kaamdaar namilera', '2078-08-02', '2021-11-18', '2078-08-24', '2078-08-24', '2078-08-29', '2021-12-15', 2),
(2, '1', 'reason', '2078-09-29', '2022-1-13', '2078-09-28', '2078-09-28', '2078-09-30', '2022-1-14', 1),
(3, '1', 'kam nasakiyeko ', '2078-09-29', '2022-1-13', '2078-09-29', '2078-09-29', '2078-09-30', '2022-1-14', 3),
(4, '1', 'काम रामो संग नगरेको भएर', '2078-10-02', '2022-1-16', '2078-10-18', '2078-10-18', '2078-10-28', '2022-2-11', 15);

-- --------------------------------------------------------

--
-- Table structure for table `plan_total_investment`
--

CREATE TABLE `plan_total_investment` (
  `id` int(11) NOT NULL,
  `agreement_gauplaika` varchar(255) DEFAULT NULL,
  `agreement_other` varchar(255) DEFAULT NULL,
  `costumer_agreement` varchar(255) DEFAULT NULL,
  `other_agreement` varchar(255) DEFAULT NULL,
  `bhuktani_anudan` varchar(255) DEFAULT NULL,
  `costumer_investment` varchar(255) DEFAULT NULL,
  `total_investment` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_total` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contingency` double(15,2) NOT NULL,
  `anudan_con` float NOT NULL,
  `aanya_nikaya_con` float NOT NULL,
  `aanya_sajhedari_con` float NOT NULL,
  `nagad_sajhedari_con` float NOT NULL,
  `update_status` varchar(255) DEFAULT NULL,
  `marmat_new` float DEFAULT NULL,
  `marmat_old` float DEFAULT NULL,
  `bipat_new` float DEFAULT NULL,
  `b_pat` float DEFAULT NULL,
  `sajhedari_per` float DEFAULT NULL,
  `janashramdan` float DEFAULT NULL,
  `agreement_other_title` varchar(255) DEFAULT NULL,
  `other_agreement_title` varchar(255) DEFAULT NULL,
  `kul_lagat_anuman` varchar(255) DEFAULT NULL,
  `kul_lagat_con` varchar(255) DEFAULT NULL,
  `nagad_sajhedari_add` varchar(255) DEFAULT NULL,
  `aanya_nikaya_add` varchar(255) DEFAULT NULL,
  `aanya_sajhedari_add` varchar(255) DEFAULT NULL,
  `marmat_value_new` int(11) DEFAULT NULL,
  `marmat_value_kul_lagat` int(11) DEFAULT NULL,
  `marmat_value_aanya_nikaya` float DEFAULT NULL,
  `marmat_value_aanya_sajhedari` float DEFAULT NULL,
  `marmat_value_nagad_sajhedari` float DEFAULT NULL,
  `marmat` float DEFAULT NULL,
  `approved` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_total_investment`
--

INSERT INTO `plan_total_investment` (`id`, `agreement_gauplaika`, `agreement_other`, `costumer_agreement`, `other_agreement`, `bhuktani_anudan`, `costumer_investment`, `total_investment`, `plan_id`, `unit_id`, `unit_total`, `created_date`, `contingency`, `anudan_con`, `aanya_nikaya_con`, `aanya_sajhedari_con`, `nagad_sajhedari_con`, `update_status`, `marmat_new`, `marmat_old`, `bipat_new`, `b_pat`, `sajhedari_per`, `janashramdan`, `agreement_other_title`, `other_agreement_title`, `kul_lagat_anuman`, `kul_lagat_con`, `nagad_sajhedari_add`, `aanya_nikaya_add`, `aanya_sajhedari_add`, `marmat_value_new`, `marmat_value_kul_lagat`, `marmat_value_aanya_nikaya`, `marmat_value_aanya_sajhedari`, `marmat_value_nagad_sajhedari`, `marmat`, `approved`) VALUES
(2, '500000', '0', '100000', '0', '585000', '140000.00', '725000', 1, 0, '', '2021-12-23', 0.00, 1, 0, 0, 0, NULL, 10000, 2, 0, 0, 20, 0, 'अन्य निकायबाट प्राप्त अनुदान :', 'अन्य साझेदारी :', '127328.28', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(3, '', '', '', '', '', '', '', 0, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '', '', '', '', '', '', '', 0, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '', '', '', '', '', '', '', 0, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '', '', '', '', '', '', '', 0, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '', '', '', '', '', '', '', 0, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '', '', '', '', '', '', '', 56, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '', '', '142476.36', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(9, '', '', '', '', '', '', '', 96, 0, '', '', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '', '', '20000', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(10, '150000', '0', '0', '0', '150000.00', '50000.00', '200000.00', 98, 0, '', '2021-10-05', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 'अन्य निकायबाट प्राप्त अनुदान :', 'अन्य साझेदारी :', '142476.36', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(11, '500000', '0', '0', '0', '500000.00', '100000.00', '600000.00', 88, 0, '', '2021-10-05', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 'अन्य निकायबाट प्राप्त अनुदान :', 'अन्य साझेदारी :', '600000', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(12, '235000', '0', '0', '0', '227950.00', '72050.00', '300000.00', 176, 0, '', '2021-10-08', 7050.00, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 'अन्य निकायबाट प्राप्त अनुदान :', 'अन्य साझेदारी :', '300000', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(13, '2000000', '0', '0', '0', '2000000.00', '0', '2000000.00', 38, 0, '', '2022-01-11', 0.00, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 'अन्य निकायबाट प्राप्त अनुदान :', 'अन्य साझेदारी :', '0.00', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `postname`
--

CREATE TABLE `postname` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postname`
--

INSERT INTO `postname` (`id`, `name`, `type`) VALUES
(1, 'अध्यक्ष ', 0),
(2, 'उपाध्यक्ष ', 0),
(3, 'सचिब', 0),
(4, 'कोषाध्यक्ष', 0),
(5, 'सदस्य', 1),
(6, 'संयोजक', 1);

-- --------------------------------------------------------

--
-- Table structure for table `print_details`
--

CREATE TABLE `print_details` (
  `id` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nepali_date` text DEFAULT NULL,
  `english_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `print_history`
--

CREATE TABLE `print_history` (
  `id` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `letter_type` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_name1` text DEFAULT NULL,
  `type_name2` text DEFAULT NULL,
  `type_name3` text DEFAULT NULL,
  `type_name4` text DEFAULT NULL,
  `worker1` int(11) NOT NULL,
  `worker2` int(11) NOT NULL,
  `worker3` int(11) NOT NULL,
  `worker4` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nepali_date` text DEFAULT NULL,
  `english_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodartha` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `print_history`
--

INSERT INTO `print_history` (`id`, `url`, `letter_type`, `plan_id`, `user_id`, `type_name1`, `type_name2`, `type_name3`, `type_name4`, `worker1`, `worker2`, `worker3`, `worker4`, `created_at`, `nepali_date`, `english_date`, `bodartha`) VALUES
(1, 'yojana_hastantaran_form_print.php', NULL, 1, 1, '', '', '', '', 0, 0, 1, 0, '2022-01-12 10:39:39', '2078-9-28', '2022-1-12', NULL),
(2, 'yojana_progress_letter_print.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-12 10:42:31', '2078-9-28', '2022-1-12', NULL),
(3, 'print_bank_report03_final.php', NULL, 1, 1, '', '', '', '', 2, 1, 0, 0, '2022-01-16 07:09:48', '2078-10-2', '2022-1-16', NULL),
(4, 'print_bank_report_04_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-12 11:35:00', '', '--', NULL),
(5, 'print_bank_report_04_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-12 11:36:04', '', '--', NULL),
(6, 'print_bank_report07_final.php', NULL, 1, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-12 11:36:17', '', '--', NULL),
(7, 'print_bank_report_04_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-13 05:21:50', '', '--', NULL),
(8, 'print_bank_report06_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-13 05:25:25', '2078-9-29', '2022-1-13', NULL),
(9, 'print_bank_report06_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-13 05:26:34', '2078-9-29', '2022-1-13', NULL),
(10, 'print_bank_report01_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-13 05:35:16', '2078-9-29', '2022-1-13', NULL),
(11, '', NULL, 0, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:37:25', '', '--', NULL),
(12, '', NULL, 0, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:38:27', '', '--', NULL),
(13, '', NULL, 0, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:38:47', '', '--', NULL),
(14, 'karya_sampan_print.php', NULL, 1, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:40:26', '2078-9-29', '2022-1-13', NULL),
(15, 'print_bank_report_09_final.php', NULL, 1, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:51:00', '', '--', NULL),
(16, 'print_bank_report_09_final.php', NULL, 1, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 05:57:48', '', '--', NULL),
(17, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:38:58', '2078-9-29', '2022-1-13', NULL),
(18, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:40:01', '2078-9-29', '2022-1-13', NULL),
(19, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:41:03', '2078-9-29', '2022-1-13', NULL),
(20, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:41:17', '2078-9-29', '2022-1-13', NULL),
(21, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:42:02', '2078-9-29', '2022-1-13', NULL),
(22, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:42:57', '2078-9-29', '2022-1-13', NULL),
(23, 'print_bank_report_11_final.php', NULL, 1, 1, '', '', '', '', 1, 1, 0, 2, '2022-01-13 06:43:20', '2078-9-29', '2022-1-13', NULL),
(24, 'yojana_hastantaran_samjhauta_print.php', NULL, 1, 0, '', '', '', '', 1, 0, 0, 0, '2022-01-13 06:47:17', '2078-9-29', '2022-1-13', NULL),
(25, 'plan_ifsuccess_letter_print.php', NULL, 1, 0, '', '', '', '', 4, 0, 0, 0, '2022-01-13 06:57:53', '2078-9-29', '2022-1-13', NULL),
(26, 'amanat_tippani_patra_print.php', NULL, 2, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 07:12:10', '2078-9-29', '2022-1-13', NULL),
(27, 'amanat_karyadesh_patra_print.php', NULL, 2, 1, '', '', '', '', 2, 2, 4, 0, '2022-01-13 07:14:04', '2078-9-29', '2022-1-13', NULL),
(28, 'amanat_rakam_nikasa_patra_print.php', NULL, 2, 1, '', '', '', '', 1, 3, 0, 5, '2022-01-13 07:24:09', '2078-9-29', '2022-1-13', NULL),
(29, 'print_bank_report07_final.php', NULL, 2, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 07:25:33', '', '--', NULL),
(30, 'print_bank_report_09_final.php', NULL, 2, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 07:56:19', '', '--', NULL),
(31, 'amanat_bhuktani_patra_print.php', NULL, 2, 1, '', '', '', '', 1, 2, 3, 5, '2022-01-13 08:13:38', '2078-9-29', '2022-1-13', NULL),
(44, 'samiti_final_letter_final.php', NULL, 3, 1, '', '', '', '', 3, 0, 1, 0, '2022-01-14 07:13:18', '', '--', NULL),
(43, 'samiti_analysis_letter_final.php', NULL, 3, 1, '', '', '', '', 2, 1, 0, 0, '2022-01-14 07:10:58', '2078-9-30', '2022-1-14', NULL),
(42, 'samiti_add_date_letter_final.php', NULL, 3, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 08:48:18', '', '--', NULL),
(41, 'samiti_additional_date_tippani_letter_final.php', NULL, 3, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 08:46:44', '', '--', NULL),
(40, 'samiti_bank_letter_final.php', NULL, 0, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 08:43:40', '', '--', NULL),
(39, 'samiti_bank_letter_final.php', NULL, 0, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-13 08:43:29', '', '--', NULL),
(45, 'contract_print_karyadesh_report_09_final.php', NULL, 6, 1, '', '', '', '', 1, 5, 3, 2, '2022-01-14 07:17:16', '2078-9-30', '2022-1-14', NULL),
(46, 'contract_print_karyadesh_report_02_final.php', NULL, 6, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-14 08:52:23', '', '--', NULL),
(47, 'contract_print_karyadesh_report_03_final.php', NULL, 6, 1, '', '', '', '', 2, 0, 1, 0, '2022-01-14 08:54:20', '', '--', NULL),
(48, 'contract_print_karyadesh_report_04_final.php', NULL, 6, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-14 08:56:04', '', '--', NULL),
(49, 'contract_print_karyadesh_report_05_final.php', NULL, 6, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-14 08:57:13', '', '--', NULL),
(50, 'contract_print_karyadesh_report_05_final.php', NULL, 6, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-14 08:57:23', '', '--', NULL),
(51, 'contract_print_karyadesh_report_05_final.php', NULL, 6, 0, '', '', '', '', 0, 0, 0, 0, '2022-01-14 08:58:06', '', '--', NULL),
(52, 'contract_print_karyadesh_report_06_final.php', NULL, 6, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 05:34:32', '2078-10-2', '2022-1-16', NULL),
(53, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-14 10:51:06', '2078-9-30', '2022-1-14', NULL),
(54, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-14 10:51:18', '2078-9-30', '2022-1-14', NULL),
(55, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-14 10:52:12', '2078-9-30', '2022-1-14', NULL),
(56, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-14 10:52:25', '2078-9-30', '2022-1-14', NULL),
(57, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-14 10:52:45', '2078-9-30', '2022-1-14', NULL),
(58, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-14 10:53:19', '2078-9-30', '2022-1-14', NULL),
(59, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 05:41:04', '2078-10-2', '2022-1-16', NULL),
(60, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 05:41:16', '2078-10-2', '2022-1-16', NULL),
(61, 'contract_print_karyadesh_report_07_final.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 05:41:44', '2078-10-2', '2022-1-16', NULL),
(62, 'ethekka_tippani_patra_print.php', NULL, 15, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 06:12:56', '2078-10-2', '2022-1-16', NULL),
(63, 'ethekka_aashay_suchana_print.php', NULL, 15, 1, '', '', '', '', 0, 3, 0, 0, '2022-01-16 06:15:25', '2078-10-2', '2022-1-16', NULL),
(64, 'ethekka_bolpatra_aashay_print.php', NULL, 15, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 06:18:42', '2078-10-2', '2022-1-16', NULL),
(65, 'ethekka_jamanat_fukuwa_print.php', NULL, 15, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 06:22:45', '2078-10-2', '2022-1-16', NULL),
(66, 'ethekka_bolpatra_samjhauta_print.php', NULL, 15, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 06:25:23', '2078-10-2', '2022-1-16', NULL),
(67, 'ethekka_samjhauta_print.php', NULL, 15, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 06:27:06', '2078-10-2', '2022-1-16', NULL),
(68, 'ethekka_karyadesh_patra_print.php', NULL, 15, 1, '', '', '', '', 0, 3, 0, 0, '2022-01-16 06:28:59', '2078-10-2', '2022-1-16', NULL),
(69, 'ethekka_samjhauta_patra_print.php', NULL, 15, 1, '', '', '', '', 1, 2, 0, 0, '2022-01-16 06:31:48', '2078-10-02', '2022-1-16', NULL),
(70, 'ethekka_peski_tippani_print.php', NULL, 15, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 07:29:13', '2078-10-2', '2022-1-16', NULL),
(71, 'ethekka_myadthap_tippani_print.php', NULL, 15, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 07:43:00', '', '--', NULL),
(72, 'ethekka_final_tippani_print.php', NULL, 0, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 10:36:36', '2078-10-2', '2022-1-16', NULL),
(73, '6', NULL, 12, 0, 'तयार गर्न', 'तयार गर्न', 'योजना शाखा', 'आर्थिक प्रशासन शाखा', 0, 0, 0, 0, '2022-01-16 10:54:15', '0', '--', NULL),
(74, 'print_quotation_kabol_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 10:57:11', '2078-10-2', '2022-1-16', NULL),
(75, 'print_quotation_kabol_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 10:57:56', '2078-10-2', '2022-1-16', NULL),
(76, 'print_quotation_kabol_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 10:58:39', '2078-10-2', '2022-1-16', NULL),
(77, 'print_quotation_kabol_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 10:58:56', '2078-10-2', '2022-1-16', NULL),
(78, 'print_quotation_kabol_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 11:00:55', '2078-10-2', '2022-1-16', NULL),
(79, 'print_quotation_kabol_samjhauta_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 11:04:19', '2078-10-2', '2022-1-16', NULL),
(80, 'quotation_dar_vau_print.php', NULL, 12, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 11:07:05', '2078-10-2', '2022-1-16', NULL),
(81, 'quotation_dar_vau_print.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:07:23', '2078-10-2', '2022-1-16', NULL),
(82, 'quotation_dar_vau_print.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:07:52', '2078-10-2', '2022-1-16', NULL),
(83, 'quotation_dar_vau_print.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:08:37', '2078-10-2', '2022-1-16', NULL),
(84, 'print_quotation_kabol_samjhauta_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 11:17:23', '2078-10-2', '2022-1-16', NULL),
(85, 'print_quotation_kabol_samjhauta_final.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-16 11:17:48', '2078-10-2', '2022-1-16', NULL),
(86, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:22:45', '2078-10-2', '2022-1-16', NULL),
(87, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:23:18', '2078-10-2', '2022-1-16', NULL),
(88, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:23:20', '2078-10-2', '2022-1-16', NULL),
(89, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:23:48', '2078-10-2', '2022-1-16', NULL),
(90, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:34:52', '2078-10-2', '2022-1-16', NULL),
(91, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 2, 0, 0, '2022-01-16 11:34:58', '2078-10-2', '2022-1-16', NULL),
(92, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 2, 0, 0, '2022-01-16 11:35:16', '2078-10-2', '2022-1-16', NULL),
(93, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 2, 0, 0, '2022-01-16 11:37:07', '2078-10-2', '2022-1-16', NULL),
(94, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 2, 0, 0, '2022-01-16 11:37:42', '2078-10-2', '2022-1-16', NULL),
(95, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 2, 0, 0, '2022-01-16 11:38:49', '2078-10-2', '2022-1-16', NULL),
(96, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:46:58', '2078-10-2', '2022-1-16', NULL),
(97, 'print_quotation_kabol_samjhauta_patra_final.php', NULL, 12, 1, '', '', '', '', 0, 1, 0, 0, '2022-01-16 11:47:17', '2078-10-2', '2022-1-16', NULL),
(98, 'print_quotation_kabol_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-16 11:48:14', '2078-10-2', '2022-1-16', NULL),
(99, 'print_quotation_kabol_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:48:28', '2078-10-2', '2022-1-16', NULL),
(100, 'print_quotation_kabol_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:49:40', '2078-10-2', '2022-1-16', NULL),
(101, 'print_quotation_kabol_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-16 11:50:15', '2078-10-2', '2022-1-16', NULL),
(102, 'print_quotation_kabol_samjhauta_final.php', NULL, 12, 1, '', '', '', '', 2, 1, 2, 0, '2022-01-17 05:27:51', '2078-10-3', '2022-1-17', NULL),
(103, 'print_quotation_kabol_samjhauta_final.php', NULL, 12, 1, '', '', '', '', 2, 1, 2, 0, '2022-01-17 05:28:19', '2078-10-3', '2022-1-17', NULL),
(104, 'quotation_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-17 05:33:22', '2078-10-3', '2022-1-17', NULL),
(105, 'quotation_karyadesh_final.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-17 05:34:18', '2078-10-3', '2022-1-17', NULL),
(106, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-17 08:12:08', '2078-10-3', '2022-1-17', NULL),
(107, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 4, 1, 2, 0, '2022-01-17 08:14:01', '2078-10-3', '2022-1-17', NULL),
(108, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-17 08:16:48', '2078-10-3', '2022-1-17', NULL),
(109, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-17 08:17:15', '2078-10-3', '2022-1-17', NULL),
(110, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-17 08:17:37', '2078-10-3', '2022-1-17', NULL),
(111, 'quotation_antim_bhuktani_print.php', NULL, 12, 1, '', '', '', '', 3, 1, 2, 0, '2022-01-17 08:18:48', '2078-10-3', '2022-1-17', NULL),
(112, 'print_bank_report08_final.php', NULL, 1, 1, '', '', '', '', 0, 0, 0, 0, '2022-01-18 07:16:12', '2078-10-4', '2022-1-18', NULL),
(113, 'print_bank_report02_final.php', NULL, 1, 1, '', '', '', '', 1, 0, 0, 0, '2022-01-18 07:17:16', '२०७८-०५-०२', '--', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profitable_family_details`
--

CREATE TABLE `profitable_family_details` (
  `id` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `dalit_ghar` varchar(255) DEFAULT NULL,
  `dalit_mahila` varchar(255) DEFAULT NULL,
  `dalit_purush` varchar(255) DEFAULT NULL,
  `aadhibasi_ghar` varchar(255) DEFAULT NULL,
  `aadhibasi_mahila` varchar(255) DEFAULT NULL,
  `aadhibasi_purush` varchar(255) DEFAULT NULL,
  `anya_ghar` varchar(255) DEFAULT NULL,
  `anya_mahila` varchar(255) DEFAULT NULL,
  `anya_purush` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `total1` int(11) NOT NULL,
  `total2` int(11) NOT NULL,
  `total6` int(11) NOT NULL,
  `kul1` int(11) NOT NULL,
  `kul2` int(11) NOT NULL,
  `kul3` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profitable_family_details`
--

INSERT INTO `profitable_family_details` (`id`, `type`, `dalit_ghar`, `dalit_mahila`, `dalit_purush`, `aadhibasi_ghar`, `aadhibasi_mahila`, `aadhibasi_purush`, `anya_ghar`, `anya_mahila`, `anya_purush`, `total`, `total1`, `total2`, `total6`, `kul1`, `kul2`, `kul3`, `plan_id`) VALUES
(25, 0, '10', '10', '10', '10', '10', '10', '10', '10', '10', '20', 20, 20, 60, 30, 30, 30, 65),
(27, 0, '15', '', '', '', '', '', '', '', '', '', 0, 0, 0, 15, 0, 0, 738),
(32, 0, '10', '10', '10', '10', '10', '10', '10', '10', '10', '20', 20, 20, 60, 30, 30, 30, 176),
(36, 0, '10', '10', '10', '10', '10', '10', '10', '10', '10', '20', 20, 20, 60, 30, 30, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_details`
--

CREATE TABLE `program_details` (
  `id` int(11) NOT NULL,
  `fiscal_id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `topic_area_type_sub_id` int(11) NOT NULL,
  `topic_area_agreement_id` int(11) NOT NULL,
  `topic_area_investment_id` int(11) NOT NULL,
  `topic_area_investment_source_id` int(11) NOT NULL,
  `program_name` text DEFAULT NULL,
  `ward_no` int(11) NOT NULL,
  `tole_name` varchar(255) DEFAULT NULL,
  `investment_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program_katti_bibaran`
--

CREATE TABLE `program_katti_bibaran` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `topic_name` int(11) NOT NULL,
  `percent` float NOT NULL,
  `kar_katti_amount` float NOT NULL,
  `katti_kar` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program_katti_bibaran`
--

INSERT INTO `program_katti_bibaran` (`id`, `program_id`, `topic_name`, `percent`, `kar_katti_amount`, `katti_kar`) VALUES
(9, 268, 4, 15, 1200, 180),
(10, 268, 5, 1.5, 1200, 18),
(11, 268, 6, 2, 1200, 24),
(12, 268, 7, 12, 1200, 144),
(13, 21, 4, 15, 12000, 1800),
(14, 21, 5, 1.5, 15000, 225);

-- --------------------------------------------------------

--
-- Table structure for table `program_more_details`
--

CREATE TABLE `program_more_details` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `remaining_budget` varchar(255) DEFAULT NULL,
  `work_order_date` varchar(50) DEFAULT NULL,
  `work_order_budget` varchar(255) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `start_date_english` text DEFAULT NULL,
  `completion_date` varchar(50) DEFAULT NULL,
  `completion_date_english` text DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `enlist_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `total_family_members` varchar(50) DEFAULT NULL,
  `male` varchar(50) DEFAULT NULL,
  `female` varchar(50) DEFAULT NULL,
  `total_members` varchar(50) DEFAULT NULL,
  `worker_id` text DEFAULT NULL,
  `samjhauta_miti` text DEFAULT NULL,
  `program_id` int(11) NOT NULL,
  `con_per` float DEFAULT NULL,
  `bipat_per` float DEFAULT NULL,
  `marmat_per` float DEFAULT NULL,
  `contingency` float DEFAULT NULL,
  `bipat` float DEFAULT NULL,
  `marmat` float DEFAULT NULL,
  `aim` varchar(255) DEFAULT NULL,
  `bill_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program_more_details`
--

INSERT INTO `program_more_details` (`id`, `sn`, `budget`, `remaining_budget`, `work_order_date`, `work_order_budget`, `start_date`, `start_date_english`, `completion_date`, `completion_date_english`, `venue`, `enlist_id`, `type_id`, `total_family_members`, `male`, `female`, `total_members`, `worker_id`, `samjhauta_miti`, `program_id`, `con_per`, `bipat_per`, `marmat_per`, `contingency`, `bipat`, `marmat`, `aim`, `bill_amount`) VALUES
(3, 1, '200000', '4000', '2078-06-07', '196000', '2078-06-07', '2021-9-23', '2078-06-15', '2021-10-1', 'sthan', 1, 0, '10', '10', '10', '20', '1', '2078-06-07', 268, 2, 0, 0, 4000, 0, 0, 'xcxzcxzc', NULL),
(5, 1, '700000', '42000', '2078-08-22', '658000', '2078-08-22', '2021-12-8', '2078-08-22', '2021-12-8', 'sthan', 4, 1, '10', '10', '10', '20', '2', '2078-08-22', 21, 2, 2, 2, 14000, 14000, 14000, 'bgfbhcvbvc', NULL),
(6, 1, '350000', '21000', '2078-10-05', '329000', '2078-10-12', '2022-1-26', '2078-10-27', '2022-2-10', 'काठमाडौँ', 5, 0, '10', '10', '10', '20', '1', '2078-10-05', 17, 2, 2, 2, 7000, 7000, 7000, 'ढल निकास को व्यवस्था गरि सर्बसाधारणहरु लाई सुबिधा मुखी पालिका निर्माण गर्ने', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program_payment`
--

CREATE TABLE `program_payment` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `payment_holder_name` varchar(100) DEFAULT NULL,
  `payment_holder_father_name` varchar(100) DEFAULT NULL,
  `payment_holder_grandfather_name` varchar(100) DEFAULT NULL,
  `payment_amount` varchar(100) DEFAULT NULL,
  `paid_date` varchar(100) DEFAULT NULL,
  `paid_date_english` text DEFAULT NULL,
  `payment_flow_date` varchar(100) DEFAULT NULL,
  `payment_flow_date_english` text DEFAULT NULL,
  `payment_reason` varchar(255) DEFAULT NULL,
  `program_id` int(11) NOT NULL,
  `enlist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program_payment_final`
--

CREATE TABLE `program_payment_final` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `program_remaining_amount` varchar(100) DEFAULT NULL,
  `paid_date` varchar(50) DEFAULT NULL,
  `paid_date_english` date NOT NULL,
  `total_payment_amount` varchar(100) DEFAULT NULL,
  `pan_total_amt` varchar(25) DEFAULT NULL,
  `pan_tds` varchar(25) DEFAULT NULL,
  `vat_total_amt` varchar(25) DEFAULT NULL,
  `vat_tds` varchar(25) DEFAULT NULL,
  `vat_amount` varchar(25) DEFAULT NULL,
  `total_bill` varchar(25) DEFAULT NULL,
  `tax_tot` varchar(25) DEFAULT NULL,
  `more_less` varchar(25) DEFAULT NULL,
  `payment_taken_amount` varchar(100) DEFAULT NULL,
  `congentency_amount` varchar(100) DEFAULT NULL,
  `maintainance_amount` varchar(100) DEFAULT NULL,
  `deposit_amount` varchar(100) DEFAULT NULL,
  `emergency_amount` varchar(100) DEFAULT NULL,
  `total_amount` varchar(100) DEFAULT NULL,
  `net_total_amount` varchar(100) DEFAULT NULL,
  `program_id` int(11) NOT NULL,
  `enlist_id` int(11) NOT NULL,
  `katti_amt` varchar(25) DEFAULT NULL,
  `marmat` float DEFAULT NULL,
  `cont` float DEFAULT NULL,
  `bipat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program_payment_final`
--

INSERT INTO `program_payment_final` (`id`, `sn`, `program_remaining_amount`, `paid_date`, `paid_date_english`, `total_payment_amount`, `pan_total_amt`, `pan_tds`, `vat_total_amt`, `vat_tds`, `vat_amount`, `total_bill`, `tax_tot`, `more_less`, `payment_taken_amount`, `congentency_amount`, `maintainance_amount`, `deposit_amount`, `emergency_amount`, `total_amount`, `net_total_amount`, `program_id`, `enlist_id`, `katti_amt`, `marmat`, `cont`, `bipat`) VALUES
(8, 1, '4000', '2078-06-10', '2021-09-26', '196000', '193000', '28950', '0', '0', '0', '193000', '28950', '', '0', '', '', '0', '', '', '158684', 268, 1, '34316', 2000, 3000, 0),
(9, 1, '42000', '', '0000-00-00', '658000', '600000', '90000', '560000', '8400', '72800', '1232800', '98400', '574800', '0', '', '', '0', '', '', '559600', 21, 4, '148425', 12000, 18000, 18000);

-- --------------------------------------------------------

--
-- Table structure for table `program_payment_final_deposit_return`
--

CREATE TABLE `program_payment_final_deposit_return` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `deposit_amount` text DEFAULT NULL,
  `enlist_id` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `period` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program_time_addition_affiliation`
--

CREATE TABLE `program_time_addition_affiliation` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `period` varchar(255) DEFAULT NULL,
  `program_problem_reason` varchar(255) DEFAULT NULL,
  `letter_date` varchar(10) DEFAULT NULL,
  `letter_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `decesion_date` varchar(10) DEFAULT NULL,
  `decesion_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `extended_date` varchar(10) DEFAULT NULL,
  `extended_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `public_investigation_details`
--

CREATE TABLE `public_investigation_details` (
  `id` int(11) NOT NULL,
  `survey_date` varchar(255) DEFAULT NULL,
  `survey_date_english` varchar(50) DEFAULT NULL,
  `population` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `public_investigation_details`
--

INSERT INTO `public_investigation_details` (`id`, `survey_date`, `survey_date_english`, `population`, `plan_id`, `created_date`) VALUES
(1, '2078-05-09', '2021-8-25', '50', 1, ''),
(2, '2078-05-09', '2021-8-25', '50', 1, ''),
(3, '', '--', '', 2, ''),
(4, '', '--', '', 1, ''),
(5, '', '--', '', 1, ''),
(6, '', '--', '', 1, ''),
(7, '', '--', '', 1, ''),
(8, '', '--', '', 1, ''),
(9, '', '--', '', 1, ''),
(10, '', '--', '', 1, ''),
(11, '', '--', '', 1, ''),
(12, '', '--', '', 1, ''),
(13, '2078-05-28', '2021-9-13', '20', 1, ''),
(14, '', '--', '', 1, ''),
(15, '', '--', '', 1, ''),
(16, '', '--', '', 1, ''),
(17, '', '--', '', 65, ''),
(18, '', '--', '', 1, ''),
(19, '', '--', '', 4, ''),
(20, '', '--', '', 3, ''),
(21, '', '--', '', 1, ''),
(22, '', '--', '', 1, ''),
(23, '', '--', '', 1, ''),
(24, '', '--', '', 176, ''),
(25, '', '--', '', 26, ''),
(26, '', '--', '', 26, ''),
(27, '', '--', '', 100, ''),
(28, '', '--', '', 1, ''),
(29, '', '--', '', 1, ''),
(30, '', '--', '', 1, ''),
(31, '', '--', '', 1, ''),
(32, '', '--', '', 1, ''),
(33, '', '--', '', 2, ''),
(34, '', '--', '', 2, ''),
(35, '', '--', '', 15, '');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_enlist_form`
--

CREATE TABLE `quotation_enlist_form` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `enlist_id` int(11) NOT NULL,
  `enlist_type` tinyint(4) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `extra_amount` double(15,2) NOT NULL,
  `is_vat` tinyint(4) NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotation_enlist_form`
--

INSERT INTO `quotation_enlist_form` (`id`, `plan_id`, `enlist_id`, `enlist_type`, `amount`, `extra_amount`, `is_vat`, `remarks`) VALUES
(1, 66, 1, 10, 200000.00, 0.00, 1, ''),
(2, 21, 1, 0, 100000.00, 0.00, 1, ''),
(3, 21, 1, 10, 200000.00, 0.00, 1, ''),
(6, 5, 1, 10, 300000.00, 0.00, 1, ''),
(7, 5, 1, 0, 200000.00, 0.00, 2, ''),
(8, 69, 1, 10, 400000.00, 0.00, 1, ''),
(11, 26, 1, 10, 470000.00, 0.00, 1, '-'),
(12, 100, 1, 10, 200000.00, 200.00, 1, 'kampany base'),
(20, 12, 1, 10, 2000000.00, 20000.00, 1, 'kampany base'),
(21, 12, 4, 1, 2300000.00, 30000.00, 2, 'kampany base');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_letter_content`
--

CREATE TABLE `quotation_letter_content` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `letter` varchar(255) NOT NULL,
  `content_1` text NOT NULL,
  `content_2` text NOT NULL,
  `content_3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quotation_letter_content`
--

INSERT INTO `quotation_letter_content` (`id`, `plan_id`, `letter`, `content_1`, `content_2`, `content_3`) VALUES
(1, 7, 'quotation_lagat_anuman', 'सार्वजनिक खरिद नियमावलीको नियम 15 को उपनियम (१) वमोजिम', 'सार्वजनिक खरिद नियमावलीको नियम ८५ को उपनियम (१) (क) तथा सोही नियमावलीको नियम ८५ को उपनियम (5) वमोजिमको', ''),
(2, 26, 'quotation_lagat_anuman', 'सार्वजनिक खरिद नियमावलीको नियम १४ को उपनियम (१) वमोजिम', '', ''),
(3, 5, 'quotation_lagat_anuman', 'सार्वजनिक खरिद नियमावलीको नियम १४ को उपनियम (१) वमोजिम', 'सार्वजनिक खरिद नियमावलीको नियम ८५ को उपनियम (१) (क) तथा सोही नियमावलीको नियम ८५ को उपनियम (४) वमोजिमको', ''),
(4, 99, 'quotation_lagat_anuman', '', '', ''),
(5, 12, 'quotation_lagat_anuman', 'सार्वजनिक खरिद नियमावलीको नियम १४ को उपनियम (१) वमोजिम', 'सार्वजनिक खरिद नियमावलीको नियम ८५ को उपनियम (१) (क) तथा सोही नियमावलीको नियम ८५ को उपनियम (४) वमोजिमको', '');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_more_details`
--

CREATE TABLE `quotation_more_details` (
  `id` int(11) NOT NULL,
  `yojana_start_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_end_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_place` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `samjhauta_party` int(11) NOT NULL,
  `post_id_3` text DEFAULT NULL,
  `miti` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotation_more_details`
--

INSERT INTO `quotation_more_details` (`id`, `yojana_start_date`, `yojana_end_date`, `yojana_place`, `plan_id`, `samjhauta_party`, `post_id_3`, `miti`, `yojana_description`) VALUES
(1, '2078-05-23', '2078-05-31', 'sthan', 66, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2021-9-8', NULL),
(2, '2078-06-01', '2078-06-29', 'बाफल', 5, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2021-9-18', NULL),
(3, '2078-06-06', '2078-06-28', 'बाफल', 21, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2021-9-23', NULL),
(4, '2078-06-20', '2078-06-28', 'बाफल', 69, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2021-10-6', NULL),
(5, '2078-07-16', '2078-07-30', '5 बाफल', 26, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2078-7-15', NULL),
(6, '2078-05-23', '2078-06-06', 'बाफल', 100, 2, 'अधिकृत ( अधिकृत स्तर आठौं )', '2078-8-20', ''),
(7, '2078-08-27', '2078-08-28', 'बाफल', 12, 1, ' प्रमुख प्रशासकीय अधिकृत ', '2078-10-03', '');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_total_investment`
--

CREATE TABLE `quotation_total_investment` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `gaupalika_anudan` double(15,2) NOT NULL,
  `contigency_amount` double(15,2) NOT NULL,
  `kul_lagat_anudan` double(15,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_total` double(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotation_total_investment`
--

INSERT INTO `quotation_total_investment` (`id`, `plan_id`, `gaupalika_anudan`, `contigency_amount`, `kul_lagat_anudan`, `unit_id`, `unit_total`) VALUES
(1, 66, 300000.00, 20000.00, 280000.00, 1, 2.00),
(2, 5, 1500000.00, 500000.00, 1000000.00, 1, 2.00),
(3, 5, 1500000.00, 500000.00, 1000000.00, 1, 2.00),
(4, 21, 700000.00, 20000.00, 680000.00, 1, 2.00),
(5, 5, 1500000.00, 500000.00, 1000000.00, 1, 2.00),
(6, 69, 400000.00, 10000.00, 390000.00, 1, 2.00),
(7, 26, 500000.00, 30000.00, 470000.00, 1, 2.00),
(8, 26, 500000.00, 30000.00, 470000.00, 1, 2.00),
(9, 100, 500000.00, 10000.00, 490000.00, 2, 2.00),
(10, 100, 500000.00, 10000.00, 490000.00, 2, 2.00),
(11, 26, 500000.00, 30000.00, 470000.00, 0, 0.00),
(12, 26, 500000.00, 40000.00, 460000.00, 0, 0.00),
(13, 12, 2500000.00, 10000.00, 2490000.00, 0, 0.00),
(14, 12, 2500000.00, 10000.00, 2490000.00, 0, 0.00),
(15, 12, 2500000.00, 10000.00, 2490000.00, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `samiti_analysis_based_withdraw`
--

CREATE TABLE `samiti_analysis_based_withdraw` (
  `id` int(11) NOT NULL,
  `payment_evaluation_count` tinyint(1) NOT NULL,
  `evaluated_date` varchar(10) DEFAULT NULL,
  `evaluated_date_english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluated_amount` varchar(15) DEFAULT NULL,
  `payable_amount` varchar(15) DEFAULT NULL,
  `advance_payment` varchar(15) DEFAULT NULL,
  `contengency_amount` varchar(15) DEFAULT NULL,
  `renovate_amount` varchar(15) DEFAULT NULL,
  `due_amount` varchar(15) DEFAULT NULL,
  `disaster_management_amount` varchar(15) DEFAULT NULL,
  `total_amount_deducted` varchar(15) DEFAULT NULL,
  `total_paid_amount` varchar(15) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_analysis_based_withdraw`
--

INSERT INTO `samiti_analysis_based_withdraw` (`id`, `payment_evaluation_count`, `evaluated_date`, `evaluated_date_english`, `evaluated_amount`, `payable_amount`, `advance_payment`, `contengency_amount`, `renovate_amount`, `due_amount`, `disaster_management_amount`, `total_amount_deducted`, `total_paid_amount`, `plan_id`, `created_date`) VALUES
(1, 1, '2078-09-30', '2022-1-14', '525000', '525000', '', '10000', '15000', '', '2000', '', '497650', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `samiti_costumer_association_details`
--

CREATE TABLE `samiti_costumer_association_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `issued_district` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `if_ag` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_costumer_association_details`
--

INSERT INTO `samiti_costumer_association_details` (`id`, `post_id`, `name`, `address`, `gender`, `cit_no`, `issued_district`, `mobile_no`, `plan_id`, `created_date`, `if_ag`) VALUES
(5, 0, 'अच्युत न्यौपाने', '', 0, 'कोशादक्ष्य', '', '9845012345', 3, '2021-12-08', NULL),
(6, 0, 'नबिन कोइराला', '', 0, 'सदस्य', '', '9861023479', 3, '2021-12-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `samiti_costumer_association_details_0`
--

CREATE TABLE `samiti_costumer_association_details_0` (
  `id` int(11) NOT NULL,
  `program_organizer_group_name` varchar(556) DEFAULT NULL,
  `program_organizer_group_address` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_costumer_association_details_0`
--

INSERT INTO `samiti_costumer_association_details_0` (`id`, `program_organizer_group_name`, `program_organizer_group_address`, `plan_id`, `created_date`) VALUES
(3, 'रमाईलो डाँडा साङ्लामा बाटो ढलान तथा खानेपानी विस्तार संस्था/समिति ', '5', 3, '2021-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `samiti_investigation_association_details`
--

CREATE TABLE `samiti_investigation_association_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `mobile_no` int(50) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_investigation_association_details`
--

INSERT INTO `samiti_investigation_association_details` (`id`, `post_id`, `name`, `address`, `gender`, `mobile_no`, `plan_id`, `created_date`) VALUES
(9, 5, 'संस्थागत विकाश सेवा प्रबाह', '3', 1, 2147483647, 10, '2021-10-01'),
(10, 6, 'संस्थागत विकाश सेवा प्रबाह', '3', 1, 2147483647, 10, '2021-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `samiti_more_plan_details`
--

CREATE TABLE `samiti_more_plan_details` (
  `id` int(11) NOT NULL,
  `samiti_gathan_date` varchar(255) DEFAULT NULL,
  `costumer_total_population` varchar(255) DEFAULT NULL,
  `yojana_start_date` varchar(255) DEFAULT NULL,
  `yojana_sakine_date` varchar(255) DEFAULT NULL,
  `samjhauta_party` varchar(255) DEFAULT NULL,
  `post_id_3` varchar(255) DEFAULT NULL,
  `miti` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `samiti_gathan_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_start_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `miti_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_more_plan_details`
--

INSERT INTO `samiti_more_plan_details` (`id`, `samiti_gathan_date`, `costumer_total_population`, `yojana_start_date`, `yojana_sakine_date`, `samjhauta_party`, `post_id_3`, `miti`, `plan_id`, `samiti_gathan_date_english`, `yojana_start_date_english`, `yojana_sakine_date_english`, `miti_english`, `created_date`) VALUES
(1, '', '', '2078-05-01', '2078-05-31', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-05-02', 3, '--', '2021-8-17', '2021-9-16', '2021-8-18', NULL),
(6, '', '', '2078-06-15', '2078-06-22', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-06-15', 10, '--', '2021-10-1', '2021-10-8', '2021-10-1', NULL),
(7, '', '', '2078-06-15', '2078-06-22', '1', ' प्रमुख प्रशासकीय अधिकृत ', '2078-06-15', 10, '--', '2021-10-1', '2021-10-8', '2021-10-1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `samiti_plan_amount_withdraw_details`
--

CREATE TABLE `samiti_plan_amount_withdraw_details` (
  `id` int(11) NOT NULL,
  `plan_end_date` varchar(10) DEFAULT NULL,
  `plan_end_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yojana_sakine_date` varchar(250) DEFAULT NULL,
  `yojana_sakine_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `upabhokta_aproved_date` varchar(10) DEFAULT NULL,
  `upabhokta_aproved_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `expenditure_approved_date` varchar(10) DEFAULT NULL,
  `expenditure_approved_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_date` varchar(10) DEFAULT NULL,
  `plan_evaluated_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_evaluated_amount` varchar(20) DEFAULT NULL,
  `final_payable_amount` varchar(20) DEFAULT NULL,
  `payment_till_now` varchar(20) DEFAULT NULL,
  `advance_payment` int(11) NOT NULL,
  `anudan_remaining_amount` varchar(20) DEFAULT NULL,
  `costumer_agreement` varchar(20) DEFAULT NULL,
  `remaining_payment_amount` varchar(20) DEFAULT NULL,
  `final_contengency_amount` varchar(20) DEFAULT NULL,
  `final_renovate_amount` varchar(20) DEFAULT NULL,
  `final_due_amount` varchar(20) DEFAULT NULL,
  `final_disaster_management_amount` varchar(20) DEFAULT NULL,
  `final_total_amount_deducted` varchar(20) DEFAULT NULL,
  `final_total_paid_amount` varchar(20) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_plan_amount_withdraw_details`
--

INSERT INTO `samiti_plan_amount_withdraw_details` (`id`, `plan_end_date`, `plan_end_date_english`, `yojana_sakine_date`, `yojana_sakine_date_english`, `upabhokta_aproved_date`, `upabhokta_aproved_date_english`, `expenditure_approved_date`, `expenditure_approved_date_english`, `plan_evaluated_date`, `plan_evaluated_date_english`, `plan_evaluated_amount`, `final_payable_amount`, `payment_till_now`, `advance_payment`, `anudan_remaining_amount`, `costumer_agreement`, `remaining_payment_amount`, `final_contengency_amount`, `final_renovate_amount`, `final_due_amount`, `final_disaster_management_amount`, `final_total_amount_deducted`, `final_total_paid_amount`, `plan_id`) VALUES
(3, '2078-09-29', '', '2078-09-30', '', '2078-09-28', '2022-1-12', '2078-09-27', '--', '2078-09-11', '--', '475000', '1000000', '525000', 0, '', '', '475000', '14250', '0', '0', '0', '14250', '460750', 3);

-- --------------------------------------------------------

--
-- Table structure for table `samiti_plan_starting_fund`
--

CREATE TABLE `samiti_plan_starting_fund` (
  `id` int(11) NOT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `advance_taken_date` varchar(255) DEFAULT NULL,
  `advance_taken_group` varchar(255) DEFAULT NULL,
  `advance_taken_group_address` varchar(255) DEFAULT NULL,
  `advance_return_date` varchar(255) DEFAULT NULL,
  `advance_reason` varchar(255) DEFAULT NULL,
  `advance_taken_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `advance_return_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `samiti_plan_time_addition_affiliation`
--

CREATE TABLE `samiti_plan_time_addition_affiliation` (
  `id` int(11) NOT NULL,
  `period` varchar(255) DEFAULT NULL,
  `program_problem_reason` varchar(255) DEFAULT NULL,
  `letter_date` varchar(10) DEFAULT NULL,
  `letter_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `decesion_date` varchar(10) DEFAULT NULL,
  `decesion_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `extended_date` varchar(10) DEFAULT NULL,
  `extended_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `samiti_plan_total_investment`
--

CREATE TABLE `samiti_plan_total_investment` (
  `id` int(11) NOT NULL,
  `agreement_gauplaika` varchar(255) DEFAULT NULL,
  `agreement_other` varchar(255) DEFAULT NULL,
  `costumer_agreement` varchar(255) DEFAULT NULL,
  `other_agreement` varchar(255) DEFAULT NULL,
  `bhuktani_anudan` varchar(255) DEFAULT NULL,
  `costumer_investment` varchar(255) DEFAULT NULL,
  `total_investment` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_total` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_plan_total_investment`
--

INSERT INTO `samiti_plan_total_investment` (`id`, `agreement_gauplaika`, `agreement_other`, `costumer_agreement`, `other_agreement`, `bhuktani_anudan`, `costumer_investment`, `total_investment`, `plan_id`, `unit_id`, `unit_total`, `created_date`) VALUES
(1, '1000000', '0', '0', '0', '1000000', '80000', '1080000.0000', 3, 0, '', ''),
(2, '2000000', '0', '0', '0', '2000000', '10000', '2010000.0000', 10, 0, '', '2021-10-01'),
(4, '1500000', '0', '0', '0', '1500000', '100000', '1600000.0000', 5, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `samiti_profitable_family_details`
--

CREATE TABLE `samiti_profitable_family_details` (
  `id` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `pariwar_population` varchar(255) DEFAULT NULL,
  `appangata` varchar(255) DEFAULT NULL,
  `childrens` varchar(255) DEFAULT NULL,
  `older_people` varchar(255) DEFAULT NULL,
  `aanya` varchar(255) DEFAULT NULL,
  `total1` varchar(255) DEFAULT NULL,
  `female` varchar(255) DEFAULT NULL,
  `male` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_profitable_family_details`
--

INSERT INTO `samiti_profitable_family_details` (`id`, `type`, `pariwar_population`, `appangata`, `childrens`, `older_people`, `aanya`, `total1`, `female`, `male`, `other`, `total`, `plan_id`, `created_date`) VALUES
(7, 0, '10', '', '', '', '', '', '10', '10', '', '20', 10, '2021-10-01'),
(8, 0, '10', '', '', '', '', '', '10', '10', '', '20', 10, '2021-10-01'),
(13, 0, '10', '', '', '', '', '', '20', '10', '', '30', 3, '2021-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `samiti_public_investigation_details`
--

CREATE TABLE `samiti_public_investigation_details` (
  `id` int(11) NOT NULL,
  `survey_date` varchar(255) DEFAULT NULL,
  `survey_date_english` varchar(50) DEFAULT NULL,
  `population` varchar(255) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `samiti_public_investigation_details`
--

INSERT INTO `samiti_public_investigation_details` (`id`, `survey_date`, `survey_date_english`, `population`, `plan_id`, `created_date`) VALUES
(1, '', '--', '', 3, ''),
(2, '2078-05-09', '2021-8-25', '50', 3, ''),
(3, '2078-05-09', '2021-8-25', '50', 3, ''),
(4, '2078-09-30', '2022-1-14', '', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `sarans_lagat`
--

CREATE TABLE `sarans_lagat` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sam_amt` float NOT NULL,
  `sam_per` float NOT NULL,
  `dhu_amt` float NOT NULL,
  `dhu_per` float NOT NULL,
  `dor_amt` float NOT NULL,
  `dor_per` float NOT NULL,
  `bib_amt` float NOT NULL,
  `bib_per` float NOT NULL,
  `total` float NOT NULL,
  `tot_per` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings_katti_wiwarn`
--

CREATE TABLE `settings_katti_wiwarn` (
  `id` int(11) NOT NULL,
  `topic` text DEFAULT NULL,
  `percent` float NOT NULL,
  `what_is` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_katti_wiwarn`
--

INSERT INTO `settings_katti_wiwarn` (`id`, `topic`, `percent`, `what_is`) VALUES
(1, 'घर बहाल कर', 1, 1),
(2, 'आय कर', 2, 1),
(3, 'डोर हाजिर ', 1.5, 1),
(4, 'सामाजिक सुरक्षा कर', 15, 2),
(5, 'पारिश्रमिक कर', 1.5, 2),
(9, 'आय कर', 10, 3),
(11, 'सामाजिक सुरक्षा कर', 2.5, 4),
(12, 'पारिश्रमिक कर', 2.5, 6),
(13, 'पारिश्रमिक कर', 2.5, 5),
(15, 'नया कर ', 3, 4),
(16, 'आय कर', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `settings_program_upabhokta_samiti`
--

CREATE TABLE `settings_program_upabhokta_samiti` (
  `id` int(11) NOT NULL,
  `program_organizer_group_name` varchar(556) DEFAULT NULL,
  `program_organizer_group_address` varchar(255) DEFAULT NULL,
  `tol_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings_program_upabhokta_samiti_details`
--

CREATE TABLE `settings_program_upabhokta_samiti_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `issued_district` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `tol_id` int(11) NOT NULL,
  `created_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `type` int(11) NOT NULL,
  `created_date_english` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings_specification`
--

CREATE TABLE `settings_specification` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `default_spec` tinyint(1) NOT NULL,
  `position` tinyint(1) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting_bhautik_pariman`
--

CREATE TABLE `setting_bhautik_pariman` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_bhautik_pariman`
--

INSERT INTO `setting_bhautik_pariman` (`id`, `name`, `parent_id`, `unit_name`) VALUES
(1, 'ह्युम पाइप', 0, NULL),
(2, 'बाटो पेभलिंग', -3, NULL),
(3, 'सडक', -1, NULL),
(4, 'पुल निर्माण', -1, NULL),
(5, 'पार्क निर्माण', -1, NULL),
(6, 'खानेपानी तथा ढल निर्माण', -1, NULL),
(7, 'वृक्षारोपण', -1, NULL),
(8, 'बाटो कालोपत्रे', 28, NULL),
(9, 'नदि नियन्त्रण', -1, NULL),
(10, 'सामाजिक सिंचाई', -1, NULL),
(11, 'वाल निर्माण', 0, NULL),
(24, 'खानेपानी सुविधा थप उपलब्ध गराएका परिवार', 6, NULL),
(25, 'जलबिधुत तथा वैकल्पिक उर्जा', -1, NULL),
(27, 'ट्यांकी निर्माण ', 25, NULL),
(28, 'पोखरी ताल तलैया', -1, NULL),
(29, 'कालो पत्रे ', 28, NULL),
(30, 'फोहोरमैला व्यवस्थापन', -1, NULL),
(31, 'ट्यांकी ', 30, NULL),
(32, 'नयाँ विद्यालय भवन निर्माण सम्पन्‍न ', -1, NULL),
(33, 'स्वास्थ्य चौकी निर्माण ', -1, NULL),
(34, 'जग्गा संरक्षण ', -1, NULL),
(36, 'कालोपत्रे', 3, 'km,meter'),
(37, 'ढलान', 3, NULL),
(38, 'ग्रावेल', 3, NULL),
(39, 'ट्रयाक खोल्ने', 3, NULL),
(40, 'मोटरेवल पुल', -4, NULL),
(41, 'झोलुङ्गे पुल', 4, NULL),
(42, 'आकाशे पुल', 4, NULL),
(43, 'पार्क निर्माण', 5, NULL),
(44, 'खानेपानी सेवाबाट लाभान्वित घरपरिवार', 6, NULL),
(45, 'ढल निर्माण', 6, NULL),
(46, 'वृक्षरोपण', 7, NULL),
(47, 'उत्पादन', 25, NULL),
(48, 'प्रशासरण लाइन विस्तार', 25, NULL),
(49, 'डम्पिङ्ग साइट', 30, NULL),
(50, 'स्यानीटरी ल्याण्डफिल्ड साइट', 30, NULL),
(51, 'नयाँ मेशिन उपकरण जडान', 30, NULL),
(52, 'आफ्नै स्वामित्वको', 34, NULL),
(53, 'सरकारी', 34, NULL),
(54, 'सार्वजनिक', 34, NULL),
(55, 'पर्ति', 34, NULL),
(60, 'नया ट्रक खोल्ने', 3, 'meter');

-- --------------------------------------------------------

--
-- Table structure for table `setting_bipat`
--

CREATE TABLE `setting_bipat` (
  `id` int(11) NOT NULL,
  `percent` float NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting_bipat`
--

INSERT INTO `setting_bipat` (`id`, `percent`, `amount`) VALUES
(1, 3, 0.03);

-- --------------------------------------------------------

--
-- Table structure for table `setting_rules`
--

CREATE TABLE `setting_rules` (
  `id` int(11) NOT NULL,
  `rule` text DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shrot_details`
--

CREATE TABLE `shrot_details` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shrot_details`
--

INSERT INTO `shrot_details` (`id`, `name`) VALUES
(1, 'आन्तरिक श्रोत'),
(2, 'संघीय (नेपाल) सरकार - समानिकरण अनुदान	'),
(3, 'संघीय (नेपाल) सरकार - शसर्त अनुदान चालु	'),
(4, 'बैदेशिक श्राेत (एस.एस.डि.पि.) - अन्तराष्ट्रिय अन्तर-सरकारी संस्था चालु अनुदान	'),
(5, 'बैदेशिक श्राेत (एस.एस.डि.पि.) - बैदेशिक ऋण	');

-- --------------------------------------------------------

--
-- Table structure for table `site_info`
--

CREATE TABLE `site_info` (
  `id` int(11) NOT NULL,
  `site_root` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `thekka_bail`
--

CREATE TABLE `thekka_bail` (
  `id` int(11) NOT NULL,
  `bail_name` varchar(255) NOT NULL,
  `bail_percent` varchar(255) NOT NULL,
  `bail_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thekka_bail`
--

INSERT INTO `thekka_bail` (`id`, `bail_name`, `bail_percent`, `bail_amount`) VALUES
(6, 'नगद धरौटी', '1.5', 300000),
(9, 'बिड बन्ड', '3', 1000000),
(11, 'पी.एस रकम', '2.5', 1500000),
(18, 'Retention Amount', '3', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `topic_name` text DEFAULT NULL,
  `topic_no` varchar(15) DEFAULT NULL,
  `rate` varchar(15) DEFAULT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topic_area`
--

CREATE TABLE `topic_area` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `budget` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area`
--

INSERT INTO `topic_area` (`id`, `sn`, `name`, `budget`) VALUES
(2, 2, 'सामाजिक क्षेत्र', '12500000'),
(3, 3, 'पूर्वाधार क्षेत्र', '20000000'),
(4, 0, 'सुशासन तथा अन्तर सम्बन्धित क्षेत्र', '12000000');

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_agreement`
--

CREATE TABLE `topic_area_agreement` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area_agreement`
--

INSERT INTO `topic_area_agreement` (`id`, `sn`, `name`) VALUES
(0, 0, '५०/५० साझेदारी क्रमागत'),
(3, 1, 'समानिकरण अनुदान'),
(4, 2, 'सर्शत अनुदान'),
(5, 3, 'आन्तरीक श्रोत'),
(6, 0, 'संघीय संरचना अनुदान'),
(7, 0, 'क्रमागत '),
(8, 0, 'प्रदेश सरकार अनुदान'),
(9, 0, 'नेपाल सरकार अनुदान'),
(10, 0, 'वित्तिय  समानिकरण अनुदान'),
(11, 0, 'केन्द्र सरकार राजश्व वाडफाड');

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_budget_shrot`
--

CREATE TABLE `topic_area_budget_shrot` (
  `id` int(11) NOT NULL,
  `shrot_id` text DEFAULT NULL,
  `budget` double(15,2) NOT NULL,
  `topic_area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_investment`
--

CREATE TABLE `topic_area_investment` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area_investment`
--

INSERT INTO `topic_area_investment` (`id`, `sn`, `name`) VALUES
(1, 0, 'नगर स्तरीय'),
(2, 0, '५०-५० साझेदारी'),
(3, 0, 'नगर स्तरीय क्रमागत'),
(4, 0, 'ठेक्का क्रमागत'),
(5, 0, 'वडा स्तरीय'),
(6, 0, 'वडा स्तरीय क्रमागत'),
(7, 0, '५०-५० साझेदारी क्रमागत'),
(9, 0, 'गत अ.ल्या (आन्तरिक श्रोत)');

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_investment_source`
--

CREATE TABLE `topic_area_investment_source` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_type`
--

CREATE TABLE `topic_area_type` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type` varchar(255) DEFAULT NULL,
  `budget` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area_type`
--

INSERT INTO `topic_area_type` (`id`, `sn`, `topic_area_id`, `topic_area_type`, `budget`) VALUES
(1, 1, 1, 'उद्योग', '3000000'),
(2, 2, 1, 'पर्यटन', '3900000'),
(3, 3, 1, 'श्रम', '2600000'),
(4, 4, 1, 'जलश्रोत र सिँचाइ', '0'),
(5, 5, 1, 'कृषि', '0'),
(6, 6, 1, 'पशु सेवा', '0'),
(7, 7, 1, 'सहकारी', '0'),
(8, 8, 1, 'वन', '0'),
(9, 9, 1, 'भूमि व्यवस्था', '0'),
(10, 10, 2, 'शिक्षा', '5000000'),
(11, 11, 2, 'स्वास्थ्य', '0'),
(12, 12, 2, 'खानेपानी', '0'),
(13, 13, 2, 'सरसफाइ', '0'),
(14, 14, 2, 'लैङ्गिक समानता', '0'),
(15, 15, 2, 'सामाजिक समावेशिकरण', '0'),
(16, 16, 2, 'ज्येष्ठ नागरिक', '0'),
(17, 17, 2, 'अपाङ्गता भएका व्यक्ति', '0'),
(18, 18, 2, 'धर्म संस्कृति', '0'),
(19, 19, 2, 'कला साहित्य', '0'),
(20, 20, 2, 'युवा तथा खेलकुद', '0'),
(21, 21, 2, 'सामाजिक सुरक्षा तथा संरक्षण', '0'),
(22, 22, 3, 'यातायात पूर्वाधार', '5689000'),
(23, 23, 3, 'भवन आवास तथा सहरी विकास', '0'),
(24, 24, 3, 'उर्जा', '0'),
(25, 25, 3, 'सञ्चार तथा सुचना प्रविधि', '0'),
(26, 26, 3, 'सम्पदा पूर्वाधार', '0'),
(27, 27, 3, 'विज्ञान तथा प्रविधि', '0'),
(28, 28, 3, 'पुनः निर्माण', '0'),
(29, 29, 4, 'वातावरण तथा जलवायू', '0'),
(30, 30, 4, 'विपद् व्यवस्थापन', '0'),
(31, 31, 4, 'शान्ति तथा सुव्यवस्था', '0'),
(32, 32, 4, 'कानुन तथा न्याय', '0'),
(33, 33, 4, 'गरिबि निवारण', '0'),
(34, 34, 4, 'श्रम तथा रोजगारी', '0');

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_type_budget_shrot`
--

CREATE TABLE `topic_area_type_budget_shrot` (
  `id` int(11) NOT NULL,
  `shrot_id` int(11) NOT NULL,
  `budget` double(15,2) NOT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area_type_budget_shrot`
--

INSERT INTO `topic_area_type_budget_shrot` (`id`, `shrot_id`, `budget`, `topic_area_id`, `topic_area_type_id`) VALUES
(0, 0, 500000000.00, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic_area_type_sub`
--

CREATE TABLE `topic_area_type_sub` (
  `id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `topic_area_type_sub` varchar(512) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `budget` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_area_type_sub`
--

INSERT INTO `topic_area_type_sub` (`id`, `sn`, `topic_area_type_id`, `topic_area_type_sub`, `unit_id`, `budget`) VALUES
(1, 1, 1, 'उद्यमशील विकास कार्यक्रम', 0, NULL),
(2, 2, 1, 'लघु,घरेलु तथा साना उद्योग नियमन तथा प्रवर्धन', 0, NULL),
(3, 3, 1, 'उपभोक्ता हित संरक्षण तथा बजार अनुगमन', 0, NULL),
(4, 4, 1, 'आयमुलक सीप विकास कार्यक्रम', 0, NULL),
(5, 5, 1, 'स्थानीय बजार तथा हाट बजार व्यवस्थापन कार्यक्रम', 0, NULL),
(6, 6, 1, 'स्थानीय खानी तथा खनिज पदार्थ सम्बन्धि सुचना तथा सञ्चार कार्यक्रम', 0, NULL),
(7, 7, 2, 'पर्यटन सुचना प्रवाह कार्यक्रम', 0, NULL),
(8, 8, 2, 'पर्यटन पुर्वाधार विकास कार्यक्रम', 0, NULL),
(9, 9, 2, 'स्थानीय पर्यटन प्रवर्धन कार्यक्रम', 0, NULL),
(10, 10, 4, 'कुलो मर्मत तथा निर्माण', 0, NULL),
(11, 11, 4, 'लघु तथा साना सिंचाई कार्यक्रम', 0, NULL),
(12, 12, 4, 'भूमिगत सिंचाई निर्माण/स्तरोन्नती तथा मर्मत', 0, NULL),
(13, 13, 5, 'बाली विकास तथा बिउविजन प्रवर्धन कार्यक्रम', 0, NULL),
(14, 14, 5, 'कृषि प्रसार तथा तालिम कार्यक्रम', 0, NULL),
(15, 15, 5, 'माटो व्यवस्थापन तथा परीक्षण', 0, NULL),
(16, 16, 5, 'कृषि सुचना तथा सञ्चार', 0, NULL),
(17, 17, 5, 'तरकारी तथा फलफूल बजार प्रवर्धन', 0, NULL),
(18, 18, 5, 'बाली विकास सामग्री वितरण कार्यक्रम', 0, NULL),
(19, 19, 5, 'कृषि सामग्री वितरण', 0, NULL),
(20, 20, 6, 'पशुपंछी सेवा कार्यक्रम तथा बजार प्रवर्धन', 0, NULL),
(21, 21, 6, 'पशुरोग पहिचान तथा नियान्त्रण कार्यक्रम', 0, NULL),
(22, 22, 6, 'मत्स्य विकास तथा बजार प्रवर्धन', 0, NULL),
(23, 23, 6, 'व्यावसायिक पशु प्रवर्धन तथा वितरण', 0, NULL),
(24, 24, 10, 'भौतिक तथा शैक्षिक पूर्वाधार निर्माण कार्यक्रम', 0, NULL),
(25, 25, 10, 'विद्यार्थी प्रोत्साहन तथा छात्रवृत्तिकार्यक्रम', 0, NULL),
(26, 26, 10, 'विद्यार्थी सिकाई उपलब्धी परीक्षण र व्यवस्थापन कार्यक्रम', 0, NULL),
(27, 27, 10, 'आधारभूत तह शिक्षा तथा अनौपचारिक शिक्षा कार्यक्रम', 0, NULL),
(28, 28, 10, 'खेलकुद प्रतियोगिता आयोजना र सहभागिता', 0, NULL),
(29, 29, 10, 'प्राविधिक शिक्षा तथा व्यावसायिक तालिम कार्यक्रम', 0, NULL),
(30, 30, 10, 'पाठ्यमक्रम र पाठ्य्रसामग्री वितरण कार्यक्रम', 0, NULL),
(31, 31, 10, 'विद्यालय शौचालय निर्माण', 0, NULL),
(32, 32, 10, 'अनौपचारीक तथा साक्षरता कार्यक्रम', 0, NULL),
(33, 33, 10, 'अतिरीक्त क्रियाकलाप सञ्चालन', 0, NULL),
(34, 34, 10, 'विद्यालय प्रशासनिक व्यवस्थापन', 0, NULL),
(35, 35, 10, 'विविध शैक्षिक कार्यक्रम', 0, NULL),
(36, 36, 10, 'साहित्य र प्रकाशन', 0, NULL),
(37, 37, 11, 'कुष्ठ रोग नियन्त्रण कार्यक्रम', 0, NULL),
(38, 38, 11, 'नसर्ने रोग नियन्त्रण, रोकथाम तथा उपचारात्मक कार्यक्रम', 0, NULL),
(39, 39, 11, 'आर्युवेदिक तथा परम्परागत स्वास्थ्य सेवा कार्यक्रम', 0, NULL),
(40, 40, 11, 'स्वास्थ्य शिक्षा सूचना तथा तालिम कार्यक्रम', 0, NULL),
(41, 41, 11, 'आधारभूत स्वास्थ्य कार्यक्रम', 0, NULL),
(42, 42, 11, 'महिला प्रजनन तथा महिला स्वास्थ्य कार्यक्रम', 0, NULL),
(43, 43, 11, 'बाल स्वास्थ्य एवं पोषण कार्यक्रम', 0, NULL),
(44, 44, 11, 'प्रसूति सेवा', 0, NULL),
(45, 45, 11, 'लागु औषध दुव्यर्सन सम्बन्धि सचेतना कार्यक्रम', 0, NULL),
(46, 46, 11, 'स्वास्थ्य पूर्वाधार निर्माण कार्यक्रम', 0, NULL),
(47, 47, 11, 'सडक दुर्घटना, घरेलु हिंसा, लागु ‍‌औषधी तथा अन्य जनचेतनामुलक र्‍याली तथा प्रशिक्षण', 0, NULL),
(48, 48, 11, 'शिविर संचालन तथा व्यवस्थापन', 0, NULL),
(49, 49, 12, 'खानेपानी आपूर्ति कार्यक्रम', 0, NULL),
(50, 50, 13, 'फोहरमैला व्यवस्थापन कार्यक्रम', 0, NULL),
(51, 51, 13, 'सार्वजनिक शौचालय निर्माण', 0, NULL),
(52, 52, 13, 'सार्वजनिक धारा/कुवा/पोखरी संरक्षण', 0, NULL),
(53, 53, 14, 'सामाजिक सदभाव तथा एकिकरण प्रवद्र्धन कार्यक्रम', 0, NULL),
(54, 54, 15, 'आदिबासी/जनजाती लक्षित कार्यक्रम', 0, NULL),
(55, 55, 15, 'दलित लक्षित कार्यक्रम', 0, NULL),
(56, 56, 17, 'अपाङ्ग सम्बन्धी कार्यक्रम तथा युवा लक्षित कार्यक्रम', 0, NULL),
(57, 57, 15, 'बालबालिका लक्षित कार्यक्रम', 0, NULL),
(58, 58, 15, 'सुकुम्बासी व्यवस्थापन', 0, NULL),
(60, 60, 16, 'जेष्ठ नागरिक', 0, NULL),
(61, 61, 18, 'मठ मन्दिर मर्मत/सुधार तथा निर्माण', 0, NULL),
(62, 62, 18, 'परम्परागरत जात्रा, पर्वहरुको सञ्चालन र व्यवस्थापन कार्यक्रम', 0, NULL),
(63, 63, 19, 'पुरातत्व, प्राचीन स्मारक र संग्रहालयको संरक्षण', 0, NULL),
(64, 64, 19, 'भाषा, संस्कृति र ललितकलाको संरक्षण र विकास कार्यक्रम', 0, NULL),
(65, 65, 20, 'खेलकुद मैदान मर्मत तथा निर्माण', 0, NULL),
(66, 66, 20, 'खेलकुद प्रतियोगिता आयोजना र सहभागिता', 0, NULL),
(67, 67, 20, 'खेलकुद पूर्वाधार कार्यक्रम', 0, NULL),
(68, 68, 20, 'सांस्कृतिक/ खेलकुद सामग्री खरीद तथा व्यवस्थापन', 0, NULL),
(69, 69, 20, 'पार्क निर्माण तथा मर्मत सम्हार', 0, NULL),
(70, 70, 21, 'आश्रम निर्माण तथा मर्मत सम्भार', 0, NULL),
(71, 71, 21, 'सार्वजनिक जग्गा तथा सम्पदा संरक्षण तथा सम्बर्द्धन', 0, NULL),
(72, 72, 21, 'न्यानो कपडा तथा पोषण कार्यक्रम', 0, NULL),
(73, 73, 21, 'प्रहरीसंग साझेदारि कार्यक्रम', 0, NULL),
(74, 74, 22, 'सडक/बाटो मर्मत/ढलान तथा स्तरोन्नती', 0, NULL),
(75, 75, 22, 'सडक/बाटो विस्तार तथा नयाँ ट्रयाक', 0, NULL),
(76, 76, 22, 'सडक ग्रावेल तथा कालोपत्रे', 0, NULL),
(77, 77, 22, 'सडक ढल निर्माण तथा व्यवस्थापन', 0, NULL),
(78, 78, 22, 'हेमपाइप जडान तथा मर्मत', 0, NULL),
(79, 79, 22, 'कल्भर्ट मर्मत तथा निर्माण', 0, NULL),
(80, 80, 22, 'गोरेटो बाटो निर्माण तथा मर्मत', 0, NULL),
(81, 81, 22, 'आकाशे पूल मर्मत तथा निर्माण', 0, NULL),
(82, 82, 22, 'पुल मर्मत तथा निर्माण', 0, NULL),
(84, 84, 23, 'सामुदायिक भवन/ट्रष्ट मर्मत तथा निर्माण', 0, NULL),
(85, 85, 23, 'सार्वजनिक भवन मर्मत तथा निर्माण', 0, NULL),
(86, 86, 23, 'वस्ती तथा आवास विकास कार्यक्रम', 0, NULL),
(87, 87, 23, 'शहरी विकास कार्यक्रम', 0, NULL),
(88, 88, 23, 'फर्निचर व्यवस्थापन', 0, NULL),
(89, 89, 23, 'प्रवेशद्वार मर्मत तथा निर्माण', 0, NULL),
(90, 90, 24, 'स्थानीय विद्युत वितरण प्रणालीको विस्तार कार्यक्रम', 0, NULL),
(91, 91, 24, 'सडक बत्ति तथा वैकल्पिक उर्जा', 0, NULL),
(92, 92, 26, 'मठ मन्दिर निर्माण', 0, NULL),
(93, 93, 26, 'मसान घाट निर्माण', 0, NULL),
(94, 94, 26, 'किरिया पुत्री ट्रस निर्माण', 0, NULL),
(95, 95, 30, 'विपद कोष स्थापना तथा संचालन कार्यक्रम', 0, NULL),
(96, 96, 30, 'विपद पश्चात स्थानीयस्तरको पुनस्थापन र पुन र्निर्माण कार्यक्रम', 0, NULL),
(97, 97, 30, 'स्थानीय स्तर विपद् पूर्व तयारी तथा प्रतिकार्य कार्यक्रम', 0, NULL),
(99, 99, 37, 'कार्यसम्पादनमा आधारित करार व्यवस्थापन', 0, NULL),
(100, 100, 37, 'नतीजामा आधारित कार्य सम्पादन मूल्यांकन', 0, NULL),
(101, 101, 37, 'संस्थागत कार्य जिम्मेवारी विभाजन', 0, NULL),
(102, 102, 37, 'संस्थाको पूर्वाधार व्यवस्थापन', 0, NULL),
(103, 103, 37, 'परामर्श सेवा', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topic_budget`
--

CREATE TABLE `topic_budget` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_budget`
--

INSERT INTO `topic_budget` (`id`, `name`) VALUES
(9, 'संघीय (नेपाल) सरकार - समानिकरण अनुदान'),
(10, 'संघीय (नेपाल) सरकार - शसर्त अनुदान चालु'),
(12, 'बैदेशिक श्राेत (एस.एस.डि.पि.) - अन्तराष्ट्रिय अन्तर-सरकारी संस्था चालु अनुदान'),
(13, 'बैदेशिक श्राेत (एस.एस.डि.पि.) - बैदेशिक ऋण'),
(14, 'संघीय (नेपाल) सरकार - समपुरक अनुदान पुँजीगत'),
(15, 'संघीय (नेपाल) सरकार - अन्य अनुदान पुँजीगत'),
(16, 'प्रदेश सरकार - समानिकरण अनुदान'),
(17, 'राजश्व बाँडफाड (प्रदेश सरकार)'),
(18, 'राजश्व बाँडफाड (संघीय सरकार)'),
(19, 'आन्तरिक श्रोत'),
(20, 'आन्तरिक श्रोत (नगर विकास काेष)');

-- --------------------------------------------------------

--
-- Table structure for table `topic_budget_profile`
--

CREATE TABLE `topic_budget_profile` (
  `id` int(11) NOT NULL,
  `budget_topic_id` int(11) NOT NULL,
  `fiscal_id` int(11) NOT NULL,
  `amount` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic_budget_profile`
--

INSERT INTO `topic_budget_profile` (`id`, `budget_topic_id`, `fiscal_id`, `amount`) VALUES
(1, 9, 1, '183900000'),
(2, 10, 1, '223000000'),
(3, 12, 1, '3700000'),
(4, 13, 1, '6500000'),
(5, 14, 1, '6646564.87'),
(6, 15, 1, '4500000'),
(7, 16, 1, '12700000'),
(8, 17, 1, '5100000'),
(9, 18, 1, '126353435.13'),
(10, 19, 1, '55000000'),
(11, 20, 1, '50000000');

-- --------------------------------------------------------

--
-- Table structure for table `training_expense`
--

CREATE TABLE `training_expense` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `date` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_expense`
--

INSERT INTO `training_expense` (`id`, `description`, `unit`, `rate`, `quantity`, `total`, `plan_id`, `sn`, `remarks`, `date`) VALUES
(1, 'ddasdasds', 4, 1200, 160, 192000, 268, 1, 'asdsa', NULL),
(2, 'ddasdasds', 2, 1200, 160, 192000, 21, 1, '', NULL),
(3, 'हेम पाइप', 5, 1500, 5, 7500, 17, 1, 'pipe kharid', NULL),
(4, 'गिट्टी', 5, 20000, 2, 40000, 17, 1, 'gitti kharid', NULL),
(5, 'बालुवा', 5, 15000, 4, 60000, 17, 1, 'baauwa kharid', NULL),
(6, 'नहर खन्ने ', 5, 150000, 1, 150000, 17, 1, 'nahar banaune', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `alias`) VALUES
(1, 'किलोमिटर', 'km,kilometer'),
(2, 'मिटर', 'mtr'),
(3, 'बर्ग मिटर', 'sq meter'),
(4, 'घन मिटर', 'cubic meter'),
(5, 'थान', 'piece'),
(6, 'बर्ग फिट', 'sq ft'),
(7, 'फिट', 'ft,feet'),
(8, 'रनिङ मिटर', 'rm'),
(11, 'मीटर क्युव', 'cubic mtr');

-- --------------------------------------------------------

--
-- Table structure for table `upabhokta_letter_content`
--

CREATE TABLE `upabhokta_letter_content` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `letter_name` varchar(255) NOT NULL,
  `data1` varchar(255) NOT NULL,
  `data2` varchar(255) NOT NULL,
  `data3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upabhokta_letter_content`
--

INSERT INTO `upabhokta_letter_content` (`id`, `plan_id`, `letter_name`, `data1`, `data2`, `data3`) VALUES
(1, 1, 'upabhokta_tippani_patra', 'सार्वजनिक खरिद ऐन, 2063को दफा ८९', 'सार्वजनिक खरिद नियमावली, 2076को नियम 108 को उपनियम 3', ''),
(4, 1, 'ward_running_bhuktani', '2089 को नियम ९७ को उपनियम ९                                            ', 'उपनियम 89 वमोजिम                                            ', ''),
(11, 1, 'peski_tippani', 'सार्वजनिक खरिद ऐन २०६३ को दफा ५२ (क), सार्वजनिक खरिद नियमावली 2089 को निएम ५२', 'नियमावली 2078 को नियम 506 बमोजिम', ''),
(12, 2, 'amanat_tippani', 'सार्वजनिक खरीद नियमावली 2062 को नियम 99 (३) वमोजिम                            ', '', ''),
(13, 3, 'upabhokta_tippani_patra', '', '', ''),
(15, 6, 'thekka_tippani', 'सार्बजनिक खरिद ऐन 2065 को नियम 89 बमोजिम', '', ''),
(16, 15, 'peski_tippani', 'सार्वजनिक खरिद ऐन २०६३ को दफा ५२ (क), सार्वजनिक खरिद नियमावली २०६४ को निएम ५२', 'नियमावली २०७६ को नियम १०२ बमोजिम', '');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `pic` varchar(150) DEFAULT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`id`, `type_id`, `pic`, `plan_id`) VALUES
(2, 1, '880006946dhunibeshinagarpalika.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(55) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mode` varchar(55) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user1`
--

CREATE TABLE `user1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `ward` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `budget_id` int(11) NOT NULL,
  `topic_area_id` int(11) NOT NULL,
  `topic_area_type_id` int(11) NOT NULL,
  `ward_add` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user1`
--

INSERT INTO `user1` (`id`, `name`, `phone`, `ward`, `email`, `status`, `username`, `password`, `mode`, `budget_id`, `topic_area_id`, `topic_area_type_id`, `ward_add`) VALUES
(0, 'cheker', '977', '', 'namuna@gmail.com', 1, 'cheker', 'cb6d707d464358aeaa94b3d0a21cd22d', 'checker', 0, 0, 0, 'लोलंगा, हाइट'),
(1, 'BMS', '9851014969', '0', 'email@gmail.com', 1, 'plan', '4fe3bd7aa90cacafde8e944d84add9a8', 'superadmin', 0, 0, 0, NULL),
(2, 'तारकेश्वर नगरपालिका', '९७७-०१-५१६८१११', '0', 'tarakeshwormun2071@gmail.com', 1, 'tarakeshwor', 'cf237f06351a744d762a91b5ce4334e4', 'superadmin', 0, 0, 0, NULL),
(3, 'Ward', '-', '1', 'email@email.com', 1, 'ward1', 'eb79f003e82b212875c861b1dc092f6c', 'user', 0, 0, 0, 'लोलंगा, हाइट'),
(4, 'अच्युत न्यौपाने', '9861023479', '6', 'green.band66@gmail.com', 1, 'ward6', '8d29678ec167e5dadaf2cd9e268d0c0e', 'user', 0, 0, 0, 'लोलंगा, हाइट'),
(5, 'namuna', '977', '1', 'namuna@gmail.com', 1, 'maker', '35977a76fc8a3239867a67a62cf45f0d', 'maker', 0, 0, 0, 'लोलंगा, हाइट');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `id` int(11) NOT NULL,
  `ward` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`id`, `ward`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_plan_installment_details`
--

CREATE TABLE `withdraw_plan_installment_details` (
  `id` int(11) NOT NULL,
  `first_installment` int(11) NOT NULL,
  `second_installment` int(11) NOT NULL,
  `third_installment` int(11) NOT NULL,
  `fourth_installment` int(11) NOT NULL,
  `last_installment` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `worker_details`
--

CREATE TABLE `worker_details` (
  `id` int(11) NOT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `authority_name` varchar(255) DEFAULT NULL,
  `authority_ward_no` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `worker_details`
--

INSERT INTO `worker_details` (`id`, `post_name`, `authority_name`, `authority_ward_no`, `status`) VALUES
(1, ' प्रमुख प्रशासकीय अधिकृत ', 'श्री शिव प्रसाद लम्साल', 0, 1),
(2, 'अधिकृत ( अधिकृत स्तर आठौं )', 'श्री शम्भु प्रसाद पौडेल', 0, 1),
(3, 'लेखा अधिकृत (सातौं)', 'श्री खिलनाथ बासकोटा', 0, 1),
(4, 'वडा अध्यक्ष', 'नबिन कोइराला', 1, 1),
(5, 'वडा सचिव', 'अच्युत न्यौपाने', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `work_topic`
--

CREATE TABLE `work_topic` (
  `id` int(11) NOT NULL,
  `work_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abstract_cost`
--
ALTER TABLE `abstract_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abstract_cost_image`
--
ALTER TABLE `abstract_cost_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abstract_profile`
--
ALTER TABLE `abstract_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amanat_lagat`
--
ALTER TABLE `amanat_lagat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amanat_more_details`
--
ALTER TABLE `amanat_more_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analysis_based_withdraw`
--
ALTER TABLE `analysis_based_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anugaman_detail_patra`
--
ALTER TABLE `anugaman_detail_patra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anugaman_samiti_bibaran`
--
ALTER TABLE `anugaman_samiti_bibaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_plan`
--
ALTER TABLE `assign_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_information`
--
ALTER TABLE `bank_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bhautik_lakshya`
--
ALTER TABLE `bhautik_lakshya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_payment`
--
ALTER TABLE `bill_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_nirman`
--
ALTER TABLE `budget_nirman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_plan_details`
--
ALTER TABLE `child_plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contingency`
--
ALTER TABLE `contingency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contingency_exenditure`
--
ALTER TABLE `contingency_exenditure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_amount_withdraw_details`
--
ALTER TABLE `contract_amount_withdraw_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_analysis_based_withdraw`
--
ALTER TABLE `contract_analysis_based_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_bid`
--
ALTER TABLE `contract_bid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_bid_final`
--
ALTER TABLE `contract_bid_final`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_details`
--
ALTER TABLE `contract_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_dharauti`
--
ALTER TABLE `contract_dharauti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_dharuti_add`
--
ALTER TABLE `contract_dharuti_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_dharuti_firta`
--
ALTER TABLE `contract_dharuti_firta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_document`
--
ALTER TABLE `contract_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_entry_final`
--
ALTER TABLE `contract_entry_final`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_info`
--
ALTER TABLE `contract_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_invitation_entry`
--
ALTER TABLE `contract_invitation_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_invitation_for_bid`
--
ALTER TABLE `contract_invitation_for_bid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_more_details`
--
ALTER TABLE `contract_more_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_starting_fund`
--
ALTER TABLE `contract_starting_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_time_addition_affiliation`
--
ALTER TABLE `contract_time_addition_affiliation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_total_investment`
--
ALTER TABLE `contract_total_investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costumer_association_details`
--
ALTER TABLE `costumer_association_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costumer_association_details_0`
--
ALTER TABLE `costumer_association_details_0`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costumer_black_list`
--
ALTER TABLE `costumer_black_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deactive_plan_details`
--
ALTER TABLE `deactive_plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dharauti_khata_info`
--
ALTER TABLE `dharauti_khata_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_print`
--
ALTER TABLE `document_print`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_report`
--
ALTER TABLE `document_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ekmusta_budget`
--
ALTER TABLE `ekmusta_budget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eng_dates`
--
ALTER TABLE `eng_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enlist`
--
ALTER TABLE `enlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_add`
--
ALTER TABLE `estimate_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_anudan_details`
--
ALTER TABLE `estimate_anudan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_lagat_anuman`
--
ALTER TABLE `estimate_lagat_anuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_lagat_anuman_break`
--
ALTER TABLE `estimate_lagat_anuman_break`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_lagat_profile`
--
ALTER TABLE `estimate_lagat_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_other_agreement`
--
ALTER TABLE `estimate_other_agreement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethekka_info_list`
--
ALTER TABLE `ethekka_info_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethekka_kul_lagat`
--
ALTER TABLE `ethekka_kul_lagat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_investment_details`
--
ALTER TABLE `extra_investment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigation_association_details`
--
ALTER TABLE `investigation_association_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kar_bibaran`
--
ALTER TABLE `kar_bibaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `katti_details`
--
ALTER TABLE `katti_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letters_history`
--
ALTER TABLE `letters_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_bill_paper_details`
--
ALTER TABLE `letter_bill_paper_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_format`
--
ALTER TABLE `letter_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_indices`
--
ALTER TABLE `letter_indices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marmat_samhar`
--
ALTER TABLE `marmat_samhar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_anudan`
--
ALTER TABLE `material_anudan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merge_plan_id`
--
ALTER TABLE `merge_plan_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `more_plan_details`
--
ALTER TABLE `more_plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `napi_lagat_anuman`
--
ALTER TABLE `napi_lagat_anuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `napi_lagat_anuman_break`
--
ALTER TABLE `napi_lagat_anuman_break`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `napi_lagat_profile`
--
ALTER TABLE `napi_lagat_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_amount_withdraw_details`
--
ALTER TABLE `plan_amount_withdraw_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_details`
--
ALTER TABLE `plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_details1`
--
ALTER TABLE `plan_details1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_details_anudan`
--
ALTER TABLE `plan_details_anudan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_katti_record`
--
ALTER TABLE `plan_katti_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_shrot_record`
--
ALTER TABLE `plan_shrot_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_starting_fund`
--
ALTER TABLE `plan_starting_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_time_addition_affiliation`
--
ALTER TABLE `plan_time_addition_affiliation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_total_investment`
--
ALTER TABLE `plan_total_investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postname`
--
ALTER TABLE `postname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_details`
--
ALTER TABLE `print_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_history`
--
ALTER TABLE `print_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profitable_family_details`
--
ALTER TABLE `profitable_family_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_details`
--
ALTER TABLE `program_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_katti_bibaran`
--
ALTER TABLE `program_katti_bibaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_more_details`
--
ALTER TABLE `program_more_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_payment`
--
ALTER TABLE `program_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_payment_final`
--
ALTER TABLE `program_payment_final`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_payment_final_deposit_return`
--
ALTER TABLE `program_payment_final_deposit_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_time_addition_affiliation`
--
ALTER TABLE `program_time_addition_affiliation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_investigation_details`
--
ALTER TABLE `public_investigation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_enlist_form`
--
ALTER TABLE `quotation_enlist_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_letter_content`
--
ALTER TABLE `quotation_letter_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_more_details`
--
ALTER TABLE `quotation_more_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_total_investment`
--
ALTER TABLE `quotation_total_investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_analysis_based_withdraw`
--
ALTER TABLE `samiti_analysis_based_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_costumer_association_details`
--
ALTER TABLE `samiti_costumer_association_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_costumer_association_details_0`
--
ALTER TABLE `samiti_costumer_association_details_0`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_investigation_association_details`
--
ALTER TABLE `samiti_investigation_association_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_more_plan_details`
--
ALTER TABLE `samiti_more_plan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_plan_amount_withdraw_details`
--
ALTER TABLE `samiti_plan_amount_withdraw_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_plan_starting_fund`
--
ALTER TABLE `samiti_plan_starting_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_plan_time_addition_affiliation`
--
ALTER TABLE `samiti_plan_time_addition_affiliation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_plan_total_investment`
--
ALTER TABLE `samiti_plan_total_investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_profitable_family_details`
--
ALTER TABLE `samiti_profitable_family_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samiti_public_investigation_details`
--
ALTER TABLE `samiti_public_investigation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sarans_lagat`
--
ALTER TABLE `sarans_lagat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_katti_wiwarn`
--
ALTER TABLE `settings_katti_wiwarn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_program_upabhokta_samiti`
--
ALTER TABLE `settings_program_upabhokta_samiti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_program_upabhokta_samiti_details`
--
ALTER TABLE `settings_program_upabhokta_samiti_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_specification`
--
ALTER TABLE `settings_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_bhautik_pariman`
--
ALTER TABLE `setting_bhautik_pariman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_bipat`
--
ALTER TABLE `setting_bipat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_rules`
--
ALTER TABLE `setting_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shrot_details`
--
ALTER TABLE `shrot_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_info`
--
ALTER TABLE `site_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thekka_bail`
--
ALTER TABLE `thekka_bail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area`
--
ALTER TABLE `topic_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_agreement`
--
ALTER TABLE `topic_area_agreement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_budget_shrot`
--
ALTER TABLE `topic_area_budget_shrot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_investment`
--
ALTER TABLE `topic_area_investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_investment_source`
--
ALTER TABLE `topic_area_investment_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_type`
--
ALTER TABLE `topic_area_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_type_budget_shrot`
--
ALTER TABLE `topic_area_type_budget_shrot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_area_type_sub`
--
ALTER TABLE `topic_area_type_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_budget`
--
ALTER TABLE `topic_budget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_budget_profile`
--
ALTER TABLE `topic_budget_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_expense`
--
ALTER TABLE `training_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upabhokta_letter_content`
--
ALTER TABLE `upabhokta_letter_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_plan_installment_details`
--
ALTER TABLE `withdraw_plan_installment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worker_details`
--
ALTER TABLE `worker_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_topic`
--
ALTER TABLE `work_topic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abstract_cost`
--
ALTER TABLE `abstract_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `abstract_cost_image`
--
ALTER TABLE `abstract_cost_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `abstract_profile`
--
ALTER TABLE `abstract_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `amanat_lagat`
--
ALTER TABLE `amanat_lagat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `amanat_more_details`
--
ALTER TABLE `amanat_more_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `analysis_based_withdraw`
--
ALTER TABLE `analysis_based_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `anugaman_detail_patra`
--
ALTER TABLE `anugaman_detail_patra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anugaman_samiti_bibaran`
--
ALTER TABLE `anugaman_samiti_bibaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `assign_plan`
--
ALTER TABLE `assign_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_information`
--
ALTER TABLE `bank_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bhautik_lakshya`
--
ALTER TABLE `bhautik_lakshya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `bill_payment`
--
ALTER TABLE `bill_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_nirman`
--
ALTER TABLE `budget_nirman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `child_plan_details`
--
ALTER TABLE `child_plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contingency`
--
ALTER TABLE `contingency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contingency_exenditure`
--
ALTER TABLE `contingency_exenditure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contract_amount_withdraw_details`
--
ALTER TABLE `contract_amount_withdraw_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contract_analysis_based_withdraw`
--
ALTER TABLE `contract_analysis_based_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contract_bid`
--
ALTER TABLE `contract_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_bid_final`
--
ALTER TABLE `contract_bid_final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contract_details`
--
ALTER TABLE `contract_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contract_dharauti`
--
ALTER TABLE `contract_dharauti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_dharuti_add`
--
ALTER TABLE `contract_dharuti_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_dharuti_firta`
--
ALTER TABLE `contract_dharuti_firta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_document`
--
ALTER TABLE `contract_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contract_entry_final`
--
ALTER TABLE `contract_entry_final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contract_info`
--
ALTER TABLE `contract_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contract_invitation_entry`
--
ALTER TABLE `contract_invitation_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract_invitation_for_bid`
--
ALTER TABLE `contract_invitation_for_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contract_more_details`
--
ALTER TABLE `contract_more_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contract_starting_fund`
--
ALTER TABLE `contract_starting_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_time_addition_affiliation`
--
ALTER TABLE `contract_time_addition_affiliation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract_total_investment`
--
ALTER TABLE `contract_total_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `costumer_association_details`
--
ALTER TABLE `costumer_association_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `costumer_association_details_0`
--
ALTER TABLE `costumer_association_details_0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `costumer_black_list`
--
ALTER TABLE `costumer_black_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deactive_plan_details`
--
ALTER TABLE `deactive_plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dharauti_khata_info`
--
ALTER TABLE `dharauti_khata_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_print`
--
ALTER TABLE `document_print`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_report`
--
ALTER TABLE `document_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekmusta_budget`
--
ALTER TABLE `ekmusta_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eng_dates`
--
ALTER TABLE `eng_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enlist`
--
ALTER TABLE `enlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estimate_add`
--
ALTER TABLE `estimate_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_anudan_details`
--
ALTER TABLE `estimate_anudan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `estimate_lagat_anuman`
--
ALTER TABLE `estimate_lagat_anuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `estimate_lagat_anuman_break`
--
ALTER TABLE `estimate_lagat_anuman_break`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `estimate_lagat_profile`
--
ALTER TABLE `estimate_lagat_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `estimate_other_agreement`
--
ALTER TABLE `estimate_other_agreement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ethekka_info_list`
--
ALTER TABLE `ethekka_info_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ethekka_kul_lagat`
--
ALTER TABLE `ethekka_kul_lagat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `extra_investment_details`
--
ALTER TABLE `extra_investment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investigation_association_details`
--
ALTER TABLE `investigation_association_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `kar_bibaran`
--
ALTER TABLE `kar_bibaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `katti_details`
--
ALTER TABLE `katti_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `letters_history`
--
ALTER TABLE `letters_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `letter_bill_paper_details`
--
ALTER TABLE `letter_bill_paper_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `letter_format`
--
ALTER TABLE `letter_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `letter_indices`
--
ALTER TABLE `letter_indices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `marmat_samhar`
--
ALTER TABLE `marmat_samhar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material_anudan`
--
ALTER TABLE `material_anudan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merge_plan_id`
--
ALTER TABLE `merge_plan_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `more_plan_details`
--
ALTER TABLE `more_plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `napi_lagat_anuman`
--
ALTER TABLE `napi_lagat_anuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `napi_lagat_anuman_break`
--
ALTER TABLE `napi_lagat_anuman_break`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `napi_lagat_profile`
--
ALTER TABLE `napi_lagat_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plan_amount_withdraw_details`
--
ALTER TABLE `plan_amount_withdraw_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `plan_details`
--
ALTER TABLE `plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_details1`
--
ALTER TABLE `plan_details1`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=746;

--
-- AUTO_INCREMENT for table `plan_details_anudan`
--
ALTER TABLE `plan_details_anudan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `plan_katti_record`
--
ALTER TABLE `plan_katti_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_shrot_record`
--
ALTER TABLE `plan_shrot_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_starting_fund`
--
ALTER TABLE `plan_starting_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `plan_time_addition_affiliation`
--
ALTER TABLE `plan_time_addition_affiliation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan_total_investment`
--
ALTER TABLE `plan_total_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `postname`
--
ALTER TABLE `postname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `print_details`
--
ALTER TABLE `print_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print_history`
--
ALTER TABLE `print_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `profitable_family_details`
--
ALTER TABLE `profitable_family_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `program_details`
--
ALTER TABLE `program_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_katti_bibaran`
--
ALTER TABLE `program_katti_bibaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `program_more_details`
--
ALTER TABLE `program_more_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `program_payment`
--
ALTER TABLE `program_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_payment_final`
--
ALTER TABLE `program_payment_final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `program_payment_final_deposit_return`
--
ALTER TABLE `program_payment_final_deposit_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_time_addition_affiliation`
--
ALTER TABLE `program_time_addition_affiliation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `public_investigation_details`
--
ALTER TABLE `public_investigation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `quotation_enlist_form`
--
ALTER TABLE `quotation_enlist_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `quotation_letter_content`
--
ALTER TABLE `quotation_letter_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quotation_more_details`
--
ALTER TABLE `quotation_more_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quotation_total_investment`
--
ALTER TABLE `quotation_total_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `samiti_analysis_based_withdraw`
--
ALTER TABLE `samiti_analysis_based_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `samiti_costumer_association_details`
--
ALTER TABLE `samiti_costumer_association_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `samiti_costumer_association_details_0`
--
ALTER TABLE `samiti_costumer_association_details_0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `samiti_investigation_association_details`
--
ALTER TABLE `samiti_investigation_association_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `samiti_more_plan_details`
--
ALTER TABLE `samiti_more_plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `samiti_plan_amount_withdraw_details`
--
ALTER TABLE `samiti_plan_amount_withdraw_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `samiti_plan_starting_fund`
--
ALTER TABLE `samiti_plan_starting_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `samiti_plan_time_addition_affiliation`
--
ALTER TABLE `samiti_plan_time_addition_affiliation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `samiti_plan_total_investment`
--
ALTER TABLE `samiti_plan_total_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `samiti_profitable_family_details`
--
ALTER TABLE `samiti_profitable_family_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `samiti_public_investigation_details`
--
ALTER TABLE `samiti_public_investigation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sarans_lagat`
--
ALTER TABLE `sarans_lagat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_katti_wiwarn`
--
ALTER TABLE `settings_katti_wiwarn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `setting_bhautik_pariman`
--
ALTER TABLE `setting_bhautik_pariman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `setting_bipat`
--
ALTER TABLE `setting_bipat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shrot_details`
--
ALTER TABLE `shrot_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `thekka_bail`
--
ALTER TABLE `thekka_bail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `training_expense`
--
ALTER TABLE `training_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `upabhokta_letter_content`
--
ALTER TABLE `upabhokta_letter_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `worker_details`
--
ALTER TABLE `worker_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
