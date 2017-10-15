-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 15 2017 г., 18:26
-- Версия сервера: 5.7.16
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookShop`
--
CREATE DATABASE IF NOT EXISTS `bookShop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bookShop`;

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`author_id`, `author_name`) VALUES
(1, 'Gosha'),
(3, 'Толстой'),
(4, 'Антонов'),
(5, 'RRR');

-- --------------------------------------------------------

--
-- Структура таблицы `author_book`
--

DROP TABLE IF EXISTS `author_book`;
CREATE TABLE IF NOT EXISTS `author_book` (
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  KEY `author_id` (`author_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author_book`
--

INSERT INTO `author_book` (`author_id`, `book_id`) VALUES
(4, 10),
(1, 13),
(3, 13),
(3, 11),
(4, 11),
(3, 0),
(5, 0),
(3, 2),
(4, 2),
(3, 14),
(4, 14),
(3, 15),
(4, 15),
(4, 16),
(3, 17),
(4, 17),
(3, 18),
(4, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) NOT NULL,
  `book_description` tinytext,
  `book_price` float(8,2) NOT NULL,
  `book_discount_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `book_description`, `book_price`, `book_discount_id`) VALUES
(2, 'rott', 'chot in good!', 321.00, 0),
(10, 'монстры', '2017 год', 120.00, 0),
(11, 'wwwddd', 'qazwsxedc', 123.00, 8),
(13, 'ZZZZZ', 'ssss', 123.00, 9),
(14, 'eee', 'rrrr', 123.00, 0),
(15, 'eee', 'rrrr', 123.00, 0),
(16, 'eee', 'rrrr', 123.00, 0),
(17, 'FFF', 'GGG', 123.00, 0),
(18, 'FFF', 'GGG', 123.00, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `book_order`
--

DROP TABLE IF EXISTS `book_order`;
CREATE TABLE IF NOT EXISTS `book_order` (
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `book_id` (`book_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `clients_id` int(11) NOT NULL AUTO_INCREMENT,
  `clients_name` varchar(255) NOT NULL,
  `clients_email` varchar(255) NOT NULL,
  `clients_phone` int(11) NOT NULL,
  `clients_discount_id` int(11) NOT NULL,
  PRIMARY KEY (`clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(255) NOT NULL,
  `discount_tax` int(11) NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discount`
--

INSERT INTO `discount` (`discount_id`, `discount_name`, `discount_tax`, `discount_type`) VALUES
(8, 'magento1111', 12, 2),
(9, 'sale', 20, 1),
(10, 'уценка', 5, 2),
(11, 'просрочка', 20, 1),
(12, 'qqq', 10, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(16, 'комедия'),
(18, 'фантастика'),
(23, 'роман');

-- --------------------------------------------------------

--
-- Структура таблицы `genre_book`
--

DROP TABLE IF EXISTS `genre_book`;
CREATE TABLE IF NOT EXISTS `genre_book` (
  `genre_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  KEY `genre_id` (`genre_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre_book`
--

INSERT INTO `genre_book` (`genre_id`, `book_id`) VALUES
(18, 10),
(18, 11),
(16, 15),
(18, 15),
(23, 16),
(18, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_data` datetime NOT NULL,
  `order_client_id` int(11) NOT NULL,
  `order_cost` float(8,2) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
