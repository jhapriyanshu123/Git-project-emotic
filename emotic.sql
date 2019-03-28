-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2019 at 09:42 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.1.24-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emotic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin@emotic.com', 'sha1$606bb4a5$1$73119732c2f20958d4f2460ed7180be93c1f28ef', '2018-11-22 10:33:48', '2018-12-06 05:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_quotes`
--

CREATE TABLE `admin_quotes` (
  `id` int(11) NOT NULL,
  `mood_id` int(11) NOT NULL,
  `quote_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_login`
--

CREATE TABLE `app_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_login`
--

INSERT INTO `app_login` (`id`, `user_id`, `session_id`, `device_id`, `device_token`, `device_type`, `created_at`, `updated_at`) VALUES
(162, 117, 'L4ZGLvJXJpf7Qqad7YGFjYz0HkHHFIrE', 'DW5Lc5BU3X3yaCh', 'Android', 'Android', '2018-11-02 11:39:07', '2019-02-09 11:37:40'),
(163, 3, 'Rq83IwuCOBsl8ZbYQBPxeDZmF09QJCkm', '', '', '', '2018-11-02 11:39:40', '2018-11-02 11:39:40'),
(164, 73, 'h4Yd7mzp2syqVrXkT7DyISFCLlQZ7zp3', '', '', '', '2018-11-02 11:40:30', '2018-11-02 11:40:30'),
(165, 120, 'HrXzz3YbxL5uzbRTHJzYwk3yjXGlOcKp', '', '', '', '2018-11-02 11:42:24', '2019-02-13 10:26:01'),
(172, 124, 'MHrOEOQcTC0R773E1OFUtJ3B9cDNr26h', '', '', '', '2018-11-02 11:51:26', '2019-02-25 11:26:30'),
(175, 124, 'LvJgTrUNKe6XmwPJSNnhzOTnhfA0mfwD', '', '', '', '2018-11-02 12:03:21', '2019-02-25 11:26:30'),
(176, 32, 'irAeqllyLoVYlNSkbwagXfkYVXe9rWaf', '', '', '', '2018-11-02 12:18:19', '2018-11-02 12:18:19'),
(177, 125, '5HASH8ce2aOCIo1ayxfUbrBpJ92CeqUp', '', '', '', '2018-11-02 12:19:14', '2019-02-25 12:22:50'),
(178, 35, '4rmQHl7oHuEy3b61DGE35mje5b99P7TD', '', '', '', '2018-11-02 12:19:54', '2018-11-02 12:19:54'),
(179, 3, 'MrqQ0uEUbnK2wqeuagdTX7Ox5mUDsscE', '', '', '', '2018-11-02 12:40:37', '2018-11-02 12:40:37'),
(181, 125, 'bEu1USQq7Lv11vxiYsTBCaEGVGqMaico', '', '', '', '2018-11-02 12:44:24', '2019-02-25 12:22:50'),
(182, 3, 'ewAktdqN52AMzZckmwdOjxx5qChhskhm', '', '', '', '2018-11-02 12:45:01', '2018-11-02 12:45:01'),
(183, 3, '2DyPtuyfdkq513g22Zo373W8lA2wVOX2', '', '', '', '2018-11-03 04:56:12', '2018-11-03 04:56:12'),
(184, 125, 'F9R4404euX6xExYQbnylA7XBAsHRgFr4', '', '', '', '2018-11-03 04:57:44', '2019-02-25 12:22:50'),
(185, 3, 'fz3fr9sOdXPzhKIbVP3XJAoU2yjOVeYL', '', '', '', '2018-11-03 05:11:51', '2018-11-03 05:11:51'),
(186, 3, 'Cp3JfY1e9c1ZLoIRlFd0MfFd6UYRxzg2', '', '', '', '2018-11-03 05:18:01', '2018-11-03 05:18:01'),
(187, 125, 'FonJMIFl1rigJ8p0Eb3Ku4OeQyNir9xX', '', '', '', '2018-11-03 07:18:46', '2019-02-25 12:22:50'),
(188, 3, '3NqXMCCAbzGZ7JCaOvyC3huoKPUvc05a', '', '', '', '2018-11-03 09:44:27', '2018-11-03 09:44:27'),
(190, 125, 'OEoAh4mjdQd3vX9LUAIo5DKXP8VWhHEO', '', '', '', '2018-11-03 13:06:39', '2019-02-25 12:22:50'),
(191, 3, 'BYYyu7SIKFMMjPf1p1jmJJqmFEmFZgJu', '', '', '', '2018-11-04 06:44:29', '2018-11-04 06:44:29'),
(192, 3, 'v9DKvdSoGfJ0PP2QSOfMH4jVeYAG9HYR', '', '', '', '2018-11-04 09:51:34', '2018-11-04 09:51:34'),
(193, 125, 'OlQC2ZcVUQgDLZrXRQ9HcfmiCtMsyRxa', '', '', '', '2018-11-04 11:21:01', '2019-02-25 12:22:50'),
(196, 3, 'GFmItgHkHTh8RiUKn6zg7jUjbH7o2KKS', '', '', '', '2018-11-05 10:39:56', '2018-11-05 10:39:56'),
(197, 3, '4vrLPgiEt0rQD1k29Egdel0ZVwjyrWrx', '', '', '', '2018-11-05 10:40:22', '2018-11-05 10:40:22'),
(198, 3, '3pe2QXYliL9bvUiCXc1VVtueyIED5fat', '', '', '', '2018-11-05 10:54:14', '2018-11-05 10:54:14'),
(199, 3, 'iBEtc5DMfeKEUSF8r5rPVUBjX5ZySsgU', '', '', '', '2018-11-05 11:16:53', '2018-11-05 11:16:53'),
(200, 3, 'I2SwuVf4wypI9kGvREdLbQwz7zyDRLPV', '', '', '', '2018-11-05 13:22:35', '2018-11-05 13:22:35'),
(201, 3, 'ZpRQ5ImilDk3UHWIZCFfClyCyytNCuz4', '', '', '', '2018-11-05 19:27:57', '2018-11-05 19:27:57'),
(202, 3, 'xVuzltDj1h2ZlZIMpBV3Vq8DB4DdFCzm', '', '', '', '2018-11-05 20:09:58', '2018-11-05 20:09:58'),
(203, 3, '7Ruo1T2oqyb7cmcP8Y8Dqy15YqxhnDqn', '', '', '', '2018-11-06 15:13:11', '2018-11-06 15:13:11'),
(205, 3, 'TZpoDFEqWBHXifEu0sjaTIy5odZ2zklL', '', '', '', '2018-11-06 19:55:51', '2018-11-06 19:55:51'),
(206, 3, '3WB6oigHITh7kXvqtVBakwvFJwAON4o7', '', '', '', '2018-11-06 20:33:04', '2018-11-06 20:33:04'),
(207, 3, 'XXWON6cIcALTo4QSpBZ4kjwewGftw3Sg', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 20:56:24', '2018-11-06 20:56:24'),
(208, 3, 'ORCk1XOpwRzjJLIe1hoTM8BPZTUnrIUP', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 21:03:03', '2018-11-06 21:03:03'),
(209, 3, 'oApKKZeaAio8lKYnaIPjM0ttSPe3vAA1', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 21:21:49', '2018-11-06 21:21:49'),
(210, 3, '86usyUpXpaaDq5wkBaElSug4YDm876yd', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 21:23:03', '2018-11-06 21:23:03'),
(211, 3, 'vw5XrzySi0DviaGx6kIJVPLoybSCH7LN', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 21:24:08', '2018-11-06 21:24:08'),
(212, 3, 'iSV5YwVdfOViXjWyRYSdqpFbqd8BTZPB', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-06 21:25:07', '2018-11-06 21:25:07'),
(213, 3, 'RmPfizcZamdDbFb7ZgE0YKkihQBnjLhP', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-07 09:31:56', '2018-11-07 09:31:56'),
(214, 3, 'q9bROvN2Tr9fHZsDsiGWJdx2LcHlCsQo', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-07 09:32:28', '2018-11-07 09:32:28'),
(215, 3, 'kxbimUwIx79wsO0oEI7B8iA0CY6QWhJY', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-07 09:33:25', '2018-11-07 09:33:25'),
(216, 3, 'ZdxCnADgZNIytPMQzVpvG5JIbmujZAu0', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-07 09:37:32', '2018-11-07 09:37:32'),
(217, 3, 'kIglBMeI3p7iwtIUVyw1R7Wugi16RaYL', '82665AB2-E401-4127-B6C4-602C30563E4D', 'iphone', 'iphone', '2018-11-07 09:38:24', '2018-11-07 09:38:24'),
(218, 3, '5q06juaAORGIRRctLzG8Rr1CrtXYof0h', 'E8ADEF40-056A-4998-BF84-64330A9E5CBA', 'iphone', 'iphone', '2018-11-07 10:24:42', '2018-11-07 10:24:42'),
(219, 3, 'oRwnnxeaVZ1MXtbkzWyIZuuZN3QExkVV', '29F143C2-C1FB-4894-A7C6-61F96CC8E46F', 'iphone', 'iphone', '2018-11-07 12:23:50', '2018-11-07 12:23:50'),
(220, 36, 'Drxyc2fnvo0sZMFMLE0JQoBvSKXxzvGT', '8BD083A2-CED8-4392-BCF4-ACA38A7BDA0B', 'iphone', 'iphone', '2018-11-07 17:25:18', '2018-11-07 17:25:18'),
(221, 37, 'I8lQcljRSGuchGV5ibTL413eyNn9cOhZ', '8BD083A2-CED8-4392-BCF4-ACA38A7BDA0B', 'iphone', 'iphone', '2018-11-07 17:28:32', '2018-11-07 17:28:32'),
(222, 128, 'gYB49hCX4vFrMvEQWWgzAos7gkiS4SZd', '8BD083A2-CED8-4392-BCF4-ACA38A7BDA0B', 'iphone', 'iphone', '2018-11-07 17:39:09', '2019-02-28 11:52:53'),
(223, 128, 'Bb7UrV56nF749Ibl2hAH0YZeFm2zWkyG', '8BD083A2-CED8-4392-BCF4-ACA38A7BDA0B', 'iphone', 'iphone', '2018-11-07 17:41:24', '2019-02-28 11:52:53'),
(224, 80, '00G4Lf9uvTHlr5fORptIGjKNJZTRnJfC', '8BD083A2-CED8-4392-BCF4-ACA38A7BDA0B', 'iphone', 'iphone', '2018-11-07 17:44:39', '2018-11-07 17:44:44'),
(226, 124, 'Gntr7Y9MR14nevBRVxZWQY5p8ldnclAt', '', '', '', '2018-11-07 18:07:23', '2019-02-25 11:26:30'),
(227, 40, '3k8mKhRIS8Ym6kLzoARHNkbDgIXTOjSn', '32176AAC-A506-4877-BF78-9E6CA91DB955', 'iphone', 'iphone', '2018-11-07 18:22:57', '2018-11-07 18:22:57'),
(228, 3, 'OyJqu8i3H7HOqgNQiwlEGuCPTf0h27eA', 'B5900F1C-FAD2-4D24-945F-CB5C7510DADE', 'iphone', 'iphone', '2018-11-07 18:35:52', '2018-11-07 18:35:52'),
(231, 3, '3r2kkATowB7QO3jcdaXDhfVmXl4Tugzy', '', '', '', '2018-11-08 11:59:11', '2018-11-08 11:59:11'),
(232, 125, 'kDPuAnpHZKWSZHLqsBvEsPFXolSXvvrD', '', '', '', '2018-11-08 12:34:52', '2019-02-25 12:22:50'),
(233, 125, 'Q5QEzonanjEZKdm1nCtBmQxMSqWC0Uzc', '', '', '', '2018-11-08 12:47:11', '2019-02-25 12:22:50'),
(234, 81, 'WZ09Q6VFnfPjSgWb41HyKOTsI8dFzklM', '', '', '', '2018-11-08 13:44:15', '2018-11-08 13:44:15'),
(235, 124, 'DLpPdTgGJmlI0z7m6OlKmb2GSrl5IP6N', '', '', '', '2018-11-08 15:23:29', '2019-02-25 11:26:30'),
(236, 124, 'FCvMcbjDc1WrFtGFcoUQEJA9Z6LlSPqU', '', '', '', '2018-11-08 15:31:52', '2019-02-25 11:26:30'),
(237, 124, 'gv3Hl0aFnrFM6h2W4aigKxOtjud9EY9P', '', '', '', '2018-11-08 15:32:00', '2019-02-25 11:26:30'),
(238, 3, 'GWlnZvFBwOMga3KUkVVvk6z4uWG56oRv', 'A32A2395-E504-4144-8AEA-4B13E7CD3FC4', 'iphone', 'iphone', '2018-11-08 17:01:22', '2018-11-08 17:01:22'),
(239, 3, '6CdXViF6sDp5OIej1IqugCaPpK0BipvA', 'B5900F1C-FAD2-4D24-945F-CB5C7510DADE', 'iphone', 'iphone', '2018-11-08 19:09:11', '2018-11-08 19:09:11'),
(240, 3, 'pmw3cXhyzRMgphYvsAqwf2PAYIwvVwtv', 'A32A2395-E504-4144-8AEA-4B13E7CD3FC4', 'iphone', 'iphone', '2018-11-08 19:15:41', '2018-11-08 19:15:41'),
(241, 3, 'P4EEfiuCI0tHy7sIQkWDCGElO1fykL4l', '', '', '', '2018-11-08 22:08:43', '2018-11-08 22:08:43'),
(242, 3, 'Dl0RnVLy03XFdBGRMdY2NfoC4lQt4Ru7', 'B5900F1C-FAD2-4D24-945F-CB5C7510DADE', 'iphone', 'iphone', '2018-11-09 13:21:34', '2018-11-09 13:21:34'),
(243, 3, 'Wtyk8HC4G7sfA1eiTKGHxz87qg1JOCl9', '', '', '', '2018-11-09 19:37:05', '2018-11-09 19:37:05'),
(244, 128, '7vFmODOKJAYPfAQ7c7geI15i2eoWVLkt', '98102165-E9AF-4D6D-8D6B-66A36688C4C9', 'iphone', 'iphone', '2018-11-11 17:35:13', '2019-02-28 11:52:53'),
(245, 3, 'ZaCJ8S4vNVJcSHZzvgGs6kFo5CXDu3ia', '98102165-E9AF-4D6D-8D6B-66A36688C4C9', 'iphone', 'iphone', '2018-11-11 18:03:30', '2018-11-11 18:03:30'),
(246, 82, 'U91FHMG1iuNOeKmX7USO1JKx69795AbE', '98102165-E9AF-4D6D-8D6B-66A36688C4C9', 'iphone', 'iphone', '2018-11-11 18:15:28', '2018-11-11 18:15:40'),
(247, 125, 'U4drPJcwKH45UwkvnewE1mrgprOGoKIU', '', '', '', '2018-11-12 04:41:37', '2019-02-25 12:22:50'),
(248, 125, '79YFKtJWOfIOn0AqKSiTPZIHAdov9EF6', '', '', '', '2018-11-12 04:48:11', '2019-02-25 12:22:50'),
(249, 124, 'gx320rjI6K6vggwgGzg26HmsL1LnUqL0', '', '', '', '2018-11-12 05:41:32', '2019-02-25 11:26:30'),
(250, 3, 'bGYyiJVhvNvMer0Cc7VqsbtTX9O6L459', '', '', '', '2018-11-12 06:15:48', '2018-11-12 06:15:48'),
(251, 3, 'zcgs1sj0sPcmb6kYdzjs3qg16RmgbN4L', '', '', '', '2018-11-12 06:18:22', '2018-11-12 06:18:22'),
(252, 125, 'HqEo2ggeX3FgjRJlAMIQDW7aHqk0no9r', '', '', '', '2018-11-12 06:18:28', '2019-02-25 12:22:50'),
(253, 3, 'M7Mdvl635akR5o1bmYjIa0fy6EYUImHr', 'L83IrsYlIYJ76P2', 'Android', 'Android', '2018-11-12 06:21:59', '2018-11-12 06:21:59'),
(254, 3, 'iyU11GHmZeodyWMYCeVENECt4uqNkSbw', '', '', '', '2018-11-12 06:54:28', '2018-11-12 06:54:28'),
(255, 125, 'yiwzD7J2U6mnWXgoppiYDQULGntYJgbQ', '', '', '', '2018-11-12 07:38:37', '2019-02-25 12:22:50'),
(256, 83, 'keAaMRsTVZFxxLIBG7QiBzHMf7Tsq5dh', 'cWZTDQ5P0Oskv1X', 'Android', 'Android', '2018-11-12 12:26:04', '2018-11-12 12:26:21'),
(257, 83, 'CVBddKUepqym2uazWUsBkgR8OTaVxy0B', 'UeKe5Aiq6tzxoYm', 'Android', 'Android', '2018-11-12 12:26:14', '2018-11-12 12:26:21'),
(258, 125, 'EqyI53yM7fsAm7oT8Pz8rAoaes8XrWhk', '', '', '', '2018-11-12 12:32:11', '2019-02-25 12:22:50'),
(259, 3, 'x4OIM7O8FebxSyh4NuuMsIPNRZ7CcerU', '', '', '', '2018-11-12 12:32:36', '2018-11-12 12:32:36'),
(260, 3, '3j1wEVjTc9g9MNFndpTy1VRtzhcpCSu8', '', '', '', '2018-11-12 12:34:08', '2018-11-12 12:34:08'),
(261, 3, 'kS2pwsk8i7N2ZdP2AJpGGjooq4aVuCed', '', '', '', '2018-11-12 12:34:14', '2018-11-12 12:34:14'),
(262, 83, 'ddtfNp7qU82MVXvwbhY3b76x5m526Hqt', '', '', '', '2018-11-12 12:37:05', '2018-11-12 12:37:05'),
(263, 125, 'ihIkYsQybAueFKrWBVMiW1NLIvHld3Jd', '', '', '', '2018-11-12 12:38:55', '2019-02-25 12:22:50'),
(264, 125, 'jhNuhkp1l4Jb8stOaPEcvQyh2KAEjybR', '', '', '', '2018-11-12 12:56:52', '2019-02-25 12:22:50'),
(265, 125, 'xzNFtHUAD09xagIjMvV70f5VfZkaIYuU', '', '', '', '2018-11-12 13:02:58', '2019-02-25 12:22:50'),
(266, 124, '2VBk87Nt6pBAqOs20MVJSdL3IxrgznQ1', '98102165-E9AF-4D6D-8D6B-66A36688C4C9', 'iphone', 'iphone', '2018-11-12 13:07:19', '2019-02-25 11:26:30'),
(267, 3, 'cMhwELLAQ3ZHNVaiO1tc1sv2zKeQdW4L', '6PZAeUCQBq6de9a', 'Android', 'Android', '2018-11-12 13:13:33', '2018-11-12 13:13:33'),
(268, 125, 'H4gec6P9EnHnQr3TQqs2gCu8B2F9Rnaj', '', '', '', '2018-11-12 17:40:20', '2019-02-25 12:22:50'),
(269, 3, '8nlXkr1XCNjwta6gE9wyIoHjHzPYAZ02', '98102165-E9AF-4D6D-8D6B-66A36688C4C9', 'iphone', 'iphone', '2018-11-12 17:51:55', '2018-11-12 17:51:55'),
(270, 3, 'aJidkyvFadCBBHqbv3UshEvUkI1o3yqU', 'yBcoNwaNWL0Ke26', 'Android', 'Android', '2018-11-12 18:16:20', '2018-11-12 18:16:20'),
(271, 3, 'uOvxI3pK1YpeSgYSi8usy5eM9IDdK8oa', '', '', '', '2018-11-12 18:17:18', '2018-11-12 18:17:18'),
(272, 3, 'cqDDX74dTq4hTNq0Ktg6dLDd8D3WVMrF', 'qCx1L8SDu0JINrI', 'Android', 'Android', '2018-11-12 18:21:24', '2018-11-12 18:21:24'),
(273, 3, 'mExrs7FhXliuRr5jmuFKtGkDbCESE24H', 'TftWKDLOUiP3jvQ', 'Android', 'Android', '2018-11-12 18:22:09', '2018-11-12 18:22:09'),
(275, 125, 'QcoGVKcFnDi1QGZO45W4ZvlISim9JJNF', '', '', '', '2018-11-12 18:30:07', '2019-02-25 12:22:50'),
(276, 125, 'DjmA2kZIi87QS9ApuRnMpXdMQ1ePqQC3', '', '', '', '2018-11-12 18:33:30', '2019-02-25 12:22:50'),
(277, 125, '10Ffor7yP2WaBMXKXRKIhyHWbWOhnK62', '', '', '', '2018-11-13 04:33:28', '2019-02-25 12:22:50'),
(278, 125, 'LmmikZ6J6vtmILsut8iV1WED5uOt3kbi', '', '', '', '2018-11-13 04:54:28', '2019-02-25 12:22:50'),
(279, 84, '4HqSw3EPeMpjDkbASIN1aVcpru5bhte7', 'zc3BIWC5Ay8a7BZ', 'Android', 'Android', '2018-11-13 06:18:21', '2018-11-13 06:28:38'),
(280, 125, 'j7uSBBOh9kCMl6csrumJoLJcovrxRD3A', '', '', '', '2018-11-13 06:26:22', '2019-02-25 12:22:50'),
(281, 84, 'USXkrxz4JbokMj3KsUgWVhJQgqnZpezI', '9Q7PesKEFjRKPr5', 'Android', 'Android', '2018-11-13 06:28:06', '2018-11-13 06:28:38'),
(282, 84, '54Dh79eGtnDxDYIGh0bj2TBQuYjYr0SB', 'LwIw5TbCkbO7Ja4', 'Android', 'Android', '2018-11-13 06:31:52', '2018-11-13 06:31:52'),
(283, 125, 'pQF6JQAUqSx3a3ltx7HksTpdLjcg7oNO', '', '', '', '2018-11-13 06:33:12', '2019-02-25 12:22:50'),
(284, 3, 'w7GKc7tL8eI9PWVbcTyDtwRgpmitlY2H', 'E46D9BE4-D1E1-48D2-A455-CDF293A6770B', 'iphone', 'iphone', '2018-11-13 06:40:55', '2018-11-13 06:40:55'),
(285, 125, '5WY6zBuCWhLwPbpVoG0bYdhpfvswPokP', '', '', '', '2018-11-13 06:51:39', '2019-02-25 12:22:50'),
(286, 124, 'v2ahGwBM4ZCFSuSgCA0nuvfb4z9LGtlj', 'F56B228F-777E-4613-8219-1FD7CE76D981', 'iphone', 'iphone', '2018-11-13 06:53:57', '2019-02-25 11:26:30'),
(287, 125, 'IfX0pBH1otO8STKZwzqoMXW9z5k55NDh', '', '', '', '2018-11-13 06:55:36', '2019-02-25 12:22:50'),
(288, 125, 'LP1PJXM8ui3LglNgc1HYoKsjpqaqAkef', '', '', '', '2018-11-13 07:34:42', '2019-02-25 12:22:50'),
(289, 125, 'Nq6HH3jS5IxMHpT4Hf9lS5pQoZUxZde0', '', '', '', '2018-11-13 10:45:16', '2019-02-25 12:22:50'),
(290, 3, 'oy3Nih6fT2hr2qpZNijmpYK2VlCrR1Wp', '', '', '', '2018-11-13 17:59:11', '2018-11-13 17:59:11'),
(291, 3, 'hoAlGJnC4t1sP9v0Hb4UWd6XE4UDrDBW', '', '', '', '2018-11-13 18:05:52', '2018-11-13 18:05:52'),
(292, 3, '7f0gSMk6g2bNOngkHxYN7eMHur3SHW6W', '', '', '', '2018-11-13 18:05:59', '2018-11-13 18:05:59'),
(293, 125, 'AOGPmxxZzE8k3NMVNqvgIB1SXbS2MaeS', '', '', '', '2018-11-13 18:09:50', '2019-02-25 12:22:50'),
(294, 125, 'zA8pG7Fl6xDOZNKKknPd0MUcBjORpPrd', '', '', '', '2018-11-13 18:19:59', '2019-02-25 12:22:50'),
(295, 3, 'gEnbR9QDBMZ7oD9ywtfN1vUBBXtvR0qG', '', '', '', '2018-11-13 18:21:15', '2018-11-13 18:21:15'),
(296, 3, '3gCxLWOxcWvTOa7XdGejyPCUHrBHdG0e', '', '', '', '2018-11-13 18:22:40', '2018-11-13 18:22:40'),
(297, 3, 'fzQ9CrONdkEfRbqpjl6BgWno9wd2VQaK', '', '', '', '2018-11-14 11:29:41', '2018-11-14 11:29:41'),
(298, 3, 'x0fJodzOqgfhEr0aZ1fpwJnojyfFkLwO', 'VH62ILQ6y7UTStn', 'Android', 'Android', '2018-11-14 11:30:01', '2018-11-14 11:30:01'),
(300, 3, 'R3qesve2XewrJ0ihs06azFcL7TwL74wN', '19380DA4-E799-4811-91DA-B90F804852EE', 'iphone', 'iphone', '2018-11-14 19:27:28', '2018-11-14 19:27:28'),
(301, 3, 'GDxYCnxq9kpAP0UUS7TLzHsb0hZG1iO7', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-14 19:53:43', '2018-11-14 19:53:43'),
(302, 3, 'FKwBu0iOo8AG4orv4fMQSKmycJlaBRmk', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-14 20:32:45', '2018-11-14 20:32:45'),
(303, 3, 'FjPinJiokcTVqL21Xz11QLFzfDHWoU73', '', '', '', '2018-11-15 04:17:28', '2018-11-15 04:17:28'),
(304, 125, 'bDOGOuKspetGZ7hl4hn6Fsqxl2rmwFYw', '', '', '', '2018-11-15 07:31:20', '2019-02-25 12:22:50'),
(307, 3, 'qLFBpVJXrr3h0PDNVb5vVROwdQgkRHBq', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-15 12:14:35', '2018-11-15 12:14:35'),
(309, 3, 'FR2vxZ9bbTrTYNNRwamEh2Ks5AL2yxW0', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-15 13:05:34', '2018-11-15 13:05:34'),
(310, 3, 'L9f78u1Jh7TNq7icM3vlvLzzCq2HKBqT', 'F3B1AA22-3E31-4D08-9B86-035F02B7CC92', 'iphone', 'iphone', '2018-11-15 13:12:36', '2018-11-15 13:12:36'),
(311, 3, 'H5B1Hsghrv9Eqdq8svXRlUNX9i9hrxDG', '28EC5AB5-B6DC-460B-9ED5-836EA0F37C65', 'iphone', 'iphone', '2018-11-15 13:21:34', '2018-11-15 13:21:34'),
(312, 3, 'Et4KrWdGUkrDwBfD3EzamX6CkFq1Ob0a', 'F3B1AA22-3E31-4D08-9B86-035F02B7CC92', 'iphone', 'iphone', '2018-11-15 13:25:03', '2018-11-15 13:25:03'),
(313, 87, 'WDBCl0vuWBAkX6rkdHqz5VtemOrJqujz', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', 'iphone', 'iphone', '2018-11-16 08:39:11', '2018-11-16 08:39:18'),
(314, 87, 'nS8DfYFfK7ma1vEpqon8JlSoUVuJf4GH', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', 'iphone', 'iphone', '2018-11-16 08:43:38', '2018-11-16 08:43:38'),
(315, 3, '7WSnnW6VrUxW315L3V7XoTG4iWK61wPf', '', '', '', '2018-11-16 10:31:08', '2018-11-16 10:31:08'),
(316, 90, 'LZFti53trgCJh1Z5QSRlldyEi89X12oR', '34FAE206-72B1-43B4-8BE2-CE806F4FF1D9', 'iphone', 'iphone', '2018-11-16 13:11:29', '2018-11-19 07:47:43'),
(317, 88, 'EN1jbfnIq4PyI8btz5k0DbsqLzkqlEAt', '88FF9B15-3C05-476C-BC20-336299DE29CA', 'iphone', 'iphone', '2018-11-16 17:38:13', '2018-11-16 17:38:21'),
(319, 90, 'sLNyU1pvl5PAFvYaPYVtgMKX5u5jLiqi', '34FAE206-72B1-43B4-8BE2-CE806F4FF1D9', 'iphone', 'iphone', '2018-11-19 07:47:34', '2018-11-19 07:47:43'),
(320, 3, 'GWZyVLkSNEonS2ClETBtCohTuoJtJrvx', '', '', '', '2018-11-21 21:50:04', '2018-11-21 21:50:04'),
(321, 3, 'jmulqGLHaCOac6V04TFdjNsRWaEFUeaE', 'tm6WwSu8aBPnP2u', 'Android', 'Android', '2018-11-21 22:05:05', '2018-11-21 22:05:05'),
(322, 125, 'VtlsRnlts1PDL9RKjUBFU1wbxeIaAlYw', '', '', '', '2018-11-22 04:44:01', '2019-02-25 12:22:50'),
(323, 125, 'xkOC71q1Anws2N3bsy6mxQCVi6pFPCU7', '', '', '', '2018-11-22 05:42:28', '2019-02-25 12:22:50'),
(324, 125, 'bQyvk20kosUoVCMvLGT0wS9jKLkaFJiF', '', '', '', '2018-11-22 05:42:51', '2019-02-25 12:22:50'),
(325, 125, 'XCuyJ3lH8bY4p9wRTEMDzBf9vHuSVarF', '', '', '', '2018-11-22 05:43:47', '2019-02-25 12:22:50'),
(326, 125, 'Wwi2E0jPFDlhG9eDeuF3Y4sMrmOEFdt8', '', '', '', '2018-11-22 05:44:53', '2019-02-25 12:22:50'),
(329, 125, 'Zw4cP5cX4tsBcaFbIA0TLRCC7ZQH86Xl', '', '', '', '2018-11-22 05:52:38', '2019-02-25 12:22:50'),
(330, 3, 'WHgEEnZ8iFDSagRhjM3FFvyvwkg2K4dk', '', '', '', '2018-11-22 05:54:05', '2018-11-22 05:54:05'),
(331, 3, 'RbXYq3i70SATzsOaaxm7vdwmVyLck4ZM', '32176AAC-A506-4877-BF78-9E6CA91DB955', 'iphone', 'iphone', '2018-11-22 08:12:42', '2018-11-22 08:12:42'),
(332, 3, '77qPwaqhNNZ27ur7B55JjJXDM2WBF1zX', '265748DC-BCA4-453A-90A7-7930BAC5FD1B', 'iphone', 'iphone', '2018-11-22 08:15:03', '2018-11-22 08:15:03'),
(333, 3, '8HAExl4ljoMoRuojGGsyFtr5Cs3DzzLl', '28EC5AB5-B6DC-460B-9ED5-836EA0F37C65', 'iphone', 'iphone', '2018-11-23 13:35:15', '2018-11-23 13:35:15'),
(334, 3, '7yoG3QtPVDT1VbMi51NVsFfeMHLPQWHE', 'R6N1CQSWY5yUHPo', 'Android', 'Android', '2018-11-23 21:17:19', '2018-11-23 21:17:19'),
(335, 3, '8y8oGMTfy3Rd9QbDLgzuyiVeLL9j7UEX', 'cVK83LnFup1rLVg', 'Android', 'Android', '2018-11-23 21:52:10', '2018-11-23 21:52:10'),
(336, 3, 'ctSZxV8UY19bXqQAnxRrhtYKBkOTePLW', 'YXDly9UzUEQ1r7b', 'Android', 'Android', '2018-11-23 22:06:14', '2018-11-23 22:06:14'),
(337, 90, 'G4jY6VZZpneuAzXqTeiN4MDCmfG4P0lJ', '7B91BF3D-AEC1-421F-B2D8-267CD936EA21', 'iphone', 'iphone', '2018-11-24 06:40:21', '2018-11-24 06:40:21'),
(338, 90, 'WNHJwhXVULktmTIjRcJS7mbm9SkJs8xo', 'EBDC2BEF-F009-4173-9514-8A52B6F81AB6', 'iphone', 'iphone', '2018-11-24 07:01:13', '2018-11-24 07:01:13'),
(339, 90, 'tDs5zYjR6DrizVJmqv12Flxni9Oyaxvo', '7B91BF3D-AEC1-421F-B2D8-267CD936EA21', 'iphone', 'iphone', '2018-11-24 08:26:00', '2018-11-24 08:26:00'),
(340, 90, 'RGiB0Fd65Irl4IEfXY89dPgc7tT9FWoo', '01E12D6F-8DEF-416A-9E07-C1D8F37DBB94', 'iphone', 'iphone', '2018-11-24 10:39:58', '2018-11-24 10:39:58'),
(341, 91, 'f22kFLD2iHP1IRY07Rt50QFr6FMsQZf8', '', '', '', '2018-11-24 12:39:52', '2018-11-24 12:40:10'),
(342, 3, 'f0o1e5OUxRjjMPoyL2mcgHspyqaLS9TI', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', 'iphone', 'iphone', '2018-11-24 18:20:39', '2018-11-24 18:20:39'),
(346, 94, '83WxZrm8jhD4PI7sLKNYE2HKFSPMGIe2', 'ZsWPMqvGrjz4oj6', 'Android', 'Android', '2018-11-26 09:19:14', '2018-11-26 09:19:52'),
(347, 87, '7IPYWfiNxtzDWrdqNfAG3El62mZ11rjb', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', 'iphone', 'iphone', '2018-11-26 10:41:24', '2018-11-26 10:41:24'),
(348, 3, 'G1V3pX9InC2zzePJoaj5OocGJyBs3dXF', 'admin@emotic.com', '', '', '2018-11-26 11:36:32', '2018-11-26 11:36:32'),
(349, 125, 'UjI2aFZMtyjYnqeTjS0AD6oCLqPdGeRN', '', 'android', 'android', '2018-11-26 11:41:23', '2019-02-25 12:22:50'),
(350, 90, '5G583dglSdFNiODFsCV2AUDIewprJu9k', '7B91BF3D-AEC1-421F-B2D8-267CD936EA21', 'iphone', 'iphone', '2018-11-26 13:31:22', '2018-11-26 13:31:22'),
(351, 125, '6ZpwZQzm1k7POsPgp7FOcHOKmggLQhPf', '', '', '', '2018-11-26 13:44:24', '2019-02-25 12:22:50'),
(352, 3, 'DVPvMK76EI5STPE1uCJ7JLZyngbnXkhs', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-26 18:03:31', '2018-11-26 18:03:31'),
(353, 3, '1eoHKeNehVmOHPGiv6eBDOrjjzwF6Cvb', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-11-26 19:41:36', '2018-11-26 19:41:36'),
(354, 3, 'ZFMQ7oWCDuWyLiyNJC8Mdhu2ka5cXgDU', 'admin@emotic.com', '', '', '2018-11-27 08:33:09', '2018-11-27 08:33:09'),
(355, 95, 'ozoIR9Sk0dGD93ITxSZ6KyzA4b1T1jTr', '', '', '', '2018-11-27 13:15:03', '2018-11-27 13:15:26'),
(356, 95, 'Y88YMdaDJRGMnGQHBDjtg0PR2wWUTNYC', '', '', '', '2018-11-27 13:16:01', '2018-11-27 13:16:01'),
(357, 3, 'Q7OZw3W2asymVWlHksKq1YylL4HbUxk5', '', '', '', '2018-11-27 13:28:07', '2018-11-27 13:28:07'),
(358, 3, 'yb6txSHFAwrfIRT2fERO7MZ9Q6QIT1Jy', '', '', '', '2018-11-27 21:37:33', '2018-11-27 21:37:33'),
(359, 3, 'yOiAivG0XK2rmUv9YsMbIQqzvnJSaXjW', 'admin@emotic.com', '', '', '2018-11-28 04:23:10', '2018-11-28 04:23:10'),
(360, 3, '03bxWFpf7lwhH7uWZrtFcqPuREgoQZKX', '', '', '', '2018-11-28 11:13:33', '2018-11-28 11:13:33'),
(361, 3, 'z8LY16I1YWuLuOtbX8Q4daSvLu0B0GyX', 'admin@emotic.com', '', '', '2018-11-28 11:29:31', '2018-11-28 11:29:31'),
(362, 3, 'Vgfa4ZHtXvfHzkp5LbvPwgfUKNTHjolx', '', '', '', '2018-11-28 12:01:54', '2018-11-28 12:01:54'),
(363, 3, 'iTHL1JeGqGt06brU7DQA6n14Fep1KYk0', 'admin@emotic.com', '', '', '2018-11-28 12:12:04', '2018-11-28 12:12:04'),
(364, 3, 'jwCKhOGANQznqBZI42Owd31ksLJFqMCi', 'admin@emotic.com', '', '', '2018-11-28 12:15:56', '2018-11-28 12:15:56'),
(365, 3, '8NDLLW49w3bIStWLUci0QG7fgxAheR3M', '', '', '', '2018-11-29 09:43:14', '2018-11-29 09:43:14'),
(366, 3, 'Dj1j4dvDzxhGBpTV5Pv1ng6jSOvSwqMl', '', '', '', '2018-11-29 19:20:03', '2018-11-29 19:20:03'),
(367, 3, 'iaQcJxWnwxRzYfbskaXpDaDnlxHVQWsZ', 'admin@emotic.com', '', '', '2018-11-30 05:24:03', '2018-11-30 05:24:03'),
(368, 95, 'jk7NuGwq3t9MWTyXLEYKvh0M1qKlpzpm', '', '', '', '2018-11-30 05:25:49', '2018-11-30 05:25:49'),
(369, 3, 's5elN3a4pVOpTbgRvDqMn9CnWcU8sunq', 'admin@emotic.com', '', '', '2018-11-30 06:13:03', '2018-11-30 06:13:03'),
(370, 3, 'G4tyfwUHU7ywE9Qu9zBcyDQYTKExklxN', 'admin@emotic.com', '', '', '2018-11-30 06:14:57', '2018-11-30 06:14:57'),
(371, 3, 'iWOlPnknz3pvHKHL1pmdKW5Ias0MOWod', '', '', '', '2018-11-30 09:44:38', '2018-11-30 09:44:38'),
(372, 3, 'hKRmF2y2OAK71KEikgmclqodDVBx6TkN', '', '', '', '2018-11-30 11:49:59', '2018-11-30 11:49:59'),
(373, 3, 'pzzMkwfwadV4nKf3pzLDRfex0rgKDogF', 'admin@emotic.com', '', '', '2018-11-30 12:05:59', '2018-11-30 12:05:59'),
(374, 3, 'nEPu9qgYnfZct0yfmryxv8Jyn9zPKmRB', '', '', '', '2018-11-30 12:55:19', '2018-11-30 12:55:19'),
(375, 3, 'Z42rTYEP9XskohVbjExAWFKeubP3M0V4', 'admin@emotic.com', '', '', '2018-12-01 05:09:56', '2018-12-01 05:09:56'),
(376, 125, 'tbakSyhhx5cLhEf666Y4eR0G4HkxRLIh', '', '', '', '2018-12-01 05:24:34', '2019-02-25 12:22:50'),
(377, 3, 'VJLCUtbla0zOd70TyI7zhXRE6lwgfVAS', '', '', '', '2018-12-01 05:28:41', '2018-12-01 05:28:41'),
(378, 125, '0EX3o0d4KUzVZ2ie49G9Nq2tZPBN9Dof', '', '', '', '2018-12-01 05:49:03', '2019-02-25 12:22:50'),
(379, 96, 'ltKveBj7yhbmG1y9Gzajh8gzEPuiOYWp', '3zLeXREwDJNau23', 'Android', 'Android', '2018-12-01 08:27:28', '2018-12-01 08:27:32'),
(380, 97, 'V2FAZmA42AJKzYcOCZp6zJLB9w9XnSPF', 'A0kRhAyTksnbOnl', 'Android', 'Android', '2018-12-01 08:30:08', '2018-12-01 08:30:16'),
(381, 125, '5JoFykCUoA55BNNZV7myCPA7K8OY5SWU', '', '', '', '2018-12-01 08:31:38', '2019-02-25 12:22:50'),
(382, 124, '7O61yBhzR6wAhLm4mlkMal620t89PMpR', '', '', '', '2018-12-01 09:04:22', '2019-02-25 11:26:30'),
(383, 124, 'lQf0081VYiQvMT6bQ5viGyptuvxjS3q8', '', '', '', '2018-12-01 09:04:52', '2019-02-25 11:26:30'),
(384, 124, 'dMnKrwLMSJhihqm8wBTZnLtRmAcYPft5', '', '', '', '2018-12-01 09:14:10', '2019-02-25 11:26:30'),
(385, 124, 'mLtOJM47mckh8Mlexd04OgJxcAGLI8hB', '', '', '', '2018-12-01 09:17:56', '2019-02-25 11:26:30'),
(386, 124, 'qroNv6eYzg6KmmT1neeuP6sCFxODpkEr', '', '', '', '2018-12-01 09:18:33', '2019-02-25 11:26:30'),
(387, 98, '7LMNMoK4IlO6nJBi4QbhBzuFGXcdihyY', '', '', '', '2018-12-01 09:43:33', '2018-12-01 09:43:33'),
(388, 99, 'lwgLe6bDPCQgu1Rwg22B3uHs2u7Ndomb', '', '', '', '2018-12-01 09:44:10', '2018-12-01 09:44:10'),
(389, 125, 'ZWvkHzkfY30NMr9Qyovq71O1GXPwrYEK', '', '', '', '2018-12-01 09:48:51', '2019-02-25 12:22:50'),
(391, 3, '4acxvSCdoflDR1OeCOdYZfUKzAF48FL1', '', '', '', '2018-12-01 13:55:32', '2018-12-01 13:55:32'),
(392, 3, '3PUnfrD6G7VFK348I9aoA9HHpl5x9wu6', '', '', '', '2018-12-01 19:30:07', '2018-12-01 19:30:07'),
(393, 3, 'k3OjI9js58TIcwZt6Z1g6IRsk7nQrghE', 'admin@emotic.com', '', '', '2018-12-03 05:12:48', '2018-12-03 05:12:48'),
(394, 3, '8fi1Ql5SmjCdXS2lEiUKgD5wvEBenN1q', 'admin@emotic.com', '', '', '2018-12-03 09:11:57', '2018-12-03 09:11:57'),
(395, 125, 'ujwNRoJizdbQ9IYerGE3oq1w4sKU3kfQ', '', '', '', '2018-12-03 09:13:21', '2019-02-25 12:22:50'),
(403, 3, 'egGeu8BU7wk6r8IP1o0vHsoYuaYbxVSH', 'admin@emotic.com', '', '', '2018-12-03 10:59:01', '2018-12-03 10:59:01'),
(404, 101, 'pCdb0bUd53K068QWyUCg14dYBVi17wSp', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-03 11:02:50', '2018-12-03 11:02:56'),
(405, 3, '8uQcP5S2c8ahLzWxqmkfXJW1dFeibjnw', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-03 11:03:56', '2018-12-03 11:03:56'),
(406, 101, 'sGopTxiDHxi9dFKpUYOwyaZnCEhrKTbM', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-03 11:04:38', '2018-12-03 11:04:38'),
(408, 3, 'xuNHEaTu1ztQxnG69P5UF5TB76hIUwXT', 'admin@emotic.com', '', '', '2018-12-03 12:08:14', '2018-12-03 12:08:14'),
(410, 3, 'AC2JqsxU1j8knBBX079ghr95tZzJbB4Q', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-03 18:43:59', '2018-12-03 18:43:59'),
(411, 101, 'MK6e8DH4JaJlZSQeN8STlv1vzTJNeXgu', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-03 18:44:48', '2018-12-03 18:44:48'),
(414, 94, '4jvZNrJYNMUYb6vQOwTAmyMpkIrdXNpx', 'UJJB296rsbp2bEo', 'Android', 'Android', '2018-12-04 06:50:53', '2018-12-04 06:50:53'),
(415, 94, 'l8HqIzlSjEuyhLxv52sFa0supPfVsfe7', '8qtEFxP8Za1ILaf', 'Android', 'Android', '2018-12-04 06:58:55', '2018-12-04 06:58:55'),
(416, 3, 'uugcHcAx6iPik21HFePUrzZFXjyxZMHl', '', '', '', '2018-12-04 11:59:12', '2018-12-04 11:59:12'),
(420, 3, 'RyEoQGX2LE10LrFoEyTTWbm0SZ77tZkf', '7CCF4F64-7486-4658-97A9-8B3606C87821', 'iphone', 'iphone', '2018-12-04 13:48:44', '2018-12-04 13:48:44'),
(421, 101, 'rQS0J6QECxn7BMQ8oBGUe2ohufOc1vmg', '28EC5AB5-B6DC-460B-9ED5-836EA0F37C65', 'iphone', 'iphone', '2018-12-04 18:08:49', '2018-12-04 18:08:49'),
(422, 3, 'DyfJVLTZ0CutJE9H863TShltJMxH4uOr', '28EC5AB5-B6DC-460B-9ED5-836EA0F37C65', 'iphone', 'iphone', '2018-12-04 18:26:24', '2018-12-04 18:26:24'),
(424, 125, 'Knbp1XdwR1aGiAXt7ZslWHrnpTHEszfh', 'admin@emotic.com', '', '', '2018-12-05 09:45:57', '2019-02-25 12:22:50'),
(426, 3, 'x6LL7Uiiozi7OFqthvUcdPRxI6oIMMId', '', '', '', '2018-12-05 10:53:25', '2018-12-05 10:53:25'),
(427, 125, 'QULS1DvvrvGCxT0AcTnnibTiUXDccQ8I', 'admin@emotic.com', '', '', '2018-12-05 11:26:21', '2019-02-25 12:22:50'),
(429, 125, 'LrbucWiuTxoFbtwGaLMBncRqbOz0XlyW', 'admin@emotic.com', '', '', '2018-12-05 12:26:47', '2019-02-25 12:22:50'),
(430, 60, 'CPt6JjDOmljdK4yQgMgbINdF4COAC0iD', '', '', '', '2018-12-05 12:49:50', '2018-12-05 12:49:50'),
(432, 3, 'jCT67xX4SaJVNhrNbUIjB4dit7KKGveN', '', '', '', '2018-12-05 13:28:28', '2018-12-05 13:28:28'),
(433, 125, 'i0gl5jZ0MljwH5HrXGkH4viuGX9GDGiX', 'admin@emotic.com', '', '', '2018-12-06 06:20:06', '2019-02-25 12:22:50'),
(434, 125, 'Z0ZvPf7bFaQsO5SzeSCxwllBKjMw4qXC', 'Y5gcI5hB5F7Fhzk', 'dwBwxk5klsI:APA91bGwrilpromSiJ9dzALXfRHVAtYCNHezrUAyfwlJppqe6EDXxUhdf7k6CDaIXlaaF81MoOoln5bRlF7zVRRliOCg6nlczeXT09xx2jJF98bRLaHVdZh8eCKWK8tGMCd1jFwdL7bm', 'Android', '2018-12-06 13:14:40', '2019-02-25 12:22:50'),
(436, 103, 'BfLJrJNFECS8ZAfwZH8hKNAN6SwmsFlY', 'cpQyX3KfR7wvuqs', 'eyl-ZgcHoTM:APA91bG34UHz1JZLmR6FLjw69HVDQB_fksPwbhdlUW4XCeMitkyexCtyui23h1fEs1FipyXNTnWXDnFPMX6CTR_1ob0GMpOyAFjRMXyxQYBIaJ8Z4WD9qjOa6P4ruaMl0ObeA6djaOa4', 'Android', '2018-12-06 17:01:43', '2018-12-06 17:01:53'),
(438, 90, 'P0j8QPHAbsC5hqt5xXNw73jZxTMqY8DQ', '7B91BF3D-AEC1-421F-B2D8-267CD936EA21', '', 'iphone', '2018-12-13 11:22:19', '2018-12-13 11:22:19'),
(440, 125, '1AJv6fAdIsga37N0cIGV9X0GU31MeD1Q', 'admin@emotic.com', '', '', '2018-12-17 08:47:38', '2019-02-25 12:22:50'),
(441, 125, 'jNb6sL48qgjxBxWQMH3LlvIGZXcMPQv9', 'admin@emotic.com', '', '', '2018-12-17 08:53:37', '2019-02-25 12:22:50'),
(442, 125, '59ADLztwQXcyo5jVpzdj0mqJUSzBc1D7', 'admin@emotic.com', '', '', '2018-12-17 08:56:06', '2019-02-25 12:22:50'),
(444, 125, 'QfvvQ8gGDlrTUOHcpnLKaen1mm4h1Sfw', '7eGS8kpNnkvLNtF', 'c2TjLKcya34:APA91bEqoR3UvMpjwfjgUpyKTsaBrd1NjCX51gWftNc_J_dq5iou8tMI_PynfSDVRv4oKI4Bf4d0CrWL4oyCXPK2b667QlqB1Upl8AHqLW--6RoGrWoNHHe964bKLCZOLOGa3XD25-h2', 'Android', '2018-12-17 10:47:31', '2019-02-25 12:22:50'),
(445, 104, 'imTBIwx4fff1pRhB7i5IkjtkopnAa1Zo', '743B9B46-7E98-4CA1-A923-67A2060BF6A2', '', 'iphone', '2018-12-18 04:34:26', '2018-12-18 04:34:26'),
(446, 3, 'EsU0731QN19FhGbmKPiJcqFRbdBdQhRl', 'DfLalBxMj6x1xZX', 'fzYtxtpZ_TM:APA91bF8NUybZyTqZYn82ZOZFMZ6Y-hxkgH8BI552T_rQttSSdLVQNyzistwDJOd4_t0owl_B6A9CcZ2ZgcI_xPT7z8pgKJM6QJNB7m9gfCRUL_gsQQwoF-xI9UgYaxoNgZItMp57zc9', 'Android', '2018-12-18 10:40:17', '2018-12-18 10:40:17'),
(447, 105, '9yn6ZU5T9SATPzTbRJXM0EOPleuCJviQ', '7CCF4F64-7486-4658-97A9-8B3606C87821', '', 'iphone', '2018-12-18 11:17:27', '2018-12-18 11:17:34'),
(448, 3, 'fV6O2lokb0XKEGYqA31YF2JHdFMP9bCF', '28EC5AB5-B6DC-460B-9ED5-836EA0F37C65', '', 'iphone', '2018-12-18 11:52:33', '2018-12-18 11:52:33'),
(451, 107, 'xSXwTaJk0fCZUUzS0oYwA3rZJ2MyGUrv', '144DA34D-A387-49B2-A8E3-868C32CC4CDF', '', 'iphone', '2018-12-18 13:57:24', '2018-12-18 13:57:24'),
(452, 90, '2tc5ljlzS8T5Z0mpmW0muEj0bJ3wpCfb', '9F0A2ADB-26F9-478F-B164-6EE5070EFC9E', '', 'iphone', '2018-12-18 13:58:50', '2018-12-18 13:58:50'),
(453, 108, 'uGbvaXFnXghfCxnG4dpsZnbisL8Jn6dR', 'm82djVdFErJbv2f', 'cOY62b3cmjk:APA91bGAgW50anCo9PO0gsj7vk4vrNFuAs_4zj-gb2DtLS3uy6342CnHvU0DhDcjS1Zvj1xsAyHbQri2r3HLfiqcbYitUEpXLuGWPHauTDftAIZiI61mCtKYtx5XNowsyWGxue3Skx4l', 'Android', '2018-12-19 08:05:47', '2018-12-19 08:05:56'),
(454, 65, 'u019WZPs4c8qieHcKAnZBIKcFK1zIc5S', 'KR6uq84V8MbJsmG', 'e6e-scWb9K4:APA91bGYTXj9othdTquG6FH896Cv1kpnCJCr_giwsksvbxt1y4JFALvLb5GGfe1TapgDO3WB91pqjsAD0jX1LJYJEvfHLTWaxP3vUuDlHJz260WOM2gfH_RCLg_QSpbdGiTP6CjDgcme', 'Android', '2018-12-19 10:11:31', '2018-12-19 10:11:31'),
(455, 109, 'OE8aWMcIlVXIABriFPLoM7TJLka3w1FJ', 'ZjVCfyuIVgo93JD', 'e6e-scWb9K4:APA91bGYTXj9othdTquG6FH896Cv1kpnCJCr_giwsksvbxt1y4JFALvLb5GGfe1TapgDO3WB91pqjsAD0jX1LJYJEvfHLTWaxP3vUuDlHJz260WOM2gfH_RCLg_QSpbdGiTP6CjDgcme', 'Android', '2018-12-19 10:12:27', '2018-12-19 10:12:27'),
(456, 110, 'W4SDk3vMLskwNef11ViKWOSZNaQAXiLp', '6NOMwgpJrSmedxm', 'eO1OMV7uWUY:APA91bHXN-YdAWKB7DgFa27ts4bbFN0stdyWny1U3_352-NEgH_fEoGhglty8Dj0L4ftyht8J776g97ZUHJ4yBVgfjEIS9mR6oIYjHCxvLcs0UyCoMmH9A0d0LmEiTYNLtYoaT-q0Rj8', 'Android', '2018-12-19 10:55:01', '2018-12-19 10:55:01'),
(457, 87, '5xl1bF54Aepw7O1ZVt2CqrCaMaYMkCwI', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', '', 'iphone', '2018-12-19 12:35:39', '2018-12-19 12:35:39'),
(458, 119, 'AhIHqxwewMvJmZ0o2nOPBnLaQUgEcsGp', 'zSKHD9pQqjyg0jO', 'cVWmmzNc-SI:APA91bGINBE0T0OXw7MDi6Wx5BOOAhtNbzEoLsgZi9XaAJmnR24UaKAhdarEwJb_ZXM9OvGQnXKVDFuu8Qaoi4bVei1V0MOmaeh8YxR0RA_VZx4D5ojfcb39jq0-jm4kNJ2NVEutvRSX', 'Android', '2018-12-20 04:48:51', '2019-02-09 15:26:52'),
(459, 119, 'iiy0XmFNx61heZUVfa6GyJWKxtgkFFfD', '4EgU5lqyJI2iVro', 'cVWmmzNc-SI:APA91bGINBE0T0OXw7MDi6Wx5BOOAhtNbzEoLsgZi9XaAJmnR24UaKAhdarEwJb_ZXM9OvGQnXKVDFuu8Qaoi4bVei1V0MOmaeh8YxR0RA_VZx4D5ojfcb39jq0-jm4kNJ2NVEutvRSX', 'Android', '2018-12-20 04:49:28', '2019-02-09 15:26:52'),
(460, 3, 'wAML1jWjVGSLgJs013dDRkcugiiTablM', 'EFEBB57B-8A3D-46E8-AAB7-610E51982C18', '', 'iphone', '2018-12-26 18:25:05', '2018-12-26 18:25:05'),
(463, 125, 'FCvrGN2gvAtB24v3pEghS3BzeLmudcQL', 'MhYTpz0QRdKK6UD', 'cvbPPaQIaME:APA91bH2ceDJtVEjF_TDCK_WwDU0VZ8_Q9X5lYhRK3uXndDKhZnnYS2x4It6d932Y0A2z1PpNzJdZEJSGWas4TC8umC0R-k5y9U4Y-8XnK6Ms030hiElbQCq4U9wlLedpM12v7CTpJQM', 'Android', '2018-12-26 18:56:04', '2019-02-25 12:22:50'),
(464, 3, 'YVrHRVnoJxKvvIlKYkEHY1wNlbTaGHIi', '54AAC2EB-AAAD-4468-9A29-5E07366702F9', '', 'iphone', '2018-12-26 19:26:59', '2018-12-26 19:26:59'),
(465, 3, 'ZeEGUvQgYNGAVXJmwER7oZbTh1H9T270', 'admin@emotic.com', '', '', '2018-12-27 04:25:37', '2018-12-27 04:25:37'),
(466, 3, 'uG14AQy01mya5fHZCPNsJ5d3o82LPRax', 'admin@emotic.com', '', '', '2018-12-27 04:55:10', '2018-12-27 04:55:10'),
(467, 111, '33885ISNk6RqZyOdyk6O2lFyb352vZC4', '', '', '', '2018-12-27 04:56:42', '2018-12-27 04:56:42'),
(468, 3, 'hB3oQso1MKCwx3pPkIYXAIDTR292MhMD', 'admin@emotic.com', '', '', '2018-12-27 05:47:08', '2018-12-27 05:47:08'),
(469, 3, '7DJpi7yCFwYqCu4bGHgD3E5SZLJ8Ustb', 'admin@emotic.com', '', '', '2018-12-27 10:13:13', '2018-12-27 10:13:13'),
(470, 3, 'LspkCDkfoi2J4xGGr2rNm7IPGZJUSaZl', 'admin@emotic.com', '', '', '2018-12-27 10:19:13', '2018-12-27 10:19:13'),
(471, 3, '3v304KcKAqfIy8e3hPm8Ec8ypSJIoBS3', '', '', '', '2018-12-27 10:26:02', '2018-12-27 10:26:02'),
(472, 112, 'dwZtMbNshpRk7FJYxDXV1Blc84BlGaUD', 'xwAf1aBrvboEKmJ', 'c4HDPiATrgI:APA91bHQV_cuPo2MZq0MtSAkgQ1v09SEDBF4vXO926NS8mgT0wcuM6O6NAc-S8bSdA6MPAvXcBYU9j9nuxAtMdkl44MZi3DmueJlsO41AEmMjOjFI4sRQ3iccipT0YQfH4JCTKstr7nB', 'Android', '2018-12-27 10:29:11', '2018-12-27 10:29:16'),
(473, 3, 'oefKdEdaG6YUfm61AxyexblTWVN5A8Dw', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', '', 'iphone', '2018-12-28 07:54:00', '2018-12-28 07:54:00'),
(474, 3, 'sVg0wpw7htFfUFMyqTSpcCy7b9Dk2O9K', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', '', 'iphone', '2018-12-28 07:54:39', '2018-12-28 07:54:39'),
(475, 113, '0ujqqUwsH6PFHbdZCQVj5wc538DKiKAS', 'F3135EED-9899-43FA-A260-714333434589', '', 'iphone', '2018-12-28 08:20:07', '2018-12-28 08:20:15'),
(476, 3, 'RBVwwzrGRiYV2uxMwqy8cD1N8FXm6jkg', '54AAC2EB-AAAD-4468-9A29-5E07366702F9', '', 'iphone', '2018-12-30 19:48:49', '2018-12-30 19:48:49'),
(477, 3, 'PWfCDXuICxYe0k5mbCUopjNESGeaRekn', 'admin@emotic.com', '', '', '2019-01-24 04:42:26', '2019-01-24 04:42:26'),
(479, 114, 'GjNiyT1PADnyPqV8YpmpsJ0mlRW5XGxn', '8D8otL3ZRAfWPMW', 'dWBtnxQ4E50:APA91bHcHA5j-0UWjtQMV0Zf92J_mN97W8jD33ilkDhFS2UmldXvOTUIEwGHFpbkiZzSgWqJgWHKGp46LX4nxVYDSGf3dOFakUy0gslkswc57pmzNNZjKs01kwVAOJmkiaWWI0T3tVPe', 'Android', '2019-01-25 10:18:39', '2019-01-25 10:19:55'),
(481, 114, 'GTI3eFl9IXB0wyVTej0aKEo1Cwmloi4y', 'r8IBdEtzD2sQsOk', 'dWBtnxQ4E50:APA91bHcHA5j-0UWjtQMV0Zf92J_mN97W8jD33ilkDhFS2UmldXvOTUIEwGHFpbkiZzSgWqJgWHKGp46LX4nxVYDSGf3dOFakUy0gslkswc57pmzNNZjKs01kwVAOJmkiaWWI0T3tVPe', 'Android', '2019-01-25 10:19:03', '2019-01-25 10:19:55'),
(482, 3, '41mpkWIsAHXB8odhFOO9sM9Ktk4saooO', 'F70C7E58-5AC5-49AD-A121-98EE6EA2FA13', '', 'iphone', '2019-01-26 17:55:25', '2019-01-26 17:55:25'),
(483, 128, 'vtdVO15L9h47bV1gVt3Ng4uM0BXUHo9G', 'F70C7E58-5AC5-49AD-A121-98EE6EA2FA13', '', 'iphone', '2019-01-26 18:37:06', '2019-02-28 11:52:53'),
(484, 3, 'Yy7eXrMIHk2vMcHZikkcSQeFITLQE1bs', 'admin@emotic.com', '', '', '2019-01-29 11:00:05', '2019-01-29 11:00:05'),
(485, 115, 'GaIzgt4BFNnMGoPMvAc9bRgCuvqhAIdi', '', '', '', '2019-01-29 11:13:41', '2019-01-29 11:13:41'),
(486, 3, 'X5Sq8G50tIkdXNhMuVYq1wDUi0vCffXk', 'admin@emotic.com', '', '', '2019-01-29 12:59:58', '2019-01-29 12:59:58'),
(487, 3, 'GIwcEpFD5hOCyLYd9PllqxbREm1IoDno', 'admin@emotic.com', '', '', '2019-01-30 15:45:26', '2019-01-30 15:45:26'),
(488, 3, 'rXwTRzJ9mw2th54R111hxJvtxdEndu9L', 'admin@emotic.com', '', '', '2019-01-31 11:00:11', '2019-01-31 11:00:11'),
(490, 115, '5TKXvm5PFLbUqKMSecMLYZJFnE6PT6Tl', 'Rtup3TSsy6mIFAQ', 'efh5GpH8B64:APA91bHKStSb3UQlDeV7NFReqDKbNLMzoNTtCTbvoGHgM95HkD59D96z8SibejHTpe-1vadnqxlQP7ak-ME6_SSUarYLkMvPWdp-xK7R3XBAi_uQf8y_g4FlZFt8ZuuF3SVKHpmzqrmv', 'Android', '2019-01-31 13:36:46', '2019-01-31 13:36:46'),
(491, 115, 'UuiC4DSXuybG5A80vfqniSeAW3roxAHR', '9TSW2StvRqIy74h', 'cqkMBuiNTFc:APA91bGsCj0DlSs5fBBdYOoQB6AbmazhiQOuN9iXWvBA6jXGt3ZGfjuF2i_StfYN6Fy3wXOdhXxcRz8N4Hto6gc5MhMeWmpP2JdAz46lTWz39p9t_auXZdYeSQRCSe9SHGSXfRW9qBG-', 'Android', '2019-01-31 14:05:08', '2019-01-31 14:05:08'),
(492, 3, 'vVfe8p1jreEsNavvrgt3JVjnqspYwa4f', 'admin@emotic.com', '', '', '2019-01-31 14:48:59', '2019-01-31 14:48:59'),
(493, 125, 'FRqvISAEe60sqvge6UXMPCwNGx3UYFvu', '', '', 'android', '2019-01-31 14:54:28', '2019-02-25 12:22:50'),
(494, 116, 'ZEjdyYLUsUVfyzBCnWKU6EQMZDjqm2Jf', 'HFL5iXdEk8FPCEW', 'eg9waRUhVZQ:APA91bGA7IrWRIhuvV9VAJKcwPzzyS5GbrWRmPWGuS008S26w1TO9e71LEux7FbYtwhEfxdQ4OMbN3ppR5VPAIDE_Aw6w1GzmMv19zxRvOTqnBY5nCnLGtMaj9EFoyyg9C1JQK-h1kBY', 'Android', '2019-02-01 06:10:24', '2019-02-01 06:10:31'),
(497, 3, '61RiW0OhOlAGXstAI2IoQiIWvanWxTlm', 'admin@emotic.com', '', '', '2019-02-06 07:18:16', '2019-02-06 07:18:16'),
(498, 3, 'wI7GNsUbTvDnKG8ngCVW4kvxjqYTIQRy', 'admin@emotic.com', '', '', '2019-02-06 09:29:49', '2019-02-06 09:29:49'),
(499, 3, 'jWoxR43n8b1tyubcuW3b4GqQqC7Wpx87', 'admin@emotic.com', '', '', '2019-02-06 09:30:03', '2019-02-06 09:30:03'),
(500, 125, 'H7lFEK2Gh6hwrBHKfix2tSlR9MWRX9X0', 'admin@emotic.com', '', '', '2019-02-06 10:08:26', '2019-02-25 12:22:50'),
(501, 119, 's2yNtz594vz7U7HmgXsLC15b4Hb3KGe7', 'lHypRRh3LukLn7b', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 09:51:42', '2019-02-09 15:26:52'),
(502, 117, 'h4zf3YUpmgxhazfeadvByvUhoGOL6lSx', 'm8lPwv82uhUCblS', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-09 11:33:17', '2019-02-09 11:37:40'),
(503, 117, 'ODNee12PIwHTSNWaCC82loPuZiTPAFxG', 'APaDa0TK8CB8ySL', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-09 11:34:31', '2019-02-09 11:37:40'),
(504, 117, 'uVCJlZRbCiwtVgXxlnbb5tlBfDMlPumw', 'wwcF5eMlYe7tJhB', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-09 11:34:56', '2019-02-09 11:37:40'),
(505, 117, 'P4MWVnf2r8tTKssHm9xJgBzDmmVRGNoA', 'Rm7h6QlF2mICfON', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-09 11:35:34', '2019-02-09 11:37:40'),
(506, 117, 'HxMLz7FoQhwtBgSrW9CLxu9FPY9zxLul', 'VX3PtKH6xJ5Y2AW', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-09 11:37:03', '2019-02-09 11:37:40'),
(509, 119, '0MrOrTejHYpfKepohIRxaS0Q3pc6Q1LL', 'Jc2QS1aDXCjTyNh', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 12:36:35', '2019-02-09 15:26:52'),
(510, 119, 'ViIhqsIdguu4U5Q32GJyNt3ZmXYkZEPZ', 'TFXKK9nJqGAkKwt', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 12:37:28', '2019-02-09 15:26:52'),
(511, 119, 'MokefbRbpzwvWWDFtUwrc0MvdP8zL2oN', 'AwHqRb3bhQDDxPF', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 12:40:00', '2019-02-09 15:26:52'),
(512, 119, 'z0uwIZE0qTrwIbVxsyasJtL04bzRuURK', 'FPW7e0nDY4kktYI', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 12:43:01', '2019-02-09 15:26:52'),
(513, 119, 'i0o5oRnwUAUm7zW1lweyPW2XCnppOBGz', 'EfCgDg0Bit7z4df', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 12:46:53', '2019-02-09 15:26:52'),
(514, 119, 'DWV9jSxvUqy1825EMTzpXN02vg36nqIl', 'UYFsJwAnlTZ529K', 'fmElitwAd6Q:APA91bG9xTeKPaANjTEXEAdOAjjodAVPsZjnGkjc76gRPWzcHBkPphdieuBWCG-nzOkJPWJxmqXxYR3CxSf34pQSaaRgqnhdLmq9Nr1YWhOMEzuqud08EJGr6SjbTSxpc4h6ucMbYreJ', 'Android', '2019-02-09 15:26:44', '2019-02-09 15:26:52'),
(515, 117, 'kL0tv1CZedSlLpSqUrZ1YUufg7QbliFh', 'NHErLVSAKcQdcIe', 'cEfZDzxJu-4:APA91bFWT0k6blyMV-w6BbjKXcNwbZiJinBXZx-FTTOX4Grr2OVhGKSmeYGP9yi-D3v0tupewotN_J5IK2EWtaQPSpl4yVNq7t4xaDbDX9LmxJOml6inNUYsskFnAytmAsNaEXsFITmg', 'Android', '2019-02-10 18:48:14', '2019-02-10 18:48:14'),
(516, 67, 'jJXwmzcsT6bHg3agkMukLItIQ7ho2CcO', '0460B464-A9E4-47F3-BBED-75FC3F4F41E4', '', 'iphone', '2019-02-13 10:22:41', '2019-02-13 10:22:41'),
(517, 73, 'KJ1ExZViLqnRFDu1EgGObTLDHtWJsncv', '0460B464-A9E4-47F3-BBED-75FC3F4F41E4', '', 'iphone', '2019-02-13 10:24:01', '2019-02-13 10:24:01'),
(518, 120, 'IZESWyif4SsL0h3jBYAMUgx5RWFJcaSl', '0460B464-A9E4-47F3-BBED-75FC3F4F41E4', '', 'iphone', '2019-02-13 10:25:51', '2019-02-13 10:26:01'),
(519, 120, 'X3q41IThPp1AHvG4JkOACn9ottptCRSj', '0460B464-A9E4-47F3-BBED-75FC3F4F41E4', '', 'iphone', '2019-02-13 11:40:00', '2019-02-13 11:40:00'),
(520, 3, 'PfckiWnkMw4I2MEyJDNwWGiAZkOXcdsp', 'admin@emotic.com', '', '', '2019-02-18 10:44:53', '2019-02-18 10:44:53'),
(521, 128, '2dWsbLLXVlM9b5SB1TuAbOpKd6Vgrnhg', 'F70C7E58-5AC5-49AD-A121-98EE6EA2FA13', '', 'iphone', '2019-02-18 10:54:26', '2019-02-28 11:52:53'),
(522, 128, 'CANXtKt8MwWKpXu8w4joTv5JpaD6cGmT', 'admin@emotic.com', '', '', '2019-02-18 10:55:47', '2019-02-28 11:52:53'),
(523, 121, 'ndi1fsrFZN9FFXm6ZJ12Z1wT1mbOZ20a', 'F70C7E58-5AC5-49AD-A121-98EE6EA2FA13', '', 'iphone', '2019-02-18 11:11:45', '2019-02-18 11:11:53'),
(524, 128, 'iSXBYDnRfD9YppXZsxq5KPIteilgbSrq', 'F70C7E58-5AC5-49AD-A121-98EE6EA2FA13', '', 'iphone', '2019-02-18 11:12:34', '2019-02-28 11:52:53'),
(525, 3, 'CRWU0BN8wkcPkL3WJtKPuj8EusrNRM7Y', '', '', '', '2019-02-21 11:10:08', '2019-02-21 11:10:08'),
(526, 3, 'ydFaPHd8WPDztSFrYIhvSidQvLfeCex8', '', '', '', '2019-02-21 11:38:55', '2019-02-21 11:38:55'),
(527, 87, 'xjroxPybyQuXL8U0ZkAkor1mqhbUo2pr', '21D7478D-D045-4182-ACC9-D2D4F1FA4BE5', '', 'iphone', '2019-02-25 10:20:28', '2019-02-25 10:20:28'),
(536, 3, 'Fk0AyB33IGCio4HZvLC42cbFAd2hK4d4', '', '', '', '2019-02-25 10:51:04', '2019-02-25 10:51:04'),
(537, 124, 'YKd2CGRUs2rggBD4soQsQbEzomTuNyzJ', '', '', '', '2019-02-25 11:26:15', '2019-02-25 11:26:30'),
(538, 3, 'lnp5Iph5NS9Yvn2QfXDBliYk2MZKz1jK', '', '', '', '2019-02-25 11:26:52', '2019-02-25 11:26:52'),
(539, 3, '26MahOKKP6gc3fdsR0LGn6cVnRBdgi6q', '', '', '', '2019-02-25 11:27:32', '2019-02-25 11:27:32'),
(540, 125, 'zN4w7ePMZ01n2PTyIXBv6mt9GKZugnPQ', '', '', '', '2019-02-25 12:20:58', '2019-02-25 12:22:50'),
(541, 125, '2dXAMty8e3K38TAjZjZunHtUdI2NmJGQ', '', '', '', '2019-02-25 12:21:15', '2019-02-25 12:22:50'),
(542, 128, 'pnZguutNaVNkkPqja074n4JPpeWa9w8N', 'CFE2926E-5693-4B03-AFCB-020AC3FD27E8', NULL, 'iphone', '2019-02-26 09:45:36', '2019-02-28 11:52:53'),
(543, 76, 'nsJzx0F6Z1Gb2NrtQiS8g3wzQklzLCcn', 'CFE2926E-5693-4B03-AFCB-020AC3FD27E8', NULL, 'iphone', '2019-02-26 10:20:07', '2019-02-26 10:20:07'),
(544, 128, 'CSlGYB8J3kcPuFIGARC9jgKZlr4VY2dA', 'DC6345B7-BF4E-42B4-96C1-9B388B567CAA', NULL, 'iphone', '2019-02-26 10:30:03', '2019-02-28 11:52:53'),
(545, 76, 'IiHVeLsMLbtR0dudden9bZE7OLzdSgqE', 'CFE2926E-5693-4B03-AFCB-020AC3FD27E8', NULL, 'iphone', '2019-02-26 10:30:31', '2019-02-26 10:30:31'),
(546, 128, 'u17GWaJsYFardkpghjP1SFtVke4odCH2', '1BF982D4-1184-4591-A91E-AA8C0D3B814C', 'cfda_jgRK0c:APA91bFdhScAbLGXvzVkm6PGUd4Vnpv0Jbt1MJAisoIa_vfWY8LrRbcV07M8SxVn8hz0_cUseIKA7hIOV7016AdR8ZRXzhGe-jSxMsKh8IhjQI5TOeH0_Yj26El2Mv-MuU9gumLcN4N-', 'iphone', '2019-02-26 10:42:52', '2019-02-28 11:52:53'),
(547, 3, 'b9pEwwOQGCImvaDiPrRhhIGgSs5W2wNz', '', '', '', '2019-02-26 12:58:20', '2019-02-26 12:58:20'),
(548, 125, 'z3UhsNrwgahe0qLVdLUxWQAYkqbDRpNE', '', '', '', '2019-02-26 13:00:45', '2019-02-26 13:00:45'),
(551, 127, 'nd9P5oqpq6UrbJ3JtEla2AfRL82h9KDb', 'e7yPwh37x71aoRA', 'c8wfr43yEWc:APA91bH1vgXn0FP4fvUTYpx_ckTFgF6jl4K4YDHvi0wCbnAnycBmFsyikvgVLUSD8SPQj4PzWyWQYbuZStiEbzvQSV9CHJQyKSSo4Xhdr3FU3hDUkoPzsLbiA28F5i2tRRI3y8S_fk0P', 'Android', '2019-02-27 12:50:40', '2019-02-27 12:50:45'),
(552, 126, 'sIGnETaPirGLAZsmntzc5h0glxWR0ggS', 'r2B4IikzePdccsk', 'fdMeTC2RMag:APA91bEJedyIREsvw-nMSmcgSphABDTERSdVEJTMJ_Zh9T_CqZnYtArtUEpnI24_zSmXofnu0HnEvdRXcLkoFMZhNDuRkjyN9AVdy1_HeKL-UVVzrQrE6iJcbPtbF8vOvIBinF4mISF_', 'Android', '2019-02-28 06:43:22', '2019-02-28 06:43:22'),
(553, 3, 'CpoOy7vaJx9jNevxfCfiuW9ieQdMyU5w', '', '', '', '2019-02-28 10:11:17', '2019-02-28 10:11:17'),
(554, 128, 'n358I0QOclEstREP2rmp2t3qeK1lbo8e', 'CFE2926E-5693-4B03-AFCB-020AC3FD27E8', 'fNOcpQ3Hy7E:APA91bHE4IZr9wm-uljDZ0pZcgC37ctP_YJXzorg61al5l0ydGJcO5fvs2F7QnKaix7D65EE9yp4LFGksZICSbwHRk2gGfpwJW05IKH3Reyp6ttFUuFcjACLTbzGQXX0Yy_c-5GpcXwT', 'iphone', '2019-02-28 10:43:01', '2019-02-28 11:52:53'),
(555, 3, 'jduTfZDkaydQRPXFZjGgI2UWaxJQ23BP', '', '', '', '2019-02-28 10:59:16', '2019-02-28 10:59:16'),
(556, 128, '6AThNzJkTFzTzhD9rJUxq6KA9DrbNpNg', '8IqwYEfNnsftCLD', 'crB54maJe_0:APA91bEoBzAOtUyr2bnWNkdSn7JSsOs36T-z9FR24VpWYMgI-78nGyWToEg77oh_8qOVJPs3Ji9RzrJcjj-6iJtIeRnzWuJELI12WEMa8KAFU1V4Dm_YJh4R1oqDs2KvEozOur1B9WF1', 'Android', '2019-02-28 11:52:48', '2019-02-28 11:52:53'),
(557, 79, '4bWPrLa22yTdYfHtG8euKSP1HRB8jK8f', '87A75501-1713-4701-944C-5987D787CC96', 'dUi6YgkAjD4:APA91bF8kgtL-5hqMZG-B3iZ2uDQ3_-otEciOuS225A5VuBFySISRRfXUcVlK_WK1ujbpYG0065P_1InWyfBpy0YuJ5nQMvlhrg-phHhs2SwcOLc66silE8H3wmDAekahhetmHHOSqa0', 'iphone', '2019-02-28 12:18:41', '2019-02-28 12:18:41'),
(558, 76, 'oHhf6SIfwg01wDH6LmOU3gjvLPiuGDAn', '87A75501-1713-4701-944C-5987D787CC96', 'dUi6YgkAjD4:APA91bF8kgtL-5hqMZG-B3iZ2uDQ3_-otEciOuS225A5VuBFySISRRfXUcVlK_WK1ujbpYG0065P_1InWyfBpy0YuJ5nQMvlhrg-phHhs2SwcOLc66silE8H3wmDAekahhetmHHOSqa0', 'iphone', '2019-02-28 12:32:00', '2019-02-28 12:32:00'),
(559, 79, 'Aj8xNe1so48ODmZbuHxKuMLIj6CV2Gr2', '1BF982D4-1184-4591-A91E-AA8C0D3B814C', 'cfda_jgRK0c:APA91bFdhScAbLGXvzVkm6PGUd4Vnpv0Jbt1MJAisoIa_vfWY8LrRbcV07M8SxVn8hz0_cUseIKA7hIOV7016AdR8ZRXzhGe-jSxMsKh8IhjQI5TOeH0_Yj26El2Mv-MuU9gumLcN4N-', 'iphone', '2019-02-28 12:33:27', '2019-02-28 12:33:27'),
(560, 3, 'cfQ4QiPSotnM80k32EB7wODonukm2Mc1', '', '', '', '2019-02-28 12:40:33', '2019-02-28 12:40:33'),
(561, 125, '158OFrUDqQfDjtEQkAbfEFZBCh1qgINc', '6mfIAcg5eNUTG1E', 'c0wD95rLHZk:APA91bEuVj-JFsiD8E7BzhZ3BqJxSB5nPwKpwL6SxBSm3yJHV3_DOgi6FOaDcvburRANLRr_P59KMj5ITNSFVRSYNzdNF40xTGpmwM00x9pwpp0KtYDIMimVtq7VvxC1TjDsF_It2Rly', 'Android', '2019-02-28 12:58:48', '2019-02-28 12:58:48'),
(562, 3, 'sU8GmUGNpQpEHeMQrJA8tZ11cloQhWqV', '', '', '', '2019-03-04 06:48:31', '2019-03-04 06:48:31'),
(563, 3, 'EcRpVjj7RcTLsewotmJAZoqCMdH5X8UK', '', '', '', '2019-03-04 07:03:01', '2019-03-04 07:03:01'),
(564, 3, 'KHy8r7fLhvEk3kNzqLgApHfiwntuXzVe', '', '', '', '2019-03-04 08:41:13', '2019-03-04 08:41:13'),
(565, 3, 'DtL2g3pQLm9jjwrrG9XlQutvhnMF1GDx', 'Gu52aLWYYQg5Erp', 'dEDi8yKOCv4:APA91bFJCz1siFPXOsyZmIBo75vxt_lCQbigB5_yz7tFRGAdRyccd6XwBKwuWCfW4Sihm_NQUoMOiR2RvxT6FOv1T9GUxnJ5xoWmOM7CsjtsBzrKNdX3KxP5hkahOhoz0Cy3xlujxMJ0', 'Android', '2019-03-05 15:24:53', '2019-03-05 15:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `moods`
--

CREATE TABLE `moods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `emoji` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moods`
--

INSERT INTO `moods` (`id`, `name`, `emoji`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Happy', 'ic_happy.png', '#3942FF', '2018-10-15 12:34:58', NULL),
(2, 'Funny', 'ic_funny.png', '#F77C2E', '2018-10-24 11:18:09', NULL),
(3, 'Romantic', 'ic_romentic.png', '#FF2323', '2018-10-24 11:18:09', NULL),
(4, 'Calm', 'ic_calm.png', '#74C8F6', '2018-10-24 11:18:09', '2018-12-04 10:43:23'),
(5, 'Neutral', 'ic_neutral.png', '#6BCC84', '2018-10-24 11:18:09', NULL),
(6, 'Motivational', 'ic_sad.png', '#3F2961', '2018-10-24 11:18:09', '2018-12-04 05:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `user_id`, `comment`, `timezone`, `created_at`, `updated_at`) VALUES
(65, 38, 77, 'test comment', '', '2018-12-05 13:24:47', '2018-12-05 13:24:47'),
(66, 190, 77, '😁😁😁', 'Asia/Kolkata', '2018-12-06 04:58:38', '2018-12-06 04:58:39'),
(67, 120, 97, 'h', 'Asia/Dubai', '2018-12-06 17:10:17', '2018-12-06 17:10:17'),
(68, 188, 103, 'test', 'Asia/Dubai', '2018-12-08 17:36:14', '2018-12-08 17:36:14'),
(69, 188, 3, 'The first thing in our class ', 'Asia/Kolkata', '2018-12-08 19:56:14', '2018-12-08 19:56:14'),
(70, 183, 3, 'sdada', 'Asia/Kolkata', '2018-12-08 20:29:57', '2018-12-08 20:29:58'),
(71, 183, 97, 'jwhah', 'Asia/Dubai', '2018-12-12 15:50:15', '2018-12-12 15:50:16'),
(72, 198, 3, 'Hi', 'Asia/Kolkata', '2018-12-15 18:16:12', '2018-12-15 18:16:12'),
(73, 73, 107, 'Non', 'Asia/Dubai', '2018-12-18 14:04:13', '2018-12-18 14:04:13'),
(74, 73, 107, 'Hip', 'Asia/Dubai', '2018-12-18 14:04:17', '2018-12-18 14:04:18'),
(75, 183, 107, 'Testing ', 'Asia/Dubai', '2018-12-18 14:09:32', '2018-12-18 14:09:33'),
(76, 191, 107, 'G', 'Asia/Dubai', '2018-12-18 14:13:46', '2018-12-18 14:13:46'),
(77, 113, 90, 'Hhh', 'Asia/Kolkata', '2018-12-19 12:33:11', '2018-12-19 12:33:12'),
(78, 201, 107, 'How is it ', 'Asia/Dubai', '2018-12-19 18:34:25', '2018-12-19 18:34:26'),
(79, 201, 109, 'nice. congrats to ur team', 'Asia/Kolkata', '2018-12-20 03:51:20', '2018-12-20 03:51:21'),
(80, 167, 107, 'Hdhgsat', 'Asia/Dubai', '2018-12-24 12:15:36', '2018-12-24 12:15:36'),
(81, 231, 116, 'Test comment', 'Asia/Kolkata', '2019-02-01 09:38:06', '2019-02-01 09:38:07'),
(82, 232, 116, 'Test comment.', 'Asia/Kolkata', '2019-02-01 09:38:57', '2019-02-01 09:38:57'),
(83, 234, 106, 'test', 'Asia/Kolkata', '2019-02-02 06:32:59', '2019-02-02 06:32:59'),
(84, 241, 113, 'Yuh', 'Asia/Dubai', '2019-02-08 11:40:10', '2019-02-08 11:40:10'),
(85, 239, 117, 'hi', 'Asia/Kolkata', '2019-02-09 11:39:00', '2019-02-09 11:39:01'),
(86, 165, 79, 'Testing', 'Asia/Kolkata', '2019-02-09 12:36:22', '2019-02-09 12:36:23'),
(87, 165, 79, 'Dads a', 'Asia/Kolkata', '2019-02-09 12:44:14', '2019-02-09 12:44:15'),
(88, 249, 97, 'ggft', 'Asia/Dubai', '2019-02-09 13:58:13', '2019-02-09 13:58:14'),
(89, 249, 119, '🤗', 'Asia/Kolkata', '2019-02-09 15:37:56', '2019-02-09 15:37:57'),
(90, 252, 108, 'nice!', 'Asia/Dubai', '2019-02-18 05:51:12', '2019-02-18 05:51:12'),
(91, 249, 79, 'Adadaw', 'Asia/Kolkata', '2019-02-18 08:37:37', '2019-02-18 08:37:37'),
(92, 254, 79, 'Hi', 'Asia/Kolkata', '2019-02-18 11:14:27', '2019-02-18 11:14:27'),
(93, 254, 79, 'Defend', 'Asia/Kolkata', '2019-02-18 11:27:25', '2019-02-18 11:27:26'),
(94, 255, 3, 'test', 'Asia/Kolkata', '2019-02-21 11:07:00', '2019-02-21 11:07:01'),
(95, 254, 117, '👌👌👌', 'Asia/Kolkata', '2019-02-21 16:57:12', '2019-02-21 16:57:13'),
(96, 105, 87, 'Hi', 'Asia/Kolkata', '2019-02-25 10:22:55', '2019-02-25 10:22:56'),
(97, 256, 3, 'test', 'Asia/Kolkata', '2019-02-25 10:42:52', '2019-02-25 10:42:52'),
(98, 295, 126, 'hey', 'Asia/Kolkata', '2019-02-28 13:28:27', '2019-02-28 13:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 180, 103, '2018-12-06 17:02:21', '2018-12-06 17:02:21'),
(3, 191, 103, '2018-12-06 17:11:05', '2018-12-06 17:11:05'),
(4, 190, 103, '2018-12-06 17:11:11', '2018-12-06 17:11:11'),
(8, 172, 3, '2018-12-08 20:22:07', '2018-12-08 20:22:07'),
(18, 190, 94, '2018-12-10 14:06:56', '2018-12-10 14:06:56'),
(19, 113, 97, '2018-12-12 15:50:34', '2018-12-12 15:50:34'),
(20, 198, 3, '2018-12-15 18:16:07', '2018-12-15 18:16:07'),
(22, 183, 3, '2018-12-15 18:16:36', '2018-12-15 18:16:36'),
(24, 136, 3, '2018-12-16 20:20:50', '2018-12-16 20:20:50'),
(25, 127, 3, '2018-12-17 19:02:39', '2018-12-17 19:02:39'),
(27, 108, 3, '2018-12-17 19:39:20', '2018-12-17 19:39:20'),
(60, 196, 3, '2018-12-18 12:58:06', '2018-12-18 12:58:06'),
(73, 180, 93, '2018-12-18 13:39:43', '2018-12-18 13:39:43'),
(76, 139, 90, '2018-12-18 13:59:09', '2018-12-18 13:59:09'),
(77, 73, 107, '2018-12-18 14:04:09', '2018-12-18 14:04:09'),
(82, 180, 3, '2018-12-18 14:22:21', '2018-12-18 14:22:21'),
(85, 179, 108, '2018-12-19 08:08:31', '2018-12-19 08:08:31'),
(86, 168, 108, '2018-12-19 08:08:35', '2018-12-19 08:08:35'),
(87, 158, 108, '2018-12-19 08:09:33', '2018-12-19 08:09:33'),
(88, 139, 109, '2018-12-19 10:21:44', '2018-12-19 10:21:44'),
(89, 129, 109, '2018-12-19 10:21:54', '2018-12-19 10:21:54'),
(90, 129, 110, '2018-12-19 10:55:48', '2018-12-19 10:55:48'),
(91, 124, 90, '2018-12-19 12:34:51', '2018-12-19 12:34:51'),
(94, 129, 107, '2018-12-19 18:40:22', '2018-12-19 18:40:22'),
(95, 179, 107, '2018-12-19 19:53:17', '2018-12-19 19:53:17'),
(98, 200, 108, '2018-12-20 05:15:41', '2018-12-20 05:15:41'),
(101, 138, 87, '2018-12-20 11:45:14', '2018-12-20 11:45:14'),
(104, 180, 108, '2018-12-21 11:08:06', '2018-12-21 11:08:06'),
(108, 207, 108, '2018-12-23 08:29:03', '2018-12-23 08:29:03'),
(112, 206, 108, '2018-12-23 17:31:31', '2018-12-23 17:31:31'),
(113, 205, 108, '2018-12-23 17:32:20', '2018-12-23 17:32:20'),
(119, 200, 107, '2018-12-24 14:19:21', '2018-12-24 14:19:21'),
(120, 190, 107, '2018-12-24 14:23:47', '2018-12-24 14:23:47'),
(121, 168, 107, '2018-12-24 14:24:35', '2018-12-24 14:24:35'),
(122, 209, 107, '2018-12-24 14:31:56', '2018-12-24 14:31:56'),
(123, 163, 107, '2018-12-24 19:09:52', '2018-12-24 19:09:52'),
(126, 208, 108, '2018-12-26 09:23:32', '2018-12-26 09:23:32'),
(127, 204, 3, '2018-12-26 19:27:30', '2018-12-26 19:27:30'),
(128, 194, 3, '2018-12-26 20:03:40', '2018-12-26 20:03:40'),
(129, 201, 97, '2018-12-27 11:02:27', '2018-12-27 11:02:27'),
(130, 211, 87, '2018-12-28 07:52:42', '2018-12-28 07:52:42'),
(131, 211, 113, '2018-12-28 08:31:41', '2018-12-28 08:31:41'),
(132, 219, 108, '2019-01-17 17:00:56', '2019-01-17 17:00:56'),
(133, 218, 108, '2019-01-17 17:02:51', '2019-01-17 17:02:51'),
(134, 217, 108, '2019-01-17 17:06:32', '2019-01-17 17:06:32'),
(135, 226, 108, '2019-01-25 07:04:54', '2019-01-25 07:04:54'),
(136, 225, 108, '2019-01-25 07:04:59', '2019-01-25 07:04:59'),
(137, 231, 116, '2019-02-01 09:37:25', '2019-02-01 09:37:25'),
(138, 228, 116, '2019-02-01 09:38:38', '2019-02-01 09:38:38'),
(142, 232, 116, '2019-02-01 09:44:53', '2019-02-01 09:44:53'),
(143, 236, 106, '2019-02-02 06:31:03', '2019-02-02 06:31:03'),
(145, 239, 97, '2019-02-05 07:25:44', '2019-02-05 07:25:44'),
(146, 201, 109, '2019-02-05 13:29:10', '2019-02-05 13:29:10'),
(148, 241, 117, '2019-02-09 11:50:49', '2019-02-09 11:50:49'),
(149, 240, 117, '2019-02-09 11:50:52', '2019-02-09 11:50:52'),
(150, 247, 79, '2019-02-09 12:06:28', '2019-02-09 12:06:28'),
(152, 165, 79, '2019-02-09 12:44:05', '2019-02-09 12:44:05'),
(153, 247, 119, '2019-02-09 15:34:18', '2019-02-09 15:34:18'),
(154, 240, 119, '2019-02-09 15:35:21', '2019-02-09 15:35:21'),
(155, 245, 97, '2019-02-11 05:16:50', '2019-02-11 05:16:50'),
(157, 252, 113, '2019-02-13 05:49:57', '2019-02-13 05:49:57'),
(158, 252, 108, '2019-02-13 05:50:02', '2019-02-13 05:50:02'),
(159, 247, 106, '2019-02-13 11:22:50', '2019-02-13 11:22:50'),
(161, 247, 120, '2019-02-13 11:24:09', '2019-02-13 11:24:09'),
(162, 238, 120, '2019-02-13 11:24:44', '2019-02-13 11:24:44'),
(166, 238, 106, '2019-02-13 11:29:32', '2019-02-13 11:29:32'),
(167, 203, 120, '2019-02-13 11:41:45', '2019-02-13 11:41:45'),
(168, 237, 77, '2019-02-21 07:50:38', '2019-02-21 07:50:38'),
(169, 234, 77, '2019-02-21 10:55:38', '2019-02-21 10:55:38'),
(171, 254, 3, '2019-02-21 10:55:58', '2019-02-21 10:55:58'),
(172, 230, 77, '2019-02-21 10:56:43', '2019-02-21 10:56:43'),
(174, 255, 3, '2019-02-21 11:19:59', '2019-02-21 11:19:59'),
(175, 232, 3, '2019-02-21 11:20:10', '2019-02-21 11:20:10'),
(176, 256, 3, '2019-02-25 10:42:43', '2019-02-25 10:42:43'),
(177, 278, 125, '2019-02-26 09:31:53', '2019-02-26 09:31:53'),
(178, 277, 125, '2019-02-26 12:03:16', '2019-02-26 12:03:16'),
(179, 144, 125, '2019-02-26 17:39:16', '2019-02-26 17:39:16'),
(180, 278, 128, '2019-02-28 11:52:57', '2019-02-28 11:52:57'),
(181, 276, 79, '2019-02-28 12:19:01', '2019-02-28 12:19:01'),
(182, 275, 76, '2019-02-28 12:51:52', '2019-02-28 12:51:52'),
(183, 254, 76, '2019-02-28 12:52:19', '2019-02-28 12:52:19'),
(185, 249, 76, '2019-02-28 13:00:52', '2019-02-28 13:00:52'),
(186, 295, 126, '2019-02-28 13:28:19', '2019-02-28 13:28:19'),
(187, 297, 108, '2019-03-02 17:31:07', '2019-03-02 17:31:07'),
(188, 300, 108, '2019-03-07 13:35:28', '2019-03-07 13:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_mood`
--

CREATE TABLE `post_mood` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `mood_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_mood`
--

INSERT INTO `post_mood` (`id`, `post_id`, `mood_id`, `created_at`, `updated_at`) VALUES
(1, 37, 1, '2018-11-04 11:11:25', '2018-11-04 11:11:25'),
(2, 37, 2, '2018-11-04 11:11:25', '2018-11-04 11:11:25'),
(3, 24, 1, '2018-11-04 11:22:45', NULL),
(4, 30, 1, '2018-11-04 11:22:45', NULL),
(5, 32, 1, '2018-11-04 11:22:45', NULL),
(6, 35, 1, '2018-11-04 11:22:45', NULL),
(7, 36, 1, '2018-11-04 11:22:45', NULL),
(8, 44, 1, '2018-11-08 22:09:08', '2018-11-08 22:09:08'),
(9, 44, 6, '2018-11-08 22:09:08', '2018-11-08 22:09:08'),
(10, 45, 6, '2018-11-08 22:13:45', '2018-11-08 22:13:45'),
(11, 45, 1, '2018-11-08 22:13:45', '2018-11-08 22:13:45'),
(12, 45, 3, '2018-11-08 22:13:45', '2018-11-08 22:13:45'),
(13, 46, 6, '2018-11-08 22:13:53', '2018-11-08 22:13:53'),
(14, 46, 1, '2018-11-08 22:13:53', '2018-11-08 22:13:53'),
(15, 46, 3, '2018-11-08 22:13:53', '2018-11-08 22:13:53'),
(16, 47, 1, '2018-11-08 22:14:43', '2018-11-08 22:14:43'),
(17, 48, 1, '2018-11-08 22:16:57', '2018-11-08 22:16:57'),
(18, 49, 6, '2018-11-09 19:32:43', '2018-11-09 19:32:43'),
(19, 49, 1, '2018-11-09 19:32:43', '2018-11-09 19:32:43'),
(20, 50, 6, '2018-11-09 19:41:48', '2018-11-09 19:41:48'),
(21, 50, 1, '2018-11-09 19:41:48', '2018-11-09 19:41:48'),
(22, 51, 6, '2018-11-09 19:42:56', '2018-11-09 19:42:56'),
(23, 51, 1, '2018-11-09 19:42:56', '2018-11-09 19:42:56'),
(24, 67, 6, '2018-11-12 07:23:30', '2018-11-12 07:23:30'),
(25, 67, 1, '2018-11-12 07:23:30', '2018-11-12 07:23:30'),
(26, 68, 6, '2018-11-12 07:26:06', '2018-11-12 07:26:06'),
(27, 68, 1, '2018-11-12 07:26:06', '2018-11-12 07:26:06'),
(28, 69, 6, '2018-11-12 07:41:23', '2018-11-12 07:41:23'),
(29, 69, 1, '2018-11-12 07:41:23', '2018-11-12 07:41:23'),
(30, 73, 1, '2018-11-12 09:27:05', '2018-11-12 09:27:05'),
(31, 73, 2, '2018-11-12 09:27:05', '2018-11-12 09:27:05'),
(32, 74, 6, '2018-11-12 09:33:03', '2018-11-12 09:33:03'),
(33, 74, 1, '2018-11-12 09:33:03', '2018-11-12 09:33:03'),
(34, 75, 6, '2018-11-12 09:33:45', '2018-11-12 09:33:45'),
(35, 75, 1, '2018-11-12 09:33:45', '2018-11-12 09:33:45'),
(36, 76, 6, '2018-11-12 11:52:42', '2018-11-12 11:52:42'),
(37, 76, 1, '2018-11-12 11:52:42', '2018-11-12 11:52:42'),
(38, 77, 6, '2018-11-12 11:54:33', '2018-11-12 11:54:33'),
(39, 77, 1, '2018-11-12 11:54:33', '2018-11-12 11:54:33'),
(40, 78, 6, '2018-11-12 12:01:04', '2018-11-12 12:01:04'),
(41, 79, 6, '2018-11-12 12:51:48', '2018-11-12 12:51:48'),
(42, 79, 1, '2018-11-12 12:51:48', '2018-11-12 12:51:48'),
(43, 80, 6, '2018-11-12 12:53:46', '2018-11-12 12:53:46'),
(44, 80, 1, '2018-11-12 12:53:46', '2018-11-12 12:53:46'),
(45, 81, 6, '2018-11-12 18:33:02', '2018-11-12 18:33:02'),
(46, 82, 6, '2018-11-12 18:35:21', '2018-11-12 18:35:21'),
(47, 82, 1, '2018-11-12 18:35:21', '2018-11-12 18:35:21'),
(48, 84, 6, '2018-11-12 19:58:18', '2018-11-12 19:58:18'),
(49, 84, 1, '2018-11-12 19:58:18', '2018-11-12 19:58:18'),
(50, 86, 6, '2018-11-12 20:56:00', '2018-11-12 20:56:00'),
(51, 91, 1, '2018-11-13 07:00:41', '2018-11-13 07:00:41'),
(52, 91, 2, '2018-11-13 07:00:41', '2018-11-13 07:00:41'),
(53, 92, 1, '2018-11-13 07:04:49', '2018-11-13 07:04:49'),
(54, 92, 2, '2018-11-13 07:04:49', '2018-11-13 07:04:49'),
(55, 93, 3, '2018-11-13 07:09:11', '2018-11-13 07:09:11'),
(56, 94, 3, '2018-11-13 07:11:20', '2018-11-13 07:11:20'),
(57, 95, 3, '2018-11-13 07:12:18', '2018-11-13 07:12:18'),
(58, 97, 1, '2018-11-13 07:16:03', '2018-11-13 07:16:03'),
(59, 97, 2, '2018-11-13 07:16:03', '2018-11-13 07:16:03'),
(60, 98, 3, '2018-11-13 07:35:23', '2018-11-13 07:35:23'),
(61, 99, 3, '2018-11-13 07:36:33', '2018-11-13 07:36:33'),
(62, 100, 3, '2018-11-13 07:57:00', '2018-11-13 07:57:00'),
(63, 101, 6, '2018-11-15 05:49:07', '2018-11-15 05:49:07'),
(64, 101, 1, '2018-11-15 05:49:07', '2018-11-15 05:49:07'),
(65, 102, 6, '2018-11-15 05:49:30', '2018-11-15 05:49:30'),
(66, 102, 1, '2018-11-15 05:49:30', '2018-11-15 05:49:30'),
(67, 103, 6, '2018-11-15 05:50:07', '2018-11-15 05:50:07'),
(68, 103, 1, '2018-11-15 05:50:07', '2018-11-15 05:50:07'),
(69, 104, 1, '2018-11-15 12:09:56', '2018-11-15 12:09:56'),
(70, 104, 3, '2018-11-15 12:09:56', '2018-11-15 12:09:56'),
(71, 105, 3, '2018-11-16 08:41:33', '2018-11-16 08:41:33'),
(72, 106, 4, '2018-11-18 15:17:23', '2018-11-18 15:17:23'),
(73, 107, 6, '2018-11-21 10:09:23', '2018-11-21 10:09:23'),
(74, 107, 3, '2018-11-21 10:09:23', '2018-11-21 10:09:23'),
(75, 108, 6, '2018-11-21 10:22:45', '2018-11-21 10:22:45'),
(76, 108, 1, '2018-11-21 10:22:45', '2018-11-21 10:22:45'),
(77, 109, 6, '2018-11-24 06:48:28', '2018-11-24 06:48:28'),
(78, 110, 1, '2018-11-24 06:49:08', '2018-11-24 06:49:08'),
(79, 111, 6, '2018-11-24 06:50:17', '2018-11-24 06:50:17'),
(80, 112, 2, '2018-11-24 06:55:06', '2018-11-24 06:55:06'),
(81, 113, 5, '2018-11-24 10:47:34', '2018-11-24 10:47:34'),
(82, 114, 2, '2018-11-24 11:14:04', '2018-11-24 11:14:04'),
(83, 115, 2, '2018-11-24 11:31:38', '2018-11-24 11:31:38'),
(84, 116, 2, '2018-11-24 11:37:41', '2018-11-24 11:37:41'),
(85, 117, 2, '2018-11-24 11:44:04', '2018-11-24 11:44:04'),
(86, 118, 1, '2018-11-24 12:19:46', '2018-11-24 12:19:46'),
(87, 119, 1, '2018-11-26 06:28:19', '2018-11-26 06:28:19'),
(88, 119, 3, '2018-11-26 06:28:19', '2018-11-26 06:28:19'),
(89, 120, 3, '2018-11-26 06:29:10', '2018-11-26 06:29:10'),
(90, 120, 4, '2018-11-26 06:29:10', '2018-11-26 06:29:10'),
(91, 124, 5, '2018-11-26 09:22:43', '2018-11-26 09:22:43'),
(92, 125, 1, '2018-11-26 09:24:09', '2018-11-26 09:24:09'),
(93, 127, 5, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(94, 127, 6, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(95, 127, 1, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(96, 127, 3, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(97, 127, 2, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(98, 127, 4, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(99, 128, 6, '2018-11-26 09:37:00', '2018-11-26 09:37:00'),
(100, 129, 5, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(101, 129, 6, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(102, 129, 1, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(103, 129, 3, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(104, 129, 2, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(105, 129, 4, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(106, 131, 1, '2018-11-26 09:45:37', '2018-11-26 09:45:37'),
(107, 132, 6, '2018-11-26 09:48:34', '2018-11-26 09:48:34'),
(108, 132, 1, '2018-11-26 09:48:34', '2018-11-26 09:48:34'),
(109, 134, 6, '2018-11-26 09:58:52', '2018-11-26 09:58:52'),
(110, 135, 1, '2018-11-26 10:16:08', '2018-11-26 10:16:08'),
(111, 136, 1, '2018-11-26 10:23:07', '2018-11-26 10:23:07'),
(112, 136, 3, '2018-11-26 10:23:07', '2018-11-26 10:23:07'),
(113, 137, 6, '2018-11-26 10:27:39', '2018-11-26 10:27:39'),
(114, 137, 1, '2018-11-26 10:27:39', '2018-11-26 10:27:39'),
(115, 133, 1, '2018-11-04 11:11:25', '2018-11-04 11:11:25'),
(116, 138, 1, '2018-11-26 10:43:27', '2018-11-26 10:43:27'),
(117, 139, 5, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(118, 139, 6, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(119, 139, 1, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(120, 139, 3, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(121, 139, 2, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(122, 139, 4, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(125, 141, 1, '2018-11-26 10:50:26', '2018-11-26 10:50:26'),
(126, 141, 2, '2018-11-26 10:50:26', '2018-11-26 10:50:26'),
(131, 142, 1, '2018-11-26 11:09:16', '2018-11-26 11:09:16'),
(132, 142, 2, '2018-11-26 11:09:16', '2018-11-26 11:09:16'),
(133, 140, 1, '2018-11-26 11:31:07', '2018-11-26 11:31:07'),
(134, 140, 2, '2018-11-26 11:31:07', '2018-11-26 11:31:07'),
(140, 153, 2, '2018-11-28 08:10:44', '2018-11-28 08:10:44'),
(141, 153, 3, '2018-11-28 08:10:44', '2018-11-28 08:10:44'),
(143, 155, 1, '2018-12-01 08:31:32', '2018-12-01 08:31:32'),
(144, 156, 3, '2018-12-01 08:55:02', '2018-12-01 08:55:02'),
(145, 158, 2, '2018-12-01 18:07:58', '2018-12-01 18:07:58'),
(146, 158, 4, '2018-12-01 18:07:58', '2018-12-01 18:07:58'),
(147, 159, 1, '2018-12-03 09:07:02', '2018-12-03 09:07:02'),
(148, 159, 2, '2018-12-03 09:07:02', '2018-12-03 09:07:02'),
(149, 159, 4, '2018-12-03 09:07:02', '2018-12-03 09:07:02'),
(150, 160, 1, '2018-12-03 09:09:17', '2018-12-03 09:09:17'),
(151, 160, 2, '2018-12-03 09:09:17', '2018-12-03 09:09:17'),
(152, 160, 3, '2018-12-03 09:09:17', '2018-12-03 09:09:17'),
(153, 160, 4, '2018-12-03 09:09:17', '2018-12-03 09:09:17'),
(165, 162, 1, '2018-12-03 09:30:12', '2018-12-03 09:30:12'),
(166, 163, 2, '2018-12-03 11:03:35', '2018-12-03 11:03:35'),
(167, 164, 1, '2018-12-04 05:32:52', '2018-12-04 05:32:52'),
(168, 165, 1, '2018-12-04 05:34:45', '2018-12-04 05:34:45'),
(169, 166, 1, '2018-12-04 05:35:34', '2018-12-04 05:35:34'),
(173, 143, 1, '2018-12-04 05:45:51', '2018-12-04 05:45:51'),
(174, 152, 2, '2018-12-04 05:49:18', '2018-12-04 05:49:18'),
(175, 152, 3, '2018-12-04 05:49:18', '2018-12-04 05:49:18'),
(176, 152, 4, '2018-12-04 05:49:18', '2018-12-04 05:49:18'),
(177, 167, 5, '2018-12-04 06:01:11', '2018-12-04 06:01:11'),
(178, 167, 1, '2018-12-04 06:01:11', '2018-12-04 06:01:11'),
(179, 168, 5, '2018-12-04 06:28:03', '2018-12-04 06:28:03'),
(180, 168, 3, '2018-12-04 06:28:03', '2018-12-04 06:28:03'),
(181, 169, 1, '2018-12-04 06:34:32', '2018-12-04 06:34:32'),
(182, 170, 1, '2018-12-04 06:40:20', '2018-12-04 06:40:20'),
(183, 171, 1, '2018-12-04 06:41:28', '2018-12-04 06:41:28'),
(184, 172, 4, '2018-12-04 06:43:48', '2018-12-04 06:43:48'),
(185, 173, 1, '2018-12-04 07:00:09', '2018-12-04 07:00:09'),
(186, 174, 5, '2018-12-04 07:03:30', '2018-12-04 07:03:30'),
(187, 174, 6, '2018-12-04 07:03:30', '2018-12-04 07:03:30'),
(188, 174, 1, '2018-12-04 07:03:30', '2018-12-04 07:03:30'),
(189, 175, 1, '2018-12-04 07:05:05', '2018-12-04 07:05:05'),
(190, 176, 5, '2018-12-04 07:13:21', '2018-12-04 07:13:21'),
(191, 177, 1, '2018-12-04 07:13:47', '2018-12-04 07:13:47'),
(192, 178, 1, '2018-12-04 07:18:27', '2018-12-04 07:18:27'),
(193, 154, 1, '2018-12-04 07:28:55', '2018-12-04 07:28:55'),
(194, 179, 3, '2018-12-04 07:38:25', '2018-12-04 07:38:25'),
(195, 180, 5, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(196, 180, 6, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(197, 180, 1, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(198, 180, 3, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(199, 180, 2, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(200, 180, 4, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(201, 181, 1, '2018-12-04 07:48:29', '2018-12-04 07:48:29'),
(202, 182, 1, '2018-12-04 10:16:36', '2018-12-04 10:16:36'),
(203, 183, 5, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(204, 183, 6, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(205, 183, 1, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(206, 183, 4, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(207, 183, 3, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(208, 183, 2, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(209, 184, 5, '2018-12-04 11:06:49', '2018-12-04 11:06:49'),
(210, 184, 6, '2018-12-04 11:06:49', '2018-12-04 11:06:49'),
(211, 185, 1, '2018-12-04 11:09:26', '2018-12-04 11:09:26'),
(212, 186, 1, '2018-12-04 11:10:59', '2018-12-04 11:10:59'),
(213, 187, 6, '2018-12-04 11:28:23', '2018-12-04 11:28:23'),
(214, 188, 5, '2018-12-04 11:35:44', '2018-12-04 11:35:44'),
(215, 188, 6, '2018-12-04 11:35:44', '2018-12-04 11:35:44'),
(216, 188, 1, '2018-12-04 11:35:44', '2018-12-04 11:35:44'),
(217, 188, 4, '2018-12-04 11:35:44', '2018-12-04 11:35:44'),
(218, 189, 1, '2018-12-04 12:01:05', '2018-12-04 12:01:05'),
(219, 190, 6, '2018-12-04 13:42:10', '2018-12-04 13:42:10'),
(220, 190, 5, '2018-12-04 13:42:10', '2018-12-04 13:42:10'),
(221, 191, 6, '2018-12-05 08:48:54', '2018-12-05 08:48:54'),
(222, 191, 1, '2018-12-05 08:48:54', '2018-12-05 08:48:54'),
(223, 192, 1, '2018-12-05 08:50:06', '2018-12-05 08:50:06'),
(224, 193, 1, '2018-12-05 08:50:28', '2018-12-05 08:50:28'),
(225, 194, 1, '2018-12-05 08:51:20', '2018-12-05 08:51:20'),
(226, 195, 1, '2018-12-05 08:56:49', '2018-12-05 08:56:49'),
(227, 196, 1, '2018-12-05 08:58:39', '2018-12-05 08:58:39'),
(228, 197, 1, '2018-12-06 04:59:18', '2018-12-06 04:59:18'),
(229, 198, 1, '2018-12-06 17:11:26', '2018-12-06 17:11:26'),
(230, 199, 6, '2018-12-12 15:54:45', '2018-12-12 15:54:45'),
(231, 199, 1, '2018-12-12 15:54:45', '2018-12-12 15:54:45'),
(232, 200, 5, '2018-12-17 09:00:51', '2018-12-17 09:00:51'),
(233, 201, 1, '2018-12-19 10:24:24', '2018-12-19 10:24:24'),
(234, 202, 2, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(235, 202, 6, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(236, 202, 5, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(237, 202, 3, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(238, 202, 4, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(239, 202, 1, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(240, 203, 5, '2018-12-20 07:50:08', '2018-12-20 07:50:08'),
(241, 203, 3, '2018-12-20 07:50:08', '2018-12-20 07:50:08'),
(242, 204, 5, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(243, 204, 6, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(244, 204, 1, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(245, 204, 4, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(246, 204, 3, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(247, 204, 2, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(248, 205, 3, '2018-12-20 19:19:07', '2018-12-20 19:19:07'),
(249, 206, 3, '2018-12-21 11:15:02', '2018-12-21 11:15:02'),
(250, 207, 1, '2018-12-21 12:27:21', '2018-12-21 12:27:21'),
(251, 208, 1, '2018-12-23 09:50:46', '2018-12-23 09:50:46'),
(252, 209, 5, '2018-12-24 14:31:39', '2018-12-24 14:31:39'),
(253, 210, 5, '2018-12-27 10:32:30', '2018-12-27 10:32:30'),
(254, 210, 6, '2018-12-27 10:32:30', '2018-12-27 10:32:30'),
(255, 210, 1, '2018-12-27 10:32:30', '2018-12-27 10:32:30'),
(256, 210, 4, '2018-12-27 10:32:30', '2018-12-27 10:32:30'),
(257, 211, 5, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(258, 211, 6, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(259, 211, 1, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(260, 211, 4, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(261, 211, 3, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(262, 211, 2, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(263, 212, 5, '2018-12-27 10:59:27', '2018-12-27 10:59:27'),
(264, 213, 2, '2018-12-30 19:49:54', '2018-12-30 19:49:54'),
(265, 214, 2, '2018-12-30 19:56:20', '2018-12-30 19:56:20'),
(266, 215, 4, '2019-01-17 16:55:24', '2019-01-17 16:55:24'),
(267, 216, 1, '2019-01-17 16:58:14', '2019-01-17 16:58:14'),
(268, 217, 5, '2019-01-17 16:58:41', '2019-01-17 16:58:41'),
(269, 218, 6, '2019-01-17 16:59:07', '2019-01-17 16:59:07'),
(270, 219, 5, '2019-01-17 16:59:47', '2019-01-17 16:59:47'),
(271, 220, 5, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(272, 220, 6, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(273, 220, 1, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(274, 220, 4, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(275, 220, 3, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(276, 220, 2, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(277, 221, 4, '2019-01-17 17:05:30', '2019-01-17 17:05:30'),
(278, 221, 3, '2019-01-17 17:05:30', '2019-01-17 17:05:30'),
(279, 222, 4, '2019-01-17 17:07:34', '2019-01-17 17:07:34'),
(280, 223, 1, '2019-01-24 05:44:17', '2019-01-24 05:44:17'),
(281, 223, 2, '2019-01-24 05:44:17', '2019-01-24 05:44:17'),
(282, 228, 1, '2019-01-29 11:01:02', '2019-01-29 11:01:02'),
(283, 228, 2, '2019-01-29 11:01:02', '2019-01-29 11:01:02'),
(284, 229, 2, '2019-01-29 11:02:20', '2019-01-29 11:02:20'),
(285, 230, 2, '2019-01-29 11:04:41', '2019-01-29 11:04:41'),
(286, 231, 2, '2019-01-29 11:07:41', '2019-01-29 11:07:41'),
(287, 232, 2, '2019-01-29 11:21:07', '2019-01-29 11:21:07'),
(288, 233, 5, '2019-02-01 06:14:44', '2019-02-01 06:14:44'),
(289, 234, 1, '2019-02-01 09:17:17', '2019-02-01 09:17:17'),
(290, 235, 1, '2019-02-01 09:17:46', '2019-02-01 09:17:46'),
(291, 236, 1, '2019-02-01 09:22:16', '2019-02-01 09:22:16'),
(292, 237, 4, '2019-02-01 20:48:26', '2019-02-01 20:48:26'),
(293, 238, 1, '2019-02-02 06:32:13', '2019-02-02 06:32:13'),
(294, 239, 3, '2019-02-05 07:25:24', '2019-02-05 07:25:24'),
(295, 240, 1, '2019-02-06 16:14:05', '2019-02-06 16:14:05'),
(296, 241, 1, '2019-02-08 11:29:09', '2019-02-08 11:29:09'),
(297, 242, 4, '2019-02-08 11:32:28', '2019-02-08 11:32:28'),
(298, 243, 2, '2019-02-09 07:22:42', '2019-02-09 07:22:42'),
(299, 244, 2, '2019-02-09 08:59:40', '2019-02-09 08:59:40'),
(300, 245, 1, '2019-02-09 11:47:25', '2019-02-09 11:47:25'),
(301, 246, 5, '2019-02-09 12:04:20', '2019-02-09 12:04:20'),
(302, 247, 2, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(303, 247, 1, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(304, 247, 6, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(305, 247, 5, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(306, 247, 3, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(307, 247, 4, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(308, 248, 2, '2019-02-09 12:11:50', '2019-02-09 12:11:50'),
(309, 249, 2, '2019-02-09 12:59:50', '2019-02-09 12:59:50'),
(310, 250, 6, '2019-02-10 09:34:02', '2019-02-10 09:34:02'),
(311, 251, 6, '2019-02-12 20:12:09', '2019-02-12 20:12:09'),
(312, 252, 4, '2019-02-13 05:49:19', '2019-02-13 05:49:19'),
(313, 253, 5, '2019-02-13 12:30:33', '2019-02-13 12:30:33'),
(314, 254, 1, '2019-02-18 11:08:33', '2019-02-18 11:08:33'),
(315, 255, 5, '2019-02-21 11:05:57', '2019-02-21 11:05:57'),
(316, 256, 5, '2019-02-23 14:56:42', '2019-02-23 14:56:42'),
(317, 257, 2, '2019-02-25 11:30:07', '2019-02-25 11:30:07'),
(318, 258, 2, '2019-02-25 11:30:59', '2019-02-25 11:30:59'),
(319, 259, 2, '2019-02-25 11:31:32', '2019-02-25 11:31:32'),
(320, 260, 2, '2019-02-25 11:33:03', '2019-02-25 11:33:03'),
(321, 261, 2, '2019-02-25 11:33:21', '2019-02-25 11:33:21'),
(322, 262, 2, '2019-02-25 11:40:39', '2019-02-25 11:40:39'),
(323, 263, 2, '2019-02-25 11:41:24', '2019-02-25 11:41:24'),
(324, 264, 2, '2019-02-25 11:41:56', '2019-02-25 11:41:56'),
(325, 265, 2, '2019-02-25 11:46:22', '2019-02-25 11:46:22'),
(326, 266, 2, '2019-02-25 11:59:03', '2019-02-25 11:59:03'),
(327, 267, 2, '2019-02-25 11:59:32', '2019-02-25 11:59:32'),
(328, 268, 2, '2019-02-25 11:59:57', '2019-02-25 11:59:57'),
(329, 269, 2, '2019-02-25 12:00:32', '2019-02-25 12:00:32'),
(330, 270, 2, '2019-02-25 12:05:27', '2019-02-25 12:05:27'),
(331, 271, 2, '2019-02-25 12:05:49', '2019-02-25 12:05:49'),
(332, 272, 2, '2019-02-25 12:06:36', '2019-02-25 12:06:36'),
(333, 273, 2, '2019-02-25 12:07:16', '2019-02-25 12:07:16'),
(334, 274, 2, '2019-02-25 12:07:20', '2019-02-25 12:07:20'),
(335, 275, 2, '2019-02-25 12:09:06', '2019-02-25 12:09:06'),
(336, 276, 2, '2019-02-25 12:09:44', '2019-02-25 12:09:44'),
(337, 277, 2, '2019-02-25 12:11:33', '2019-02-25 12:11:33'),
(338, 278, 3, '2019-02-25 12:11:57', '2019-02-25 12:11:57'),
(339, 279, 2, '2019-02-26 12:04:43', '2019-02-26 12:04:43'),
(340, 280, 2, '2019-02-26 12:05:12', '2019-02-26 12:05:12'),
(341, 281, 2, '2019-02-26 12:17:20', '2019-02-26 12:17:20'),
(342, 282, 2, '2019-02-26 12:23:51', '2019-02-26 12:23:51'),
(343, 283, 2, '2019-02-26 12:24:10', '2019-02-26 12:24:10'),
(344, 284, 2, '2019-02-26 12:24:41', '2019-02-26 12:24:41'),
(345, 285, 2, '2019-02-26 12:29:31', '2019-02-26 12:29:31'),
(346, 286, 2, '2019-02-26 12:30:06', '2019-02-26 12:30:06'),
(347, 287, 2, '2019-02-26 12:31:44', '2019-02-26 12:31:44'),
(348, 288, 2, '2019-02-26 12:32:15', '2019-02-26 12:32:15'),
(349, 289, 2, '2019-02-26 12:32:31', '2019-02-26 12:32:31'),
(350, 290, 2, '2019-02-26 17:29:52', '2019-02-26 17:29:52'),
(351, 291, 2, '2019-02-26 17:36:38', '2019-02-26 17:36:38'),
(352, 292, 2, '2019-02-26 17:37:56', '2019-02-26 17:37:56'),
(353, 293, 4, '2019-02-28 13:24:30', '2019-02-28 13:24:30'),
(354, 294, 4, '2019-02-28 13:27:19', '2019-02-28 13:27:19'),
(355, 295, 4, '2019-02-28 13:27:59', '2019-02-28 13:27:59'),
(356, 296, 4, '2019-02-28 13:29:01', '2019-02-28 13:29:01'),
(357, 297, 1, '2019-02-28 13:43:24', '2019-02-28 13:43:24'),
(358, 298, 4, '2019-02-28 14:46:10', '2019-02-28 14:46:10'),
(359, 299, 5, '2019-03-04 10:36:31', '2019-03-04 10:36:31'),
(360, 300, 5, '2019-03-04 10:37:47', '2019-03-04 10:37:47'),
(361, 301, 1, '2019-03-12 18:29:05', '2019-03-12 18:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `post_views`
--

CREATE TABLE `post_views` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_views`
--

INSERT INTO `post_views` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 139, 3, '2018-11-27 12:38:26', '2018-11-27 12:38:26'),
(2, 139, 77, '2018-12-01 10:16:45', '2018-12-01 10:16:45'),
(3, 81, 3, '2018-12-01 23:17:38', '2018-12-01 23:17:38'),
(4, 154, 77, '2018-12-03 10:20:25', '2018-12-03 10:20:25'),
(5, 134, 77, '2018-12-03 11:00:51', '2018-12-03 11:00:51'),
(6, 154, 102, '2018-12-04 07:35:58', '2018-12-04 07:35:58'),
(7, 154, 94, '2018-12-04 07:35:59', '2018-12-04 07:35:59'),
(8, 134, 102, '2018-12-04 09:01:22', '2018-12-04 09:01:22'),
(9, 81, 102, '2018-12-04 09:42:28', '2018-12-04 09:42:28'),
(10, 153, 102, '2018-12-04 10:02:08', '2018-12-04 10:02:08'),
(11, 145, 102, '2018-12-04 10:02:38', '2018-12-04 10:02:38'),
(12, 143, 102, '2018-12-04 10:02:55', '2018-12-04 10:02:55'),
(13, 135, 102, '2018-12-04 10:07:26', '2018-12-04 10:07:26'),
(14, 131, 102, '2018-12-04 10:13:25', '2018-12-04 10:13:25'),
(15, 108, 102, '2018-12-04 10:15:09', '2018-12-04 10:15:09'),
(16, 187, 102, '2018-12-04 11:34:10', '2018-12-04 11:34:10'),
(17, 187, 3, '2018-12-04 16:47:58', '2018-12-04 16:47:58'),
(18, 145, 3, '2018-12-04 16:50:03', '2018-12-04 16:50:03'),
(19, 154, 3, '2018-12-05 08:45:28', '2018-12-05 08:45:28'),
(20, 195, 3, '2018-12-05 08:56:53', '2018-12-05 08:56:53'),
(21, 131, 94, '2018-12-05 12:38:29', '2018-12-05 12:38:29'),
(22, 153, 94, '2018-12-06 11:55:34', '2018-12-06 11:55:34'),
(23, 195, 77, '2018-12-13 12:13:17', '2018-12-13 12:13:17'),
(24, 229, 77, '2019-01-29 11:02:44', '2019-01-29 11:02:44'),
(25, 35, 77, '2019-01-31 14:44:16', '2019-01-31 14:44:16'),
(26, 145, 77, '2019-01-31 14:44:36', '2019-01-31 14:44:36'),
(27, 154, 116, '2019-02-01 06:13:09', '2019-02-01 06:13:09'),
(28, 143, 116, '2019-02-01 06:15:06', '2019-02-01 06:15:06'),
(29, 144, 116, '2019-02-01 06:22:39', '2019-02-01 06:22:39'),
(30, 143, 108, '2019-02-08 06:06:04', '2019-02-08 06:06:04'),
(31, 153, 117, '2019-02-09 11:56:36', '2019-02-09 11:56:36'),
(32, 153, 77, '2019-02-09 12:46:47', '2019-02-09 12:46:47'),
(33, 143, 77, '2019-02-09 12:48:11', '2019-02-09 12:48:11'),
(34, 154, 119, '2019-02-09 15:34:32', '2019-02-09 15:34:32'),
(35, 144, 97, '2019-02-12 20:12:31', '2019-02-12 20:12:31'),
(36, 143, 97, '2019-02-12 20:12:38', '2019-02-12 20:12:38'),
(37, 153, 97, '2019-02-12 20:12:49', '2019-02-12 20:12:49'),
(38, 144, 125, '2019-02-26 17:38:50', '2019-02-26 17:38:50'),
(39, 277, 79, '2019-02-28 11:07:18', '2019-02-28 11:07:18'),
(40, 143, 128, '2019-02-28 11:53:07', '2019-02-28 11:53:07'),
(41, 143, 3, '2019-03-04 07:05:36', '2019-03-04 07:05:36'),
(42, 145, 109, '2019-03-24 11:15:38', '2019-03-24 11:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_user`
--

CREATE TABLE `tmp_user` (
  `id` int(11) NOT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `google_id` bigint(20) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `is_otp_verified` int(11) NOT NULL DEFAULT '0',
  `is_verified` tinyint(4) NOT NULL DEFAULT '0',
  `is_trashed` tinyint(4) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_user`
--

INSERT INTO `tmp_user` (`id`, `facebook_id`, `google_id`, `otp`, `full_name`, `username`, `password`, `email`, `country_code`, `phone_number`, `image`, `age`, `country`, `city`, `is_otp_verified`, `is_verified`, `is_trashed`, `is_blocked`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '1234', 'test23', 'test ', 'sha1$27f9be03$1$44ea917324451983950a8bf299d1a2a38e63f285', 'test@gmail.com', NULL, '7894563214', 'default.png', 0, '', '', 0, 0, 0, 0, '2018-11-01 07:58:03', '2018-11-01 08:10:45'),
(15, NULL, NULL, '1234', 'test', 'testgmail', 'sha1$0f6e014e$1$abad9f07c4a32b540e39c27f5937e191fc81d4da', 'test@gmail.com', NULL, '8521479632', '14883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', 0, '', '', 1, 0, 0, 0, '2018-11-01 10:09:58', '2018-11-01 10:12:34'),
(16, NULL, NULL, '1234', 'Makk', 'makk', 'sha1$8e735301$1$949ccfe550aba720cf08bba4c992c91adce62d94', 'makk@gmail.com', NULL, '904198976', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-01 10:49:25', '2018-11-01 10:49:25'),
(17, NULL, NULL, '1234', 'Makk Roggers', 'makk', 'sha1$550caff8$1$7b65269f090541e6db679b0017cb62b181f29bb2', 'makk@gmail.com', NULL, '98464646', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-01 10:51:01', '2018-11-01 10:51:36'),
(21, NULL, NULL, '1234', 'test34', 'test34', 'sha1$647fa8bb$1$db56e8060983d5d01b1d355ff1eac55ab110ea99', 'test@34.com', NULL, '7896541235', '14883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', 0, '', '', 1, 0, 0, 0, '2018-11-02 05:15:19', '2018-11-02 05:15:23'),
(22, NULL, NULL, '1234', 'Matt Roggers', 'matt', 'sha1$c3a24f1e$1$b78f195720071dbb840f45c5cf3524d87a1f6f8b', 'matt@gmail.com', NULL, '9041907909', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-02 08:08:42', '2018-11-02 08:10:14'),
(23, NULL, NULL, '1234', 'Harry Singh', 'harry', 'sha1$6f5da364$1$d1fbe89ed1621dc45b1b41e40e1c5ddb6977445f', 'harry@gmail.com', NULL, '999999999', 'default.png', 0, '', '', 1, 0, 0, 0, '2018-11-02 08:11:18', '2018-11-02 08:12:12'),
(24, NULL, NULL, '1234', 'Jerry', 'jerry', 'sha1$53fc2004$1$888792959a77a28f2839344d1f419696e3812c05', 'jerry@gmail.com', NULL, '123456789', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-02 08:14:03', '2018-11-02 08:14:07'),
(25, NULL, NULL, '1234', 'test34', 'test323', 'sha1$017b96e0$1$32d4f93cbec6e1480a728ede2e1ac48e575279f5', 'test@31232.com', NULL, '7896541245', '14883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', 0, '', '', 0, 0, 0, 0, '2018-11-02 08:20:06', '2018-11-02 08:20:06'),
(26, NULL, NULL, '1234', 'howdy singh', 'howdy', 'sha1$e20e202b$1$f40d080b35064c1de47d16f2e2831eb7155e528f', 'howdy@gmail.com', NULL, '946464646', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-02 08:25:57', '2018-11-02 08:26:24'),
(27, NULL, NULL, '1234', 'yalo yolo', 'yolo', 'sha1$05a890ff$1$4d2aa9d336ad716cd292d44a6d78845ff2be6c85', 'yolo@gmail.com', NULL, '464646', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-02 08:33:28', '2018-11-02 08:33:41'),
(33, NULL, NULL, '1234', 'Makk Roggers', 'Makk', 'sha1$a3927f85$1$8edad234e93f69cd727eb694d4b0e2b0600f5e40', 'mukesh@embazaar.com', NULL, '90419794646', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-02 11:47:09', '2018-11-02 11:47:19'),
(34, NULL, NULL, '1234', 'test34', 'ni12', 'sha1$c40034eb$1$99681851aa002d313f2c093831ecb19dfe8f30ef', 'nitya@143.com', NULL, '123561', '14883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', 0, '', '', 1, 0, 0, 0, '2018-11-02 12:19:14', '2018-11-02 12:19:19'),
(35, NULL, NULL, '1234', 'test34', 'ni1234', 'sha1$713e0ffc$1$275d53ffd85437243a57e809f2efe52ab34a617b', 'nitya@1435.com', NULL, '1235612', '14883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', 0, '', '', 0, 0, 0, 0, '2018-11-02 12:19:54', '2018-11-02 12:19:54'),
(36, NULL, NULL, '1234', 'Mr Anderson', 'Thomas', 'sha1$b4577668$1$8b15a17a004d2120df0461e9965bcf36887fc2d2', 'thomas@gmail.com', NULL, '9898998989', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-07 17:25:18', '2018-11-07 17:25:18'),
(37, NULL, NULL, '1234', 'Mr Anderson', 'Thomas', 'sha1$f3477fa5$1$e4cab8993dfd7e071a84772d8784b7eeff934ddf', 'thomas@gmail.com', NULL, '9898989890', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-07 17:28:32', '2018-11-07 17:28:32'),
(38, NULL, NULL, '1234', 'Mr Anderson', 'Thomas', 'sha1$4e1b3a3e$1$aa78c0db0898e219471116b15108f233bc0ea42b', 'thomas@gmail.com', NULL, '9898989898', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-07 17:39:09', '2018-11-07 17:41:33'),
(39, NULL, NULL, '1234', 'John Doe', 'john', 'sha1$d5c5aef5$1$01088780bd7f062a8e2c756eee3113daa0b90079', 'john@gmail.com', NULL, '9898909098', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-07 17:44:39', '2018-11-07 17:44:44'),
(40, NULL, NULL, '1234', 'sdasdasd', 'asdaddasdas', 'sha1$e6919f9a$1$3deb5df3ca331a02a3bbe04ab4d79f15bad1ec39', 'asdsad2@sad.csdad', NULL, '12321323211', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-07 18:22:57', '2018-11-07 18:22:57'),
(41, NULL, NULL, '1234', 'Iken Gundowan', 'Iker', 'sha1$6bec5c1e$1$02387a6c8ed34331f625129aa9e581dbd3fc1aef', 'iker@gmail.com', NULL, '9898989888', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-11 18:15:28', '2018-11-11 18:15:40'),
(42, NULL, NULL, '1234', 'Yogi Adityanath', 'yogi', 'sha1$a6603405$1$0c52f282ced3dc128f81c0e61b713e6d2249d7d7', 'yogi@gmail.com', NULL, '9464649464', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-12 12:26:04', '2018-11-12 12:26:21'),
(43, NULL, NULL, '1234', 'nitin rana', 'nitinrana', 'sha1$16fa7fb9$1$f497286c9c89ff5553546243774620ad489c8963', 'Nitinr@code-brew.com', NULL, '918558031614', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-13 06:18:21', '2018-11-13 06:28:38'),
(44, NULL, NULL, '1234', 'nitin', 'nitin09', 'sha1$12e7af36$1$7e2092e0f062a1ea71c6a9c6686f96c10109e152', 'pankaj@code-brew.com', NULL, '8558031614', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-15 11:53:22', '2018-11-15 11:53:28'),
(45, NULL, NULL, '1234', 'aaditya', 'Aaditya1', 'sha1$b8cd3dd9$1$35cc9ad6386d39a5f5d4635ff45e5026d0fee7d8', 'aadityashivadey1@hotmail.com', NULL, '00971502226113', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-15 12:06:44', '2018-11-15 12:06:53'),
(46, NULL, NULL, '1234', 'Gagan', 'gaganmj23', 'sha1$1f5c2d7d$1$2eb42b8a448d76642c6384c46d38388576d93d89', 'gagan@code-brew.com', NULL, '989896989', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-16 08:39:11', '2018-11-16 08:39:18'),
(47, NULL, NULL, '1234', 'Sukhchain Singh ', 'sukhchain', 'sha1$18ceefdb$1$1ec798721f1b30580bdbee7b9cfa2767576cf8ad', 'sukhchain@code-brew.com', NULL, '9216244462', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-16 13:11:29', '2018-11-19 07:47:43'),
(48, NULL, NULL, '1234', 'jegajith ', 'jegajith.ramesh', 'sha1$b3bc18c2$1$a0fc5e6ee40567dca6e2d657e8de2af375bdfa86', 'jegajithramesh@yahoo.com', NULL, '97150158669', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-16 17:38:13', '2018-11-16 17:38:21'),
(49, NULL, NULL, '1234', 'rahul', 'test02', 'sha1$acd5e3fb$1$d187aa439ef5658ab6ef7542a4cf3b73725f706f', 'aadityashivadey1@gmail.com', NULL, '00971509250160', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-18 15:14:54', '2018-11-18 15:15:02'),
(50, NULL, NULL, '1234', 'test', 'abc12', 'sha1$28414b89$1$c7f627f655ac01a566898ed2b4fa287a11be3fe3', 'testabc@test.com', NULL, '1234567978', 'default.png', 20, 'India', 'Jalandhar', 1, 0, 0, 0, '2018-11-24 12:39:52', '2018-11-24 12:40:10'),
(51, NULL, NULL, '1234', 'znnsx', 'shsn', 'sha1$39a45f71$1$33943a98c17b7724b96e78722437d35506b122cc', 'sjz@gsn.zk', NULL, '76764', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-24 21:14:51', '2018-11-24 21:14:57'),
(52, NULL, NULL, '1234', 'zack', 'zack@09', 'sha1$7dec7465$1$e31efb31de52bbc8f0eb552c990d700373dd5fd5', 'rana.nitin09121996@gmail.com', NULL, '918558031615', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-26 06:05:46', '2018-11-26 06:05:50'),
(53, NULL, NULL, '1234', 'anshul', 'goelanshul', 'sha1$5691db5e$1$3cd62142ed56a61890ff953a50f2078cb42ff964', 'anahulcodebrew@gmail.com', NULL, '7404395150', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-11-26 09:19:14', '2018-11-26 09:19:52'),
(54, NULL, NULL, '1234', 'testcoe', 'test@code1.com', 'sha1$f2716458$1$563c86379ae3dfb81b710083feaccd356e20bd92', 'testing@code.com', '+91', '9766876689', 'pink-art-silk-and-pink-georgette-fish-cut-lehenga-with-gold-net-dupatta-ghbs1710503-u.jpg', 23, 'India', 'Mohali', 1, 0, 0, 0, '2018-11-27 13:15:03', '2018-11-27 13:15:26'),
(55, NULL, NULL, '1234', 'jeue', 'yshzha', 'sha1$8a1554c1$1$08597ec6ed45b6a634dc4626c05ee90df1c71544', 'jega@yahoo.com', NULL, '65565', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-12-01 08:27:28', '2018-12-01 08:27:32'),
(56, NULL, NULL, '1234', 'jzjzhdy', 'jddhehjj12282l', 'sha1$425f952e$1$8cad9657236b8cd71457055ff667861383938891', 'ueuudhej@yahoo.com', NULL, '65676467', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-12-01 08:30:08', '2018-12-01 08:30:16'),
(57, NULL, NULL, '1234', 'Hello World', 'hello@123', 'sha1$28be7603$1$3e121c5884d3ccea181a731b40eb1504a5a424e9', 'hello@gmail.com', '+213', '9454634646', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-12-03 10:48:28', '2018-12-03 10:48:32'),
(58, NULL, NULL, '1234', 'John Domain', 'domain', 'sha1$209ae58b$1$ceb83a622201f46be33a3869b92a46d28c5e458e', 'domain@gmail.com', NULL, '9090909090', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-12-03 11:02:50', '2018-12-03 11:02:56'),
(59, NULL, NULL, '1234', 'Zack Aron', 'zacky', 'sha1$cca0a1cc$1$587cb51161730581f01ecc968cf55d9a92110ee1', 'ramcodebrew123@gmail.com', '+91', '8558031615', 'default.png', NULL, NULL, NULL, 1, 0, 0, 0, '2018-12-04 05:57:20', '2018-12-04 05:57:25'),
(60, NULL, NULL, '1234', 'testing', 'test', 'sha1$8f40e2ae$1$bfed2d8a38bbd2f56058179e9e100a4980cbfd98', 'testig78@1.com', '+91', '2222222222', 'default.png', 0, '', '', 0, 0, 0, 0, '2018-12-05 12:49:50', '2018-12-05 12:49:50'),
(61, NULL, NULL, '1234', 'Aaditya', 'Aaditya.test1', 'sha1$12abb211$1$bd2b41ea66996a156e5f5a69c3388a6c074b342a', 'jegajithramesh@gmail.com', '+971', '502226113', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-06 17:01:43', '2018-12-06 17:01:53'),
(62, NULL, NULL, '1234', 'dasdasd', 'asdas', 'sha1$59ede867$1$1a77208d9e147edf0defc1088171684c995f2109', 'asd@sad.com', '+374', '21312321312', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-18 11:17:27', '2018-12-18 11:17:34'),
(63, NULL, NULL, '1234', 'Nik', 'niklee', 'sha1$bc3c185b$1$8cfa6ea991680283bc60ff828bd02caee0a64dea', 'niklee@gmail.com', '+971', '8555664319', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-18 13:48:04', '2018-12-18 13:48:09'),
(64, NULL, NULL, '1234', 'Test1', 'test101', 'sha1$ee169404$1$3c63cc3614959700203245a467ccb032d10f262d', 'aadi@hotmail.com', '+971', '558850160', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-19 08:05:47', '2018-12-19 08:05:56'),
(65, NULL, NULL, '1234', 'SivaSankari', 'Siva', 'sha1$7ff66acf$1$f1dfb97975fec516e553a90376fbdfea4eb89be1', 'karthisiva1985@gmail.com', '+971', '+19944561404', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2018-12-19 10:11:31', '2018-12-19 10:11:31'),
(66, NULL, NULL, '1234', 'Keerthiga Devi', 'keerthiga', 'sha1$3aa21611$1$e628d75ca09a504063860e1bb3691c0aeadf2588', 'keerthiprajith@gmail.com', '+91', '9944996940', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-20 04:48:51', '2019-02-09 15:26:52'),
(67, NULL, NULL, '1234', 'Zack', 'zack@0007', 'sha1$f2b3507d$1$e86c40db216b715def15aa208270bdd5c89a61a9', 'zack07@gmail.com', '+91', '8558031619', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-27 10:29:11', '2019-02-13 10:22:41'),
(68, NULL, NULL, '1234', 'jegajith ', 'jegajith_ramesh', 'sha1$5a211edc$1$cf05253941deb464e88d6cb01cc8b176b89a3c7c', 'jegajithramesh528@gmail.com', '+971', '56 992 3504', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2018-12-28 08:20:07', '2018-12-28 08:20:15'),
(69, NULL, NULL, '1234', 'Test', 'test', 'sha1$aad8e059$1$ec09dff2ebcec39fe8b5957086c657a6074572b0', 'test@g.com', '+971', '9484554844', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-01-25 10:18:39', '2019-01-25 10:19:55'),
(70, NULL, NULL, '1234', 'Qbc', 'tst', 'sha1$6e57cc99$1$0157e20a546b6894f54fd8d98bd52aea8a6c3fff', 'tst@abc.com', '+971', '3526939696', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-01-25 10:18:48', '2019-01-25 10:19:55'),
(71, NULL, NULL, '1234', 'Nik', 'nik0009', 'sha1$2c929f62$1$e56a749e98f1a78efb165688381f776eeee38ff9', 'nik@gmail.com', '+91', '8558031616', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-01 06:10:24', '2019-02-01 06:10:31'),
(72, NULL, NULL, '1234', 'Punitha saravanan', 'punitha', 'sha1$e7e40569$1$23e50699bfdf8348ceccbceaa7a63662a652e75c', 'spunitha403@gmail.com', '+91', '9994265412', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-09 11:33:17', '2019-02-09 11:37:40'),
(73, NULL, NULL, '1234', 'Zack', 'zack@0007', 'sha1$a3ab7a58$1$1fdd8f5bf8db5c7cf3054b5e2a914906b8d50a73', 'zack07@gmail.com', '+91', '740217391', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2019-02-13 10:24:01', '2019-02-13 10:24:01'),
(74, NULL, NULL, '1234', 'Zack', 'zack@0007', 'sha1$593ea8ae$1$5ed71e06d7a573fd4081b1ff0fa4e7e6b003188f', 'zack07@gmail.com', '+91', '7404217391', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-13 10:25:51', '2019-02-13 10:26:01'),
(75, NULL, NULL, '1234', 'Bombay Velvet is a good movie', 'bombay', 'sha1$864bb38d$1$677430f30c17ac1b4e1d1409d83136b2f21cae38', 'bombay@gmail.com', '+93', '43233213123', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-18 11:11:45', '2019-02-18 11:11:53'),
(76, NULL, NULL, '1234', 'test', 'heyhey', 'sha1$b38a3e5e$1$1673b5ab65d68f2f3088bdb3a58ec488b4959156', 'hey@test.com', '+91', '982789006', 'default.png', 23, 'India', 'Jalandhar', 1, 0, 0, 0, '2019-02-25 11:26:15', '2019-02-25 11:26:30'),
(77, NULL, NULL, '1234', 'test', 'heyheyhest', 'sha1$76e5dd2f$1$8d2472e91dc68063c776a8c087bd88e099701693', 'nitya@aativa.com', '+91', '982789001', 'default.png', 23, 'India', 'Jalandhar', 1, 0, 0, 0, '2019-02-25 12:20:58', '2019-02-25 12:22:50'),
(78, NULL, NULL, '1234', 'Mike', 'mike123', 'sha1$5afe24d7$1$df6e5ee1d6d36943a43f7110ffe7236437dc793d', 'mike@gmail.con', '+971', '85580313131', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-27 12:50:40', '2019-02-27 12:50:45'),
(79, NULL, NULL, '1234', 'Donald', 'donald09', 'sha1$fbccb531$1$59bd78d2ddab2d9f853d4b9bad3482ed4d760ccd', 'donald@gmail.com', '+971', '8558031336', 'default.png', 0, NULL, NULL, 1, 0, 0, 0, '2019-02-28 11:52:48', '2019-02-28 11:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 90, '7dwFterqVSh1Mgsi42WeEFzikaJjtvIW', '2018-11-24 06:39:16', '2018-11-24 06:39:16'),
(2, 102, '8QYxRITp5R2mV1HORFZTQQT4E7jc0vM9', '2018-12-04 12:10:40', '2018-12-04 12:10:40'),
(3, 89, 'GU6hX7YuNY6FP3WpH9vTZFjhKlhH5Yr6', '2018-12-06 16:51:31', '2018-12-06 16:51:31'),
(4, 89, 'NwBgWKGmRi8O6BViq7I9tgJZT7YaTlGE', '2018-12-06 16:53:19', '2018-12-06 16:53:19'),
(5, 90, 'tR6GF1txqmpbs6f4xdIUs55VlEmuWxfp', '2019-02-13 06:27:36', '2019-02-13 06:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `facebook_id` bigint(11) DEFAULT NULL,
  `google_id` varchar(2555) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'by admin if user has crossed 50k followers',
  `is_trashed` tinyint(4) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(4) NOT NULL DEFAULT '0',
  `is_online` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_id`, `google_id`, `full_name`, `username`, `password`, `email`, `country_code`, `phone_number`, `image`, `age`, `country`, `city`, `is_verified`, `is_trashed`, `is_blocked`, `is_online`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, 'yes sir I’ll send ya the next week ', 'nitya123', 'sha1$f1a01c88$1$8792c740d0a51e3b9ac46b4351ee4e5e211e494a', 'nitya@gmail.com', '+91', '789654236', '1546006314image.jpg', 25, 'India', 'Jalandhar', 0, 0, 0, 1, '2018-10-15 09:50:14', '2019-03-05 15:24:53'),
(76, 756279031374151, '0', 'abc', 'abc', 'sha1$a3927f85$1$8edad234e93f69cd727eb694d4b0e2b0600f5e40', 'mukesh@embazaar.com', '+672', '7896542325', '1541159686IMG_1541159682088_77141247663951422.jpg', 23, 'BDC', 'BBB', 0, 0, 0, 1, '2018-11-02 11:47:19', '2019-03-04 09:17:06'),
(77, NULL, NULL, 'nitya12', 'testing12', 'sha1$c40034eb$1$99681851aa002d313f2c093831ecb19dfe8f30ef', 'nitya@143.com', '+355', '123323669', '1549054244photo_editor_ds_1549054233243.jpg', 0, 'test', '', 0, 0, 0, 0, '2018-11-02 12:19:19', '2019-02-21 12:15:30'),
(78, 0, '9223372036854775807', 'Mukesh Rana', 'user76056', NULL, 'mukeshrana909@gmail.com', NULL, NULL, 'https://lh6.googleusercontent.com/-5ERHO_U-Cl0/AAAAAAAAAAI/AAAAAAAADMg/ot7mdT1G4-E/photo.jpg', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-05 10:35:51', '2019-02-28 13:06:17'),
(79, NULL, NULL, 'Mr Anders', 'Thomas', 'sha1$4e1b3a3e$1$aa78c0db0898e219471116b15108f233bc0ea42b', 'thomas@gmail.com', NULL, '9898989898', '1541957844image.jpg', 23, 'Serbia', 'Klashnikov', 0, 0, 0, 1, '2018-11-07 17:41:33', '2019-03-04 09:12:31'),
(80, NULL, NULL, 'John Doe', 'john', 'sha1$d5c5aef5$1$01088780bd7f062a8e2c756eee3113daa0b90079', 'john@gmail.com', NULL, '9898909098', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-07 17:44:44', '2018-11-07 17:44:44'),
(82, NULL, NULL, 'Iken Gundowan', 'Iker', 'sha1$6bec5c1e$1$02387a6c8ed34331f625129aa9e581dbd3fc1aef', 'iker@gmail.com', NULL, '9898989888', '1541960266image.jpg', 27, 'Germany', 'Munchen', 0, 0, 0, 0, '2018-11-11 18:15:40', '2018-11-11 18:17:47'),
(83, NULL, NULL, 'Yogi Adityanath', 'yogi', 'sha1$a6603405$1$0c52f282ced3dc128f81c0e61b713e6d2249d7d7', 'yogi@gmail.com', NULL, '9464649464', '1542028170IMG_1542028167972_7722110148447395315.jpg', 45, NULL, '', 0, 0, 0, 0, '2018-11-12 12:26:21', '2018-11-12 13:09:31'),
(84, NULL, NULL, 'nitin rana', 'nitinrana', 'sha1$16fa7fb9$1$f497286c9c89ff5553546243774620ad489c8963', 'Nitinr@code-brew.com', NULL, '918558031614', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-13 06:28:38', '2018-11-13 06:28:38'),
(85, NULL, NULL, 'Ajay', 'nitin09hvhcyfyx', 'sha1$12e7af36$1$7e2092e0f062a1ea71c6a9c6686f96c10109e152', 'pankaj@code-brew.com', NULL, '8558031614', 'default.png', 0, '', '', 0, 0, 0, 0, '2018-11-15 11:53:28', '2018-12-04 06:38:39'),
(86, NULL, NULL, 'aaditya', 'Aaditya1', 'sha1$b8cd3dd9$1$35cc9ad6386d39a5f5d4635ff45e5026d0fee7d8', 'aadityashivadey1@hotmail.com', NULL, '00971502226113', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-15 12:06:53', '2018-11-15 12:06:53'),
(87, NULL, NULL, 'Gagan', 'gaganmj23', 'sha1$1f5c2d7d$1$2eb42b8a448d76642c6384c46d38388576d93d89', 'gagan@code-brew.com', NULL, '989896989', 'default.png', NULL, NULL, NULL, 0, 0, 0, 1, '2018-11-16 08:39:18', '2019-02-25 10:20:28'),
(88, NULL, NULL, 'jegajith ', 'jegajith.ramesh', 'sha1$b3bc18c2$1$a0fc5e6ee40567dca6e2d657e8de2af375bdfa86', 'jegajithramesh@yahoo.com', NULL, '97150158669', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-16 17:38:21', '2018-11-16 17:38:21'),
(89, NULL, NULL, 'rahul', 'test02', 'sha1$acd5e3fb$1$d187aa439ef5658ab6ef7542a4cf3b73725f706f', 'aadityashivadey1@gmail.com', NULL, '00971509250160', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-18 15:15:02', '2018-12-06 16:25:58'),
(90, NULL, NULL, 'Sukhchain ', 'sukhchain Singh', 'sha1$18ceefdb$1$1ec798721f1b30580bdbee7b9cfa2767576cf8ad', 'sukhchain@code-brew.com', NULL, '9216244462', '1545304367image.jpg', 35, 'gighfjfjc', 'Chandigarh ', 0, 0, 0, 1, '2018-11-19 07:47:43', '2018-12-20 11:57:49'),
(91, NULL, NULL, 'test', 'abc12', 'sha1$28414b89$1$c7f627f655ac01a566898ed2b4fa287a11be3fe3', 'testabc@test.com', NULL, '1234567978', 'default.png', 20, 'India', 'Jalandhar', 0, 0, 0, 0, '2018-11-24 12:40:10', '2018-11-24 12:40:10'),
(92, NULL, NULL, 'znnsx', 'shsn', 'sha1$39a45f71$1$33943a98c17b7724b96e78722437d35506b122cc', 'sjz@gsn.zk', NULL, '76764', 'default.png', NULL, NULL, NULL, 0, 1, 0, 0, '2018-11-24 21:14:57', '2018-11-26 06:31:47'),
(93, NULL, NULL, 'zack', 'zack@09', 'sha1$7dec7465$1$e31efb31de52bbc8f0eb552c990d700373dd5fd5', 'rana.nitin09121996@gmail.com', '', '918558031615', '1543235001IMG_1543235000530_9079392925646394069.jpg', 123, '', '', 0, 0, 0, 0, '2018-11-26 06:05:50', '2018-12-18 13:46:23'),
(94, NULL, NULL, 'anshul', 'goelanshul', 'sha1$7ecf1fed$1$2a8e2123c50a2d081180db126bf32a2614627658', 'anahulcodebrew@gmail.com', NULL, '7404395150', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-11-26 09:19:52', '2018-12-10 14:20:41'),
(95, NULL, NULL, 'testing code', 'testing code', 'sha1$f2716458$1$563c86379ae3dfb81b710083feaccd356e20bd92', 'testing@code1.com', '+91', '9766876689', 'pink-art-silk-and-pink-georgette-fish-cut-lehenga-with-gold-net-dupatta-ghbs1710503-u.jpg', 0, '', '', 0, 0, 0, 1, '2018-11-27 13:15:26', '2018-11-30 05:25:49'),
(96, NULL, NULL, 'jeue', 'yshzha', 'sha1$8a1554c1$1$08597ec6ed45b6a634dc4626c05ee90df1c71544', 'jega@yahoo.com', NULL, '65565', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-01 08:27:32', '2018-12-01 08:27:32'),
(97, NULL, NULL, 'jzjzhdy', 'jddhehjj12282l', 'sha1$425f952e$1$8cad9657236b8cd71457055ff667861383938891', 'ueuudhej@yahoo.com', NULL, '65676467', 'default.png', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-01 08:30:16', '2019-02-28 14:48:54'),
(99, 2478626932171877, '0', 'Nitya Malhotra', 'nitya', NULL, 'nitya531@ymail.com', '+91', '7896541245', 'https://graph.facebook.com/2478626932171877/picture', 0, 'India', '', 0, 0, 0, 0, '2018-12-01 09:44:10', '2019-02-25 10:41:09'),
(100, NULL, NULL, 'Hello World', 'hello@123', 'sha1$28be7603$1$3e121c5884d3ccea181a731b40eb1504a5a424e9', 'hello@gmail.com', '+355', '9454634646', 'default.png', 20, '', '', 0, 0, 0, 0, '2018-12-03 10:48:32', '2018-12-03 10:53:12'),
(101, NULL, NULL, 'John Domain', 'domain', 'sha1$209ae58b$1$ceb83a622201f46be33a3869b92a46d28c5e458e', 'domain@gmail.com', NULL, '9090909090', 'default.png', NULL, NULL, NULL, 0, 0, 0, 1, '2018-12-03 11:02:56', '2018-12-04 18:08:49'),
(102, NULL, NULL, 'Zack Aan', '@@@@@@@@.    ghhhhhh', 'sha1$cca0a1cc$1$587cb51161730581f01ecc968cf55d9a92110ee1', 'ramcodebrew123@gmail.com', '+269', '855803161555', '1543916825IMG_1543916775612_4746202236618178701.jpg', 33, 'Hhgh', 'Jfcufucu16789457775', 1, 0, 0, 0, '2018-12-04 05:57:25', '2018-12-04 12:06:52'),
(103, NULL, NULL, 'Aaditya', 'Aaditya.test1', 'sha1$12abb211$1$bd2b41ea66996a156e5f5a69c3388a6c074b342a', 'jegajithramesh@gmail.com', '+971', '502226113', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2018-12-06 17:01:53', '2018-12-16 08:36:50'),
(104, 2169675606589085, '0', 'Candy Kaur', 'userZOrWo', NULL, 'Candy@facebook.com', NULL, NULL, 'https://graph.facebook.com/2169675606589085/picture??width=375&height=362', NULL, NULL, NULL, 0, 0, 0, 1, '2018-12-18 04:34:26', '2018-12-18 04:34:26'),
(105, NULL, NULL, 'dasdasd', 'asdas', 'sha1$59ede867$1$1a77208d9e147edf0defc1088171684c995f2109', 'asd@sad.com', '+374', '21312321312', 'default.png', 24, 'India', 'Chandigarh', 0, 0, 0, 0, '2018-12-18 11:17:34', '2018-12-18 11:24:51'),
(106, NULL, NULL, 'Nik', 'niklee', 'sha1$bc3c185b$1$8cfa6ea991680283bc60ff828bd02caee0a64dea', 'niklee@gmail.com', '+971', '8555664319', 'default.png', 89, 'Indianeb', 'Hrjrjrk', 0, 0, 0, 0, '2018-12-18 13:48:09', '2019-02-14 10:14:18'),
(107, 2245667172319171, '0', 'Jithu Ramesh', 'userf4VYT', NULL, 'Jithu@facebook.com', NULL, NULL, 'https://graph.facebook.com/2245667172319171/picture??width=375&height=362', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-18 13:57:24', '2018-12-26 19:10:59'),
(108, NULL, NULL, 'Test1', 'test101', 'sha1$ee169404$1$3c63cc3614959700203245a467ccb032d10f262d', 'aadi@hotmail.com', '+971', '558850160', '1552415437photo_editor_ds_1552415428841.jpg', 16, '', '', 0, 0, 0, 0, '2018-12-19 08:05:56', '2019-03-18 18:43:43'),
(109, 2076227042476665, '0', 'Sivasankari Karthik', 'user1vdRI', NULL, 'karthisiva1985@gmail.com', NULL, NULL, 'https://graph.facebook.com/2076227042476665/picture', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-19 10:12:27', '2019-02-12 15:21:50'),
(110, 1990620161006431, '0', 'Str', 'userrTHUp', NULL, 'str.sundar@hotmail.com', NULL, NULL, 'https://graph.facebook.com/1990620161006431/picture', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-19 10:55:01', '2018-12-20 04:16:11'),
(111, 0, '104923958386078777496', 'test test', 'userlXDZi', NULL, 'nitya30malhotra@gmail.com', NULL, NULL, 'https://lh5.googleusercontent.com/-a1CWlFnA5xE/AAAAAAAAAAI/AAAAAAAAl1I/UcwPajZOuN4/s100/photo.jpg', NULL, NULL, NULL, 0, 0, 0, 0, '2018-12-27 04:56:42', '2019-02-25 10:40:16'),
(112, NULL, NULL, 'Gordon Singh', 'gordysingh', 'sha1$9199df05$1$49bb647a9186e8c74385d612077322f568106868', 'gordon123@gmail.com', '+213', '85580316198', '1545984204IMG_1545984190623_7021551290610829929.jpg', 0, '', '', 0, 0, 0, 1, '2018-12-27 10:29:16', '2018-12-28 08:03:24'),
(113, NULL, NULL, 'jegajith ', 'jegajith_ramesh', 'sha1$5a211edc$1$cf05253941deb464e88d6cb01cc8b176b89a3c7c', 'jegajithramesh528@gmail.com', '+971', '56 992 3504', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2018-12-28 08:20:15', '2019-02-13 05:58:03'),
(114, NULL, NULL, 'Test', 'test', 'sha1$aad8e059$1$ec09dff2ebcec39fe8b5957086c657a6074572b0', 'test@g.com', '+971', '9484554844', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2019-01-25 10:19:55', '2019-01-25 10:19:55'),
(115, NULL, NULL, 'Qbc', 'tst', 'sha1$6e57cc99$1$0157e20a546b6894f54fd8d98bd52aea8a6c3fff', 'tst@abc.com', '+971', '3526939696', 'default.png', 0, NULL, NULL, 0, 0, 0, 1, '2019-01-25 10:19:55', '2019-02-01 05:19:12'),
(116, NULL, NULL, 'Nik', 'nik0009', 'sha1$2c929f62$1$e56a749e98f1a78efb165688381f776eeee38ff9', 'nik@gmail.com', '+91', '8558031616', '1549002440IMG_1549002410497_4401269935689413958.jpg', 0, '', '', 0, 0, 0, 0, '2019-02-01 06:10:31', '2019-02-01 09:41:06'),
(117, NULL, NULL, 'Punitha saravanan', 'Nitha', 'sha1$e7e40569$1$23e50699bfdf8348ceccbceaa7a63662a652e75c', 'spunitha403@gmail.com', '+91', '9994265412', 'default.png', 0, '', '', 0, 0, 0, 1, '2019-02-09 11:37:40', '2019-02-10 18:48:14'),
(118, 2017370431711177, '0', 'Keerthiga Jeganathan', 'userynzFY', NULL, 'sharukeerthi2218@gmail.com', NULL, NULL, 'https://graph.facebook.com/2017370431711177/picture', NULL, NULL, NULL, 0, 0, 0, 0, '2019-02-09 12:38:33', '2019-02-09 12:38:40'),
(119, NULL, NULL, 'Keerthiga Jeganathan', 'keerthiga', 'sha1$3aa21611$1$e628d75ca09a504063860e1bb3691c0aeadf2588', 'keerthiprajith@gmail.com', '+91', '9944996940', 'default.png', 26, 'India', 'Bangalore', 0, 0, 0, 0, '2019-02-09 15:26:52', '2019-02-09 15:36:33'),
(120, NULL, NULL, 'Zack', 'zack@0007', 'sha1$593ea8ae$1$5ed71e06d7a573fd4081b1ff0fa4e7e6b003188f', 'zack07@gmail.com', '+91', '7404217391', 'default.png', 0, NULL, NULL, 0, 0, 0, 1, '2019-02-13 10:26:01', '2019-02-13 12:30:19'),
(121, NULL, NULL, 'Bombay Velvet is a good movie', 'bombay', 'sha1$864bb38d$1$677430f30c17ac1b4e1d1409d83136b2f21cae38', 'bombay@gmail.com', '+93', '43233213123', 'default.png', 0, NULL, NULL, 0, 0, 0, 0, '2019-02-18 11:11:53', '2019-02-18 11:12:13'),
(122, 756279031374151, '0', 'Mukesh Rana', 'userV08Ny', NULL, 'Mukesh@facebook.com', NULL, NULL, 'https://graph.facebook.com/756279031374151/picture??width=414&height=362', NULL, NULL, NULL, 0, 0, 0, 0, '2019-02-18 11:53:01', '2019-02-18 11:53:36'),
(123, 0, '111109847207146558362', 'testaativa@gmail.com', 'userJipUf', NULL, 'testaativa@gmail.com', NULL, NULL, '', NULL, NULL, NULL, 0, 0, 0, 0, '2019-02-25 10:41:49', '2019-02-25 10:42:02'),
(124, NULL, NULL, 'test', 'heyhey', 'sha1$b38a3e5e$1$1673b5ab65d68f2f3088bdb3a58ec488b4959156', 'hey@test.com', '+91', '982789006', 'default.png', 23, 'India', 'Jalandhar', 0, 0, 0, 0, '2019-02-25 11:26:30', '2019-02-25 11:26:30'),
(125, NULL, NULL, 'test', 'heyheyhest', 'sha1$76e5dd2f$1$8d2472e91dc68063c776a8c087bd88e099701693', 'nitya@aativa.com', '+91', '982789001', 'default.png', 23, 'India', 'Jalandhar', 0, 0, 0, 0, '2019-02-25 12:22:50', '2019-02-28 13:00:00'),
(126, 0, '105414160537606349126', 'Mukesh Rana', 'usersJMvu', NULL, 'yolo.mukeshrana@gmail.com', NULL, NULL, '', NULL, NULL, NULL, 0, 0, 0, 0, '2019-02-27 07:10:20', '2019-03-04 08:40:00'),
(127, NULL, NULL, 'Mike', 'mike123', 'sha1$5afe24d7$1$df6e5ee1d6d36943a43f7110ffe7236437dc793d', 'mike@gmail.con', '+971', '85580313131', 'default.png', 0, NULL, NULL, 0, 0, 0, 1, '2019-02-27 12:50:45', '2019-02-27 12:54:07'),
(128, NULL, NULL, 'Donald', 'donald09', 'sha1$fbccb531$1$59bd78d2ddab2d9f853d4b9bad3482ed4d760ccd', 'donald@gmail.com', '+971', '8558031336', 'default.png', 55, 'Chan', 'Bsbs', 0, 0, 0, 0, '2019-02-28 11:52:53', '2019-02-28 12:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_blocked`
--

CREATE TABLE `user_blocked` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_blocked`
--

INSERT INTO `user_blocked` (`id`, `user_id`, `blocked_user_id`, `created_at`, `updated_at`) VALUES
(2, 7, 18, '2018-10-27 09:09:10', '2018-10-27 09:09:10'),
(3, 3, 101, '2018-12-08 19:43:52', '2018-12-08 19:43:52'),
(5, 3, 102, '2018-12-16 19:39:00', '2018-12-16 19:39:00'),
(6, 3, 89, '2018-12-16 19:39:36', '2018-12-16 19:39:36'),
(7, 90, 87, '2018-12-20 07:41:36', '2018-12-20 07:41:36'),
(9, 120, 90, '2019-02-13 11:50:05', '2019-02-13 11:50:05'),
(10, 120, 106, '2019-02-13 11:50:43', '2019-02-13 11:50:43'),
(11, 120, 76, '2019-02-13 11:51:07', '2019-02-13 11:51:07'),
(12, 120, 102, '2019-02-13 11:52:11', '2019-02-13 11:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_conversation`
--

CREATE TABLE `user_conversation` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_conversation`
--

INSERT INTO `user_conversation` (`id`, `group_id`, `user1_id`, `user2_id`, `created_at`, `updated_at`) VALUES
(153, 58, NULL, NULL, '2019-02-18 10:51:38', '2019-02-18 10:51:38'),
(154, NULL, 79, 3, '2019-02-18 11:00:20', '2019-02-18 11:00:20'),
(155, 59, NULL, NULL, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(156, NULL, 121, 79, '2019-02-18 11:12:04', '2019-02-18 11:12:04'),
(157, NULL, 79, 78, '2019-02-18 11:40:28', '2019-02-18 11:40:28'),
(158, NULL, 76, 79, '2019-02-26 10:30:49', '2019-02-26 10:30:49'),
(159, NULL, 125, 3, '2019-02-26 13:00:57', '2019-02-26 13:00:57'),
(160, NULL, 125, 76, '2019-02-26 17:38:17', '2019-02-26 17:38:17'),
(161, NULL, 127, 78, '2019-02-27 12:52:08', '2019-02-27 12:52:08'),
(162, NULL, 126, 3, '2019-02-28 06:43:47', '2019-02-28 06:43:47'),
(163, 60, NULL, NULL, '2019-02-28 10:43:45', '2019-02-28 10:43:45'),
(164, NULL, 128, 102, '2019-02-28 11:53:34', '2019-02-28 11:53:34'),
(165, 61, NULL, NULL, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(166, NULL, 3, 77, '2019-02-28 12:51:31', '2019-02-28 12:51:31'),
(167, NULL, 79, 0, '2019-02-28 13:00:40', '2019-02-28 13:00:40'),
(168, NULL, 97, 109, '2019-02-28 14:46:42', '2019-02-28 14:46:42'),
(169, NULL, 108, 88, '2019-03-02 17:31:51', '2019-03-02 17:31:51'),
(170, NULL, 3, 76, '2019-03-04 07:02:06', '2019-03-04 07:02:06'),
(171, NULL, 126, 79, '2019-03-04 08:34:19', '2019-03-04 08:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_followers`
--

CREATE TABLE `user_followers` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'blocked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_followers`
--

INSERT INTO `user_followers` (`id`, `follower_id`, `followed_id`, `status`, `created_at`, `updated_at`) VALUES
(68, 90, 87, 0, '2018-12-19 12:36:05', '2018-12-19 12:36:05'),
(69, 87, 90, 0, '2018-12-19 12:36:43', '2018-12-19 12:36:43'),
(70, 107, 109, 0, '2018-12-20 03:55:20', '2018-12-20 03:55:20'),
(72, 109, 107, 0, '2018-12-24 13:39:50', '2018-12-24 13:39:50'),
(73, 115, 114, 0, '2019-01-25 10:21:05', '2019-01-25 10:21:05'),
(74, 114, 115, 0, '2019-01-25 10:21:16', '2019-01-25 10:21:16'),
(75, 3, 79, 0, '2019-01-26 18:37:18', '2019-01-26 18:37:18'),
(76, 97, 117, 0, '2019-02-10 18:48:39', '2019-02-10 18:48:39'),
(77, 97, 109, 0, '2019-02-12 15:22:07', '2019-02-12 15:22:07'),
(78, 106, 120, 0, '2019-02-13 10:31:39', '2019-02-13 10:31:39'),
(79, 106, 120, 0, '2019-02-13 10:47:39', '2019-02-13 10:47:39'),
(80, 120, 106, 0, '2019-02-13 10:48:44', '2019-02-13 10:48:44'),
(82, 77, 3, 0, '2019-02-21 10:52:58', '2019-02-21 10:52:58'),
(83, 3, 77, 0, '2019-02-21 10:53:13', '2019-02-21 10:53:13'),
(84, 124, 3, 0, '2019-02-25 11:27:53', '2019-02-25 11:27:53'),
(85, 3, 126, 0, '2019-02-28 13:21:54', '2019-02-28 13:21:54'),
(86, 126, 3, 0, '2019-02-28 13:22:47', '2019-02-28 13:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_follow_requests`
--

CREATE TABLE `user_follow_requests` (
  `id` int(11) NOT NULL,
  `request_user_id` int(11) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL COMMENT 'status of request-pending/cancelled/accepted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_follow_requests`
--

INSERT INTO `user_follow_requests` (`id`, `request_user_id`, `receive_user_id`, `status`, `created_at`, `updated_at`) VALUES
(148, 103, 88, 1, '2018-12-06 17:09:08', '2018-12-06 17:09:08'),
(149, 3, 78, 1, '2018-12-08 17:36:15', '2018-12-08 17:36:15'),
(150, 3, 102, 1, '2018-12-15 20:16:38', '2018-12-15 20:16:38'),
(154, 107, 3, 1, '2018-12-18 14:04:55', '2018-12-18 14:04:55'),
(155, 107, 86, 1, '2018-12-18 14:05:46', '2018-12-18 14:05:46'),
(156, 107, 88, 1, '2018-12-18 14:06:18', '2018-12-18 14:06:18'),
(157, 107, 80, 1, '2018-12-18 14:12:08', '2018-12-18 14:12:08'),
(158, 90, 87, 4, '2018-12-19 12:35:42', '2018-12-19 12:36:05'),
(159, 87, 90, 4, '2018-12-19 12:36:08', '2018-12-19 12:36:43'),
(160, 107, 109, 4, '2018-12-19 18:33:54', '2018-12-20 03:55:20'),
(161, 97, 109, 4, '2018-12-19 19:38:56', '2019-02-12 15:22:07'),
(163, 108, 107, 1, '2018-12-20 05:12:30', '2018-12-20 05:12:30'),
(164, 109, 107, 4, '2018-12-20 09:08:00', '2018-12-24 13:39:50'),
(165, 113, 107, 1, '2018-12-28 08:21:12', '2018-12-28 08:21:12'),
(166, 115, 3, 1, '2019-01-25 10:20:23', '2019-01-25 10:20:23'),
(167, 114, 3, 1, '2019-01-25 10:20:32', '2019-01-25 10:20:32'),
(168, 115, 114, 4, '2019-01-25 10:20:58', '2019-01-25 10:21:05'),
(169, 114, 115, 4, '2019-01-25 10:21:11', '2019-01-25 10:21:16'),
(170, 3, 79, 4, '2019-01-26 18:36:33', '2019-01-26 18:37:18'),
(171, 79, 3, 1, '2019-01-26 18:37:21', '2019-01-26 18:37:21'),
(172, 116, 3, 1, '2019-02-01 06:16:41', '2019-02-01 06:16:41'),
(173, 116, 90, 1, '2019-02-01 09:42:09', '2019-02-01 09:42:09'),
(174, 97, 117, 4, '2019-02-09 11:46:53', '2019-02-10 18:48:39'),
(175, 119, 113, 1, '2019-02-09 15:35:06', '2019-02-09 15:35:06'),
(176, 97, 118, 1, '2019-02-10 16:19:53', '2019-02-10 16:19:53'),
(177, 108, 88, 1, '2019-02-11 07:17:42', '2019-02-11 07:17:42'),
(179, 108, 113, 1, '2019-02-11 07:18:01', '2019-02-11 07:18:01'),
(181, 113, 86, 1, '2019-02-13 05:47:31', '2019-02-13 05:47:31'),
(182, 120, 116, 1, '2019-02-13 10:30:33', '2019-02-13 10:30:33'),
(186, 106, 120, 4, '2019-02-13 10:33:59', '2019-02-13 10:47:39'),
(187, 120, 106, 4, '2019-02-13 10:48:38', '2019-02-13 10:48:44'),
(188, 120, 90, 1, '2019-02-13 11:41:29', '2019-02-13 11:41:29'),
(189, 106, 102, 1, '2019-02-13 11:56:22', '2019-02-13 11:56:22'),
(190, 121, 79, 1, '2019-02-18 11:12:16', '2019-02-18 11:12:16'),
(192, 77, 3, 4, '2019-02-21 10:52:42', '2019-02-21 10:52:58'),
(193, 3, 77, 4, '2019-02-21 10:53:07', '2019-02-21 10:53:13'),
(194, 124, 3, 4, '2019-02-25 11:27:23', '2019-02-25 11:27:53'),
(195, 128, 90, 1, '2019-02-28 11:56:54', '2019-02-28 11:56:54'),
(196, 3, 126, 4, '2019-02-28 13:21:46', '2019-02-28 13:21:54'),
(197, 126, 3, 4, '2019-02-28 13:22:35', '2019-02-28 13:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `admin_id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(58, 3, 'Trst', '1548863927default.jpg', '2019-02-18 10:51:38', '2019-02-18 10:51:38'),
(59, 79, 'Burger', '1548863927default.jpg', '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(60, 79, 'Boomerrangb', '1551350624image.jpg', '2019-02-28 10:43:45', '2019-03-03 19:54:16'),
(61, 128, 'Abc', '1548863927default.jpg', '2019-02-28 11:54:20', '2019-02-28 11:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_members`
--

CREATE TABLE `user_group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `notification_enabled` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group_members`
--

INSERT INTO `user_group_members` (`id`, `group_id`, `user_id`, `is_admin`, `notification_enabled`, `created_at`, `updated_at`) VALUES
(219, 58, 79, 0, 1, '2019-02-18 10:51:38', '2019-02-18 10:51:38'),
(220, 58, 3, 1, 1, '2019-02-18 10:51:38', '2019-02-18 10:51:38'),
(221, 59, 3, 0, 1, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(222, 59, 76, 0, 1, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(223, 59, 77, 0, 1, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(224, 59, 79, 1, 1, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(229, 61, 77, 0, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(230, 61, 78, 0, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(231, 61, 79, 0, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(232, 61, 80, 0, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(233, 61, 128, 1, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(242, 60, 3, 0, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46'),
(243, 60, 79, 1, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46'),
(244, 60, 78, 0, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46'),
(245, 60, 122, 0, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46'),
(246, 60, 126, 0, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46'),
(247, 60, 76, 0, 1, '2019-03-03 19:56:46', '2019-03-03 19:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_hide_posts`
--

CREATE TABLE `user_hide_posts` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_hide_posts`
--

INSERT INTO `user_hide_posts` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 7, 17, '2018-10-25 09:39:34', '2018-10-25 15:09:34'),
(2, 6, 17, '2018-10-25 09:54:26', '2018-10-25 15:24:26'),
(3, 24, 77, '2018-11-03 05:11:33', '2018-11-03 05:11:33'),
(4, 139, 3, '2018-12-01 10:38:24', '2018-12-01 10:38:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_invite`
--

CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `mood_id` int(11) NOT NULL DEFAULT '1',
  `message` varchar(2555) COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT ' 1 : text, 2 :image,3:post',
  `timezone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `deleted_by_user1_id` int(11) DEFAULT '0',
  `deleted_by_user2_id` int(11) NOT NULL DEFAULT '0',
  `for_group` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_messages`
--

INSERT INTO `user_messages` (`id`, `conversation_id`, `sender_id`, `mood_id`, `message`, `image`, `post_id`, `is_read`, `type`, `timezone`, `is_deleted`, `deleted_by_user1_id`, `deleted_by_user2_id`, `for_group`, `created_at`, `updated_at`) VALUES
(928, 149, 79, 1, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 09:40:28', '2019-02-18 11:06:05'),
(929, 153, 3, 1, '', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 1, '2019-02-18 10:51:38', '2019-02-18 10:51:38'),
(930, 155, 79, 1, '', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 1, '2019-02-18 11:05:27', '2019-02-18 11:05:27'),
(931, 155, 79, 1, 'Hi', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:05:45', '2019-02-18 11:05:46'),
(932, 149, 79, 1, 'Ge', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:06:04', '2019-02-18 11:06:05'),
(933, 149, 79, 1, 'Shared a post', NULL, 254, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:08:42', '2019-02-18 11:08:43'),
(934, 156, 121, 1, 'Hi bro', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:12:11', '2019-02-18 11:12:11'),
(935, 156, 79, 1, 'Hi', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:13:10', '2019-02-18 11:13:10'),
(936, 149, 79, 1, 'Shared a post', NULL, 254, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:40:20', '2019-02-18 11:40:21'),
(937, 157, 79, 1, 'Shared a post', NULL, 254, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:40:28', '2019-02-18 11:40:28'),
(938, 157, 79, 1, 'Shared a post', NULL, 232, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:42:21', '2019-02-18 11:42:22'),
(939, 149, 79, 1, 'Sd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-18 11:47:40', '2019-02-18 11:47:40'),
(940, 149, 3, 1, 'hey', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-21 12:11:54', '2019-02-21 12:11:55'),
(941, 149, 3, 2, 'hey', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-21 12:14:18', '2019-02-21 12:14:19'),
(942, 149, 79, 1, 'Hey', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 09:45:55', '2019-02-26 09:45:55'),
(943, 149, 79, 2, 'How are you ?', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 09:46:16', '2019-02-26 09:46:16'),
(944, 158, 76, 3, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 10:30:54', '2019-02-28 13:16:01'),
(945, 149, 3, 2, 'Testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 10:36:22', '2019-02-26 10:36:23'),
(946, 159, 125, 1, 'Shared a post', NULL, 166, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 13:01:52', '2019-02-28 12:59:51'),
(947, 159, 125, 1, 'Shared a post', NULL, 144, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 17:29:34', '2019-02-28 12:59:51'),
(948, 160, 125, 1, 'Shared a post', NULL, 152, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-26 17:38:16', '2019-02-26 17:38:17'),
(949, 161, 127, 3, 'i test', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-27 12:52:23', '2019-02-27 12:52:23'),
(950, 161, 127, 3, 'I\nTest', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-27 12:52:50', '2019-02-27 12:52:51'),
(951, 161, 127, 3, 'Test', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-27 12:53:45', '2019-02-27 12:53:45'),
(952, 161, 127, 3, 'Gyuugg', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-27 12:54:11', '2019-02-27 12:54:12'),
(953, 162, 126, 3, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 06:43:49', '2019-02-28 13:12:40'),
(954, 162, 126, 3, 'Vjj', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 09:51:57', '2019-02-28 13:12:40'),
(955, 162, 126, 3, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:01:20', '2019-02-28 13:12:40'),
(956, 162, 126, 3, 'Hdkk', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:01:22', '2019-02-28 13:12:40'),
(957, 162, 126, 6, 'Hela', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:01:41', '2019-02-28 13:12:40'),
(958, 162, 126, 6, 'Jssk', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:01:45', '2019-02-28 13:12:40'),
(959, 163, 79, 1, '', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 1, '2019-02-28 10:43:45', '2019-02-28 10:43:45'),
(960, 163, 79, 2, 'Hi', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:43:50', '2019-02-28 10:43:50'),
(961, 158, 79, 1, 'Shared a post', NULL, 292, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:44:07', '2019-02-28 10:44:07'),
(962, 158, 79, 1, 'Shared a post', NULL, 277, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 10:50:58', '2019-02-28 10:50:59'),
(963, 159, 3, 1, 'Shared a post', NULL, 278, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:00:27', '2019-02-28 11:00:27'),
(964, 159, 3, 2, 'Shared a post', NULL, 278, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:07:32', '2019-02-28 11:07:32'),
(965, 164, 128, 4, 'Test', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:53:39', '2019-02-28 11:53:40'),
(966, 164, 128, 4, 'Message', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:53:43', '2019-02-28 11:53:44'),
(967, 165, 128, 1, '', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 1, '2019-02-28 11:54:20', '2019-02-28 11:54:20'),
(968, 165, 128, 4, 'Test message', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:54:30', '2019-02-28 11:54:31'),
(969, 165, 128, 2, 'Hi', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:58:17', '2019-02-28 11:58:17'),
(970, 165, 128, 2, 'J', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 11:58:20', '2019-02-28 11:58:20'),
(971, 158, 76, 3, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:33:57', '2019-02-28 13:16:01'),
(972, 158, 76, 3, 'Sadsad', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:34:25', '2019-02-28 13:16:01'),
(973, 158, 76, 3, 'QWERTY', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:35:14', '2019-02-28 13:16:01'),
(974, 158, 76, 3, 'Qwerty', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:37:08', '2019-02-28 13:16:01'),
(975, 158, 76, 3, 'Qw', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:39:56', '2019-02-28 13:16:01'),
(976, 158, 76, 3, 'Asdasdasd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:40:28', '2019-02-28 13:16:01'),
(977, 162, 126, 6, 'Hsis', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:40:40', '2019-02-28 13:12:40'),
(978, 162, 126, 6, 'Hsjd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:40:45', '2019-02-28 13:12:40'),
(979, 159, 3, 2, 'Shared a post', NULL, 228, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:40:52', '2019-02-28 12:40:53'),
(980, 158, 76, 3, 'Dada', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:42:39', '2019-02-28 13:16:01'),
(981, 158, 76, 3, 'Sdsadwd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:43:28', '2019-02-28 13:16:01'),
(982, 158, 76, 3, 'Dasd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:45:33', '2019-02-28 13:16:01'),
(983, 158, 76, 3, 'Sdas', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:45:38', '2019-02-28 13:16:01'),
(984, 158, 76, 3, 'Asdsa', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:45:52', '2019-02-28 13:16:01'),
(985, 158, 76, 3, 'Dadwqw', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:51:13', '2019-02-28 13:16:01'),
(986, 166, 3, 2, 'Shared a post', NULL, 277, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:51:30', '2019-02-28 12:51:31'),
(987, 159, 3, 2, 'Hey', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:59:09', '2019-02-28 12:59:10'),
(988, 159, 125, 2, 'Shsheheheh', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:59:50', '2019-02-28 12:59:51'),
(989, 159, 125, 2, 'Chi chi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 12:59:54', '2019-02-28 12:59:55'),
(990, 162, 126, 1, 'Dfbb', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:04:51', '2019-02-28 13:12:40'),
(991, 162, 3, 2, 'Hey', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:03', '2019-02-28 13:18:42'),
(992, 162, 3, 2, 'Hey', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:04', '2019-02-28 13:18:42'),
(993, 162, 3, 2, 'Hey', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:05', '2019-02-28 13:18:42'),
(994, 162, 3, 1, 'Checj', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:38', '2019-02-28 13:18:42'),
(995, 162, 3, 1, 'Check', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:40', '2019-02-28 13:18:42'),
(996, 162, 3, 1, 'Check', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:07:41', '2019-02-28 13:18:42'),
(997, 162, 3, 4, 'Calm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:08:12', '2019-02-28 13:18:42'),
(998, 162, 3, 4, 'Calm mood', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:08:14', '2019-02-28 13:18:42'),
(999, 162, 3, 5, 'Mood', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:08:39', '2019-02-28 13:18:42'),
(1000, 162, 3, 5, 'Neutral', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:08:43', '2019-02-28 13:18:42'),
(1001, 162, 3, 5, 'Neutral', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:08:45', '2019-02-28 13:18:42'),
(1002, 162, 3, 3, 'Romantic mood', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:09:25', '2019-02-28 13:18:42'),
(1003, 162, 3, 3, 'Testing', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:09:28', '2019-02-28 13:18:42'),
(1004, 162, 3, 6, 'Motivational', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:10:00', '2019-02-28 13:18:42'),
(1005, 162, 3, 6, 'Motivational', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:10:04', '2019-02-28 13:18:42'),
(1006, 162, 126, 3, 'Hieb', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:25', '2019-02-28 13:12:40'),
(1007, 162, 126, 3, 'Neke', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:26', '2019-02-28 13:12:40'),
(1008, 162, 126, 6, 'Jdkdkd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:39', '2019-02-28 13:12:40'),
(1009, 162, 126, 6, 'Dkdkkdd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:40', '2019-02-28 13:12:41'),
(1010, 162, 126, 4, 'Jsjsis', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:54', '2019-02-28 13:12:54'),
(1011, 162, 126, 4, 'Nekks', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:12:55', '2019-02-28 13:12:55'),
(1012, 158, 76, 2, 'Qwert', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:15:25', '2019-02-28 13:16:01'),
(1013, 158, 76, 2, 'Sadsad', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:15:31', '2019-02-28 13:16:01'),
(1014, 158, 76, 2, 'Dasdqw', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:16:01', '2019-02-28 13:16:01'),
(1015, 158, 76, 2, 'Dwqd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:16:26', '2019-02-28 13:16:27'),
(1016, 158, 79, 2, 'Hey', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:16:33', '2019-02-28 13:16:34'),
(1017, 162, 3, 1, 'Sent a picture', '1551359922photo_editor_ds_1551359891735.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:18:42', '2019-02-28 13:18:42'),
(1018, 158, 76, 2, 'Asd', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:20:37', '2019-02-28 13:20:38'),
(1019, 162, 3, 1, 'Sent a picture', '1551360067photo_editor_ds_1551360061793.jpg', NULL, 0, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:21:07', '2019-02-28 13:21:07'),
(1020, 162, 3, 6, 'Hey', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:21:13', '2019-02-28 13:21:13'),
(1021, 166, 3, 6, 'Shared a post', NULL, 232, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:21:27', '2019-02-28 13:21:27'),
(1022, 162, 3, 6, 'Shared a post', NULL, 232, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:23:24', '2019-02-28 13:23:24'),
(1023, 158, 76, 2, 'Wqeqw', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:24:28', '2019-02-28 13:24:28'),
(1024, 162, 126, 4, 'Shared a post', NULL, 295, 0, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:28:35', '2019-02-28 13:28:36'),
(1025, 158, 76, 2, 'G', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 13:34:11', '2019-03-03 18:53:44'),
(1026, 158, 76, 2, 'Shared a post', NULL, 145, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-02-28 14:02:16', '2019-03-03 18:53:44'),
(1027, 168, 97, 2, 'Rududu', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-02-28 14:46:47', '2019-02-28 14:46:47'),
(1028, 168, 97, 2, 'Isiwiw', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-02-28 14:46:48', '2019-02-28 14:46:49'),
(1029, 168, 97, 1, 'Hehe', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-02-28 14:47:01', '2019-02-28 14:47:01'),
(1030, 168, 97, 6, 'Vgh', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-02-28 14:47:14', '2019-02-28 14:47:15'),
(1031, 168, 97, 6, 'Yeywjejejejejejeje berhrbebe', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-02-28 14:47:27', '2019-02-28 14:47:28'),
(1032, 169, 108, 6, 'Hi', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-03-02 17:31:56', '2019-03-02 17:31:56'),
(1033, 169, 108, 1, 'Hi', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-03-02 17:32:19', '2019-03-02 17:32:20'),
(1034, 158, 79, 2, 'Shared a post', NULL, 154, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:38:25', '2019-03-03 18:46:15'),
(1035, 158, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:38:54', '2019-03-03 18:53:44'),
(1036, 158, 79, 1, 'Sent a picture', '1551638774image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:46:14', '2019-03-03 18:46:15'),
(1037, 158, 79, 1, 'Sent a picture', '1551638833image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:47:13', '2019-03-03 18:47:14'),
(1038, 158, 79, 1, 'Sent a picture', '1551638847image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:47:27', '2019-03-03 18:47:27'),
(1039, 158, 79, 1, 'Sent a picture', '1551638875image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:47:55', '2019-03-03 18:47:55'),
(1040, 158, 79, 1, 'Sent a picture', '1551639182image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:02', '2019-03-03 18:53:03'),
(1041, 158, 79, 1, 'Sent a picture', '1551639195image.jpg', NULL, 1, 2, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:15', '2019-03-03 18:53:15'),
(1042, 158, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:43', '2019-03-03 18:53:44'),
(1043, 158, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:45', '2019-03-03 18:53:46'),
(1044, 158, 76, 2, 'Mmm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:52', '2019-03-03 18:53:52'),
(1045, 158, 76, 2, 'Ojo', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:53:56', '2019-03-03 18:53:57'),
(1046, 158, 76, 2, 'Iiojioj', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:07', '2019-03-03 18:54:40'),
(1047, 158, 76, 2, 'Ih', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:23', '2019-03-03 18:54:40'),
(1048, 158, 76, 2, 'H', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:30', '2019-03-03 18:54:40'),
(1049, 158, 76, 2, 'H', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:40', '2019-03-03 18:54:40'),
(1050, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:43', '2019-03-03 18:54:44'),
(1051, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:46', '2019-03-03 18:54:46'),
(1052, 158, 76, 2, 'B', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:54:48', '2019-03-03 18:54:48'),
(1053, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:56:49', '2019-03-03 18:56:50'),
(1054, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:56:55', '2019-03-03 18:56:56'),
(1055, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:57:02', '2019-03-03 18:57:17'),
(1056, 158, 76, 2, 'Nb', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:57:09', '2019-03-03 18:57:17'),
(1057, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:57:16', '2019-03-03 18:57:17'),
(1058, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:57:20', '2019-03-03 18:57:21'),
(1059, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:57:47', '2019-03-03 19:00:01'),
(1060, 158, 76, 2, 'H', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:59:41', '2019-03-03 19:00:01'),
(1061, 158, 76, 2, 'J', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 18:59:54', '2019-03-03 19:00:01'),
(1062, 158, 76, 2, 'Mm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:00:01', '2019-03-03 19:00:01'),
(1063, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:00:05', '2019-03-03 19:00:05'),
(1064, 158, 76, 2, 'B', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:00:07', '2019-03-03 19:00:07'),
(1065, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:00:10', '2019-03-03 19:04:57'),
(1066, 158, 76, 2, 'Shared a post', NULL, 154, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:04:57', '2019-03-03 19:04:57'),
(1067, 158, 79, 2, 'Shared a post', NULL, 156, 1, 3, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:18:12', '2019-03-03 19:37:13'),
(1068, 158, 79, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:37:12', '2019-03-03 19:37:13'),
(1069, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:37:28', '2019-03-03 19:37:39'),
(1070, 158, 76, 2, 'Mm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:37:39', '2019-03-03 19:37:39'),
(1071, 158, 76, 2, 'Mm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:37:45', '2019-03-03 19:37:46'),
(1072, 158, 76, 2, 'Mm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:44:30', '2019-03-03 19:44:31'),
(1073, 158, 76, 2, 'Nn', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:44:36', '2019-03-03 19:44:37'),
(1074, 158, 76, 2, 'Nm', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:44:45', '2019-03-03 19:45:05'),
(1075, 158, 76, 2, 'Mnn', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:45:04', '2019-03-03 19:45:05'),
(1076, 158, 76, 2, '1', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:48:53', '2019-03-03 19:48:54'),
(1077, 158, 76, 2, '2', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:48:56', '2019-03-03 19:48:56'),
(1078, 158, 76, 2, '3', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:01', '2019-03-03 19:49:01'),
(1079, 158, 76, 2, '4', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:06', '2019-03-03 19:49:07'),
(1080, 158, 76, 2, '5', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:08', '2019-03-03 19:49:09'),
(1081, 158, 76, 2, '6', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:10', '2019-03-03 19:49:10'),
(1082, 158, 76, 2, '7', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:12', '2019-03-03 19:49:12'),
(1083, 158, 76, 2, '8', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:16', '2019-03-03 19:49:28'),
(1084, 158, 76, 2, '9', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:27', '2019-03-03 19:49:28'),
(1085, 158, 76, 2, '10', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:38', '2019-03-03 19:49:38'),
(1086, 158, 76, 2, 'M', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:46', '2019-03-03 19:49:47'),
(1087, 158, 76, 2, 'N', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:48', '2019-03-03 19:49:48'),
(1088, 158, 76, 2, 'B', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:49:49', '2019-03-03 19:49:50'),
(1089, 163, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:50:03', '2019-03-03 19:50:13'),
(1090, 163, 76, 2, 'Uh', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:50:12', '2019-03-03 19:50:13'),
(1091, 163, 79, 2, 'Hi', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-03 19:56:12', '2019-03-03 19:56:12'),
(1092, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:51:29', '2019-03-04 06:51:29'),
(1093, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:52:56', '2019-03-04 06:52:57'),
(1094, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:53:35', '2019-03-04 06:53:35'),
(1095, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:54:17', '2019-03-04 06:54:18'),
(1096, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:54:41', '2019-03-04 06:54:42'),
(1097, 154, 3, 6, 'testing', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 06:55:49', '2019-03-04 06:55:50'),
(1098, 154, 3, 1, 'Happy mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:04:31', '2019-03-04 07:04:31'),
(1099, 154, 3, 1, 'Happy mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:04:34', '2019-03-04 07:04:34'),
(1100, 154, 3, 1, 'Happy mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:04:36', '2019-03-04 07:04:37'),
(1101, 154, 3, 2, 'Funny mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:05:17', '2019-03-04 07:05:17'),
(1102, 154, 3, 2, 'Funny mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:05:19', '2019-03-04 07:05:19'),
(1103, 154, 3, 2, 'Funny mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:05:21', '2019-03-04 07:05:22'),
(1104, 162, 3, 2, 'Testing test', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:05:54', '2019-03-04 07:05:54'),
(1105, 154, 3, 3, 'Romantic mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:06:12', '2019-03-04 07:06:13'),
(1106, 154, 3, 3, 'Romantic mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:06:15', '2019-03-04 07:06:15'),
(1107, 154, 3, 3, 'Romantic mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:06:17', '2019-03-04 07:06:18'),
(1108, 162, 3, 3, 'Testing mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:06:32', '2019-03-04 07:06:32'),
(1109, 154, 3, 4, 'Calm', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:09', '2019-03-04 07:07:09'),
(1110, 154, 3, 4, 'Calm', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:10', '2019-03-04 07:07:10'),
(1111, 154, 3, 4, 'Calm', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:11', '2019-03-04 07:07:11'),
(1112, 162, 3, 4, 'Calm', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:23', '2019-03-04 07:07:24'),
(1113, 162, 3, 4, 'Calm mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:27', '2019-03-04 07:07:28'),
(1114, 162, 3, 4, 'Calm mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:07:29', '2019-03-04 07:07:30'),
(1115, 154, 3, 5, 'Neutral koody', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:02', '2019-03-04 07:08:02'),
(1116, 154, 3, 5, 'Neutral mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:06', '2019-03-04 07:08:07'),
(1117, 154, 3, 5, 'Neutral mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:10', '2019-03-04 07:08:10'),
(1118, 162, 3, 5, 'Neutral mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:19', '2019-03-04 07:08:20'),
(1119, 162, 3, 5, 'Neutral mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:22', '2019-03-04 07:08:23'),
(1120, 162, 3, 6, 'Motivational', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:54', '2019-03-04 07:08:55'),
(1121, 162, 3, 6, 'Motivational', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:57', '2019-03-04 07:08:58'),
(1122, 162, 3, 6, 'Motivational', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:08:59', '2019-03-04 07:09:00'),
(1123, 154, 3, 6, 'Motivational', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:09:09', '2019-03-04 07:09:10'),
(1124, 154, 3, 6, 'Motivational mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:09:13', '2019-03-04 07:09:14'),
(1125, 154, 3, 6, 'Motivational mood', NULL, NULL, 0, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 07:09:18', '2019-03-04 07:09:19'),
(1126, 158, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:32:05', '2019-03-04 08:32:06'),
(1127, 163, 76, 2, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:32:16', '2019-03-04 08:32:16'),
(1128, 163, 76, 2, 'Oh', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:32:29', '2019-03-04 08:32:30'),
(1129, 171, 126, 4, 'Hi', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:34:35', '2019-03-04 08:37:05'),
(1130, 171, 126, 4, 'Hello', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:37:05', '2019-03-04 08:37:05'),
(1131, 171, 79, 2, 'Q', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:37:08', '2019-03-04 08:37:09'),
(1132, 171, 126, 5, 'Hellohjjjj', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:38:40', '2019-03-04 08:38:41'),
(1133, 171, 79, 1, 'Qwerty', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:38:58', '2019-03-04 08:38:58'),
(1134, 171, 79, 2, 'Mood', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 08:39:37', '2019-03-04 08:39:37'),
(1135, 163, 76, 2, 'q', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 09:16:35', '2019-03-04 09:16:36'),
(1136, 163, 76, 3, 'W', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 09:17:00', '2019-03-04 09:17:01'),
(1137, 163, 76, 3, 'E', NULL, NULL, 1, 1, 'Asia/Kolkata', 0, 0, 0, 0, '2019-03-04 09:17:01', '2019-03-04 09:17:02'),
(1138, 169, 108, 1, 'Turns', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-03-18 18:42:40', '2019-03-18 18:42:41'),
(1139, 169, 108, 5, 'Hi', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-03-18 18:43:04', '2019-03-18 18:43:04'),
(1140, 169, 108, 6, 'T', NULL, NULL, 0, 1, 'Asia/Dubai', 0, 0, 0, 0, '2019-03-18 18:43:27', '2019-03-18 18:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_mood`
--

CREATE TABLE `user_mood` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mood_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_mood`
--

INSERT INTO `user_mood` (`id`, `user_id`, `mood_id`, `created_at`, `updated_at`) VALUES
(1, 3, 6, '2018-10-15 12:36:19', '2019-03-04 07:08:45'),
(2, 18, 2, '2018-10-25 07:17:22', '2018-10-25 12:47:22'),
(3, 7, 1, '2018-10-25 07:43:51', '2018-10-30 09:34:01'),
(4, 17, 1, '2018-10-25 09:57:46', '2018-10-25 15:33:15'),
(6, 45, 1, '2018-11-01 08:32:11', '2018-11-01 08:33:47'),
(7, 46, 1, '2018-11-01 08:55:35', '2018-11-01 08:55:35'),
(8, 47, 1, '2018-11-01 09:27:49', '2018-11-01 09:27:49'),
(9, 48, 1, '2018-11-01 09:29:12', '2018-11-01 09:29:12'),
(10, 49, 1, '2018-11-01 09:34:45', '2018-11-01 09:34:45'),
(11, 50, 1, '2018-11-01 09:42:14', '2018-11-01 09:42:14'),
(12, 51, 1, '2018-11-01 09:51:25', '2018-11-01 09:51:25'),
(13, 52, 1, '2018-11-01 10:12:34', '2018-11-01 10:12:34'),
(14, 53, 1, '2018-11-01 10:51:36', '2018-11-01 10:51:36'),
(15, 54, 1, '2018-11-02 04:38:22', '2018-11-02 04:38:22'),
(16, 55, 1, '2018-11-02 04:44:05', '2018-11-02 04:44:05'),
(17, 56, 1, '2018-11-02 04:47:13', '2018-11-02 04:47:13'),
(18, 57, 1, '2018-11-02 05:15:23', '2018-11-02 05:15:23'),
(19, 58, 3, '2018-11-02 08:10:14', '2018-11-02 08:10:14'),
(20, 59, 3, '2018-11-02 08:12:12', '2018-11-02 08:12:12'),
(21, 60, 3, '2018-11-02 08:14:07', '2018-11-02 08:14:07'),
(22, 61, 3, '2018-11-02 08:26:24', '2018-11-02 08:26:24'),
(23, 62, 3, '2018-11-02 08:33:41', '2018-11-02 08:33:41'),
(24, 64, 3, '2018-11-02 09:30:31', '2018-11-02 09:30:31'),
(25, 66, 3, '2018-11-02 09:38:24', '2018-11-02 09:38:24'),
(26, 67, 3, '2018-11-02 09:41:07', '2018-11-02 09:41:07'),
(27, 69, 3, '2018-11-02 09:56:11', '2018-11-02 09:56:11'),
(28, 71, 3, '2018-11-02 10:08:18', '2018-11-02 10:08:18'),
(29, 74, 3, '2018-11-02 11:42:24', '2018-11-02 11:42:24'),
(30, 75, 3, '2018-11-02 11:43:05', '2018-11-02 11:43:05'),
(31, 76, 3, '2018-11-02 11:47:19', '2019-03-04 09:16:52'),
(32, 77, 2, '2018-11-02 12:19:19', '2019-02-21 11:50:02'),
(33, 78, 3, '2018-11-05 10:35:51', '2018-11-05 10:35:51'),
(34, 79, 2, '2018-11-07 17:41:33', '2019-03-04 08:39:28'),
(35, 80, 3, '2018-11-07 17:44:44', '2018-11-07 17:44:44'),
(36, 81, 3, '2018-11-08 13:44:15', '2018-11-08 13:44:15'),
(37, 82, 3, '2018-11-11 18:15:40', '2018-11-11 18:15:40'),
(38, 83, 1, '2018-11-12 12:26:21', '2018-11-12 12:52:13'),
(39, 84, 2, '2018-11-13 06:28:38', '2018-11-13 06:39:53'),
(40, 85, 3, '2018-11-15 11:53:28', '2018-11-22 07:34:10'),
(41, 86, 1, '2018-11-15 12:06:53', '2018-11-17 14:23:45'),
(42, 87, 2, '2018-11-16 08:39:18', '2018-12-04 18:07:46'),
(43, 88, 3, '2018-11-16 17:38:21', '2018-11-23 20:31:36'),
(44, 89, 1, '2018-11-18 15:15:02', '2018-12-06 16:25:31'),
(45, 90, 4, '2018-11-19 07:47:43', '2018-12-20 11:14:41'),
(46, 91, 3, '2018-11-24 12:40:10', '2018-11-24 12:40:10'),
(47, 92, 3, '2018-11-24 21:14:57', '2018-11-24 21:14:57'),
(48, 93, 3, '2018-11-26 06:05:50', '2018-11-26 12:11:43'),
(49, 94, 5, '2018-11-26 09:19:52', '2018-12-04 07:02:49'),
(50, 95, 3, '2018-11-27 13:15:26', '2018-11-27 13:15:26'),
(51, 96, 3, '2018-12-01 08:27:32', '2018-12-01 08:28:09'),
(52, 97, 6, '2018-12-01 08:30:16', '2019-02-28 14:47:08'),
(53, 98, 3, '2018-12-01 09:14:09', '2018-12-01 09:14:09'),
(54, 99, 3, '2018-12-01 09:44:10', '2018-12-01 09:44:10'),
(55, 100, 3, '2018-12-03 10:48:32', '2018-12-03 10:48:32'),
(56, 101, 3, '2018-12-03 11:02:56', '2018-12-04 13:13:04'),
(57, 102, 2, '2018-12-04 05:57:25', '2018-12-04 11:33:17'),
(58, 103, 2, '2018-12-06 17:01:53', '2018-12-13 10:52:21'),
(59, 104, 3, '2018-12-18 04:34:26', '2018-12-18 04:34:26'),
(60, 105, 3, '2018-12-18 11:17:34', '2018-12-18 11:17:34'),
(61, 106, 5, '2018-12-18 13:48:09', '2019-02-13 10:17:31'),
(62, 107, 4, '2018-12-18 13:57:24', '2018-12-26 12:52:15'),
(63, 108, 6, '2018-12-19 08:05:56', '2019-03-18 18:43:18'),
(64, 109, 1, '2018-12-19 10:12:27', '2019-02-19 16:05:14'),
(65, 110, 1, '2018-12-19 10:55:01', '2018-12-20 04:16:47'),
(66, 111, 3, '2018-12-27 04:56:42', '2018-12-27 04:56:42'),
(67, 112, 3, '2018-12-27 10:29:16', '2018-12-27 10:29:16'),
(68, 113, 2, '2018-12-28 08:20:15', '2019-02-15 07:40:56'),
(69, 114, 1, '2019-01-25 10:19:55', '2019-01-25 10:21:54'),
(70, 115, 2, '2019-01-25 10:19:55', '2019-01-29 11:14:23'),
(71, 116, 2, '2019-02-01 06:10:31', '2019-02-01 09:19:08'),
(72, 117, 1, '2019-02-09 11:37:40', '2019-02-09 11:39:29'),
(73, 118, 3, '2019-02-09 12:38:33', '2019-02-09 12:38:33'),
(74, 119, 6, '2019-02-09 15:26:52', '2019-02-21 04:42:39'),
(75, 120, 3, '2019-02-13 10:26:01', '2019-03-04 10:33:21'),
(76, 121, 3, '2019-02-18 11:11:53', '2019-02-18 11:11:53'),
(77, 122, 3, '2019-02-18 11:53:01', '2019-02-18 11:53:01'),
(78, 123, 3, '2019-02-25 10:41:49', '2019-02-25 10:41:49'),
(79, 124, 2, '2019-02-25 11:26:30', '2019-02-25 11:27:07'),
(80, 125, 2, '2019-02-25 12:22:50', '2019-02-26 09:32:47'),
(81, 126, 5, '2019-02-27 07:10:20', '2019-03-04 08:38:30'),
(82, 127, 3, '2019-02-27 12:50:45', '2019-02-27 12:50:45'),
(83, 128, 2, '2019-02-28 11:52:53', '2019-02-28 11:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_muted_conversations`
--

CREATE TABLE `user_muted_conversations` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  `action_by_id` int(11) DEFAULT NULL COMMENT 'user_id of user who liked or commented on the post',
  `type` int(11) NOT NULL COMMENT 'notification type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`id`, `user_id`, `post_id`, `follower_id`, `action_by_id`, `type`, `created_at`, `updated_at`) VALUES
(484, 3, 38, NULL, 77, 4, '2018-12-05 13:24:09', '2018-12-05 13:24:09'),
(485, 3, 38, NULL, 77, 3, '2018-12-05 13:24:47', '2018-12-05 13:24:47'),
(486, 101, 190, NULL, 77, 3, '2018-12-06 04:58:39', '2018-12-06 04:58:39'),
(488, 94, 180, NULL, 103, 4, '2018-12-06 17:02:21', '2018-12-06 17:02:21'),
(489, 88, NULL, 103, NULL, 1, '2018-12-06 17:09:08', '2018-12-06 17:09:08'),
(490, 93, 120, NULL, 97, 3, '2018-12-06 17:10:17', '2018-12-06 17:10:17'),
(491, 3, 191, NULL, 103, 4, '2018-12-06 17:11:05', '2018-12-06 17:11:05'),
(492, 101, 190, NULL, 103, 4, '2018-12-06 17:11:11', '2018-12-06 17:11:11'),
(495, 102, 188, NULL, 103, 3, '2018-12-08 17:36:14', '2018-12-08 17:36:14'),
(496, 78, NULL, 3, NULL, 1, '2018-12-08 17:36:15', '2018-12-08 17:36:15'),
(497, 102, 188, NULL, 3, 3, '2018-12-08 19:56:14', '2018-12-08 19:56:14'),
(500, 102, 172, NULL, 3, 4, '2018-12-08 20:22:07', '2018-12-08 20:22:07'),
(516, 102, 188, NULL, 3, 4, '2018-12-08 20:28:31', '2018-12-08 20:28:31'),
(517, 102, 183, NULL, 3, 3, '2018-12-08 20:29:58', '2018-12-08 20:29:58'),
(520, 102, 183, NULL, 103, 4, '2018-12-09 11:16:09', '2018-12-09 11:16:09'),
(521, 101, 190, NULL, 94, 4, '2018-12-10 14:06:56', '2018-12-10 14:06:56'),
(522, 102, 183, NULL, 97, 3, '2018-12-12 15:50:16', '2018-12-12 15:50:16'),
(523, 90, 113, NULL, 97, 4, '2018-12-12 15:50:34', '2018-12-12 15:50:34'),
(524, 97, 198, NULL, 3, 4, '2018-12-15 18:16:07', '2018-12-15 18:16:07'),
(525, 97, 198, NULL, 3, 3, '2018-12-15 18:16:12', '2018-12-15 18:16:12'),
(528, 102, 183, NULL, 3, 4, '2018-12-15 18:16:36', '2018-12-15 18:16:36'),
(529, 102, NULL, 3, NULL, 1, '2018-12-15 20:16:38', '2018-12-15 20:16:38'),
(531, 85, 136, NULL, 3, 4, '2018-12-16 20:20:50', '2018-12-16 20:20:50'),
(533, 94, 127, NULL, 3, 4, '2018-12-17 19:02:39', '2018-12-17 19:02:39'),
(537, 85, 108, NULL, 3, 4, '2018-12-17 19:39:20', '2018-12-17 19:39:20'),
(603, 102, 183, NULL, 93, 4, '2018-12-18 13:39:41', '2018-12-18 13:39:41'),
(604, 94, 180, NULL, 93, 4, '2018-12-18 13:39:43', '2018-12-18 13:39:43'),
(608, 85, 139, NULL, 90, 4, '2018-12-18 13:59:09', '2018-12-18 13:59:09'),
(609, 77, 73, NULL, 107, 4, '2018-12-18 14:04:09', '2018-12-18 14:04:09'),
(611, 77, 73, NULL, 107, 3, '2018-12-18 14:04:18', '2018-12-18 14:04:18'),
(613, 3, NULL, 107, NULL, 1, '2018-12-18 14:04:55', '2018-12-18 14:04:55'),
(614, 86, NULL, 107, NULL, 1, '2018-12-18 14:05:46', '2018-12-18 14:05:46'),
(615, 88, NULL, 107, NULL, 1, '2018-12-18 14:06:18', '2018-12-18 14:06:18'),
(616, 102, 183, NULL, 107, 3, '2018-12-18 14:09:33', '2018-12-18 14:09:33'),
(617, 80, NULL, 107, NULL, 1, '2018-12-18 14:12:08', '2018-12-18 14:12:08'),
(625, 3, 191, NULL, 107, 3, '2018-12-18 14:13:46', '2018-12-18 14:13:46'),
(627, 94, 180, NULL, 3, 4, '2018-12-18 14:22:21', '2018-12-18 14:22:21'),
(628, 3, 191, NULL, 107, 4, '2018-12-18 14:22:43', '2018-12-18 14:22:43'),
(631, 102, 183, NULL, 108, 4, '2018-12-19 08:08:21', '2018-12-19 08:08:21'),
(633, 102, 179, NULL, 108, 4, '2018-12-19 08:08:31', '2018-12-19 08:08:31'),
(634, 102, 168, NULL, 108, 4, '2018-12-19 08:08:35', '2018-12-19 08:08:35'),
(635, 89, 158, NULL, 108, 4, '2018-12-19 08:09:33', '2018-12-19 08:09:33'),
(636, 85, 139, NULL, 109, 4, '2018-12-19 10:21:44', '2018-12-19 10:21:44'),
(637, 94, 129, NULL, 109, 4, '2018-12-19 10:21:54', '2018-12-19 10:21:54'),
(638, 94, 129, NULL, 110, 4, '2018-12-19 10:55:48', '2018-12-19 10:55:48'),
(639, 94, 124, NULL, 90, 4, '2018-12-19 12:34:51', '2018-12-19 12:34:51'),
(640, 87, NULL, 90, NULL, 2, '2018-12-19 12:35:42', '2018-12-19 12:36:05'),
(641, 90, NULL, 87, NULL, 2, '2018-12-19 12:36:08', '2018-12-19 12:36:43'),
(643, 109, NULL, 107, NULL, 2, '2018-12-19 18:33:54', '2018-12-20 03:55:20'),
(647, 109, 201, NULL, 107, 3, '2018-12-19 18:34:26', '2018-12-19 18:34:26'),
(648, 85, 139, NULL, 107, 4, '2018-12-19 18:40:11', '2018-12-19 18:40:11'),
(649, 94, 129, NULL, 107, 4, '2018-12-19 18:40:22', '2018-12-19 18:40:22'),
(650, 109, NULL, 97, NULL, 2, '2018-12-19 19:38:56', '2019-02-12 15:22:07'),
(651, 102, 179, NULL, 107, 4, '2018-12-19 19:53:17', '2018-12-19 19:53:17'),
(655, 107, NULL, 108, NULL, 1, '2018-12-20 05:12:30', '2018-12-20 05:12:30'),
(656, 77, 200, NULL, 108, 4, '2018-12-20 05:15:41', '2018-12-20 05:15:41'),
(657, 107, NULL, 109, NULL, 2, '2018-12-20 09:08:00', '2018-12-24 13:39:50'),
(662, 94, 180, NULL, 108, 4, '2018-12-21 11:08:06', '2018-12-21 11:08:06'),
(664, 109, 201, NULL, 107, 4, '2018-12-23 04:56:09', '2018-12-23 04:56:09'),
(665, 102, 167, NULL, 107, 3, '2018-12-24 12:15:36', '2018-12-24 12:15:36'),
(667, 106, 204, NULL, 107, 4, '2018-12-24 13:40:08', '2018-12-24 13:40:08'),
(668, 77, 200, NULL, 107, 4, '2018-12-24 14:19:21', '2018-12-24 14:19:21'),
(669, 101, 190, NULL, 107, 4, '2018-12-24 14:23:47', '2018-12-24 14:23:47'),
(670, 102, 168, NULL, 107, 4, '2018-12-24 14:24:35', '2018-12-24 14:24:35'),
(671, 101, 163, NULL, 107, 4, '2018-12-24 19:09:52', '2018-12-24 19:09:52'),
(672, 106, 204, NULL, 3, 4, '2018-12-26 19:27:30', '2018-12-26 19:27:30'),
(673, 109, 201, NULL, 97, 4, '2018-12-27 11:02:27', '2018-12-27 11:02:27'),
(674, 112, 211, NULL, 87, 4, '2018-12-28 07:52:42', '2018-12-28 07:52:42'),
(675, 107, NULL, 113, NULL, 1, '2018-12-28 08:21:12', '2018-12-28 08:21:12'),
(676, 112, 211, NULL, 113, 4, '2018-12-28 08:31:41', '2018-12-28 08:31:41'),
(677, 3, 226, NULL, 108, 4, '2019-01-25 07:04:54', '2019-01-25 07:04:54'),
(678, 3, 225, NULL, 108, 4, '2019-01-25 07:04:59', '2019-01-25 07:04:59'),
(679, 3, NULL, 115, NULL, 1, '2019-01-25 10:20:23', '2019-01-25 10:20:23'),
(680, 3, NULL, 114, NULL, 1, '2019-01-25 10:20:32', '2019-01-25 10:20:32'),
(681, 114, NULL, 115, NULL, 2, '2019-01-25 10:20:58', '2019-01-25 10:21:05'),
(682, 115, NULL, 114, NULL, 2, '2019-01-25 10:21:11', '2019-01-25 10:21:16'),
(683, 79, NULL, 3, NULL, 2, '2019-01-26 18:36:33', '2019-01-26 18:37:18'),
(684, 3, NULL, 79, NULL, 1, '2019-01-26 18:37:21', '2019-01-26 18:37:21'),
(685, 3, NULL, 116, NULL, 1, '2019-02-01 06:16:41', '2019-02-01 06:16:41'),
(686, 77, 231, NULL, 116, 4, '2019-02-01 09:37:25', '2019-02-01 09:37:25'),
(687, 77, 231, NULL, 116, 3, '2019-02-01 09:38:07', '2019-02-01 09:38:07'),
(688, 3, 228, NULL, 116, 4, '2019-02-01 09:38:38', '2019-02-01 09:38:38'),
(690, 3, 232, NULL, 116, 3, '2019-02-01 09:38:57', '2019-02-01 09:38:57'),
(691, 90, NULL, 116, NULL, 1, '2019-02-01 09:42:09', '2019-02-01 09:42:09'),
(697, 3, 232, NULL, 116, 4, '2019-02-01 09:44:53', '2019-02-01 09:44:53'),
(698, 116, 236, NULL, 106, 4, '2019-02-02 06:31:03', '2019-02-02 06:31:03'),
(699, 77, 234, NULL, 106, 3, '2019-02-02 06:32:59', '2019-02-02 06:32:59'),
(701, 77, 237, NULL, 108, 4, '2019-02-05 06:26:44', '2019-02-05 06:26:44'),
(703, 97, 241, NULL, 113, 4, '2019-02-08 11:40:04', '2019-02-08 11:40:04'),
(704, 97, 241, NULL, 113, 3, '2019-02-08 11:40:10', '2019-02-08 11:40:10'),
(705, 97, 239, NULL, 117, 3, '2019-02-09 11:39:01', '2019-02-09 11:39:01'),
(706, 117, NULL, 97, NULL, 2, '2019-02-09 11:46:53', '2019-02-10 18:48:39'),
(707, 97, 241, NULL, 117, 4, '2019-02-09 11:50:49', '2019-02-09 11:50:49'),
(708, 108, 240, NULL, 117, 4, '2019-02-09 11:50:52', '2019-02-09 11:50:52'),
(709, 79, 249, NULL, 97, 3, '2019-02-09 13:58:14', '2019-02-09 13:58:14'),
(710, 79, 247, NULL, 119, 4, '2019-02-09 15:34:18', '2019-02-09 15:34:18'),
(711, 113, NULL, 119, NULL, 1, '2019-02-09 15:35:06', '2019-02-09 15:35:06'),
(712, 108, 240, NULL, 119, 4, '2019-02-09 15:35:21', '2019-02-09 15:35:21'),
(713, 79, 249, NULL, 119, 3, '2019-02-09 15:37:57', '2019-02-09 15:37:57'),
(714, 118, NULL, 97, NULL, 1, '2019-02-10 16:19:53', '2019-02-10 16:19:53'),
(715, 117, 245, NULL, 97, 4, '2019-02-11 05:16:50', '2019-02-11 05:16:50'),
(716, 88, NULL, 108, NULL, 1, '2019-02-11 07:17:42', '2019-02-11 07:17:42'),
(718, 113, NULL, 108, NULL, 1, '2019-02-11 07:18:01', '2019-02-11 07:18:01'),
(721, 79, 247, NULL, 109, 4, '2019-02-12 15:48:25', '2019-02-12 15:48:25'),
(722, 86, NULL, 113, NULL, 1, '2019-02-13 05:47:31', '2019-02-13 05:47:31'),
(723, 113, 252, NULL, 108, 4, '2019-02-13 05:50:02', '2019-02-13 05:50:02'),
(724, 116, NULL, 120, NULL, 1, '2019-02-13 10:30:33', '2019-02-13 10:30:33'),
(728, 120, NULL, 106, NULL, 2, '2019-02-13 10:33:59', '2019-02-13 10:47:39'),
(729, 106, NULL, 120, NULL, 2, '2019-02-13 10:48:38', '2019-02-13 10:48:44'),
(730, 79, 247, NULL, 106, 4, '2019-02-13 11:22:50', '2019-02-13 11:22:50'),
(733, 79, 247, NULL, 120, 4, '2019-02-13 11:24:09', '2019-02-13 11:24:09'),
(734, 106, 238, NULL, 120, 4, '2019-02-13 11:24:44', '2019-02-13 11:24:44'),
(735, 90, NULL, 120, NULL, 1, '2019-02-13 11:41:29', '2019-02-13 11:41:29'),
(736, 90, 203, NULL, 120, 4, '2019-02-13 11:41:45', '2019-02-13 11:41:45'),
(737, 102, NULL, 106, NULL, 1, '2019-02-13 11:56:22', '2019-02-13 11:56:22'),
(738, 113, 252, NULL, 108, 3, '2019-02-18 05:51:12', '2019-02-18 05:51:12'),
(739, 79, NULL, 121, NULL, 1, '2019-02-18 11:12:16', '2019-02-18 11:12:16'),
(741, 3, NULL, 77, NULL, 2, '2019-02-21 10:52:42', '2019-02-21 10:52:58'),
(742, 77, NULL, 3, NULL, 2, '2019-02-21 10:53:07', '2019-02-21 10:53:13'),
(745, 79, 254, NULL, 3, 4, '2019-02-21 10:56:01', '2019-02-21 10:56:01'),
(746, 79, 254, NULL, 117, 3, '2019-02-21 16:57:13', '2019-02-21 16:57:13'),
(747, 3, NULL, 124, NULL, 2, '2019-02-25 11:27:23', '2019-02-25 11:27:53'),
(748, 124, 278, NULL, 125, 4, '2019-02-26 09:31:53', '2019-02-26 09:31:53'),
(749, 124, 277, NULL, 125, 4, '2019-02-26 12:03:16', '2019-02-26 12:03:16'),
(750, 124, 278, NULL, 128, 4, '2019-02-28 11:52:57', '2019-02-28 11:52:57'),
(751, 90, NULL, 128, NULL, 1, '2019-02-28 11:56:54', '2019-02-28 11:56:54'),
(752, 124, 276, NULL, 79, 4, '2019-02-28 12:19:02', '2019-02-28 12:19:02'),
(753, 124, 275, NULL, 76, 4, '2019-02-28 12:51:52', '2019-02-28 12:51:52'),
(754, 79, 254, NULL, 76, 4, '2019-02-28 12:52:19', '2019-02-28 12:52:19'),
(757, 79, 249, NULL, 76, 4, '2019-02-28 13:00:52', '2019-02-28 13:00:52'),
(758, 126, NULL, 3, NULL, 2, '2019-02-28 13:21:46', '2019-02-28 13:21:54'),
(759, 3, NULL, 126, NULL, 2, '2019-02-28 13:22:35', '2019-02-28 13:22:47'),
(760, 3, 295, NULL, 126, 4, '2019-02-28 13:28:19', '2019-02-28 13:28:19'),
(761, 3, 295, NULL, 126, 3, '2019-02-28 13:28:27', '2019-02-28 13:28:27'),
(762, 126, 297, NULL, 108, 4, '2019-03-02 17:31:07', '2019-03-02 17:31:07'),
(763, 120, 300, NULL, 108, 4, '2019-03-07 13:35:28', '2019-03-07 13:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_otp`
--

CREATE TABLE `user_otp` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `is_used` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(2555) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(2555) COLLATE utf8mb4_bin DEFAULT NULL,
  `youtube_video_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `youtube_video_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `youtube_video_description` varchar(2555) COLLATE utf8mb4_bin DEFAULT NULL,
  `media` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `video_thumb` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gif_image_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `youtube_video_thumb` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `post_duration` int(11) NOT NULL DEFAULT '1' COMMENT '1=>permanently,2=>5 days',
  `is_by_admin` int(11) DEFAULT '0' COMMENT '1:uploaded_by_admin,0:uploaded_by_user',
  `admin_post_type` int(11) DEFAULT NULL COMMENT '1:quote,2:video',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 by default/1 if user deletes the post',
  `is_removed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '0 by default/1 if admin deletes the post',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`id`, `user_id`, `mood_id`, `title`, `description`, `youtube_video_id`, `youtube_video_title`, `youtube_video_description`, `media`, `video_thumb`, `gif_image_url`, `youtube_video_thumb`, `timezone`, `type`, `post_duration`, `is_by_admin`, `admin_post_type`, `is_deleted`, `is_removed`, `created_at`, `updated_at`) VALUES
(24, 3, '[1]', 'test12', 'test', '', '', '', '154106814314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-01 10:29:03', '2018-11-01 10:29:03'),
(30, 3, '[1]', 'test', 'test', '', '', '', '1541136530giphy.gif', NULL, NULL, NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-02 05:28:51', '2018-11-02 05:28:51'),
(32, 77, '[0]', 'test', 'test', 'Bznxx12Ptl0', ' I\'m an Albatraoz | OFFICIAL VIDEO', '“I’m an Albatraoz”. Directed by Aron Ekberg and Sertac Yildizhan. Produced by Jessica Fee, Sean Graham and Patrick Heinemann.', '', NULL, NULL, '154106814314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-03 10:59:33', '2018-11-03 10:59:33'),
(35, 77, '[0]', 'test', 'test', '', '', '', '1541243257SampleVideo_1280x720_1mb.mp4', '154106814314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-03 11:07:38', '2018-11-03 11:07:38'),
(36, 3, '[1,2]', 'testing array of moods', '', '', '', '', '154132513814883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-04 09:52:18', '2018-11-04 09:52:18'),
(37, 3, '[1,2]', 'testing array of moods', '', '', '', '', '154132988514883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-04 11:11:25', '2018-11-04 11:11:25'),
(38, 3, '[2]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541692589image.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 15:56:30', '2018-11-08 15:56:30'),
(39, 3, '[2]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541693566video.mp4', NULL, NULL, NULL, 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-08 16:12:47', '2018-11-08 16:12:47'),
(40, 3, '[2]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541693914video.mp4', NULL, NULL, NULL, 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-08 16:18:35', '2018-11-08 16:18:35'),
(41, 3, '[2]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541694042video.mp4', NULL, NULL, NULL, 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-08 16:20:43', '2018-11-08 16:20:43'),
(42, 3, '[2]', 'This is a sample title', 'This is a sample description', 'JGwWNGJdvx8', 'Shape of you', 'Stream or Download Shape Of You: https://atlanti.cr/2singles÷. Out Now: https://atlanti.cr/yt-albumSubscribe to Ed\'s channel: http://bit.ly/SubscribeToEdSheeran', '', NULL, NULL, NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 1, '2018-11-08 17:42:01', '2018-11-27 10:46:11'),
(43, 3, '[2]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541699278image.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 17:47:59', '2018-11-08 17:47:59'),
(45, 3, '[6,1,3]', 'Hey, this is a test post', 'Sjsjskksns did did dkrbdow ka ek die eke ekr le rkr for eke eke ssosor for eke', '', '', '', '1541715225IMG_1541715215794_4814769465596200837.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 22:13:45', '2018-11-08 22:13:45'),
(46, 3, '[6,1,3]', 'Hey, this is a test post', 'Sjsjskksns did did dkrbdow ka ek die eke ekr le rkr for eke eke ssosor for eke', '', '', '', '1541715233IMG_1541715215794_4814769465596200837.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 22:13:53', '2018-11-08 22:13:53'),
(47, 3, '[1]', 'Kbsbksbsos', 'Skbskbs', '', '', '', '1541715283IMG_1541715269189_6746654095751733007.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 22:14:43', '2018-11-08 22:14:43'),
(48, 3, '[1]', 'Jddkdd did eke eoe eowbl', 'Djdkeldld die eke wow wow e\nDfbfl ke eld for row also or for ke\nDjdld or rod dod for for elrldd\nDndjdkkdkddbdkdkkdkdodf fkof', '', '', '', '1541715416IMG_1541715383758_6519434679076106073.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-08 22:16:57', '2018-11-08 22:16:57'),
(49, 3, '[6,1]', 'Gucci gucci', 'Baby ya', 'Rollie on my arm', '', 'Gucci gucci on my belt', '', NULL, NULL, NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-09 19:32:43', '2018-11-09 19:32:43'),
(50, 3, '[6,1]', 'Rollie rollie', 'Gucci gucci on my belt', 'i_LAoKTMX88', 'I am on a new way', 'That\'s my baby ya', '', NULL, NULL, NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-09 19:41:48', '2018-11-09 19:41:48'),
(51, 3, '[6,1]', 'Heysjss', 'Dhdjdjd', '', '', '', '1541792576IMG_1541792562330_5107149980428661511.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-09 19:42:56', '2018-11-09 19:42:56'),
(52, 3, '[5]', 'This is a sample title', 'This is a sample description', NULL, NULL, NULL, '1541959705image.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-11 18:08:25', '2018-11-11 18:08:25'),
(53, 3, '[5]', 'Title ', 'Desctiption', NULL, NULL, NULL, '1541960011image.jpg', NULL, NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-11 18:13:32', '2018-11-11 18:13:32'),
(67, 3, '[6,1]', 'Cool', 'Yaya cool', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', '', NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 07:23:30', '2018-11-12 07:23:30'),
(68, 3, '[6,1]', 'Giphy', 'Yoooo', '', '', '', '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-12 07:26:06', '2018-11-12 07:26:06'),
(69, 3, '[6,1]', 'Run run', 'Yay', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-12 07:41:23', '2018-11-12 07:41:23'),
(70, 77, '[1]', 'test', 'test', 'YLoYt8H7kjM', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 07:45:16', '2018-11-12 07:45:16'),
(71, 77, '[1]', 'test', 'test', 'YLoYt8H7kjM', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 07:47:05', '2018-11-12 07:47:05'),
(72, 77, '[1]', 'test', 'test', 'YLoYt8H7kjM', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', NULL, 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 07:47:53', '2018-11-12 07:47:53'),
(73, 77, '[1,2]', 'testing', 'test', 'fB8TyLTD7EE', 'RISE (ft. The Glitch Mob, Mako, and The Word Alive) | Worlds 2018 - League of Legends', 'Reaching the peak takes more than skill. Only those with the ambition to RISE above all others will know its height. For more information on the 2018 League of ...', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 09:27:05', '2018-11-12 09:27:05'),
(74, 3, '[6,1]', 'YOURJEJR', 'Snddjd', 'm7Bc3pLyij0', 'Marshmello ft. Bastille - Happier (Official Music Video)', 'Marshmello ft. Bastille - Happier (Official Music Video) Download / Stream Happier ? http://marshmello.lnk.to/happier NEW Mello™   by Marshmello gear SHOP ...', '', '', '', 'https://i.ytimg.com/vi/m7Bc3pLyij0/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 09:33:03', '2018-11-12 09:33:03'),
(75, 3, '[6,1]', 'I am the rock', 'Rockinder singh', '', '', '', '1542015225IMG_1542015205123_8607587822991098575.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-12 09:33:45', '2018-11-12 09:33:45'),
(76, 3, '[6,1]', 'Yaya', 'Sysudu', '', '', '', '1542023562VID_1542023508607_7495295122335934166_compressed.mp4', '1542023562Thumb_1542023545529_4498056342960496949.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 11:52:42', '2018-11-12 11:52:42'),
(77, 3, '[6,1]', 'Tesksk', 'Dhd', '', '', '', '1542023672VID_1542023635363_2145918084265993000_compressed.mp4', '1542023672Thumb_1542023663308_3204971504366319390.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 11:54:33', '2018-11-12 11:54:33'),
(78, 3, '[6]', 'Hdjsjd', 'Djdjd', '', '', '', '1542024064VID-20181106-WA0007_compressed.mp4', '1542024064Thumb_1542024046924_8785039177386687604.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 12:01:04', '2018-11-12 12:01:04'),
(79, 83, '[6,1]', 'Hdjd', 'Dd', '', '', '', '1542027108VID_1542027072870_5358549080381366535_compressed.mp4', '1542027108Thumb_1542027097114_8737255398796410911.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 12:51:48', '2018-11-12 12:51:48'),
(80, 83, '[6,1]', 'Jxjx', 'Du', '', '', '', '1542027225Guns of Boom_2018-11-09-17-11-03_compressed.mp4', '1542027225Thumb_1542027208756_3985923324669062925.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 12:53:46', '2018-11-12 12:53:46'),
(81, 3, '[6]', 'Sjisx', 'Sjsk', '', '', '', '1542047581VID_1542047497728_1159889007099191620_compressed.mp4', '1542047581Thumb_1542047543870_8133011341228437797.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-12 18:33:02', '2018-11-12 18:33:02'),
(82, 3, '[6,1]', 'Sskxkl', '', '', '', '', '1542047720IMG_1542047711530_8628262180390558560.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-12 18:35:21', '2018-11-12 18:35:21'),
(83, 3, '[6]', 'YouTube Sample title', 'YouTube ample desc', NULL, NULL, NULL, '1542052691image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-12 19:58:11', '2018-11-12 19:58:11'),
(84, 3, '[6,1]', 'Yay', 'Tatum', 'hHW1oY26kxQ', 'lofi hip hop radio - beats to relax/study to', 'Thank you for listening, I hope you will have a good time here :) Listen to the radio offline with my Spotify playlist ? http://bit.ly/chilledcowradio ChilledCow ...', '', '', '', 'https://i.ytimg.com/vi/hHW1oY26kxQ/hqdefault_live.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-12 19:58:18', '2018-11-12 19:58:18'),
(85, 3, '[6]', 'adds adds', 'dads sadasd', NULL, NULL, NULL, '1542055779image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-12 20:49:39', '2018-11-12 20:49:39'),
(86, 3, '[\"6\"]', 'aa', 'a', NULL, NULL, NULL, '1542056159image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-12 20:56:00', '2018-11-12 20:56:00'),
(87, 3, '[6]', 'gif to', 'gif d', NULL, NULL, NULL, '1542091331image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-13 06:42:11', '2018-11-13 06:42:11'),
(88, 77, '[1]', 'test', 'test', 'JFYCc577kjQ', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 06:55:28', '2018-11-13 06:55:28'),
(89, 77, '[1]', 'test', 'test', 'JFYCc577kjQ', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 06:57:49', '2018-11-13 06:57:49'),
(90, 77, '[1]', 'test', 'test', 'JFYCc577kjQ', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:00:30', '2018-11-13 07:00:30'),
(91, 77, '[1,2]', 'test', 'test', 'JFYCc577kjQ', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:00:41', '2018-11-13 07:00:41'),
(92, 77, '[1,2]', 'test', 'test', 'JFYCc577kjQ', 'Arijit Singh with his soulful performance | 6th Royal Stag Mirchi Music Awards | Radio Mirchi', 'Watch the very versatile, the very talented, the very awesome Arijit Singh perform to his songs on the stage the 6th Royal Stag Mirchi Music Awards. Drop in your', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:04:49', '2018-11-13 07:04:49'),
(93, 76, '[\"3\"]', 'daddy’s', 'daddy’s', 'fB8TyLTD7EE', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:09:11', '2018-11-13 07:09:11'),
(94, 76, '[\"3\"]', 'daddy’s', 'daddy’s', 'fB8TyLTD7EE', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:11:20', '2018-11-13 07:11:20'),
(95, 76, '[\"3\"]', 'daddy’s', 'daddy’s', 'fB8TyLTD7EE', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:12:18', '2018-11-13 07:12:18'),
(96, 76, '[1]', 'daddy’s', 'daddy’s', 'fB8TyLTD7EE', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:12:24', '2018-11-13 07:12:24'),
(97, 76, '[1,2]', 'daddy’s', 'daddy’s', 'fB8TyLTD7EE', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:16:03', '2018-11-13 07:16:03'),
(98, 77, '[\"3\"]', 'daddy’s', 'daddy’s', 'JFYCc577kjQ', 'daddy’s', 'daddy’s', '', '', '', 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:35:23', '2018-11-13 07:35:23'),
(99, 76, '[\"3\"]', 'as', 'as', 'fB8TyLTD7EE', 'RISE (ft. The Glitch Mob, Mako, and The Word Alive) | Worlds 2018 - League of Legends', 'Reaching the peak takes more than skill. Only those with the ambition to RISE above all others will know its height. For more information on the 2018 League of ...', '', '', NULL, 'https://img.youtube.com/vi/fB8TyLTD7EE/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-13 07:36:33', '2018-11-13 07:36:33'),
(100, 76, '[\"3\"]', 'das', 'daddy’s', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-13 07:57:00', '2018-11-13 07:57:00'),
(101, 3, '[6,1]', 'Hfh', 'Gjj', '', '', '', '1542260946IMG_1542260940907_1011398193365766964.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-15 05:49:07', '2018-11-15 05:49:07'),
(102, 3, '[6,1]', 'Vnj', 'Hi', 'Vap9SMRf8YE', '5 Second Rule with Sofia Vergara -- Extended!', 'Ellen and Sofia played a hilarious game of 5 Second Rule! Check it out, plus all the fun we didn\'t have time for in the show!', '', '', '', 'https://i.ytimg.com/vi/Vap9SMRf8YE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-15 05:49:30', '2018-11-15 05:49:30'),
(103, 3, '[6,1]', 'Ghj', 'Hh', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-15 05:50:07', '2018-11-15 05:50:07'),
(104, 86, '[1,3]', 'Song', 'Good', 'xTlNMmZKwpA', 'Cardi B, Bad Bunny & J Balvin - I Like It [Official Music Video]', 'Cardi B, Bad Bunny & J Balvin - I Like It from Cardi B\'s Debut Album Invasion of Privacy available now! Stream/Download: https://CardiB.lnk.to/IOPAY INVASION ...', '', '', '', 'https://i.ytimg.com/vi/xTlNMmZKwpA/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-11-15 12:09:56', '2018-11-15 12:09:56'),
(105, 87, '[\"3\"]', 'Tgis is a sample post', 'qtatagene', NULL, NULL, NULL, '1542357692image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-16 08:41:33', '2018-11-16 08:41:33'),
(106, 89, '[4]', 'Yoho', 'Bogo', 'FxQTY-W6GIo', 'KILLSHOT [Official Audio]', 'Kamikaze is out now: http://shady.sr/Kamikaze http://eminem.com http://facebook.com/eminem http://twitter.com/eminem http://instagram.com/eminem ...', '', '', '', 'https://i.ytimg.com/vi/FxQTY-W6GIo/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-11-18 15:17:23', '2018-11-18 15:17:23'),
(107, 85, '[6,3]', 'New post', 'Testing with new post', '', '', '', '1542794963IMG_1542794897226_8864578551825728350.jpg', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-21 10:09:23', '2018-11-21 10:09:23'),
(108, 85, '[6,1]', 'Video', 'Find fhjffibf fr', '', '', '', '1542795764VID_1542795713154_6365562249409439593_compressed.mp4', '1542795764Thumb_1542795739830_3338249910344443580.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-21 10:22:45', '2018-11-21 10:22:45'),
(109, 90, '[\"6\"]', 'bdjkd', 'bbbd', NULL, NULL, NULL, '1543042108image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 06:48:28', '2018-11-24 06:48:28'),
(110, 3, '[\"1\"]', 'summary', 'hu', NULL, NULL, NULL, '1543042147image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 06:49:08', '2018-11-24 06:49:08'),
(111, 90, '[\"6\"]', 'new post ', 'new version is available now', NULL, NULL, NULL, '1543042216image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 06:50:17', '2018-11-24 06:50:17'),
(112, 90, '[\"2\"]', 'morning', 'good morning ', NULL, NULL, NULL, '1543042506image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 06:55:06', '2018-11-24 06:55:06'),
(113, 90, '[\"5\"]', 'hhh', 'hhh', NULL, NULL, NULL, '1543056453image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 10:47:34', '2018-11-24 10:47:34'),
(114, 90, '[\"2\"]', 'ghhh', 'ghhhh', NULL, NULL, NULL, '1543058044video.mp4', '1543058044image.jpg', NULL, NULL, 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-24 11:14:04', '2018-11-24 11:14:04'),
(115, 90, '[\"2\"]', 'hhh', 'the ', NULL, NULL, NULL, '1543059098image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 11:31:38', '2018-11-24 11:31:38'),
(116, 90, '[\"2\"]', 'YouTube', 'video', NULL, NULL, NULL, '1543059461image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-24 11:37:41', '2018-11-24 11:37:41'),
(117, 90, '[\"2\"]', 'YouTube', 'hhhhyyyy', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-24 11:44:04', '2018-11-24 11:44:04'),
(118, 90, '[\"1\"]', 'test', 'jdjdjsjjsjsjsjsjsnsndndndndnsndndnsnsnnsnsnsnsnsnsnsnsnsnsnnsnsnsnsnsnsnsn', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-24 12:19:46', '2018-11-24 12:19:46'),
(119, 93, '[1,3]', 'New feed', 'Trying with New feed', '', '', '', '1543213698IMG_1543213690691_3464710079213478554.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 06:28:19', '2018-11-26 06:28:19'),
(120, 93, '[3,4]', 'Checking', 'Adding new feeds', '', '', '', '1543213750IMG_1543213742867_4164631455128517941.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 06:29:10', '2018-11-26 06:29:10'),
(124, 94, '[5]', 'cydydydy', 'cyodydydyd', '', '', '', '1543224163IMG_1543224248724_5938740668906066229.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 09:22:43', '2018-11-26 09:22:43'),
(125, 94, '[1]', 'vvvv', '', '', '', '', '1543224249IMG_1543224327599_2185181986684517261.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 09:24:09', '2018-11-26 09:24:09'),
(127, 94, '[5,6,1,3,2,4]', 'Helo', 'hiii', '', '', '', '1543224612IMG_1543224713252_5284774032736601109.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 09:30:13', '2018-11-26 09:30:13'),
(128, 94, '[6]', 'post', 'youtube', 'fB8TyLTD7EE', 'RISE (ft. The Glitch Mob, Mako, and The Word Alive) | Worlds 2018 - League of Legends', 'Reaching the peak takes more than skill. Only those with the ambition to RISE above all others will know its height. For more information on the 2018 League of ...', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-11-26 09:37:00', '2018-11-26 09:37:00'),
(129, 94, '[5,6,1,3,2,4]', 'fun', 'hi', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-11-26 09:41:21', '2018-11-26 09:41:21'),
(131, 94, '[1]', 'video', 'fun', '', '', '', '154322553620181123_190808_compressed.mp4', '1543225536Thumb_1543225607311_2948837396460545483.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-26 09:45:37', '2018-11-26 09:45:37'),
(132, 94, '[6,1]', 'fun', '6g6g5f', '', '', '', '154322571420181123_190808_compressed.mp4', '1543225714Thumb_1543225736717_1674694618232494659.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-26 09:48:34', '2018-11-26 09:48:34'),
(134, 85, '[6]', 'Ittdidltjdlfdjfxkfdhfzkzouskhzkfzhzhfzufzofzuzohrshfshfskfzfhzhfzkfjskhfsohfdhfzrhskzfsjtz', 'Ixgxjfduditdiyfoyfiyd0iydpidtidutusrutisost7duutsosuofzfzfzfzfczhzzjzjkzfzfzodogi', '', '', '', '1543226331VID_1543226055152_3390512347907931059_compressed.mp4', '1543226331Thumb_1543226184996_5410175268968555174.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-26 09:58:52', '2018-11-26 09:58:52'),
(135, 85, '[1]', 'Hy', 'Hwlo', '', '', '', '1543227368VID_1543227330417_5879267058781929189_compressed.mp4', '1543227368Thumb_1543227356513_3471548010156048364.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-11-26 10:16:08', '2018-11-26 10:16:08'),
(136, 85, '[1,3]', 'Universe', 'Earth', '', '', '', '1543227786IMG_1543227732037_5867407701511439434.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 10:23:07', '2018-11-26 10:23:07'),
(137, 85, '[6,1]', 'Today', 'Fun day', '', '', '', '1543228059IMG_1543228051350_5789135169500735559.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 10:27:39', '2018-11-26 10:27:39'),
(138, 87, '[\"1\"]', 'Funny MEme', 'Meme si tu', NULL, NULL, NULL, '1543229006image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 10:43:27', '2018-11-26 10:43:27'),
(139, 85, '[5,6,1,3,2,4]', 'Life', 'Amazing lifw', '', '', '', '1543229030IMG_1543229024776_7880998039584090300.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-11-26 10:43:50', '2018-11-26 10:43:50'),
(143, NULL, '[1]', 'est', 'test', NULL, NULL, NULL, '1543308042SampleVideo_1280x720_1mb.mp4', '154330804214883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Kolkata', 2, 1, 1, 2, 0, 0, '2018-11-27 08:40:42', '2018-12-04 05:45:51'),
(144, NULL, '[1]', NULL, NULL, NULL, NULL, NULL, '1543308653SampleVideo_1280x720_1mb.mp4', '154330865314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Kolkata', 2, 1, 1, 2, 0, 0, '2018-11-27 08:50:54', '2018-11-27 08:50:54'),
(145, NULL, '[1]', NULL, NULL, NULL, NULL, NULL, '1543308809SampleVideo_1280x720_1mb.mp4', '154330880914883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Calcutta', 2, 1, 1, 2, 0, 0, '2018-11-27 08:53:30', '2018-11-27 08:53:30'),
(152, NULL, '[2,3,4]', 'test', '', NULL, NULL, NULL, '154339221914883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Calcutta', 1, 1, 1, 1, 0, 0, '2018-11-28 08:03:40', '2018-12-04 05:49:18'),
(153, NULL, '[2,3]', 'test12', '', NULL, NULL, NULL, '1543392567SampleVideo_1280x720_1mb.mp4', '154339256714883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Calcutta', 2, 1, 1, 2, 0, 0, '2018-11-28 08:09:27', '2018-11-28 08:10:44'),
(154, NULL, '[1]', 'test', '', NULL, NULL, NULL, '1543644430SampleVideo_1280x720_1mb.mp4', '154364443014883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, 'Asia/Calcutta', 2, 1, 1, 2, 0, 0, '2018-12-01 06:07:10', '2018-12-04 07:28:55'),
(155, 97, '[1]', 'Yry', 'Y3y3y', 'VRJmcxCrAOA', 'Real Life Trick Shots 2 | Dude Perfect', 'Trick shots should be an everyday thing! Thanks to Kay Jewelers for sponsoring this video! Win Valentine\'s Day by going to http://dudeperfect.com/KayJewelers ...', '', '', '', 'https://i.ytimg.com/vi/VRJmcxCrAOA/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-01 08:31:32', '2018-12-01 08:31:32'),
(156, NULL, '[3]', 'test', 'test', NULL, NULL, NULL, '154365450214883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Calcutta', 1, 1, 1, 1, 0, 0, '2018-12-01 08:55:02', '2018-12-01 08:55:02'),
(157, 3, '[1]', 'pikachu', '', '', '', '', '1543663740pikaaaaa-chuuuuuuuu.gif', '', '', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-01 11:29:01', '2018-12-03 09:00:01'),
(158, 89, '[2,4]', 'Lion king', '', '4CbLXeGSDxg', 'The Lion King Official Teaser Trailer', 'Disney\'s The Lion King opens in theatres July 19, 2019. From Disney Live Action, director Jon Favreau\'s all-new “The Lion King” journeys to the African savanna ...', '', '', '', 'https://i.ytimg.com/vi/4CbLXeGSDxg/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-01 18:07:58', '2018-12-01 18:07:58'),
(159, 3, '[1,2,4]', 'test', 'test', '', '', '', '1543828021pikaaaaa-chuuuuuuuu.gif', '', '', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-03 09:07:02', '2018-12-03 09:07:02'),
(160, 3, '[1,2,3,4]', 'test', 'test', '', '', '', '1543828156pikaaaaa-chuuuuuuuu.gif', '', '', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-03 09:09:17', '2018-12-03 09:09:17'),
(163, 101, '[\"2\"]', 'Domain is posting', 'posted', NULL, NULL, NULL, '1543835014image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-03 11:03:35', '2018-12-03 11:03:35'),
(165, NULL, '[1]', 'test', '', NULL, NULL, NULL, '154390168414883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Calcutta', 1, 1, 1, 1, 0, 0, '2018-12-04 05:34:45', '2018-12-04 05:34:45'),
(166, NULL, '[1]', 'test', '', NULL, NULL, NULL, '154390173314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', NULL, NULL, NULL, 'Asia/Calcutta', 1, 1, 1, 1, 0, 0, '2018-12-04 05:35:34', '2018-12-04 05:35:34'),
(167, 102, '[5,1]', 'Bag', 'Brand', '', '', '', '1543903270IMG_1543903221775_4199617386086768429.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 06:01:11', '2018-12-04 06:01:11'),
(168, 102, '[5,3]', 'Test', 'Data', '', '', '', '1543904882IMG_1543904861399_9109525002403865950.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 06:28:03', '2018-12-04 06:28:03'),
(169, 102, '[1]', 'Anshul', 'Goel', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-04 06:34:32', '2018-12-04 06:34:32'),
(170, 102, '[1]', 'Gif', 'Test', '', '', '', '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-04 06:40:20', '2018-12-04 06:40:20'),
(171, 94, '[1]', 'H', 'H', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 06:41:28', '2018-12-04 06:41:28'),
(172, 102, '[4]', 'Sleepy', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-04 06:43:48', '2018-12-04 06:43:48'),
(173, 102, '[1]', 'Nddhjdjdja', 'Jsjsjsjdjdj', '', '', '', '1543906808IMG_1543906794812_3102726693341604340.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 07:00:09', '2018-12-04 07:00:09'),
(174, 102, '[5,6,1]', 'Hggb', 'Bbvbh', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 07:03:30', '2018-12-04 07:03:30'),
(175, 94, '[1]', 'Gcjfcg', 'Hcngx h', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-04 07:05:05', '2018-12-04 07:05:05'),
(176, 102, '[5]', 'Post', 'Youtube', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', '', 'https://i.ytimg.com/vi/UOxkGD8qRB4/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-04 07:13:21', '2018-12-04 07:13:21'),
(177, 102, '[1]', 'Hhhh', 'Hhhhhhikkinhcbdc', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 07:13:47', '2018-12-04 07:13:47'),
(178, 102, '[1]', 'Ohcgixogxigxigxigxigxugxigxkgxigxigxkgxjgxigxigxigxogxogxigxkgxgkxlhchlxglxhlchlcgozkg ljcogzb jcigxcyogogxkgxkgxigxgklhcljxogc', 'P ohxog kgxgk kgxkg kgxkgxgk gkxkgxkg kgxogxgixoyxogckgxgoxgixigxigxifxtixyoxyodyodyodyodyofyodyodyofyodyofyo', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 07:18:27', '2018-12-04 07:18:27'),
(179, 102, '[3]', 'Test', '', '', '', '', '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-04 07:38:25', '2018-12-04 07:38:25'),
(180, 94, '[5,6,1,3,2,4]', 'Test', '', 'VRJmcxCrAOA', 'Real Life Trick Shots 2 | Dude Perfect', 'Trick shots should be an everyday thing! Thanks to Kay Jewelers for sponsoring this video! Win Valentine\'s Day by going to http://dudeperfect.com/KayJewelers ...', '', '', '', 'https://i.ytimg.com/vi/VRJmcxCrAOA/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-04 07:45:32', '2018-12-04 07:45:32'),
(181, 102, '[1]', 'Testtt', '', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 07:48:29', '2018-12-04 07:48:29'),
(182, 102, '[1]', 'Hyy', 'Hyyu', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 10:16:36', '2018-12-04 10:16:36'),
(183, 102, '[5,6,1,4,3,2]', 'Hy', 'Hy', '', '', '', '1543921544IMG_1543921523449_2609331451843249631.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 11:05:45', '2018-12-04 11:05:45'),
(184, 3, '[5,6]', 'Ksis', 'Ddjdk', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 11:06:49', '2018-12-04 11:06:49'),
(185, 102, '[1]', 'Hhh', 'Hhh', '', '', '', '1543921766IMG_1543921745073_9204405850570248558.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 11:09:26', '2018-12-04 11:09:26'),
(186, 102, '[1]', 'Hhhh', 'Jjjj', '', '', '', '1543921859IMG_1543921844858_3994924522902270278.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 11:10:59', '2018-12-04 11:10:59'),
(187, 102, '[6]', 'Hy', 'Hy', '', '', '', '1543922903VID_1543922793919_7572227649574185678_compressed.mp4', '1543922903Thumb_1543922852440_5244179342276238101.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-12-04 11:28:23', '2018-12-04 11:28:23'),
(188, 102, '[5,6,1,4]', 'Tesy', 'Sdfg', '', '', '', '', '', '', '', 'Asia/Kolkata', 0, 1, 0, NULL, 0, 0, '2018-12-04 11:35:44', '2018-12-04 11:35:44'),
(189, 102, '[1]', 'Hhh', 'Bhh', '', '', '', '1543924865IMG_1543924855521_9220369061669777857.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 12:01:05', '2018-12-04 12:01:05'),
(190, 101, '[\"6\",\"5\"]', 'yogi I', 'GUI', NULL, NULL, NULL, '1543930930image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-04 13:42:10', '2018-12-04 13:42:10'),
(191, 3, '[6,1]', 'Ndmdkd', '', '', '', '', '1543999734IMG_1543999559258_3578807865038747812.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-05 08:48:54', '2018-12-05 08:48:54'),
(192, 3, '[1]', 'Sjsksosk', 'Sj', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', '', 'https://i.ytimg.com/vi/UOxkGD8qRB4/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-05 08:50:06', '2018-12-05 08:50:06'),
(193, 3, '[1]', 'Nxkods', 'Jdkejdje ejej', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-05 08:50:28', '2018-12-05 08:50:28'),
(194, 3, '[1]', 'Nxkxod', 'Djeieoiee', '', '', '', '1543999879IMG_1543999874816_1067165267377254162.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-05 08:51:20', '2018-12-05 08:51:20'),
(195, 3, '[1]', 'Jskekdkd', 'Bsjsisisos', '', '', '', '1544000208VID-20181202-WA0000_compressed.mp4', '1544000208Thumb_1544000123590_3178032962731357125.jpg', '', '', 'Asia/Kolkata', 2, 1, 0, NULL, 0, 0, '2018-12-05 08:56:49', '2018-12-05 08:56:49'),
(196, 3, '[1]', 'Nmxkxox', 'Jdkd', '', '', '', '1544000318IMG_1544000300373_6248725311129864064.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-05 08:58:39', '2018-12-05 08:58:39'),
(197, 77, '[1]', 'Test 😍😍', 'Hey hey 😁😁', 'UnyLfqpyi94', 'AJR - Burn The House Down [Official Video]', 'Grab the song here: http://smarturl.it/ClickDeluxe ON TOUR THIS FALL: http://www.AJRBrothers.com/tour Directed by The Mitchells & Spencer Hord Online ...', '', '', '', 'https://i.ytimg.com/vi/UnyLfqpyi94/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-06 04:59:18', '2018-12-06 04:59:18'),
(198, 97, '[1]', 'Jrururu', 'Bxbd', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', '', 'https://i.ytimg.com/vi/UOxkGD8qRB4/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-06 17:11:26', '2018-12-06 17:11:26'),
(199, 97, '[6,1]', '7UU', 'Yyy', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', '', 'https://i.ytimg.com/vi/UOxkGD8qRB4/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-12 15:54:45', '2018-12-12 15:54:45'),
(200, 77, '[5]', 'Test😔', 'Test😔', '', '', '', '1545037251IMG_1545037236120_8217841120463973087.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-17 09:00:51', '2018-12-17 09:00:51'),
(201, 109, '[1]', 'My son My pride', '', '', '', '', '1545215064IMG_1545214988161_6731208950004509292.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-19 10:24:24', '2018-12-19 10:24:24'),
(202, 107, '[\"2\",\"6\",\"5\",\"3\",\"4\",\"1\"]', 'b', ' b', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', NULL, 'https://img.youtube.com/vi/UOxkGD8qRB4/sddefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-19 18:32:30', '2018-12-19 18:32:30'),
(203, 90, '[\"5\",\"3\"]', 'trying with calm mode', 'stay calm ', 'cjkFG6bHGNc', 'Relaxing Music & Soft Rain: Sleep Music, Calm Piano Music, Healing Music, Peaceful Music ★149', 'Relaxing music with soft rain that can be described as sleep music, calm piano music, healing music, peaceful music and relaxing music. Instrumental music ...', '', '', NULL, 'https://img.youtube.com/vi/cjkFG6bHGNc/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-20 07:50:08', '2018-12-20 07:50:08'),
(204, 106, '[5,6,1,4,3,2]', 'Hhhh', 'Bsdjndkf', '', '', '', '1545305959IMG_1545305928913_8639435019443608100.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-20 11:39:19', '2018-12-20 11:39:19'),
(205, 108, '[3]', 'Trick shots', '', '3nRZhGP5apQ', 'Ping Pong Trick Shots | Dude Perfect', 'BOOM!! Our 1st ever Ping Pong Trick Shot video has DROPPED! Click HERE for more: http://bit.ly/PringlesFlavorSlam ▻ PLAY our FREE new iPHONE GAME ...', '', '', '', 'https://i.ytimg.com/vi/3nRZhGP5apQ/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-20 19:19:07', '2018-12-20 19:19:07'),
(206, 108, '[3]', 'Test', '', '', '', '', '1545390901IMG_1545390806494_2432295444138281569.jpg', '', '', '', 'Asia/Dubai', 1, 1, 0, NULL, 0, 0, '2018-12-21 11:15:02', '2018-12-21 11:15:02'),
(207, 108, '[1]', 'Love', 'Good', 'hA6hldpSTF8', 'Marvel Studios\' Avengers - Official Trailer', 'Part of the journey is the end. ▻ Subscribe to Marvel: http://bit.ly/WeO3YJ Learn more: https://bit.ly/2QD3Z85 --- Follow Marvel on Twitter: ...', '', '', '', 'https://i.ytimg.com/vi/hA6hldpSTF8/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-21 12:27:21', '2018-12-21 12:27:21'),
(208, 108, '[1]', 'Test1wer', '', '', '', '', '1545558646IMG_1545558589076_3058032564004560491.jpg', '', '', '', 'Asia/Dubai', 1, 1, 0, NULL, 0, 0, '2018-12-23 09:50:46', '2018-12-23 09:50:46'),
(209, 107, '[\"5\"]', 'post ', 'hey', 'hA6hldpSTF8', 'Marvel Studios\' Avengers - Official Trailer', 'Part of the journey is the end. ▻ Subscribe to Marvel: http://bit.ly/WeO3YJ Learn more: https://bit.ly/2QD3Z85 --- Follow Marvel on Twitter: ...', '', '', NULL, 'https://img.youtube.com/vi/hA6hldpSTF8/sddefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2018-12-24 14:31:39', '2018-12-24 14:31:39'),
(210, 112, '[5,6,1,4]', 'Evening', 'Highday', '', '', '', '1545906750IMG_1545906733527_5946615053356106038.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-27 10:32:30', '2018-12-27 10:32:30'),
(211, 112, '[5,6,1,4,3,2]', 'Yfyfvy', 'Fycy g', '', '', '', '1545906815IMG_1545906796817_1096878585654445819.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2018-12-27 10:33:35', '2018-12-27 10:33:35'),
(212, 97, '[5]', 'Ds', 'Did', '', '', '', '1545908367IMG_1545908326834_2468168012944214599.jpg', '', '', '', 'Asia/Dubai', 1, 1, 0, NULL, 0, 0, '2018-12-27 10:59:27', '2018-12-27 10:59:27'),
(213, 3, '[\"2\"]', 'Testing Postt', 'Testing Desc', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', NULL, 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2018-12-30 19:49:54', '2018-12-30 19:49:54'),
(214, 3, '[\"2\"]', 'Hey', 'Hey', 'UOxkGD8qRB4', 'K/DA - POP/STARS (ft Madison Beer, (G)I-DLE, Jaira Burns) | Official Music Video - League of Legends', 'K/DA Ahri, K/DA Evelynn, K/DA Kai\'Sa, and K/DA Akali take the world stage with their debut single. Keep the show going on the Rift with these new Epic skins.', '', '', NULL, 'https://img.youtube.com/vi/UOxkGD8qRB4/sddefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2018-12-30 19:56:20', '2018-12-30 19:56:20'),
(215, 108, '[4]', 'Post', '', 'wT3RhIJZu4k', 'Bars and Melody - Hopeful', 'Preorder the Hopeful bundle on iTunes here: http://smarturl.it/BAMHopefuliTunes Follow Bars and Melody on: Facebook: http://facebook.com/barsandmelody ...', '', '', '', 'https://i.ytimg.com/vi/wT3RhIJZu4k/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 16:55:24', '2019-01-17 16:55:24'),
(216, 108, '[1]', 'Happy', '', '3nRZhGP5apQ', 'Ping Pong Trick Shots | Dude Perfect', 'BOOM!! Our 1st ever Ping Pong Trick Shot video has DROPPED! Click HERE for more: http://bit.ly/PringlesFlavorSlam ▻ PLAY our FREE new iPHONE GAME ...', '', '', '', 'https://i.ytimg.com/vi/3nRZhGP5apQ/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 16:58:14', '2019-01-17 16:58:14'),
(217, 108, '[5]', 'Clam', '', 'QUkXHLNTSDA', 'Sleeping Music, Calming Music, Music for Stress Relief, Relaxation Music, 8 Hour Sleep Music, ☯3257', 'Sleeping Music, Calming Music, Music for Stress Relief, Relaxation Music, 8 Hour Sleep Music, ☯3257 - \"YellowBrickCinema\'s Sleep Music is the perfect ...', '', '', '', 'https://i.ytimg.com/vi/QUkXHLNTSDA/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 16:58:41', '2019-01-17 16:58:41'),
(218, 108, '[6]', 'Funny', '', 'WEDaRGVm_h8', 'So Close, Yet So Far: Fails of the Week (January 2019)', 'It\'s Friday and that means we have fresh fails for you! This week we have a high speed segway fail, a foam pit fiasco, and more! Submit your video and you could ...', '', '', '', 'https://i.ytimg.com/vi/WEDaRGVm_h8/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 16:59:07', '2019-01-17 16:59:07'),
(219, 108, '[5]', 'Calm music', '', 'DSGyEsJ17cI', 'Relaxing Jazz & Bossa Nova Music Radio - 24/7 Chill Out Piano & Guitar Music Live Stream', 'Please Subscribe Cafe Music BGM channel https://www.youtube.com/user/cafemusicbgmchannel BGM channel https://www.youtube.com/user/bgmchannelbgm ...', '', '', '', 'https://i.ytimg.com/vi/DSGyEsJ17cI/hqdefault_live.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 16:59:47', '2019-01-17 16:59:47'),
(220, 108, '[5,6,1,4,3,2]', 'Yay', '', 'Y54W0HQ5qss', 'Anthony Hamilton - Cool ft. David Banner', 'Anthony Hamilton\'s official music video for \'Cool\' ft. David Banner. Click to listen to Anthony Hamilton on Spotify: http://smarturl.it/AHSpot?IQid=AnthonyHCOO As ...', '', '', '', 'https://i.ytimg.com/vi/Y54W0HQ5qss/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 17:04:51', '2019-01-17 17:04:51'),
(221, 108, '[4,3]', 'Waving flag', '', 'WTJSt4wP2ME', 'K\'NAAN - Wavin\' Flag (Coca-Cola Celebration Mix)', 'ATTENTION: This is NOT the official video or song of the 2010 FIFA World Cup! Music video by K\'naan performing Wavin\' Flag. (C) 2010 OctoScope Music, LLC.', '', '', '', 'https://i.ytimg.com/vi/WTJSt4wP2ME/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 17:05:30', '2019-01-17 17:05:30'),
(222, 108, '[4]', 'Motivation', 'Perfect song to motivate anyone', 'PsO6ZnUZI0g', 'Kanye West - Stronger', 'Best of Kanye West: https://goo.gl/2FXUVW Subscribe here: https://goo.gl/AgJE59 Music video by Kanye West performing Stronger. (C) 2007 Roc-A-Fella ...', '', '', '', 'https://i.ytimg.com/vi/PsO6ZnUZI0g/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-01-17 17:07:34', '2019-01-17 17:07:34'),
(223, 3, '[1,2]', '', '', '', '', '', '154830865714883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-01-24 05:44:17', '2019-01-24 05:44:17'),
(224, 3, '2', '', '', '', '', '', '154832578714883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-01-24 10:29:48', '2019-01-24 10:29:48'),
(225, 3, '1', '', '', '', '', '', '154833030814883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-01-24 11:45:09', '2019-01-24 11:45:09'),
(226, 3, '1', '', '', '', '', '', '154833032814883620493559043007_9ce779be-abb4-4670-a2de-178a39f33307_1000x1000.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-01-24 11:45:29', '2019-01-24 11:45:29'),
(227, 79, '[\"3\"]', 'title', 'disc', NULL, NULL, NULL, '1548531856image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-01-26 19:44:17', '2019-01-26 19:44:17'),
(228, 3, '[1,2]', '', '', '', '', '', '154875966214883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-01-29 11:01:02', '2019-01-29 11:01:02'),
(230, 77, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-01-29 11:04:41', '2019-01-29 11:04:41'),
(231, 77, '[2]', '', '', 'fB8TyLTD7EE', 'RISE (ft. The Glitch Mob, Mako, and The Word Alive) | Worlds 2018 - League of Legends', 'Reaching the peak takes more than skill. Only those with the ambition to RISE above all others will know its height. For more information on the 2018 League of ...', '', '', '', 'https://i.ytimg.com/vi/fB8TyLTD7EE/hqdefault.jpg', 'Asia/Kolkata', 4, 1, 0, NULL, 0, 0, '2019-01-29 11:07:41', '2019-01-29 11:07:41'),
(232, 3, '[2]', '', '', '', '', '', '154876086714883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-01-29 11:21:07', '2019-01-29 11:21:07'),
(233, 116, '[5]', 'Good morning', 'Having a great day', '', '', '', '1549001684IMG_1549001652056_5047329893533802603.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-01 06:14:44', '2019-02-01 06:14:44'),
(234, 77, '[1]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-02-01 09:17:17', '2019-02-01 09:17:17'),
(235, 116, '[1]', 'Get st', 'Test', '', '', '', '1549012665IMG_1549012614241_2592533241577517674.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-01 09:17:46', '2019-02-01 09:17:46'),
(236, 116, '[1]', 'Hshs', 'Gsgags', '', '', '', '1549012936IMG_1549012915797_3111150516896864822.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-01 09:22:16', '2019-02-01 09:22:16'),
(237, 77, '[4]', '', '', '', '', '', '1549054106photo_editor_ds_1549054096590.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-01 20:48:26', '2019-02-01 20:48:26'),
(238, 106, '[1]', '', '', '', '', '', '1549089132photo_editor_ds_1549089118684.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-02 06:32:13', '2019-02-02 06:32:13'),
(239, 97, '[3]', '', '', 'hA6hldpSTF8', 'Marvel Studios\' Avengers - Official Trailer', 'Part of the journey is the end. ▻ Subscribe to Marvel: http://bit.ly/WeO3YJ Learn more: https://bit.ly/2QD3Z85 --- Follow Marvel on Twitter: ...', '', '', '', 'https://i.ytimg.com/vi/hA6hldpSTF8/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-02-05 07:25:24', '2019-02-05 07:25:24'),
(240, 108, '[1]', 'Comp', 'Hshsusu', 'PAcWRu8EuMM', 'What Even is This TINY Computer?', 'Sign up for Private Internet Access VPN at https://lmg.gg/pialinus2.', '', '', '', 'https://i.ytimg.com/vi/PAcWRu8EuMM/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-06 16:14:05', '2019-02-06 16:14:05'),
(241, 97, '[1]', 'Best song', 'Amazing', 'sOnqjkJTMaA', 'Michael Jackson - Thriller (Official Music Video)', 'Michael Jackson\'s official music video for \"Thriller\" Listen to more Michael Jackson: https://MichaelJackson.lnk.to/Stream!to Michael Jackson\'s 14-minute short ...', '', '', '', 'https://i.ytimg.com/vi/sOnqjkJTMaA/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-08 11:29:09', '2019-02-08 11:29:09'),
(242, 97, '[4]', 'Ysysyys', 'Ysyshsheh', 'mk48xRzuNvA', 'The Script - Hall of Fame (Official Video) ft. will.i.am', 'Playlist Best of The Script https://goo.gl/4MuiXf Subscribe for more https://goo.gl/DxhKUv The Script\'s official music video for \'Hall of Fame\'. Click to listen to The ...', '', '', '', 'https://i.ytimg.com/vi/mk48xRzuNvA/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-08 11:32:28', '2019-02-08 11:32:28'),
(243, 97, '[2]', 'Dance Dance', '💃🕺', 'x6Q7c9RyMzk', 'Maari 2 - Rowdy Baby (Video Song) | Dhanush, Sai Pallavi | Yuvan Shankar Raja | Balaji Mohan', 'Unleashing the Video Song of #RowdyBaby from #Maari2. Maari 2 stars Dhanush, Sai Pallavi, Krishna, Varalakshmi Sarathkumar & Tovino Thomas in lead ...', '', '', '', 'https://i.ytimg.com/vi/x6Q7c9RyMzk/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-09 07:22:42', '2019-02-09 07:22:42'),
(244, 97, '[2]', 'Happy', '', 'x6Q7c9RyMzk', 'Maari 2 - Rowdy Baby (Video Song) | Dhanush, Sai Pallavi | Yuvan Shankar Raja | Balaji Mohan', 'Unleashing the Video Song of #RowdyBaby from #Maari2. Maari 2 stars Dhanush, Sai Pallavi, Krishna, Varalakshmi Sarathkumar & Tovino Thomas in lead ...', '', '', '', 'https://i.ytimg.com/vi/x6Q7c9RyMzk/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-09 08:59:40', '2019-02-09 08:59:40'),
(245, 117, '[1]', '', '👌👌👌', '2_NzEpRVGxQ', 'Top 40 Viral Videos of the Year 2018', 'Here is Newsflare\'s top 40 viral videos of the year for 2018, with some of the most amazing clips of 2018 specially selected for your viewing entertainment.', '', '', '', 'https://i.ytimg.com/vi/2_NzEpRVGxQ/hqdefault.jpg', 'Asia/Kolkata', 4, 2, 0, NULL, 0, 0, '2019-02-09 11:47:25', '2019-02-09 11:47:25'),
(246, 117, '[5]', 'View', '💐', '', '', '', '1549713860photo_editor_ds_1549713777251.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-09 12:04:20', '2019-02-09 12:04:20'),
(247, 79, '[\"2\",\"1\",\"6\",\"5\",\"3\",\"4\"]', 'testing Title', 'Description', NULL, NULL, NULL, '1549713972image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-09 12:06:12', '2019-02-09 12:06:12'),
(248, 79, '[\"2\"]', '', '', NULL, NULL, NULL, '1549714309image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-09 12:11:50', '2019-02-09 12:11:50');
INSERT INTO `user_posts` (`id`, `user_id`, `mood_id`, `title`, `description`, `youtube_video_id`, `youtube_video_title`, `youtube_video_description`, `media`, `video_thumb`, `gif_image_url`, `youtube_video_thumb`, `timezone`, `type`, `post_duration`, `is_by_admin`, `admin_post_type`, `is_deleted`, `is_removed`, `created_at`, `updated_at`) VALUES
(249, 79, '[\"2\"]', 'This is a test post title', 'Test post desc', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif', NULL, 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-02-09 12:59:50', '2019-02-09 12:59:50'),
(250, 119, '[6]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 1, 0, NULL, 0, 0, '2019-02-10 09:34:02', '2019-02-10 09:34:02'),
(251, 97, '[6]', 'Funny', 'Lol', 'XTHr4kjVj2o', 'TRY NOT TO LAUGH - EPIC FAILS Vines | Funny Videos February 2019', 'Brand new weekly fail compilation of the funniest Fails of the week for January 2019. Selection includes kids getting owned, trick shots gone wrong, home video ...', '', '', '', 'https://i.ytimg.com/vi/XTHr4kjVj2o/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-02-12 20:12:09', '2019-02-12 20:12:09'),
(252, 113, '[\"4\"]', '', '', 'mk48xRzuNvA', 'The Script - Hall of Fame (Official Video) ft. will.i.am', 'Playlist Best of The Script https://goo.gl/4MuiXf Subscribe for more https://goo.gl/DxhKUv The Script\'s official music video for \'Hall of Fame\'. Click to listen to The ...', '', '', NULL, 'https://img.youtube.com/vi/mk48xRzuNvA/sddefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-13 05:49:19', '2019-02-13 05:49:19'),
(253, 120, '[\"5\"]', '', '', NULL, NULL, NULL, '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', NULL, 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-02-13 12:30:33', '2019-02-13 12:30:33'),
(254, 79, '[\"1\"]', 'dad', 'effete', 'fvjpE_wFL5A', 'Lauv & Troye Sivan - i\'m so tired... [Official Audio]', '\"i\'m so tired...\" by Lauv & Troye Sivan available now: https://lauv.lnk.to/imsotiredYD Watch Troye Sivan\'s version here: https://lauv.lnk.to/ISTtroyevisual ...', '', '', NULL, 'https://img.youtube.com/vi/fvjpE_wFL5A/sddefault.jpg', 'Asia/Kolkata', 4, 2, 0, NULL, 0, 0, '2019-02-18 11:08:33', '2019-02-18 11:08:33'),
(255, 3, '[5]', 'Test', 'Test', '', '', '', '1550747157IMG_1550747112135_9165509634892659857.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 1, 0, '2019-02-21 11:05:57', '2019-02-25 11:02:39'),
(256, 3, '[5]', 'Test', 'Test', '', '', '', '1550933801IMG_1550933777082_719879302954370309.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 1, 0, '2019-02-23 14:56:42', '2019-02-25 10:59:34'),
(257, 124, '[2]', 'test', 'test', '', '', '', '155109420714883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:30:07', '2019-02-25 11:30:07'),
(258, 124, '[2]', 'test', 'test', '', '', '', '155109425814883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:30:59', '2019-02-25 11:30:59'),
(259, 124, '[2]', 'test', 'test', '', '', '', '155109429114883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:31:32', '2019-02-25 11:31:32'),
(260, 124, '[2]', 'test', 'test', '', '', '', '155109438314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:33:03', '2019-02-25 11:33:03'),
(261, 124, '[2]', 'test', 'test', '', '', '', '155109440014883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:33:21', '2019-02-25 11:33:21'),
(262, 124, '[2]', 'test', 'test', '', '', '', '155109483814883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:40:39', '2019-02-25 11:40:39'),
(263, 124, '[2]', 'test', 'test', '', '', '', '155109488314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:41:24', '2019-02-25 11:41:24'),
(264, 124, '[2]', 'test', 'test', '', '', '', '155109491614883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:41:56', '2019-02-25 11:41:56'),
(265, 124, '[2]', 'test', 'test', '', '', '', '155109518114883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:46:22', '2019-02-25 11:46:22'),
(266, 124, '[2]', 'test', 'test', '', '', '', '155109594314883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:59:03', '2019-02-25 11:59:03'),
(267, 124, '[2]', 'test', 'test', '', '', '', '155109597114883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:59:32', '2019-02-25 11:59:32'),
(268, 124, '[2]', 'test', 'test', '', '', '', '155109599614883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 11:59:57', '2019-02-25 11:59:57'),
(269, 124, '[2]', 'test', 'test', '', '', '', '155109603114883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:00:32', '2019-02-25 12:00:32'),
(270, 124, '[2]', 'test', 'test', '', '', '', '155109632714883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:05:27', '2019-02-25 12:05:27'),
(271, 124, '[2]', 'test', 'test', '', '', '', '155109634914883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:05:49', '2019-02-25 12:05:49'),
(272, 124, '[2]', 'test', 'test', '', '', '', '155109639514883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:06:36', '2019-02-25 12:06:36'),
(273, 124, '[2]', 'test', 'test', '', '', '', '155109643514883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:07:16', '2019-02-25 12:07:16'),
(274, 124, '[2]', 'test', 'test', '', '', '', '155109644014883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:07:20', '2019-02-25 12:07:20'),
(275, 124, '[2]', 'test', 'test', '', '', '', '155109654514883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:09:06', '2019-02-25 12:09:06'),
(276, 124, '[2]', 'test', 'test', '', '', '', '155109658414883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:09:44', '2019-02-25 12:09:44'),
(277, 124, '[2]', 'test', 'test', '', '', '', '155109669214883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:11:33', '2019-02-25 12:11:33'),
(278, 124, '[3]', 'test', 'test', '', '', '', '155109671614883620470641984379_d40ecb2a-9e40-45c4-a45c-79dc57bf2999_600x600.jpg', '', '', '', 'Asia/Kolkata', 1, 1, 0, NULL, 0, 0, '2019-02-25 12:11:57', '2019-02-25 12:11:57'),
(279, 125, '[2]', 'Hello', 'Snskkd', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:04:43', '2019-02-26 12:04:55'),
(280, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:05:12', '2019-02-26 12:15:03'),
(281, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:17:20', '2019-02-26 12:23:15'),
(282, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:23:51', '2019-02-26 12:23:59'),
(283, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:24:10', '2019-02-26 12:24:22'),
(284, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:24:41', '2019-02-26 12:24:46'),
(285, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:29:31', '2019-02-26 12:29:43'),
(286, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:30:06', '2019-02-26 12:30:11'),
(287, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:31:44', '2019-02-26 12:32:02'),
(288, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:32:15', '2019-02-26 12:32:21'),
(289, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 12:32:31', '2019-02-26 12:32:39'),
(290, 125, '[2]', '', '', '', '', '', '', '', 'https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 17:29:52', '2019-02-26 17:36:29'),
(291, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 1, 0, '2019-02-26 17:36:38', '2019-02-26 17:37:17'),
(292, 125, '[2]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-02-26 17:37:56', '2019-02-26 17:37:56'),
(293, 3, '[4]', 'Test', 'Tedt', '', '', '', '1551360270photo_editor_ds_1551360236133.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-28 13:24:30', '2019-02-28 13:24:30'),
(294, 3, '[4]', 'Tst', 'Tedt', '', '', '', '1551360438photo_editor_ds_1551360418195.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-28 13:27:19', '2019-02-28 13:27:19'),
(295, 3, '[4]', 'Tst', 'Tedt', '', '', '', '1551360479photo_editor_ds_1551360418195.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-28 13:27:59', '2019-02-28 13:27:59'),
(296, 3, '[4]', 'Test', 'Test', '', '', '', '1551360541photo_editor_ds_1551360537512.jpg', '', '', '', 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-02-28 13:29:01', '2019-02-28 13:29:01'),
(297, 126, '[1]', '', '', '', '', '', '', '', 'http://www.reactiongifs.com/r/hsk.gif', '', 'Asia/Kolkata', 3, 2, 0, NULL, 0, 0, '2019-02-28 13:43:24', '2019-02-28 13:43:24'),
(298, 97, '[4]', '', '', 'IPXIgEAGe4U', 'Panic! At The Disco - High Hopes (Official Video)', 'The official video of \"High Hopes\" by Panic! At The Disco from the album \'Pray For The Wicked\'. No matter how hard your dreams seem, keep going. You might ...', '', '', '', 'https://i.ytimg.com/vi/IPXIgEAGe4U/hqdefault.jpg', 'Asia/Dubai', 4, 2, 0, NULL, 0, 0, '2019-02-28 14:46:10', '2019-02-28 14:46:10'),
(299, 120, '[\"5\"]', '', '', NULL, NULL, NULL, '1551695790image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-03-04 10:36:31', '2019-03-04 10:36:31'),
(300, 120, '[\"5\"]', '', '', NULL, NULL, NULL, '1551695866image.jpg', '', NULL, NULL, 'Asia/Kolkata', 1, 2, 0, NULL, 0, 0, '2019-03-04 10:37:47', '2019-03-04 10:37:47'),
(301, 108, '[1]', 'Title 1', '', 'Zi_XLOBDo_Y', 'Michael Jackson - Billie Jean (Official Music Video)', 'Listen to more Michael Jackson: https://MichaelJackson.lnk.to/Stream!bjo \"\"Billie Jean\"\" was the first short film made for \'Thriller,\' the biggest-selling album of all ...', '', '', '', 'https://i.ytimg.com/vi/Zi_XLOBDo_Y/hqdefault.jpg', 'Asia/Dubai', 4, 1, 0, NULL, 0, 0, '2019-03-12 18:29:05', '2019-03-12 18:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_post_share`
--

CREATE TABLE `user_post_share` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shared_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_post_share`
--

INSERT INTO `user_post_share` (`id`, `post_id`, `user_id`, `shared_user_id`, `created_at`, `updated_at`) VALUES
(8, 139, 3, 77, '2018-12-01 14:03:06', '2018-12-01 14:03:06'),
(9, 139, 3, 77, '2018-12-01 14:09:20', '2018-12-01 14:09:20'),
(10, 139, 3, 77, '2018-12-01 14:12:30', '2018-12-01 14:12:30'),
(11, 139, 3, 77, '2018-12-01 14:12:39', '2018-12-01 14:12:39'),
(12, 155, 3, 77, '2018-12-01 22:27:20', '2018-12-01 22:27:20'),
(13, 155, 3, 77, '2018-12-01 22:33:55', '2018-12-01 22:33:55'),
(14, 155, 3, 77, '2018-12-01 22:36:47', '2018-12-01 22:36:47'),
(15, 155, 3, 77, '2018-12-01 22:37:09', '2018-12-01 22:37:09'),
(16, 155, 3, 77, '2018-12-01 22:37:29', '2018-12-01 22:37:29'),
(17, 157, 3, 77, '2018-12-01 23:09:32', '2018-12-01 23:09:32'),
(18, 156, 3, 77, '2018-12-01 23:09:55', '2018-12-01 23:09:55'),
(19, 103, 3, 77, '2018-12-01 23:10:33', '2018-12-01 23:10:33'),
(20, 81, 3, 77, '2018-12-01 23:18:33', '2018-12-01 23:18:33'),
(21, 139, 3, 77, '2018-12-03 07:07:51', '2018-12-03 07:07:51'),
(22, 139, 3, 77, '2018-12-03 07:09:00', '2018-12-03 07:09:00'),
(23, 139, 3, 77, '2018-12-03 07:09:24', '2018-12-03 07:09:24'),
(24, 139, 3, 77, '2018-12-03 07:28:38', '2018-12-03 07:28:38'),
(25, 139, 3, 77, '2018-12-03 07:29:08', '2018-12-03 07:29:08'),
(26, 139, 3, 77, '2018-12-03 07:44:23', '2018-12-03 07:44:23'),
(27, 134, 3, 77, '2018-12-03 10:57:05', '2018-12-03 10:57:05'),
(28, 134, 3, 77, '2018-12-03 10:57:14', '2018-12-03 10:57:14'),
(29, 139, 3, 77, '2018-12-03 10:58:32', '2018-12-03 10:58:32'),
(30, 139, 3, 77, '2018-12-03 10:59:09', '2018-12-03 10:59:09'),
(31, 139, 3, 77, '2018-12-03 10:59:24', '2018-12-03 10:59:24'),
(32, 139, 3, 77, '2018-12-03 11:00:43', '2018-12-03 11:00:43'),
(33, 139, 3, 77, '2018-12-03 11:02:11', '2018-12-03 11:02:11'),
(34, 139, 3, 77, '2018-12-03 12:35:18', '2018-12-03 12:35:18'),
(35, 139, 3, 77, '2018-12-03 12:36:46', '2018-12-03 12:36:46'),
(36, 158, 3, 77, '2018-12-03 12:43:49', '2018-12-03 12:43:49'),
(37, 129, 3, 77, '2018-12-03 12:45:47', '2018-12-03 12:45:47'),
(38, 160, 102, 77, '2018-12-04 06:02:25', '2018-12-04 06:02:25'),
(39, 139, 102, 90, '2018-12-04 06:10:29', '2018-12-04 06:10:29'),
(40, 160, 102, 94, '2018-12-04 06:16:57', '2018-12-04 06:16:57'),
(41, 168, 102, 94, '2018-12-04 06:28:54', '2018-12-04 06:28:54'),
(42, 113, 102, 94, '2018-12-04 06:51:07', '2018-12-04 06:51:07'),
(43, 167, 102, 94, '2018-12-04 07:00:25', '2018-12-04 07:00:25'),
(44, 143, 102, 96, '2018-12-04 09:56:32', '2018-12-04 09:56:32'),
(45, 156, 102, 94, '2018-12-04 10:02:04', '2018-12-04 10:02:04'),
(46, 186, 102, 94, '2018-12-04 11:15:54', '2018-12-04 11:15:54'),
(47, 38, 77, 3, '2018-12-05 09:52:10', '2018-12-05 09:52:10'),
(48, 38, 77, 3, '2018-12-05 09:55:04', '2018-12-05 09:55:04'),
(49, 38, 77, 3, '2018-12-05 09:55:50', '2018-12-05 09:55:50'),
(50, 38, 77, 3, '2018-12-05 11:07:11', '2018-12-05 11:07:11'),
(51, 38, 77, 3, '2018-12-05 11:07:48', '2018-12-05 11:07:48'),
(52, 38, 77, 3, '2018-12-05 11:26:38', '2018-12-05 11:26:38'),
(53, 191, 77, 3, '2018-12-05 11:46:45', '2018-12-05 11:46:45'),
(54, 190, 77, 3, '2018-12-05 11:47:23', '2018-12-05 11:47:23'),
(55, 191, 77, 3, '2018-12-05 12:51:53', '2018-12-05 12:51:53'),
(56, 190, 77, 3, '2018-12-05 12:53:45', '2018-12-05 12:53:45'),
(57, 190, 77, 3, '2018-12-05 12:54:07', '2018-12-05 12:54:07'),
(58, 190, 77, 3, '2018-12-05 12:54:43', '2018-12-05 12:54:43'),
(59, 197, 103, 88, '2018-12-06 17:05:52', '2018-12-06 17:05:52'),
(60, 204, 106, 3, '2018-12-20 11:55:10', '2018-12-20 11:55:10'),
(61, 214, 3, 3, '2018-12-30 20:14:50', '2018-12-30 20:14:50'),
(62, 214, 3, 3, '2018-12-30 20:17:35', '2018-12-30 20:17:35'),
(63, 213, 3, 78, '2018-12-30 20:20:49', '2018-12-30 20:20:49'),
(64, 214, 3, 78, '2018-12-30 20:21:11', '2018-12-30 20:21:11'),
(65, 226, 108, 88, '2019-01-25 07:00:55', '2019-01-25 07:00:55'),
(66, 166, 79, 78, '2019-01-26 19:35:31', '2019-01-26 19:35:31'),
(67, 231, 116, 84, '2019-02-01 09:37:43', '2019-02-01 09:37:43'),
(68, 232, 116, 106, '2019-02-01 09:39:06', '2019-02-01 09:39:06'),
(69, 231, 116, 3, '2019-02-01 09:43:59', '2019-02-01 09:43:59'),
(70, 165, 79, 76, '2019-02-09 12:35:07', '2019-02-09 12:35:07'),
(71, 247, 120, 76, '2019-02-13 10:44:50', '2019-02-13 10:44:50'),
(72, 247, 120, 84, '2019-02-13 12:01:42', '2019-02-13 12:01:42'),
(73, 247, 120, 116, '2019-02-13 12:02:29', '2019-02-13 12:02:29'),
(74, 247, 106, 90, '2019-02-13 12:02:45', '2019-02-13 12:02:45'),
(75, 247, 120, 116, '2019-02-13 12:03:44', '2019-02-13 12:03:44'),
(76, 247, 120, 116, '2019-02-13 12:04:33', '2019-02-13 12:04:33'),
(77, 252, 108, 88, '2019-02-18 05:51:28', '2019-02-18 05:51:28'),
(78, 254, 79, 3, '2019-02-18 11:08:43', '2019-02-18 11:08:43'),
(79, 254, 79, 3, '2019-02-18 11:40:21', '2019-02-18 11:40:21'),
(80, 254, 79, 78, '2019-02-18 11:40:28', '2019-02-18 11:40:28'),
(81, 232, 79, 78, '2019-02-18 11:42:22', '2019-02-18 11:42:22'),
(82, 166, 125, 3, '2019-02-26 13:01:52', '2019-02-26 13:01:52'),
(83, 144, 125, 3, '2019-02-26 17:29:34', '2019-02-26 17:29:34'),
(84, 152, 125, 76, '2019-02-26 17:38:17', '2019-02-26 17:38:17'),
(85, 292, 79, 76, '2019-02-28 10:44:07', '2019-02-28 10:44:07'),
(86, 277, 79, 76, '2019-02-28 10:50:59', '2019-02-28 10:50:59'),
(87, 278, 3, 125, '2019-02-28 11:00:27', '2019-02-28 11:00:27'),
(88, 278, 3, 125, '2019-02-28 11:07:32', '2019-02-28 11:07:32'),
(89, 228, 3, 125, '2019-02-28 12:40:53', '2019-02-28 12:40:53'),
(90, 277, 3, 77, '2019-02-28 12:51:31', '2019-02-28 12:51:31'),
(91, 232, 3, 77, '2019-02-28 13:21:27', '2019-02-28 13:21:27'),
(92, 232, 3, 126, '2019-02-28 13:23:24', '2019-02-28 13:23:24'),
(93, 295, 126, 3, '2019-02-28 13:28:36', '2019-02-28 13:28:36'),
(94, 145, 76, 79, '2019-02-28 14:02:16', '2019-02-28 14:02:16'),
(95, 154, 79, 76, '2019-03-03 18:38:25', '2019-03-03 18:38:25'),
(96, 154, 76, 79, '2019-03-03 19:04:57', '2019-03-03 19:04:57'),
(97, 156, 79, 76, '2019-03-03 19:18:12', '2019-03-03 19:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_report_post`
--

CREATE TABLE `user_report_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_report_post`
--

INSERT INTO `user_report_post` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 3, 139, '2018-12-03 07:02:29', '2018-12-03 07:02:29'),
(2, 3, 137, '2018-12-03 07:27:32', '2018-12-03 07:27:32'),
(3, 3, 137, '2018-12-03 07:36:05', '2018-12-03 07:36:05'),
(4, 3, 157, '2018-12-03 08:59:40', '2018-12-03 08:59:40'),
(5, 102, 160, '2018-12-04 06:17:47', '2018-12-04 06:17:47'),
(6, 102, 168, '2018-12-04 06:30:40', '2018-12-04 06:30:40'),
(7, 102, 129, '2018-12-04 06:41:40', '2018-12-04 06:41:40'),
(8, 102, 186, '2018-12-04 11:33:42', '2018-12-04 11:33:42'),
(9, 102, 183, '2018-12-04 11:42:25', '2018-12-04 11:42:25'),
(10, 94, 188, '2018-12-04 12:36:55', '2018-12-04 12:36:55'),
(11, 3, 183, '2018-12-04 19:47:13', '2018-12-04 19:47:13'),
(12, 3, 180, '2018-12-04 19:54:48', '2018-12-04 19:54:48'),
(13, 3, 180, '2018-12-04 20:19:56', '2018-12-04 20:19:56'),
(14, 3, 188, '2018-12-08 17:37:23', '2018-12-08 17:37:23'),
(15, 3, 183, '2018-12-16 19:14:40', '2018-12-16 19:14:40'),
(16, 107, 97, '2018-12-19 18:40:32', '2018-12-19 18:40:32'),
(17, 106, 204, '2018-12-20 11:56:12', '2018-12-20 11:56:12'),
(18, 106, 238, '2019-02-13 11:29:02', '2019-02-13 11:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_socket`
--

CREATE TABLE `user_socket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `socket_id` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) NOT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_socket`
--

INSERT INTO `user_socket` (`id`, `user_id`, `socket_id`, `conversation_id`, `timezone`, `created_at`, `updated_at`) VALUES
(974, 3, 'fGG_K_cyBqVq12VNAAAA', -1, NULL, '2019-01-31 14:25:14', '2019-01-31 14:25:14'),
(995, 3, 'yLIj1bWCVTHo7DdcAAAA', -1, NULL, '2019-01-31 14:39:25', '2019-01-31 14:39:25'),
(998, 3, 'IIv0ycsW-vBICHmjAAAD', 73, NULL, '2019-01-31 14:39:42', '2019-01-31 14:39:42'),
(999, 3, 'j4EnVTZppjLxxbfMAAAA', 73, NULL, '2019-01-31 14:42:24', '2019-01-31 14:42:24'),
(1000, 3, 'YuZ7fqm-5XFm1I_oAAAB', 73, NULL, '2019-01-31 14:42:26', '2019-01-31 14:42:26'),
(1005, 3, 'YwXPQHvcb-5VIkjFAAAG', 73, NULL, '2019-01-31 14:44:13', '2019-01-31 14:44:13'),
(1006, 3, '_y-weV21sH6pfkNgAAAA', 73, NULL, '2019-01-31 14:44:27', '2019-01-31 14:44:27'),
(1007, 3, 'S3zpBb24lm4kDCnsAAAB', 73, NULL, '2019-01-31 14:44:28', '2019-01-31 14:44:28'),
(1008, 3, 'zp2YpaUyiQkNQRJ1AAAC', 73, NULL, '2019-01-31 14:45:30', '2019-01-31 14:45:30'),
(1009, 3, 'Z5KPAFswWO59k5wfAAAD', 73, NULL, '2019-01-31 14:45:30', '2019-01-31 14:45:30'),
(1011, 3, 'bTEj3GRr-pY_7cJyAAAB', 73, NULL, '2019-01-31 14:47:03', '2019-01-31 14:47:03'),
(1012, 3, 'cL_HkViz7ZI7jDFoAAAC', 73, NULL, '2019-01-31 14:47:06', '2019-01-31 14:47:06'),
(1015, 77, '5IO08xVq3wZRJMzbAAAF', 74, NULL, '2019-01-31 14:48:51', '2019-01-31 14:48:51'),
(1017, 3, 'ynstmh706JRCluklAAAH', 73, NULL, '2019-01-31 14:51:53', '2019-01-31 14:51:53'),
(1018, 3, '0rEYlTavcQDB6fAdAAAI', 73, NULL, '2019-01-31 14:52:06', '2019-01-31 14:52:06'),
(1021, 3, 'FSsPCrlnlkA5q4UVAAAA', 73, NULL, '2019-01-31 14:53:41', '2019-01-31 14:53:41'),
(1022, 3, 'BMDZW14OIe5-7GbqAAAB', 73, NULL, '2019-01-31 14:53:42', '2019-01-31 14:53:42'),
(1023, 3, 'FWYjHO5CLxtOoqgxAAAC', 73, NULL, '2019-01-31 14:55:53', '2019-01-31 14:55:53'),
(1024, 3, '5r7yyNzuGGxBY36MAAAD', 73, NULL, '2019-01-31 14:55:53', '2019-01-31 14:55:53'),
(1053, 3, 'S0Pkqwt8xF0hlhI6AAAa', 73, NULL, '2019-02-01 05:12:46', '2019-02-01 05:12:46'),
(1055, 3, 'qdq2o6lQcd74GFwgAAAA', 73, NULL, '2019-02-01 05:14:34', '2019-02-01 05:14:34'),
(1056, 115, 'ZQlQu7rdI5g7ypsrAAAB', 73, NULL, '2019-02-01 05:14:38', '2019-02-01 05:14:38'),
(1057, 3, 'ZiDkZ6N4_XxjJYJWAAAA', 73, NULL, '2019-02-01 05:16:13', '2019-02-01 05:16:13'),
(1058, 115, 'TxFXmkIA07w6B0-4AAAB', 73, NULL, '2019-02-01 05:16:32', '2019-02-01 05:16:32'),
(1059, 115, 'KxPlxaK3TGekMStJAAAA', 73, NULL, '2019-02-01 05:19:12', '2019-02-01 05:19:12'),
(1061, 3, 'a63anHjbIRbYRW4MAAAC', 73, NULL, '2019-02-01 05:19:52', '2019-02-01 05:19:52'),
(1062, 3, 'JlOw2IDI27bViwHHAAAA', 73, NULL, '2019-02-01 05:22:13', '2019-02-01 05:22:13'),
(1063, 3, 'JYnyQ536jjhgdlu_AAAB', 73, NULL, '2019-02-01 05:31:27', '2019-02-01 05:31:27'),
(1064, 3, 'zUrg9_25TWzicGWyAAAC', 73, NULL, '2019-02-01 05:42:20', '2019-02-01 05:42:20'),
(1086, 106, 'N8qRAjMmB16bhrGrAAAY', 83, NULL, '2019-02-04 13:42:22', '2019-02-04 13:42:22'),
(1120, 77, 'N7NIJXKn1p_GZEAFAAAO', 87, NULL, '2019-02-07 07:55:34', '2019-02-07 07:55:34'),
(1128, 79, 'NreVL8h4KiipW_W3AAAX', 64, NULL, '2019-02-09 09:03:42', '2019-02-09 09:03:42'),
(1129, 79, 'dP0RfOF2ssoeEVr_AAAY', 64, NULL, '2019-02-09 09:03:45', '2019-02-09 09:03:45'),
(1133, 79, 'lsro1wKbnBsi-aBaAAAc', 93, NULL, '2019-02-09 09:48:54', '2019-02-09 09:48:54'),
(1135, 79, 'R047rvnbzScTMO_MAAAe', 87, NULL, '2019-02-09 09:55:25', '2019-02-09 09:55:25'),
(1138, 79, 'AjvuzsZM_hnLzyKWAAAh', 0, NULL, '2019-02-09 10:27:33', '2019-02-09 10:27:33'),
(1139, 79, 'd8yUFn77n7swg7s1AAAi', 0, NULL, '2019-02-09 10:27:48', '2019-02-09 10:27:48'),
(1140, 79, 'Sx6waPp-yzoRbUTWAAAj', 0, NULL, '2019-02-09 10:27:57', '2019-02-09 10:27:57'),
(1175, 113, 'SJTHdMhK5OFcV9NBAAAE', 105, NULL, '2019-02-13 05:46:42', '2019-02-13 05:46:42'),
(1177, 113, '2SB1g4TwzGsZYGWpAAAH', 104, NULL, '2019-02-13 05:47:15', '2019-02-13 05:47:15'),
(1178, 113, 'IHv5fB5HJmyjUSbZAAAG', 105, NULL, '2019-02-13 05:47:15', '2019-02-13 05:47:15'),
(1179, 113, 'VQq_5oHrhGoXDWnWAAAI', 105, NULL, '2019-02-13 05:48:45', '2019-02-13 05:48:45'),
(1180, 113, 'Pm1d5-emo8R05EVkAAAJ', 104, NULL, '2019-02-13 05:48:45', '2019-02-13 05:48:45'),
(1181, 113, 'HGH-Dfb8CUkQQ6cpAAAL', 104, NULL, '2019-02-13 05:49:45', '2019-02-13 05:49:45'),
(1182, 113, 'kQCzYjwrq0WTHkLQAAAK', 105, NULL, '2019-02-13 05:49:45', '2019-02-13 05:49:45'),
(1187, 120, 'ug5UWgLGv1clwQ3AAAAR', 0, NULL, '2019-02-13 10:44:54', '2019-02-13 10:44:54'),
(1188, 120, '6mHZT4tfjagD32Q4AAAS', 108, NULL, '2019-02-13 10:47:35', '2019-02-13 10:47:35'),
(1189, 120, 'slwIYErFAL5qScDXAAAT', 108, NULL, '2019-02-13 11:02:09', '2019-02-13 11:02:09'),
(1190, 120, 'Aow4uNVx8GQr0WuQAAAU', 108, NULL, '2019-02-13 11:03:39', '2019-02-13 11:03:39'),
(1191, 120, 'eoGMHNeJIEm1mBNNAAAV', 108, NULL, '2019-02-13 11:09:45', '2019-02-13 11:09:45'),
(1192, 120, 'd6YGQyNA4TzoaXquAAAW', 108, NULL, '2019-02-13 11:19:00', '2019-02-13 11:19:00'),
(1193, 120, 'dbZAQ2QSPvA8qJOlAAAY', 108, NULL, '2019-02-13 11:24:13', '2019-02-13 11:24:13'),
(1194, 120, 'fPUixCKtmoeEjUY7AAAZ', 108, NULL, '2019-02-13 11:34:01', '2019-02-13 11:34:01'),
(1195, 120, 'RNgdRku3nOc7_uKqAAA1', 108, NULL, '2019-02-13 11:41:39', '2019-02-13 11:41:39'),
(1196, 120, 'fPeNfkHVOU1yOWVNAAA3', 108, NULL, '2019-02-13 11:43:33', '2019-02-13 11:43:33'),
(1197, 120, 'UyH_npVnkJED8HnCAAA4', 0, NULL, '2019-02-13 11:50:02', '2019-02-13 11:50:02'),
(1198, 120, 'GzmXtL23pa194q3AAAA5', 107, NULL, '2019-02-13 11:50:54', '2019-02-13 11:50:54'),
(1199, 120, 'ElHmpvFnB7kqD6EqAAA6', 0, NULL, '2019-02-13 11:52:03', '2019-02-13 11:52:03'),
(1200, 120, 'C8w4BHPENYYIiysPAAA7', 0, NULL, '2019-02-13 11:52:06', '2019-02-13 11:52:06'),
(1204, 120, 'PsZ1D8OpmexCx0V7AAA_', 109, NULL, '2019-02-13 11:54:52', '2019-02-13 11:54:52'),
(1205, 120, 'cFB9bTroKql_vNvHAABA', 110, NULL, '2019-02-13 11:54:52', '2019-02-13 11:54:52'),
(1208, 120, 'U3JvuAzBTRk23uFzAABD', 0, NULL, '2019-02-13 12:02:32', '2019-02-13 12:02:32'),
(1210, 120, 'qiZKPVO1yuVhFA5RAABF', 0, NULL, '2019-02-13 12:03:47', '2019-02-13 12:03:47'),
(1213, 120, 'Ewa1zpZ3Qk7TfSulAABI', 121, NULL, '2019-02-13 12:06:00', '2019-02-13 12:06:00'),
(1215, 120, 'B9Ty0sk-8g07d5FxAABK', 125, NULL, '2019-02-13 12:09:20', '2019-02-13 12:09:20'),
(1216, 120, 'VdAjDfzVTDPjXR0dAABL', 124, NULL, '2019-02-13 12:10:42', '2019-02-13 12:10:42'),
(1217, 120, '35lB7k2AXB4Y0QSIAABM', 124, NULL, '2019-02-13 12:10:53', '2019-02-13 12:10:53'),
(1219, 120, '-Qc4V_zWQ8_EtkwuAABO', 126, NULL, '2019-02-13 12:11:36', '2019-02-13 12:11:36'),
(1222, 120, 'qiLT_vBtBAApcgUEAABR', 128, NULL, '2019-02-13 12:19:52', '2019-02-13 12:19:52'),
(1223, 120, 'teRe8jWOHdWZ7WLFAABS', 126, NULL, '2019-02-13 12:19:52', '2019-02-13 12:19:52'),
(1224, 120, 'YXwgIWKyItCOnSiOAABT', 127, NULL, '2019-02-13 12:19:52', '2019-02-13 12:19:52'),
(1226, 120, 'eD3E3_CvF9NJSF-2AABW', 127, NULL, '2019-02-13 12:21:44', '2019-02-13 12:21:44'),
(1227, 120, 'GPkl9SUJB1dfnfjuAABV', 128, NULL, '2019-02-13 12:21:44', '2019-02-13 12:21:44'),
(1228, 120, 'WqI5mefZEUPcvs7qAABX', 126, NULL, '2019-02-13 12:21:44', '2019-02-13 12:21:44'),
(1229, 120, 'MhbcLkkP7xt37jKBAABY', 128, NULL, '2019-02-13 12:25:33', '2019-02-13 12:25:33'),
(1230, 120, 'R9UjCvvlGqKSXx2cAABa', 127, NULL, '2019-02-13 12:25:33', '2019-02-13 12:25:33'),
(1231, 120, '1cte_CaJ3re5xp50AABZ', 126, NULL, '2019-02-13 12:25:33', '2019-02-13 12:25:33'),
(1233, 120, 'y2txujAUGUDYEa31AABc', 126, NULL, '2019-02-13 12:25:47', '2019-02-13 12:25:47'),
(1234, 120, 'BjJ51K0QJ0CQaPL0AABd', 126, NULL, '2019-02-13 12:26:01', '2019-02-13 12:26:01'),
(1236, 120, 'PiGYh3dAVaHcVZAmAABf', 127, NULL, '2019-02-13 12:30:19', '2019-02-13 12:30:19'),
(1237, 120, 'IVo8zP0BJ1JZuU7MAABg', 126, NULL, '2019-02-13 12:30:19', '2019-02-13 12:30:19'),
(1238, 120, 'N-ITa8KUa7TQQaB2AABh', 129, NULL, '2019-02-13 12:30:19', '2019-02-13 12:30:19'),
(1239, 120, '-jri0O7SDw9hoKY8AABi', 128, NULL, '2019-02-13 12:30:19', '2019-02-13 12:30:19'),
(1240, 120, 'YwhEb7RM-4JmuNHkAABk', 131, NULL, '2019-02-13 12:30:19', '2019-02-13 12:30:19'),
(1244, 108, 'TLDsMi3yWRwGDarYAABp', 103, NULL, '2019-02-18 05:52:23', '2019-02-18 05:52:23'),
(1246, 79, 'fSy9_QAB1EiJcEtAAABr', 0, NULL, '2019-02-18 07:45:50', '2019-02-18 07:45:50'),
(1250, 3, 'sfEqtYwCrWN8PcCQAABv', 133, NULL, '2019-02-18 07:51:19', '2019-02-18 07:51:19'),
(1251, 3, 'iR4MI1sy9gZDpg2rAABw', 133, NULL, '2019-02-18 07:51:26', '2019-02-18 07:51:26'),
(1253, 79, 'k1c5hRJxLCUQG9X4AABy', 138, NULL, '2019-02-18 07:52:00', '2019-02-18 07:52:00'),
(1254, 3, 'laCivn3OZjJ6v7U0AABz', 137, NULL, '2019-02-18 07:52:24', '2019-02-18 07:52:24'),
(1256, 3, '9Xqo2wMNjhv3S5kHAAB1', 138, NULL, '2019-02-18 07:52:52', '2019-02-18 07:52:52'),
(1267, 3, '6NT_srLaIPsZ0s-jAACA', 15, NULL, '2019-02-18 08:04:50', '2019-02-18 08:04:50'),
(1269, 79, 'rXL3OeKjZpa9rvNJAACD', 136, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1270, 79, 'P5VaDyqxuokQ777lAACE', 133, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1271, 79, 'XJClzcjLfgVrta5aAACC', 135, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1272, 79, '-_hYL04vaQlqf43WAACG', 134, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1273, 79, 'FRfmiuL87-W8IdKTAACF', 140, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1274, 79, 'z7BCJT4FofTcwE6-AACJ', 142, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1275, 79, 'tDiUmfQoAz1aOgJKAACI', 132, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1276, 79, 'Q6AuY0RXRfb33tVHAACH', 139, NULL, '2019-02-18 08:09:04', '2019-02-18 08:09:04'),
(1279, 3, 'Lt1JWvXO2LUmLlRAAACP', 15, NULL, '2019-02-18 08:27:05', '2019-02-18 08:27:05'),
(1280, 79, '9cjId_3OQV6uiAs3AACT', 142, NULL, '2019-02-18 08:32:33', '2019-02-18 08:32:33'),
(1281, 79, '5AbOx3PC0diZCBSOAACY', 146, NULL, '2019-02-18 08:35:15', '2019-02-18 08:35:15'),
(1283, 79, 'xLCoIgdfb22EkiUCAACs', 0, NULL, '2019-02-18 09:40:15', '2019-02-18 09:40:15'),
(1287, 79, 'bekuAOrfbyKyyUxXAACw', 150, NULL, '2019-02-18 09:41:53', '2019-02-18 09:41:53'),
(1289, 79, 'ohPTz8RBssTVanXkAACx', 0, NULL, '2019-02-18 09:41:53', '2019-02-18 09:41:53'),
(1302, 79, 'VrqEY66QN1gyu6DKAAAD', 0, NULL, '2019-02-18 11:05:41', '2019-02-18 11:05:41'),
(1315, 79, 'A7vwn8CJ51F4oS3fAAAQ', 0, NULL, '2019-02-18 11:40:30', '2019-02-18 11:40:30'),
(1346, 127, '3hrKgo4WofyWQnF-AAAE', 161, NULL, '2019-02-27 12:52:10', '2019-02-27 12:52:10'),
(1347, 127, 'th-MCS7WKQ3r2znJAAAF', 161, NULL, '2019-02-27 12:52:34', '2019-02-27 12:52:34'),
(1348, 127, 'hc2DT6ReqNsOaxOVAAAG', 161, NULL, '2019-02-27 12:53:44', '2019-02-27 12:53:44'),
(1349, 127, 'Uhbhndo_ud-uswWpAAAH', 161, NULL, '2019-02-27 12:54:07', '2019-02-27 12:54:07'),
(1392, 79, '6aPUQzatTApLn5xtAAAV', 0, NULL, '2019-02-28 13:00:41', '2019-02-28 13:00:41'),
(1460, 79, 'ue1Yj7rNUUDr7JORAAAA', 0, NULL, '2019-03-03 18:38:28', '2019-03-03 18:38:28'),
(1516, 79, '7ecmCcZZ5rtpONDlAAAB', 158, NULL, '2019-03-03 19:50:48', '2019-03-03 19:50:48'),
(1517, 79, 't8A_IvpB5NOrMFFkAAAC', 158, NULL, '2019-03-03 19:50:48', '2019-03-03 19:50:48'),
(1579, 79, 'sULhDXTEzZM3qoMyAAAI', 163, NULL, '2019-03-04 08:36:45', '2019-03-04 08:36:45'),
(1591, 79, 'b63rfP-oUamosKXeAAAV', 163, NULL, '2019-03-04 09:12:28', '2019-03-04 09:12:28'),
(1597, 79, 'CBsJE5Y1okIyTLJsAAAa', 171, NULL, '2019-03-04 09:12:31', '2019-03-04 09:12:31'),
(1602, 76, 'BZ-EQaJDVcTVF2RAAAAf', 163, NULL, '2019-03-04 09:17:06', '2019-03-04 09:17:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_quotes`
--
ALTER TABLE `admin_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_login`
--
ALTER TABLE `app_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods`
--
ALTER TABLE `moods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_mood`
--
ALTER TABLE `post_mood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_views`
--
ALTER TABLE `post_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_user`
--
ALTER TABLE `tmp_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_blocked`
--
ALTER TABLE `user_blocked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_conversation`
--
ALTER TABLE `user_conversation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_followers`
--
ALTER TABLE `user_followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_follow_requests`
--
ALTER TABLE `user_follow_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group_members`
--
ALTER TABLE `user_group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_hide_posts`
--
ALTER TABLE `user_hide_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_invite`
--
ALTER TABLE `user_invite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_mood`
--
ALTER TABLE `user_mood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_muted_conversations`
--
ALTER TABLE `user_muted_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_otp`
--
ALTER TABLE `user_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_post_share`
--
ALTER TABLE `user_post_share`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_report_post`
--
ALTER TABLE `user_report_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_socket`
--
ALTER TABLE `user_socket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_quotes`
--
ALTER TABLE `admin_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_login`
--
ALTER TABLE `app_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;
--
-- AUTO_INCREMENT for table `moods`
--
ALTER TABLE `moods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;
--
-- AUTO_INCREMENT for table `post_mood`
--
ALTER TABLE `post_mood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;
--
-- AUTO_INCREMENT for table `post_views`
--
ALTER TABLE `post_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `tmp_user`
--
ALTER TABLE `tmp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `user_blocked`
--
ALTER TABLE `user_blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_conversation`
--
ALTER TABLE `user_conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
--
-- AUTO_INCREMENT for table `user_followers`
--
ALTER TABLE `user_followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `user_follow_requests`
--
ALTER TABLE `user_follow_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `user_group_members`
--
ALTER TABLE `user_group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT for table `user_hide_posts`
--
ALTER TABLE `user_hide_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_invite`
--
ALTER TABLE `user_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1141;
--
-- AUTO_INCREMENT for table `user_mood`
--
ALTER TABLE `user_mood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `user_muted_conversations`
--
ALTER TABLE `user_muted_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=764;
--
-- AUTO_INCREMENT for table `user_otp`
--
ALTER TABLE `user_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_posts`
--
ALTER TABLE `user_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;
--
-- AUTO_INCREMENT for table `user_post_share`
--
ALTER TABLE `user_post_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `user_report_post`
--
ALTER TABLE `user_report_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_socket`
--
ALTER TABLE `user_socket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1607;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
