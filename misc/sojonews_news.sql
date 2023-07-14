-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 26, 2023 at 12:09 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sojonews_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `bookmark_date` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `newsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `bookmark_date`, `isActive`, `createdAt`, `updatedAt`, `userId`, `newsId`) VALUES
(1, '2023-06-23 11:31:02', 1, '2023-06-23 11:31:02', '2023-06-23 11:31:02', NULL, 38),
(2, '2023-06-23 12:03:39', 1, '2023-06-23 12:03:39', '2023-06-23 12:03:39', NULL, 89),
(3, '2023-06-23 12:21:13', 0, '2023-06-23 12:21:13', '2023-06-23 12:21:25', NULL, 89),
(4, '2023-06-23 12:49:13', 1, '2023-06-23 12:49:13', '2023-06-23 12:49:13', NULL, 89),
(5, '2023-06-23 12:49:17', 1, '2023-06-23 12:49:17', '2023-06-23 12:49:17', NULL, 88),
(6, '2023-06-23 12:49:20', 1, '2023-06-23 12:49:20', '2023-06-23 12:49:20', NULL, 87),
(7, '2023-06-23 12:49:41', 1, '2023-06-23 12:49:41', '2023-06-23 12:49:41', NULL, 69),
(8, '2023-06-23 12:49:57', 1, '2023-06-23 12:49:57', '2023-06-23 12:49:57', NULL, 40),
(9, '2023-06-25 05:39:41', 0, '2023-06-25 05:39:41', '2023-06-25 10:44:52', 31, 57),
(10, '2023-06-25 05:41:25', 1, '2023-06-25 05:41:25', '2023-06-25 05:41:25', NULL, 89),
(11, '2023-06-25 05:41:45', 1, '2023-06-25 05:41:45', '2023-06-25 05:41:45', NULL, 88),
(12, '2023-06-25 09:53:31', 0, '2023-06-25 09:53:31', '2023-06-25 10:44:55', 31, 85),
(13, '2023-06-25 09:55:03', 0, '2023-06-25 09:55:03', '2023-06-25 09:55:16', NULL, 81),
(14, '2023-06-25 10:40:16', 0, '2023-06-25 10:40:16', '2023-06-25 10:44:54', 31, 27),
(15, '2023-06-25 10:45:09', 1, '2023-06-25 10:45:09', '2023-06-25 10:45:09', 31, 88),
(16, '2023-06-25 10:52:03', 1, '2023-06-25 10:52:03', '2023-06-25 10:52:03', NULL, 90),
(17, '2023-06-25 11:19:24', 1, '2023-06-25 11:19:24', '2023-06-25 11:19:24', NULL, 90),
(18, '2023-06-25 11:19:52', 1, '2023-06-25 11:19:52', '2023-06-25 11:19:52', NULL, 50),
(19, '2023-06-25 14:38:06', 1, '2023-06-25 14:38:06', '2023-06-25 14:38:06', NULL, 85),
(20, '2023-06-25 14:38:25', 1, '2023-06-25 14:38:25', '2023-06-25 14:38:25', NULL, 45),
(21, '2023-06-25 14:38:27', 1, '2023-06-25 14:38:27', '2023-06-25 14:38:27', NULL, 26),
(22, '2023-06-26 07:47:38', 1, '2023-06-26 07:47:38', '2023-06-26 07:47:38', 34, 87),
(23, '2023-06-26 07:47:46', 1, '2023-06-26 07:47:46', '2023-06-26 07:47:46', 34, 64),
(24, '2023-06-26 08:25:55', 0, '2023-06-26 08:25:55', '2023-06-26 08:25:56', 34, 88),
(25, '2023-06-26 08:29:26', 1, '2023-06-26 08:29:26', '2023-06-26 08:29:26', 34, 90),
(26, '2023-06-26 10:43:29', 1, '2023-06-26 10:43:29', '2023-06-26 10:43:29', 33, 90),
(27, '2023-06-26 10:43:30', 1, '2023-06-26 10:43:30', '2023-06-26 10:43:30', 33, 89);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `previewText` varchar(255) NOT NULL,
  `news` text NOT NULL,
  `isFeatured` tinyint(1) DEFAULT 0,
  `isNSFW` tinyint(1) DEFAULT 0,
  `isPaid` tinyint(1) DEFAULT 0,
  `sponsorURL` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `publicId` varchar(255) NOT NULL,
  `views` int(11) DEFAULT 0,
  `ageGroup` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `previewText`, `news`, `isFeatured`, `isNSFW`, `isPaid`, `sponsorURL`, `image`, `publicId`, `views`, `ageGroup`, `gender`, `createdAt`, `updatedAt`) VALUES
(2, 'Indian telecom magnate Sunil Mittal is reportedly exploring the possibility of acquiring a stake in Paytm.', 'The proposed method of acquisition involves merging his financial services unit with the fintech company\'s payments bank.', '<p>Sunil Mittal, the Indian telecommunications tycoon, is seeking to merge his financial services unit, Airtel Payments Bank, into Paytm Payments Bank through a stocks deal. He is also trying to purchase Paytm shares from other holders. Paytm\'s shares have rebounded by 40% from its record low in November as the company showed signs of turning profitable. However, it has never traded above its IPO price of 2,150 rupees since its listing in November 2021 and had the worst first-year share plunge among large IPOs over the past decade. Paytm\'s backers include Japan\'s SoftBank Group Corp. and China\'s Ant Group Co. Mittal\'s payments bank had turned profitable in the year to 2022 and had 129 million customers.</p><p><br></p><p>Read more at: <a href=\"https://www.bqprime.com/business/telecom-tycoon-mittal-is-seeking-a-stake-in-indian-fintech-paytm\" rel=\"noopener noreferrer\" target=\"_blank\">BQ Prime</a></p><p>Copyright © BQ Prime</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677492611/cjmmiwiea0wp11s8xcpy.webp', 'cjmmiwiea0wp11s8xcpy', 21, '[\"14-20\",\"21-35\",\"51 & above\",\"36-50\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 08:47:40', '2023-03-19 08:12:04'),
(3, 'Nokia unveils a refreshed logo in response to market perception that it solely produces mobile phones', 'Finnish tech giant, Nokia Oyj, has unveiled a refreshed logo to distinguish itself from its previous mobile phone business, which it exited nearly ten years ago.', '<p>Nokia, a business-to-business technology innovation leader, is updating its brand to reflect its current focus on networks and industrial digitalization. According to CEO Pekka Lundmark, Nokia wants to move away from being associated solely with mobile phones, which it hasn\'t been a part of since 2014 when Microsoft acquired its Devices and Services division. However, HMD Global, a company comprised of former Nokia executives, acquired the rights to use the Nokia brand for smartphones and tablets and continues to use the classic Nokia logo on its devices. It\'s unclear whether HMD Global plans to keep using the logo.</p><p><br></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">More stories like this are available on </span><a href=\"https://www.bloomberg.com/europe\" rel=\"noopener noreferrer\" target=\"_blank\">bloomberg.com</a></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677488477/wlgnv5sdp7lf6s9z7zwo.jpg', 'wlgnv5sdp7lf6s9z7zwo', 16, '[\"14-20\",\"36-50\",\"21-35\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 09:01:17', '2023-03-17 10:54:56'),
(4, 'Netflix has announced a significant price reduction for its subscription plans in more than 100 countries.', 'The popular streaming service will now offer its plans at a discounted rate of up to 50%, providing greater accessibility to users across the globe.', '<p>This move by Netflix is a welcome development, as it ensures that more people can enjoy its wide range of content without breaking the bank. By lowering its prices, Netflix has demonstrated its commitment to making its platform more affordable and accessible to a larger audience.</p><p>With this new pricing strategy, Netflix is poised to attract more users in the countries where it has reduced its subscription fees. The move is expected to boost its customer base and position it as a leading player in the highly competitive streaming industry.</p><p>Overall, Netflix\'s decision to reduce its prices is a positive step that will benefit both the company and its users, ensuring that everyone has access to quality entertainment at an affordable cost.</p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">More stories like this are available on </span><a href=\"https://www.bloomberg.com/europe\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">bloomberg.com</a></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677489084/xebzg1jznjm5xedmcte3.webp', 'xebzg1jznjm5xedmcte3', 8, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 09:11:25', '2023-04-07 12:27:40'),
(5, 'The upcoming budget session of the Maharashtra Legislative Assembly is an important event.', 'It takes place from March 1 to March 10. To ensure the smooth functioning of the session and to maximize the impact of the Shiv Sena\'s presence.', '<p>Chief Minister Eknath Shinde has issued a whip to all party members, calling for their full attendance.</p><p>This whip is essentially a directive to party members, instructing them to be present in the assembly during the budget session and to vote in a particular manner on any issues that may arise.</p><p>The Shiv Sena is the ruling party in Maharashtra, and it holds a majority in the assembly. By issuing the whip, the party is sending a clear signal that it is committed to ensuring that its members are present and engaged during the session, and that it expects all members to actively participate in the proceedings.</p><p>In addition to the budgetary proposals, the session is expected to see discussions and debates on a range of important issues, including the COVID-19 pandemic, healthcare, education, agriculture, infrastructure development, and law and order. With the Shiv Sena\'s full attendance and active participation, the session is sure to be a significant event in the political landscape of Maharashtra.</p><p><br></p><p>sources: <a href=\"https://www.bqprime.com/politics/maharashtra-budget-session-cm-eknath-shinde-led-shiv-sena-issues-whip-for-full-attendance?cx_testId=6&amp;cx_testVariant=cx_1&amp;cx_artPos=2#cxrecs_s\" rel=\"noopener noreferrer\" target=\"_blank\">BQ Prime</a></p><p>More on this in <a href=\"https://www.bqprime.com/\" rel=\"noopener noreferrer\" target=\"_blank\">BQ Prime</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677489465/mkxqnoxfmurfw7t7hdcw.webp', 'mkxqnoxfmurfw7t7hdcw', 15, '[\"14-20\",\"36-50\",\"21-35\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 09:17:45', '2023-06-26 06:11:23'),
(6, 'President Biden acknowledges that concerns about his age are valid and should be taken seriously.', 'President Biden has been open about his age and the fact that he is the oldest person to assume the presidency in U.S. history.', '<p>In a recent interview, he acknowledged that concerns about his age are \"totally legitimate\" and that it is reasonable for people to question whether he is up to the task of leading the country.</p><p>Despite these concerns, President Biden has emphasized that he is fully capable of carrying out his duties as president and that he is committed to serving the American people to the best of his abilities. He has also surrounded himself with a team of experienced advisors and cabinet members to assist him in his work.</p><p>While age can be a legitimate concern for anyone in a high-pressure job like the presidency, it is important to remember that age is just one factor in determining someone\'s fitness for office. Ultimately, it is up to voters to decide whether they believe a candidate is capable of handling the responsibilities of the presidency, regardless of their age.</p><p><br></p><p>Sources: <a href=\"https://news.yahoo.com/biden-says-concerns-age-totally-153146034.html\" rel=\"noopener noreferrer\" target=\"_blank\">yahoo!news</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677492650/ngdorwela6luodrwz6xe.jpg', 'ngdorwela6luodrwz6xe', 21, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 09:28:58', '2023-06-26 06:11:08'),
(11, 'The Adani Group is not the only prominent Indian business conglomerate facing challenges.', 'Indian tycoon Anil Agarwal is facing challenges as he tries to repay his debt, which includes a $1 billion bond due in January, and he cannot afford to anger the government.', '<p>The plan of merging Vedanta Resources with Vedanta Ltd did not go anywhere, but Vedanta Resources managed to shed its net-debt burden and Vedanta Ltd declared a dividend last month. However, when Agarwal tried to secure finances for $1.5 billion in loan and bond repayments, he hit a roadblock. The bondholders are driving the price of the August 2024 note below 70 cents on the dollar, and if the fundraising fails, the issuer’s credit rating could come under pressure. Agarwal’s second challenge is political, as his ambition to partner with Taiwan’s Foxconn Technology Group for a $19 billion semiconductor factory might come under a cloud if he tries to force the asset sale and incurs the government’s displeasure in the process.</p><p>If Agarwal cannot take Hindustan Zinc’s cash all the way up to his privately held Vedanta Resources, his ability to pay down debt may be impaired, forcing him to borrow more. But with the Fed giving no indication that it’s done raising rates and existing Vedanta Resources bonds dropping in value, he might struggle to raise fresh money at a reasonable cost. This presents a problem for the mining magnate, as the post-pandemic era of supernormal commodity profits could be over.</p><p>Seven years ago, Agarwal’s creditors were even more jittery than now. Back then, the zinc miner helped him out with a special dividend. New Delhi didn’t mind the maneuver because at the time the firm had more than $5 billion in cash. Besides, as a minority shareholder, the finance ministry also got its share of the bounty. This time around, though, Agarwal seems to have overreached.</p><p>If Agarwal incurs the government’s displeasure in the process of forcing the asset sale, his ambition to partner with Taiwan’s Foxconn Technology Group for a $19 billion semiconductor factory might come under a cloud. Already, that project is being watched closely by opposition politicians in neighboring Maharashtra who have slammed its last-minute relocation to Prime Minister Narendra Modi’s home state of Gujarat. Besides, taxpayers will bear half the cost of chip-manufacturing units, and India’s general elections are due next year. Influential voices, such as the University of Chicago economist Raghuram Rajan, a former central bank governor, have questioned Vedanta’s involvement, citing its lack of chipmaking competence.</p><p>Agarwal’s top priority should be to stay out of the headlines, with the Adani group facing allegations of stock-price manipulation and accounting fraud, putting the Modi administration under heightened scrutiny about entanglement of public purpose with private profit.</p><p><br></p><p><br></p><p>Read more at: <a href=\"https://economictimes.indiatimes.com/markets/stocks/news/adani-isnt-the-only-indian-tycoon-in-trouble-andy-mukherjee/articleshow/98262044.cms?utm_source=contentofinterest&amp;utm_medium=text&amp;utm_campaign=cppst\" rel=\"noopener noreferrer\" target=\"_blank\">Economictimes.India</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677494645/jsq3dgdjmj6rhp4j3yc9.jpg', 'jsq3dgdjmj6rhp4j3yc9', 10, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 10:44:05', '2023-04-15 07:48:24'),
(12, 'According to a report by ICICI Securities, it is estimated that Jio, may spend approximately Rs 94,000 crore', 'While Airtel, another telecommunications company, may spend about Rs 66,600 crore on 5G capital expenditure by the end of the financial year 2026-2027.', '<p>As per a research report by ICICI Securities, Reliance Jio is projected to spend Rs 94,000 crore over the next five financial years to achieve 95% 5G coverage by FY2027. Similarly, Bharti Airtel is expected to spend Rs 66,600 crore during the same period to reach 85% 5G coverage. The report suggests that the capital expenditure required for 5G will be lower than that of 4G since the latter was deployed over multiple spectrum bands. Furthermore, the report assumes that 5G rollout will be quicker than 4G.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677496208/iy4fxkztbszxjf8v74qu.png', 'iy4fxkztbszxjf8v74qu', 5, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Others\",\"Female\"]', '2023-02-27 11:10:09', '2023-06-25 10:40:01'),
(14, 'SAG Awards: Zendaya, Paul Mescal and Christina Applegate among stars on red carpet', 'The Screen Actors Guild (SAG) Awards took place in Los Angeles on Sunday, honoring some of the year\'s best performances in television and film.', '<p>On February 27, 2023, the 29th Annual Screen Actors Guild (SAG) Awards were held at the Fairmont Century Plaza in Los Angeles. The ceremony was aired live on Netflix\'s YouTube channel and winners were voted on by 122,600 SAG-AFTRA members.</p><p>Among the winners were Michelle Yeoh and Jamie Lee Curtis, who won Best Lead Actress and Best Supporting Actress, respectively, for their roles in \"Everything Everywhere All at Once\". Their co-star Ke Huy Quan also made history by becoming the first Asian actor to win the SAG Award for Best Supporting Male for his performance in the same movie. Brendan Fraser won Best Lead Actor for \"The Whale\".</p><p>In the TV categories, the cast of \"Abbott Elementary\" won Best Comedy Series Ensemble, while \"The White Lotus\" took home the award for Best TV Drama Series Ensemble. Jennifer Coolidge won Best Actress in a Drama Series for her role in \"The White Lotus\", and Jason Bateman won Best Drama Series Actor for his performance in \"Ozark\". Jean Smart won Best Actress in a Comedy Series for \"Hacks\", and Jeremy Allen White won Best Actor in a Comedy Series for \"The Bear\".</p><p>Other winners included Sam Elliott for Best Male Actor in a TV Movie or Limited Series for \"1883\" and Jessica Chastain for Best Female Actor in a TV Movie or Limited Series for \"George &amp; Tammy\". \"Top Gun: Maverick\" and \"Stranger Things\" won the awards for Best Stunt Ensembles in Film and TV, respectively.</p><p>\"The Banshees of Inisherin\" and \"Everything Everywhere All at Once\" led this year\'s nominations with five nods each, including in the top category of Best Cast. Antonia Gentry from \"Ginny &amp; Georgia\" and Haley Lu Richardson from \"The White Lotus\" were named ambassadors for the SAG Awards.</p><p>Overall, the 29th Annual SAG Awards celebrated some of the best performances in film and television</p><p><br></p><p>Read Full story on: <a href=\"https://www.hollywoodreporter.com/movies/movie-news/sag-awards-2023-winners-list-1235334724/\" rel=\"noopener noreferrer\" target=\"_blank\">The Hollywood Reporter</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677500621/sv0slpnaiomg25j7vqu9.webp', 'sv0slpnaiomg25j7vqu9', 21, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 12:23:42', '2023-06-13 12:38:04'),
(15, 'Ukraine\'s Zelensky has reportedly stated that Putin will ultimately be assassinated by members of his own inner circle.', 'Ukrainian President Volodymyr Zelensky has made a statement in a documentary called Year, suggesting that President Vladimir Putin will eventually be killed.', '<p>According to The Times, Ukrainian President Volodymyr Zelensky has made a statement in a documentary called Year, suggesting that Russian President Vladimir Putin will eventually be killed by members of his own inner circle, stating that \"predators will devour a predator.\" Meanwhile, Putin has warned that the Russian nation might not survive if Ukraine wins the ongoing war. However, analysts have noted that it is unlikely for hardliners within Putin\'s inner circle to turn against him as they owe their positions to him.</p><p>Recently, Putin claimed that he had no choice but to take into account NATO\'s nuclear capabilities and accused the US-led military alliance of wanting to \"disband the former Soviet Union and Russia.\" On the other hand, Zelensky expressed confidence that the Crimean peninsula would eventually return to Ukrainian control as part of an end to the war.</p><p>The head of the CIA, William Burns, has said that Putin is \"too confident\" in his military\'s ability to grind Ukraine down, and that he will eventually have to face increasing costs, including coffins coming home to some of the poorest parts of Russia.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677501770/rotruhw1coxskfpwpu2d.webp', 'rotruhw1coxskfpwpu2d', 4, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 12:42:51', '2023-06-25 11:51:45'),
(16, 'Two unknown individuals attacked and stole the belongings of a 79-year-old singer.', 'In a shocking incident, a renowned 79-year-old Hindustani vocalist, Shubhada Pavgi, and her son were ambushed by two unidentified chain snatchers', '<p>In Dombivli town of Maharashtra\'s Thane district on Sunday at around 9 pm. The duo, who were riding a two-wheeler, brutally assaulted the septuagenarian and managed to flee with her gold chain worth a whopping Rs 2 lakh. Pavgi sustained minor injuries to her neck, and the police have launched an investigation into the matter. They are also examining the CCTV footage from the site to track down the culprits.</p><p><br></p><p><br></p><p>Full Story in: <a href=\"https://theprint.in/india/maha-singer-attacked-robbed-in-thane-district/1403142/\" rel=\"noopener noreferrer\" target=\"_blank\">The Print</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677502677/dpagyffovpzuydkjyzh1.avif', 'dpagyffovpzuydkjyzh1', 15, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 12:57:57', '2023-06-26 07:38:33'),
(17, 'Italian Prime Minister Giorgia Meloni is scheduled to make a trip to India from March 2nd to March 3rd.', 'Starting from Thursday, Italian PM Giorgia Meloni will be visiting India for two days with the aim of strengthening bilateral relations between the two countries', '<p>This marks the first high-level visit from Italy to India in five years. Meloni will be accompanied by Deputy Prime Minister and Foreign Minister Antonio Tajan, as well as a high-powered business delegation.</p><p><br></p><p>The aim of the visit is to strengthen bilateral relations between Italy and India in areas such as defense and security, economy, and technology. Meloni is scheduled to hold talks with Indian Prime Minister Narendra Modi on various bilateral, regional, and global issues, with the goal of deepening the longstanding relationship between the two countries.</p><p><br></p><p>Meloni will also be the Chief Guest and Keynote Speaker at the eighth Raisina Dialogue, India\'s premier conference on geopolitics and geoeconomics, which is scheduled to take place on March 3 and 4. In addition, a business roundtable will be organized on March 2, co-chaired by Tajani and India\'s Commerce Minister Piyush Goyal.</p><p><br></p><p>Overall, the visit is expected to further strengthen and deepen the multifaceted bilateral relationship between India and Italy, which is based on shared cultural values and a commitment to foster economic growth, collaboration in the fields of green energy, science and technology, and defense, as well as convergence on regional and global issues. </p><p><br></p><p>For Full Story: <a href=\"https://www.deccanchronicle.com/nation/current-affairs/270223/italian-pm-giorgia-meloni-to-visit-india-on-march-2-3.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(171, 15, 12);\">DECCAN CHRONICLE</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677503861/gqib7455xh6bgwngshyr.jpg', 'gqib7455xh6bgwngshyr', 6, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 13:17:42', '2023-03-03 06:36:25'),
(19, 'Indian Americans are rapidly advancing in the political hierarchy.', 'The 2024 election cycle shows significant progress in terms of representation,it was unimaginable for someone with a name like Raj Goyle to run for office before', '<p>The upcoming 2024 election cycle is a reflection of the considerable strides made in terms of representation in politics. This progress is highlighted by the fact that just a decade ago, it was inconceivable for someone with a name like Raj Goyle or Rajeev Goyle to run for political office in Wichita, as stated by Raj Goyle, a former Kansas lawmaker.</p><p><br></p><p>The rise of Indian Americans in the political ranks is a testament to the increasing diversity and inclusivity in American politics. This demographic has been making significant headway in recent years, with Kamala Harris becoming the first Indian American to serve as Vice President of the United States.</p><p><br></p><p>Furthermore, the increasing representation of Indian Americans in politics is a reflection of the changing demographics in America. As the country becomes more diverse, it is important that its political leadership reflects this diversity. This will help ensure that the concerns and needs of all Americans are represented and addressed in the political arena.</p><p><br></p><p>Read more on: <a href=\"https://www.nytimes.com/2023/02/27/us/politics/indian-american-politicians.html\" rel=\"noopener noreferrer\" target=\"_blank\">The Newyork Times</a> </p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677505519/zxtrtnffru1r4o7o6iuh.webp', 'zxtrtnffru1r4o7o6iuh', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 13:45:20', '2023-03-30 09:22:39'),
(20, 'A high-ranking minister in Delhi has been apprehended in an investigation related to the sale of liquor in India', 'The minister, known for their influential role in the city\'s administration, was taken into custody following allegations of involvement in illegal activities.', '<p>A high-ranking minister in Delhi has been arrested in connection with an ongoing investigation into corruption and bribery in India\'s liquor industry. The minister, who has not been named in official reports, is said to be a prominent figure in the ruling party in Delhi and has held several important positions in the city\'s administration.</p><p>The investigation, which has been underway for several months, was carried out by India\'s Central Bureau of Investigation (CBI) and focused on allegations of corruption and bribery related to the sale of liquor licenses in the country. According to reports, the CBI conducted raids and collected evidence, including financial records, before making the arrest.</p><p>The arrest has caused a stir among the public, with many calling for greater transparency and accountability in government affairs. Corruption is a persistent problem in India, and the country has struggled to address it effectively despite efforts to strengthen anti-corruption laws and institutions.</p><p>The incident has also raised questions about India\'s complicated relationship with alcohol. While the country is home to a thriving alcohol industry, with many global brands operating within its borders, alcohol consumption is still a controversial topic in some parts of the country due to cultural and religious beliefs.</p><p>Overall, the arrest of the Delhi minister is being viewed as a significant development in India\'s ongoing battle against corruption. Many are hopeful that it will lead to greater accountability and a renewed commitment to rooting out corruption in government and other sectors of society. However, it remains to be seen how the investigation will unfold and whether other high-ranking officials will be implicated in the scandal. </p><p><br></p><p>Read More on this from: <a href=\"https://www.reuters.com/world/india/top-delhi-minister-arrested-india-liquor-probe-2023-02-27/\" rel=\"noopener noreferrer\" target=\"_blank\">Reuters</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677506017/c9iaefxny02sovaeyh8v.jpg', 'c9iaefxny02sovaeyh8v', 23, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 13:53:37', '2023-06-12 08:13:49'),
(21, 'India desires an energy transition that doesn\'t entail the elimination of coal', 'India is heavily reliant on coal to meet its energy needs, but has expressed a commitment to transitioning to cleaner and more sustainable sources of energy.', '<p>However, the Indian government has been hesitant to completely phase out coal due to its importance in supporting economic development and meeting the energy needs of its growing population.</p><p>India has also been requesting more financial support from developed countries to aid in its transition towards cleaner energy sources, arguing that developed countries have a greater responsibility to provide financial assistance given their historical contribution to greenhouse gas emissions. This stance has been a point of contention in global climate negotiations, with some critics arguing that India\'s reliance on coal undermines its commitment to combatting climate change. However, India maintains that it is dedicated to achieving its climate goals while balancing economic development needs.</p><p><br></p><p>More on this: <a href=\"https://www.thehindu.com/sci-tech/energy-and-environment/india-clean-energy-transition-phasing-out-coal-grants-fetp/article66549079.ece\" rel=\"noopener noreferrer\" target=\"_blank\">The Hindu</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677506564/nv0omrvemrbxd1ud5slq.jpg', 'nv0omrvemrbxd1ud5slq', 10, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 14:02:45', '2023-06-11 07:38:36'),
(22, 'A love story that began online between individuals from India and Pakistan resulted in Jail.', 'That love story began in 2020, during the Covid lockdown. Mr Yadav worked as a security guard in Bangalore while Ms Jeewani was a student in Pakistan.', '<p>In a world where love knows no boundaries, a couple\'s love story has been put to the test due to geopolitical tensions. Mulayam Singh Yadav, a 21-year-old Indian man, and Iqra Jeewani, a 19-year-old Pakistani woman, fell in love while playing the board game Ludo online three years ago. However, their love faced obstacles due to the strained relationship between their countries.</p><p>Despite the odds, the couple decided to tie the knot in Nepal last September, where they got married in a Hindu ceremony. They then moved to Bangalore, India, to start a life together. Unfortunately, their happiness was short-lived as Ms Jeewani was detained for entering India illegally, and Mr Yadav was charged with fraud, forgery, and providing shelter to a foreign national without proper documents.</p><p>Ms Jeewani was deported to Pakistan, leaving Mr Yadav behind in jail in Bangalore. Both families are devastated by the situation and hope for a resolution that will reunite the couple.</p><p>While the police acknowledge that their story is one of love, the couple\'s actions were still deemed illegal. According to police reports, Mr Yadav had arranged a fake Indian identity document, called an Aadhaar card, for Ms Jeewani, who did not have the necessary documents to stay in India.</p><p>Despite the legal issues, the families hope that the governments of India and Pakistan can help bring the couple back together. Mr Yadav\'s mother, Shanti Devi, expressed her willingness to take care of her daughter-in-law, regardless of her nationality or religion.</p><p>The love story of Mulayam Singh Yadav and Iqra Jeewani shows that love knows no boundaries, and that even the most complicated geopolitical relationships cannot stop love from blossoming.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677507201/yevcvlwlqwyjfysnkfjr.jpg', 'yevcvlwlqwyjfysnkfjr', 14, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-02-27 14:13:21', '2023-04-30 21:52:03'),
(23, 'SEBI Bars Viresh Joshi and 20 Others in Axis Mutual Fund Front-Running Case, Barring a Total of 21 Entities.', 'SEBI has taken interim measures in a case of alleged front-running at Axis Mutual Fund, where individuals trade securities before large client orders for personal gains.', '<p>The investigation found that the entities involved had gained ?305 million ($3.7 million) through front-running, and this amount has been impounded. Show cause notices have been issued to the mutual fund and related entities, and 21 entities have been barred from the capital markets until further notice. The investigation focused on the period between September 2021 and March 31, 2022, and identified Viresh Joshi, the then-chief dealer, as responsible for front-running trades. While the fund house is not affected, entities indirectly connected to Mr. Joshi\'s trading accounts have been barred from capital markets. The case highlights the importance of regulators staying vigilant against such malpractices and ensuring market integrity.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677660628/yysjfcuwon1ut3yznodj.jpg', 'yysjfcuwon1ut3yznodj', 48, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 08:50:28', '2023-06-23 11:54:08'),
(24, 'The ongoing conflict in Ukraine is hindering India\'s aspirations within the G20 group.', 'India has been striving to establish itself as a prominent representative of the Global South, a group comprising developing nations', '<p>As the current president of the G20, India has a significant platform to showcase its leadership. However, India\'s success in achieving its goals largely depends on one critical factor - the ongoing conflict in Ukraine.</p><p><br></p><p>The G20 group includes the world\'s wealthiest nations and the European Union, collectively accounting for a substantial portion of global economic output and population. As foreign ministers convene in Delhi, India\'s efforts to reach broader agreements could be impacted by the Ukraine war.</p><p><br></p><p>During the last G20 meeting, Russian missile attacks on Ukrainian infrastructure sparked differences among world leaders, with India, China, and Russia reportedly not fully endorsing condemnation of the invasion. Unfortunately, the conflict continues with no signs of peace talks, and the world remains divided. As a result, achieving consensus among big economies remains a challenge.</p><p><br></p><p>More on: <a href=\"https://ednews.net/en/news/world/578483-g20-ukraine-war-casts-shadow\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: rgb(249, 249, 249); color: rgb(34, 34, 34);\">EurasiaDiary </a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677663039/rghnmviymtfgauomka33.jpg', 'rghnmviymtfgauomka33', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 09:30:40', '2023-03-19 10:49:25'),
(25, 'Canadian MPs have requested the presence of Google CEO in Ottawa', 'Following concerns over restricted access to news for certain segments of the Canadian population.', '<p>The CEO and top executives of Google have been summoned to testify before a parliamentary committee in Ottawa after the company temporarily blocked access to news for some Canadians via its search engine. The House of Commons heritage committee has also requested documents related to the news ban. The move came in response to the Liberal government\'s proposed Online News Act, which would require digital giants to negotiate deals to compensate Canadian media firms for using their content online. MPs unanimously supported a motion by Liberal MP Chris Bittle to summon Google executives. Larger media companies have backed the online news bill.</p><p><br></p><p><br></p><p><em style=\"color: rgb(0, 0, 0);\">This report by The Canadian Press was first published Feb. 28, 2023.</em></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677663307/cheb9kyipeeth1qafxyq.webp', 'cheb9kyipeeth1qafxyq', 13, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 09:35:07', '2023-06-13 10:25:40'),
(26, 'India is touting its infrastructure expansion as a way to generate essential jobs, but experts in economics are uncertain.', 'India\'s unemployment problem has been a significant issue for Prime Minister Narendra Modi\'s government. They are increasing its spending on infrastructure.', '<p>Claiming that this move will create much-needed jobs. However, economists are not optimistic about the potential job creation. The retired economics professor at New Delhi\'s Jawaharlal Nehru University, Arun Kumar, believes that the government\'s policies are \"completely against job creation\" as there is not enough investment in India to create labour-intensive jobs. This lack of investment in the unorganized sector means that many people are stuck in unstable jobs with irregular pay. The organized sector only makes up 6% of India\'s workforce, while 94% of the jobs are in the unorganized sector, with half of them being in agriculture. A more technologically advanced infrastructure sector will also mean fewer jobs in the organized sector. Additionally, the skills mismatch in the labor force means that the participation of women in the workforce is declining, and even college-educated youth are struggling to find jobs.</p><p><br></p><p>Original Story on: <a href=\"https://www.cnbc.com/2023/03/01/indias-infrastructure-boost-isnt-going-to-solve-its-job-problem-economists.html\" rel=\"noopener noreferrer\" target=\"_blank\">www.cnbc.com</a></p><p class=\"ql-align-center\"><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677664264/wcfnveovyohqu7buwxag.webp', 'wcfnveovyohqu7buwxag', 11, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 09:51:04', '2023-06-25 14:38:28'),
(27, 'India has topped the global charts for the fifth consecutive year in terms of restricting internet access.', 'Access Now, a digital rights advocacy group based in New York, has reported that India has once again topped the list.', '<p>Access Now has once again topped the list for imposing the highest number of internet shutdowns globally in 2022 for the fifth year in a row. Out of the 187 shutdowns recorded by Access Now, 84 took place in India, with 49 occurring in Indian-administered Kashmir due to political instability and violence. The Indian government has regularly imposed communication restrictions in Kashmir, which have been criticized by rights groups as measures to suppress dissent. Despite India\'s continued lead in internet shutdowns, the number of shutdowns in the country in 2022 was lower than in previous years. Ukraine came in second on the list with Russia cutting access to the internet at least 22 times during its invasion of Ukraine. Iran followed Ukraine on the list with 18 internet shutdowns in response to anti-government protests. </p><p><br></p><p><br></p><p><a href=\"https://www.dawn.com/news/1739665\" rel=\"noopener noreferrer\" target=\"_blank\">Published in Dawn, March 1st, 2023</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677665164/z10nawwatghqojhs970m.jpg', 'z10nawwatghqojhs970m', 26, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 10:06:05', '2023-06-25 10:40:17'),
(28, 'The South Korean diplomats have captured the hearts of many in India through their delightful and mesmerizing performance.', 'In the viral video titled \'Naatu Naatu\'.Their graceful and energetic moves have left audiences in awe and admiration.', '<p>Creating a buzz of excitement and positivity. The video showcases the wonderful cultural exchange and friendship between these two nations, bringing people together through the universal language of music and dance. It\'s truly a heartwarming sight to see diplomats breaking barriers and connecting with people on a personal level, spreading joy and happiness across the globe.</p><p><br></p><p>Orignal Stroy on <a href=\"https://edition.cnn.com/2023/02/27/india/south-korea-embassy-india-dance-naatu-naatu-intl-hnk-scli/index.html\" rel=\"noopener noreferrer\" target=\"_blank\">CNN</a></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677666258/pakvvrc7swvpfzjv8v7q.jpg', 'pakvvrc7swvpfzjv8v7q', 23, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-01 10:24:18', '2023-04-26 05:13:10'),
(29, 'NoBroker, the Prop-tech startup secures $5 million in Series E funding round from Google Development Corp', 'A property tech startup based in Bengaluru, has successfully raised $5 million (approximately Rs 40 crore) from Google in its Series E funding round.', '<p>Alongside other investors like General Atlantic, Tiger Global, and Moore Strategic Ventures. Established in 2013 by three IIT alumni, NoBroker has made a name for itself in the real estate market by providing renting, buying, and selling services. It has even been recognized as India\'s first property-tech unicorn. With the recent funding, the startup aims to expand its reach to more customers in both new and existing cities, while also strengthening its technology system to enhance its real estate services. The company\'s CTO, Akhil Gupta, is thrilled about the collaboration with Google and has announced plans to create unique solutions to simplify the lives of NoBrokerHood societies\' residents. Furthermore, NoBroker\'s CEO, Amit Agarwal, has emphasized the company\'s commitment to democratizing a user\'s real estate journey by partnering with Google to develop products and solutions that provide a hassle-free home search and living experience for users. This significant investment from Google positions NoBroker to continue innovating and revolutionizing the property-tech industry in India.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677748483/ekrx5taz26ivk2grvyb7.jpg', 'ekrx5taz26ivk2grvyb7', 9, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 09:14:44', '2023-03-02 11:27:19'),
(30, 'Report: Tata Group\'s $1 Billion Bid for Bisleri Stake Stalls Over Valuation Talks', 'Tata Group\'s negotiations to acquire a controlling stake in Bisleri International Pvt, one of India\'s largest bottled water makers', '<p>Have stalled over disagreements on the company\'s valuation. Bisleri has a 60% share in India\'s bottled mineral water market and was seeking to raise around $1 billion from the deal. Talks between the two companies could still resume, but other potential buyers may emerge. If the acquisition had gone through, it could have expanded Tata Group\'s portfolio of bottled water brands in India, which already includes the Himalayan Natural Mineral Water and Tata Water Plus brands.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677749621/x7ufkgc2cdyzrrr4n5jp.png', 'x7ufkgc2cdyzrrr4n5jp', 19, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 09:33:42', '2023-03-19 11:17:26'),
(31, 'India\'s Supreme Court has reformed the appointment of election commissioners, promoting transparency and accountability.', 'In a significant development, India\'s Supreme Court has ordered the establishment of a bipartisan panel comprising the prime minister, chief justice.', '<p>Published:&nbsp;March 02, 2023 12:52</p><p>Reuters</p><p><br></p><p>The leader of the opposition or the opposition party with the highest number of members in the lower house of parliament to select the country\'s election commissioners. This decision marks the end of a practice where the government had effectively appointed them, leading to accusations of bias.</p><p><br></p><p>The Election Commission of India is an autonomous constitutional authority, but this move aims to ensure its impartiality and independence. The court\'s judgment has been hailed as historic by petitioners\' lawyer, Prashant Bhushan, who emphasized the importance of maintaining the election commission\'s neutrality for upholding democracy. India\'s former chief election commissioner, S.Y. Quraishi, also lauded the ruling, stating that it meets a long-pending demand for the perception of neutrality of the Election Commission.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677752446/wyy26v7lxvcy71mbglik.jpg', 'wyy26v7lxvcy71mbglik', 32, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 10:20:46', '2023-06-25 11:43:51'),
(32, 'NCLAT allowed Reliance Capital\'s lenders hold another round of auctions, giving hope to the struggling firms.', 'Reliance Capital\'s lenders have been granted a new round of auctions by the National Company Law Appellate Tribunal,', '<p>following a challenge by Vistra ITCL (India) against an NCLT decision. The Committee of Creditor (CoC) has been authorized to negotiate and call for higher bids within two weeks. Previously, Torrent Investments presented a resolution plan of Rs 8,640 crore, which was surpassed by a revised bid from Indusind International Holdings Ltd, leading to a legal dispute. Torrent Investments\' bid remains the highest, with IIHL also challenging the NCLT decision. Reliance Capital\'s consolidated debt stands at about Rs 40,000 crore.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677752865/xmn4gg6jq4kzk1cnpola.png', 'xmn4gg6jq4kzk1cnpola', 33, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 10:27:45', '2023-06-25 11:52:00'),
(33, 'Google States Competition Regulator\'s Findings Not Applicable to Indian Market, Informs NCLAT', 'Google has appeared before the National Company Law Appellate Tribunal (NCLAT) to defend its business practices in India\'s Android market', '<p>following its conviction by the Competition Commission of India (CCI) for abusing its market dominance in the Android mobile device ecosystem and online search market. Google\'s counsel argued that certain findings of the CCI are not applicable to the Indian market, and that the CCI\'s findings regarding revenue share agreements (RSA) only relate to portfolio-based RSAs, rather than device-based RSAs, which Google had shifted to in 2014. Furthermore, the counsel argued that original equipment manufacturers (OEMs) have complete freedom to choose whether to have an RSA with Google or Bing without any restrictions.</p><p><br></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677829264/rqohnj64oyilg5qvlns7.webp', 'rqohnj64oyilg5qvlns7', 28, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 10:45:17', '2023-06-09 05:43:17'),
(34, 'SEBI Exposes the Operational Method of the \"Jadugar\" in the Axis Mutual Fund Front-Running Case.', 'SEBI has barred 21 entities, including Viresh Joshi, former dealer of Axis Mutual Fund', '<p>Ordered the attachment of Rs 30.5 crore in front-running profits earned by these entities. SEBI found that Joshi and other entities engaged in front-running activities in different securities before placing orders on behalf of the mutual fund, which led to unlawful enrichment and was in violation of the SEBI Act and the unfair trade practices regulations. This scheme was carried out through mule accounts set up with brokerages, and Joshi passed on confidential information to stock brokers not empaneled with Axis Mutual Fund using WhatsApp and Bloomberg Chats. SEBI has taken swift action against the entities involved.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677829234/pbrwvupkmyowqpuc70op.webp', 'pbrwvupkmyowqpuc70op', 24, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-02 11:02:55', '2023-06-26 10:42:49'),
(36, 'India\'s GDP Growth Loses Momentum Across All Major Components in Current Fiscal Year, Confirms Nomura Economist Sonal Varma', 'India\'s GDP growth rate for the quarter ending December 2022 was 4.4%, per NSO data and HSBC economists.', '<p>indicating an alarming slowdown across the board in major components of the economy. Of particular concern is the significant weakening of private final consumption expenditure (PFCE), which accounts for 60% of total GDP in the quarter. Capital formation is still growing impressively, although it is showing signs of a slowdown, as well. The decline in exports is pointing towards a weakening of external demand for the economy, but the more than proportionate slowdown in imports has helped mitigate the growth headwinds from exports to some extent.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677835830/yzln6wbllpywglcqz5o5.webp', 'yzln6wbllpywglcqz5o5', 16, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 09:30:30', '2023-06-18 11:59:34'),
(37, '\"GDP growth projection of 7% for current fiscal is very realistic and may exceed expectations\", says CEA Anantha Nageswaran', 'The Chief Economic Advisor of India, V Anantha Nageswaran, is optimistic about the country\'s GDP growth rate for the current financial year,', '<p>expecting it to exceed the projected 7% growth rate due to the expected revision of high frequency data. The National Statistical Office (NSO) maintained the growth projection at 7%, the same as the first estimate released in January, but recently revised GDP growth data for the past three years upward, indicating that India\'s economy has been performing better than previously estimated. Nageswaran also discussed rising interest rates, stating that they reflect healthy underlying demand for credit and do not necessarily cause lower growth. He also highlighted the potential economic benefits of digitization, noting that digital transactions can increase formalization and potentially add between 30 and 50 basis points per annum to the provisional GDP. Overall, Nageswaran\'s positive outlook for India\'s economy and expected revision of high frequency data suggest that the country may experience stronger economic growth than originally projected.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677837643/npr9egur7jcln8av2ssq.webp', 'npr9egur7jcln8av2ssq', 16, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 10:00:43', '2023-06-25 08:15:54'),
(38, 'Foxconn to Invest $700 Million in New iPhone Manufacturing Plant in India.', 'Foxconn Technology Group, a company known for Hon Hai Precision Industry, has announced its intention to invest $700 million', '<p> In a new manufacturing plant in India. This new facility, located in Bengaluru, Karnataka, is expected to produce Apple\'s receivers and electric vehicles for Foxconn\'s nascent EV business. With tensions between the US and China on the rise, many US companies, including Apple, are searching for alternative production sites such as India and Vietnam to reduce their reliance on Chinese-based suppliers. This new production facility in India is expected to create around 100,000 jobs and marks a significant investment by Foxconn in the country. This move by Foxconn highlights China\'s potential loss of its position as the world\'s largest electronics producer. Other companies, including Wistron, Pegatron, and Jabil Corp, are also expanding their operations in India. India\'s government views this as an opportunity to bridge the tech gap between India and China, and financial incentives have been offered to Apple suppliers such as Foxconn.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677837995/mnmtsrutdnm5hpfexgxt.png', 'mnmtsrutdnm5hpfexgxt', 8, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 10:06:36', '2023-06-26 07:42:39'),
(39, 'NCLAT Denies HDFC\'s Plea and Dismisses Appeal Against Sale of IL&FS BKC Property', 'The National Company Law Appellate Tribunal (NCLAT) has dismissed HDFC\'s plea to halt the sale of the IL&FS headquarters', '<p>in Mumbai\'s Bandra Kurla Complex (BKC) to Brookfield Asset Management. The sale of the property was carried out according to the revised resolution framework approved by the NCLAT in March 2020, and therefore, cannot be hindered. Initially, HDFC had planned to sanction a loan of Rs 4 billion to IL&amp;FS, with the repayment to come from the cash flows generated by the TIFC property being let out by IL&amp;FS, whose cash flows were assigned to HDFC. However, as part of its debt reduction strategy, IL&amp;FS decided to sell the property, which HDFC contested. HDFC claimed that the approval of the sale by the adjudicating body violated the rules of natural justice, but the NCLAT rejected this claim, and the sale of the IL&amp;FS BKC property will proceed as planned.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677839243/ttfsk1k1fzt5ykvtbv4x.webp', 'ttfsk1k1fzt5ykvtbv4x', 12, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 10:27:24', '2023-03-19 11:56:22');
INSERT INTO `news` (`id`, `title`, `previewText`, `news`, `isFeatured`, `isNSFW`, `isPaid`, `sponsorURL`, `image`, `publicId`, `views`, `ageGroup`, `gender`, `createdAt`, `updatedAt`) VALUES
(40, 'IndiGo and Turkish Airlines Join Forces for US Market Expansion through Codeshare Agreement.', 'IndiGo, India\'s largest airline, is looking to expand into the United States market through a codeshare agreement with Turkish Airlines.', '<p>This arrangement will allow IndiGo to sell flights to 12 destinations in the US, including major cities like New York, San Francisco, and Washington D.C. The airlines have submitted a joint filing with the US Department of Transportation, asking for \"expedited approval of the application.\" The codeshare agreement will allow passengers to seamlessly transfer between the two airlines using the same flight number. The agreement is seen as a way for IndiGo to poach incremental passengers and gain a share of the lucrative India-US traffic market. The move comes after IndiGo started operating a Turkish damp-leased B777 between Delhi and Istanbul, giving it a huge boost in capacity. The agreement is different from IndiGo\'s other codeshares with Qantas and Air France-KLM, which are largely to open new points within India for these airlines.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677839484/gq2djs2mq3lpmpfvvwqc.jpg', 'gq2djs2mq3lpmpfvvwqc', 5, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 10:31:24', '2023-06-23 12:49:57'),
(41, 'Adani Group\'s Karan Adani Reveals Plans for Data Center and Two Cement Plants in Andhra Pradesh', 'Adani Group plans to invest in Andhra Pradesh with 2 cement plants, a data center, and 15,000 MW of renewable power projects.', '<p>The conglomerate aims to expand its ports, Krishnapatnam and Gangavaram, by another million metric tonnes and transform them into industrial port cities. The development of industrial clusters in these ports will reduce logistics costs, making industries more competitive globally. Adani Group\'s acquisition of Ambuja and ACC made it the second-largest cement player in India, and it plans to establish new cement plants in Kadapa and Nadikudi. The company is also developing a 400 MW data center in Visakhapatnam, demonstrating its commitment to the state\'s sustainable growth. Despite concerns about its expansion plans funded by debt, Adani Group maintains that its balance sheet is healthy and its business plans are fully funded. This investment will bring significant economic benefits to Andhra Pradesh and contribute to its growth.</p><p><br></p><p><br></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677840489/pakekdbitqnqw954josk.jpg', 'pakekdbitqnqw954josk', 2, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 10:48:09', '2023-03-07 10:51:40'),
(42, 'Airtel Hits One Million 5G Customer Milestone in Mumbai, Offers 5G Service in Over 140 Cities Across India', 'Bharti Airtel has surpassed the milestone of 1 million 5G users in Mumbai, and 10 million unique 5G customers nation-wide', '<p><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\">solidifying its position as a leading provider of next-generation mobile connectivity in India. Airtel was the first to introduce 5G in the country and Mumbai was one of the first cities to receive ultra-fast Airtel 5G Plus services. Today, Airtel\'s 5G services are available in over 140 cities across India, with plans to expand further and cover every town and key rural area by March 2024. Airtel 5G Plus is currently live in several key Mumbai locations, including the Gateway of India, Nariman Point, and Film City. Vibhor Gupta, CEO Mumbai, Bharti Airtel, promised to continue expanding the network across the city, providing more customers with high-definition video streaming, gaming, chatting, and photo uploading at superfast speeds. With its commitment to providing cutting-edge 5G services, Airtel is poised to transform mobile connectivity in India.</span></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677841305/jedptdwdd4ahatklpzy9.jpg', 'jedptdwdd4ahatklpzy9', 11, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 11:01:46', '2023-06-12 10:43:03'),
(43, 'EV Cab Startup Evera Raises Rs 60 Crore ($7 Million) in Funding to Expand Footprint and Scale Tech Stack', 'Evera, an electric cab provider based in New Delhi, has secured $7 million (approximately Rs 60 crore) in its first funding round', '<p>with IEG Investment Banking Group, Direct Capital, and Westova Global leading the investment. Despite facing competition from established players such as Uber and BluSmart, Evera plans to expand its services beyond Terminal 3 of the New Delhi Airport and throughout the city. The funds will be used to enhance the company\'s technology stack and integrate its backend for B2B customers. Evera has also teamed up with corporations such as Orix and EY to offer EV cab services. According to the CEO, there is ample room for more than two or three competitors in the market opportunity. BluSmart, Evera\'s primary rival, currently has a fleet of 2,700 cars and aims to expand to over six cities by the end of 2024.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677842297/n1x2zqypllk9h2olotzh.webp', 'n1x2zqypllk9h2olotzh', 12, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 11:18:18', '2023-03-18 13:18:53'),
(45, 'Adani Bonds Continue to Flash Warnings Despite Stock Route Easing, as Billionaires and Government Attempt to Soothe Deepening Rout', 'The Adani Group\'s recent market crash has sparked concerns about its long-term ability to repay its debt, despite recent efforts to restore investor confidence', '<p>&nbsp;And secure a $1.9 billion investment.&nbsp;While some of the group\'s bonds have recovered, seven of its 11 notes maturing in or after 2027 are trading at or near 70 cents, indicating distress or severe concerns about timely payments. Moody\'s and S&amp;P have also downgraded the outlook for several Adani Group companies, citing key variables such as refinancing debt and funding efforts. The crisis has even spilled into ESG markets, prompting JPMorgan to shed its Adani-related portfolio exposure. The Indian Supreme Court has formed a panel to investigate allegations against the group and the market watchdog will investigate any manipulation of Adani\'s shares.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677852522/zmwuhhz2cv6eeqi2l6z2.jpg', 'zmwuhhz2cv6eeqi2l6z2', 26, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-03 14:08:42', '2023-06-14 10:32:36'),
(46, 'Massive Investments Pledged by Industrialists at Andhra Pradesh Investors Summit, Totaling Rs 13 Lakh Crore.', 'Insights from CM Jagan Mohan Reddy, Andhra Pradesh hosted a Global Investors\' Summit where investors pledged ? 13 lakh crore ($173 billion) on day one', '<p> The state\'s Chief Minister, Jaganmohan Reddy, presented Andhra Pradesh as an attractive investment destination, highlighting its top rankings for ease of doing business and high gross state domestic product growth. Notable investors attending the summit included Mukesh Ambani, Karan Adani, GM Rao, Krishna Ella, Naveen Jindal and Puneet Dalmia. Reliance Industries\' Ambani pledged ? 40,000 crore to create the largest digital footprint network in the state and invest in 10 GW solar energy. Adani Ports committed to invest ? 20,000 crore and expand its two large ports. Overall, the summit aimed to attract much-needed investments and job opportunities to the state while addressing criticisms of the Chief Minister being welfare-centric and not industry-friendly.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678011772/jfxswldziviiiyhphyva.jpg', 'jfxswldziviiiyhphyva', 10, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 10:22:52', '2023-06-13 09:59:12'),
(47, 'Zoom Terminates Mr. Tomb\'s Contract \'Without Cause\' in Sudden Move, Reveals Regulatory Filing', 'Zoom\'s President, Greg Tomb, had his contract terminated abruptly \"without cause\", according to a regulatory filing, Despite being praised by CEO Eric Yuan.', '<p>The company is not seeking a replacement. Zoom\'s popularity surged during the pandemic, but it has struggled to maintain its momentum and had to lay off 1,300 employees in February. Zoom is attempting to diversify, announcing plans to integrate email and calendar features and a chatbot, as well as developing Zoom Sports. However, it faces fierce competition from rivals such as Google Meet, Microsoft Teams and Slack, and could be left behind as companies look to cut costs during an economic downturn.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678012830/ibbsaecc7ozzej4myxt9.jpg', 'ibbsaecc7ozzej4myxt9', 19, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 10:40:30', '2023-06-11 12:07:40'),
(48, 'RedSeer Predicts Multi-Billion Dollar Revenue Potential for Short-Form Video Industry by 2030', 'A new report by Redseer Strategy Consultants suggests that the short-form video app market in India could become an $8-12 billion opportunity by 2030', '<p> Due to increased adoption and usage of smartphones. Homegrown apps such as Moj, Josh, and Chingari gained popularity in India after the government banned TikTok and other Chinese apps. The report identifies fashion and beauty, personal care, and packaged food and beverages as the categories that will see exponential growth in short video platforms. The report also emphasizes the need for a tech-enabled, transparent, and scalable solution for brands and influencers to engage with each other, and mentions that video commerce is just starting in India, with short-form video platforms expected to capture 40% of the $8-11 billion video commerce market in 2030. The report also notes that the preferred language for content consumption in metro and tier 1 cities is Hindi, followed by English and other regional languages.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678013249/ewurfct3d37motndbtny.jpg', 'ewurfct3d37motndbtny', 33, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 10:47:29', '2023-06-13 11:09:08'),
(49, 'NR Narayana Murthy reveals how Infosys executives took pay cuts and honored job offers during the Dotcom bust.', 'According to reports, Narayana Murthy, co-founder of Infosys, said that during the dot-com bust in 2001, the company\'s top executives took a pay cut.', '<p>While still honoring job offers and onboarding 1,500 freshers. However, many IT companies today, such as Tech Mahindra, Capgemini, and Accenture, have been delaying the onboarding of freshers while CEO salaries have increased drastically.</p><p><br></p><p>Wipro recently asked its fresher employees to accept a 50% reduction in salary, from Rs 6.5 lakh to Rs 3.5 lakh per annum. Narayana Murthy also advised against working from home and moonlighting, encouraging young people to work from the office instead. He also warned against the idea that work ethics, hard work, and laziness are not important.</p><p><br></p><p>In terms of freshers\' layoffs, Wipro and Infosys have recently fired hundreds of freshers for poor performance.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678013890/vknphgswgk2k5cjhfbvf.png', 'vknphgswgk2k5cjhfbvf', 38, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 10:58:10', '2023-06-13 07:03:53'),
(50, 'RBI Braces for Inflation: Brokerages Predict Interest Rate Hike in Response to 6.5% CPI Inflation in January', 'Brokerages predict that the rise in Consumer Price Index (CPI) inflation to 6.52% in January 2023', '<p>May prompt the Reserve Bank of India (RBI) to increase interest rates at the next Monetary Policy Committee (MPC) meeting in April. The rise in inflation was mainly driven by higher food prices, which saw food and beverage inflation increase from 4.6% in December to 6.2% in January. Despite this, Nirmal Bang Institutional Equities Research anticipates CPI inflation to fall to approximately 5% in March, with a projected range of 6.5-6.6% in FY23 and 5% in FY24. Nuvama Wealth Management noted that inflation is likely to decrease through FY24 as global commodity prices soften and domestic demand cools off. However, the existing current account deficit and high core inflation could lead to further RBI tightening in the short term.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678015157/nqvom8lvdig5vd6jk4ly.jpg', 'nqvom8lvdig5vd6jk4ly', 42, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 11:19:18', '2023-06-13 05:07:19'),
(51, 'CareEdge: NBFCs, Corporate, and Personal Loans Fuel Credit Growth in January.', 'According to the Reserve Bank of India\'s latest data, gross bank credit grew by nearly 18% YoY to almost Rs 129 trillion.', '<p>As of October 21, with loans to MSMEs, retail via NBFCs, home loans, and large corporations being major contributors. Personal loans rose 20.2% YoY, loans to the industry grew almost 14%, and loans to the services sector increased by nearly 23%. Bank loans to NBFCs rose 38% YoY as NBFCs found banks\' interest rates more favorable than the rates offered by the capital market. Despite corporate bond yields rising, bank loans to NBFCs continued to increase, with total loans standing at almost Rs 12.6 trillion.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678015828/dvqthxw4yfai1ahtdy65.jpg', 'dvqthxw4yfai1ahtdy65', 260, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-05 11:30:28', '2023-06-25 11:52:20'),
(53, 'Signature Bank Under Criminal Probe for Money Laundering Concerns Before Collapse', 'US regulators were investigating whether Signature Bank failed to prevent money laundering before its collapse on Sunday, 13th march, 2023.', '<p><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\">The investigation focused on the bank\'s dealings with cryptocurrency clients. The bank\'s failure to meet customer withdrawal demands resulted in the Federal Deposit Insurance Corporation taking over operations. While the bank has not been officially accused of wrongdoing, former Rep. Barney Frank attributed its failure to its dealings with cryptocurrency. The New York Department of Financial Services denied that its decision to shut down the bank was related to cryptocurrency. The collapse of Signature Bank and Silicon Valley Bank had an impact on the economy, with some regional banks experiencing mixed trading.</span></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678959914/ulszph6ggcfgzjadsbjs.jpg', 'ulszph6ggcfgzjadsbjs', 6, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-16 09:45:14', '2023-06-26 07:49:41'),
(54, 'OpenAI Launches GPT-4, A Powerful Upgrade to Language Model ChatGPT with Potential to Revolutionize Work Processes', 'OpenAI has released GPT-4, an upgraded language model that boasts enhanced capabilities', '<p>including the ability to analyze images and score highly on the bar exam. <span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">While users have already found creative uses for the model, concerns have been raised about the lack of transparency around the datasets used to train it, which could potentially lead to unintended consequences. However, OpenAI remains optimistic about GPT-4\'s transformative potential in various industries, such as suggesting recipes based on the contents of a fridge and automating legal work. The release of GPT-4 marks a new era of hyper-efficiency and increased competition, with professionals needing to work smarter and faster to remain competitive. The long-term impact of this technology on the job market and society as a whole remains to be seen.</span></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678962055/kmwvz4owoddcconqysle.jpg', 'kmwvz4owoddcconqysle', 39, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-16 10:20:56', '2023-03-22 12:44:14'),
(55, 'Bengaluru Couple Earns Rs 12 Lakh per Day by Quitting Corporate Jobs to Sell Samosas', 'Nidhi Singh and Shikhar Veer Singh, a married couple with successful careers and high salaries, decided to leave their jobs and start a samosa business in Bengaluru.', '<p>Although the journey was challenging, they now earn more than their previous jobs and are considering expanding their business. Both Nidhi and Shikhar come from affluent backgrounds and used their own savings to start the business. They even sold their expensive dream apartment to fund the expansion of their kitchen space. Their daily income is estimated to be in lakhs per day, and their business has grown exponentially with nearly 40 stores across the country. Shikhar came up with the idea for the business while studying, and Nidhi initially advised against it. However, they later added innovative samosas to their menu, including butter chicken and kadai paneer samosas, which became their most famous offerings.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1678963912/vjxdrmaoduycyrc5dxgv.jpg', 'vjxdrmaoduycyrc5dxgv', 23, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-16 10:51:53', '2023-06-26 06:12:55'),
(57, 'Indian Council of Medical Research (ICMR) Review Meeting Called as Daily COVID Cases Surge in India', 'India is facing a rapid surge of COVID-19 cases, and the Indian Council of Medical Research is meeting today to discuss the concerning situation.', '<p>The latest data from the Union health ministry shows 918 new coronavirus cases in a single day, bringing the total number of active cases to 6,350. Yesterday, the country saw the highest number of new COVID-19 cases in four months, with the last time over 1,000 cases reported being on November 6, 2022. The daily positivity rate was recorded at 2.08%, while the weekly positivity rate was pegged at 0.86%. In response to this surge, the Ministry of Health and Family Welfare has issued revised guidelines for managing COVID-19. Stay tuned for more updates as the situation continues to unfold.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679312097/i2gkfrymriunju61yvhy.jpg', 'i2gkfrymriunju61yvhy', 15, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-20 11:34:58', '2023-06-26 11:26:24'),
(58, 'Discover the exceptional Indian women who spearheaded the Chandrayaan-2 mission with their outstanding leadership and perseverance.', 'ISRO launched India\'s second mission to the Moon on July 22 with two women scientists as the Project and Mission Directors.', '<p>Following the technical glitch that caused the Chandrayaan-2 mission to be aborted last week, the Indian Space Research Organization (ISRO) successfully launched India\'s second mission to the Moon on July 22 at 2.43 pm. Notably, the Project Director and Mission Director are both accomplished women scientists, Muthayya Vanitha and Ritu Karidhal, respectively, from ISRO, the leading scientific organization in India managing the country\'s space programs. Their task is not complete until Chandrayaan 2 lands on the moon in September this year. Their stories of determination and triumph can serve as a source of inspiration for all of us to pursue our dreams and overcome any obstacles in our path.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679312560/qkl0pzavvyz7mbhusswm.jpg', 'qkl0pzavvyz7mbhusswm', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-20 11:42:40', '2023-06-16 01:22:05'),
(59, 'Introducing Sanju Rani Verma, the courageous woman who pursued her aspirations by leaving her home behind.', 'Sanju Rani Verma, a 35-year-old woman from India, left her home to become a Public Service Commission officer.', '<p>When her mother passed away in 2013, her family pressured her to get married at 28, which is considered too old for an unmarried woman in conservative Indian society. Sanju Rani chose to pursue her dream of becoming a civil servant, leaving her studies behind and teaching children while preparing for exams. She eventually passed the difficult UP PCS exams and became a civil servant. Sanju Rani\'s story highlights the societal pressure on women in India to prioritize marriage over education and career, which can lead to the abandonment of their aspirations. It also underscores the importance of financial independence and the need to support women\'s career aspirations.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679313376/amin4fzz07zoharyvf7e.jpg', 'amin4fzz07zoharyvf7e', 4, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-20 11:56:16', '2023-04-30 21:52:13'),
(60, 'Bangladesh PM Offers India Use of Chattogram and Sylhet Ports to Boost Connectivity', 'During a meeting with Ram Madhav, Sheikh Hasina offered India the use of Chattogram and Sylhet ports.', '<p>The offer was made to improve regional connectivity and promote trade between the two countries. Chattogram, a bustling port city located on the southeast coast of Bangladesh, and Sylhet, known for its Sufi shrines situated on the Surma River in the east, have significant potential for increased connectivity and trade. The India-Bangladesh Friendship Pipeline was also constructed to strengthen bilateral ties and promote trade. The pipeline has already increased trade between the two countries and is expected to further enhance economic ties. The offer of port usage and the construction of the pipeline highlight the importance of regional connectivity and cooperation in promoting socio-economic development and trade, and demonstrate the strong relationship between India and Bangladesh.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679313887/duwohf3hqehkmy3bqcno.jpg', 'duwohf3hqehkmy3bqcno', 6, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-20 12:03:12', '2023-06-22 04:48:26'),
(61, 'Study finds 186 US banks vulnerable to Silicon Valley Bank-like collapse', 'A new study warns that 186 US banks are at risk of collapse due to rising interest rates and a high proportion of uninsured deposits.', '<p>The report suggests that even if only half of uninsured depositors withdraw their funds, almost 190 banks could be impaired, potentially risking $300 billion in insured deposits. The banks\' vulnerability stems from holding most of their assets in government bonds and mortgage-backed securities, which are sensitive to interest rates. The recent collapse of the Silicon Valley Bank, which held a significant amount of uninsured deposits, highlights the risk of uninsured depositor runs. The report calls for government intervention or recapitalization to prevent potential bank failures.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679387831/xraebnmytqjzqb6bmtla.jpg', 'xraebnmytqjzqb6bmtla', 2, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-21 08:37:11', '2023-04-30 21:52:02'),
(62, 'Kirron Kher Contracts Covid-19 After Recovering from Blood Cancer', 'Actress and politician Kirron Kher has announced on Twitter that she has tested positive for Covid-19,', '<p>Urging anyone who has been in contact with her to get tested. Kirron had previously battled multiple myeloma, a type of blood cancer, but had recovered and returned to work as a judge on India\'s Got Talent. She is well-known for playing motherly roles in Bollywood films such as Devdas, Rang De Basanti, and Dostana. Kirron is married to fellow actor Anupam Kher, who will be appearing in two upcoming films, The Vaccine War and Emergency. The Vaccine War focuses on India\'s efforts to develop a Covid-19 vaccine, while Emergency is directed by Kangana Ranaut and tells the story of former Prime Minister Indira Gandhi.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679388261/hk5phkc03ombey2pn5q9.jpg', 'hk5phkc03ombey2pn5q9', 11, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-21 08:44:22', '2023-05-27 08:11:15'),
(63, 'Jury Rules in Favor of Samsung in Trademark Lawsuit Over \'S10\' Name.', 'Samsung Electronics has won a lawsuit filed by talent-management agency S10 Entertainment & Media,', '<p>&nbsp;Which claimed that Samsung\'s Galaxy S10 phones violated its trademark rights.&nbsp;The Los Angeles federal jury ruled that Samsung\'s smartphones were not likely to cause consumer confusion and drown out the talent agency\'s brand in the marketplace. S10 argued that Samsung\'s use of a similar font and color scheme as its logo and promotional partnerships with musicians would confuse customers into thinking the brands were affiliated. Samsung denied the allegations and said that S10 had waited too long to bring the lawsuit.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679388771/uajd8ecc06lilowxles7.jpg', 'uajd8ecc06lilowxles7', 42, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-21 08:52:51', '2023-06-16 01:22:11'),
(64, 'Indian Court Orders E-Commerce Company to Compensate Karnataka Student Rs 74,000 for Delivering Soap Instead of iPhone 11.', 'Harsha, a student from Karnataka, ordered an iPhone 11 worth Rs 48,999 on Flipkart in January 2021. However, he received a small keypad phone and a soap.', '<p>Despite several assurances from Flipkart representatives to resolve the issue, Harsha did not receive the iPhone. He then sent a legal notice to the company and eventually filed a case before a consumer court in July.</p><p><br></p><p>In March 2023, the consumer court ordered a refund of Rs 48,999 (the cost of the mobile phone) and also a compensation of Rs 25,000 towards deficiency in service, mental agony, and litigation costs. The court deemed the act and conduct of the company as an unfair trade practice, stating that such behavior and attitude cannot be expected from a company that sells products through online platforms. This ruling serves as a reminder to e-commerce companies that they must provide quality products and be held accountable for their actions.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679640352/tlvfy1mb7exhdetijije.jpg', 'tlvfy1mb7exhdetijije', 12, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 06:44:46', '2023-06-25 10:44:48'),
(65, 'Accenture Announces Massive Workforce Reduction: 19,000 Employees to Be Laid Off', 'IT company Accenture is laying off 19,000 employees (2.5% of total workforce) due to a worsening global economic outlook.', '<p>Which has also led to a reduction in revenue and profit forecasts. CEO Julie Sweet stated that the company will continue to invest in its business and people to take advantage of growth opportunities while carrying out the retrenchment process in stages over 18 months to minimize the impact on employees. Accenture\'s move aligns with other big companies like Meta, Google, and Amazon, who have also announced layoffs due to concerns about the economic recession. Experts predict the trend of employee retrenchment will continue until at least Q1 2023.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679640857/zjzctddrkutkkkun9x0i.svg', 'zjzctddrkutkkkun9x0i', 11, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 06:54:18', '2023-06-19 05:34:46'),
(66, 'TikTok\'s CEO fails to placate US lawmakers eager to ban it as America may be a step closer to banning the app', 'TikTok CEO, Shou Chew, testified for over four hours before the House Energy and Commerce Committee,', '<p> but his responses did not assuage lawmakers\' concerns over the app\'s data security and ties to China. Members of both parties questioned Chew\'s denial of ByteDance\'s access to US user data and his vague responses regarding Chinese employees\' involvement in the platform. The hearing also touched on the issue of TikTok\'s impact on mental health, with a compilation of videos about suicide being played and the parents of a 16-year-old boy who died by suicide after using the app in attendance. Despite TikTok\'s popularity with millions of Americans, lawmakers are exploring ways to force ByteDance to sell its shares or block the app in the US.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679640925/dxzllnodbbmw979uayfk.webp', 'dxzllnodbbmw979uayfk', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 06:55:25', '2023-06-16 01:22:03'),
(67, '4-Magnitude Earthquake Strikes Gwalior in Madhya Pradesh', 'On Friday, an earthquake with a magnitude of 4.0 struck Gwalior, Madhya Pradesh.', '<p>The National Center for Seismology reported that the earthquake occurred at 10:31:49 IST, with a depth of 10 km and located 28 km southeast of Gwalior, with latitude and longitude of 26.01 and 78.35, respectively. This event occurred just a few days after strong tremors rocked Delhi-NCR due to a 6.5-magnitude earthquake in Afghanistan. In response, a multi-state mega mock drill will be conducted today at five locations in Gurugram, as well as four districts in Uttar Pradesh, Delhi, and Haryana. The mock drill aims to review disaster management procedures during an earthquake, and officials have announced that it will be organized in Gurugram, Faridabad, Jhajjar, and Sonipat districts of Haryana.</p><p><br></p><p><br></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679641620/bpv5pnydpq8tzor5xrco.jpg', 'bpv5pnydpq8tzor5xrco', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:07:00', '2023-06-16 01:21:55'),
(68, 'A Study Reveals How COVID-19 Can Cause Alterations to Gene Structure', 'A recent study has revealed that individuals infected with the SARS-CoV-2 virus may experience changes in the structure of their genome', '<p>which could explain immunity-related symptoms and long COVID. The study found that the virus can cause chromatin, the structure in which genetic material is stored, to become disorganised, including a mixing of the \"yin and yang\" portions of chromatin architecture. These changes may explain the altered gene expression observed in COVID-19 patients, including the crucial inflammation gene, interleukin-6, which can cause cytokine storms. The study also found that the virus alters the chemical modifications on chromatin, which can have long-term effects on gene expression and phenotype. These findings provide new insights into the long-term impacts of COVID-19 and pave the way for future research to better understand the mechanisms by which the virus achieves these changes in chromatin.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679642468/bykumthz6wxko1ziyif8.jpg', 'bykumthz6wxko1ziyif8', 4, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:21:08', '2023-06-26 06:12:30'),
(69, 'Rahul Gandhi convicted of defamation and handed a two-year jail term for remarks about Indian Prime Minister Modi', 'Rahul Gandhi, an opposition leader in India, has been found guilty of defamation by a court in western India for a speech he made in 2019', '<p>where he referred to thieves as having the surname Modi. The court in Surat, located in Prime Minister Narendra Modi\'s home state of Gujarat, has sentenced Gandhi to two years in prison but suspended the sentence for 30 days, and he was granted bail. The criminal defamation case was filed by a leader of the ruling Bharatiya Janata Party (BJP). Gandhi argued in court that he had made the comment to highlight corruption and not to target any community. Despite being one of the main opposition leaders, Gandhi\'s party, Congress, controls less than 10% of elected seats in parliament\'s lower house and has lost to the BJP in two successive general elections, most recently in 2019. Prime Minister Modi is still India\'s most popular politician and is expected to win a third victory in the 2024 general elections.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679642993/m1atgolk1sxtntiro0ha.jpg', 'm1atgolk1sxtntiro0ha', 6, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:29:53', '2023-06-26 07:44:57'),
(70, '27 Million Indians Lose Internet Access as Punjab Police Hunt Sikh Separatist', 'The Indian government\'s decision to impose 4 days internet blackout on the state of Punjab has sparked controversy and concern from human rights groups.', '<p>The ban, affecting around 27 million people, was extended three times under a law that allows authorities to cut off internet access to maintain law and order as police search for a Sikh separatist leader. The leader, Amritpal Singh, is a popular figure in the Khalistan movement that seeks to establish a sovereign state for followers of the Sikh religion, and his supporters have been seen in the streets of Punjab, some carrying weapons. While the police justify the internet shutdown as a means to prevent fake news and incitement to violence, the decision has been criticized by many as an infringement on freedom of expression and information. The situation remains tense as the police continue their search for the separatist leader, and the clashes between the Sikh separatists and the Indian government have claimed many lives over the years.</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679643650/ow9x0egsdb6oqkqh6fec.jpg', 'ow9x0egsdb6oqkqh6fec', 5, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:40:50', '2023-06-26 07:43:15'),
(71, 'Relativity Space\'s Terran 1: The World\'s First 3D-Printed Rocket Fails to Reach Orbit After Stunning Nighttime Launch', 'Relativity Space has sent the \"world\'s first 3D-printed rocket\" named Terran 1 towards space from Cape Canaveral Space Force Station.', '<p>The rocket, fueled by super-chilled methane and oxygen, was designed to transport lightweight satellites into orbit. However, it encountered an engine issue after launch and failed to reach orbit. The mission was a prototype launch without a client satellite, but it carried a metal object as a commemorative token. The launch was postponed twice due to various issues, including bad weather and fuel pressure. During a previous attempt, a boat entered a restricted area in the rocket\'s path, and the launch was aborted due to a software issue.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679644261/cdxaljv5gdbdqwohqrg3.webp', 'cdxaljv5gdbdqwohqrg3', 8, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:51:02', '2023-06-26 07:46:10'),
(72, 'Accenture Announces Layoffs of 19,000 Employees Due to Economic Uncertainty and Reduced Demand', 'Accenture, the Irish-American consulting powerhouse, has announced its intention to reduce its workforce by 19,000 employees globally', '<p>which equates to roughly 2.5% of its total workforce. The company plans to consolidate office spaces in order to cut costs amidst increasing economic uncertainty. Most of the job losses will impact employees in back-office or non-client facing roles, and the company is expected to spend a staggering US$1.2 billion on severance payments over the next 18 months. This trend is not unique to Accenture, as other industry giants, such as KPMG and McKinsey, have also been affected by sluggish client spending. KPMG recently announced a 2% workforce reduction, and McKinsey is reportedly considering the elimination of 2,000 jobs.Despite having added 38,000 employees to its workforce in the last fiscal year, which ended in February, Accenture has revised its revenue growth projections for the current fiscal year, lowering the estimates from 8-11% to a range of 8-10%.</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679644730/p3jx0jh6cxbbtydqohi5.jpg', 'p3jx0jh6cxbbtydqohi5', 19, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 07:58:50', '2023-06-13 08:09:33'),
(73, 'Launch of CrickPe: Former BharatPe CEO Ashneer Grover introduces a revolutionary fantasy cricket app before IPL 2023', 'Ashneer Grover, the former co-founder of BharatPe and a former judge on Shark Tank India, has launched a new app called CrickPe', '<p>The app, managed by Grover\'s new venture Third Unicorn Private Limited, is a fantasy cricket app that allows users to create teams with real players and compete against others in IPL, Asia Cup 2023, and ICC World Cup 2023. With CrickPe, actual cricketers, cricketing bodies, and real team owners can win cash rewards with every match, along with the fantasy game winners. Users can earn money by enrolling in certain leagues for an entry fee, but players from certain states in India are not eligible to play cash contests. The app will compete against other popular mobile applications such as Dream11, Mobile Premier League, and My11Circle, and the company warns users to play responsibly as all gaming apps can be addictive.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679645195/lh12kyembnbbojwdnc5u.webp', 'lh12kyembnbbojwdnc5u', 24, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 08:06:35', '2023-06-24 19:50:57'),
(74, 'Supreme Court Mandates Surrender of Prisoners Released During Covid-19 Pandemic', 'The Supreme Court has given a directive that requires those who were imprisoned but later released during the COVID-19 to surrender within 15 days.', '<p> The purpose of this order is to alleviate the overcrowding of jails, which has been a long-standing issue. Undertrial prisoners who were released on emergency bail during the pandemic may request regular bail after surrendering. Convicts who were released during the pandemic may also apply for suspension of their sentence with the appropriate court. The decision emphasizes the importance of maintaining justice while prioritizing the safety and welfare of inmates.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679645864/gahzf9xmwg4sjhfpfav6.jpg', 'gahzf9xmwg4sjhfpfav6', 13, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 08:17:45', '2023-06-13 11:18:55'),
(75, 'Rahul Gandhi, Leader of India\'s Congress Party, Disqualified from Parliament', 'Congress leader Rahul Gandhi has been disqualified from the Lok Sabha after being convicted in a defamation case by a Surat court.', '<p>The Lok Sabha Secretariat issued a notice stating that he is disqualified from the House from March 23, the day of his conviction. The Congress party led a protest against Gandhi\'s conviction, with opposition MPs gathering and marching to the Rashtrapati Bhavan with posters claiming that democracy is in danger. When Gandhi arrived at the Lok Sabha this morning, there was chaos as Congress leaders demanded that he be allowed to speak, and the Lok Sabha was adjourned shortly after. Congress leader Jairam Ramesh shared the notice on Twitter and stated that they will fight this battle both legally and politically.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679650395/o1ooy97uuecsqg7sxbfa.webp', 'o1ooy97uuecsqg7sxbfa', 25, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-24 09:33:15', '2023-06-25 09:53:52'),
(76, 'Betrayed by Family: Woman Takes Legal Action Against Parents for Embezzling Her Money to Pay for Brother\'s Wedding.', 'A young American woman has taken legal action against her parents after they embezzled her university fund to pay for her brother\'s wedding.', '<p>She had received a savings account for her education from her great-aunt, but her parents gained unauthorized access and used the funds without her knowledge. The woman discovered the truth and was devastated, taking out student loans and moving out while pursuing legal action to reclaim her rightful savings. Despite her courage, she found herself ostracized by her family and left feeling isolated and betrayed.</p><p><br></p><p>This heartbreaking story highlights how familial love and trust can be easily shattered by greed and selfishness. The woman\'s determination to fight for what is rightfully hers is commendable and inspiring. She serves as a reminder that it is essential to hold loved ones accountable for their actions, even when it is difficult, and to never lose sight of one\'s dreams and aspirations.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679814073/gae0ij9uvz2oz8pzmv5d.jpg', 'gae0ij9uvz2oz8pzmv5d', 21, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-25 12:44:27', '2023-06-23 08:29:53'),
(77, 'From Resumes to Rentals: The Rising Trend of Using LinkedIn in Bengaluru\'s Competitive Housing Market', 'Looking for a rented apartment in a metro city can feel like an Olympic sport, especially when it comes to finding one in Bengaluru.', '<p>In fact, it can even turn into an extreme sport, as one man recently experienced. Goutham, a Twitter user, shared his apartment-hunting ordeal on the platform, and it\'s a prime example of the difficulties that can arise when looking for a place to live in this bustling city.</p><p><br></p><p>According to Goutham, one potential landlord asked him to share his LinkedIn profile, while another requested a \"small write-up\" about himself. It\'s no wonder he referred to the experience as an extreme sport! In a tweet, he shared screenshots of his conversations with brokers and declared it was day 12 of his house-hunting journey in Indiranagar.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679814041/xzqqq6vrfip4wgxyfs96.jpg', 'xzqqq6vrfip4wgxyfs96', 31, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-25 12:55:55', '2023-06-25 11:53:18'),
(78, 'Victory for Working Mothers: Allahabad High Court Affirms Maternity Leave Rights Beyond Childbirth Under Maternity Benefit Act 1961.', 'Allahabad High Court Supports Maternity Benefits for Women Beyond Childbirth: Maternity Leave Available for Adoption or Up to 3 Months After Birth', '<p>In a significant ruling, the Allahabad High Court has confirmed that the Maternity Benefit Act 1961 provides women with the right to maternity leave even after giving birth. The Court also extended this benefit to women who adopt a child legally or up to three months after delivery. The Act aims to enable women to balance their roles as mothers and workers by granting them flexible maternity leave. The Court emphasized that employers cannot discriminate against women on the basis of childbirth and must support them in continuing their careers.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679814221/uv7tfjqxfkc9m3wtbiq1.jpg', 'uv7tfjqxfkc9m3wtbiq1', 22, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-25 13:03:44', '2023-06-26 07:43:40'),
(79, 'Rajasthan Man Makes Medical History with Successful Total Arm Transplant Surgery in Asia', 'Over a decade ago, Ram lost both his hands in an electrical accident, leaving him heavily dependent on others for his daily activities.', '<p>Despite this challenge, Ram did not give up hope and taught himself to write by holding a pen with his legs. He completed his education and B.Ed exams through sheer determination and resilience.</p><p><br></p><p>With the help of the doctors and team at Global Hospital in Mumbai, Ram underwent a groundbreaking bilateral total arm transplant surgery, making medical history in Asia. Led by Dr Nilesh G Satbhai, the head of the Department of Plastic, Hand &amp; Reconstructive Microsurgery and Transplant Surgery, the 16-hour long procedure was a race against time. Ram is grateful to his family, the doctors, and the team at Global Hospital for giving him new hands. He is looking forward to healing and regaining his independence with the help of physiotherapy, which he will continue for the next 18 to 24 months. This milestone in India demonstrates that nothing is impossible, and Ram\'s determination and resilience are a true inspiration.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679814111/nvjzekdkvj7poje8epkr.jpg', 'nvjzekdkvj7poje8epkr', 44, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-25 13:14:36', '2023-06-23 09:42:02'),
(81, 'Rajasthan Government Doubles Incentives for Inter-Caste Marriages to Rs 10 Lakhs to Encourage Such Alliances.', 'Rajasthan Govt doubles incentives for inter-caste marriages, now offering Rs 10 lakhs for couples tying the knot.', '<p>The Dr Savita Ben Ambedkar Inter-caste Marriage Scheme includes a fixed deposit of Rs 5 lakhs for eight years, and the remaining amount deposited in a joint bank account for newlyweds. The initiative is aimed at promoting inclusivity and social harmony in a time where inter-caste and inter-faith marriages are still met with controversy and criticism. The scheme allows inter-caste marriages only up to the age of 35, with half of the incentive money granted to the couple and the remaining held in a fixed deposit for eight years.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1679831265/oggawv65fxzr8tq9onnb.jpg', 'oggawv65fxzr8tq9onnb', 125, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-03-26 11:47:49', '2023-06-26 07:44:48'),
(84, 'PM Modi\'s School in Vadnagar Transforms into an Inspirational Centre, Welcoming Students from Across India', 'Prime Minister Narendra Modi\'s childhood school in Vadnagar, Gujarat, has undergone a remarkable transformation into \"Prerna\" (inspiration).', '<p>A model school aimed at motivating and empowering the youth of India. Developed as an experiential learning center, Prerna focuses on imparting values and fostering personal growth through innovative techniques and technologies.</p><p><br></p><p>With extensive restoration work led by the Archaeological Survey of India (ASI), the historical school, established in 1888, now stands as a testament to Vadnagar\'s rich heritage. Additionally, the Union Ministry of Culture, in collaboration with the Government of Gujarat, is developing a state-of-the-art archaeological museum in the town, further highlighting its cultural significance.</p><p>Under the Prerna initiative, two students from each of the 750 districts in India will have the exclusive opportunity to spend a week at the school, engaging in immersive learning experiences. With a maximum of 30 students from 15 districts attending at any given time, Prerna aims to be a pioneering institution that inspires young Indians to become catalysts of positive change. This redevelopment project showcases the government\'s dedication to preserving heritage and nurturing the aspirations of the country\'s future generations.</p>', 1, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687076138/twhhpbczbbpb7ypoopmw.jpg', 'twhhpbczbbpb7ypoopmw', 7, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-18 08:15:39', '2023-06-25 11:52:09'),
(85, 'Patanjali Foods Sets Ambitious Goals to Challenge FMCG Giants', 'Patanjali Foods, led by CEO Sanjeev Asthana and founder Baba Ramdev, aims to become one of the top two FMCG companies', '<p>&nbsp;With a commitment to stakeholders and a target of 80% profits.&nbsp;Already surpassing most multinational corporations (MNCs), the company has reached 200 crore people across 200 countries, with a group turnover exceeding Rs 45,000 crore. Patanjali Foods plans to introduce premium products, expand in the agriculture sector, and invest up to Rs 1,500 crore in capital expenditure, primarily focused on scaling up its palm oil business. With these strategies in place, the company is on a path to become a significant player in the FMCG market.</p><p><br></p><p>\"File:Bhai Sunder Panchal with Baba Ramdev.jpg\" by Sunder panchal is licensed under CC BY-SA 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0/?ref=openverse.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687078090/n0kcfxrzibzfmh7sze3w.jpg', 'n0kcfxrzibzfmh7sze3w', 20, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-18 08:48:11', '2023-06-26 08:26:41');
INSERT INTO `news` (`id`, `title`, `previewText`, `news`, `isFeatured`, `isNSFW`, `isPaid`, `sponsorURL`, `image`, `publicId`, `views`, `ageGroup`, `gender`, `createdAt`, `updatedAt`) VALUES
(86, 'Tata Steel Joins Forces with SMS Group to Pioneer Low Carbon Steel Technology, Aims for Net Zero Emissions', 'Tata Steel, in partnership with Germany\'s SMS Group, is venturing into the development of low carbon steel making technology.', '<p>Under a memorandum of understanding (MoU), both companies will engage in technical discussions and conduct a Joint Industrial Demonstration of the EASyMelt technology at Tata Steel\'s Jamshedpur plant in India. This technology aims to reduce carbon dioxide emissions by over 50% compared to the baseline operation of the blast furnace. EASyMelt is an electric-assisted syngas smelter solution that can be integrated into existing steel plants to expedite the decarbonization process. Tata Steel, the world\'s second-largest steel producer, is committed to leading India\'s journey towards decarbonization and aims to achieve net zero carbon emissions by 2045. The company seeks deeper collaboration to access advanced technologies and processes in order to consistently reduce its carbon footprint and contribute to a sustainable future.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687166248/gqmuav3h6q8srpme9xyz.png', 'gqmuav3h6q8srpme9xyz', 3, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-19 09:17:28', '2023-06-19 09:40:40'),
(87, 'Standard Chartered Appoints Nick Huang as Head of Client Coverage for Asia', 'With over 30 years of extensive experience in the banking industry, Nick brings a wealth of knowledge gained from managing corporate, commercial,', '<p>And financial institution businesses across Asia and North America. With over 30 years of extensive experience in the banking industry, Nick brings a wealth of knowledge gained from managing corporate, commercial, and financial institution businesses across Asia and North America.</p><p><br></p><p>Previously serving as the Head of Commercial Bank at East West Bank, Nick has held senior positions at renowned institutions such as Chinatrust Commercial Bank, JP Morgan, China CITIC Bank International, and Citi. His expertise and understanding of the Asian market make him a valuable addition to Standard Chartered\'s team.</p><p><br></p><p>Based in Hong Kong, Nick Huang will report to Paul Skelton, the Global Head of Client Coverage at Standard Chartered. Skelton expressed his delight at Nick\'s appointment, highlighting his extensive experience and ability to connect clients across the bank\'s unique global network.</p><p><br></p><p>The appointment of Nick Huang signifies Standard Chartered\'s commitment to providing exceptional client coverage in Asia and further strengthening its position as a leading financial institution in the region.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687167529/k35rtewlaidzwzep96xb.jpg', 'k35rtewlaidzwzep96xb', 12, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-19 09:38:50', '2023-06-26 10:42:21'),
(88, 'EU Accuses Google of Unfair Advertising, Faces Possible Punishment', 'The European Union (EU) has leveled accusations against Google, alleging unfair conduct in the advertising industry.', '<p>The EU claims that Google has shown preference to its own ad exchange program, disadvantaging competitors and hindering fair competition. If found guilty of breaking the law, Google may be required to divest a portion of its advertising services.</p><p><br></p><p>Google, however, firmly denies the allegations and emphasizes its commitment to supporting publishers and advertisers within a highly competitive sector. The company maintains that the EU\'s investigation focuses on a specific aspect of its advertising business and that it will respond accordingly.</p><p><br></p><p>The outcome of the case holds significant ramifications for Google\'s operations in Europe. If forced to divest or face other penalties, it could have far-reaching consequences on the tech giant\'s dominance in the ad tech market. The charges from the EU echo similar accusations brought by the U.S. Justice Department and ongoing investigations conducted by the UK\'s competition authority. As the legal battles unfold, the industry and market observers eagerly await the resolution and potential implications for Google\'s future business practices.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687172691/glwztbs6ujuxezjrh3ym.jpg', 'glwztbs6ujuxezjrh3ym', 22, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-19 11:04:52', '2023-06-26 08:26:25'),
(89, 'Accenture to Double AI Talent Pool with 80,000 Professionals in Strategic Investment', 'Accenture, a global professional services company, is ramping up its investment in artificial intelligence (AI) to drive industry innovation.', '<p>With over a decade of AI expertise and an extensive portfolio of patents and client solutions, Accenture is well-positioned to leverage the power of AI. The company plans to invest in various areas, including assets, industry solutions, acquisitions, talent, and ecosystem partnerships. Accenture\'s Data &amp; AI practice will double its AI talent pool to 80,000 professionals through hiring, acquisitions, and training. Additionally, Accenture will introduce the AI Navigator for Enterprise, a generative AI-based platform that will help clients define business cases, make informed decisions, and understand algorithms responsibly. The company aims to create accelerators for data and AI readiness across multiple industries and establish the Center for Advanced AI to drive research and development in generative AI. With these investments, Accenture aims to reshape strategies, technologies, and ways of working, driving innovation and value responsibly.</p><p><br></p><p>Accenture\'s expanded investment in AI demonstrates its commitment to driving technological change and supporting digital transformation. The company\'s deep expertise and extensive resources enable it to deliver tangible outcomes and build lasting relationships with clients worldwide. By harnessing the transformative power of AI, Accenture aims to revolutionize industries, accelerate innovation, and help clients unlock the full potential of AI to reshape their businesses and drive value in a responsible and efficient manner.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687173122/ovrmpckzyzer7bvxw50g.jpg', 'ovrmpckzyzer7bvxw50g', 101, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-19 11:12:04', '2023-06-26 10:44:09'),
(90, 'SoftBank\'s Vision Fund Faces Layoffs Amid Financial Challenges', 'SoftBank Group Corp is planning layoffs at its Vision Fund investment arm as part of cost-cutting measures.', '<p>The upcoming job cuts, expected to be announced soon, may impact up to 30% of the unit\'s workforce, including employees in the United States. The Vision Fund has experienced significant investment losses and declining portfolio valuations due to US-China tensions and rising interest rates. SoftBank aims to stabilize its balance sheet and has been scaling back its investment activities while preparing for the listing of chip designer Arm, which could provide a much-needed cash injection. Intel is reportedly in talks to become an anchor investor in Arm\'s IPO. SoftBank\'s shares rose 5% following news of the impending layoffs, and the company is seeking a balance between defense and offense as it navigates its financial challenges.</p>', 0, 0, 0, '', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1687687927/wvypgzjdqxyqzqqkmoj8.jpg', 'wvypgzjdqxyqzqqkmoj8', 10, '[\"14-20\",\"21-35\",\"36-50\",\"51 & above\"]', '[\"Male\",\"Female\",\"Others\"]', '2023-06-25 10:12:08', '2023-06-26 10:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `news_occupation`
--

CREATE TABLE `news_occupation` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `newsId` int(11) NOT NULL,
  `occupationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news_occupation`
--

INSERT INTO `news_occupation` (`createdAt`, `updatedAt`, `newsId`, `occupationId`) VALUES
('2023-02-27 10:10:13', '2023-02-27 10:10:13', 2, 1),
('2023-02-27 10:10:13', '2023-02-27 10:10:13', 2, 2),
('2023-02-27 10:10:13', '2023-02-27 10:10:13', 2, 3),
('2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 1),
('2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 2),
('2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 3),
('2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 1),
('2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 2),
('2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 3),
('2023-02-27 10:01:47', '2023-02-27 10:01:47', 5, 1),
('2023-02-27 10:01:47', '2023-02-27 10:01:47', 5, 2),
('2023-02-27 10:01:47', '2023-02-27 10:01:47', 5, 3),
('2023-02-27 10:10:52', '2023-02-27 10:10:52', 6, 1),
('2023-02-27 10:10:52', '2023-02-27 10:10:52', 6, 2),
('2023-02-27 10:10:52', '2023-02-27 10:10:52', 6, 3),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 1),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 2),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 3),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 1),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 2),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 3),
('2023-02-27 12:25:13', '2023-02-27 12:25:13', 14, 1),
('2023-02-27 12:25:13', '2023-02-27 12:25:13', 14, 2),
('2023-02-27 12:25:13', '2023-02-27 12:25:13', 14, 3),
('2023-02-27 12:42:51', '2023-02-27 12:42:51', 15, 1),
('2023-02-27 12:42:51', '2023-02-27 12:42:51', 15, 2),
('2023-02-27 12:42:51', '2023-02-27 12:42:51', 15, 3),
('2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 1),
('2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 2),
('2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 3),
('2023-02-27 13:21:32', '2023-02-27 13:21:32', 17, 1),
('2023-02-27 13:21:32', '2023-02-27 13:21:32', 17, 2),
('2023-02-27 13:21:32', '2023-02-27 13:21:32', 17, 3),
('2023-02-27 13:45:20', '2023-02-27 13:45:20', 19, 1),
('2023-02-27 13:45:20', '2023-02-27 13:45:20', 19, 2),
('2023-02-27 13:45:20', '2023-02-27 13:45:20', 19, 3),
('2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 1),
('2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 2),
('2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 3),
('2023-02-27 14:03:17', '2023-02-27 14:03:17', 21, 1),
('2023-02-27 14:03:17', '2023-02-27 14:03:17', 21, 2),
('2023-02-27 14:03:17', '2023-02-27 14:03:17', 21, 3),
('2023-03-01 10:27:14', '2023-03-01 10:27:14', 22, 1),
('2023-03-01 10:27:14', '2023-03-01 10:27:14', 22, 2),
('2023-03-01 10:27:14', '2023-03-01 10:27:14', 22, 3),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 1),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 2),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 3),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 4),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 5),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 1),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 2),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 3),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 4),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 5),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 1),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 2),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 3),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 4),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 5),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 1),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 2),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 3),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 4),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 5),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 1),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 2),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 3),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 4),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 5),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 1),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 2),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 3),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 4),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 5),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 1),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 2),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 3),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 4),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 5),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 1),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 2),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 3),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 4),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 5),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 1),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 2),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 3),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 4),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 5),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 1),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 2),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 3),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 4),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 5),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 1),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 2),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 3),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 4),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 5),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 1),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 2),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 3),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 4),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 5),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 1),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 2),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 3),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 4),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 5),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 1),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 2),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 3),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 4),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 5),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 1),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 2),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 3),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 4),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 5),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 1),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 2),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 3),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 4),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 5),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 1),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 2),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 3),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 4),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 5),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 1),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 2),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 3),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 4),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 5),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 1),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 2),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 3),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 4),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 5),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 1),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 2),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 3),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 4),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 5),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 1),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 2),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 3),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 4),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 5),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 1),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 2),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 3),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 4),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 5),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 1),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 2),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 3),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 4),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 5),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 1),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 2),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 3),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 4),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 5),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 1),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 2),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 3),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 4),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 5),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 1),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 2),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 3),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 4),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 5),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 1),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 2),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 3),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 4),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 5),
('2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 1),
('2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 2),
('2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 3),
('2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 4),
('2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 5),
('2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 1),
('2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 2),
('2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 3),
('2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 4),
('2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 5),
('2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 1),
('2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 2),
('2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 3),
('2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 4),
('2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 5),
('2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 1),
('2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 2),
('2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 3),
('2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 4),
('2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 5),
('2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 1),
('2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 2),
('2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 3),
('2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 4),
('2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 5),
('2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 1),
('2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 2),
('2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 3),
('2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 4),
('2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 5),
('2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 1),
('2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 2),
('2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 3),
('2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 4),
('2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 5),
('2023-03-21 08:37:12', '2023-03-21 08:37:12', 61, 1),
('2023-03-21 08:37:12', '2023-03-21 08:37:12', 61, 2),
('2023-03-21 08:37:12', '2023-03-21 08:37:12', 61, 3),
('2023-03-21 08:37:12', '2023-03-21 08:37:12', 61, 4),
('2023-03-21 08:37:12', '2023-03-21 08:37:12', 61, 5),
('2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 1),
('2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 2),
('2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 3),
('2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 4),
('2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 5),
('2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 1),
('2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 2),
('2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 3),
('2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 4),
('2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 5),
('2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 1),
('2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 2),
('2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 3),
('2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 4),
('2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 5),
('2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 1),
('2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 2),
('2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 3),
('2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 4),
('2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 5),
('2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 1),
('2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 2),
('2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 3),
('2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 4),
('2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 5),
('2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 1),
('2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 2),
('2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 3),
('2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 4),
('2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 5),
('2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 1),
('2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 2),
('2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 3),
('2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 4),
('2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 5),
('2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 1),
('2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 2),
('2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 3),
('2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 4),
('2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 5),
('2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 1),
('2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 2),
('2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 3),
('2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 4),
('2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 5),
('2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 1),
('2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 2),
('2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 3),
('2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 4),
('2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 5),
('2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 1),
('2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 2),
('2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 3),
('2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 4),
('2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 5),
('2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 1),
('2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 2),
('2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 3),
('2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 4),
('2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 5),
('2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 1),
('2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 2),
('2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 3),
('2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 4),
('2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 5),
('2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 1),
('2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 2),
('2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 3),
('2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 4),
('2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 5),
('2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 1),
('2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 2),
('2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 3),
('2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 4),
('2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 5),
('2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 1),
('2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 2),
('2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 3),
('2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 4),
('2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 5),
('2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 1),
('2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 2),
('2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 3),
('2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 4),
('2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 5),
('2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 1),
('2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 2),
('2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 3),
('2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 4),
('2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 5),
('2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 1),
('2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 2),
('2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 3),
('2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 4),
('2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 5),
('2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 1),
('2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 2),
('2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 3),
('2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 4),
('2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 5),
('2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 1),
('2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 2),
('2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 3),
('2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 4),
('2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 5),
('2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 1),
('2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 2),
('2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 3),
('2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 4),
('2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 5),
('2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 1),
('2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 2),
('2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 3),
('2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 4),
('2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 5),
('2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 1),
('2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 2),
('2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 3),
('2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 4),
('2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 5),
('2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 1),
('2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 2),
('2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 3),
('2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 4),
('2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 5),
('2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 1),
('2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 2),
('2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 3),
('2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 4),
('2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 5);

-- --------------------------------------------------------

--
-- Table structure for table `news_topic`
--

CREATE TABLE `news_topic` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `newsId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news_topic`
--

INSERT INTO `news_topic` (`createdAt`, `updatedAt`, `newsId`, `topicId`) VALUES
('2023-02-27 10:10:13', '2023-02-27 10:10:13', 2, 6),
('2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 2),
('2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 6),
('2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 2),
('2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 6),
('2023-02-27 10:01:47', '2023-02-27 10:01:47', 5, 1),
('2023-02-27 10:10:52', '2023-02-27 10:10:52', 6, 1),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 1),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 2),
('2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 6),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 1),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 2),
('2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 6),
('2023-02-27 12:25:13', '2023-02-27 12:25:13', 14, 8),
('2023-02-27 12:42:51', '2023-02-27 12:42:51', 15, 1),
('2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 10),
('2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 11),
('2023-02-27 13:21:32', '2023-02-27 13:21:32', 17, 1),
('2023-02-27 13:45:20', '2023-02-27 13:45:20', 19, 1),
('2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 1),
('2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 11),
('2023-02-27 14:03:17', '2023-02-27 14:03:17', 21, 1),
('2023-03-01 10:27:14', '2023-03-01 10:27:14', 22, 11),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 6),
('2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 11),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 1),
('2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 6),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 1),
('2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 6),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 1),
('2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 6),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 1),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 2),
('2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 6),
('2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 10),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 2),
('2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 6),
('2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 6),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 1),
('2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 13),
('2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 6),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 2),
('2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 6),
('2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 6),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 1),
('2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 6),
('2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 1),
('2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 6),
('2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 1),
('2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 6),
('2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 2),
('2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 2),
('2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 2),
('2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 6),
('2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 6),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 2),
('2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 6),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 2),
('2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 6),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 2),
('2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 6),
('2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 6),
('2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 6);

-- --------------------------------------------------------

--
-- Table structure for table `news_topics`
--

CREATE TABLE `news_topics` (
  `order` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `newsId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `news_topics`
--

INSERT INTO `news_topics` (`order`, `createdAt`, `updatedAt`, `newsId`, `topicId`) VALUES
(0, '2023-02-27 10:10:13', '2023-02-27 10:10:13', 2, 6),
(0, '2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 2),
(0, '2023-02-27 09:06:10', '2023-02-27 09:06:10', 3, 6),
(0, '2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 2),
(0, '2023-02-27 09:11:25', '2023-02-27 09:11:25', 4, 6),
(0, '2023-02-27 10:01:47', '2023-02-27 10:01:47', 5, 1),
(0, '2023-02-27 10:10:52', '2023-02-27 10:10:52', 6, 1),
(0, '2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 1),
(0, '2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 2),
(0, '2023-02-27 11:11:54', '2023-02-27 11:11:54', 11, 6),
(0, '2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 1),
(0, '2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 2),
(0, '2023-02-27 11:14:57', '2023-02-27 11:14:57', 12, 6),
(0, '2023-02-27 12:25:13', '2023-02-27 12:25:13', 14, 8),
(0, '2023-02-27 12:42:51', '2023-02-27 12:42:51', 15, 1),
(0, '2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 10),
(0, '2023-02-27 12:57:57', '2023-02-27 12:57:57', 16, 11),
(0, '2023-02-27 13:21:32', '2023-02-27 13:21:32', 17, 1),
(0, '2023-02-27 13:45:20', '2023-02-27 13:45:20', 19, 1),
(0, '2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 1),
(0, '2023-02-27 13:53:37', '2023-02-27 13:53:37', 20, 11),
(0, '2023-02-27 14:03:17', '2023-02-27 14:03:17', 21, 1),
(0, '2023-03-01 10:27:14', '2023-03-01 10:27:14', 22, 11),
(0, '2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 6),
(0, '2023-03-01 08:51:19', '2023-03-01 08:51:19', 23, 11),
(0, '2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 1),
(0, '2023-03-01 09:30:40', '2023-03-01 09:30:40', 24, 6),
(0, '2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 1),
(0, '2023-03-01 09:36:19', '2023-03-01 09:36:19', 25, 6),
(0, '2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 1),
(0, '2023-03-01 10:08:19', '2023-03-01 10:08:19', 26, 6),
(0, '2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 1),
(0, '2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 2),
(0, '2023-03-01 10:09:51', '2023-03-01 10:09:51', 27, 6),
(0, '2023-03-01 10:25:26', '2023-03-01 10:25:26', 28, 10),
(0, '2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 2),
(0, '2023-03-02 09:14:44', '2023-03-02 09:14:44', 29, 6),
(0, '2023-03-02 09:33:42', '2023-03-02 09:33:42', 30, 6),
(0, '2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 1),
(0, '2023-03-02 10:21:51', '2023-03-02 10:21:51', 31, 13),
(0, '2023-03-02 10:27:45', '2023-03-02 10:27:45', 32, 6),
(0, '2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 2),
(0, '2023-03-03 07:41:05', '2023-03-03 07:41:05', 33, 6),
(0, '2023-03-03 07:40:35', '2023-03-03 07:40:35', 34, 6),
(0, '2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 1),
(0, '2023-03-03 09:32:22', '2023-03-03 09:32:22', 36, 6),
(0, '2023-03-03 10:00:43', '2023-03-03 10:00:43', 37, 1),
(0, '2023-03-03 10:06:36', '2023-03-03 10:06:36', 38, 6),
(0, '2023-03-03 10:27:24', '2023-03-03 10:27:24', 39, 1),
(0, '2023-03-03 10:31:24', '2023-03-03 10:31:24', 40, 6),
(0, '2023-03-03 10:48:09', '2023-03-03 10:48:09', 41, 2),
(0, '2023-03-03 11:01:46', '2023-03-03 11:01:46', 42, 2),
(0, '2023-03-03 11:18:18', '2023-03-03 11:18:18', 43, 2),
(0, '2023-03-03 14:08:42', '2023-03-03 14:08:42', 45, 6),
(0, '2023-03-05 10:22:52', '2023-03-05 10:22:52', 46, 6),
(0, '2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 2),
(0, '2023-03-05 10:40:30', '2023-03-05 10:40:30', 47, 6),
(0, '2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 2),
(0, '2023-03-05 10:47:29', '2023-03-05 10:47:29', 48, 6),
(0, '2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 2),
(0, '2023-03-05 10:58:10', '2023-03-05 10:58:10', 49, 6),
(0, '2023-03-05 11:19:18', '2023-03-05 11:19:18', 50, 6),
(0, '2023-03-05 11:30:28', '2023-03-05 11:30:28', 51, 6),
(0, '2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 11),
(1, '2023-03-16 09:45:14', '2023-03-16 09:45:14', 53, 13),
(0, '2023-03-16 10:20:56', '2023-03-16 10:20:56', 54, 2),
(0, '2023-03-16 10:51:53', '2023-03-16 10:51:53', 55, 6),
(0, '2023-03-20 11:34:58', '2023-03-20 11:34:58', 57, 1),
(0, '2023-03-20 11:42:40', '2023-03-20 11:42:40', 58, 2),
(0, '2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 6),
(1, '2023-03-20 11:56:16', '2023-03-20 11:56:16', 59, 8),
(0, '2023-03-20 12:04:48', '2023-03-20 12:04:48', 60, 1),
(0, '2023-03-21 08:37:11', '2023-03-21 08:37:11', 61, 6),
(0, '2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 1),
(1, '2023-03-21 08:44:22', '2023-03-21 08:44:22', 62, 8),
(0, '2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 2),
(1, '2023-03-21 08:52:51', '2023-03-21 08:52:51', 63, 13),
(1, '2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 2),
(0, '2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 6),
(2, '2023-03-24 06:45:53', '2023-03-24 06:45:53', 64, 11),
(0, '2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 2),
(1, '2023-03-24 06:54:18', '2023-03-24 06:54:18', 65, 6),
(0, '2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 2),
(1, '2023-03-24 06:55:25', '2023-03-24 06:55:25', 66, 11),
(0, '2023-03-24 07:07:00', '2023-03-24 07:07:00', 67, 2),
(0, '2023-03-24 07:21:39', '2023-03-24 07:21:39', 68, 1),
(0, '2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 1),
(1, '2023-03-24 07:29:53', '2023-03-24 07:29:53', 69, 13),
(0, '2023-03-24 07:40:50', '2023-03-24 07:40:50', 70, 1),
(0, '2023-03-24 07:51:02', '2023-03-24 07:51:02', 71, 2),
(0, '2023-03-24 07:58:50', '2023-03-24 07:58:50', 72, 6),
(0, '2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 2),
(1, '2023-03-24 08:06:35', '2023-03-24 08:06:35', 73, 4),
(0, '2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 11),
(1, '2023-03-24 08:17:45', '2023-03-24 08:17:45', 74, 13),
(0, '2023-03-24 09:33:15', '2023-03-24 09:33:15', 75, 1),
(1, '2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 8),
(0, '2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 11),
(2, '2023-03-26 07:01:14', '2023-03-26 07:01:14', 76, 13),
(0, '2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 2),
(1, '2023-03-26 07:00:42', '2023-03-26 07:00:42', 77, 8),
(0, '2023-03-26 07:03:42', '2023-03-26 07:03:42', 78, 13),
(0, '2023-03-26 07:01:52', '2023-03-26 07:01:52', 79, 2),
(1, '2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 8),
(0, '2023-03-26 11:47:49', '2023-03-26 11:47:49', 81, 13),
(0, '2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 1),
(3, '2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 6),
(1, '2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 8),
(2, '2023-06-18 08:15:39', '2023-06-18 08:15:39', 84, 10),
(0, '2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 6),
(2, '2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 8),
(1, '2023-06-18 08:48:11', '2023-06-18 08:48:11', 85, 10),
(0, '2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 6),
(1, '2023-06-19 09:17:28', '2023-06-19 09:17:28', 86, 8),
(1, '2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 2),
(0, '2023-06-19 09:38:50', '2023-06-19 09:38:50', 87, 6),
(0, '2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 2),
(1, '2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 6),
(3, '2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 11),
(2, '2023-06-19 11:04:52', '2023-06-19 11:04:52', 88, 13),
(0, '2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 2),
(1, '2023-06-19 11:12:04', '2023-06-19 11:12:04', 89, 6),
(2, '2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 1),
(1, '2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 2),
(0, '2023-06-25 10:12:08', '2023-06-25 10:12:08', 90, 6);

-- --------------------------------------------------------

--
-- Table structure for table `occupations`
--

CREATE TABLE `occupations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `occupations`
--

INSERT INTO `occupations` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Student', '2023-02-27 07:24:16', '2023-02-27 07:24:16'),
(2, 'Employee', '2023-02-27 07:24:19', '2023-02-27 07:24:19'),
(3, 'Employer', '2023-02-27 07:24:31', '2023-02-27 07:24:31'),
(4, 'Business Owner', '2023-02-28 10:44:44', '2023-02-28 10:44:44'),
(5, 'Others', '2023-02-28 10:44:52', '2023-02-28 10:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `title`, `createdAt`, `updatedAt`) VALUES
(5, '<p>Curated News</p><p>every <strong>single</strong> day.</p>', '2023-03-03 12:22:34', '2023-03-03 12:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `created_at`, `user_id`) VALUES
(3, '3E1B', '2023-02-28 09:29:15', NULL),
(4, 'D7BX', '2023-03-01 08:20:02', 4),
(6, 'DWHZ', '2023-03-08 09:52:02', NULL),
(7, '41WN', '2023-03-08 09:52:59', NULL),
(12, 'KR7W', '2023-03-13 10:41:17', NULL),
(13, 'R5HA', '2023-03-13 10:54:27', NULL),
(14, 'T7J2', '2023-03-13 10:54:32', NULL),
(15, '8PZM', '2023-03-13 10:55:08', NULL),
(16, '7MVY', '2023-03-13 10:55:09', NULL),
(17, '15Z2', '2023-03-13 10:55:10', NULL),
(18, 'J6YR', '2023-03-13 10:55:25', NULL),
(20, '60VK', '2023-03-13 10:57:27', NULL),
(21, '198N', '2023-03-25 04:11:27', NULL),
(22, 'KE8M', '2023-03-25 04:12:29', NULL),
(28, '2KS4', '2023-06-12 11:21:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `publicId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `createdAt`, `updatedAt`, `image`, `publicId`) VALUES
(1, 'Politics', '2023-02-27 07:23:42', '2023-03-05 04:59:32', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992371/uiwmatkieheknwxryvgx.jpg', 'uiwmatkieheknwxryvgx'),
(2, 'Technology', '2023-02-27 07:24:02', '2023-03-05 05:01:20', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992480/sxlu5hcs6tmbytcuvokm.jpg', 'sxlu5hcs6tmbytcuvokm'),
(4, 'Sports', '2023-02-27 07:24:06', '2023-03-05 05:02:28', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992547/hdkynoyi54vhjmyjsc6t.jpg', 'hdkynoyi54vhjmyjsc6t'),
(6, 'Business', '2023-02-27 08:42:46', '2023-03-05 05:02:56', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992575/mhluib1cr1lnews5ylbw.jpg', 'mhluib1cr1lnews5ylbw'),
(8, 'Entertainment', '2023-02-27 12:21:49', '2023-03-05 05:03:23', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992603/h9effaubdgqqdyswhp1g.jpg', 'h9effaubdgqqdyswhp1g'),
(10, 'Bollywood', '2023-02-27 12:22:09', '2023-03-05 04:58:53', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992332/hdklortnjdi8xlbpwfwy.jpg', 'hdklortnjdi8xlbpwfwy'),
(11, 'Crime', '2023-02-27 12:49:58', '2023-03-05 05:04:38', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992677/npodxnlxazehqkg4ts3r.jpg', 'npodxnlxazehqkg4ts3r'),
(13, 'Law', '2023-03-02 10:21:13', '2023-03-02 10:21:13', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677752472/do0wn5oshdvs2aw8cjxd.jpg', 'do0wn5oshdvs2aw8cjxd'),
(14, 'Hollywood', '2023-03-05 04:57:50', '2023-03-05 04:57:50', 'https://res.cloudinary.com/dkxsi7mmm/image/upload/v1677992269/fxy2acrhm9pvlbpgxe6v.jpg', 'fxy2acrhm9pvlbpgxe6v');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `socialUserId` varchar(255) DEFAULT NULL,
  `registrationType` enum('email','google','apple') NOT NULL,
  `isActive` tinyint(1) DEFAULT 0,
  `isComplete` tinyint(1) DEFAULT 0,
  `gender` varchar(255) DEFAULT NULL,
  `ageGroup` varchar(255) DEFAULT NULL,
  `skipPolitical` tinyint(1) DEFAULT 0,
  `skipNSFW` tinyint(1) DEFAULT 0,
  `role` varchar(255) DEFAULT 'user',
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetPasswordExpires` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `occupationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `phone`, `email`, `password`, `socialUserId`, `registrationType`, `isActive`, `isComplete`, `gender`, `ageGroup`, `skipPolitical`, `skipNSFW`, `role`, `resetPasswordToken`, `resetPasswordExpires`, `createdAt`, `updatedAt`, `occupationId`) VALUES
(4, 'Deep Sharma', NULL, 'sharmadeep698@gmail.com', '$2b$10$zrcQyaMs3xgeJzJRgBf9UOafk5KCjVu9QfYLtsquCu84BceHMRoZy', NULL, 'email', 1, 1, 'Male', '21-35', 0, 1, 'admin', NULL, NULL, '2023-03-01 08:20:00', '2023-03-01 08:23:07', 3),
(31, 'raiprabal', NULL, 'prabalrai17@gmail.com', NULL, NULL, 'google', 1, 1, 'Male', '21-35', 0, 0, 'user', NULL, NULL, '2023-06-25 05:38:37', '2023-06-25 05:38:56', 1),
(33, 'Best Affix', NULL, 'bestaffix@gmail.com', NULL, NULL, 'google', 1, 1, 'Male', '14-20', 0, 1, 'user', NULL, NULL, '2023-06-26 07:34:12', '2023-06-26 07:35:41', 5),
(34, 'Mohan Chand', NULL, 'mohanchand6988@gmail.com', NULL, NULL, 'google', 1, 1, 'Male', '21-35', 0, 0, 'user', NULL, NULL, '2023-06-26 07:40:36', '2023-06-26 07:41:19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_topics`
--

CREATE TABLE `user_topics` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_topics`
--

INSERT INTO `user_topics` (`createdAt`, `updatedAt`, `userId`, `topicId`) VALUES
('2023-06-12 07:46:18', '2023-06-12 07:46:18', 4, 1),
('2023-06-09 04:50:13', '2023-06-09 04:50:13', 4, 2),
('2023-06-09 04:50:13', '2023-06-09 04:50:13', 4, 4),
('2023-03-12 06:30:08', '2023-03-12 06:30:08', 4, 6),
('2023-03-18 13:25:30', '2023-03-18 13:25:30', 4, 8),
('2023-03-19 06:25:37', '2023-03-19 06:25:37', 4, 10),
('2023-03-19 06:25:38', '2023-03-19 06:25:38', 4, 11),
('2023-03-18 13:25:35', '2023-03-18 13:25:35', 4, 13),
('2023-03-19 06:25:39', '2023-03-19 06:25:39', 4, 14),
('2023-06-25 10:44:59', '2023-06-25 10:44:59', 31, 1),
('2023-06-25 10:44:59', '2023-06-25 10:44:59', 31, 2),
('2023-06-25 05:39:00', '2023-06-25 05:39:00', 31, 4),
('2023-06-25 05:39:02', '2023-06-25 05:39:02', 31, 8),
('2023-06-25 05:39:05', '2023-06-25 05:39:05', 31, 13),
('2023-06-26 07:35:45', '2023-06-26 07:35:45', 33, 1),
('2023-06-26 07:37:30', '2023-06-26 07:37:30', 33, 2),
('2023-06-26 07:35:48', '2023-06-26 07:35:48', 33, 4),
('2023-06-26 07:35:48', '2023-06-26 07:35:48', 33, 6),
('2023-06-26 07:35:55', '2023-06-26 07:35:55', 33, 8),
('2023-06-26 07:35:57', '2023-06-26 07:35:57', 33, 10),
('2023-06-26 07:36:00', '2023-06-26 07:36:00', 33, 13),
('2023-06-26 07:41:26', '2023-06-26 07:41:26', 34, 1),
('2023-06-26 07:41:26', '2023-06-26 07:41:26', 34, 2),
('2023-06-26 07:41:27', '2023-06-26 07:41:27', 34, 4),
('2023-06-26 07:41:27', '2023-06-26 07:41:27', 34, 6),
('2023-06-26 07:41:28', '2023-06-26 07:41:28', 34, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `newsId` (`newsId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_occupation`
--
ALTER TABLE `news_occupation`
  ADD PRIMARY KEY (`newsId`,`occupationId`),
  ADD KEY `occupationId` (`occupationId`);

--
-- Indexes for table `news_topic`
--
ALTER TABLE `news_topic`
  ADD PRIMARY KEY (`newsId`,`topicId`),
  ADD KEY `topicId` (`topicId`);

--
-- Indexes for table `news_topics`
--
ALTER TABLE `news_topics`
  ADD PRIMARY KEY (`newsId`,`topicId`),
  ADD KEY `topicId` (`topicId`);

--
-- Indexes for table `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occupationId` (`occupationId`);

--
-- Indexes for table `user_topics`
--
ALTER TABLE `user_topics`
  ADD PRIMARY KEY (`userId`,`topicId`),
  ADD KEY `topicId` (`topicId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `occupations`
--
ALTER TABLE `occupations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `news_occupation`
--
ALTER TABLE `news_occupation`
  ADD CONSTRAINT `news_occupation_ibfk_1` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_occupation_ibfk_2` FOREIGN KEY (`occupationId`) REFERENCES `occupations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_topic`
--
ALTER TABLE `news_topic`
  ADD CONSTRAINT `news_topic_ibfk_1` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_topic_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_topics`
--
ALTER TABLE `news_topics`
  ADD CONSTRAINT `news_topics_ibfk_1` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_topics_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`occupationId`) REFERENCES `occupations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_topics`
--
ALTER TABLE `user_topics`
  ADD CONSTRAINT `user_topics_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_topics_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
